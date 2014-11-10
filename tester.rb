# poss = ["r", "g", "b", "y"]
# layout = ["r", "g", "b", "y"]
# guess = ["b", "b", "r", "r"]
#
# layout_counts = Hash.new
# layout.map { |letter| layout_counts[letter] = layout.count(letter) }
#
# guess_counts = Hash.new(0)
# guess.map { |letter| guess_counts[letter] = guess.count(letter) }
#
# puts layout_counts
# puts guess_counts
# correct_colors = 0
#
# poss.each do |element|
#   correct_colors = correct_colors + [guess_counts[element], layout_counts[element]].min
# end
#
#
# puts correct_colors


layout = "rrgb"            # => "rrgb"
layout = layout.split('')  # => ["r", "r", "g", "b"]

layout_counts = Hash.new(0)                           # => {}
layout.map { |element| layout_counts[element] += 1 }  # => [1, 2, 1, 1]

puts layout_counts  # => nil

# >> {"r"=>2, "g"=>1, "b"=>1}
