From: alakesh.haloi@gmail.com (Alakesh Haloi)
Date: Fri, 24 May 2019 00:30:38 +0000
Subject: [PATCH] selftests: bpf: fix compiler warning
Message-ID:
 <20190524003038.GA69487@ip-172-31-44-144.us-west-2.compute.internal>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190524003038.CZvIx8nS9B3TDoES8mXBZYjA6WphAoQ9QXdnCqtcRtw@z>

Add missing header file following compiler warning

prog_tests/flow_dissector.c: In function ‘tx_tap’:
prog_tests/flow_dissector.c:175:9: warning: implicit declaration of function ‘writev’; did you mean ‘write’? [-Wimplicit-function-declaration]
  return writev(fd, iov, ARRAY_SIZE(iov));
         ^~~~~~
         write

Signed-off-by: Alakesh Haloi <alakesh.haloi at gmail.com>
---
 tools/testing/selftests/bpf/prog_tests/flow_dissector.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/bpf/prog_tests/flow_dissector.c b/tools/testing/selftests/bpf/prog_tests/flow_dissector.c
index fbd1d88a6095..c938283ac232 100644
--- a/tools/testing/selftests/bpf/prog_tests/flow_dissector.c
+++ b/tools/testing/selftests/bpf/prog_tests/flow_dissector.c
@@ -3,6 +3,7 @@
 #include <error.h>
 #include <linux/if.h>
 #include <linux/if_tun.h>
+#include <sys/uio.h>
 
 #define CHECK_FLOW_KEYS(desc, got, expected)				\
 	CHECK_ATTR(memcmp(&got, &expected, sizeof(got)) != 0,		\
-- 
2.17.1
