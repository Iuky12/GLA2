# Question 3

To begin with, we define two subroutines: to determine whether a student has
passed in all three subjects; and to determine whether a student has failed in
exactly *one* subject.  

Moving further, we parse `marks.txt` by using the `read` command in a while
loop, setting `$IFS` to a single comma and supplying the command the `-r`
flag to switch off backslash escapes.  We give it five variable names, each
corresponding to one of the fields in the file.  We analyse the marks
attained by each student, and save their name in the appropriate list
(i.e. passed, or failed in one subject).

Lastly, we print to the screen the members of each group, and also show the
count of members in each group.

## Output

    $ cat marks.txt             # Rollno,Name,Marks1,Marks2,Marks3
    101,Suraj,34,78,20
    102,Ravi,56,99,34
    103,Ramesh,19,45,47
    104,Sanvi,78,39,44
    104,Anil,90,80,85
    $
    $ bash validate_results.sh
    === Passed (3) ===
        Ravi
        Sanvi
        Anil
    === Failed (2) ===
        Suraj
        Ramesh
