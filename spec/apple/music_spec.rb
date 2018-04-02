require 'spec_helper'
require 'pry'

RSpec.describe Apple::Music do
  it 'has a version number' do
    expect(Apple::Music::VERSION).not_to be nil
  end
end

RSpec.describe Apple::Music::Error do
  ### ...
end

RSpec.describe Apple::Music::Storefront do
end
