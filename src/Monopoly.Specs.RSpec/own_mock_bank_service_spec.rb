require File.dirname(__FILE__) + '/spec_helper'

describe BankerService do
  before :each do
    @p = Player.new
    @p.BankAccountId = '94'
    @p.account_balance = 578
    
    @mock_repo = MockRepository.new
    
    @service = BankerService.new(@mock_repo)
    @service.pass_go(@p)
  end
  
  it 'should call update account on the bank repository' do
    @mock_repo.update_called.should be_true
  end
  
  it 'should send the player bank account id to update the account' do
    @mock_repo.bank_account_id.should == @p.bank_account_id
  end
  
  it 'should increase the bank account by 200' do
    @p.account_balance.should be(778)
  end
  
  it 'should not call check balance on the repo' do
    @mock_repo.check_balance_called.should be_false
  end
  
end

class MockRepository
  include Monopoly::IBankRepository
  
  attr_accessor :update_called
  attr_accessor :check_balance_called
  attr_accessor :bank_account_id
  
  def update_account(accountId, balance)
    @bank_account_id = accountId
    @update_called = true
  end
  
  def check_balance
    @check_balance_called = true
  end
end