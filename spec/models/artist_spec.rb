require "rails_helper"

RSpec.shared_context "artist setup" do
  let(:artist) { create(:artist) }
end

RSpec.describe Artist, type: :model do
  describe "active record relations" do
    it { should have_many(:writings) }
    it { is_expected.to have_rich_text(:bio) }
  end

  describe "#random_writings" do
    include_context "artist setup"
    let!(:writings) { create_list(:writing, 10, artist:) }

    it "returns 5 writings" do
      expect(artist.random_writings.count).to eq(5)
    end

    it "returns writings belonging to the artist" do
      artist.random_writings.each do |writing|
        expect(writing.artist_id).to eq(artist.id)
      end
    end

    it "returns instances of Writing" do
      artist.random_writings.each do |writing|
        expect(writing).to be_a(Writing)
      end
    end

    it "returns a random set of writings" do
      sets = Array.new(5) { artist.random_writings.map(&:id) }
      expect(sets.uniq.size).to be > 1 # Expect at least some different sets
    end
  end

  describe "#years_of_writings" do
    include_context "artist setup"

    before do
      create(:writing, artist:, date: Date.new(2020, 1, 1))
      create(:writing, artist:, date: Date.new(2021, 1, 1))
      create(:writing, artist:, date: Date.new(2021, 1, 1)) # Duplicate year
    end

    it "returns a sorted array of unique years of writings" do
      expect(artist.years_of_writings).to eq([2020, 2021])
    end
  end
end
