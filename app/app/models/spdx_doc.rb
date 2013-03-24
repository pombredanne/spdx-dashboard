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
    lines = File.readlines(upload.path)

    ## PARSE DOCUMENT INFO
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

    ## PARSE PACKAGE INFO
    package = self.build_package

    package_lines = lines.select { |line| line[/^Package/] }
    package_lines.each do |line|
      if line.match /PackageName: (.+)/
        package.name = $1.delete("\r")
      end

      if line.match /PackageVersion: (.+)/
        package.version = $1.delete("\r")
      end

      if line.match /PackageDownloadLocation: (.+)/
        package.download_location = $1.delete("\r")
      end

      if line.match /PackageSummary: (.+)/
        package.summary = $1.delete("\r")
      end

      if line.match /PackageFileName: (.+)/
        package.filename = $1.delete("\r")
      end

      if line.match /PackageSupplier: (.+)/
        package.supplier = $1.delete("\r")
      end

      if line.match /PackageOriginator: (.+)/
        package.originator = $1.delete("\r")
      end

      if line.match /PackageDescription: <text>(.+)<\/text>/
        package.description = $1.delete("\r")
      end

      if line.match /PackageCopyrightText: <text>(.+)<\/text>/
        package.copyright = $1.delete("\r")
      end
    end
    package.save

    ## PARSE FILE INFO
    lines.each_with_index do |line, index|
      if line.match /^FileName: (.+)/
        package_file = package.files.new(name: $1.delete("\r"))

        if lines[index + 1].match /^FileType: (.+)/
          package_file.file_type = $1.delete("\r")
        end

        if lines[index + 2].match /^FileChecksum: (.+)/
          # handle checksum
        end

        if lines[index + 3].match /^LicenseConcluded: (.+)/
          # handle license concluded
        end

        if lines[index + 4].match /^LicenseInfoInFile: (.+)/
          # handle license delcared
        end

        if lines[index + 5].match /^FileCopyrightText: <text>(.+)<\/text>/
          package_file.copyright_text = $1.delete("\r");
        end

        package_file.save
      end
    end

    save
  end
end
