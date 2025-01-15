require_relative 'address_factory'
require_relative 'user'

module ResponsibilityDrivenDesign
  class Application
    def initialize
      @address_factory = AddressFactory.new
      @user = User.new('user@example.com')
    end
    
    def run
      puts 'We will add a new address to the user addresses.'
      puts 'Please enter street address (must start with number and end with letter):'
      street = gets.chomp
      puts 'Please enter city name (must be Montreal or Ottawa):'
      city = gets.chomp
      puts 'Please enter province name (must be Quebec or Ontario):'
      province = gets.chomp
      address = @address_factory.create_address!(street, city, province)
      puts "Found address postal code as: #{address.postal_code}"
      @user.add_address(address)
      puts "Successfully added the following address to user addresses: #{@user.addresses.first.street}, " +
                                                                       "#{@user.addresses.first.city}, " +
                                                                       "#{@user.addresses.first.province} " +
                                                                       "#{@user.addresses.first.postal_code}"
    end
  end
end

ResponsibilityDrivenDesign::Application.new.run
