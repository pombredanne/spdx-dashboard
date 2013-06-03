class Package < ActiveRecord::Base
  attr_accessible(
    :checksum_id, 
    :copyright, 
    :description, 
    :download_location, 
    :filename, 
    :name, 
    :originator, 
    :spdx_doc_id, 
    :summary, 
    :supplier, 
    :version)

  belongs_to :spdx_doc
  has_one :checksum, as: :owner
  has_many :optional_fields, as: :owner
  has_many :files, class_name: "PackageFile"
  has_many :comments, as: :owner

  def simple_name
    name.split(".tar").first
  end
end

# == Schema Information
#
# Table name: packages
#
#  id                   :integer          not null, primary key
#  spdx_doc_id          :integer
#  name                 :string(255)
#  filename             :string(255)
#  download_location    :string(255)
#  checksum_id          :integer
#  copyright            :text
#  version              :string(255)
#  description          :text
#  summary              :text
#  originator           :string(255)
#  supplier             :string(255)
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  license_concluded_id :integer
#  license_declared     :string(255)
#

