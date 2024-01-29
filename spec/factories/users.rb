FactoryBot.define do
  factory :user do
    firstname { "John" }
    lastname { "Doe" }
    email { "john@doe.com" }
    password { "y5+j2Z67QXGUA4_Y" }
    role { "admin" }

    trait :admin do
      firstname { "John" }
      lastname { "Doe" }
      email { "john@doe.com" }
      password { "y5+j2Z67QXGUA4_Y" }
      role { "admin" }
    end
  end
end
