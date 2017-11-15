require 'nokogiri'
require 'json'
require 'active_support'
require 'active_support/core_ext'

class AllDevices

  def initialize(file)
		@doc = Nokogiri::XML(File.open(file))
		parsed = @doc.to_s
		json = Hash.from_xml(parsed)
		@name_array = json['document']['devices']['device']
	end

  def all_devices
    return @name_array.to_json
  end

end
