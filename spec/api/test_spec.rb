require File.expand_path '../../spec_helper.rb', __FILE__

describe APIApp do

  before(:all) do
    @api = APIApp.new
  end

  it "should allow accessing the home page" do
    expect(1 + 1).to eq(2)
  end

end
