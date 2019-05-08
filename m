From: skhan at linuxfoundation.org (Shuah Khan)
Date: Wed,  8 May 2019 10:26:16 -0600
Subject: [PATCH] selftests: fix install target to use default install path
Message-ID: <20190508162616.9393-1-skhan@linuxfoundation.org>

Install target fails when INSTALL_PATH is undefined. Fix install target
to use "output_dir/install as the default install location. "output_dir"
is either the root of selftests directory under kernel source tree or
output directory specified by O= or KBUILD_OUTPUT.

e.g:
make -C tools/testing/selftests install
<installs under tools/testing/selftests/install>

make O=/tmp/kselftest -C tools/testing/selftests install
<installs under /tmp/kselftest/install>

export KBUILD_OUTPUT=/tmp/kselftest
make -C tools/testing/selftests install
<installs under /tmp/kselftest/install>

In addition, add "all" target as dependency to "install" to build and
install using a single command.

Signed-off-by: Shuah Khan <skhan at linuxfoundation.org>
---
 tools/testing/selftests/Makefile | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/Makefile b/tools/testing/selftests/Makefile
index 9f05448e5e4b..c71a63b923d4 100644
--- a/tools/testing/selftests/Makefile
+++ b/tools/testing/selftests/Makefile
@@ -163,11 +163,17 @@ clean_hotplug:
 run_pstore_crash:
 	make -C pstore run_crash
 
-INSTALL_PATH ?= install
+# Use $BUILD as the default install root. $BUILD points to the
+# right output location for the following cases:
+# 1. output_dir=kernel_src
+# 2. a separate output directory is specified using O= KBUILD_OUTPUT
+# 3. a separate output directory is specified using KBUILD_OUTPUT
+#
+INSTALL_PATH ?= $(BUILD)/install
 INSTALL_PATH := $(abspath $(INSTALL_PATH))
 ALL_SCRIPT := $(INSTALL_PATH)/run_kselftest.sh
 
-install:
+install: all
 ifdef INSTALL_PATH
 	@# Ask all targets to install their files
 	mkdir -p $(INSTALL_PATH)/kselftest
-- 
2.17.1
