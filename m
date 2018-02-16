From: labbott@redhat.com (Laura Abbott)
Date: Thu, 15 Feb 2018 17:24:43 -0800
Subject: [RFC PATCH 0/2] Ion unit test with VGEM
Message-ID: <20180216012445.17264-1-labbott@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180216012443.CbUrui3_LfSuvCDI4e6v4OPu2fUnnOtICC58Slp-Z74@z>

Hi,

Ion hasn't had much in the way of unit tests and fixing that is
something that needs to happen before it can move out of staging. The
difficult part of testing parts of Ion is that it relies on having a
kernel driver to actually make some of the dma_buf calls. The vgem
DRM driver exists mostly for testing and works great for this case. I
went back and forth about trying to put this in the existing graphics
test suite but I think having something in the self-tests directory is
easier.

I'm mostly interested in feedback about the use of the DRM APIs but I
appreciate any and all comments.

Thanks,
Laura

Laura Abbott (2):
  selftests: ion: Remove some prints
  selftests: ion: Add simple test with the vgem driver

 tools/testing/selftests/android/ion/Makefile      |   3 +-
 tools/testing/selftests/android/ion/config        |   1 +
 tools/testing/selftests/android/ion/ionmap_test.c | 136 ++++++++++++++++++++++
 tools/testing/selftests/android/ion/ionutils.c    |   6 -
 4 files changed, 139 insertions(+), 7 deletions(-)
 create mode 100644 tools/testing/selftests/android/ion/ionmap_test.c

-- 
2.14.3

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
