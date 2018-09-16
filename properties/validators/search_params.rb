module Properties
  module Validators
    # Implement validations for search request params.
    # @param [Hash] params
    # @return [Hash]:
    #  - output [Hash]
    #  - errors [Hash]
    SearchParams = Dry::Validation.Params do
      configure do
        config.type_specs = true
      end

      PROPERTY_TYPES = %w(
        apartment
        single_family_house
      ).freeze

      MARKETING_TYPES = %w(
        rent
        sell
      ).freeze

      required(:lng, Types::Coordinate).value(gteq?: -180, lteq?: 180)
      required(:lat, Types::Coordinate).value(gteq?: -90, lteq?: 90)
      required(:property_type, :string).value(included_in?: PROPERTY_TYPES)
      required(:marketing_type, :string).value(included_in?: MARKETING_TYPES)
    end
  end
end