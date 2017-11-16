require_relative 'spec/spec_helper'
require_relative 'lib/all_devices.rb'
require_relative 'lib/find_device.rb'
require_relative 'lib/homepage.rb'
require_relative 'lib/search_by_value.rb'
require_relative 'lib/random_device.rb'
require_relative 'lib/single_device.rb'
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

  get '/devices/random' do
    RandomDevice.new('mini-schema.xml').random_device
  end

  get '/devices/value/:value' do
    SearchValue.new('mini-schema.xml').find_by_value(params[:value])
  end

  get '/devices/single/:name' do
    SingleDevice.new('mini-schema.xml').single_device(params[:name])
  end

  #Display notes for single device
  get '/devices/:device' do
    FindDevice.new('mini-schema.xml').find_device(params[:device])
  end

end
