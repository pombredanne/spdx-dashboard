class LicenseRef < ActiveRecord::Base
  attr_accessible :license_id, :spdx_id

  belongs_to :spdx_doc
  belongs_to :license
end
