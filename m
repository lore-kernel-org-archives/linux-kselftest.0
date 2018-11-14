From: broonie at kernel.org (Mark Brown)
Date: Wed, 14 Nov 2018 11:50:41 -0800
Subject: [PATCH RFC 0/2] Make fsgsbase test more stable
Message-ID: <20181114195043.8021-1-broonie@kernel.org>

This series attempts to make the fsgsbase test in the x86 kselftest
report a stable result.  On some Intel systems there are intermittent
failures in this testcase which have been reported and discussed 
previously:

   https://lore.kernel.org/lkml/20180126153631.ha7yc33fj5uhitjo at xps/

with the analysis concluding that this is a hardware issue affecting a
subset of systems but no fix has been merged as yet.  In order to at
least make the test more solid for use in automated testing this series
modifies it to execute the test often enough to reproduce the problem
reliably.

I'm not happy with this since it doesn't fix the actual problem, the
code isn't particularly clean and it makes the execution time for the
selftests much longer - my main goal here is to restart the discussion
of the test failure, I don't think merging this is a great idea.

Mark Brown (2):
      selftests/x86/fsgsbase: Indirect output through a wrapper function
      selftests/x86/fsgsbase: Default to trying to run the test repeatedly

 tools/testing/selftests/x86/fsgsbase.c | 79 +++++++++++++++++++++++++---------
 1 file changed, 58 insertions(+), 21 deletions(-)
