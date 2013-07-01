require 'spec_helper'

describe "StaticPages" do
  describe "GET /static_pages/home" do
    it "check if we are getting the home page" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      visit '/static_pages/home'
      page.status_code.should == 200
    end

    # it "works! (now write some real specs)" do
    #   # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
    #   get static_pages_index_path
    #   response.status.should be(200)
    # end

    # it "works! (now write some real specs)" do
    #   # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
    #   get static_pages_index_path
    #   response.status.should be(200)
    # end
  end
end
