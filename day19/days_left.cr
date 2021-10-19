# cerner_2tothe5th_2021
# Random character generator to print days left
#
# How to install and run?
# brew install crystal
# crystal crystal days_left.cr
# Ref:https://crystal-lang.org/

word = "Cerner 2^5 2021 'Engineering Collaboration' - "

if Time.utc < Time.utc(2021, 11, 2, 0, 0, 0)
  word += "#{(Time.utc(2021, 11, 2, 0, 0, 0) - Time.utc).days} days left!!!"
else
  word += "Oops you are late!!!"
end

def find_char(target_char)
  random_char = rand(32..126).chr
  print random_char

  while target_char != random_char
    random_char = rand(32..126).chr
    print "\b#{random_char}"
    sleep(0.005)
  end
end

word.chars.map do |c|
  find_char(c)
end
