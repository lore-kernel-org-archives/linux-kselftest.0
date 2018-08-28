From: bauerman at linux.ibm.com (Thiago Jung Bauermann)
Date: Tue, 28 Aug 2018 14:26:04 -0300
Subject: [PATCH v3 0/4] userfaultfd: selftest: Improve behavior with older
 kernels
Message-ID: <20180828172608.30075-1-bauerman@linux.ibm.com>

Hello,

This version of the series is unchanged from v2 except for the last patch
which is completely new, and is provided by Mike Rapoport.

Original series description:

> A tester ran the upstream selftest on a distro kernel and sounded the
> alarm when it reported failures for features which aren't included in
> that kernel.
> 
> This patch set improves the test behavior in that scenario.

Changes since v2:

- Added Mike Rapoport's Reviewed-by's and Acked-by's to patches 1-3. 
- Replaced patch 4/4 by the one provided by Mike Rapoport.

Changes since v1:

- Patch "userfaultfd: selftest: Skip test if userfaultfd() syscall
  not supported"
  - New patch, suggested by Mike Rapoport.

- Patch "userfaultfd: selftest: Skip test if a feature isn't supported"
  - Try running other tests even if one (or more) of them returns KSFT_SKIP.

- Patch "userfaultfd: selftest: Cope if shmem doesn't support zeropage"
  - Ignore lack of UFFDIO_ZEROPAGE in userfaultfd_events_test() and
    userfaultfd_stress().
  - Make userfaultfd_zeropage_test() return KSFT_SKIP if UFFDIO_ZEROPAGE
    isn't supported.

Mike Rapoport (1):
  userfaultfd: selftest: make supported range ioctl verification more
    robust

Thiago Jung Bauermann (3):
  userfaultfd: selftest: Fix checking of userfaultfd_open() result
  userfaultfd: selftest: Skip test if userfaultfd() syscall not
    supported
  userfaultfd: selftest: Skip test if a feature isn't supported

 tools/testing/selftests/vm/userfaultfd.c | 113 +++++++++++++++++++------------
 1 file changed, 69 insertions(+), 44 deletions(-)
