From: changbin.du at intel.com (changbin.du at intel.com)
Date: Mon, 26 Mar 2018 17:23:24 +0800
Subject: [PATCH 0/4] selftests: fix compiling issues
Message-ID: <1522056208-4004-1-git-send-email-changbin.du@intel.com>

From: Changbin Du <changbin.du at intel.com>

These 4 patches fixed all the existing compiling errors. With this serias,
no compiling error reported after running 'make kselftest'.

Changbin Du (4):
  selftests/Makefile: append a slash to env variable OUTPUT
  selftests/gpio: fix paths in Makefile
  kselftest: install sanitized kernel headers before compiling
  selftests/bpf: fix compiling errors

 tools/testing/selftests/.gitignore      |  4 ----
 tools/testing/selftests/Makefile        | 21 ++++++++++++---------
 tools/testing/selftests/bpf/Makefile    |  5 +++--
 tools/testing/selftests/gpio/.gitignore |  4 ++++
 tools/testing/selftests/gpio/Makefile   | 14 +++++++-------
 5 files changed, 26 insertions(+), 22 deletions(-)

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
