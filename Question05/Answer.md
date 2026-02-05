# Question 5

We first load the file names of files present in `dirA` and `dirB` into two
associative arrays, with the key set to the file name.  Then, we perform
set operations, namely set difference and intersection, to find files which
exist only in `dirA`, only in `dirB`, and also in both directories.

Once the list of files present in both directories has been obtained, we
use the `cmp` command to determine if their contents match.  This
information is printed for each common file.

## Output

    $ tree dir{A,B}
    dirA
    ├── alpha
    ├── beta
    ├── charlie
    └── delta
    dirB
    ├── charlie
    ├── delta
    └── echo

    2 directories, 7 files
    $
    $ bash sync.sh
    A:       alpha delta beta charlie
    B:       echo delta charlie
    onlyA:   alpha beta
    onlyB:   echo
    bothAB:  delta charlie

    {dirA,dirB}/delta:      same
    {dirA,dirB}/charlie:    differ
