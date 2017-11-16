require 'nokogiri'
require 'json'
require 'active_support'
require 'active_support/core_ext'

class SingleDevice

  def initialize(file)
    @doc = Nokogiri::XML(File.open(file))
    parsed = @doc.to_s
    json = Hash.from_xml(parsed)
    @name_array = json['document']['devices']['device']
  end

  def single_device(name)
    @name_array.each do |device|
			if device['name'] == name
				output = device.to_s
        return output
      end
		end
  end

end
