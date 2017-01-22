ex00
int match(char* s1, char* s2)
main -m ====

TEST(match("asdf", "asdf"), 1);
TEST(match("", ""), 1);
TEST(match("a", "a"), 1);
TEST(match("aa", "aa"), 1);
TEST(match("aaa", "aaa"), 1);

TEST(match("", "asdf"), 0);
TEST(match("asdf", ""), 0);
TEST(match("asdf", "a"), 0);
TEST(match("a", "asdf"), 0);
TEST(match("asdf", "asde"), 0);

TEST(match("asde", "asdf"), 0);
TEST(match("asdf", "asdff"), 0);
TEST(match("asdff", "asdf"), 0);
TEST(match("aasdf", "asdf"), 0);
TEST(match("asdf", "aasdf"), 0);

TEST(match("", "*"), 1);
TEST(match("a", "*"), 1);
TEST(match("aa", "*"), 1);
TEST(match("asdf", "*"), 1);
TEST(match("asdfasdf", "*"), 1);

TEST(match("asdf", "a*"), 1);
TEST(match("asdfasdf", "a*"), 1);
TEST(match("a", "a*"), 1);
TEST(match("aa", "a*"), 1);
TEST(match("aasdf", "a*"), 1);

TEST(match("", "a*"), 0);
TEST(match("f", "a*"), 0);
TEST(match("fdsa", "a*"), 0);
TEST(match("faaaa", "a*"), 0);
TEST(match("faaasdf", "a*"), 0);

TEST(match("fdsa", "*a"), 1);
TEST(match("a", "*a"), 1);
TEST(match("aa", "*a"), 1);
TEST(match("fdsaaaaaaafdsa", "*a"), 1);
TEST(match("dfsaaaaaaaaaaaa", "*a"), 1);

TEST(match("", "*a"), 0);
TEST(match("f", "*a"), 0);
TEST(match("asdf", "*a"), 0);
TEST(match("aaaaaf", "*a"), 0);
TEST(match("fdsaaaaf", "*a"), 0);

TEST(match("abc", "abc*"), 1);
TEST(match("abcdef", "abc*"), 1);
TEST(match("abccccccc", "abc*"), 1);
TEST(match("abcabc", "abc*"), 1);
TEST(match("abcdabcdabc", "abc*"), 1);

TEST(match("", "abc*"), 0);
TEST(match("f", "abc*"), 0);
TEST(match("abbc", "abc*"), 0);
TEST(match("ab", "abc*"), 0);
TEST(match("abb", "abc*"), 0);
// 50

TEST(match("abc", "*abc"), 1);
TEST(match("defabc", "*abc"), 1);
TEST(match("aaaaaaabc", "*abc"), 1);
TEST(match("abcabc", "*abc"), 1);
TEST(match("abcdabcdabc", "*abc"), 1);

TEST(match("", "*abc"), 0);
TEST(match("f", "*abc"), 0);
TEST(match("abbc", "*abc"), 0);
TEST(match("ab", "*abc"), 0);
TEST(match("abb", "*abc"), 0);

TEST(match("a", "*a*"), 1);
TEST(match("aaa", "*a*"), 1);
TEST(match("aaaaaaabc", "*a*"), 1);
TEST(match("bcabc", "*a*"), 1);
TEST(match("sdfa", "*a*"), 1);

TEST(match("", "*a*"), 0);
TEST(match("f", "*a*"), 0);
TEST(match("bcd", "*a*"), 0);
TEST(match("bb", "*a*"), 0);
TEST(match("ASDF", "*a*"), 0);

TEST(match("ab", "*ab*"), 1);
TEST(match("abcd", "*ab*"), 1);
TEST(match("efabcd", "*ab*"), 1);
TEST(match("ababab", "*ab*"), 1);
TEST(match("bab", "*ab*"), 1);

TEST(match("asdf", "*ab*"), 0);
TEST(match("ba", "*ab*"), 0);
TEST(match("", "*ab*"), 0);
TEST(match("f", "*ab*"), 0);
TEST(match("bbbbbbaaaaa", "*ab*"), 0);

TEST(match("", "**"), 1);
TEST(match("a", "**"), 1);
TEST(match("ab", "**"), 1);
TEST(match("abc", "**"), 1);
TEST(match("abcd", "**"), 1);

TEST(match("a", "a**"), 1);
TEST(match("ab", "a**"), 1);
TEST(match("abc", "a**"), 1);
TEST(match("aaaaaa", "a**"), 1);
TEST(match("asdfaaaaa", "a**"), 1);

TEST(match("", "a**"), 0);
TEST(match("f", "a**"), 0);
TEST(match("fa", "a**"), 0);
TEST(match("faaaaaaa", "a**"), 0);
TEST(match("fafdsafdsa", "a**"), 0);

TEST(match("asdf", "*a**"), 1);
TEST(match("sdfa", "*a**"), 1);
TEST(match("faffff", "*a**"), 1);
TEST(match("fdsaasdf", "*a**"), 1);
TEST(match("aaaaaaa", "*a**"), 1);
// 100

TEST(match("", "*a**"), 0);
TEST(match("qwerqwer", "*a**"), 0);
TEST(match("bbbbbb", "*a**"), 0);
TEST(match("c", "*a**"), 0);
TEST(match("AAAAAAAAAA", "*a**"), 0);

TEST(match("main.c", "*.c"), 1);
TEST(match("main.c.c", "*.c"), 1);
TEST(match("main.h", "*.c"), 0);
TEST(match("main.cc", "*.c"), 0);
TEST(match("main.c", "*.*"), 1);

TEST(match("test.main.c", "test.*.c"), 1);
TEST(match("test..c", "test.*.c"), 1);
TEST(match("test.main.h", "test.*.c"), 0);
TEST(match("main.c", "test.*.c"), 0);
TEST(match("test.c", "test.*.c"), 0);

TEST(match("abcde", "a*c*e"), 1);
TEST(match("abcde", "*b*d*"), 1);
TEST(match("abcde", "a*e*c"), 0);
TEST(match("abcde", "*d*c*"), 0);
TEST(match("abcde", "a*d*d"), 0);


==== check -l=120 ====
====










