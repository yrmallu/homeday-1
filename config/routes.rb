require 'dry/matcher/either_matcher'

get "/" do
  Dry::Matcher::EitherMatcher.call(::Container['properties.services.search'].call(params: params)) do |result|
    result.success do |outputs|
      outputs.fetch(:result).to_json
    end

    result.failure do |outputs|
      {
        errors: outputs.fetch(:errors)
      }.to_json
    end
  end
end

