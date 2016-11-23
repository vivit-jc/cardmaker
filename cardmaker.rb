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

html = "<!doctype html>\n<html>\n<head>\n<link href=\"./app.css\" rel=\"stylesheet\">\n</head>\n<body>\n<table border=1>\n<tr>\n"
cardarray.each_with_index do |c,i|
  html += "<td>\n<span class=\"name\">#{c[0]}</span><br>#{c[1]}\n</td>\n"
  html += "</tr>\n<tr>\n" if i%4 == 3
end

html += "</tr>\n</table>\n</body>\n</html>"

File.open(filename.split(".")[0]+".html","w") do |file|
  file.write html
end