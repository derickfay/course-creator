course-creator
==============

Applescripts related to routine tasks in creating and managing courses.

* Generate syllabus table in HTML.scpt

	Creates a table with day month date labels.  You can set the # of weeks, days of the week and start date.  This version puts each class in a separate column, with one row per week.
	
* Generate syllabus table in HTML - multi-line

	Creates a table with day month date labels.  You can set the # of weeks, days of the week and start date.  This version puts each class on a separate row.
	
* Generate syllabus table in Markdown - multi-line

Same as above but in Markdown.  Decided Markdown tables are too messy and abandoned it.

* Generate syllabus table in Numbers

The site of any future development.  Decided to build tables in a spreadsheet rather than use markup.

* Generate directories.scpt

	Creates a standard file structure for storing course files.

* Find day MFW.scpt

	I got tired of always needing to scroll through my syllabus to find the next class.

	Given a pdf syllabus for a MWF class in which dates are written Day Month Date, e.g. Monday January 9, 
	this script will automatically open the syllabus to the next class (based on the current system date).
	I call the script from an Alfred workflow.

* Find day TTh.scpt
