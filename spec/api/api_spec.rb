require File.expand_path '../../spec_helper.rb', __FILE__
require_relative '../../lib/all_devices.rb'
require_relative '../../lib/find_device.rb'
require_relative '../../lib/homepage.rb'

describe Routes do

  before(:all) do
    @home = Homepage.new
		@devices = AllDevices.new('mini-schema.xml')
    @find = FindDevice.new('mini-schema.xml')
	end

  context 'homepage' do

    it 'should be able to show the homepage' do
      get '/'
        expect(last_response).to be_ok
    end

    it 'should show the correct homepage content' do
      get '/'
        expect(@home.show_homepage_content).to eq('Welcome to the Devices API')
    end


  end

  context 'all devices page' do

    it 'should show all of the devices at the correct url' do
      get '/devices'
        expect(@devices.all_devices).not_to be_nil
    end

    it 'should show all of the devices at the correct url' do
      get '/devices'
        expect(@devices.all_devices.class).to eq(String)
    end

    it 'should include the word name' do
      get '/devices'
        expect(@devices.all_devices).to include('name')
    end

    it 'should include the word value' do
      get '/devices'
        expect(@devices.all_devices).to include('value')
    end

    it 'should include the word notes' do
      get '/devices'
        expect(@devices.all_devices).to include('notes')
    end

    it 'should have a first character of [' do
      get '/devices'
        expect(@devices.all_devices[0]).to eq('[')
    end

    it 'should have a last character of ]' do
      get '/devices'
        expect(@devices.all_devices[-1]).to eq(']')
    end

    it 'should have a second character of {' do
      get '/devices'
        expect(@devices.all_devices[1]).to eq('{')
    end

    it 'should have a first character of }' do
      get '/devices'
        expect(@devices.all_devices[-2]).to eq('}')
    end

    it 'should be able to show the devices page' do
      get '/devices'
        expect(last_response).to be_ok
    end

  end

  context 'searching devices page' do

    it 'should be able to show the notes of the device' do
      get '/devices/smartplug_old_1'
        expect(last_response).to be_ok
    end

    it 'should expect the notes to exist when searching for the smartplug_old_1' do
      get '/devices/smartplug_old_1'
        expect(@find.find_device('smartplug_old_1')).not_to be_nil
    end

    it 'should expect the notes to be a string when searching for the smartplug_old_1' do
      get '/devices/smartplug_old_1'
        expect(@find.find_device('smartplug_old_1').class).to eq(String)
    end

    it 'should expect the notes to be the correct string when searching for the smartplug_old_1' do
      get '/devices/smartplug_old_1'
        expect(@find.find_device('smartplug_old_1')).to eq('Legacy Legato smartplug 1')
    end

  end

end
