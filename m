From: ravi.bangoria@linux.vnet.ibm.com (Ravi Bangoria)
Date: Thu, 15 Mar 2018 11:18:19 +0530
Subject: [PATCH v5 16/19] tracing: probeevent: Add array type support
In-Reply-To: <152049905133.7289.17516121776689315422.stgit@devbox>
References: <152049860385.7289.14079393589900496424.stgit@devbox>
 <152049905133.7289.17516121776689315422.stgit@devbox>
Message-ID: <72be81a4-710a-b942-277d-9156c3debc5d@linux.vnet.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180315054819.w1atKl989jFNj8qPAwM_GzCV-UjK3M1iV2Ou_57qCZY@z>

Hi Masami,

On 03/08/2018 02:20 PM, Masami Hiramatsu wrote:
> Add array type support for probe events.
> This allows user to get arraied types from memory address.
> The array type syntax is
>
> 	TYPE[N]
>
> Where TYPE is one of types (u8/16/32/64,s8/16/32/64,
> x8/16/32/64, symbol, string) and N is a fixed value less
> than 64.
>
> The string array type is a bit different from other types. For
> other base types, <base-type>[1] is equal to <base-type>
> (e.g. +0(%di):x32[1] is same as +0(%di):x32.) But string[1] is not
> equal to string. The string type itself represents "char array",
> but string array type represents "char * array". So, for example,
> +0(%di):string[1] is equal to +0(+0(%di)):string.

I was trying to test this patch. But I'm not getting proper data.
Here is what I'm doing...

$ cat hello.c
#include <stdio.h>

void foo1(int a[])
{
    printf("%d\n", a[2]);
}

void foo(int a[])
{
    printf("%d\n", a[1]);
    foo1(a);
}

void main()
{
    int a[3] = {4, 5, 6};
    printf("%d\n", a[0]);
    foo(a);
}

$ gcc -g hello.c -o hello
$ sudo ./perf probe -x ~/hello foo1 'a=a:x32[3]'
$ sudo cat /sys/kernel/debug/tracing/uprobe_events
p:probe_hello/foo1 /home/ravi/hello:0x00000000000005fc a=+96(%gpr31):x32[3]

$ sudo ./perf record -e probe_hello:foo1 ~/hello
$ sudo ./perf script
hello  6913 [038]  2857.704470: probe_hello:foo1: (100005fc) a={0xd69e4400,0x7fff,0x0}


I don't see proper values of the 'a'? Anything wrong with my perf commands :) ?

Thanks,
Ravi

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
