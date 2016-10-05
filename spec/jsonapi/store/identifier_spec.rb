# frozen_string_literal: true
require 'spec_helper'

RSpec.describe JSONAPI::Store::Identifier do
  describe 'class' do
  end

  describe 'instance' do
    subject(:identifier) { described_class.new(attributes) }
    let(:attributes) do
      {
        id: 1,
        type: 'examples'
      }
    end

    it { is_expected.to be_a(Dry::Struct) }
    it { is_expected.to respond_to :id }
    it { is_expected.to respond_to :type }
    it { is_expected.to respond_to :to_s }
    it { is_expected.to respond_to :to_hash }

    specify 'makes a hash including id and type' do
      expect(identifier.to_hash).to eq(id: '1', type: 'examples')
    end

    specify 'makes identifier from id and type' do
      expect(identifier.identifier).to eq 'examples/1'
    end

    specify 'responds with identifier when coerced to string' do
      expect(identifier.to_str).to eq 'examples/1'
      expect(identifier.to_s).to eq 'examples/1'
    end
  end
end
