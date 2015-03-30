(* Generate syllabus table in Markdown
by Derick Fay, March 2015
this version generates tables: 

Week 1 
Day 1
Day 2 *)

set noWeeks to 10 -- 10 week course
set theDays to "mwf" -- Tuesday and Thursday
-- options are m, t, w, r, f, s, u

set theStart to date "Monday, March 30, 2015 at 12:00:00 AM" -- Monday of the week courses start
set theHolidays to {date "Wednesday, May 27, 2015 at 12:00:00 AM"}

-- leave everything below here alone

set theString to "|Course Schedule|
|-|-|-|
"
set theColumns to "| |
" --the blank column for the Week

set currentClass to 1

repeat with n from 1 to noWeeks
	set theString to theString & "|**Week " & (n as string) & "**| |
"
	
	if theDays contains "m" then
		set theDate to theStart + ((n - 1) * 7 * 86400)
		set theString to (theString & "|" & (((weekday of theDate as string)) & " " & month of theDate as string) & " " & day of theDate as string) & "|"
		if check(theDate, theHolidays) then
			set theString to theString & "**No Class**"
		end if
		set currentClass to currentClass + 1
		set theString to theString & " |
"
	end if
	if theDays contains "t" then
		set theDate to theStart + ((n - 1) * 7 * 86400) + 86400
		set theString to (theString & "|" & (((weekday of theDate as string)) & " " & month of theDate as string) & " " & day of theDate as string) & "|"
		if check(theDate, theHolidays) then
			set theString to theString & "**No Class**"
		end if
		set currentClass to currentClass + 1
		set theString to theString & " |
"
	end if
	if theDays contains "w" then
		set theDate to theStart + ((n - 1) * 7 * 86400) + (2 * 86400)
		set theString to (theString & "|" & (((weekday of theDate as string)) & " " & month of theDate as string) & " " & day of theDate as string) & "|"
		if check(theDate, theHolidays) then
			set theString to theString & "**No Class**"
		end if
		set currentClass to currentClass + 1
		set theString to theString & " |
"
	end if
	if theDays contains "r" then
		set theDate to theStart + ((n - 1) * 7 * 86400) + (3 * 86400)
		set theString to (theString & "|" & (((weekday of theDate as string)) & " " & month of theDate as string) & " " & day of theDate as string) & "|"
		if check(theDate, theHolidays) then
			set theString to theString & "**No Class**"
		end if
		set currentClass to currentClass + 1
		set theString to theString & " |
"
	end if
	if theDays contains "f" then
		set theDate to theStart + ((n - 1) * 7 * 86400) + (4 * 86400)
		set theString to (theString & "|" & (((weekday of theDate as string)) & " " & month of theDate as string) & " " & day of theDate as string) & "|"
		if check(theDate, theHolidays) then
			set theString to theString & "**No Class**"
		end if
		set currentClass to currentClass + 1
		set theString to theString & " |
"
	end if
	if theDays contains "s" then
		set theDate to theStart + ((n - 1) * 7 * 86400) + (5 * 86400)
		set theString to (theString & "|" & (((weekday of theDate as string)) & " " & month of theDate as string) & " " & day of theDate as string) & "|"
		if check(theDate, theHolidays) then
			set theString to theString & "**No Class**"
		end if
		set currentClass to currentClass + 1
		set theString to theString & " |
"
	end if
	if theDays contains "u" then
		set theDate to theStart + ((n - 1) * 7 * 86400) + (6 * 86400)
		set theString to (theString & "|" & (((weekday of theDate as string)) & " " & month of theDate as string) & " " & day of theDate as string) & "|"
		if check(theDate, theHolidays) then
			set theString to theString & "**No Class**"
		end if
		set currentClass to currentClass + 1
		set theString to theString & " |
"
	end if
end repeat
set the clipboard to theString

on check(d, h)
	if h is in d then
		true
	else
		false
	end if
end check