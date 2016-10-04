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
  end
end
