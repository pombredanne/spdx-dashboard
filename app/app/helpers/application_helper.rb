module ApplicationHelper

  def friendly_date(datetime)
    str_formatter = "%B %d"
    str_formatter += ", %Y" unless datetime.year == Time.current.year
    str_formatter += " - %l:%M %P"
    date = datetime.strftime(str_formatter)
  end
end
