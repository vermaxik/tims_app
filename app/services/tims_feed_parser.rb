class TimsFeedParser

  # Denife XML selectors with examples
  XML_FEED_URL    = Rails.configuration.tims_feed_url # TODO: create yml config
  XML_SELECTOR    = 'Disruption'       # Disruption XML array
  XML_ID          = 'id'               # 158965
  XML_STATUS      = 'status'           # Active
  XML_SEVERITY    = 'severity'         # Serious
  XML_INTEREST    = 'levelOfInterest'  # High
  XML_CATEGORy    = 'category'         # Traffic Incidents
  XML_SUBCATEGORY = 'subCategory'      # Collision
  XML_START_AT    = 'startTime'        # 2017-05-09T16:39:00Z
  XML_END_AT      = 'endTime'          # 2017-05-10T13:29:00Z
  XML_LOCATION    = 'location'         # [A40] Western Avenue (UB6) (Ealing)
  XML_COMMENTS    = 'comments'         # [A40] Western Avenue (UB6) (Westbound) at the junction of Perivale Lane - all lanes have reopened.
  XML_COORDINATES = 'CauseArea > DisplayPoint > Point > coordinatesLL'

  attr_reader :xml

  def initialize
    @xml = get_xml
  end


  # Parse XML TIMS feed
  def parse
    Rails.logger.info "TimsFeedParser#parse: Parsing started."

    xml.css(XML_SELECTOR).each do |event|

      status = event.css(XML_STATUS).text
      severity = event.css(XML_SEVERITY).text
      level_of_interest = event.css(XML_INTEREST).text
      event_end_at = event.css(XML_END_AT).text
      event_end_at = event_end_at.empty? ? nil : event_end_at

      disruption = TrafficDisruption.find_or_create_by(disruption_id: event[XML_ID]) do |td|
        td.status = status
        td.severity = severity
        td.level_of_interest = level_of_interest
        td.category = event.css(XML_CATEGORy).text
        td.subcategory = event.css(XML_SUBCATEGORY).text
        td.event_start_at = event.css(XML_START_AT).text
        td.event_end_at = event_end_at
        td.location = event.css(XML_LOCATION).text
        td.comments = event.css(XML_COMMENTS).text
        td.longitude = coordinates(event.css(XML_COORDINATES).text)[0]
        td.latitude = coordinates(event.css(XML_COORDINATES).text)[1]
      end

      # This fields probably could be updated - let's check it.
      ['status', 'severity', 'level_of_interest', 'event_end_at'].each do |column|
        check_update_field(disruption, column, eval(column))
      end
    end

    Rails.logger.info "TimsFeedParser#parse: Parsing finished."
  end

  private
    # Download XML for parsing
    def get_xml
      begin
        response = HTTParty.get(XML_FEED_URL)
        Nokogiri::XML(response.body);
      rescue
        Rails.logger.fatal "TimsFeedParser#get_xml: Open file failed"
      end
    end

    # Split coordinates from string to float array
    def coordinates(str)
      longitude, latitude = str.split(",")
      [longitude.to_f, latitude.to_f]
    end

    # Dynamic method for updating column if data has changed
    def check_update_field(record, column, value)
      record.update_column(column.to_sym, value) if record.send(column) != value
    end

end
