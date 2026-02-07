# Question 7

In `patterns.sh`, we create an array of words by reading lines from
`input.txt`.  This is accomplished by using the `read` command, and
splitting on white space after converting the line to lowercase and
removing punctuation.

Once the list of words has been created, we iterate over it, and save words
into three different arrays based on their contents (i.e. only vowels, only
consonants, or both vowels and consonants).

Finally, we save the three word lists to files `vowels.txt`,
`consonants.txt`, and `mixed.txt`.

## Output

    $ cat input.txt
    ooo bar baz uuuu
    aoouie doe mmmmsdf iiia
    $
    $ ./patterns.sh < input.txt
    $
    $ cat consonants.txt
    mmmmsdf
    $
    $ cat vowels.txt
    ooo
    uuuu
    aoouie
    iiia
    $
    $ cat mixed.txt
    bar
    baz
    doe
