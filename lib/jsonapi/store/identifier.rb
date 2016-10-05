# frozen_string_literal: true
require 'jsonapi/store'
require 'dry-struct'

module JSONAPI
  class Store
    # Basic Identifier implementation for {JSONAPI::Store}
    class Identifier < Dry::Struct
      constructor_type :strict

      # @return [String] id of the entity
      attribute :id, Types::Coercible::String
      # @return [String] type of the entity
      attribute :type, Types::Coercible::String

      # @return [String]
      def identifier
        @identifier ||= "#{type}/#{id}"
      end
      alias to_s identifier
      alias to_str identifier
    end
  end
end
