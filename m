From: bhole_prashant_q7 at lab.ntt.co.jp (Prashant Bhole)
Date: Mon, 28 May 2018 13:38:00 +0900
Subject: [PATCH bpf v2 2/5] selftests/bpf: test_sockmap,
 join cgroup in selftest mode
In-Reply-To: <20180528043803.4824-1-bhole_prashant_q7@lab.ntt.co.jp>
References: <20180528043803.4824-1-bhole_prashant_q7@lab.ntt.co.jp>
Message-ID: <20180528043803.4824-3-bhole_prashant_q7@lab.ntt.co.jp>

In case of selftest mode, temporary cgroup environment is created but
cgroup is not joined. It causes test failures. Fixed by joining the
cgroup

Fixes: 16962b2404ac ("bpf: sockmap, add selftests")
Acked-by: John Fastabend <john.fastabend at gmail.com>
Signed-off-by: Prashant Bhole <bhole_prashant_q7 at lab.ntt.co.jp>
---
 tools/testing/selftests/bpf/test_sockmap.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tools/testing/selftests/bpf/test_sockmap.c b/tools/testing/selftests/bpf/test_sockmap.c
index 34feb74c95c4..8a81ea0e9fb6 100644
--- a/tools/testing/selftests/bpf/test_sockmap.c
+++ b/tools/testing/selftests/bpf/test_sockmap.c
@@ -1342,6 +1342,11 @@ static int __test_suite(char *bpf_file)
 		return cg_fd;
 	}
 
+	if (join_cgroup(CG_PATH)) {
+		fprintf(stderr, "ERROR: failed to join cgroup\n");
+		return -EINVAL;
+	}
+
 	/* Tests basic commands and APIs with range of iov values */
 	txmsg_start = txmsg_end = 0;
 	err = test_txmsg(cg_fd);
-- 
2.17.0


--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
