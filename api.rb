require_relative 'spec/spec_helper'
require 'sinatra/base'
require 'nokogiri'

class APIApp < Sinatra::Base

  #Display homepage to the api
  get '/' do
    'Welcome to the Devices API'
  end

  #Display all devices
  get '/devices' do
    content_type 'text/xml'
    doc = File.read("mini-schema.xml")
    return doc
  end

  #Display notes for single device
  get '/devices/:device' do
    content_type 'text/xml'
    name = params['device']
    doc = Nokogiri::XML(File.read("mini-schema.xml"))
    doc.at("name:contains('#{name}')").parent.to_xml
    doc.at("notes")
  end

end
