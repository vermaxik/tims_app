class TrafficDisruption < ApplicationRecord
  enum status: ['Active', 'Active Long Term', 'Scheduled',
                'Recurring Works', 'Recently Cleared']

  enum severity: ['Minimal', 'Moderate', 'Serious', 'Severe']

  enum level_of_interest: ['High', 'Medium', 'Low']

  validates :disruption_id, :status, :severity, :level_of_interest,
            :category, :subcategory, :event_start_at, :location,
            :longitude, :latitude, presence: true
  validates :disruption_id, uniqueness: true
end
