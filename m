From: changbin.du at intel.com (changbin.du at intel.com)
Date: Tue, 27 Mar 2018 11:11:30 +0800
Subject: [PATCH v2 0/4] selftests: fix compiling issues
Message-ID: <1522120294-24926-1-git-send-email-changbin.du@intel.com>

From: Changbin Du <changbin.du at intel.com>

These 4 patches fixed all the existing compiling errors. With this serias,
no compiling error reported after running 'make kselftest'.

v2: resolve compiling error if run make in individual folder.

Changbin Du (4):
  selftests/Makefile: append a slash to env variable OUTPUT
  selftests/gpio: fix paths in Makefile
  kselftest: install sanitized kernel headers before compiling
  selftests/bpf: fix compiling errors

 tools/testing/selftests/.gitignore      |  4 ----
 tools/testing/selftests/Makefile        | 21 ++++++++++++---------
 tools/testing/selftests/bpf/Makefile    |  5 +++--
 tools/testing/selftests/gpio/.gitignore |  4 ++++
 tools/testing/selftests/gpio/Makefile   | 17 +++++++++--------
 5 files changed, 28 insertions(+), 23 deletions(-)

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
