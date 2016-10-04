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

    let(:ids) { (0..10).to_a }

    # @param [Hash] attributes
    # @return [JSONAPI::Store::Entity]
    def entity(attributes = {})
      JSONAPI::Store::Entity.new(
        { id: ids.sample, type: 'examples' }.merge(attributes)
      )
    end

    specify 'stores and fetches entities', :aggregate_failures do
      expect(store.size).to eq(0)
      expect(store.each).to be_a(Enumerator)
      expect(store.entities).to eq []
      expect(store.types).to eq []

      store << important_entity = entity(id: '100')
      store << entity
      store << entity

      expect(store.size).to eq(3)
      expect(store.each).to be_a(Enumerator)
      expect(store.entities).to match_array [
        kind_of(JSONAPI::Store::Entity),
        kind_of(JSONAPI::Store::Entity),
        kind_of(JSONAPI::Store::Entity)
      ]
      expect(store.types).to eq ['examples']
      expect(store['examples/100']).to eq important_entity
      expect(store['examples/11']).to eq nil
    end
    end
  end
end
