require "spec_helper"

RSpec.describe Apple::Music do
  it "has a version number" do
    expect(Apple::Music::VERSION).not_to be nil
  end
end
