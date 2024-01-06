require 'rails_helper'

RSpec.describe "Artists", type: :request do
  describe "GET /index" do
    let!(:greif) { create(:artist, :olivier_greif) }
    let!(:other_artists) { create_list(:artist, 10) }
    let!(:artists) { [greif] + other_artists }

    before do
      get artists_path
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "renders the index template" do
      expect(response).to render_template(:index)
    end

    it "loads all artists" do
      expect(assigns(:artists)).to match_array(artists)
    end
  end

  describe 'GET #show' do
    let!(:artist) { create(:artist, :olivier_greif) }

    before do
      get artist_path(artist)
    end

    it 'returns a successful response' do
      expect(response).to be_successful
    end

    it 'renders the show template' do
      expect(response).to render_template(:show)
    end

    it 'assigns @artist' do
      expect(assigns(:artist).attributes).to eq(artist.decorate.attributes)
    end
  end
end
