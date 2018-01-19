From: shuah at kernel.org (Shuah Khan)
Date: Thu, 18 Jan 2018 17:28:34 -0700
Subject: [Linux-kselftest-mirror] [PATCH] selftests/x86: Add
	<test_name>{, _32, _64} targets
In-Reply-To: <CALCETrX3gEQM+rMY4zY=D-K1xM2KM8jjMq4u=C5OxagjDAV9mQ@mail.gmail.com>
References: <20180118221943.23558-1-dima@arista.com>
 <CALCETrX3gEQM+rMY4zY=D-K1xM2KM8jjMq4u=C5OxagjDAV9mQ@mail.gmail.com>
Message-ID: <fb38bd16-9f95-d4ec-226d-925afd4e05ba@kernel.org>

On 01/18/2018 04:10 PM, Andy Lutomirski wrote:
> On Thu, Jan 18, 2018 at 2:19 PM, Dmitry Safonov <dima at arista.com> wrote:
>> One can only use `make all` or `make <test_name>_<bitness>`
>> as make targets.
>> `make <test_name>` doesn't work as Ingo noticed:
>>   x86> make test_vsyscall
>>   gcc -O2 -g -std=gnu99 -pthread -Wall -no-pie test_vsyscall.c -o test_vsyscall
>>   /tmp/aBaoo3nb.o: In function `init_vdso':
>>   test_vsyscall.c:68: undefined reference to `dlopen'
>>   test_vsyscall.c:76: undefined reference to `dlsym'
>>   test_vsyscall.c:80: undefined reference to `dlsym'
>>   test_vsyscall.c:84: undefined reference to `dlsym'
>>   test_vsyscall.c:88: undefined reference to `dlsym'
>>   test_vsyscall.c:70: undefined reference to `dlopen'
>>   collect2: error: ld returned 1 exit status
>>   <builtin>: recipe for target 'test_vsyscall' failed
>>   make: *** [test_vsyscall] Error 1
>>
>> Makefile target substitution neither works :-/
>>
>> Generate .PHONY targets per-test and fix target substitution.
> 
> Reviewed-by: Andy Lutomirski <luto at kernel.org>
> 
> 

Thanks for taking care of this. I plan to get this into 4.16-rc1
unless there is a dependency on x86 tree.

thanks,
-- Shuah
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
