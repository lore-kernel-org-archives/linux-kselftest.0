From: skhan@linuxfoundation.org (Shuah Khan)
Date: Fri, 19 Apr 2019 17:23:09 -0600
Subject: [PATCH] selftests: build and run gpio when output directory is the
 src dir
Message-ID: <20190419232309.9664-1-skhan@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190419232309.xKdXhpPNgrCUezfDcu96ZJFMVCWUiAyaBquD4Fjg8to@z>

Build and run gpio when output directory is the src dir.  gpio has
dependency on tools/gpio and builds tools/gpio objects in the src
directory in all cases making the src repo dirty even when object
relocation is specified.

This fixes the following commands from generating gpio objects in
the source repository:

make O=dir kselftest
export KBUILD_OUTPUT=dir; make kselftest
make O=dir -C tools/testing/selftests
expoert KBUILD_OUTPUT=dir; make -C tools/testing/selftests

The following still don't work (need fixing in gpio Makefile):
make O=dir kselftest TARGETS="gpio"
export KBUILD_OUTPUT=dir; make kselftest TARGETS="gpio"
make O=dir -C tools/testing/selftests TARGETS="gpio"
expoert KBUILD_OUTPUT=dir; make -C tools/testing/selftests TARGETS="gpio"

Signed-off-by: Shuah Khan <skhan at linuxfoundation.org>
---
 tools/testing/selftests/Makefile | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/tools/testing/selftests/Makefile b/tools/testing/selftests/Makefile
index b43c5f41fb3e..f2ebf8cf4686 100644
--- a/tools/testing/selftests/Makefile
+++ b/tools/testing/selftests/Makefile
@@ -99,6 +99,15 @@ ARCH           ?= $(SUBARCH)
 export KSFT_KHDR_INSTALL_DONE := 1
 export BUILD
 
+# build and run gpio when output directory is the src dir.
+# gpio has dependency on tools/gpio and builds tools/gpio
+# objects in the src directory in all cases making the src
+# repo dirty even when objects are relocated.
+ifneq (1,$(DEFAULT_INSTALL_HDR_PATH))
+	TMP := $(filter-out gpio, $(TARGETS))
+	TARGETS := $(TMP)
+endif
+
 # set default goal to all, so make without a target runs all, even when
 # all isn't the first target in the file.
 .DEFAULT_GOAL := all
-- 
2.17.1
