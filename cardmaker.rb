cardarray = []
filename = ARGV[0]
open(filename) do |file|
  while l = file.gets
    str = l.strip.split(",")
    str[0].to_i.times do |i|
      cardarray.push [str[1],str[2]]
    end
  end
end

html = "<html><head><link href=\"./app.css\" rel=\"stylesheet\"></head><body><table border=1><tr>"
cardarray.each_with_index do |c,i|
  html += "<td><span class=\"name\">#{c[0]}</span><br>#{c[1]}</td>"
  html += "</tr><tr>" if i%4 == 3
end

html += "</tr></table></body></html>"

File.open(filename.split(".")[0]+".html","w") do |file|
  file.write html
end