module ApplicationHelper
  def unit_to_number(number)
    case number
    when 0..9999
      number.to_s
    when 10_000..999_999
      "#{(number / 1000.0).round(1).to_s.sub(/\.0$/, '')}万"
    when 1_000_000..999_999_999
      # 100万単位で表示
      "#{(number / 1_000_000).to_s}00万"
    else
      # 億単位で表示
      billions = number / 1_000_000_000
      millions = (number % 1_000_000_000) / 1_000_000
      if millions == 0
        "#{billions}億"
      else
        "#{billions}億#{millions}万"
      end
    end
  end
end
