module Properties
  module Services
    # Calls declared services in correct order to perform search.
    # @param [Hash] :inputs
    #   - params [Hash]
    # @return :inputs with search result or errors
    class Search
      include Dry::Transaction(container: ::Container)

      step :validate, with: 'properties.services.validate'
      step :search

      def search(inputs)
        validated_params = inputs.fetch(:validated_params)

        properties = ::Container['properties.repositories.property'].find_all(validated_params)

        inputs.merge!(
          result: properties.to_h
        )

        return Failure(inputs.merge!(error_message(validated_params))) if properties.size.zero?

        Success(inputs)
      end

      private

      def error_message(validated_params)
        {
          error_code: :empty_result,
          errors: {
            result: ["No data for requested params: #{validated_params.to_json}"]
          }
        }
      end
    end
  end
end