require 'rack/test'
require 'rspec'

require File.expand_path '../../api.rb', __FILE__

module RSpecMixin
  include Rack::Test::Methods
  def app() APIApp end
end

RSpec.configure do |config|
  config.include RSpecMixin
  config.formatter = :documentation
end
