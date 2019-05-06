class LeadsController < ApplicationController

  # As we are using async processing, we will return any message to user
  # because we can't guarantee that the lead will be created instantly,
  # depending on queue size. ACID is not completely necessary when capturing leads.
  def create
    LeadJob.perform_later(lead_params)
  end

  private

  def lead_params
    params.permit(:name, :email).to_h
  end
end