require_relative 'spec/spec_helper'
require 'sinatra/base'
require 'nokogiri'

class APIApp < Sinatra::Base

  def initialize(file)
		@doc = Nokogiri::XML(File.open(file))
		parsed = @doc.to_s
		json = Hash.from_xml(parsed)
		@name_array = json['document']['devices']['device']
	end

  #Display homepage to the api
  get '/' do
    'Welcome to the Devices API'
  end

  #Display all devices
  get '/devices' do
    content_type 'application/json'
    doc = File.read("mini-schema.xml")
    return doc
  end

  #Display notes for single device
  get '/devices/:device' do
    content_type 'application/json'
    name = params['device']
    doc = Nokogiri::XML(File.read("mini-schema.xml"))
    parsed = doc.at("name:contains('#{name}')").parent.to_xml
    # doc.xpath('//notes')
    # string = doc.to_s
    # puts string.split
  end

end
