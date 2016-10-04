# frozen_string_literal: true
require 'jsonapi/store/version'

module JSONAPI
  # Basic in-memory store implementation compliant with JSON API
  class Store
    autoload :Entity, 'jsonapi/store/entity'
    autoload :Types, 'jsonapi/store/types'
  end
end
