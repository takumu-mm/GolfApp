FactoryBot.define do
  factory :profile do
    user
    score { "80台" }
    ball_type { "Straight" }
    strengths { [1, 2] }
    weakness { [3, 4] }
    sports_experience { "5 years" }
    avatar { "path/to/avatar.jpg" }
  end
end
