require File.expand_path '../../spec_helper.rb', __FILE__
require_relative '../../all_devices.rb'
require_relative '../../find_device.rb'
require_relative '../../homepage.rb'

describe Routes do

  it 'should be able to show the homepage' do
    get '/'
      expect(last_response).to be_ok
  end

  it 'should show the correct homepage content' do
    get '/'
      @home = Homepage.new
      expect(@home.show_homepage_content).to eq('Welcome to the Devices API')
  end

  it 'should show all of the devices at the correct url' do
    get '/devices'
      @devices = AllDevices.new('mini-schema.xml')
      expect(@devices.all_devices).not_to be_nil
  end

  it 'should show all of the devices at the correct url' do
    get '/devices'
      @devices = AllDevices.new('mini-schema.xml')
      expect(@devices.all_devices.class).to eq(String)
  end

end
