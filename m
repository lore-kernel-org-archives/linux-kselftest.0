From: bauerman at linux.ibm.com (Thiago Jung Bauermann)
Date: Tue, 24 Jul 2018 23:42:06 -0300
Subject: [PATCH 0/3] userfaultfd: selftest: Improve behavior with older kernels
Message-ID: <20180725024209.32586-1-bauerman@linux.ibm.com>

Hello,

A tester ran the upstream selftest on a distro kernel and sounded the alarm when
it reported failures for features which aren't included in that kernel.

This patch set improves the test behavior in that scenario.

Thiago Jung Bauermann (3):
  userfaultfd: selftest: Fix checking of userfaultfd_open() result
  userfaultfd: selftest: Skip test if a feature isn't supported
  userfaultfd: selftest: Report XFAIL if shmem doesn't support zeropage

 tools/testing/selftests/vm/userfaultfd.c | 49 ++++++++++++++++++++++++--------
 1 file changed, 37 insertions(+), 12 deletions(-)

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
