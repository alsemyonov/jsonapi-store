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
      entities << Entity.new(entity)
      self
    end

    # @overload fetch(identifier)
    #   @param [#to_s] identifier
    #   @return [JSONAPI::Store::Entity?]
    # @overload fetch(type, id)
    #   @param [#to_s] type
    #   @param [#to_s] id
    #   @return [JSONAPI::Store::Entity?]
    def fetch(*args)
      identifier = args.size == 2 ? args.join('/') : args.first.to_s
      detect { |entity| entity.identifier == identifier }
    end

    alias [] fetch

    # @return [<String>]
    def types
      entities.map(&:type).uniq
    end

    # @return [<JSONAPI::Store::Entity>]
    def entities
      @entities ||= []
    end

    # @return [Integer]
    def size
      entities.size
    end

    # @overload each(&block)
    #   @return [<JSONAPI::Store::Entity>]
    # @overload each
    #   @return [Enumerator<JSONAPI::Store::Entity>]
    def each(&block)
      entities.each(&block)
    end

    include Enumerable
  end
end
