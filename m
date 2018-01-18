From: dima at arista.com (Dmitry Safonov)
Date: Thu, 18 Jan 2018 22:28:03 +0000
Subject: [Linux-kselftest-mirror] [PATCH] selftests/x86: Add
	<test_name>{, _32, _64} targets
In-Reply-To: <20180118221943.23558-1-dima@arista.com>
References: <20180118221943.23558-1-dima@arista.com>
Message-ID: <1516314483.2762.13.camel@arista.com>

On Thu, 2018-01-18 at 22:19 +0000, Dmitry Safonov wrote:
> One can only use `make all` or `make <test_name>_<bitness>`
> as make targets.
> `make <test_name>` doesn't work as Ingo noticed:
>   x86> make test_vsyscall
>   gcc -O2 -g -std=gnu99 -pthread -Wall -no-pie test_vsyscall.c -o
> test_vsyscall
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
> 
> Cc: Andy Lutomirski <luto at kernel.org>
> Cc: Greg Kroah-Hartman <gregkh at linuxfoundation.org>
> Cc: Shuah Khan <shuah at kernel.org>
> Cc: Thomas Gleixner <tglx at linutronix.de>
> Cc: linux-kselftest at vger.kernel.org
> Cc: x86 at kernel.org
> Reported-by: Ingo Molnar <mingo at kernel.org>
> Signed-off-by: Dmitry Safonov <dima at arista.com>
> ---

Drop this one, please, I've sent v2 with $(1) and $(1)_{64,32}
targets specified on one line.

-- 
Thanks,
             Dmitry
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
