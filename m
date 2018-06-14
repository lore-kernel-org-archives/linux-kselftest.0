From: shuah at kernel.org (Shuah Khan)
Date: Thu, 14 Jun 2018 14:42:44 -0600
Subject: Improving kselfests cross compilation
In-Reply-To: <19ec8c01-15a0-eca2-cf6c-08c71b670dab@gmail.com>
References: <19ec8c01-15a0-eca2-cf6c-08c71b670dab@gmail.com>
Message-ID: <4dd5e859-4d76-0c44-3ca1-1629de9cdc81@kernel.org>

Hi Florian,

On 06/13/2018 09:39 PM, Florian Fainelli wrote:
> Hi Shuah,
> 
> I was giving a shot at building the kselftests from within buildroot [1]
> as of Linux be779f03d563981c65cc7417cc5e0dbbc5b89d30 and there are a
> number of things that make it still reasonably hard even today:
> 
> - 3c545084130c1fd5cf873a5fec3ee29070128e06 ("selftests: sparc64: char:
> Selftest for privileged ADI driver") this contains inline assembly that
> can only work when building for sparc64, yet this is still being built
> irrespective of what ARCH is set to

I fixed this problem and sent in a patch couple of days ago.

> 
> - each Makefile that requires knowledge of the architecture seems to
> duplicate what ARCH should be, this cannot be moved to lib.mk since
> Makefiles do expect lib.mk to be included last and/or after they have
> done their own overrides, but something like common.mk which contains
> CC, ARCH etc. could be useful to avoid the repetition of looking at
> uname -m etc. etc.
> 

I think this is a good idea. Is this something you would like to work
on?

> - some tests' Makefile do seem to hardcode paths to the system's include
> instead of accepting a configurable path:
> 
> gpio/Makefile:
> 
> LDLIBS += -lmount -I/usr/include/libmount

gpio test has been a problem from the beginning. It has dependency
on objects that get built in tools/gpio

I think it is mistake on my part to accept this test in the first
place. It is on my todo list to address the problem (not sure how),
but I don't like the dependency. If you want to take a look at the
best way to address, please do.

> 
> I will try to submit patches in the next days that address the most
> obvious issues I listed here

Thanks. I did lot of cleanup on the sparc64 test, you can find them all
at https://patchwork.kernel.org/project/linux-kselftest/list/

but in order for this effort not to be a
> constant whack-a-mole game, there really needs to be at least one or two
> architectures that must attempt to cross-compile (and run) those tests
> and use that as an acceptance criteria.
> 

These problem usually surface in linux-next and get fixed. However since
selftest patches go through other trees (x86, mm, net, bpf) in addition
to kselftest tree, it would be difficult to unless all the maintainers
agree to the acceptance criteria. I try to review the tests from selftest
framework compatibility, however in some cases, patches get pulled in even
before I get a chance to review and I miss things like sparc64 arch handling
So there are some pain points, however, I don't think we can avoid problems all
together with the number of tests that are getting added on a regular basis.

I do think soaking in linux-next is the best way to go.

The example of sparc64 test you mentioned is a new test. I am surprised that
we didn't find this problem in linux-next early on. I found it in my routine
testing I do during the merge window.

David! Did this patch end up in linux-next? I am not sure how net patch flow?

thanks,
-- Shuah

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
