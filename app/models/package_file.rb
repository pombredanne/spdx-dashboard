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
  has_many :optional_fields, as: :owner
  has_many :licensings
  has_many :licenses, through: :licensings
  has_many :comments, as: :owner

  after_create :determine_relative_path

  def name_without_path
    return name unless name.match /.tar\/(.+)/
    $1
  end

  def name_without_package
    parts = name.split("/")
    parts.delete_if { |part| part.include?(self.package.simple_name) || part == "." }
    parts.join("/")
  end

  def spdx_doc
    package.spdx_doc
  end

  private
  def determine_relative_path
    self.relative_path = self.name_without_package
    save
  end
end

# == Schema Information
#
# Table name: package_files
#
#  id                   :integer          not null, primary key
#  package_id           :integer
#  name                 :string(255)
#  file_type            :string(255)
#  copyright_text       :string(255)
#  artifact_name        :string(255)
#  artifact_homepage    :string(255)
#  artifact_uri         :string(255)
#  license_concluded_id :string(255)
#  license_declared_id  :string(255)
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  checksum             :string(255)
#  checksum_algorithm   :string(255)
#  relative_path        :string(255)
#

