class LicensesController < ApplicationController

  def show
    @license = License.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @license }
    end
  end
end
