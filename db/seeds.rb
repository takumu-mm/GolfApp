# 親カテゴリ
basic = Category.create(name: '基本')
club = Category.create(name: 'クラブ')
environment = Category.create(name: '環境')
green_around = Category.create(name: 'グリーン周り')
shot_miss = Category.create(name: 'ショットミス')
improvement = Category.create(name: '上達項目')
goal = Category.create(name: '目標')

# サブカテゴリ
Category.create(name: 'アドレス', ancestry: basic.id, search_keyword: 'アドレスの基本', related_keywords: 'スタンス, 構え, 基本')
Category.create(name: '握り方', ancestry: basic.id, search_keyword: 'クラブの握り方', related_keywords: 'グリップ, クラブ, 基本')
Category.create(name: '基本スイング', ancestry: basic.id, search_keyword: 'スイングの基本', related_keywords: 'スイング, ダウンスイング, フォロースイング, ショット, 回転, 上達法, 基本')

Category.create(name: 'ドライバー', ancestry: club.id, search_keyword: 'ドライバーの基本', related_keywords: 'ドライバーの打ち方, ショット, 上達法, 基本')
Category.create(name: 'アイアン', ancestry: club.id, search_keyword: 'アイアンの基本', related_keywords: 'アイアンの打ち方, ショット, 上達法, 基本')
Category.create(name: 'ウッド', ancestry: club.id, search_keyword: 'ウッドの基本', related_keywords: 'ウッドの打ち方, ショット, 上達法, 基本')
Category.create(name: 'ユーティリティ', ancestry: club.id, search_keyword: 'ユーティリティの基本', related_keywords: 'ユーティリティの打ち方, ショット, 上達法, 基本')
Category.create(name: 'パター', ancestry: club.id, search_keyword: 'パターの基本', related_keywords: 'ショートパット, ロングパット, 上達法, パット, 基本')

Category.create(name: 'バンカー', ancestry: environment.id, search_keyword: 'バンカーショット', related_keywords: 'バンカーの打ち方, ショット, 上達法, 基本')
Category.create(name: 'ラフ', ancestry: environment.id, search_keyword: 'ラフからの打ち方', related_keywords: 'ライ, ショット, 上達法, 基本')
Category.create(name: '強風', ancestry: environment.id, search_keyword: '強風対策',  related_keywords: '風, 低い球, 読み方')
Category.create(name: '雨', ancestry: environment.id, search_keyword: '雨の日', related_keywords: 'ラウンド, 濡れた, 硬い')

Category.create(name: 'アプローチ', ancestry: green_around.id, search_keyword: 'アプローチの基本', related_keywords: 'ショット, 30, 40, 50, 上達法, 基本')
Category.create(name: 'ロブショット', ancestry: green_around.id, search_keyword: 'ロブショットの打ち方', related_keywords: 'ロブ, ショット, 上達法, 基本')
Category.create(name: '転がし', ancestry: green_around.id, search_keyword: '転がしアプローチ', related_keywords: '転がす, ランニング, 上達法, 基本')

Category.create(name: 'フック', ancestry: shot_miss.id, search_keyword: 'フックの修正', related_keywords: 'チーピン, 引っかけ, ショット, 原因')
Category.create(name: 'スライス', ancestry: shot_miss.id, search_keyword: 'スライスの修正', related_keywords: '捕まえる, ショット, 原因')
Category.create(name: 'ダフリ', ancestry: shot_miss.id, search_keyword: 'ダフリの修正', related_keywords: 'ダフる, ダフり, ショット, ザックリ, 原因')
Category.create(name: 'トップ', ancestry: shot_miss.id, search_keyword: 'トップの修正', related_keywords: 'アプローチ, ショット, 原因')
Category.create(name: 'シャンク', ancestry: shot_miss.id, search_keyword: 'シャンクの修正', related_keywords: 'アプローチ, ショット, 原因')
Category.create(name: 'チャックリ', ancestry: shot_miss.id, search_keyword: 'チャックリの修正', related_keywords: 'アプローチ, ザックリ, 原因')
Category.create(name: 'テンプラ', ancestry: shot_miss.id, search_keyword: 'テンプラの修正', related_keywords: 'ドライバー, ショット, 天ぷら, 原因')

Category.create(name: '飛距離', ancestry: improvement.id, search_keyword: '飛距離を伸ばす方法', related_keywords: 'ドライバー, アイアン, ショット, 飛距離アップ, 上達法')
Category.create(name: '安定性', ancestry: improvement.id, search_keyword: 'スイングの安定性', related_keywords: 'ドライバー, アイアン, ショット, スイング, 方向性, 安定, 上達法, OB, 池')
Category.create(name: 'コースマネジメント', ancestry: improvement.id, search_keyword: 'コースマネジメント', related_keywords: 'スコア, マネジメント')

Category.create(name: '100切り', ancestry: goal.id, search_keyword: '100切りのコツ', related_keywords: 'スコア, マネジメント, 考え方')
Category.create(name: '90切り', ancestry: goal.id, search_keyword: '90切りのコツ', related_keywords: 'スコア, マネジメント, 考え方')
Category.create(name: '80切り', ancestry: goal.id, search_keyword: '80切りのコツ', related_keywords: 'スコア, マネジメント, 考え方')