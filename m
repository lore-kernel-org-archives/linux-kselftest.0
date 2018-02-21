From: labbott@redhat.com (Laura Abbott)
Date: Wed, 21 Feb 2018 14:25:41 -0800
Subject: [PATCHv2 0/2] Ion unit test with VGEM
Message-ID: <20180221222543.13633-1-labbott@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180221222541.ovbqlP5ExyvHjyimLM6GtZw2O4siIj_iKbWbCvPQu1Q@z>

Hi,

This is v2 of the series to add a unit test to Ion with VGEM. From v1:

Ion hasn't had much in the way of unit tests and fixing that is
something that needs to happen before it can move out of staging. The
difficult part of testing parts of Ion is that it relies on having a
kernel driver to actually make some of the dma_buf calls. The vgem
DRM driver exists mostly for testing and works great for this case.

Changes since v1:
- Dropped RFC
- Feedback/review from Daniel Vetter about DRM ioctls

Thanks,
Laura

Laura Abbott (2):
  selftests: ion: Remove some prints
  selftests: ion: Add simple test with the vgem driver

 tools/testing/selftests/android/ion/Makefile      |   3 +-
 tools/testing/selftests/android/ion/config        |   1 +
 tools/testing/selftests/android/ion/ionmap_test.c | 149 ++++++++++++++++++++++
 tools/testing/selftests/android/ion/ionutils.c    |   6 -
 4 files changed, 152 insertions(+), 7 deletions(-)
 create mode 100644 tools/testing/selftests/android/ion/ionmap_test.c

-- 
2.14.3

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
