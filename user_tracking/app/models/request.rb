class Request < ApplicationRecord
  validates_presence_of :request_url
  validates_presence_of :uuid

  def page_accessed
    request_url.split('/').last
  end
end
