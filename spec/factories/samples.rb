# spec/factories/samples.rb
FactoryBot.define do
  factory :sample do
    title { Faker::Lorem.word }
  end
end