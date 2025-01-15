require_relative 'address'
require_relative 'postal_code_service'

module ResponsibilityDrivenDesign
  class AddressFactory
    def create_address!(street, city, province)
      address = Address.new(street, city, province)
      address.validate!
      address.find_postal_code
      address
    end
  end
end
