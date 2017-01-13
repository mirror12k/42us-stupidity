ex00
int ft_iterative_factorial(int nb)
main ====
int main ()
{
	printf("4!: %d\n", ft_iterative_factorial(4));
	printf("4!? %d\n", 24 == ft_iterative_factorial(4));
	printf("0!: %d\n", ft_iterative_factorial(0));
	printf("0!? %d\n", 1 == ft_iterative_factorial(0));
	printf("1!: %d\n", ft_iterative_factorial(1));
	printf("1!? %d\n", 1 == ft_iterative_factorial(1));
	printf("10!: %d\n", ft_iterative_factorial(10));
	printf("10!? %d\n", 3628800 == ft_iterative_factorial(10));
	printf("12!: %d\n", ft_iterative_factorial(12));
	printf("12!? %d\n", 479001600 == ft_iterative_factorial(12));
	printf("13!: %d\n", ft_iterative_factorial(13));
	printf("13!? %d\n", 0 == ft_iterative_factorial(13));
	printf("-2!: %d\n", ft_iterative_factorial(-2));
	printf("-2!? %d\n", 0 = ft_iterative_factorial(-2));
	printf("1000!: %d\n", ft_iterative_factorial(1000));
	printf("1000!? %d\n", 0 == ft_iterative_factorial(1000));

	return 0;
}
====
check -e ====
my @lines = split '
