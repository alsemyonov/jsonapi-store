# frozen_string_literal: true
require 'spec_helper'

RSpec.describe JSONAPI::Store::Entity do
  describe 'class' do
  end

  describe 'instance' do
    subject(:entity) { described_class.new(attributes) }
    let(:attributes) do
      {
        id: 1,
        type: 'examples'
      }
    end

    it { is_expected.to be_a(Dry::Struct) }
    it { is_expected.to respond_to :id }
    it { is_expected.to respond_to :type }
    it { is_expected.to respond_to :attributes }
    it { is_expected.to respond_to :relationships }
    it { is_expected.to respond_to :identifier }

    specify 'makes identifier from id and type' do
      expect(entity.identifier).to eq 'examples/1'
    end
  end
end
