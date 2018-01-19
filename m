From: shuah at kernel.org (Shuah Khan)
Date: Thu, 18 Jan 2018 17:33:32 -0700
Subject: [Linux-kselftest-mirror] [PATCHv2] selftests/x86: Add
	<test_name>{, _32, _64} targets
In-Reply-To: <20180118222625.24408-1-dima@arista.com>
References: <20180118222625.24408-1-dima@arista.com>
Message-ID: <af2496d0-23b0-23d1-bd6c-a16e909bb78b@kernel.org>

On 01/18/2018 03:26 PM, Dmitry Safonov wrote:
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
> v2: collide two target lines $(1) and $(1)_{64,32}
> 
>  tools/testing/selftests/x86/Makefile | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 

v2 is the right one.

Thanks for taking care of this. I plan to get this into 4.16-rc1
unless there is a dependency on x86 tree.

thanks,
-- Shuah
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
