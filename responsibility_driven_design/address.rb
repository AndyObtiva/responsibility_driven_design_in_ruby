module ResponsibilityDrivenDesign
  class Address
    VALID_CITIES = ['Montreal', 'Ottawa']
    VALID_PROVINCES = ['Quebec', 'Ontario']
  
    attr_reader :street, :city, :province, :postal_code
   
    def initialize(street, city, province)
      @street = street
      @city = city
      @province = province
      @postal_code_service = PostalCodeService.new
    end
    
    def validate!
      validate_street!
      validate_city!
      validate_province!
    end
    
    def find_postal_code
      @postal_code = @postal_code_service.find_postal_code(self)
    end
    
    private
    
    def validate_street!
      raise "Invalid street address (must start with number and end with letter): #{@street}" unless @street.match(/^\d.*[a-zA-Z]$/)
    end
    
    def validate_city!
      raise "Invalid city name (must be Montreal or Ottawa): #{@city}" unless VALID_CITIES.include?(@city)
    end
    
    def validate_province!
      case @city
      when 'Montreal'
        raise "Invalid province name (must be Quebec): #{@province}" unless @province == 'Quebec'
      when 'Ottawa'
        raise "Invalid province name (must be Ontario): #{@province}" unless @province == 'Ontario'
      end
    end
  end
end
