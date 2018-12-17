From: rafael.tinoco at linaro.org (Rafael David Tinoco)
Date: Mon, 17 Dec 2018 15:53:07 -0200
Subject: selftests/net: udpgso: LTS kernels supportability ?
Message-ID: <bbabafb5-e16c-4025-31d0-d9e5feb5f39a@linaro.org>

Shuah,

I was recently investigating some errors coming out of our functional
tests and we, Dan and I, came up with a discussion that might not be new
for you, but, interests us, in defining how to better use kselftests as
a regression mechanism/tool in our LKFT (https://lkft.linaro.org).

David / Willem,

I'm only using udpgso as an example for what I'd like to ask Shuah. Feel
free to jump in in the discussion if you think its worth.

All,

Regarding: udpgso AND https://bugs.linaro.org/show_bug.cgi?id=3980

udpgso tests are failing in kernels bellow 4.18 because of 2 main reasons:

1) udp4_ufo_fragment does not seem to demand the GSO SKB to be > than
the MTU for older kernels (4th test case in udpgso.c).

2) setsockopt(...UDP_SEGMENT) support is not present for older kernels.
(commits "udp: generate gso with UDP_SEGMENT" and its fixes seem to be
needed).

With that explained, finally the question/discussion:

Shouldn't we enforce a versioning mechanism for tests that are testing
recently added features ? I mean, some of the tests inside udpgso
selftest are good enough for older kernels...

But, because we have no control over "kernel features" and "supported
test cases", we, Linaro, have to end up blacklisting all selftests that
have new feature oriented tests, because one or two test cases only.

This has already been solved in other functional tests projects:
allowing to check the running kernel version and deciding which test
cases to run.

Would that be something we should pursue ? (We could try to make patches
here and there, like this case, whenever we face this). Or... should we
stick with mainline/next only when talking about kselftest and forget
about LTS kernels ?

OBS: Situations like this are very time consuming before we can tell if
there was a regression or the older kernel did not support the test case.

Thank you for the attention.

Rafael
-- 
Rafael D. Tinoco
Linaro - Kernel Validation
