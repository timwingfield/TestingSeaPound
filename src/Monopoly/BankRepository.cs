using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Monopoly
{
    public interface IBankRepository
    {
        void UpdateAccount(string accountId, int balance);
        int CheckBalance(int accountId);
    }

    public class BankRepository : IBankRepository
    {
        public void UpdateAccount(string accountId, int balance)
        {
            throw new NotImplementedException();
        }

        public int CheckBalance(int accountId)
        {
            throw new NotImplementedException();
        }
    }
}
