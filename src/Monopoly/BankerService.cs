using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Monopoly
{
    public class BankerService
    {
        IBankRepository _bankRepository;

        public BankerService() : this(null) { }

        public BankerService(IBankRepository bankRepository)
        {
            _bankRepository = bankRepository ?? new BankRepository();
        }

        public void PayPlayer(Player player, int amount)
        {
            if(_bankRepository.TakeMoneyFromTheBank(amount))
                player.AccountBalance = player.AccountBalance + amount;
        }

        public void PassGo(Player player)
        {
            PayPlayer(player, 200);
        }

        public string PayTheBank(Player player, int amount)
        {
            string message = "Insufficient funds";

            if (player.AccountBalance > amount)
            {
                player.AccountBalance -= amount;
                _bankRepository.PutMoneyInTheBank(amount);
                message = "Payment successful";
            }

            return message;
        }
    }
}
