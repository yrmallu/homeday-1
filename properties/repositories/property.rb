module Properties
  module Repositories
    # The purpose of this service is communicate with DB through ActiveRecord adapter.
    class Property
      RADIUS = 5

      # Find all properties by requested params
      # @param [Hash] validated_params:
      #  - property_type [String]
      #  - marketing_type [String]
      #  - lat [Float]
      #  - lng [Float]
      # @return Properties::Collection
      def find_all(validated_params)
        properties_records = adapter.where(
          property_type:  validated_params.fetch(:property_type),
          offer_type:     validated_params.fetch(:marketing_type)
        ).where(
          [
            "earth_box(ll_to_earth(?, ?), ?) @> ll_to_earth(lat, lng)",
            validated_params.fetch(:lat),
            validated_params.fetch(:lng),
            km_to_miles
          ]
        )

        ::Container["properties.factories.collection"].build(properties_records)
      end

      private

      def km_to_miles
        RADIUS / 1.609 * 1000
      end

      def adapter
        Properties::Db::Record
      end
    end
  end
end