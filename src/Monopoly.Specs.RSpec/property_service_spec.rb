require File.dirname(__FILE__) + '/spec_helper'

describe PropertyService, "with the hard coded repository" do
  before :each do
    @service = PropertyService.new
  end
  
  describe "and calling get all properties" do
    it "should have 6 items" do
      @service.get_all_properties.should have(6).items
    end
  end
  
  describe "and calling get available properties" do
    it "should have 3 items" do
      @service.get_available_properties.should have(3).items
    end
    
    it "should have bank as an owner on the first item" do
      @service.get_available_properties.first.owned_by.should == 'Bank'
    end
  end
end

describe PropertyService, "with a stubbed repository" do
  before :each do
    owned = ColoredLot.new
    owned.owned_by = 'shoe'
    owned.name = 'Boardwalk'
    
    unowned = ColoredLot.new
    unowned.owned_by = 'Bank'
    unowned.name = 'Illinois Ave'

    @all_properties = List.of(Property).new()
    @all_properties.add(owned)
    @all_properties.add(unowned)
    
    @repo = StubbedRepo.new
    @repo.stub!(:get_all_properties).and_return(@all_properties)
    
    @service = PropertyService.new(@repo)
  end

  describe "and calling get all properties" do
    it "should have 2 items" do
      @service.get_all_properties.should have(2).items
    end
  end

  describe "and calling get available properties" do
    it "should have 1 item" do
      @service.get_available_properties.should have(1).items
    end
  
    it "should have bank as an owner on the first item" do
      @service.get_available_properties.first.owned_by.should == 'Bank'
    end
  end  
end

class StubbedRepo
  include Monopoly::IPropertyRepository
end