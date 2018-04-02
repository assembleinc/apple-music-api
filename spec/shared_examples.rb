RSpec.shared_examples 'formattable' do |attributes|
  context 'Ocelot dependency' do
    describe '#formatted' do
      let(:formatted) { object.formatted }

      it 'can get a formatted version of an object' do
        expect(formatted).to be_an_instance_of Hash
      end

      attributes.each do |attribute|
        it "contains #{attribute}" do
          expect(formatted[attribute]).not_to be nil
        end
      end
    end
  end
end

RSpec.shared_examples 'it inherits from Apple::Music::Base' do
  describe '#attributes' do
    let(:attributes) { object.attributes }

    it 'is hashable' do
      expect(attributes).to be_an_instance_of Hash
      expect(object.attrs).to equal attributes
      expect(object.to_h).to equal attributes
      expect(object.to_hash).to equal attributes
    end

    it 'responds to #href' do
      expect(object).to respond_to :href
    end

    it 'has a type' do
      expect(object).to respond_to :type
      expect(object.type).to be_an_instance_of String
    end

    it 'has relationships' do
      expect(object).to respond_to :relationships
      expect(object.relationships).to be_an_instance_of Hash
    end

    it 'has a meta attributes' do
      expect(object).to respond_to :meta
    end

    it 'has query_options' do
      expect(object).to respond_to :query_options
    end

    it 'can have a client' do
      expect(object).to respond_to :client
    end
  end

  describe '#requery' do
    it 'can requery itself' do
      expect(object).to respond_to :requery
      expect(object).to respond_to :requeried?
    end
  end

  describe '#inspect' do
    it 'is inspectable' do
      expect(object).to respond_to :inspect
    end
  end
end

RSpec.shared_examples 'it has tracks' do
  describe '#tracks' do
    let(:tracks) { object.tracks }
    let(:track_count) { object.tracks.count }

    it 'has tracks' do
      expect(tracks).to be_an_instance_of Apple::Music::Relation::Tracks
    end

    it 'can get track count' do
      expect(track_count).to be >= 0
    end

    it 'can iterate over tracks' do
      count = 0

      tracks.each do |track|
        count += 1
        expect(track).to be_an_instance_of Apple::Music::Song
      end

      expect(count).to be == track_count
    end

    it 'can iterate over tracks with index' do
      tracks.each_with_index do |track, index|
        expect(track).to be_an_instance_of Apple::Music::Song
        expect(track_count).to be >= index
      end
    end
  end
end

RSpec.shared_examples 'it has artwork' do
  describe '#artwork' do
    it 'has artwork' do
      expect(object.artwork).to be_an_instance_of Apple::Music::Artwork
    end

    it 'has a raw url' do
      expect(object.artwork.raw_url).to be_an_instance_of String
    end

    it 'has a url' do
      expect(object.artwork.url).to be_an_instance_of String
    end
  end
end
