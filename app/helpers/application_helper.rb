module ApplicationHelper

  def friendly_date(datetime)
    return "n/a" if datetime.nil?
    str_formatter = "%b %d"
    str_formatter += ", %Y" unless datetime.year == Time.current.year
    date = datetime.strftime(str_formatter)
  end

  def friendly_time(datetime)
    datetime.strftime("%l:%M %P")
  end

  def comments_header(owner)
    header = link_to("SPDX Docs", root_path)

    if owner.is_a? SpdxDoc
      header += raw " > #{link_to owner.name, owner} > Comments"
    elsif owner.is_a? Package
      header += raw " > #{link_to owner.spdx_doc.name, owner.spdx_doc} > Package > Comments"
    end

    header  
  end
end
