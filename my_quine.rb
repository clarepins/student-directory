# here are 2 short Quines 

puts <<2*2,2
puts <<2*2,2
2

# "puts <<2" - print all the text from after this statement until 
# you reach the string "2". ...."*2" - Print that string twice ....",2" - 
# And then print the value 2 The second "puts <<2*2,2" is just text, and the 
# final "2" is the delimiter.

eval s=%q((puts"eval s=%q(#{s})"))

# %q works like single quotation marks 