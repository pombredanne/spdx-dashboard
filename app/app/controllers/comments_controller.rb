class CommentsController < ApplicationController

  def create
    if params[:package_id].present?
      @owner = Package.find(params[:package_id])
    elsif params[:spdx_doc_id].present?
      @owner = SpdxDoc.find(params[:spdx_doc_id])
    elsif params[:package_file_id].present?
      @owner = PackageFile.find(params[:package_file_id])
    end

    @comment = Comment.new(params[:comment])

    @comment.owner = @owner

    respond_to do |format|
      redirect = @owner.class == "SpdxDoc" ? @owner : @owner.spdx_doc
      if @comment.save
        format.html { redirect_to redirect, notice: 'Your comment was added successfully.' }
        format.json { render json: @comment, status: :created, location: redirect }
      else
        format.html { redirect_to redirect }
        format.json { render json: @comment, status: :unprocessable_entity }
      end
    end
  end
end
