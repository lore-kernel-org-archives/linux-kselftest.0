From: shuah@kernel.org (shuah)
Date: Fri, 4 Jan 2019 12:07:23 -0700
Subject: selftests/bpf doesn't compile
In-Reply-To: <CAMuHMdXRN=mSKTjZNBSxQi-pkgSrKqeANxD-GB+hqC8pDjx7nQ@mail.gmail.com>
References: <20170908111923.27434-1-thomas@m3y3r.de>
 <20170908230155.esge2mctk5d5g7gb@ast-mbp> <59B32231.9090406@iogearbox.net>
 <ed20875b-7a01-fbc8-e8d1-3929ba35c8ac@kernel.org>
 <295553a4-aadc-e5d1-229e-22d1966bc9f5@kernel.org>
 <CAMuHMdXRN=mSKTjZNBSxQi-pkgSrKqeANxD-GB+hqC8pDjx7nQ@mail.gmail.com>
Message-ID: <e7aac6da-26f0-f700-5ed0-12b8c5c918b3@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190104190723.Da0txD2R2pz6iRpg7xGxDxkBoWCEt-kouCJ-uv4up84@z>

Hi Geert,

On 1/4/19 10:16 AM, Geert Uytterhoeven wrote:
> Hi Shuah,
> 
> CC kbuild, gpio
> 
> On Thu, Sep 14, 2017@5:34 PM Shuah Khan <shuah@kernel.org> wrote:
>> bpf test depends on clang and fails to compile when
>>
>> ------------------------------------------------------
>> make -C tools/testing/selftests/bpf run_tests
>>
>>
>> make: clang: Command not found
>> Makefile:39: recipe for target '.linux-kselftest/tools/testing/selftests/bpf/test_pkt_access.o' failed
>> make: *** [./linux-kselftest/tools/testing/selftests/bpf/test_pkt_access.o] Error 127
>> make: Leaving directory '.linux-kselftest/tools/testing/selftests/bpf'
> 
> The above failure is indeed due to missing clang.
> 
>> With "make TARGETS=bpf kselftest" it fails earlier:
>>
>> make[3]: Entering directory './linux-kselftest/tools/lib/bpf'
>> Makefile:40: tools/scripts/Makefile.arch: No such file or directory
>> Makefile:84: tools/build/Makefile.feature: No such file or directory
>> Makefile:143: tools/build/Makefile.include: No such file or directory
> 
> This is due to srctree being "." instead of the actual source tree,
> when invoked as "make kselftest".
> When using "make -C tools/testing/selftests", srctree is correct.
> 
> tools/testing/selftests/bpf/Makefile has:
> 
>      $(BPFOBJ): force
>              $(MAKE) -C $(BPFDIR) OUTPUT=$(OUTPUT)/
> 
> to enter the tools/lib/bpf directory to force a build of libbpf.a
> 
> Note that tools/gpio has the same issue.
> 
> There seem to be _four_ different ways to build kselftests
> (Documentation/dev-tools/kselftest.rst):
> 
>      make kselftest
>      make O=/path/to/output kselftest
>      make -C tools/testing/selftests
>      make O=/path/to/output -C tools/testing/selftests
> 
> I'm not so fond of the latter two, as they basically run make from
> somewhere inside the tree, which complicates things. I believe we don't
> support this anywhere else.
> 
> Each of the four seem to have (different) issues. Especially when you
> throw cross-compiling into the mix. And care about where installed
> headers end up (yes, kselftest calls headers_install internally).
> 
> I'm working on fixes for some of them, but I don't know how to fix the
> srctree issue.
> 

I will take a look at the srctree problem and fix it. I have had to fix
a few individual test Makefiles after ksefltest headers_install went in.

It will be in a week or two. I am taking some time off this week and
next week other than for occasional email checking.

thanks,
-- Shuah
