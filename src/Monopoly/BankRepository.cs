using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Monopoly
{
    public interface IBankRepository
    {
        int CreditAccount(Player player, int amount);
        int DebitAccount(Player player, int amount);
        int CheckBalance(Player player);
    }

    public class BankRepository : IBankRepository
    {
        public int CreditAccount(Player player, int amount)
        {
            throw new NotImplementedException();
        }

        public int DebitAccount(Player player, int amount)
        {
            throw new NotImplementedException();
        }

        public int CheckBalance(Player player)
        {
            throw new NotImplementedException();
        }
    }
}
