require "spec_helper"

describe Jsonapi::Store do
  it "has a version number" do
    expect(Jsonapi::Store::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(false).to eq(true)
  end
end
