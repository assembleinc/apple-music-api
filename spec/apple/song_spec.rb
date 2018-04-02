require 'spec_helper'

RSpec.describe Apple::Music::Song do
  let(:client) { configured_client! }
  let(:object) do
    Apple::Music::Song.new(load_fixture('song').to_h[:data].first,
                           {}, client)
  end

  it_behaves_like 'formattable', %i[ id name artist_name artwork_url genres
                                     explicit preview url duration track_number
                                     is_preorder ]

  it_behaves_like 'it inherits from Apple::Music::Base'
  it_behaves_like 'it has artwork'
end
