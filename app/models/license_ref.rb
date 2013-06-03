class LicenseRef < ActiveRecord::Base
  attr_accessible :license_id, :spdx_id

  belongs_to :spdx_doc
  belongs_to :license
end

# == Schema Information
#
# Table name: license_refs
#
#  id          :integer          not null, primary key
#  license_id  :integer
#  spdx_doc_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  ref_name    :string(255)
#

