ex00
int ft_iterative_factorial(int nb)
main -m ====
int res, exp;

res = ft_iterative_factorial(4), exp = 24;
printf("4! (%d vs %d) -> %d\n", res, exp, res == exp);
res = ft_iterative_factorial(0), exp = 1;
printf("0! (%d vs %d) -> %d\n", res, exp, res == exp);
res = ft_iterative_factorial(1), exp = 1;
printf("1! (%d vs %d) -> %d\n", res, exp, res == exp);
res = ft_iterative_factorial(10), exp = 3628800;
printf("10! (%d vs %d) -> %d\n", res, exp, res == exp);
res = ft_iterative_factorial(12), exp = 479001600;
printf("12! (%d vs %d) -> %d\n", res, exp, res == exp);
res = ft_iterative_factorial(13), exp = 0;
printf("13! (%d vs %d) -> %d\n", res, exp, res == exp);
res = ft_iterative_factorial(-2), exp = 0;
printf("-2! (%d vs %d) -> %d\n", res, exp, res == exp);
res = ft_iterative_factorial(1000), exp = 0;
printf("1000! (%d vs %d) -> %d\n", res, exp, res == exp);
==== check -l=8 ====
====
