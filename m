From: alison.schofield at intel.com (Alison Schofield)
Date: Fri, 7 Dec 2018 18:06:45 -0800
Subject: [PATCH] selftests/vm/gup_benchmark.c: match gup struct to kernel
Message-ID: <20181208020645.GA28467@alison-desk.jf.intel.com>

An expansion field was added to the kernel copy of this structure for
future use. See mm/gup_benchmark.c.

Add the same expansion field here, so that the IOCTL command decodes
correctly. Otherwise, it fails with EINVAL.

Signed-off-by: Alison Schofield <alison.schofield at intel.com>
---
 tools/testing/selftests/vm/gup_benchmark.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/vm/gup_benchmark.c b/tools/testing/selftests/vm/gup_benchmark.c
index 880b96fc80d4..c0534e298b51 100644
--- a/tools/testing/selftests/vm/gup_benchmark.c
+++ b/tools/testing/selftests/vm/gup_benchmark.c
@@ -25,6 +25,7 @@ struct gup_benchmark {
 	__u64 size;
 	__u32 nr_pages_per_call;
 	__u32 flags;
+	__u64 expansion[10];	/* For future use */
 };
 
 int main(int argc, char **argv)
-- 
2.14.1
