require 'spec_helper'

RSpec.describe Apple::Music::AppleCurator do
  let(:client) { configured_client! }
  let(:object) do
    Apple::Music::AppleCurator.new(load_fixture('apple_curator').to_h[:data].first,
                                   {}, client)
  end

  it_behaves_like 'it inherits from Apple::Music::Base'
end
