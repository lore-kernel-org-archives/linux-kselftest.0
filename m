From: skhan at linuxfoundation.org (Shuah Khan)
Date: Thu, 16 May 2019 13:18:40 -0600
Subject: [PATCH] selftests: fix bpf build/test workflow regression when
 KBUILD_OUTPUT is set
In-Reply-To: <CAADnVQK2eyFdEULS6z-M1R77d-AKe5sACKCHxHShJFOqhqy0rw@mail.gmail.com>
References: <20190511025249.32678-1-skhan@linuxfoundation.org>
 <20190511043729.3o4enh35lrmne3kd@ast-mbp>
 <CAADnVQK2eyFdEULS6z-M1R77d-AKe5sACKCHxHShJFOqhqy0rw@mail.gmail.com>
Message-ID: <7d34df4b-88f4-9be9-624c-dfcb8b82e87d@linuxfoundation.org>

On 5/16/19 12:36 PM, Alexei Starovoitov wrote:
> On Fri, May 10, 2019 at 9:37 PM Alexei Starovoitov
> <alexei.starovoitov at gmail.com> wrote:
>>
>> On Fri, May 10, 2019 at 08:52:49PM -0600, Shuah Khan wrote:
>>> commit 8ce72dc32578 ("selftests: fix headers_install circular dependency")
>>> broke bpf build/test workflow. When KBUILD_OUTPUT is set, bpf objects end
>>> up in KBUILD_OUTPUT build directory instead of in ../selftests/bpf.
>>>
>>> The following bpf workflow breaks when it can't find the test_verifier:
>>>
>>> cd tools/testing/selftests/bpf; make; ./test_verifier;
>>>
>>> Fix it to set OUTPUT only when it is undefined in lib.mk. It didn't need
>>> to be set in the first place.
>>>
>>> Fixes: commit 8ce72dc32578 ("selftests: fix headers_install circular dependency")
>>>
>>> Reported-by: Alexei Starovoitov <alexei.starovoitov at gmail.com>
>>> Signed-off-by: Shuah Khan <skhan at linuxfoundation.org>
>>
>> 'git am' couldn't apply this patch because "sha1 information is lacking",
>> but the patch itself looks good.
>> Acked-by: Alexei Starovoitov <ast at kernel.org>
>> Thanks for the quick fix.
> 
> Ping! What is the status of the fix?
> 

Sending pull request this afternoon.

thanks,
-- Shuah
