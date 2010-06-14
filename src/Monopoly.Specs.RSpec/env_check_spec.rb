require File.dirname(__FILE__) + '/spec_helper'

describe 'when verifying the environment' do
  it 'should create a CLR object from the Monopoly project' do
    p = Player.new
    p.should_not be_nil
  end
end