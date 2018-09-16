require 'dry-auto_inject'

::Container = Dry::Container.new
::Import = Dry::AutoInject(::Container)

require_relative 'properties'

module Properties
  # Encapsulates the knowledge how to initialize dependencies used in +Properties+ component.
  # It initializes and registers them in container.
  class BootContainer
    class << self
      def call(container)
        container.namespace('properties') do
          namespace('factories') do
            register('collection')  { Properties::Factories::Collection.new }
            register('item')        { Properties::Factories::Item.new }
          end

          namespace('repositories') do
            register('property') { Properties::Repositories::Property.new }
          end

          namespace('services') do
            register('search')    { Properties::Services::Search.new }
            register('validate')  { Properties::Services::Validate.new }
          end

          namespace('validators') do
            register('search_params') { Properties::Validators::SearchParams }
          end
        end

        container
      end
    end
  end
end

Properties::BootContainer.call(::Container)
