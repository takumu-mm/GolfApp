class CategoriesController < ApplicationController
  def show
    @category = Category.find_by(name: params[:name])
    @videos = @category.videos if @category

    @basic = Category.find_by(name: '基本')
    @address = @basic.children.find_by(name: 'アドレス')
    @grip = @basic.children.find_by(name: '握り方')
    @basic_swing = @basic.children.find_by(name: '基本スイング')

    @club = Category.find_by(name: 'クラブ')
    @driver = @club.children.find_by(name: 'ドライバー')
    @iron = @club.children.find_by(name: 'アイアン')
    @wood = @club.children.find_by(name: 'ウッド')
    @utility = @club.children.find_by(name: 'UT')
    @putter = @club.children.find_by(name: 'パター')

    @environment = Category.find_by(name: '環境')
    @bunkerr = @environment.children.find_by(name: 'バンカー')
    @rough = @environment.children.find_by(name: 'ラフ')
    @gradient = @environment.children.find_by(name: '傾斜')
    @strongwind = @environment.children.find_by(name: '強風')
    @rain = @environment.children.find_by(name: '雨')

    @green_around = Category.find_by(name: 'グリーン周り')
    @approach = @green_around.children.find_by(name: 'アプローチ')
    @lob_shot = @green_around.children.find_by(name: 'ロブショット')
    @ground_ball = @green_around.children.find_by(name: '転がし')

    @shot_miss = Category.find_by(name: 'ショットミス')
    @hook = @shot_miss.children.find_by(name: 'フック')
    @slice = @shot_miss.children.find_by(name: 'スライス')
    @duff = @shot_miss.children.find_by(name: 'ダフリ')
    @top = @shot_miss.children.find_by(name: 'トップ')
    @tempura = @shot_miss.children.find_by(name: 'テンプラ')

    @mastering_items = Category.find_by(name: '上達項目')
    @flight_distance = @mastering_items.children.find_by(name: '飛距離向上')
    @stability = @mastering_items.children.find_by(name: '安定性')
    @management = @mastering_items.children.find_by(name: 'コースマネジメント')

    @target = Category.find_by(name: '目標')
    @hundred = @target.children.find_by(name: '100切り')
    @ninety = @target.children.find_by(name: '90切り')
    @eighty = @target.children.find_by(name: '80切り')
  end
end
