class SpdxDoc < ActiveRecord::Base
  attr_accessible :comment_id, :spec_version, :upload

  has_one :package
  has_many :optional_fields, as: :owner
  has_attached_file :upload

  validates_attachment :upload, presence: true,
  content_type: { content_type: "application/octet-stream" }

  # Friendly name methods
  def name
    upload_file_name
  end

  def birthday
    str_formatter = "%B %d"
    str_formatter += ", %Y" unless created_at.year == Time.current.year
    str_formatter += " - %l:%M %P"
    date = created_at.strftime(str_formatter)
  end

  def version
    return "n/a" unless spec_version.present?
    spec_version
  end

  # Parsing and relationship methods
  def parse_tag!
    tag_file = File.open(upload.path)

    # Get SPDX info
    line = tag_file.first
    if line.match /SPDXVersion: (.+)/
      puts $1
      self.spec_version = $1.delete("\r")
    end

    line = tag_file.first
    if line.match /DataLicense: (.+)/
      puts $1
      self.data_license = $1.delete("\r")
    end

    line = tag_file.first
    if line.match /DocumentComment: <text>(.+)<\/text>/
      puts $1
      self.document_comment = $1.delete("\r")
    end

    # Get package information

    # Get file information

    save
  end
end
