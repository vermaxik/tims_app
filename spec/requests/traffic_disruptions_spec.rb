require 'rails_helper'

RSpec.describe 'TrafficDisruption API', type: :request do

  let!(:traffic_disruption) { create_list(:traffic_disruption, 5) }

  # Test suite for GET /api/v1/disruptions.json
  describe 'GET /api/v1/disruptions.json' do

    before { get '/api/v1/disruptions.json' }

    it 'returns traffic_disruptions' do
      expect(json).not_to be_empty
      expect(json.size).to eq(5)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end

    it 'json contains needed keys' do
      expect(json[0].keys).to eq(["id", "event_start_at", "coordinates", "comments"])
    end
  end

end
