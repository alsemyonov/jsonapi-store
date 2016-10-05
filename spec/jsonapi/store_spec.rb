# frozen_string_literal: true
require 'spec_helper'

RSpec.describe JSONAPI::Store do
  describe 'class' do
  end

  describe 'instance' do
    subject(:store) { described_class.new }

    it { is_expected.to respond_to :<< }
    it { is_expected.to respond_to :size }
    it { is_expected.to respond_to :[] }
    it { is_expected.to respond_to :types }
    it { is_expected.to respond_to :entities }
    it { is_expected.to respond_to :each }
    it { is_expected.to be_a Enumerable }
    it { is_expected.to respond_to :fetch }

    let(:ids) { (0..10).to_a }
    let(:important_entity) { entity(id: '100') }

    # @param [Hash] attributes
    # @return [JSONAPI::Store::Entity]
    def entity(attributes = {})
      JSONAPI::Store::Entity.new(
        { id: ids.sample, type: 'examples' }.merge(attributes)
      )
    end

    def fill_store
      store << important_entity
      store << entity
      store << entity
    end

    def any_entity
      kind_of(JSONAPI::Store::Entity)
    end

    specify 'stores and fetches entities', :aggregate_failures do
      expect(store.size).to eq(0)
      expect(store.each).to be_a(Enumerator)
      expect(store.entities).to eq []
      expect(store.types).to eq []

      fill_store

      expect(store.size).to eq(3)
      expect(store.each).to be_a(Enumerator)
      expect(store.entities).to match_array [
        any_entity,
        any_entity,
        important_entity
      ]
      expect(store.types).to eq ['examples']
      expect(store['examples/100']).to eq important_entity
      expect(store['examples/11']).to eq nil
    end

    specify 'finds single resources by type and id', :aggregate_failures do
      fill_store

      expect(store.fetch('examples', 100)).to eq important_entity
    end
  end
end
