# 42 Stupidity
A tool for quickly testing answers to the piscine questions

## usage
clone this repository, and then clone a student's work repo inside of this one. run ```./spawn.pl THEIR_WORK_REPO/ config<day>.pl``` (replace THEIR_WORK_REPO with the repo that you cloned, and config<day>.pl with the name of the config file that you wish to test (they are named by day, so d02 would be config_d02.pl)). the spawn script will create test files for all exercises that it finds present.

after spawning, run ```./tools/build.sh``` to build their files with the provided main.c's. run ```./tools/verify.sh``` to have norminette verify all files. finally, run ```./tools/check_all.sh``` to perform all tests. good tests will simply state 'good', errors will be printed with big exclamation marks.
