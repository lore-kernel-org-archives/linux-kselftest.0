From: anders.roxell at linaro.org (Anders Roxell)
Date: Tue,  6 Mar 2018 16:10:04 +0100
Subject: [PATCH] selftest: net: reuseport_bpf_numa: don't fail if no numa
 support
Message-ID: <20180306151004.31336-1-anders.roxell@linaro.org>

The reuseport_bpf_numa test case fails there's no numa support.  The
test shouldn't fail if there's no support it should be skipped with a
pass.

Fixes: 3c2c3c16aaf6 ("reuseport, bpf: add test case for bpf_get_numa_node_id")
Signed-off-by: Anders Roxell <anders.roxell at linaro.org>
---
 tools/testing/selftests/net/reuseport_bpf_numa.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/net/reuseport_bpf_numa.c b/tools/testing/selftests/net/reuseport_bpf_numa.c
index 365c32e84189..9245c14165b7 100644
--- a/tools/testing/selftests/net/reuseport_bpf_numa.c
+++ b/tools/testing/selftests/net/reuseport_bpf_numa.c
@@ -228,8 +228,10 @@ int main(void)
 {
 	int *rcv_fd, nodes;
 
-	if (numa_available() < 0)
-		error(1, errno, "no numa api support");
+	if (numa_available() < 0) {
+		fprintf(stderr, "no numa api support");
+		return 0;
+	}
 
 	nodes = numa_max_node() + 1;
 
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
