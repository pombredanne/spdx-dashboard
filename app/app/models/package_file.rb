class PackageFile < ActiveRecord::Base
  attr_accessible :artifact_homepage, 
                  :artifact_name, 
                  :artifact_uri, 
                  :checksum_id, 
                  :copyright_text, 
                  :copyright_text, 
                  :license_concluded_id, 
                  :license_declared_id, 
                  :name, 
                  :package_id, 
                  :type

  belongs_to :package
  belongs_to :license_declared, class_name: "License"
  belongs_to :license_concluded, class_name: "License"
  has_one :checksum, as: :owner
  has_many :optional_fields, as: :owner
  has_many :licensings
  has_many :licenses, through: :licensings
  has_many :comments, as: :owner

  def name_without_path
    return name unless name.match /.tar\/(.+)/
    $1
  end

  def spdx_doc
    package.spdx_doc
  end
end
