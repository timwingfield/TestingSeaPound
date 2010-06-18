using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Monopoly
{
    public interface IBankerService
    {
        void PassGo(Player player);
        void BuyProperty(Player player, Property property);
        void PayRent(Player player, int rentDue);
    }

    public class BankerService : IBankerService
    {
        IBankRepository _bankRepository;

        public BankerService() : this (null) { }

        public BankerService(IBankRepository bankRepository)
        {
            _bankRepository = bankRepository ?? new BankRepository();
        }

        public void PassGo(Player player)
        {
            player.AccountBalance += 200;
            _bankRepository.UpdateAccount(player.BankAccountId, player.AccountBalance);
        }

        public void BuyProperty(Player player, Property property)
        {
            throw new NotImplementedException();
        }

        public void PayRent(Player player, int rentDue)
        {
            throw new NotImplementedException();
        }
    }
}
