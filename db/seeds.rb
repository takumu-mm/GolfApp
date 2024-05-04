# 親カテゴリ
basic = Category.create(name: 'basic')
club = Category.create(name: 'club')
environment = Category.create(name: 'environment')
green_around = Category.create(name: 'green_around')
shot_miss = Category.create(name: 'shot_miss')
improvement = Category.create(name: 'mastering_items')
goal = Category.create(name: 'target')

# サブカテゴリ
Category.create(name: 'address', ancestry: basic.id, search_keyword: 'アドレスの基本', related_keywords: 'アドレス, スタンス, 構え, 構え方')
Category.create(name: 'grip', ancestry: basic.id, search_keyword: 'クラブの握り方', related_keywords: 'グリップ, 握り方')
Category.create(name: 'basic_swing', ancestry: basic.id, search_keyword: 'スイングの基本', related_keywords: 'スイング, ダウンスイング, フォロースイング, ショット, 振り方, 基本スイング')

Category.create(name: 'driver', ancestry: club.id, search_keyword: 'ドライバーの基本', related_keywords: 'ドライバーの打ち方, ドライバーショット, ドライバー')
Category.create(name: 'iron', ancestry: club.id, search_keyword: 'アイアンの基本', related_keywords: 'アイアンの打ち方, アイアンショット, アイアン')
Category.create(name: 'wood', ancestry: club.id, search_keyword: 'ウッドの基本', related_keywords: 'ウッドの打ち方, FW, ウッド')
Category.create(name: 'utility', ancestry: club.id, search_keyword: 'ユーティリティの基本', related_keywords: 'ユーティリティの打ち方, UT, HB, ユーティリティ')
Category.create(name: 'putter', ancestry: club.id, search_keyword: 'パターの基本', related_keywords: 'ショートパット, ロングパット, パット, パッティング, パター')

Category.create(name: 'bunker', ancestry: environment.id, search_keyword: 'バンカーショット', related_keywords: 'バンカーの打ち方, バンカーショット, バンカー')
Category.create(name: 'rough', ancestry: environment.id, search_keyword: 'ラフからの打ち方', related_keywords: 'ライ, ラフ')
Category.create(name: 'gradient', ancestry: environment.id, search_keyword: '傾斜からの打ち方', related_keywords: 'つま先上がり, つま先下がり, 右足上がり, 右足下がり, 傾斜')
Category.create(name: 'strong_wind', ancestry: environment.id, search_keyword: '強風対策',  related_keywords: '風, 低い球, 読み方, 強風')
Category.create(name: 'rain', ancestry: environment.id, search_keyword: '雨の日のラウンド', related_keywords: 'ラウンド, 濡れた, 硬い, 雨')

Category.create(name: 'approach', ancestry: green_around.id, search_keyword: 'アプローチの基本', related_keywords: 'アプローチの基本, アプローチ')
Category.create(name: 'lob_shot', ancestry: green_around.id, search_keyword: 'ロブショットの打ち方', related_keywords: 'ロブ, ふんわり, ロブショット')
Category.create(name: 'ground_ball', ancestry: green_around.id, search_keyword: '転がしアプローチ', related_keywords: '転がす, ランニング, 転がし')

Category.create(name: 'hook', ancestry: shot_miss.id, search_keyword: 'フックの修正', related_keywords: 'チーピン, 引っかけ, 原因, フック')
Category.create(name: 'slice', ancestry: shot_miss.id, search_keyword: 'スライスの修正', related_keywords: '捕まえる, 原因, スライス')
Category.create(name: 'duff', ancestry: shot_miss.id, search_keyword: 'ダフリの修正', related_keywords: 'ダフる, ダフり, ザックリ, 原因, ダフリ')
Category.create(name: 'topped_shot', ancestry: shot_miss.id, search_keyword: 'トップの原因', related_keywords: 'チョロ, トップ, トップの原因')
Category.create(name: 'shank', ancestry: shot_miss.id, search_keyword: 'シャンクの修正', related_keywords: 'シャンク, 原因')
Category.create(name: 'chunk', ancestry: shot_miss.id, search_keyword: 'チャックリの修正', related_keywords: 'チャックリ, アプローチ, ザックリ, 原因')
Category.create(name: 'skied_ball', ancestry: shot_miss.id, search_keyword: 'テンプラの修正', related_keywords: 'テンプラ, ドライバー, 天ぷら, 原因')

Category.create(name: 'flight_distance', ancestry: improvement.id, search_keyword: '飛距離を伸ばす方法', related_keywords: '飛距離, ドライバー, アイアン, 飛距離アップ')
Category.create(name: 'stability', ancestry: improvement.id, search_keyword: 'スイングの安定性', related_keywords: '安定性, ドライバー, アイアン, スイング, 方向性, 安定, OB, 池')
Category.create(name: 'management', ancestry: improvement.id, search_keyword: 'コースマネジメント', related_keywords: 'コースマネジメント, スコア, マネジメント')

Category.create(name: 'hundred_or_less', ancestry: goal.id, search_keyword: '100切りのコツ', related_keywords: '100切り, スコア, マネジメント, 考え方')
Category.create(name: 'ninety_or_less', ancestry: goal.id, search_keyword: '90切りのコツ', related_keywords: '90切り, スコア, マネジメント, 考え方')
Category.create(name: 'eighty_or_less', ancestry: goal.id, search_keyword: '80切りのコツ', related_keywords: '80切り, スコア, マネジメント, 考え方')