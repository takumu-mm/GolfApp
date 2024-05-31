FactoryBot.define do
  factory :shared_video do
    user { association :user }
    video { association :video }
    body { "This is a shared video." }
  end
end
