require "rails_helper"

RSpec.describe Writing, type: :model do
  describe "active record relations" do
    it { should belong_to(:artist) }
    it { is_expected.to have_rich_text(:content) }
    it { should have_many(:tags) }
    it { should have_many(:tags).through(:taggings) }
    it { should have_many(:annotations) }
  end
end
