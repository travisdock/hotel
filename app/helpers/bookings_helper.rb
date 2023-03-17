module BookingsHelper
  def calendar_days(date)
    days = date.beginning_of_month..date.end_of_month
    start_offset = days.first.wday
    end_offset = 6 - days.last.wday
    days = days.to_a
    start_offset.times { days.prepend(days.first - 1.day) }
    end_offset.times { days.append(days.last + 1.day) }
    days
  end
end
