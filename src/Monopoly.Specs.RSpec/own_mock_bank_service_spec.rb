require File.dirname(__FILE__) + '/spec_helper'

describe BankerService, "using a hand rolled mock" do
  describe "when the bank pays a player" do
    before :each do
      @player = Player.new
      @player.account_balance = 875
      
      @repo = MockRepository.new
      @service = BankerService.new @repo
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
      
      @repo = MockRepository.new
      @service = BankerService.new @repo
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
        @repo.put_money_in_the_bank_was_called.should be_true
      end
    end
    
    describe "and the player doesn't have enough money to cover the bill" do
      before :each do
        @message = @service.pay_the_bank(@player, 200)
      end
      
      it "should not call put money in the bank on the repository" do
        @repo.put_money_in_the_bank_was_called.should be_false
      end
      
      it "should return an insufficient funds message" do
        @message.should == "Insufficient funds"
      end
    end
  end
end

class MockRepository
  include Monopoly::IBankRepository
  
  attr_accessor :put_money_in_the_bank_was_called
  
  def take_money_from_the_bank(amount)
    amount < 500
  end
  
  def put_money_in_the_bank(amount)
    @put_money_in_the_bank_was_called = true
  end
end