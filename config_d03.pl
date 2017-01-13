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

