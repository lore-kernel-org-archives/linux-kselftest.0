From: bauerman at linux.ibm.com (Thiago Jung Bauermann)
Date: Fri,  3 Aug 2018 19:00:42 -0300
Subject: [PATCH v2 0/4] userfaultfd: selftest: Improve behavior with older
 kernels
Message-ID: <20180803220046.4019-1-bauerman@linux.ibm.com>

Hello,

A tester ran the upstream selftest on a distro kernel and sounded the alarm when
it reported failures for features which aren't included in that kernel.

This patch set improves the test behavior in that scenario.

Changes since v1:

- Patch "userfaultfd: selftest: Skip test if userfaultfd() syscall
  not supported"
  - New patch, suggested by Mke Rapoport.

- Patch "userfaultfd: selftest: Skip test if a feature isn't supported"
  - Try running other tests even if one (or more) of them returns KSFT_SKIP.

- Patch "userfaultfd: selftest: Cope if shmem doesn't support zeropage"
  - Ignore lack of UFFDIO_ZEROPAGE in userfaultfd_events_test() and
    userfaultfd_stress().
  - Make userfaultfd_zeropage_test() return KSFT_SKIP if UFFDIO_ZEROPAGE
    isn't supported.

Thiago Jung Bauermann (4):
  userfaultfd: selftest: Fix checking of userfaultfd_open() result
  userfaultfd: selftest: Skip test if userfaultfd() syscall not
    supported
  userfaultfd: selftest: Skip test if a feature isn't supported
  userfaultfd: selftest: Cope if shmem doesn't support zeropage

 tools/testing/selftests/vm/userfaultfd.c | 86 ++++++++++++++++++++++++--------
 1 file changed, 66 insertions(+), 20 deletions(-)

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
