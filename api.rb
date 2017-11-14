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
  end

  #Display notes for single device
  get '/devices/:device' do
    content_type 'text/xml'
  end

end
