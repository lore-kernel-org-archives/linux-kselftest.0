From: naresh.kamboju@linaro.org (Naresh Kamboju)
Date: Tue, 28 May 2019 13:18:09 +0100
Subject: [PATCH] selftests: vm: install test_vmalloc.sh for run_vmtests
Message-ID: <20190528121809.29389-1-naresh.kamboju@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190528121809.u33d9-mV0Or46nCAZHC9zMqvhwYUAal9XbeIg-peIS4@z>

Add test_vmalloc.sh to TEST_FILES to make sure it gets installed for
run_vmtests.

Fixed below error:
./run_vmtests: line 217: ./test_vmalloc.sh: No such file or directory

Tested with: make TARGETS=vm install INSTALL_PATH=$PWD/x

Signed-off-by: Naresh Kamboju <naresh.kamboju at linaro.org>
---
 tools/testing/selftests/vm/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/testing/selftests/vm/Makefile b/tools/testing/selftests/vm/Makefile
index e13eb6cc8901..05306c58ff9f 100644
--- a/tools/testing/selftests/vm/Makefile
+++ b/tools/testing/selftests/vm/Makefile
@@ -25,6 +25,8 @@ TEST_GEN_FILES += virtual_address_range
 
 TEST_PROGS := run_vmtests
 
+TEST_FILES := test_vmalloc.sh
+
 KSFT_KHDR_INSTALL := 1
 include ../lib.mk
 
-- 
2.17.1
