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
            var unowned = new List<Property>();
            foreach (var item in _propertyRepository.GetAllProperties())
            {
                if (item.OwnedBy == "Bank")
                    unowned.Add(item);
            }

            return unowned;
        }
    }
}
