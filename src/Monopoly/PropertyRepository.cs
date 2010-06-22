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
            throw new NotImplementedException();
        }
    }
}
