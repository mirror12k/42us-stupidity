ex00
ft_putstr(char *str)
main -m ====
ft_putstr("asdf");
ft_putstr(" qwerty\n");
ft_putstr("zxcv");
==== check -e ====
$expected = "asdf qwerty\nzxcv";
====


ex01
ft_putnbr(int nb)
main_basic -m ====
ft_putnbr(123456);
==== check_basic -e ====
$expected = '123456';
==== main_negative -m ====
ft_putnbr(-987654321);
==== check_negative -e ====
$expected = '-987654321';
==== main_zero -m ====
ft_putnbr(0);
==== check_zero -e ====
$expected = '0';
==== main_intmax -m ====
ft_putnbr(2147483647);
==== check_intmax -e ====
$expected = '2147483647';
==== main_intnmax -m ====
ft_putnbr(-2147483648);
==== check_intnmax -e ====
$expected = '-2147483648';
====


ex02
int ft_atoi(char *str)
main -p -m ====
my $code = 'int res; int exp;';
my @tests = qw/ 0 15 -25 12345 987654321 -34567 2147483647 -2147483648 /;
foreach (@tests) {
	$code .= "res = ft_atoi(\"$_\"), exp = $_;\n";
	$code .= "printf(\"ft_atoi('$_') ($_ vs %d) -> %d\\n\", res, res == exp);\n";
}
return $code;
==== check -l=6 ====
====
