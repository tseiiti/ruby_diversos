
def distance(from, to)
  h = to_float(from, to)
  d2r = 0.017453292519943295769236

  dis_lat = (h[:to_lat] - h[:fr_lat]) * d2r
  dis_lon = (h[:to_lon] - h[:fr_lon]) * d2r

  tmp_sin = Math.sin(dis_lat / 2.0)
  tmp_cos = Math.cos(h[:fr_lat] * d2r)
  tmp_tan = Math.sin(dis_lon / 2.0)

  aux = tmp_sin ** 2 + tmp_cos ** 2 * tmp_tan ** 2
  cmp = 2.0 * Math.atan2(Math.sqrt(aux), Math.sqrt(1.0 - aux))

  (6368.1 * cmp * 1000.0).round
end

def direction(from, to)
  h = to_float(from, to)
  dis_a = (h[:to_lat] - h[:fr_lat]) * 111300
  dis_b = (h[:to_lon] - h[:fr_lon]) * 111300
  ang = Math.atan(dis_a.abs / dis_b.abs) * (180 / Math::PI)
  ang = ang.round(2)
  if h[:to_lat] <= h[:fr_lat] && h[:to_lon] >= h[:fr_lon]
    "#{ang} se"
  elsif h[:to_lat] < h[:fr_lat] && h[:to_lon] <= h[:fr_lon]
    "#{180 - ang} so"
  elsif h[:to_lat] >= h[:fr_lat] && h[:to_lon] <= h[:fr_lon]
    "#{180 + ang} no"
  elsif h[:to_lat] >= h[:fr_lat] && h[:to_lon] >= h[:fr_lon]
    "#{360 - ang} ne"
  else
    "999.99"
  end
end

def to_float(from, to)
  h = {}
  h[:fr_lat] = from.split(',')[0].to_f
  h[:fr_lon] = from.split(',')[1].to_f
  h[:to_lat] = to.split(',')[0].to_f
  h[:to_lon] = to.split(',')[1].to_f
  h
end

puts direction('-23.61, -46.66', '-23.61, -46.65').to_s + " 0e"
puts direction('-23.61, -46.66', '-23.615, -46.65').to_s + " 23se"
puts direction('-23.61, -46.66', '-23.62, -46.65').to_s + " 45se"
puts direction('-23.61, -46.66', '-23.62, -46.655').to_s + " 68se"
puts direction('-23.61, -46.66', '-23.62, -46.66').to_s + " 90s"
puts direction('-23.61, -46.66', '-23.62, -46.665').to_s + " 113so"
puts direction('-23.61, -46.66', '-23.62, -46.67').to_s + " 135so"
puts direction('-23.61, -46.66', '-23.615, -46.67').to_s + " 158so"
puts direction('-23.61, -46.66', '-23.61, -46.67').to_s + " 180o"
puts direction('-23.61, -46.66', '-23.605, -46.67').to_s + " 203o"
puts direction('-23.61, -46.66', '-23.60, -46.67').to_s + " 225no"
puts direction('-23.61, -46.66', '-23.60, -46.665').to_s + " 248no"
puts direction('-23.61, -46.66', '-23.60, -46.66').to_s + " 270n"
puts direction('-23.61, -46.66', '-23.60, -46.655').to_s + " 293n"
puts direction('-23.61, -46.66', '-23.60, -46.65').to_s + " 315ne"
puts direction('-23.61, -46.66', '-23.605, -46.65').to_s + " 338ne"

# (-10..10).each do |e|
#   (-10..10).each do |f|
#     ang = direction('-23.610, -46.660', "-23.#{610 + e}, -46.#{660 + f} ")
#     puts "-23.#{610 + e},-46.#{660 + f} " + ang.to_s
#   end
# end

# puts distance('-23.608865, -46.659557', '-23.553013, -46.791810')
# puts direction('-23.5083139, -46.6424806', '-23.5101389, -46.6313917') # > <
# puts direction('-23.5101389, -46.6313917', '-23.5083139, -46.6424806') # < >
# puts direction('-23.608205, -46.658984', '-23.594165, -46.637913') # < <

# puts direction('-23.606256, -46.657063', '-23.610532, -46.661140') #so
# puts direction('-23.610532, -46.661140', '-23.608389, -46.664380') #no
# puts direction('-23.608389, -46.664380', '-23.604988, -46.660443') #ne
# puts direction('-23.604988, -46.660443', '-23.606256, -46.657063') #se

# puts direction('-23.606256, -46.657063', '-23.608389, -46.664380') #o
# puts direction('-23.610532, -46.661140', '-23.604988, -46.660443') #n
# puts direction('-23.608389, -46.664380', '-23.606256, -46.657063') #e
# puts direction('-23.604988, -46.660443', '-23.610532, -46.661140') #s

# puts direction('-23.61, -46.66', '-23.61, -46.66') #

