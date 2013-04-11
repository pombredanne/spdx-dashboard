class License < ActiveRecord::Base
  attr_accessible :content, :cross_reference, :name, :notice, :osi_approved, :standard_header
  has_many :optional_fields, as: :owner

  has_many :licensings
  has_many :package_files, through: :licensings

  has_many :license_refs
  has_many :spdx_docs, through: :license_refs

  def self.create_or_find_for(opts = {})
    license = License.where(opts).first
    license.present? ? license : License.create(opts)
  end
end
