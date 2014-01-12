(* Find day TTh

I got tired of always needing to scroll through my syllabus to find the next class.

Given a pdf syllabus for a TTh class in which dates are written Day Month Date, e.g. Monday January 9,
this script will open the syllabus to the next class *)

tell application "Skim"
	open "syllabus.pdf" --edit for your filename
	set theWeekday to (weekday of (current date) as string)
	set theDate to (current date)
	
	if theWeekday = "Monday" then
		set theDate to (current date) + 86400
	else if theWeekday = "Wednesday" then
		set theDate to (current date) + 86400
	else if theWeekday = "Friday" then
		set theDate to (current date) + (4 * 86400)
	else if theWeekday = "Saturday" then
		set theDate to (current date) + (3 * 86400)
	else if theWeekday = "Sunday" then
		set theDate to (current date) + (2 * 86400)
	end if
	
	set searchTerm to (weekday of theDate as string) & " " & (month of theDate as string) & " " & (day of theDate as string)
	set theResult to find document 1 text searchTerm
	go document 1 to theResult
	return searchTerm
end tell
