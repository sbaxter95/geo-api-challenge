require 'rack/test'
require 'rspec'

require File.expand_path '../../routes.rb', __FILE__

module RSpecMixin
  include Rack::Test::Methods
  def app() Routes end
end

RSpec.configure do |config|
  config.include RSpecMixin
  config.formatter = :documentation
end
