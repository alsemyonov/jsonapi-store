# frozen_string_literal: true
require 'spec_helper'

RSpec.describe JSONAPI::Store::Types do
end

RSpec.describe JSONAPI::Store::Types::Optional::Hash do
  it { expect(described_class[nil]).to eq({}) }
  it { expect(described_class[{}]).to eq({}) }
  it { expect(described_class['a' => 1]).to eq('a' => 1) }
end
