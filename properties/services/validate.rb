module Properties
  module Services
    # Validate params from search request
    # @param [Hash] :inputs
    #   - params [Hash]
    # @return [Dry::Monads::Result] Success or Failure
    class Validate
      include Dry::Monads::Result::Mixin

      def call(inputs)
        validation = validator.call(inputs.fetch(:params))

        inputs.merge!(
          validated_params: validation.to_h
        )

        return Failure(inputs.merge!(error_message(validation))) if validation.failure?

        Success(inputs)
      end

      private

      def error_message(validation)
        {
          error_code: :invalid_params,
          errors: validation.messages(locale: :en).to_h
        }
      end

      def validator
        ::Container['properties.validators.search_params']
      end
    end
  end
end