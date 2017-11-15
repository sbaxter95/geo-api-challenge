require File.expand_path '../../spec_helper.rb', __FILE__
require_relative '../../all_devices.rb'
require_relative '../../find_device.rb'
require_relative '../../homepage.rb'

describe Routes do

  before(:all) do
    @api = Routes.new
  end

  it 'should be able to show the homepage' do
    get '/'
      expect(last_response).to be_ok
  end

  it 'should show the correct homepage content' do
    get '/'
      @home = Homepage.new
      puts @home.show_homepage_content
  end

end
