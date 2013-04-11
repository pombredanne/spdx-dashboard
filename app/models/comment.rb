class Comment < ActiveRecord::Base
  attr_accessible :content, :creator_id, :owner_id, :owner_type

  belongs_to :owner, polymorphic: true
end
