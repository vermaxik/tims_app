require 'rails_helper'

# Actually I don't do such of test for model, this is only for test
RSpec.describe TrafficDisruption, type: :model do

  it { should validate_presence_of(:disruption_id) }
  it { should validate_presence_of(:status) }
  it { should validate_presence_of(:severity) }
  it { should validate_presence_of(:level_of_interest) }
  it { should validate_presence_of(:category) }
  it { should validate_presence_of(:subcategory) }
  it { should validate_presence_of(:event_start_at) }
  it { should validate_presence_of(:location) }
  it { should validate_presence_of(:longitude) }
  it { should validate_presence_of(:latitude) }

end
