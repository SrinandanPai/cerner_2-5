# cerner_2tothe5th_2021
# Program to get current time of different Cerner location 
require 'tzinfo'

# Public: Gets current time for a particular timezone
#
# Valid arguments are listed below.
# timezone_name - A String representing timezone name.
#
# Returns a canonical string representation of current time for a timezone
def current_time(timezone_name)
    TZInfo::Timezone.get(timezone_name).now.ctime
end

puts "UTC: #{Time.now.utc.ctime}"
puts "Bengaluru: #{current_time('Asia/Kolkata')}"
puts "Dublin: #{current_time('Europe/Dublin')}"
puts "KC: #{current_time('CST6CDT')}"
