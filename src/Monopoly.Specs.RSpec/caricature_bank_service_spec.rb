require File.dirname(__FILE__) + '/spec_helper'

describe BankerService, "using Caricature for mocks" do
  describe "when the bank pays a player" do
    before :each do
      @player = Player.new
      @player.account_balance = 875
      
      @isolation = Isolation.for IBankRepository
      @isolation.when_receiving(:take_money_from_the_bank).return(true)
      @isolation.when_receiving(:take_money_from_the_bank).with(550).return(false)
      
      @service = BankerService.new @isolation
    end
    
    describe "and that player wins second prize in a beauty contest" do
      it "should increase the player's account balance by 10" do
        @service.pay_player(@player, 10)
        @player.account_balance.should be(885)
      end
    end
  
    describe "and that player passes go" do
      it "should increase the player's account balance by 200" do
        @service.pass_go(@player)
        @player.account_balance.should be(1075)
      end
    end
  
    describe "and the bank doesn't have enough money to pay the player" do    
      it "should not increase the player's bank account by the requested amount" do
        @service.pay_player(@player, 550)
        @player.account_balance.should be(875)
      end
    end
  end
  
  describe "when a player pays the bank" do
    before :each do
      @player = Player.new
      @player.account_balance = 175
      
      @isolation = Isolation.for IBankRepository
      @isolation.when_receiving(:put_money_in_the_bank).with(50)
      @service = BankerService.new @isolation
    end
    
    describe "and that player is paying a doctor's bill of $50" do
      before :each do
        @message = @service.pay_the_bank(@player, 50)
      end
      
      it "should decrease the player's account by 50" do
        @player.account_balance.should be(125)
      end
      
      it "should return a successful payment message" do
        @message.should == "Payment successful"
      end
      
      it "should call put money in the bank on the repository" do
        @isolation.did_receive?(:put_money_in_the_bank).with(50)
      end
    end
    
    describe "and the player doesn't have enough money to cover the bill" do
      before :each do
        @message = @service.pay_the_bank(@player, 200)
      end
      
      it "should not call put money in the bank on the repository" do
        @isolation.should_not_receive(:put_money_in_the_bank)
      end
      
      it "should return an insufficient funds message" do
        @message.should == "Insufficient funds"
      end
    end
  end
end