From: broonie at kernel.org (Mark Brown)
Date: Sun,  3 Feb 2019 14:40:15 +0100
Subject: [PATCH 0/2] Make fsgsbase test more stable
Message-ID: <20190203134017.9375-1-broonie@kernel.org>

This series attempts to make the fsgsbase test in the x86 kselftest
report a stable result.  On some Intel systems there are intermittent
failures in this testcase which have been reported and discussed
previously with the initial report and last meaningful discussion having
been about a year ago:

   https://lore.kernel.org/lkml/20180126153631.ha7yc33fj5uhitjo at xps/

with the analysis concluding that this is a hardware issue affecting a
subset of systems but no fix has been merged as yet.  In order to at
least make the test more solid for use in automated testing this series
modifies it to execute the test often enough to reproduce the problem
reliably, at least for the systems I have access to.

Mark Brown (2):
  selftests/x86/fsgsbase: Indirect output through a wrapper function
  selftests/x86/fsgsbase: Default to trying to run the test repeatedly

 tools/testing/selftests/x86/fsgsbase.c | 79 +++++++++++++++++++-------
 1 file changed, 58 insertions(+), 21 deletions(-)

-- 
2.20.1
