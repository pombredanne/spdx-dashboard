class Checksum < ActiveRecord::Base
  attr_accessible :algorithm, :owner_id, :owner_type, :value
  belongs_to :owner, polymorphic: true
end

# == Schema Information
#
# Table name: checksums
#
#  id         :integer          not null, primary key
#  owner_id   :integer
#  owner_type :string(255)
#  algorithm  :string(255)
#  value      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

