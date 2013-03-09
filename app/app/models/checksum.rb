class Checksum < ActiveRecord::Base
  attr_accessible :algorithm, :owner_id, :owner_type, :value
  belongs_to :owner, polymorphic: true
end
