module Properties
  module Factories
    # Build Property::Item from Properties::Db::Record.
    # @param [Properties::Db::Record] property_record
    # @return Properties::Item
    class Item
      def build(property_record)
        Properties::Item.new(
          house_number: property_record.house_number,
          street:       property_record.street,
          city:         property_record.city,
          zip_code:     property_record.zip_code,
          # state:        property_record.state,
          lat:          property_record.lat,
          lng:          property_record.lng,
          price:        property_record.price
        )
      end
    end
  end
end