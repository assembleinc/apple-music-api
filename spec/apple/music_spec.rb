require 'spec_helper'
require 'yaml'
require 'pry'

RSpec.describe Apple::Music do
  it 'has a version number' do
    expect(Apple::Music::VERSION).not_to be nil
  end
end

RSpec.describe Apple::Music::Error do
  ### ...
end

RSpec.describe Apple::Music::Chart do
  # let(:client) { configured_client! }
  # let(:object) do
  #   Apple::Music::Chart.new(load_fixture('chart').to_h[:data].first,
  #                           {}, client)
  # end

  # it_behaves_like 'it inherits from Apple::Music::Base'
end

RSpec.describe Apple::Music::AppleCurator do
  let(:client) { configured_client! }
  let(:object) do
    Apple::Music::AppleCurator.new(load_fixture('apple_curator').to_h[:data].first,
                                   {}, client)
  end

  it_behaves_like 'it inherits from Apple::Music::Base'
end

RSpec.describe Apple::Music::Genre do
  let(:client) { configured_client! }
  let(:object) do
    Apple::Music::Genre.new(load_fixture('genre').to_h[:data].first,
                            {}, client)
  end

  it_behaves_like 'it inherits from Apple::Music::Base'
end

RSpec.describe Apple::Music::Curator do
  let(:client) { configured_client! }
  let(:object) do
    Apple::Music::Curator.new(load_fixture('curator').to_h[:data].first,
                              {}, client)
  end

  it_behaves_like 'it inherits from Apple::Music::Base'
end

RSpec.describe Apple::Music::MusicVideo do
  let(:client) { configured_client! }
  let(:object) do
    Apple::Music::MusicVideo.new(load_fixture('music_video').to_h[:data].first,
                                 {}, client)
  end

  it_behaves_like 'it inherits from Apple::Music::Base'
end

RSpec.describe Apple::Music::Station do
  let(:client) { configured_client! }
  let(:object) do
    Apple::Music::Station.new(load_fixture('station').to_h[:data].first,
                              {}, client)
  end

  it_behaves_like 'it inherits from Apple::Music::Base'
end

RSpec.describe Apple::Music::Storefront do
end
