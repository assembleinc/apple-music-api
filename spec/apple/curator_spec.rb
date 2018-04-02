require 'spec_helper'

RSpec.describe Apple::Music::Curator do
  let(:client) { configured_client! }
  let(:object) do
    Apple::Music::Curator.new(load_fixture('curator').to_h[:data].first,
                              {}, client)
  end

  it_behaves_like 'it inherits from Apple::Music::Base'
end
