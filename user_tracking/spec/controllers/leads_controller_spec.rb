require 'rails_helper'
RSpec.describe LeadsController, type: :controller do

  describe 'POST create' do
    it 'enqueue a new lead' do
      ActiveJob::Base.queue_adapter = :test

      expect {
        post :create, params: { name: 'John Doe', email: 'johndoe@gmail.com' }
      }.to have_enqueued_job(LeadJob)
    end
  end
end
