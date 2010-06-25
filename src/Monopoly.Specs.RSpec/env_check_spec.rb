require File.dirname(__FILE__) + '/spec_helper'

describe 'when verifying the environment' do
  before :each do
    @p = Player.new
  end
  
  it 'should create a CLR object from the Monopoly project' do
    @p.should_not be_nil
  end
end