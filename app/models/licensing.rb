class Licensing < ActiveRecord::Base
  attr_accessible :conjunctive, :package_file_id, :license_id, :official

  belongs_to :license
  belongs_to :package_file
end

# == Schema Information
#
# Table name: licensings
#
#  id              :integer          not null, primary key
#  license_id      :integer
#  package_file_id :integer
#  conjunctive     :boolean
#  official        :boolean          default(FALSE)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

