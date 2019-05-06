require 'rails_helper'
RSpec.describe LeadJob, type: :job do

  let(:create_lead) { LeadJob.new.perform({name: 'John', email: 'johndoe@gmail.com'}) }

  it 'creates a new lead that was previously enqueued' do
    expect { create_lead }.to change { Lead.count }.by(1)
  end

  it 'does not create a duplicated lead with same email' do
    expect { 2.times { create_lead } }.to change { Lead.count }.by(1)
  end
end
