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


ex01
int ft_recursive_factorial(int nb)
main -m ====
int res, exp;

res = ft_recursive_factorial(4), exp = 24;
printf("4! (%d vs %d) -> %d\n", res, exp, res == exp);
res = ft_recursive_factorial(0), exp = 1;
printf("0! (%d vs %d) -> %d\n", res, exp, res == exp);
res = ft_recursive_factorial(1), exp = 1;
printf("1! (%d vs %d) -> %d\n", res, exp, res == exp);
res = ft_recursive_factorial(10), exp = 3628800;
printf("10! (%d vs %d) -> %d\n", res, exp, res == exp);
res = ft_recursive_factorial(12), exp = 479001600;
printf("12! (%d vs %d) -> %d\n", res, exp, res == exp);
res = ft_recursive_factorial(13), exp = 0;
printf("13! (%d vs %d) -> %d\n", res, exp, res == exp);
res = ft_recursive_factorial(-2), exp = 0;
printf("-2! (%d vs %d) -> %d\n", res, exp, res == exp);
res = ft_recursive_factorial(1000), exp = 0;
printf("1000! (%d vs %d) -> %d\n", res, exp, res == exp);
==== check -l=8 ====
====


ex02
int ft_iterative_power(int nb, int power)
main -m ====
int res, exp;

res = ft_iterative_power(2, 2), exp = 4;
printf("2^2 (%d vs %d) -> %d\n", res, exp, res == exp);
res = ft_iterative_power(2, 1), exp = 2;
printf("2^1 (%d vs %d) -> %d\n", res, exp, res == exp);
res = ft_iterative_power(2, 0), exp = 1;
printf("2^0 (%d vs %d) -> %d\n", res, exp, res == exp);
res = ft_iterative_power(2, -1), exp = 0;
printf("2^-1 (%d vs %d) -> %d\n", res, exp, res == exp);
res = ft_iterative_power(2, 4), exp = 16;
printf("2^4 (%d vs %d) -> %d\n", res, exp, res == exp);
res = ft_iterative_power(5, 3), exp = 125;
printf("5^3 (%d vs %d) -> %d\n", res, exp, res == exp);
res = ft_iterative_power(3, 5), exp = 243;
printf("3^5 (%d vs %d) -> %d\n", res, exp, res == exp);
res = ft_iterative_power(2, 1000000), exp = -1;
printf("2^1000000 (%d vs %d) -> %d\n", res, exp, 1);
==== check -l=8 ====
====


ex03
int ft_recursive_power(int nb, int power)
main -m ====
int res, exp;

res = ft_recursive_power(2, 2), exp = 4;
printf("2^2 (%d vs %d) -> %d\n", res, exp, res == exp);
res = ft_recursive_power(2, 1), exp = 2;
printf("2^1 (%d vs %d) -> %d\n", res, exp, res == exp);
res = ft_recursive_power(2, 0), exp = 1;
printf("2^0 (%d vs %d) -> %d\n", res, exp, res == exp);
res = ft_recursive_power(2, -1), exp = 0;
printf("2^-1 (%d vs %d) -> %d\n", res, exp, res == exp);
res = ft_recursive_power(2, 4), exp = 16;
printf("2^4 (%d vs %d) -> %d\n", res, exp, res == exp);
res = ft_recursive_power(5, 3), exp = 125;
printf("5^3 (%d vs %d) -> %d\n", res, exp, res == exp);
res = ft_recursive_power(3, 5), exp = 243;
printf("3^5 (%d vs %d) -> %d\n", res, exp, res == exp);
res = ft_recursive_power(2, 1000000), exp = -1;
printf("2^1000000 (%d vs %d) -> %d\n", res, exp, 1);
==== check -l=8 ====
====


ex04
int ft_fibonacci(int index)
main -m ====
printf("%d,%d,%d,%d, %d,%d,%d,%d, %d,%d,%d,%d",
	ft_fibonacci(0),
	ft_fibonacci(1),
	ft_fibonacci(2),
	ft_fibonacci(3),

	ft_fibonacci(4),
	ft_fibonacci(5),
	ft_fibonacci(6),
	ft_fibonacci(7),

	ft_fibonacci(8),
	ft_fibonacci(9),
	ft_fibonacci(10),
	ft_fibonacci(11));
==== check -e ====
$expected = '0,1,1,2, 3,5,8,13, 21,34,55,89';
====


