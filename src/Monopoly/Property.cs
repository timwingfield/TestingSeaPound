using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Monopoly
{
    public abstract class Property
    {
        public int Price { get; set; }
        public int MortgageValue { get; set; }
        public string Name { get; set; }
        public string OwnedBy { get; set; }
    }

    public class Utility : Property
    {
        public bool BothOwned { get; set; }

        public Utility()
        {
            this.MortgageValue = 75;
        }

        public int RentDue(int diceAmount)
        {
            return BothOwned ? diceAmount * 10 : diceAmount * 4;
        }
    }

    public class Railroad : Property
    {
        public int NumberOfRailroadsOwned { get; set; }

        public Railroad()
        {
            this.MortgageValue = 100;
        }

        public int RentDue()
        {
            var _rentValues = new List<int> { 25, 50, 100, 200 };
            return _rentValues[this.NumberOfRailroadsOwned - 1];
        }
    }

    public class ColoredLot : Property
    {
        public string Color { get; set; }
        public int NumberOfHouses { get; set; }
        public bool OwnAllLotsInGroup { get; set; }
        public int BaseRent { get; set; }
        public List<int> RentValuesPerNumberOfHouses { get; set; }

        public int RentDue()
        {
            return OwnAllLotsInGroup ? RentValuesPerNumberOfHouses[NumberOfHouses] : BaseRent;
        }
    }
}
