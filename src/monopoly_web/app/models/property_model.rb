require "Monopoly.dll"

class PropertyModel < Monopoly::Property
	@service = Monopoly::PropertyService.new

	class << self
		def get_all
			@service.get_all_properties
		end

		def get_available
			@service.get_available_properties
		end
	end
end