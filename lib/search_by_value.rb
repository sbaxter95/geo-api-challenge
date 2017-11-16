require 'nokogiri'
require 'json'
require 'active_support'
require 'active_support/core_ext'

class SearchValue

  def initialize(file)
    @doc = Nokogiri::XML(File.open(file))
    parsed = @doc.to_s
    json = Hash.from_xml(parsed)
    @name_array = json['document']['devices']['device']
  end

  def find_by_value(value)
    @name_array.each do |device|
			if device['value'] == value
				output = device.to_s
        return output
      end
		end
  end

end
