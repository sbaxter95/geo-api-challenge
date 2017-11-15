require 'rack/test'
require 'rspec'
require_relative '../lib/routes.rb'

# require File.expand_path './lib/routes.rb', __FILE__

module RSpecMixin
  include Rack::Test::Methods
  def app() Routes end
end

RSpec.configure do |config|
  config.include RSpecMixin
  config.formatter = :documentation
end
