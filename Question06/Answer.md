# Question 6

To begin with, we read `input.txt` line-by-line in a while loop by using
the `read` built-in.  In the body of the loop, we process each line to
convert it to lowercase and remove any superflouous characters
(e.g. punctuation).  We maintain an array of words, to which we append the
words found on the current line.

Once we have obtained an array of words, we iterate over the words in a `for`
loop and compute the longest and shortest words using a linear search
algorithm.  We also maintain a running total of the number of characters
encountered.

To compute the average word length, we employ the `bc` command to divide the
sum total of characters by the number of words.  And to compute the number
of unique words, we sort the words alphabetically with the `sort` command,
eliminate duplicates by providing the `-u` switch to that command, and
count words with `wc -l`.

## Output

    $ ./metrics.sh
    Longest word      : necessitatibus
    Shortest word     : in
    Avg word len.     : 5.85
    No. of uniq. words: 105
