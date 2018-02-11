From: linux at dominikbrodowski.net (Dominik Brodowski)
Date: Sun, 11 Feb 2018 12:10:08 +0100
Subject: [Linux-kselftest-mirror] [PATCH 0/5] selftests/x86: fixes for
	!CONFIG_IA32_EMULATION and vsyscall=none
Message-ID: <20180211111013.16888-1-linux@dominikbrodowski.net>

On systems with CONFIG_IA32_EMULATION disabled and vsyscall disabled, a
couple of selftests fail spectacularly.

Also throw in a fix for the Makefile, which still wants to build the moved
5lvl test.

Dominik Brodowski (5):
  selftests/x86: 5lvl test has been moved
  selftests/x86: fix vDSO selftest segfault for vsyscall=none
  selftests/x86: do not rely on int $0x80 in test_mremap_vdso.c
  selftests/x86: do not rely on int $0x80 in single_step_syscall.c
  selftests/x86: disable tests requiring 32bit support on pure 64bit
    systems

 tools/testing/selftests/x86/Makefile              | 24 +++++++----
 tools/testing/selftests/x86/single_step_syscall.c |  5 ++-
 tools/testing/selftests/x86/test_mremap_vdso.c    |  4 ++
 tools/testing/selftests/x86/test_vdso.c           | 50 +++++++++++++++++++----
 4 files changed, 67 insertions(+), 16 deletions(-)

-- 
2.16.1

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
