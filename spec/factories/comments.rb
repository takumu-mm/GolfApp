FactoryBot.define do
  factory :comment do
    user { association :user }
    video { association :video }
    shared_video { association :shared_video }
    body { "This is a test comment." }
  end
end
