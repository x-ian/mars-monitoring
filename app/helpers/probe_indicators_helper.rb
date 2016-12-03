module ProbeIndicatorsHelper
  def table_row_for(element)
    row = "<td>" + @stats_today[element].to_s + "</td>"
    row += "<td>" + @stats_yesterday[element].to_s + "</td>"
    row += "<td>" + @stats_daysago7[element].to_s + "</td>"
    row += "<td>" + @stats_daysago30[element].to_s + "</td>"
    row += "<td>" + @stats_ever[element].to_s + "</td>"
    return row.html_safe
  end
end
