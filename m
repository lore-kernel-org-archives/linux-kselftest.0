From: yuehaibing@huawei.com (YueHaibing)
Date: Fri, 25 Jan 2019 10:46:34 +0800
Subject: [PATCH -next] selftests: bpf: remove duplicated include
Message-ID: <20190125024634.14580-1-yuehaibing@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190125024634.8WuU3TMNeBYPtrd1aqBqg5rE3fxAvzSQz2dyHOdxkKo@z>

Remove duplicated include.

Signed-off-by: YueHaibing <yuehaibing at huawei.com>
---
 tools/testing/selftests/bpf/test_flow_dissector.c | 2 --
 tools/testing/selftests/bpf/test_maps.c           | 1 -
 tools/testing/selftests/bpf/test_sockmap.c        | 1 -
 3 files changed, 4 deletions(-)

diff --git a/tools/testing/selftests/bpf/test_flow_dissector.c b/tools/testing/selftests/bpf/test_flow_dissector.c
index 12b784a..01f0c63 100644
--- a/tools/testing/selftests/bpf/test_flow_dissector.c
+++ b/tools/testing/selftests/bpf/test_flow_dissector.c
@@ -16,7 +16,6 @@
 #include <errno.h>
 #include <linux/if_packet.h>
 #include <linux/if_ether.h>
-#include <linux/if_packet.h>
 #include <linux/ipv6.h>
 #include <netinet/ip.h>
 #include <netinet/in.h>
@@ -25,7 +24,6 @@
 #include <stdbool.h>
 #include <stdlib.h>
 #include <stdio.h>
-#include <stdlib.h>
 #include <string.h>
 #include <sys/ioctl.h>
 #include <sys/socket.h>
diff --git a/tools/testing/selftests/bpf/test_maps.c b/tools/testing/selftests/bpf/test_maps.c
index e2b9eee..1dfef77 100644
--- a/tools/testing/selftests/bpf/test_maps.c
+++ b/tools/testing/selftests/bpf/test_maps.c
@@ -633,7 +633,6 @@ static void test_stackmap(int task, void *data)
 	close(fd);
 }
 
-#include <sys/socket.h>
 #include <sys/ioctl.h>
 #include <arpa/inet.h>
 #include <sys/select.h>
diff --git a/tools/testing/selftests/bpf/test_sockmap.c b/tools/testing/selftests/bpf/test_sockmap.c
index e85a771..3845144 100644
--- a/tools/testing/selftests/bpf/test_sockmap.c
+++ b/tools/testing/selftests/bpf/test_sockmap.c
@@ -10,7 +10,6 @@
 #include <unistd.h>
 #include <string.h>
 #include <errno.h>
-#include <sys/ioctl.h>
 #include <stdbool.h>
 #include <signal.h>
 #include <fcntl.h>
-- 
2.7.0
