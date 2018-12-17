From: shuah@kernel.org (shuah)
Date: Mon, 17 Dec 2018 11:42:47 -0700
Subject: selftests/net: udpgso: LTS kernels supportability ?
In-Reply-To: <bbabafb5-e16c-4025-31d0-d9e5feb5f39a@linaro.org>
References: <bbabafb5-e16c-4025-31d0-d9e5feb5f39a@linaro.org>
Message-ID: <1d2c9a10-6caf-49ff-b921-8b93dbe96f78@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181217184247.p_KNWF-TAxw1q_QUD3PCh6h_92NBxSP8kwmLbzCQSuE@z>

Hi Rafael,

On 12/17/18 10:53 AM, Rafael David Tinoco wrote:
> Shuah,
> 
> I was recently investigating some errors coming out of our functional
> tests and we, Dan and I, came up with a discussion that might not be new
> for you, but, interests us, in defining how to better use kselftests as
> a regression mechanism/tool in our LKFT (https://lkft.linaro.org).
> 
> David / Willem,
> 
> I'm only using udpgso as an example for what I'd like to ask Shuah. Feel
> free to jump in in the discussion if you think its worth.
> 
> All,
> 
> Regarding: udpgso AND https://bugs.linaro.org/show_bug.cgi?id=3980
> 
> udpgso tests are failing in kernels bellow 4.18 because of 2 main reasons:
> 
> 1) udp4_ufo_fragment does not seem to demand the GSO SKB to be > than
> the MTU for older kernels (4th test case in udpgso.c).
> 
> 2) setsockopt(...UDP_SEGMENT) support is not present for older kernels.
> (commits "udp: generate gso with UDP_SEGMENT" and its fixes seem to be
> needed).

This case is easy right? Based on the test output below , I can see that 
the failure is due to

./udpgso: setsockopt udp segment: Protocol not available. setsockopt() 
is returning an error to clearly indicate that this options isn't 
supported. This will be a test change to say test is a skip as opposed 
to fail.

We have a solution for this - test should SKIP as opposed to FAIL.

> With that explained, finally the question/discussion:
> 
> Shouldn't we enforce a versioning mechanism for tests that are testing
> recently added features ? I mean, some of the tests inside udpgso
> selftest are good enough for older kernels...

Right - we do have generic way to handle that by detecting if feature is 
supported and skip instead of using Kernel version which is going to be 
hard to maintain.

> 
> But, because we have no control over "kernel features" and "supported
> test cases", we, Linaro, have to end up blacklisting all selftests that
> have new feature oriented tests, because one or two test cases only.
> 
> This has already been solved in other functional tests projects:
> allowing to check the running kernel version and deciding which test
> cases to run.
> 

I would like to see effort going into fixing tests to skip when a 
feature isn't supported. I think that is the solution that will be 
maintainable in the long run.

> Would that be something we should pursue ? (We could try to make patches
> here and there, like this case, whenever we face this). Or... should we
> stick with mainline/next only when talking about kselftest and forget
> about LTS kernels ?
> 

There is a middle of the road solution to run Kselftest from the same 
kernel release on LTS kernels and report the results as it is turning 
out be adding overhead in interpreting results when mainline/next 
Kselftest are run on LTS.

Kselftest mainline/next tends to be in a state where there could be bugs 
in tests like the one you are finding in the example you used to 
describe the problem. As we find them we fix them. That is just the 
nature of mainline/next

Maybe for LTS kernels it is better for you to stay with Kselftest from 
the same release or close to it. For example, running 4.20 Kselftest on 
4.4 is going to result in more skips/(false fails) than running 4.4 
Kselftest on 4.4 even though it might provide better coverage. It is a 
judgment call on the overhead vs. advantage running newer Kselftest from 
mainline/next on LTS.

I don't think versioning (skip or release based) can fully address the 
problem you are seeing considering the fluid nature of mainline/next.

thanks,
-- Shuah
