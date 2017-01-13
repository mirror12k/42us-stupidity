ex00
ft_ft(int *nbr)
main ====
int main()
{
	int v = 15;
	ft_ft(&v);
	printf("%d", v);
	return 0;
}
====
check -e ====
$expected = '42';
====


ex01
ft_ultimate_ft(int *********nbr)
main ====
int main()
{
	int a = 15;
	int* b = &a;
	int** c = &b;
	int*** d = &c;
	int**** e = &d;
	int***** f = &e;
	int****** g = &f;
	int******* h = &g;
	int******** i = &h;
	int********* j = &i;

	ft_ultimate_ft(j);

	printf("%d", a);

	return 0;
}
====
check -e ====
$expected = '42';
====


ex02
ft_swap(int *a, int *b)
main ====
int main()
{
	int a = 15;
	int b = -25;
	ft_swap(&a, &b);
	printf("%d,%d", a, b);
	return 0;
}
====
check -e ====
$expected = '-25,15';
====


ex03
ft_div_mod(int a, int b, int *div, int *mod)
main ====
int main()
{
	int div = 0, mod = 0;
	ft_div_mod(40, 15, &div, &mod);
	printf("%d,%d", div, mod);
	return 0;
}
====
check -e ====
$expected = '2,10';
====


ex04
ft_ultimate_div_mod(int *a, int *b)
main ====
int main()
{
	int a = 40, b = 15;
	ft_ultimate_div_mod(&a, &b);
	printf("%d,%d", a, b);
	return 0;
}
====
check -e ====
$expected = '2,10';
====


ex05
ft_putstr(char *str)
main_basic ====
int main()
{
	ft_putstr("hello world!");
	return 0;
}
====
check_basic -e ====
$expected = 'hello world!';
====
main_multiple ====
int main()
{
	ft_putstr("test1\n");
	ft_putstr("test2\n");
	ft_putstr("test3\n");
	return 0;
}
====
check_multiple -e ====
$expected = "test1\ntest2\ntest3\n";
====
main_empty ====
int main ()
{
	ft_putstr("");
	ft_putstr("");
	ft_putstr("");
	return 0;
}
====
check_empty -e ====
$expected = '';
====


ex06
int ft_strlen(char *str)
main_basic ====
int main()
{
	printf("%d,%d,%d", ft_strlen("asdf"), ft_strlen("qwerty"), ft_strlen("zxc0zxc"));
	return 0;
}
====
check_basic -e ====
$expected = '4,6,7';
====
main_empty ====
int main()
{
	printf("%d", ft_strlen(""));
	return 0;
}
====
check_empty -e ====
$expected = '0';
====



