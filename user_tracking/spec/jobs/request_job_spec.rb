require 'rails_helper'
RSpec.describe RequestJob, type: :job do

  let(:create_request) { RequestJob.new.perform({request_url: 'asdasd', uuid: '1231241-asdas-434'}) }

  it 'creates a new request that was previously enqueued' do
    expect { create_request }.to change { Request.count }.by(1)
  end
end
