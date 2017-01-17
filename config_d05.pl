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


ex03
char* ft_strcpy(char* dest, char* src)
main -m ====
char test1[256] = "asdf";
printf("%s", ft_strcpy(test1, "qwerty\n"));
printf("%s", ft_strcpy(test1, ""));
printf("%s", ft_strcpy(test1, "hell0\n"));
==== check -e ====
$expected = "qwerty\nhell0\n";
====


ex04
char* ft_strncpy(char* dest, unsigned int n)


ex05
char* ft_strstr(char* str, char* to_find)


ex06
int ft_strcmp(char* s1, char* s2)


ex07
int ft_strncmp(char* s1, char* s2, unsigned int n)


ex08
char* ft_strupcase(char* str)


ex09
char* ft_strlowcase(char* str)


ex10
char* ft_strcapitalize(char* str)


ex11
int ft_str_is_alpha(char* str)


ex12
int ft_str_is_numeric(char* str)


ex13
int ft_str_is_lowercase(char* str)


ex14
int ft_str_is_uppercase(char* str)


ex15
int ft_str_is_printable(char* str)


ex16
char* ft_strcat(char* dest, char* src)


ex17
char* ft_strncat(char* dest, char* src, int nb)


ex18
unsigned int ft_strlcat(char* dest, char* src, unsigned int size)


ex19
unsigned int ft_strlcpy(char* dest, char* src, unsigned int size)


ex20
ft_putnbr_base(int nbr, char* base)


ex21
int ft_atoi_base(char* str, char* base)


ex22
ft_putstr_non_printable(char* str)


ex23
void* ft_print_memory(void* addr, unsigned int size)






