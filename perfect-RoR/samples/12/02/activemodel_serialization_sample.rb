require "bundler/inline"

gemfile do
  source "https://rubygems.org"
  ruby "2.6.6"

  gem "activemodel", "6.0.3.1"
  gem "activesupport", "6.0.3.1"
  gem "builder"
end

require "active_model"
require "active_support"
require "active_support/core_ext/hash/conversions"
require "builder"
require "irb"

class Person
  include ActiveModel::Serialization

  attr_accessor :name, :age

  def attributes
    { "name" => name, "age" => age }
  end

  def to_xml(options = nil)
    serializable_hash(options).to_xml(camelize: :lower, root: self.class.name)
  end
end

IRB.start
