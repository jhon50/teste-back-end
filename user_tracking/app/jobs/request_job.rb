class RequestJob < ApplicationJob
  queue_as :default

  def perform(*args)
    Request.create!(args)
  end
end
