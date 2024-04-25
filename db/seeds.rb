# 親カテゴリ
basic = Category.create(name: '基本')
club = Category.create(name: 'クラブ')
environment = Category.create(name: '環境')
green_around = Category.create(name: 'グリーン周り')
shot_miss = Category.create(name: 'ショットミス')
improvement = Category.create(name: '上達項目')
goal = Category.create(name: '目標')

# サブカテゴリ
Category.create(name: 'アドレス', ancestry: basic.id)
Category.create(name: '握り方', ancestry: basic.id)
Category.create(name: '基本スイング', ancestry: basic.id)

Category.create(name: 'ドライバー', ancestry: club.id)
Category.create(name: 'アイアン', ancestry: club.id)
Category.create(name: 'ウッド', ancestry: club.id)
Category.create(name: 'UT', ancestry: club.id)
Category.create(name: 'パター', ancestry: club.id)

Category.create(name: 'バンカー', ancestry: environment.id)
Category.create(name: 'ラフ', ancestry: environment.id)
Category.create(name: '強風', ancestry: environment.id)
Category.create(name: '雨', ancestry: environment.id)

Category.create(name: 'アプローチ', ancestry: green_around.id)
Category.create(name: 'ロブショット', ancestry: green_around.id)
Category.create(name: '転がし', ancestry: green_around.id)

Category.create(name: 'フック', ancestry: shot_miss.id)
Category.create(name: 'スライス', ancestry: shot_miss.id)
Category.create(name: 'ダフリ', ancestry: shot_miss.id)
Category.create(name: 'トップ', ancestry: shot_miss.id)
Category.create(name: 'テンプラ', ancestry: shot_miss.id)

Category.create(name: '飛距離向上', ancestry: improvement.id)
Category.create(name: '安定性', ancestry: improvement.id)
Category.create(name: 'コースマネジメント', ancestry: improvement.id)

Category.create(name: '100切り', ancestry: goal.id)
Category.create(name: '90切り', ancestry: goal.id)
Category.create(name: '80切り', ancestry: goal.id)