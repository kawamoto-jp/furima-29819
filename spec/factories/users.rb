FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials}
    email                 {Faker::Internet.free_email}
    password              {"aaaaa111"}
    password_confirmation {password}
    last_name             {"山田"}
    first_name            {"太郎"}
    last_name_reading     {"ヤマダ"}
    first_name_reading    {"タロウ"}
    birthday              {"1995-04-19"}
  end
end

# Faker::Internet.password(min_length: 6)