# frozen_string_literal: true
require 'jsonapi/store'
require 'dry-types'

module JSONAPI
  class Store
    # Constrained types for {JSONAPI::Store} entities
    module Types
      include Dry::Types.module

      # Add optional Hash for use in {Store::Entity}
      module Optional
        Hash = Types::Strict::Hash.optional.default({})

        def Hash.to_s
          'JSONAPI::Store::Types::Optional::Hash'
        end
      end
    end
  end
end
