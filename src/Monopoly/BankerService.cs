using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Monopoly
{
    public interface IBankerService
    {
        void PassGo(Player player);
        void BuyProperty(Player player, BaseProperty property);
        void PayRent(Player player, int rentDue);
    }

    public class BankerService : IBankerService
    {
        public void PassGo(Player player)
        {
            throw new NotImplementedException();
        }

        public void BuyProperty(Player player, BaseProperty property)
        {
            throw new NotImplementedException();
        }

        public void PayRent(Player player, int rentDue)
        {
            throw new NotImplementedException();
        }
    }
}
