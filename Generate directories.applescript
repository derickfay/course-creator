(* Generate directories
Generates a standard directory template for a course *)

set theDir to "~/Data/teaching"
set theCourse to "env"
set theTerm to "16win"
set TAs to true

-- edit the above

set theCommand to "mkdir " & theDir & "/" & theCourse & "-" & theTerm
do shell script theCommand
do shell script theCommand & "/assignments"
do shell script theCommand & "/grading"
do shell script theCommand & "/handouts"
-- updated to include course ID in slide directory name to avoid confusion
do shell script theCommand & "/" & theTerm & "-" & theCourse & "\\ slides"
if TAs then
	do shell script theCommand & "/TAs"
end if

