require_relative 'spec/spec_helper'
require_relative 'all_devices.rb'
require_relative 'find_device.rb'
require 'sinatra/base'
require 'nokogiri'
require 'active_support'
require 'active_support/core_ext'

class APIApp < Sinatra::Base

  before do
		content_type 'application/json'
	end

  #Display homepage to the api
  get '/' do
    content_type 'application/json'
    'Welcome to the Devices API'
  end

  #Display all devices
  get '/devices' do
    AllDevices.new('mini-schema.xml').all_devices
  end

  #Display notes for single device
  get '/devices/:device' do
    content_type 'application/json'
    @doc = Nokogiri::XML(File.open('mini-schema.xml'))
		parsed = @doc.to_s
		json = Hash.from_xml(parsed)
		@name_array = json['document']['devices']['device']
    name = params['device']
    @name_array.each do |device|
			if device['name'] == name
				output = device['notes'].to_s
        return output
			end
		end
  end

end
