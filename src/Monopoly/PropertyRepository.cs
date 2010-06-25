using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Monopoly
{
    public interface IPropertyRepository
    {
        List<Property> GetAllProperties();
    }

    public class PropertyRepository : IPropertyRepository
    {
        public List<Property> GetAllProperties()
        {
            var props = new List<Property>();
            props.Add(new Utility { Name = "Electric Company", BothOwned = false, Price = 150, OwnedBy = "Bank" });
            props.Add(new Utility { Name = "Water Works", BothOwned = false, Price = 150, OwnedBy = "Race Car" });
            props.Add(new Railroad { Name = "Reading Railroad", NumberOfRailroadsOwned = 1, Price = 200, OwnedBy = "Top Hat" });
            props.Add(new Railroad { Name = "Short Line Railroad", Price = 200, OwnedBy = "Bank" });
            props.Add(new ColoredLot { Name = "Boardwalk", Color = "Blue", Price = 400, OwnedBy = "Thimble", OwnAllLotsInGroup = false });
            props.Add(new ColoredLot { Name = "Park Place", Color = "Blue", Price = 350, OwnedBy = "Bank"});

            return props;
        }
    }
}
