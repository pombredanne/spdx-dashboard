class SpdxDoc < ActiveRecord::Base
  attr_accessible :comment_id, :spec_version, :upload

  has_one :package
  has_many :optional_fields, as: :owner
  has_attached_file :upload

  validates_attachment :upload, presence: true,
  content_type: { content_type: "text/plain" }
end
