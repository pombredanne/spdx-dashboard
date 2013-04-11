class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :instantiate_objects

  private
  def instantiate_objects
    @new_spdx = SpdxDoc.new
  end
end
