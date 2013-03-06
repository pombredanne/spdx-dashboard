class OptionalField < ActiveRecord::Base
  attr_accessible :field_data, :field_name, :owner_id, :owner_type

  belongs_to :owner, polymorphic: true
end
