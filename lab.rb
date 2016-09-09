my_file = File.open('lab_frequencies.txt', 'r')
final_file = my_file.read


final_file.gsub!(/[.]/, "")
final_file.gsub!(/[!]/, "")
final_file.gsub!(/[,]/, "")
final_file.gsub!(/["]/, "")
final_file.gsub!(/['~]/, "")
final_file.gsub!(/[?]/, "")

words = final_file.split(" ")
# p words

frequencies = Hash.new(0)

words.each { |el| frequencies[el] += 1 }

sorted = frequencies.sort_by {|a, b| b}.reverse!

# p sorted

File.open('bananas.html', 'w') do |el|

  el.puts "<table>"

  sorted.each do |f|
    el.puts "<tr><td><b>#{f[0]}</b></td><td><b>#{f[1]}</b></td></tr>"
  end

  el.puts "</table>"
end
