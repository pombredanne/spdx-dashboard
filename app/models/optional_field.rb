class OptionalField < ActiveRecord::Base
  attr_accessible :field_data, :field_name, :owner_id, :owner_type

  belongs_to :owner, polymorphic: true
end

# == Schema Information
#
# Table name: optional_fields
#
#  id         :integer          not null, primary key
#  owner_id   :integer
#  owner_type :string(255)
#  field_name :string(255)
#  field_data :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

