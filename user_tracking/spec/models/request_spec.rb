require 'rails_helper'

RSpec.describe Request, type: :model do
  it { should validate_presence_of(:request_url) }
  it { should validate_presence_of(:uuid) }
end
