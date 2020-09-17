FactoryBot.define do
  factory :buying_buyer do
    postal_code     {"123-4567"}
    prefectures_id  {3}
    city            {"横浜市"}
    address         {"ひのき坂2番地1"}
    building_name   {"ドミールあさひ"}
    tel             {"08088887777"}
    user_id         {3}
    item_id         {4}
  end
end
