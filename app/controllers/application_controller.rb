class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :instantiate_objects

  private
  def instantiate_objects
    @new_spdx = SpdxDoc.new
    @allow_client_uploads = Rails.configuration.allow_client_uploads
  end
end
