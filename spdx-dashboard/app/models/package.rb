class Package < ActiveRecord::Base
  attr_accessible :checksum_id, :copyright, :description, :download_location, :filename, :name, :originator, :spdx_doc_id, :summary, :supplier, :version
  belongs_to :spdx_doc
  has_one :checksum, as: :owner
end
