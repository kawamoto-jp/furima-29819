FactoryBot.define do
  factory :buyer do
    postal_code     {123-4567}
    prefectures_id  {3}
    city            {"横浜市"}
    address         {"ひのき坂2番地1"}
    building_name   {"ドミールあさひ"}
    tel             {"08088887777"}
    association :buying
  end
end
