using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Monopoly
{
    public class Player
    {
        public string Name { get; set; }
        public int AccountBalance { get; set; }
        public List<Property> Properties { get; set; }
        public string CurrentLocation { get; set; }

        public Player()
        {
            this.AccountBalance = 2000;
        }
    }
}
