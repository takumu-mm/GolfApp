FactoryBot.define do
  factory :profile do
    user
    score { "80s" }
    ball_type { "Straight" }
    strengths { [1, 2] } # 仮にカテゴリIDを配列で保存
    weakness { [3, 4] }
    sports_experience { "5 years" }
    avatar { "path/to/avatar.jpg" }
  end
end
