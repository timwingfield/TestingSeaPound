require File.dirname(__FILE__) + '/spec_helper'

describe PlayerService do
  before :each do
    @player = Player.new
    @player.name = "Shoe"
    
    @isolation = Isolation.for IPlayerRepository
    @isolation.when_receiving(:get_player_by_name).with(@player_name).return(@player)
    @isolation.when_receiving(:save_player).with(@player).return(true)
    
    @service = PlayerService.new(@isolation)
  end
  
  describe "when getting a player by name" do
    before :each do
      @this_player = @service.get_player_by_name(@player_name)
    end
    
    it "should call get player by name on the repository" do
      @isolation.did_receive?(:get_player_by_name).with(@player_name)
    end
    
    it "should get the expected player back" do
      @this_player.should == @player
    end
  end
  
  describe "when saving a player" do
    before :each do
      @did_save = @service.save_player(@player)
    end
    
    it "should call save player on the repository" do
      @isolation.did_receive?(:save_player).with(@player)
    end
    
    it "should return true for saved" do
      @did_save.should be_true
    end
  end
end