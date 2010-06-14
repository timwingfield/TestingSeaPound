﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Monopoly
{
    public class BaseProperty
    {
        public int Price { get; set; }
        public int MortgageValue { get; set; }
        public string Name { get; set; }
        public Player OwnedBy { get; set; }
    }

    public class Utility : BaseProperty
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

    public class Railroad : BaseProperty
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

    public class ColoredLot : BaseProperty
    {
        public string Color { get; set; }
        public int Houses { get; set; }
        public bool OwnAllLotsInGroup { get; set; }

        public int RentDue()
        {
            var _baseRent = 50;
            var _rentValuesPerNumberOfHouses = new List<int> { 100, 200, 600, 1400, 1700, 2000 };

            return OwnAllLotsInGroup ? _rentValuesPerNumberOfHouses[Houses] : _baseRent;
        }
    }
}
