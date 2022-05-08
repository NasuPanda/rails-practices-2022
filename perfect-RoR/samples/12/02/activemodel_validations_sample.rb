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

  attr_accessor :name, :age

  validates :name, presence: true, length: { maximum: 100 }
  validates_numericality_of :age, greater_than_or_equal_to: 0
end

IRB.start
