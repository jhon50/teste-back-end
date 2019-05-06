require 'rails_helper'
RSpec.describe RequestsController, type: :controller do

  describe 'POST create' do
    it 'enqueue a new request' do
      ActiveJob::Base.queue_adapter = :test

      expect {
        post :create, params: { request_url: '/test', uuid: '1231241-asdasd-2344' }
      }.to have_enqueued_job(RequestJob)
    end
  end
end
