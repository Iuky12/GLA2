# Question 4

We robustly read lines from the `emails.txt` file, and append either to the
`valid` array or the `invalid` array depending upon whether or not the
email is considered valid (i.e. letters/digits followed by at sign followed
by more letters/digits followed by dot com).  We accomplish this with the
help of the `grep` command, which is provided a regular expression to
differentiate email addresses.

Once the email addresses have been categorized, we print them to
`valid.txt` and `invalid.txt`.  The valid addresses are sorted first.

## Output

    $ ./emailcleaner.sh 
    $
    $ cat emails.txt
    johndoe@email.com
    incorrect-address @email.com
    foobar@gmail.com
    someguy@gmx.com
    rightnot+something@email.com
    rightnot+something@email.com
    wrong@12,3somesite.org
    someguy@gmx.com
    $
    $ cat valid.txt
    foobar@gmail.com
    johndoe@email.com
    someguy@gmx.com
    $
    $ cat invalid.txt
    incorrect-address @email.com
    rightnot+something@email.com
    rightnot+something@email.com
    wrong@12,3somesite.org
