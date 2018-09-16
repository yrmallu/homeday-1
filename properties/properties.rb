require "dry-matcher"
require 'dry-monads'
require 'dry-types'
require 'dry-struct'
require "dry-transaction"
require 'dry-validation'
require 'ostruct'

# Custom types declaration
module Types
  include Dry::Types.module

  Coordinate = Types::Float.constructor { |value| value.to_f }
end

require_relative 'item'
require_relative 'collection'

require_relative 'db/record'
require_relative 'factories/collection'
require_relative 'factories/item'
require_relative 'repositories/property'
require_relative 'services/search'
require_relative 'services/validate'
require_relative 'validators/search_params'