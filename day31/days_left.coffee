# cerner_2tothe5th_2021
# Print days left

DAY = 1000 * 60 * 60  * 24

days_left = Math.round((new Date("2021-11-2") - new Date( ))/ DAY)

console.log "Cerner 2^5 2021"
console.log if days_left > 0 then "#{days_left} day(s) left!!!" else "Times Up!!!"
