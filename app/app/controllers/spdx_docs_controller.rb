class SpdxDocsController < ApplicationController
  # GET /spdx_docs
  # GET /spdx_docs.json
  def index
    @spdx_docs = SpdxDoc.all
    @spdx_doc = SpdxDoc.new

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @spdx_docs }
    end
  end

  # GET /spdx_docs/1
  # GET /spdx_docs/1.json
  def show
    @spdx_doc = SpdxDoc.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @spdx_doc }
    end
  end

  # GET /spdx_docs/new
  # GET /spdx_docs/new.json
  def new
    @spdx_doc = SpdxDoc.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @spdx_doc }
    end
  end

  # GET /spdx_docs/1/edit
  def edit
    @spdx_doc = SpdxDoc.find(params[:id])
  end

  # POST /spdx_docs
  # POST /spdx_docs.json
  def create
    @spdx_doc = SpdxDoc.new(params[:spdx_doc])

    respond_to do |format|
      if @spdx_doc.save
        format.html { redirect_to @spdx_doc, notice: 'Spdx doc was successfully created.' }
        format.json { render json: @spdx_doc, status: :created, location: @spdx_doc }
      else
        format.html { render action: "new" }
        format.json { render json: @spdx_doc.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /spdx_docs/1
  # PUT /spdx_docs/1.json
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

  # DELETE /spdx_docs/1
  # DELETE /spdx_docs/1.json
  def destroy
    @spdx_doc = SpdxDoc.find(params[:id])
    @spdx_doc.destroy

    respond_to do |format|
      format.html { redirect_to spdx_docs_url }
      format.json { head :no_content }
    end
  end
end
