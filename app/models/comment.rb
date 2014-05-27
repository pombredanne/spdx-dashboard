class Comment < ActiveRecord::Base
  attr_accessible :content, :creator_id, :owner_id, :owner_type

  belongs_to :owner, polymorphic: true
end

# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  owner_id   :integer
#  owner_type :string(255)
#  content    :text
#  creator_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

