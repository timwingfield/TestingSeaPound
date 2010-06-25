require File.dirname(__FILE__) + '/spec_helper'

describe PropertyRepository, 'when calling get all properties' do
  before :each do
    repo = PropertyRepository.new
    @properties = repo.get_all_properties
  end
  
  it 'should have six items' do
    @properties.should have(6).items
  end
  
  it 'should have a colored lot in the last position' do
    @properties.last.should be_a(ColoredLot)
  end
  
  it 'should have the last item respond to rent due' do
    @properties.last.respond_to?('rent_due').should be_true
  end
end