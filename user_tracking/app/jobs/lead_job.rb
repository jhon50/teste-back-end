class LeadJob < ApplicationJob
  class DuplicatedEmailError < StandardError; end

  queue_as :default

  # Rescue when existing email is inserted, to avoid unnecessary retries
  # We won't be doind much about this, to increase speed
  def perform(*args)
    Lead.create!(args)
  rescue ActiveRecord::RecordInvalid
  end
end
