# frozen_string_literal: true
require 'jsonapi/store'
require 'dry-struct'

module JSONAPI
  class Store
    # Basic entity implementation for {JSONAPI::Store}
    class Entity < Dry::Struct
      constructor_type :strict_with_defaults

      # @return [String] id of the entity
      attribute :id, Types::Coercible::String
      # @return [String] type of the entity
      attribute :type, Types::Coercible::String
      # @return [Hash] attributes of the entity
      attribute :attributes, Types::Optional::Hash
      # @return [Hash] relationships of the entity
      attribute :relationships, Types::Optional::Hash

      # @return [String]
      def identifier
        @identifier ||= "#{type}/#{id}"
      end
    end
  end
end
