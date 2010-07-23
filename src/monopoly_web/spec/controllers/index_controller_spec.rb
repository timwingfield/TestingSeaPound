require 'spec_helper'

describe IndexController do

  #Delete these examples and add some real ones
  it "should use IndexController" do
    controller.should be_an_instance_of(IndexController)
  end


  describe "GET 'list'" do
    it "should be successful" do
      get 'list'
      response.should be_success
    end
  end

  describe "GET 'available'" do
    it "should be successful" do
      get 'available'
      response.should be_success
    end
  end
end
