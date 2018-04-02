require 'spec_helper'

RSpec.describe Apple::Music::Artist do
  let(:client) { configured_client! }
  let(:object) do
    Apple::Music::Artist.new(load_fixture('artist').to_h[:data].first,
                             {}, client)
  end

  it_behaves_like 'it inherits from Apple::Music::Base'

  # context "since the artist fixtures were last updated" do
  #   it "should have the same structure" do
  #     artist_raw = load_fixture("artists/#{@artist_ids.first}.yaml")
  #     found_artist = @client.artist @artist_ids.first

  #     binding.pry
  #   end
  # end
end
