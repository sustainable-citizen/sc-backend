FactoryBot.define do
  factory :user_challenge do
    user_challenge_id { 1 }
    user_id { 1 }
    challenge_id { 1 }
    accept_date { "2018-11-25 20:37:16" }
    status { 1 }
  end
end
