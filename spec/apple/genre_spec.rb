require 'spec_helper'

RSpec.describe Apple::Music::Genre do
  let(:client) { configured_client! }
  let(:object) do
    Apple::Music::Genre.new(load_fixture('genre').to_h[:data].first,
                            {}, client)
  end

  it_behaves_like 'it inherits from Apple::Music::Base'
end
