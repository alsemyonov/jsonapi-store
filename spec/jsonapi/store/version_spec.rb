# frozen_string_literal: true
require 'spec_helper'

RSpec.describe JSONAPI::Store do
  it 'should has a version number' do
    expect(JSONAPI::Store::VERSION).not_to be nil
  end
end
