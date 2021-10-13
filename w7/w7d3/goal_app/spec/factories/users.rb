FactoryBot.define do
  factory :user do
    username{Faker::Movies::HarryPotter.character} #assign user to a random
    password {"password"}
  end
end
