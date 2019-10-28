# 42 Stupidity

A tool for quickly test solutions for the piscine exercises.

## Usage
 
1. Clone 42us-stupidity
2. Go inside 42us-stupidity
3. Clone a day's repo inside 42us-stupidity
4. Run `./spawn.pl <day_repo> config_d<day_number>.pl`<br>
    Replacing the placeholders! This will create the test files for all the exercises.
5. Run `./tools/build.sh`<br>
  Build the exercies' files with the provided main.c's.
6. Run `./tools/verify.sh`<br>
  This makes norminette verify all the files. (Only works from the iMacs in the labs.)
7. Run `./tools/check_all.sh`<br>
  This will perform every test. If tests pass then they will say `good` otherwise errors are printed on the terminal.
  
## Example workflow

```
$ git clone https://github.com/mirror12k/42us-stupidity.git stupidMoulinette
...
$ cd stupidMoulinette
$ cp ~/Desktop/day03 day03
$ ./spawn.pl day03 config_d03.pl
...
$ ./tools/build.sh
...
$ ./tools/verify.sh
...
$ ./tools/check_all.sh
...
```
