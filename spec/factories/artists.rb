FactoryBot.define do
  factory :artist do
    sequence(:firstname) { |n| "John-#{n}" }
    sequence(:lastname) { |n| "Dohn-#{n}" }
    birthdate { "2024-01-03" }
    deathdate { "2024-01-03" }
    sequence(:slug) { |n| "john-doe-#{n}" }

    trait :olivier_greif do
      firstname { "Olivier" }
      lastname  { "Greif" }
      birthdate { "1950-01-03" }
      deathdate { "2000-05-13" }
      slug { "olivier-greif" }
    end

    after(:build) do |artist|
      artist.bio = ActionText::RichText.new(body: ActionText::Content.new("Sample biography text"))
    end

    # after(:create) do |artist|
    #   create_list(:writing, 3, artist: artist)
    # end
  end
end
