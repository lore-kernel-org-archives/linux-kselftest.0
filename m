From: chenr.fnst@cn.fujitsu.com (Chen Rong)
Date: Wed, 20 Dec 2017 11:15:44 +0800
Subject: [Linux-kselftest-mirror] [PATCH] selftests/bpf: remove the DEBUG
	macro for test_dev_cgroup
Message-ID: <20171220031544.13350-1-chenr.fnst@cn.fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20171220031544.mNu1ZR1TU4hVy3BZ5BzmSZsFju7H8BTTpKjNkAtsg5A@z>

The test may fail if not enable DEBUG macro in dev_cgroup.c
  # ./test_dev_cgroup
  libbpf: load bpf program failed: Operation not permitted
  libbpf: failed to load program 'cgroup/dev'
  libbpf: failed to load object './dev_cgroup.o'
  Failed to load DEV_CGROUP program

Removing the DEBUG macro makes the test always pass.

Signed-off-by: Chen Rong <chenr.fnst at cn.fujitsu.com>
---
 tools/testing/selftests/bpf/dev_cgroup.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tools/testing/selftests/bpf/dev_cgroup.c b/tools/testing/selftests/bpf/dev_cgroup.c
index ce41a34..a167c6d 100644
--- a/tools/testing/selftests/bpf/dev_cgroup.c
+++ b/tools/testing/selftests/bpf/dev_cgroup.c
@@ -13,7 +13,6 @@ SEC("cgroup/dev")
 int bpf_prog1(struct bpf_cgroup_dev_ctx *ctx)
 {
 	short type = ctx->access_type & 0xFFFF;
-#ifdef DEBUG
 	short access = ctx->access_type >> 16;
 	char fmt[] = "  %d:%d    \n";
 
@@ -39,7 +38,6 @@ int bpf_prog1(struct bpf_cgroup_dev_ctx *ctx)
 		fmt[10] = 'm';
 
 	bpf_trace_printk(fmt, sizeof(fmt), ctx->major, ctx->minor);
-#endif
 
 	/* Allow access to /dev/zero and /dev/random.
 	 * Forbid everything else.
-- 
2.5.0



--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
