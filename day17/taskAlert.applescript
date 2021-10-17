-- cerner_2tothe5th_2021
-- Alert notification for tasks added through https://github.com/SrinandanPai/cerner_2-5/blob/main/day11/task.sh

use framework "Foundation"
use scripting additions

set tasks to (do shell script "nl ~/.task")

set sayTasks to {current application's NSTask's launchedTaskWithLaunchPath:"/usr/bin/say" arguments:{do shell script "cat ~/.task"}}

try
	display alert "Task(s)" message tasks
	sayTasks's terminate()
on error
	try
		sayTasks's terminate()
	end try
end try
