
FactoryBot.define do
    factory :todo do
        title { Faker::Lorem.word}
        created_by {Faker::NUmber.number(10)}
    end
end