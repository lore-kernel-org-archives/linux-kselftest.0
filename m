From: f.fainelli at gmail.com (Florian Fainelli)
Date: Wed, 13 Jun 2018 20:39:24 -0700
Subject: Improving kselfests cross compilation
Message-ID: <19ec8c01-15a0-eca2-cf6c-08c71b670dab@gmail.com>

Hi Shuah,

I was giving a shot at building the kselftests from within buildroot [1]
as of Linux be779f03d563981c65cc7417cc5e0dbbc5b89d30 and there are a
number of things that make it still reasonably hard even today:

- 3c545084130c1fd5cf873a5fec3ee29070128e06 ("selftests: sparc64: char:
Selftest for privileged ADI driver") this contains inline assembly that
can only work when building for sparc64, yet this is still being built
irrespective of what ARCH is set to

- each Makefile that requires knowledge of the architecture seems to
duplicate what ARCH should be, this cannot be moved to lib.mk since
Makefiles do expect lib.mk to be included last and/or after they have
done their own overrides, but something like common.mk which contains
CC, ARCH etc. could be useful to avoid the repetition of looking at
uname -m etc. etc.

- some tests' Makefile do seem to hardcode paths to the system's include
instead of accepting a configurable path:

gpio/Makefile:

LDLIBS += -lmount -I/usr/include/libmount

I will try to submit patches in the next days that address the most
obvious issues I listed here, but in order for this effort not to be a
constant whack-a-mole game, there really needs to be at least one or two
architectures that must attempt to cross-compile (and run) those tests
and use that as an acceptance criteria.

Thanks for reading.

[1]:
https://git.buildroot.org/buildroot/tree/package/linux-tools/linux-tool-selftests.mk.in
-- 
Florian
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
