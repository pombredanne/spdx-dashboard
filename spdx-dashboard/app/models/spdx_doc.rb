class SpdxDoc < ActiveRecord::Base
  attr_accessible :comment_id, :spec_version
  has_one :package
end
