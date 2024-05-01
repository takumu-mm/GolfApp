# 親カテゴリ
basic = Category.create(name: '基本')
club = Category.create(name: 'クラブ')
environment = Category.create(name: '環境')
green_around = Category.create(name: 'グリーン周り')
shot_miss = Category.create(name: 'ショットミス')
improvement = Category.create(name: '上達項目')
goal = Category.create(name: '目標')

# サブカテゴリ
Category.create(name: 'アドレス', ancestry: basic.id, search_keyword: 'アドレスの基本', related_keywords: 'スタンス, 構え, 構え方')
Category.create(name: '握り方', ancestry: basic.id, search_keyword: 'クラブの握り方', related_keywords: 'グリップ')
Category.create(name: '基本スイング', ancestry: basic.id, search_keyword: 'スイングの基本', related_keywords: 'スイング, ダウンスイング, フォロースイング, ショット, 振り方')

Category.create(name: 'ドライバー', ancestry: club.id, search_keyword: 'ドライバーの基本', related_keywords: 'ドライバーの打ち方, ドライバーショット')
Category.create(name: 'アイアン', ancestry: club.id, search_keyword: 'アイアンの基本', related_keywords: 'アイアンの打ち方, アイアンショット')
Category.create(name: 'ウッド', ancestry: club.id, search_keyword: 'ウッドの基本', related_keywords: 'ウッドの打ち方, FW')
Category.create(name: 'ユーティリティ', ancestry: club.id, search_keyword: 'ユーティリティの基本', related_keywords: 'ユーティリティの打ち方, UT, HB')
Category.create(name: 'パター', ancestry: club.id, search_keyword: 'パターの基本', related_keywords: 'ショートパット, ロングパット, パット, パッティング')

Category.create(name: 'バンカー', ancestry: environment.id, search_keyword: 'バンカーショット', related_keywords: 'バンカーの打ち方, バンカーショット')
Category.create(name: 'ラフ', ancestry: environment.id, search_keyword: 'ラフからの打ち方', related_keywords: 'ライ')
Category.create(name: '傾斜', ancestry: environment.id, search_keyword: '傾斜からの打ち方', related_keywords: 'つま先上がり, つま先下がり, 右足上がり, 右足下がり')
Category.create(name: '強風', ancestry: environment.id, search_keyword: '強風対策',  related_keywords: '風, 低い球, 読み方')
Category.create(name: '雨', ancestry: environment.id, search_keyword: '雨の日のラウンド', related_keywords: 'ラウンド, 濡れた, 硬い')

Category.create(name: 'アプローチ', ancestry: green_around.id, search_keyword: 'アプローチの基本', related_keywords: 'アプローチの基本')
Category.create(name: 'ロブショット', ancestry: green_around.id, search_keyword: 'ロブショットの打ち方', related_keywords: 'ロブ, ふんわり')
Category.create(name: '転がし', ancestry: green_around.id, search_keyword: '転がしアプローチ', related_keywords: '転がす, ランニング')

Category.create(name: 'フック', ancestry: shot_miss.id, search_keyword: 'フックの修正', related_keywords: 'チーピン, 引っかけ, 原因')
Category.create(name: 'スライス', ancestry: shot_miss.id, search_keyword: 'スライスの修正', related_keywords: '捕まえる, 原因')
Category.create(name: 'ダフリ', ancestry: shot_miss.id, search_keyword: 'ダフリの修正', related_keywords: 'ダフる, ダフり, ザックリ, 原因')
Category.create(name: 'トップ', ancestry: shot_miss.id, search_keyword: 'トップの原因', related_keywords: 'チョロ, 原因')
Category.create(name: 'シャンク', ancestry: shot_miss.id, search_keyword: 'シャンクの修正', related_keywords: '原因')
Category.create(name: 'チャックリ', ancestry: shot_miss.id, search_keyword: 'チャックリの修正', related_keywords: 'アプローチ, ザックリ, 原因')
Category.create(name: 'テンプラ', ancestry: shot_miss.id, search_keyword: 'テンプラの修正', related_keywords: 'ドライバー, 天ぷら, 原因')

Category.create(name: '飛距離', ancestry: improvement.id, search_keyword: '飛距離を伸ばす方法', related_keywords: 'ドライバー, アイアン, 飛距離アップ')
Category.create(name: '安定性', ancestry: improvement.id, search_keyword: 'スイングの安定性', related_keywords: 'ドライバー, アイアン, スイング, 方向性, 安定, OB, 池')
Category.create(name: 'コースマネジメント', ancestry: improvement.id, search_keyword: 'コースマネジメント', related_keywords: 'スコア, マネジメント')

Category.create(name: '100切り', ancestry: goal.id, search_keyword: '100切りのコツ', related_keywords: 'スコア, マネジメント, 考え方')
Category.create(name: '90切り', ancestry: goal.id, search_keyword: '90切りのコツ', related_keywords: 'スコア, マネジメント, 考え方')
Category.create(name: '80切り', ancestry: goal.id, search_keyword: '80切りのコツ', related_keywords: 'スコア, マネジメント, 考え方')