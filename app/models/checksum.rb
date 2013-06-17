class Checksum < ActiveRecord::Base
  attr_accessible :algorithm, :owner_id, :owner_type, :value
  belongs_to :owner, polymorphic: true

  def self.of_type type 
    where(owner_type: type.to_s.capitalize)
  end
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

