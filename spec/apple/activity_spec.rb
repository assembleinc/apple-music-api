require 'spec_helper'

RSpec.describe Apple::Music::Activity do
  let(:client) { configured_client! }
  let(:object) do
    Apple::Music::Activity.new(load_fixture('activity').to_h[:data].first,
                               {}, client)
  end

  it_behaves_like 'it inherits from Apple::Music::Base'
end
