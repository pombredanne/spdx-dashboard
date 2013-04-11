class Licensing < ActiveRecord::Base
  attr_accessible :conjunctive, :package_file_id, :license_id, :official

  belongs_to :license
  belongs_to :package_file
end
