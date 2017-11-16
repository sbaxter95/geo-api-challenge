require 'nokogiri'
require 'json'
require 'active_support'
require 'active_support/core_ext'

class RandomDevice

  def initialize(file)
    @doc = Nokogiri::XML(File.open(file))
    parsed = @doc.to_s
    json = Hash.from_xml(parsed)
    @name_array = json['document']['devices']['device']
  end

  def random_device
    output = @name_array.sample.to_s
    return output
  end

end
