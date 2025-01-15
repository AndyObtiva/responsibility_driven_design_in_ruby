module ResponsibilityDrivenDesign
  class User
    attr_reader :email, :addresses
    
    def initialize(email)
      @email = email
      @addresses = []
    end
    
    def add_address(address)
      @addresses << address
    end
  end
end
