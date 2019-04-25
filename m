From: shuah at kernel.org (shuah)
Date: Thu, 25 Apr 2019 10:52:41 -0600
Subject: [PATCH v2 0/8] selftests: Move test output to diagnostic lines
In-Reply-To: <20190424231237.14776-1-keescook@chromium.org>
References: <20190424231237.14776-1-keescook@chromium.org>
Message-ID: <a3ca267e-8e1e-65da-77c8-c7010a39354b@kernel.org>

On 4/24/19 5:12 PM,  wrote:
> This refactors the selftest Makefiles to extract the test running logic
> to be reused between "run_tests" and "emit_tests", while also fixing
> up the test output to be TAP version 13 compliant:
> - added "plan" line
> - fixed result line syntax
> - moved all test output to be "# "-prefixed as TAP "diagnostic" lines
> 
> The prefixing code includes a fallback mode for limited execution
> environments.
> 
> Additionally, the plan lines are fixed for all callers of kselftest.h.
> 
> -Kees
> 

Kees,

Just about to apply these to a topic branch to do testing and ran into
checkpatch errors:


WARNING: line over 80 characters - a few
WARNING: Misplaced SPDX-License-Identifier tag - use line 1 instead
#141: FILE: tools/testing/selftests/kselftest/runner.sh:2:

Can fix them and resend - SPDX one is my main concern.

The plan is to apply these to linux-kselftest ksft-tap-refactor topic
first. I don't want to rush these until we do some testing.

thanks,
-- Shuah
