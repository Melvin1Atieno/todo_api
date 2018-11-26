FactoryBot.define do
    factory :item do
        name {Faker::StarWars.caharacter}
        done false
        todo_id nil
    end
end