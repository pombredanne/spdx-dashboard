class Package < ActiveRecord::Base
  attr_accessible :checksum_id, :copyright, :description, :download_location, :filename, :name, :originator, :spdx_doc_id, :summary, :supplier, :version
  belongs_to :spdx_doc
  has_one :checksum, as: :owner
  has_many :optional_fields, as: :owner
  has_many :files, class_name: "PackageFile"
  has_many :comments, as: :owner
end
