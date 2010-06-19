using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using NUnit.Framework;

namespace Monopoly.Tests.NUnit
{
    [TestFixture]
    class When_the_bank_pays_a_player
    {
        private Player _player;
        private BankerService _service;
        private MockRepository _repo;

        [SetUp]
        public void before_each()
        {
            _player = new Player { AccountBalance = 875 };
            _repo = new MockRepository();
            _service = new BankerService(_repo);
        }

        [Test]
        public void it_should_increase_the_players_account_balance_by_10_for_winning_2nd_place_in_a_beauty_contest()
        {
            _service.PayPlayer(_player, 10);
            Assert.That(_player.AccountBalance, Is.EqualTo(885));
        }

        [Test]
        public void it_should_increase_the_players_account_balance_by_200_for_passing_go()
        {
            _service.PassGo(_player);
            Assert.That(_player.AccountBalance, Is.EqualTo(1075));
        }

        [Test]
        public void it_should_not_increase_the_players_bank_account_by_the_requested_amount()
        {
            _service.PayPlayer(_player, 550);
            Assert.That(_player.AccountBalance, Is.EqualTo(875));
        }
    }

    public class When_the_player_pays_the_bank_and_has_enough_money
    {
        private Player _player;
        private BankerService _service;
        private MockRepository _repo;
        private string _message;

        [SetUp]
        public void before_each()
        {
            _player = new Player { AccountBalance = 175 };
            _repo = new MockRepository();
            _service = new BankerService(_repo);

            _message = _service.PayTheBank(_player, 50);
        }
        
        [Test]
        public void it_should_decrease_the_players_account_by_50()
        {
            Assert.That(_player.AccountBalance, Is.EqualTo(125));
        }

        [Test]
        public void it_should_return_a_successful_payment_message()
        {
            Assert.That(_message, Is.EqualTo("Payment successful"));
        }

        [Test]
        public void it_should_verify_a_call_to_put_money_in_the_bank_on_the_repository()
        {
            Assert.That(_repo.PutMoneyInTheBankWasCalled, Is.True);
        }
    }

    public class When_the_player_pays_the_bank_and_does_not_have_enough_to_cover_the_bill
    {
        private Player _player;
        private BankerService _service;
        private MockRepository _repo;
        private string _message;

        [SetUp]
        public void before_each()
        {
            _player = new Player { AccountBalance = 175 };
            _repo = new MockRepository();
            _service = new BankerService(_repo);

            _message = _service.PayTheBank(_player, 200);
        }

        [Test]
        public void it_should_return_an_insufficient_funds_message()
        {
            Assert.That(_message, Is.EqualTo("Insufficient funds"));
        }

        [Test]
        public void it_should_not_call_to_put_money_in_the_bank_on_the_repository()
        {
            Assert.That(_repo.PutMoneyInTheBankWasCalled, Is.False);
        }
    }

    public class MockRepository : IBankRepository
    {
        public bool PutMoneyInTheBankWasCalled { get; set; }

        public void PutMoneyInTheBank(int amount)
        {
            this.PutMoneyInTheBankWasCalled = true;
        }

        public bool TakeMoneyFromTheBank(int amount)
        {
            return amount < 500;
        }

        public int CheckFundsAvailable()
        {
            throw new NotImplementedException();
        }
    }
}
