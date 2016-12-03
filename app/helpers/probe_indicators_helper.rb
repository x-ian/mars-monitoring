module ProbeIndicatorsHelper
  def table_row_for(element)
    row = "<td>" + number_with_precision(@stats_today[element], :precision => 2, strip_insignificant_zeros: true).to_s + "</td>"
    row += "<td>" + number_with_precision(@stats_yesterday[element], :precision => 2, strip_insignificant_zeros: true).to_s + "</td>"
    row += "<td>" + number_with_precision(@stats_daysago7[element], :precision => 2, strip_insignificant_zeros: true).to_s + "</td>"
    row += "<td>" + number_with_precision(@stats_daysago30[element], :precision => 2, strip_insignificant_zeros: true).to_s + "</td>"
    row += "<td>" + number_with_precision(@stats_ever[element], :precision => 2, strip_insignificant_zeros: true).to_s + "</td>"
    return row.html_safe
  end
end
