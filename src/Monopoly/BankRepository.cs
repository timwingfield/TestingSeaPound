using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Monopoly
{
    public interface IBankRepository
    {
        void PutMoneyInTheBank(int amount);
        bool TakeMoneyFromTheBank(int amount);
        int CheckFundsAvailable();
    }

    public class BankRepository : IBankRepository
    {
        public void PutMoneyInTheBank(int amount)
        {
            throw new NotImplementedException();
        }

        public bool TakeMoneyFromTheBank(int amount)
        {
            throw new NotImplementedException();
        }

        public int CheckFundsAvailable()
        {
            throw new NotImplementedException();
        }
    }
}
