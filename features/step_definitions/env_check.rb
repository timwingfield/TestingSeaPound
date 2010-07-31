Given /^the player "([^\"]*)" is initialized to start a game$/ do |player_name|
  @player = Player.new
  @player.name = player_name
end  

When /^I check the player balance$/ do
  @balance = @player.account_balance
end

Then /^the initial account balance should be \$2000$/ do 
  @balance.should be(2000)
end