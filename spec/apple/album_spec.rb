require 'spec_helper'

RSpec.describe Apple::Music::Album do
  let(:client) { configured_client! }
  let(:object) do
    Apple::Music::Album.new(load_fixture('album').to_h[:data].first,
                            {}, client)
  end

  it_behaves_like 'formattable', %i[ name url artist_name description
                                     description_short artwork_url tracks ]

  it_behaves_like 'it inherits from Apple::Music::Base'
  it_behaves_like 'it has artwork'
  it_behaves_like 'it has tracks'
end
