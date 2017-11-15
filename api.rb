require_relative 'spec/spec_helper'
require 'sinatra/base'
require 'nokogiri'
require 'active_support'
require 'active_support/core_ext'

class APIApp < Sinatra::Base

  #Display homepage to the api
  get '/' do
    content_type 'application/json'
    'Welcome to the Devices API'
  end

  #Display all devices
  get '/devices' do
    content_type 'application/json'
    @doc = Nokogiri::XML(File.open('mini-schema.xml'))
		parsed = @doc.to_s
		json = Hash.from_xml(parsed)
		@name_array = json['document']['devices']['device']
    return @name_array.to_json
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
