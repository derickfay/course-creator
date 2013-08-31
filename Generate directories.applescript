(* Generate directories
Generates a standard directory template for a course *)

set theDir to "~/Data/teaching"
set theCourse to "env"
set theTerm to "14win"
set TAs to true

-- edit the above

set theCommand to "mkdir " & theDir & "/" & theCourse & "-" & theTerm
do shell script theCommand
do shell script theCommand & "/assignments"
do shell script theCommand & "/grading"
do shell script theCommand & "/handouts"
do shell script theCommand & "/slides"
if TAs then
	do shell script theCommand & "/TAs"
end if

