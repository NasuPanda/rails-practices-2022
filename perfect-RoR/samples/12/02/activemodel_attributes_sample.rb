require "bundler/inline"

gemfile do
  source "https://rubygems.org"
  ruby "2.6.6"

  gem "activemodel", "6.0.3.1"
end

require "active_model"
require "irb"

class Person
  include ActiveModel::Attributes

  attribute :name, :string
  attribute :age, :integer
end

IRB.start
