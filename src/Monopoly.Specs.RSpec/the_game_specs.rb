require File.dirname(__FILE__) + '/spec_helper'

describe TheGame do
  describe "when starting a player's turn" do
    it "should get the player from the repository by name" do
      
    end
  end
  
  describe "when moving the player to an unowned colored lot" do
    it "should inform the player the property is unowned" do
      
    end
    
    describe "and the player purchases the property" do
      it "should add the property to the player's property list" do
        
      end
      
      it "should set owned by on the property to the current player" do
        
      end
      
      it "should reduce the player's bankroll by the cost of the property" do
        
      end
    end
    
    describe "and the player decides not to purchase the property" do
      it "should start an auction for the other players" do
        
      end
    end
  end
end