require "bundler/inline"

gemfile do
  source "https://rubygems.org"
  ruby "2.6.6"

  gem "activerecord", "6.0.3.1"
  gem "sqlite3", "~> 1.4"
end

require "active_record"
require "active_support/concern"
require "irb"

ActiveRecord::Migration.verbose = false
ActiveRecord::Base.establish_connection(
  adapter: "sqlite3",
  database: ":memory:",
)

ActiveRecord::Schema.define(version: 0) do
  create_table "recording_cancellations", force: :cascade do |t|
    t.integer "recording_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["recording_id"], name: "index_recording_cancellations_on_recording_id"
  end

  create_table "recordings", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "recording_cancellations", "recordings"
end

class RecordingCancellation < ActiveRecord::Base
  belongs_to :recording
end

module Cancelable
  extend ActiveSupport::Concern

  included do
    has_one :cancellation, class_name: "#{name}Cancellation"
  end
end

class Recording < ActiveRecord::Base
  include Cancelable
end

begin
  IRB.start
ensure
  ActiveRecord::Base.connection.disconnect!
end
