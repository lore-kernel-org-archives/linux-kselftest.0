From: joel@jms.id.au (Joel Stanley)
Date: Tue, 23 Oct 2018 16:46:51 +1030
Subject: [PATCH 0/6] selftests: powerpc build fixes
Message-ID: <20181023061657.18007-1-joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181023061651.7yoTpXPKtgxGJYKORgz_Elws3k-nVMPBalfmT95RHfA@z>

This series fixes issues I encountered building and running the
selftests on a Ubuntu Cosmic ppc64le system.

Joel Stanley (6):
  selftests: powerpc/ptrace: Make tests build
  selftests: powerpc/ptrace: Remove clean rule
  selftests: powerpc/ptrace: Fix linking against pthread
  selftests: powerpc/signal: Make tests build
  selftests: powerpc/signal: Fix signal_tm CFLAGS
  selftests: powerpc/pmu: Link ebb tests with -no-pie

 tools/testing/selftests/powerpc/pmu/ebb/Makefile |  3 +++
 tools/testing/selftests/powerpc/ptrace/Makefile  | 11 ++++-------
 tools/testing/selftests/powerpc/signal/Makefile  |  9 +++------
 3 files changed, 10 insertions(+), 13 deletions(-)

-- 
2.19.1
