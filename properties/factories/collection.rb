module Properties
  module Factories
    # Build collection of Properties::Item
    # @param [Array] properties_records
    # @return Properties::Collection
    class Collection
      def build(properties_records)
        items = properties_records.map do |property_record|
          ::Container["properties.factories.item"].build(property_record)
        end

        Properties::Collection.new(items)
      end
    end
  end
end