require 'spec_helper'

RSpec.describe Apple::Music::MusicVideo do
  let(:client) { configured_client! }
  let(:object) do
    Apple::Music::MusicVideo.new(load_fixture('music_video').to_h[:data].first,
                                 {}, client)
  end

  it_behaves_like 'it inherits from Apple::Music::Base'
end
