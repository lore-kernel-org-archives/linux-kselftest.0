From: keescook at chromium.org (Kees Cook)
Date: Thu, 25 Apr 2019 10:05:04 -0700
Subject: [PATCH v2 0/8] selftests: Move test output to diagnostic lines
In-Reply-To: <a3ca267e-8e1e-65da-77c8-c7010a39354b@kernel.org>
References: <20190424231237.14776-1-keescook@chromium.org>
 <a3ca267e-8e1e-65da-77c8-c7010a39354b@kernel.org>
Message-ID: <CAGXu5jJChvx-_E8RMTi3ioUZGuQGViy6gcAMpmvYZzms=zc6dQ@mail.gmail.com>

On Thu, Apr 25, 2019 at 9:52 AM shuah <shuah at kernel.org> wrote:
>
> On 4/24/19 5:12 PM,  wrote:
> > This refactors the selftest Makefiles to extract the test running logic
> > to be reused between "run_tests" and "emit_tests", while also fixing
> > up the test output to be TAP version 13 compliant:
> > - added "plan" line
> > - fixed result line syntax
> > - moved all test output to be "# "-prefixed as TAP "diagnostic" lines
> >
> > The prefixing code includes a fallback mode for limited execution
> > environments.
> >
> > Additionally, the plan lines are fixed for all callers of kselftest.h.
> >
> > -Kees
> >
>
> Kees,
>
> Just about to apply these to a topic branch to do testing and ran into
> checkpatch errors:
>
>
> WARNING: line over 80 characters - a few

I only saw one, which is on a string which kernel coding style says to
leave unsplit:

WARNING: line over 80 characters
#55: FILE: tools/testing/selftests/kselftest/runner.sh:19:
+               echo "$TEST_HDR_MSG: Warning: file $TEST is not
executable, correct this."

> WARNING: Misplaced SPDX-License-Identifier tag - use line 1 instead
> #141: FILE: tools/testing/selftests/kselftest/runner.sh:2:

WARNING: Misplaced SPDX-License-Identifier tag - use line 1 instead
#37: FILE: tools/testing/selftests/kselftest/runner.sh:2:
 # SPDX-License-Identifier: GPL-2.0

This is a shell script. It can't be on line 1:

$ head -n3 tools/testing/selftests/kselftest/runner.sh
#!/bin/sh
# SPDX-License-Identifier: GPL-2.0
#

That looks like a bug in checkpatch not resetting the expected line or
something.

> Can fix them and resend - SPDX one is my main concern.

These appear to be false positives; I don't think I need to fix them?
Let me know what you think.

> The plan is to apply these to linux-kselftest ksft-tap-refactor topic
> first. I don't want to rush these until we do some testing.

Absolutely. :)

Thanks!

-- 
Kees Cook
