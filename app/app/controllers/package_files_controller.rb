class PackageFilesController < ApplicationController
  def show
    @spdx_doc = SpdxDoc.find(params[:spdx_doc_id])
    @file = @spdx_doc.package.files.find(params[:id])
  end
end
