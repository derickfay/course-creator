(* Generate syllabus schedule table in Numbers

- if assignments are include, it will also generate a table with the deadlines
- edit parameters below 
*)

set noWeeks to 10 -- 10 week course
set theDays to {"t", "r"} -- Tuesday and Thursday
-- options are m, t, w, r, f, s, u
set theStart to date "Monday, March 30, 2015 at 12:00:00 AM" -- Monday of the week courses start
set theHolidays to {date "Wednesday, May 27, 2015 at 12:00:00 AM"} -- include the date for any days class is cancelled here
set theAssignments to {{4, "r", "essay 1"}, {8, "r", "essay 2"}} -- Week 4 Thursday essay 1, Week 8 Thursday essay 2
set headerRows to 1 -- optional header (optional but script may break at this point if it's left out...)
set headerValue to "Course Schedule"
set final to {date "Saturday, June 6, 2015 at 12:00:00 AM", "final exam"} -- optionally include a date and description for a single item outside of the regular schedule

(* leave everything from here down alone *)

set totalRows to noWeeks * ((length of theDays) + 1) + headerRows
set headerColumn to {}
set bodyColumn to {}
set theDeadlines to {}

repeat with n from 1 to noWeeks
	set headerColumn to headerColumn & {"Week " & (n as string)}
	set bodyColumn to bodyColumn & {""}
	repeat with i in theDays
		set aDay to i as string
		(*		display dialog (aDay is "t") *)
		set addClass to false
		if aDay is "m" then
			set theDate to theStart + ((n - 1) * 7 * 86400)
			set addClass to true
		else if aDay is "t" then
			set theDate to theStart + ((n - 1) * 7 * 86400) + 86400
			set addClass to true
		else if aDay is "w" then
			set theDate to theStart + ((n - 1) * 7 * 86400) + (2 * 86400)
			set addClass to true
		else if aDay is "r" then
			set theDate to theStart + ((n - 1) * 7 * 86400) + (3 * 86400)
			set addClass to true
		else if aDay is "f" then
			set theDate to theStart + ((n - 1) * 7 * 86400) + (4 * 86400)
			set addClass to true
		else if aDay is "s" then
			set theDate to theStart + ((n - 1) * 7 * 86400) + (5 * 86400)
			set addClass to true
		else if aDay is "u" then
			set theDate to theStart + ((n - 1) * 7 * 86400) + (6 * 86400)
			set addClass to true
		end if
		
		set activityName to ""
		repeat with a in the theAssignments
			if n is item 1 of a then
				if aDay is item 2 of a then
					set activityName to item 3 of a
					set theDeadlines to theDeadlines & {{theDate, item 3 of a}}
				end if
			end if
		end repeat
		
		if addClass then
			set headerColumn to headerColumn & {theDate}
			if theDate is in theHolidays then
				set bodyColumn to bodyColumn & {"No Class"}
			else
				set bodyColumn to bodyColumn & activityName
			end if
		end if
		
	end repeat
end repeat


tell application "Numbers"
	activate
	set d to make new document
	tell d
		set s to make new sheet
		tell s
			delete every table
			set courseSchedule to make new table with properties {column count:2, row count:totalRows, name:"Course Schedule"}
			tell courseSchedule
				repeat with i from 1 to length of headerColumn
					tell cell (i + headerRows) of column 1
						set value to item i of headerColumn
					end tell
					tell cell (i + headerRows) of column 2
						set value to item i of bodyColumn
					end tell
				end repeat
				set the width of column 1 to 100
				set the width of column 2 to 200
				merge range "A1:B1"
				set value of cell 1 of row 1 to headerValue
			end tell
			
			if length of theDeadlines > 0 or final is not {} then
				set deadlineTable to make new table with properties {column count:2, row count:(length of theDeadlines) + 1, name:"Deadlines"}
				if length of theDeadlines > 0 then
					tell deadlineTable
						repeat with i from 1 to (length of theDeadlines)
							repeat with j from 1 to 2
								tell (cell (i + 1) of column j)
									set value to item j of (item i of theDeadlines)
								end tell
							end repeat
						end repeat
					end tell
				end if
				if final is not {} then
					tell deadlineTable
						make new row at end
						set value of cell 1 of last row to item 1 of final
						set value of cell 2 of last row to item 2 of final
					end tell
				end if
				tell deadlineTable
					set the width of column 1 to 100
					set the width of column 2 to 200
					merge range "A1:B1"
					set value of cell 1 of row 1 to "Deadlines"
					
				end tell
			end if
			
		end tell
	end tell
end tell