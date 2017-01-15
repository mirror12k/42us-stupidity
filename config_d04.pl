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


ex05
int ft_sqrt(int nb)
main -m ====
int res, exp;

res = ft_sqrt(4), exp = 2;
printf("root 4 (%d vs %d) -> %d\n", res, exp, res == exp);
res = ft_sqrt(1), exp = 1;
printf("root 1 (%d vs %d) -> %d\n", res, exp, res == exp);
res = ft_sqrt(0), exp = 0;
printf("root 0 (%d vs %d) -> %d\n", res, exp, res == exp);
res = ft_sqrt(3), exp = 0;
printf("root 3 (%d vs %d) -> %d\n", res, exp, res == exp);
res = ft_sqrt(9), exp = 3;
printf("root 9 (%d vs %d) -> %d\n", res, exp, res == exp);
res = ft_sqrt(16), exp = 4;
printf("root 16 (%d vs %d) -> %d\n", res, exp, res == exp);
res = ft_sqrt(-5), exp = 0;
printf("root -5 (%d vs %d) -> %d\n", res, exp, res == exp);
res = ft_sqrt(144), exp = 12;
printf("root 144 (%d vs %d) -> %d\n", res, exp, res == exp);
==== check -l=8 ====
====





ex06
int ft_is_prime(int nb)
main -m ====
int res, exp;

res = ft_is_prime(4), exp = 0;
printf("prime 4? (%d vs %d) -> %d\n", res, exp, res == exp);
res = ft_is_prime(2), exp = 1;
printf("prime 2? (%d vs %d) -> %d\n", res, exp, res == exp);
res = ft_is_prime(1), exp = 0;
printf("prime 1? (%d vs %d) -> %d\n", res, exp, res == exp);
res = ft_is_prime(0), exp = 0;
printf("prime 0? (%d vs %d) -> %d\n", res, exp, res == exp);
res = ft_is_prime(7), exp = 1;
printf("prime 7? (%d vs %d) -> %d\n", res, exp, res == exp);
res = ft_is_prime(23), exp = 1;
printf("prime 23? (%d vs %d) -> %d\n", res, exp, res == exp);
res = ft_is_prime(-5), exp = 0;
printf("prime -5? (%d vs %d) -> %d\n", res, exp, res == exp);
res = ft_is_prime(61), exp = 1;
printf("prime 61? (%d vs %d) -> %d\n", res, exp, res == exp);
==== check -l=8 ====
====


ex07
int ft_find_next_prime(int nb)
main -p -m ====
my $code = "int res, exp;\n";

my %tests = (
	-2 => 2,
	-1 => 2,
	0 => 2,
	1 => 2,
	
	2 => 2,
	3 => 3,
	4 => 5,
	5 => 5,

	6 => 7,
	8 => 11,
	14 => 17,
	20 => 23,
);

foreach my $arg (sort keys %tests) {
	$code .= "res = ft_find_next_prime($arg), exp = $tests{$arg};\n";
	$code .= "printf(\"next($arg) ($tests{$arg} vs %d) -> %d\\n\", res, res == exp);\n";
}

return $code
==== check -l=12 ====
====



ex08
int ft_eight_queens_puzzle(void)
main -m ====
printf("%d", ft_eight_queens_puzzle());
==== check -e ====
$expected = '92';
====


