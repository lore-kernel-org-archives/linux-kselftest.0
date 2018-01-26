From: bauerman@linux.vnet.ibm.com (Thiago Jung Bauermann)
Date: Fri, 26 Jan 2018 03:55:21 -0200
Subject: [Linux-kselftest-mirror] [PATCH 0/2] Testcases for protection keys
	feature in powerpc/next
Message-ID: <20180126055523.29456-1-bauerman@linux.vnet.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180126055521.7XYFjGHUtMfRnsLD1RkiClpECKMNMuAh1SGx9ddrIbs@z>

Ram Pai submitted a separate series containing the rework of the x86 test and
also the powerpc-specific tests:

https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=24741

There's a bug in the powerpc tests where they expect the AMR, IAMR and UAMOR
registers to be zeroed when a process starts. This is currently true on powernv
but isn't on LPARs, where key 31 is reserved and its bits are set. This causes
the tests to fail on that platform.

This series fixes the bug and now the tests pass on both powernv and LPAR
machines running powerpc/next. I think it's worth submitting these tests
separately from the one coming from x86 so here they are.

Thiago Jung Bauermann (2):
  selftests/powerpc: Add ptrace tests for Protection Key registers
  selftests/powerpc: Add core file test for Protection Key registers

 tools/testing/selftests/powerpc/include/reg.h      |   1 +
 tools/testing/selftests/powerpc/ptrace/Makefile    |   8 +-
 tools/testing/selftests/powerpc/ptrace/child.h     | 130 ++++++
 tools/testing/selftests/powerpc/ptrace/core-pkey.c | 460 +++++++++++++++++++++
 .../testing/selftests/powerpc/ptrace/ptrace-pkey.c | 326 +++++++++++++++
 tools/testing/selftests/powerpc/ptrace/ptrace.h    |  37 ++
 6 files changed, 961 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/powerpc/ptrace/child.h
 create mode 100644 tools/testing/selftests/powerpc/ptrace/core-pkey.c
 create mode 100644 tools/testing/selftests/powerpc/ptrace/ptrace-pkey.c

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
