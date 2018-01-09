From: keescook@chromium.org (Kees Cook)
Date: Tue, 9 Jan 2018 15:25:35 -0800
Subject: [Linux-kselftest-mirror] [PATCH] selftests: seccomp: fix
	compile error seccomp_bpf
In-Reply-To: <CAGXu5jJLinkSF1yHsz2kFcjxBNFzU-7O-LsDGEHBs+n72bb7CQ@mail.gmail.com>
References: <20180105163118.22598-1-anders.roxell@linaro.org>
 <CA+G9fYsXCkk2uSO5fuLwUMqALitDzgzskBu3Pj5qCfdcRv3rMg@mail.gmail.com>
 <CAGXu5jK0X4uJxbj19ei-4bv3e7imsVqroJtP-E03bYd-9fxS4w@mail.gmail.com>
 <CAGXu5jJLinkSF1yHsz2kFcjxBNFzU-7O-LsDGEHBs+n72bb7CQ@mail.gmail.com>
Message-ID:
 <CAGXu5jJf1fm0X8EUE-XQCbEgWmoikt5k09YuPvKSZZ2Q=vtsJw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180109232535.fDHDIQXanOHh75cke2wmLXJ4_6PQgPn4dcZo8rBKPMI@z>

On Tue, Jan 9, 2018@3:24 PM, Kees Cook <keescook@chromium.org> wrote:
> On Tue, Jan 9, 2018@3:07 PM, Kees Cook <keescook@chromium.org> wrote:
>> On Fri, Jan 5, 2018 at 6:29 PM, Naresh Kamboju
>> <naresh.kamboju@linaro.org> wrote:
>>> On 5 January 2018@22:01, Anders Roxell <anders.roxell@linaro.org> wrote:
>>>> aarch64-linux-gnu-gcc -Wl,-no-as-needed -Wall
>>>>     -lpthread seccomp_bpf.c -o seccomp_bpf
>>>> seccomp_bpf.c: In function 'tracer_ptrace':
>>>> seccomp_bpf.c:1720:12: error: '__NR_open' undeclared
>>>>     (first use in this function)
>>>>   if (nr == __NR_open)
>>>>             ^~~~~~~~~
>>>> seccomp_bpf.c:1720:12: note: each undeclared identifier is reported
>>>>     only once for each function it appears in
>>>> In file included from seccomp_bpf.c:48:0:
>>>> seccomp_bpf.c: In function 'TRACE_syscall_ptrace_syscall_dropped':
>>>> seccomp_bpf.c:1795:39: error: '__NR_open' undeclared
>>>>     (first use in this function)
>>>>   EXPECT_SYSCALL_RETURN(EPERM, syscall(__NR_open));
>>>>                                        ^
>>>> open(2) is a legacy syscall, replaced with openat(2) since 2.6.16.
>>>> Thus new architectures in the kernel, such as arm64, don't implement
>>>> these legacy syscalls.
>>>>
>>>> Signed-off-by: Anders Roxell <anders.roxell at linaro.org>
>>>
>>> Thanks for the patch Anders.
>>> Tested-by: Naresh Kamboju <naresh.kamboju at linaro.org>
>>
>> Did something change recently? This has built fine on arm64 for a
>> while -- at least since commit 256d0afb11d6 ("selftests/seccomp: build
>> and pass on arm64").
>
> Ah, found it. I broke it in a33b2d0359a0! :) Shuah, can you take this
> please, with this tag added:
>
> Fixes: a33b2d0359a0 ("selftests/seccomp: Add tests for basic ptrace actions")

And Cc to stable, as this was broken in 4.14...

Cc: stable at vger.kernel.org

-Kees

-- 
Kees Cook
Pixel Security
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
