require "bundler/inline"

gemfile do
  source "https://rubygems.org"
  ruby "2.6.6"

  gem "activemodel", "6.0.3.1"
end

require "active_model"
require "irb"

class Person
  include ActiveModel::Serializers::JSON

  attr_accessor :name, :age

  def attributes
    { "name" => name, "age" => age }
  end
end

IRB.start
