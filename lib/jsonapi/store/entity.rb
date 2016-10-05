# frozen_string_literal: true
require 'jsonapi/store'
require 'jsonapi/store/identifier'

module JSONAPI
  class Store
    # Basic entity implementation for {JSONAPI::Store}
    class Entity < Identifier
      constructor_type :strict_with_defaults

      # @return [Hash] attributes of the entity
      attribute :attributes, Types::Optional::Hash
      # @return [Hash] relationships of the entity
      attribute :relationships, Types::Optional::Hash
    end
  end
end
