FactoryBot.define do
  factory :subproject do
    name {Faker::Music.band}
    description {Faker::Music.album}
end
end
