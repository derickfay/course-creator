(* Generate syllabus table in HTML & copy it to the clipboard
by Derick Fay, June 2013 *)

set noWeeks to 10 -- 10 week course
set theDays to "mwf" -- Tuesday and Thursday
-- options are m, t, w, r, f, s, u
set theStart to date "Monday, March 31, 2014 at 12:00:00 AM" -- Monday of the week courses start
-- leave everything below here alone

set theString to "<table>"
set theColumns to "<td></td>" --the blank column for the Week
repeat with i from 1 to length of theDays
	set theColumns to theColumns & "<td></td>"
end repeat
repeat with n from 1 to noWeeks
	set theString to theString & "<tr><td>Week " & (n as string) & "</td>"
	if theDays contains "m" then
		set theDate to theStart + ((n - 1) * 7 * 86400)
		set theString to (theString & "<td>" & (((weekday of theDate as string)) & " " & month of theDate as string) & " " & day of theDate as string) & "</td>"
	end if
	if theDays contains "t" then
		set theDate to theStart + ((n - 1) * 7 * 86400) + 86400
		set theString to (theString & "<td>" & (((weekday of theDate as string)) & " " & month of theDate as string) & " " & day of theDate as string) & "</td>"
	end if
	if theDays contains "w" then
		set theDate to theStart + ((n - 1) * 7 * 86400) + (2 * 86400)
		set theString to (theString & "<td>" & (((weekday of theDate as string)) & " " & month of theDate as string) & " " & day of theDate as string) & "</td>"
	end if
	if theDays contains "r" then
		set theDate to theStart + ((n - 1) * 7 * 86400) + (3 * 86400)
		set theString to (theString & "<td>" & (((weekday of theDate as string)) & " " & month of theDate as string) & " " & day of theDate as string) & "</td>"
	end if
	if theDays contains "f" then
		set theDate to theStart + ((n - 1) * 7 * 86400) + (4 * 86400)
		set theString to (theString & "<td>" & (((weekday of theDate as string)) & " " & month of theDate as string) & " " & day of theDate as string) & "</td>"
	end if
	if theDays contains "s" then
		set theDate to theStart + ((n - 1) * 7 * 86400) + (5 * 86400)
		set theString to (theString & "<td>" & (((weekday of theDate as string)) & " " & month of theDate as string) & " " & day of theDate as string) & "</td>"
	end if
	if theDays contains "u" then
		set theDate to theStart + ((n - 1) * 7 * 86400) + (6 * 86400)
		set theString to (theString & "<td>" & (((weekday of theDate as string)) & " " & month of theDate as string) & " " & day of theDate as string) & "</td>"
	end if
	set theString to theString & "</tr><tr>" & theColumns & "</tr>"
end repeat
set theString to theString & "</table>"
set the clipboard to theString
