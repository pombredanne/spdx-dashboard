class PackagesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from ArgumentError, with: :bad_request

  def find
    params[:checksum] || raise(ArgumentError)

    checksum = Checksum.of_type(:package).find_by_value(params[:checksum])
    checksum || raise(ActiveRecord::RecordNotFound)

    @package = checksum.owner 

    render json: @package
  end

  private
  def bad_request(error)
    render json: {response_type: "ERROR", response_code: 400, message: "Missing required attribute"}, status: 400
  end

  def record_not_found(error)
    render json: {response_type: "ERROR", response_code: 404, message: "Package not found"}, status: :not_found
  end
end
