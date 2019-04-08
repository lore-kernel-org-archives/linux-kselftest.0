From: pvorel at suse.cz (Petr Vorel)
Date: Mon, 8 Apr 2019 14:22:00 +0200
Subject: [RFC PATCH 1/2] selftests: Start shell API
In-Reply-To: <1554721562.17244.29.camel@linux.ibm.com>
References: <20190406214915.16914-1-pvorel@suse.cz>
 <20190406214915.16914-2-pvorel@suse.cz>
 <1554721562.17244.29.camel@linux.ibm.com>
Message-ID: <20190408122159.GA4381@dell5510>

Hi Mimi,

> > +++ b/tools/testing/selftests/kselftest.sh
> > @@ -0,0 +1,53 @@
> > +#!/bin/sh
> > +# SPDX-License-Identifier: GPL-2.0
> > +# Copyright (c) 2019 Petr Vorel <pvorel at suse.cz>
> > +
> > +PATH="$(dirname $0):$PATH"
> > +
> > +KSFT_PASS=0
> > +KSFT_FAIL=1
> > +KSFT_XFAIL=2
> > +KSFT_XPASS=3
> > +KSFT_SKIP=4

> The kexec tests only defined functions for PASS, FAIL, and SKIP.  What
> is the difference between KSFT_FAIL and KSFT_XFAIL, and similarly
> between KSFT_PASS and KSFT_XPASS?  Either here or above the functions
> should be a comment.
I guess xfail and xpass are taken from pytest [1].
I took them from kselftest.h, in order to be somehow compatible with existing C
API. But grepping code xpass is never used (not even in list of kselftest results [2]),
xfail is used in about 4 tests (binderfs, ftrace, pidfd, seccomp).

But I'm not a big fan of this pytest terminology "something is resulting the
opposite than expected", IMHO simple pass and fail are enough.
On the other hand I miss "test failed in preparation phase" (TBROK in LTP),
skip has different meaning.

Kind regards,
Petr

[1] https://docs.pytest.org/en/latest/skipping.html
[2] https://www.spinics.net/lists/linux-kselftest/msg06651.html
