From: anders.roxell at linaro.org (Anders Roxell)
Date: Sat, 19 May 2018 00:27:37 +0200
Subject: [PATCH v2] selftests: net: reuseport_bpf_numa: don't fail if no numa
 support
In-Reply-To: <20180306151004.31336-1-anders.roxell@linaro.org>
References: <20180306151004.31336-1-anders.roxell@linaro.org>
Message-ID: <20180518222737.16006-1-anders.roxell@linaro.org>

The reuseport_bpf_numa test case fails there's no numa support.  The
test shouldn't fail if there's no support it should be skipped.

Fixes: 3c2c3c16aaf6 ("reuseport, bpf: add test case for bpf_get_numa_node_id")
Signed-off-by: Anders Roxell <anders.roxell at linaro.org>
---
 tools/testing/selftests/net/reuseport_bpf_numa.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/net/reuseport_bpf_numa.c b/tools/testing/selftests/net/reuseport_bpf_numa.c
index 365c32e84189..c9f478b40996 100644
--- a/tools/testing/selftests/net/reuseport_bpf_numa.c
+++ b/tools/testing/selftests/net/reuseport_bpf_numa.c
@@ -23,6 +23,8 @@
 #include <unistd.h>
 #include <numa.h>
 
+#include "../kselftest.h"
+
 static const int PORT = 8888;
 
 static void build_rcv_group(int *rcv_fd, size_t len, int family, int proto)
@@ -229,7 +231,7 @@ int main(void)
 	int *rcv_fd, nodes;
 
 	if (numa_available() < 0)
-		error(1, errno, "no numa api support");
+		ksft_exit_skip("no numa api support\n");
 
 	nodes = numa_max_node() + 1;
 
-- 
2.17.0

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
