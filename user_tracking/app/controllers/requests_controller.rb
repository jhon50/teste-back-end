class RequestsController < ApplicationController

  def index
    @requests = Request.last(50).reverse
  end

  def create
    RequestJob.perform_later(request_params)
  end

  private

  def request_params
    params.permit(:request_url, :uuid).to_h
  end
end