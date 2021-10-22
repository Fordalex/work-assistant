module ApplicationHelper
  def date_input(count)
    list = []
    count.times do
      plus = (7 * list.length)
      date = Date.new(2021, 10, 18) + plus.days
      list << date.strftime("%d %B %Y")
    end
    list
  end
end
