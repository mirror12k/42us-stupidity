
ex00 -N -f1=ft_create_elem.c -f2=ft_list.h
lol hi
main -f=ft_create_elem.c ====
#include "ft_list.h"

t_list *ft_create_elem(void *data);

int main()
{
	t_list* item = ft_create_elem("asdf");
	printf("%s\n", (char*)item->data);
	printf("%p\n", item->next);
}
==== check -e ====
$expected = "asdf\n0x0\n";
====




ex01 -N -f1=ft_list_push_back.c -f2=ft_list.h
lol hi
main -f=ft_list_push_back.c ====
#include "ft_list.h"

void ft_list_push_back(t_list **begin_list, void *data);

t_list* ft_create_elem(void* data)
{
	t_list* item = malloc(sizeof(t_list));
	item->next = NULL;
	item->data = data;
	return (item);
}

void crap_a_list(t_list* list)
{
	for (; list != 0; list = list->next)
		printf("%s,", (char*)list->data);
	printf("\n");
}

int main()
{
	t_list* list = 0;
	ft_list_push_back(&list, "asdf");
	crap_a_list(list);
	ft_list_push_back(&list, "qwer");
	ft_list_push_back(&list, "zxcv");
	crap_a_list(list);
	list = 0;
	ft_list_push_back(&list, "uiop");
	ft_list_push_back(&list, "hjkl");
	crap_a_list(list);
}
==== check -e ====
$expected = "asdf,\nasdf,qwer,zxcv,\nuiop,hjkl,\n";
====



ex02 -N -f1=ft_list_push_front.c -f2=ft_list.h
lol hi
main -f=ft_list_push_front.c ====
#include "ft_list.h"

void ft_list_push_front(t_list **begin_list, void *data);

t_list* ft_create_elem(void* data)
{
	t_list* item = malloc(sizeof(t_list));
	item->next = NULL;
	item->data = data;
	return (item);
}

void crap_a_list(t_list* list)
{
	for (; list != 0; list = list->next)
		printf("%s,", (char*)list->data);
	printf("\n");
}

int main()
{
	t_list* list = 0;
	ft_list_push_front(&list, "asdf");
	crap_a_list(list);
	ft_list_push_front(&list, "qwer");
	ft_list_push_front(&list, "zxcv");
	crap_a_list(list);
	list = 0;
	ft_list_push_front(&list, "uiop");
	ft_list_push_front(&list, "hjkl");
	crap_a_list(list);
}
==== check -e ====
$expected = "asdf,\nzxcv,qwer,asdf,\nhjkl,uiop,\n";
====





ex03 -N -f1=ft_list_size.c -f2=ft_list.h
lol hi
main -f=ft_list_size.c ====
#include "ft_list.h"

int ft_list_size(t_list *begin_list);

t_list* ft_create_elem(void* data)
{
	t_list* item = malloc(sizeof(t_list));
	item->next = NULL;
	item->data = data;
	return (item);
}

#define CE(data) ft_create_elem(data)

void crap_a_list(t_list* list)
{
	for (; list != 0; list = list->next)
		printf("%s,", (char*)list->data);
	printf("\n");
}

int main()
{
	t_list* list = 0;
	printf("%d\n", ft_list_size(list));
	list = CE("asdf");
	printf("%d\n", ft_list_size(list));
	list->next = CE("qwer");
	list->next->next = CE("zxcv");
	printf("%d\n", ft_list_size(list));
	list = CE("asdf");
	list->next = CE("asdf");
	list->next->next = CE("asdf");
	list->next->next->next = CE("asdf");
	printf("%d\n", ft_list_size(list));
	list->next->next->next->next = CE("asdf");
	printf("%d\n", ft_list_size(list));
}
==== check -e ====
$expected = "0\n1\n3\n4\n5\n";
====


ex04 -N -f1=ft_list_last.c -f2=ft_list.h
lol hi
main -f=ft_list_last.c ====
#include "ft_list.h"

t_list *ft_list_last(t_list *begin_list);

t_list* ft_create_elem(void* data)
{
	t_list* item = malloc(sizeof(t_list));
	item->next = NULL;
	item->data = data;
	return (item);
}

#define CE(data) ft_create_elem(data)
#define CL(list) crap_a_list(list)

void crap_a_list(t_list* list)
{
	for (; list != 0; list = list->next)
		printf("%s,", (char*)list->data);
	printf("\n");
}

int main()
{
	t_list* list = 0;
	printf("%p\n", ft_list_last(list));
	list = CE("asdf");
	printf("%s\n", (char*)(ft_list_last(list)->data));
	list->next = CE("qwer");
	list->next->next = CE("zxcv");
	printf("%s\n", (char*)(ft_list_last(list)->data));
	list = CE("asdf");
	list->next = CE("qwer");
	list->next->next = CE("zxcv");
	list->next->next->next = CE("uiop");
	printf("%s\n", (char*)(ft_list_last(list)->data));
	list->next->next->next->next = CE("hjkl");
	printf("%s\n", (char*)(ft_list_last(list)->data));
}
==== check -e ====
$expected = "0x0\nasdf\nzxcv\nuiop\nhjkl\n";
====



ex05 -N -f1=ft_list_push_params.c -f2=ft_list.h
lol hi
main -f=ft_list_push_params.c ====
#include "ft_list.h"

t_list *ft_list_push_params(int ac, char **av);

t_list* ft_create_elem(void* data)
{
	t_list* item = malloc(sizeof(t_list));
	item->next = NULL;
	item->data = data;
	return (item);
}

#define CE(data) ft_create_elem(data)
#define CL(list) crap_a_list(list)

void crap_a_list(t_list* list)
{
	for (; list != 0; list = list->next)
		printf("%s,", (char*)list->data);
	printf("\n");
}

int main(int argc, char** argv)
{
	t_list* list = ft_list_push_params(argc, argv);
	CL(list);
}
==== check -t ====
%tests = (
	"$program" => "\n",
	"$program asdf" => "asdf,\n",
	"$program asdf qwer" => "qwer,asdf,\n",
	"$program asdf qwer zxcv" => "zxcv,qwer,asdf,\n",
	"$program ''" => ",\n",
	"$program 15 '' 25" => "25,,15,\n",
	"$program wat" => "wat,\n",
);
====




















