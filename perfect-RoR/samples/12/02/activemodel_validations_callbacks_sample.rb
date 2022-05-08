require "bundler/inline"

gemfile do
  source "https://rubygems.org"
  ruby "2.6.6"

  gem "activemodel", "6.0.3.1"
end

require "active_model"
require "irb"

class Person
  include ActiveModel::Validations
  include ActiveModel::Validations::Callbacks

  attr_accessor :name

  before_validation :normalize_name, if: -> { name.present? }

  private

  def normalize_name
    self.name = name.downcase.titleize
  end
end

IRB.start
