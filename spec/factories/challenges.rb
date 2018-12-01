FactoryBot.define do
  factory :challenge do
    challenge_id { 1 }
    name { "MyString" }
    description { "MyString" }
    start_date { "2018-11-25 20:05:36" }
    end_date { "2018-11-25 20:05:36" }
    author_id { "" }
  end
end
