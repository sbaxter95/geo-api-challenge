require_relative 'spec/spec_helper'
require_relative 'lib/all_devices.rb'
require_relative 'lib/find_device.rb'
require_relative 'lib/homepage.rb'
require 'sinatra/base'
require 'nokogiri'
require 'active_support'
require 'active_support/core_ext'

class Routes < Sinatra::Base

  before do
		content_type 'application/json'
	end

  #Display homepage to the api
  get '/' do
    Homepage.new.show_homepage_content
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
