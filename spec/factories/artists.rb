FactoryBot.define do
  factory :artist do
    firstname { "John" }
    lastname { "Doe" }
    birthdate { "2024-01-03" }
    deathdate { "2024-01-03" }

    after(:build) do |artist|
      artist.bio = ActionText::RichText.new(body: ActionText::Content.new("Sample biography text"))
    end

    # after(:create) do |artist|
    #   create_list(:writing, 3, artist: artist)
    # end
  end
end
