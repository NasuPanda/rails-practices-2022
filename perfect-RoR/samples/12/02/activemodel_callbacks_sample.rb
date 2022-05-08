require "bundler/inline"

gemfile do
  source "https://rubygems.org"
  ruby "2.6.6"

  gem "activemodel", "6.0.3.1"
  gem "activesupport", "6.0.3.1"
end

require "active_model"
require "active_support"
require "active_support/core_ext/time/calculations"
require "irb"

Time.zone_default = Time.find_zone!("UTC")

class Person
  extend ActiveModel::Callbacks

  attr_accessor :created_at, :updated_at

  define_model_callbacks :save

  before_save :record_timestamps

  def save
    run_callbacks :save do
      true  # saveメソッドの中身をここに記述する
    end
  end

  private

  def record_timestamps
    current_time = Time.current

    self.created_at ||= current_time
    self.updated_at = current_time
  end
end

IRB.start
