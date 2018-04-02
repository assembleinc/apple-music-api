require 'spec_helper'

RSpec.describe Apple::Music::Station do
  let(:client) { configured_client! }
  let(:object) do
    Apple::Music::Station.new(load_fixture('station').to_h[:data].first,
                              {}, client)
  end

  it_behaves_like 'it inherits from Apple::Music::Base'
end
