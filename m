From: shuah@kernel.org (Shuah Khan)
Date: Wed, 7 Mar 2018 08:11:57 -0700
Subject: [PATCH] selftests/size: rework to use main instead of _start
In-Reply-To: <20180307130725.8267-1-anders.roxell@linaro.org>
References: <20180307130725.8267-1-anders.roxell@linaro.org>
Message-ID: <613a519a-9c2b-fb11-ecb9-f3c464d0af43@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180307151157._RXoKjI-E3iUif6lAQboCvRr9wqRXhyWjfEToxAkYhE@z>

On 03/07/2018 06:07 AM, Anders Roxell wrote:
> In a -ffreestanding environment without glibc, we shouldn't be able to
> call either getenv or printf. It seems that printf() happens to work
> fine, but it ends up using the glibc getenv(), which doesn't work unless
> we call the glibc _start() function first.
> Using _start() was originally meant as an optimization to reduce the
> memory consumption of the test program itself, in order to get a more
> accurate representation of the available RAM at system boot time.
> However, it causes more problems than it helps, especially when run from
> a shell script that also consumes some memory.
> 
> get_size[2838]: segfault at ffffffffffffffd0 ip 000000000040538b
>    sp 00007ffc41980668 error 5 in get_size[400000+b0000]
> audit: type=1701 audit(1521532923.838:4): auid=0 uid=0 gid=0 ses=2
>    subj=kernel pid=2838 comm=\"get_size\"
>    exe=\"/opt/kselftests/next/size/get_size\" sig=11 res=1
> get_size[2840]: segfault at ffffffffffffffd0 ip 000000000040538b
>    sp 00007ffdace9b378 error 5 in get_size[400000+b0000]
> audit: type=1701 audit(1521532932.057:5): auid=0 uid=0 gid=0 ses=2
>    subj=kernel pid=2840 comm=\"get_size\"
>    exe=\"/opt/kselftests/next/size/get_size\" sig=11 res=1
> 
> Rework to get_size test to use main (and printf) instead of _start. All
> other seftest tests uses main and not _start.
> 
> Fixes: 0081901af95f ("selftests: size call ksft_print_header() to print TAP header")
> Signed-off-by: Anders Roxell <anders.roxell at linaro.org>

Andres,

Thanks for finding and reporting the problem. This patch is in linux-kselftest next
for 4.17-rc1. I would rather revert the patch than fix it a this time.

I knew there was a reason why Tim didn't use printf() in the first, I couldn't
remember. I won't be sending

0081901af95f ("selftests: size call ksft_print_header() to print TAP header")

for inclusion into 4.17-rc1

thanks,
-- Shuah
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
