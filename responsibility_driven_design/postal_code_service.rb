module ResponsibilityDrivenDesign
  class PostalCodeService
    def find_postal_code(address)
      case address.city
      when 'Montreal'
        'H2X 2T9'
      when 'Ottawa'
        'K1T 3W7'
      end
    end
  end
end
