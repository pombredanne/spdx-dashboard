class SpdxDoc < ActiveRecord::Base
  attr_accessible :comment_id, :spec_version, :upload

  has_one :package
  has_many :optional_fields, as: :owner
  has_attached_file :upload

  validates_attachment :upload, presence: true,
  content_type: { content_type: "application/octet-stream" }

  def name
    upload_file_name
  end

  def birthday
    str_formatter = "%B %d"
    str_formatter += ", %Y" unless created_at.year == Time.current.year
    str_formatter += " - %l:%M %P"
    date = created_at.strftime(str_formatter)
  end
end
