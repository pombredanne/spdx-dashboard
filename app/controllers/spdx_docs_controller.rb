class SpdxDocsController < ApplicationController
  def index
    @spdx_docs = SpdxDoc.scoped.order('created_at DESC')
    @spdx_doc = SpdxDoc.new

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @spdx_docs }
    end
  end

  def show
    @spdx_doc = SpdxDoc.find(params[:id])
    @spdx_comment = @spdx_doc.comments.new
    @package = @spdx_doc.package
    @package_comment = @package.comments.new

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @spdx_doc }
    end
  end

  def new
    @spdx_doc = SpdxDoc.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @spdx_doc }
    end
  end

  def edit
    @spdx_doc = SpdxDoc.find(params[:id])
  end

  def create
    @spdx_doc = SpdxDoc.new(params[:spdx_doc])

    respond_to do |format|
      if @spdx_doc.save
        @spdx_doc.parse_tag!
        format.html { redirect_to @spdx_doc, notice: 'Spdx doc was successfully created.' }
        format.json { render json: @spdx_doc, status: :created, location: @spdx_doc }
      else
        format.html { render action: "new" }
        format.json { render json: @spdx_doc.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @spdx_doc = SpdxDoc.find(params[:id])

    respond_to do |format|
      if @spdx_doc.update_attributes(params[:spdx_doc])
        format.html { redirect_to @spdx_doc, notice: 'Spdx doc was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @spdx_doc.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @spdx_doc = SpdxDoc.find(params[:id])
    @spdx_doc.destroy

    respond_to do |format|
      format.html { redirect_to spdx_docs_url }
      format.json { head :no_content }
    end
  end

  ## NON RESTful routes
  ############################################################

  def files
    @spdx_doc = SpdxDoc.find(params[:id])
    @package = @spdx_doc.package
    @files = @package.files

    respond_to do |format|
      format.html
      format.json { render json: @files }
    end
  end

  def compare
    @original_spdx = SpdxDoc.find(params[:id])
  end
end
