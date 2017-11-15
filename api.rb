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
    FindDevice.new('mini-schema.xml').find_device(params[:device])
  end

end
