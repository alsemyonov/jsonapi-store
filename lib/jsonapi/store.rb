# frozen_string_literal: true
require 'jsonapi/store/version'

module JSONAPI
  # Basic in-memory store implementation compliant with JSON API
  class Store
    autoload :Entity, 'jsonapi/store/entity'
    autoload :Types, 'jsonapi/store/types'
    autoload :Identifier, 'jsonapi/store/identifier'

    # @param [JSONAPI::Store::Entity] entity
    # @return [JSONAPI::Store] store itself
    def <<(entity)
      entity = Entity.new(entity)
      entities << entity
      entity.relationships.each do |_name, data|
        Array(data).each do |relationship|
          relationship = Entity.new(relationship)
          self << relationship unless self[relationship.identifier]
        end
      end
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

    # @param [#to_s] type
    # @return [<JSONAPI::Store::Entity>]
    def all(type)
      type = type.to_s
      select { |entity| entity.type == type }
    end

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
