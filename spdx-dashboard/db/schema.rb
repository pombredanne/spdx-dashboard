# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130306063422) do

  create_table "checksums", :force => true do |t|
    t.integer  "owner_id"
    t.string   "owner_type"
    t.string   "algorithm"
    t.string   "value"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "licenses", :force => true do |t|
    t.text     "content"
    t.text     "notice"
    t.string   "name"
    t.boolean  "osi_approved"
    t.text     "standard_header"
    t.string   "cross_reference"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "package_files", :force => true do |t|
    t.integer  "package_id"
    t.string   "name"
    t.string   "type"
    t.string   "copyright_text"
    t.string   "artifact_name"
    t.string   "artifact_homepage"
    t.string   "artifact_uri"
    t.string   "license_concluded_id"
    t.string   "license_declared_id"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  create_table "packages", :force => true do |t|
    t.integer  "spdx_doc_id"
    t.string   "name"
    t.string   "filename"
    t.string   "download_location"
    t.integer  "checksum_id"
    t.text     "copyright"
    t.string   "version"
    t.text     "description"
    t.text     "summary"
    t.string   "originator"
    t.string   "supplier"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "spdx_docs", :force => true do |t|
    t.string   "spec_version"
    t.string   "data_license"
    t.integer  "comment_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

end
