require File.expand_path '../../spec_helper.rb', __FILE__

describe APIApp do

  before(:all) do
    @api = APIApp.new
  end

  it "test test" do
    get '/'
      expect(last_response).to be_ok
  end

end
