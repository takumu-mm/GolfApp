module ApplicationHelper
  def unit_to_number(number)
    case number
    when 0..9999
      number.to_s
    when 10_000..99_999
      # 「1万」単位で表示し、小数第一位まで表示
      "#{(number / 10000.0).floor(1)}万"
    when 100_000..999_999
      "#{(number / 10000.0).floor}万"  # 10万単位から1万単位に切り捨てで修正
    when 1_000_000..999_999_999
      "#{(number / 10000.0).floor}万"  # 100万単位から1万単位に切り捨てで修正
    else
      # 億単位で表示
      billions = number / 1_000_000_000
      millions = (number % 1_000_000_000) / 1_000_000
      if millions.zero?
        "#{billions}億"
      else
        "#{billions}億#{(millions / 10000.0).floor}万"
      end
    end
  end
end