using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Monopoly
{
    public class PropertyService
    {
        IPropertyRepository _propertyRepository;

        public PropertyService() : this(null) { }

        public PropertyService(IPropertyRepository propertyRepository)
        {
            _propertyRepository = propertyRepository ?? new PropertyRepository();
        }

        public List<Property> GetAllProperties()
        {
            return _propertyRepository.GetAllProperties();
        }

        public List<Property> GetAvailableProperties()
        {

            return _propertyRepository.GetAllProperties().Where(item => item.OwnedBy == "Bank").ToList();

        }
    }
}
