class SpdxDoc < ActiveRecord::Base
  attr_accessible :comment_id, :spec_version, :upload

  has_one :package
  has_many :optional_fields, as: :owner
  has_many :comments, as: :owner
  has_many :license_refs
  has_many :licenses, through: :license_refs
  has_attached_file :upload

  validates_attachment :upload, presence: true,
  content_type: { content_type: "application/octet-stream" }

  # Friendly name methods
  def name
    upload_file_name
  end

  def version
    return "n/a" unless spec_version.present?
    spec_version
  end

  def ensure_encoding(line)
    require 'iconv' unless String.method_defined?(:encode)
    if String.method_defined?(:encode)
      line.encode!('UTF-8', 'UTF-8', :invalid => :replace)
    else
      ic = Iconv.new('UTF-8', 'UTF-8//IGNORE')
      line = ic.iconv(line)
    end
    line
  end

  # Parsing and relationship methods
  def parse_tag!
    tag_file = File.open(upload.path)
    lines = File.readlines(upload.path)

    ## PARSE DOCUMENT INFO
    tag_file.each_line do |line|
      ensure_encoding(line)
      if line.match /^SPDXVersion: (.+)/
        self.spec_version = $1.delete("\r")
      end

      if line.match /^DataLicense: (.+)/
        self.data_license = $1.delete("\r")
      end

      if line.match /^DocumentComment: <text>(.+)<\/text>/
        self.document_comment = $1.delete("\r")
      end

      if line.match /^CreatorComment: <text>(.+)<\/text>/
        self.creator_comment = $1.delete("\r")
      end

      if line.match /^Created: (.+)/
        self.generated_at = $1.delete("\r").to_datetime
      end
    end
    self.save

    ## PARSE PACKAGE INFO
    package = self.build_package

    package_lines = lines.select { |line| ensure_encoding(line)[/^Package/] }
    package_lines.each do |line|
      line = ensure_encoding(line)
      if line.match /^PackageName: (.+)/
        package.name = $1.delete("\r")
      end

      if line.match /^PackageVersion: (.+)/
        package.version = $1.delete("\r")
      end

      if line.match /^PackageDownloadLocation: (.+)/
        package.download_location = $1.delete("\r")
      end

      if line.match /^PackageSummary: (.+)/
        package.summary = $1.delete("\r")
      end

      if line.match /^PackageFileName: (.+)/
        package.filename = $1.delete("\r")
      end

      if line.match /^PackageSupplier: (.+)/
        package.supplier = $1.delete("\r")
      end

      if line.match /^PackageOriginator: (.+)/
        package.originator = $1.delete("\r")
      end

      if line.match /^PackageDescription: <text>(.+)<\/text>/
        package.description = $1.delete("\r")
      end

      if line.match /^PackageCopyrightText: <text>(.+)<\/text>/
        package.copyright = $1.delete("\r")
      end
    end
    package.save

    self.reload

    ## PARSE LICENSE REFS
    lines.each_with_index do |line, index|
      line = ensure_encoding(line)
      if line.match /^LicenseID: (.+)/
        ref_name = $1.delete("\r")

        if lines[index + 1].match /^ExtractedText: <text>(.+)<\/text>/
          license_content = $1.delete("\r")
        end

        if lines[index + 2].match /^LicenseName: (.+)/
          license_name = $1.delete("\r")
        end

        license = License.create_or_find_for({ name: license_name, content: license_content })
        license.content = license_content
        license.save

        ref             = self.license_refs.build
        ref.license_id  = license.id
        ref.ref_name    = ref_name
        ref.save
      end
    end

    self.reload

    ## PARSE FILE INFO
    lines.each_with_index do |line, index|
      line = ensure_encoding(line)
      if line.match /^FileName: (.+)/
        package_file = package.files.new(name: $1.delete("\r"))

        if lines[index + 1].match /^FileType: (.+)/
          package_file.file_type = $1.delete("\r")
        end

        if lines[index + 2].match /^FileChecksum: (.+)/
          # handle checksum
        end

        if lines[index + 3].match /^LicenseConcluded: (.+)/
          license_or_ref = $1.delete("\r")

          if license_or_ref.match /^LicenseRef/
            license_ref = license_refs.find_by_ref_name(license_or_ref)
            license = license_ref.license
          else
            license = License.create_or_find_for(name: license_or_ref)
          end

          package_file.license_concluded_id = license.id
        end

        if lines[index + 4].match /^LicenseInfoInFile: (.+)/
          license_or_ref = $1.delete("\r")

          if license_or_ref.match /LicenseRef/
            license_ref = self.license_refs.find_by_ref_name(license_or_ref)
            license = license_ref.license
          else
            license = License.create_or_find_for(name: license_or_ref)
          end

          package_file.license_declared_id = license.id
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
