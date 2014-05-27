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

# == Schema Information
#
# Table name: licenses
#
#  id              :integer          not null, primary key
#  content         :text
#  notice          :text
#  name            :string(255)
#  osi_approved    :boolean
#  standard_header :text
#  cross_reference :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

