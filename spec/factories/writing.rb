FactoryBot.define do
  factory :writing do
    date { Date.today }
    association :artist

    after(:build) do |writing|
      writing.content = ActionText::RichText.new(body: ActionText::Content.new("Sample rich text content"))
    end
  end
end
