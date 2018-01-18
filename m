From: luto@kernel.org (Andy Lutomirski)
Date: Thu, 18 Jan 2018 15:10:29 -0800
Subject: [Linux-kselftest-mirror] [PATCH] selftests/x86: Add
	<test_name>{, _32, _64} targets
In-Reply-To: <20180118221943.23558-1-dima@arista.com>
References: <20180118221943.23558-1-dima@arista.com>
Message-ID:
 <CALCETrX3gEQM+rMY4zY=D-K1xM2KM8jjMq4u=C5OxagjDAV9mQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180118231029.egfjnWafVlPl3orQguoi3Skt7BEbJrkn4jPunPCDTyU@z>

On Thu, Jan 18, 2018@2:19 PM, Dmitry Safonov <dima@arista.com> wrote:
> One can only use `make all` or `make <test_name>_<bitness>`
> as make targets.
> `make <test_name>` doesn't work as Ingo noticed:
>   x86> make test_vsyscall
>   gcc -O2 -g -std=gnu99 -pthread -Wall -no-pie test_vsyscall.c -o test_vsyscall
>   /tmp/aBaoo3nb.o: In function `init_vdso':
>   test_vsyscall.c:68: undefined reference to `dlopen'
>   test_vsyscall.c:76: undefined reference to `dlsym'
>   test_vsyscall.c:80: undefined reference to `dlsym'
>   test_vsyscall.c:84: undefined reference to `dlsym'
>   test_vsyscall.c:88: undefined reference to `dlsym'
>   test_vsyscall.c:70: undefined reference to `dlopen'
>   collect2: error: ld returned 1 exit status
>   <builtin>: recipe for target 'test_vsyscall' failed
>   make: *** [test_vsyscall] Error 1
>
> Makefile target substitution neither works :-/
>
> Generate .PHONY targets per-test and fix target substitution.

Reviewed-by: Andy Lutomirski <luto at kernel.org>
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
