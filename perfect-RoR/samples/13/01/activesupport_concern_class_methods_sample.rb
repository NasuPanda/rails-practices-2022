require "bundler/inline"

gemfile do
  source "https://rubygems.org"
  ruby "2.6.6"

  gem "activesupport", "6.0.3.1"
end

require "active_support/concern"
require "irb"

module Foo
  extend ActiveSupport::Concern

  class_methods do
    def class_method_injected_by_foo
      puts "Class method defined in Foo"
    end
  end

  def instance_method_injected_by_foo
    puts "Instance method defined in Foo"
  end
end

IRB.start
