# frozen_string_literal: true
require 'jsonapi/store/version'

module JSONAPI
  # Basic in-memory store implementation compliant with JSON API
  class Store
    autoload :Entity, 'jsonapi/store/entity'
    autoload :Types, 'jsonapi/store/types'

    # @param [JSONAPI::Store::Entity] entity
    # @return [JSONAPI::Store] store itself
    def <<(entity)
      raise NotImplementedError
    end

    # @param [String] identifier
    # @return [JSONAPI::Store::Entity]
    def [](identifier)
      raise NotImplementedError
    end

    # @return [<String>]
    def types
      raise NotImplementedError
    end

    # @return [Integer]
    def size
      raise NotImplementedError
    end

    # @return [<JSONAPI::Store::Entity>]
    def entities
      raise NotImplementedError
    end

    # @overload each(&block)
    #   @return [<JSONAPI::Store::Entity>]
    # @overload each
    #   @return [Enumerator<JSONAPI::Store::Entity>]
    def each
      raise NotImplementedError
    end
  end
end
