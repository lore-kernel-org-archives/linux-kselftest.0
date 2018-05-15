From: rppt at linux.vnet.ibm.com (Mike Rapoport)
Date: Tue, 15 May 2018 19:05:53 +0300
Subject: [PATCH] selftests: cgroup/memcontrol: add basic test for swap controls
Message-ID: <1526400353-12991-1-git-send-email-rppt@linux.vnet.ibm.com>

The new test verifies that memory.swap.max and memory.swap.current behave
as expected for simple allocation scenarios

Signed-off-by: Mike Rapoport <rppt at linux.vnet.ibm.com>
---

The patch is against kselftest/next branch

 tools/testing/selftests/cgroup/cgroup_util.c     | 16 +++++
 tools/testing/selftests/cgroup/cgroup_util.h     |  1 +
 tools/testing/selftests/cgroup/test_memcontrol.c | 91 ++++++++++++++++++++++++
 3 files changed, 108 insertions(+)

diff --git a/tools/testing/selftests/cgroup/cgroup_util.c b/tools/testing/selftests/cgroup/cgroup_util.c
index a938b6c8b55a..41cc3b5e5be1 100644
--- a/tools/testing/selftests/cgroup/cgroup_util.c
+++ b/tools/testing/selftests/cgroup/cgroup_util.c
@@ -315,3 +315,19 @@ int alloc_anon(const char *cgroup, void *arg)
 	free(buf);
 	return 0;
 }
+
+int is_swap_enabled(void)
+{
+	char buf[PAGE_SIZE];
+	const char delim[] = "\n";
+	int cnt = 0;
+	char *line;
+
+	if (read_text("/proc/swaps", buf, sizeof(buf)) <= 0)
+		return -1;
+
+	for (line = strtok(buf, delim); line; line = strtok(NULL, delim))
+		cnt++;
+
+	return cnt > 1;
+}
diff --git a/tools/testing/selftests/cgroup/cgroup_util.h b/tools/testing/selftests/cgroup/cgroup_util.h
index 000de075d3d8..fe82a297d4e0 100644
--- a/tools/testing/selftests/cgroup/cgroup_util.h
+++ b/tools/testing/selftests/cgroup/cgroup_util.h
@@ -38,3 +38,4 @@ extern int cg_run_nowait(const char *cgroup,
 extern int get_temp_fd(void);
 extern int alloc_pagecache(int fd, size_t size);
 extern int alloc_anon(const char *cgroup, void *arg);
+extern int is_swap_enabled(void);
diff --git a/tools/testing/selftests/cgroup/test_memcontrol.c b/tools/testing/selftests/cgroup/test_memcontrol.c
index c92a21f3c806..beae06c9c899 100644
--- a/tools/testing/selftests/cgroup/test_memcontrol.c
+++ b/tools/testing/selftests/cgroup/test_memcontrol.c
@@ -638,6 +638,96 @@ static int test_memcg_max(const char *root)
 	return ret;
 }
 
+static int alloc_anon_50M_check_swap(const char *cgroup, void *arg)
+{
+	long mem_max = (long)arg;
+	size_t size = MB(50);
+	char *buf, *ptr;
+	long mem_current, swap_current;
+	int ret = -1;
+
+	buf = malloc(size);
+	for (ptr = buf; ptr < buf + size; ptr += PAGE_SIZE)
+		*ptr = 0;
+
+	mem_current = cg_read_long(cgroup, "memory.current");
+	if (!mem_current || !values_close(mem_current, mem_max, 3))
+		goto cleanup;
+
+	swap_current = cg_read_long(cgroup, "memory.swap.current");
+	if (!swap_current ||
+	    !values_close(mem_current + swap_current, size, 3))
+		goto cleanup;
+
+	ret = 0;
+cleanup:
+	free(buf);
+	return ret;
+}
+
+/*
+ * This test checks that memory.swap.max limits the amount of
+ * anonymous memory which can be swapped out.
+ */
+static int test_memcg_swap_max(const char *root)
+{
+	int ret = KSFT_FAIL;
+	char *memcg;
+	long max;
+
+	if (!is_swap_enabled())
+		return KSFT_SKIP;
+
+	memcg = cg_name(root, "memcg_test");
+	if (!memcg)
+		goto cleanup;
+
+	if (cg_create(memcg))
+		goto cleanup;
+
+	if (cg_read_long(memcg, "memory.swap.current")) {
+		ret = KSFT_SKIP;
+		goto cleanup;
+	}
+
+	if (cg_read_strcmp(memcg, "memory.max", "max\n"))
+		goto cleanup;
+
+	if (cg_read_strcmp(memcg, "memory.swap.max", "max\n"))
+		goto cleanup;
+
+	if (cg_write(memcg, "memory.swap.max", "30M"))
+		goto cleanup;
+
+	if (cg_write(memcg, "memory.max", "30M"))
+		goto cleanup;
+
+	/* Should be killed by OOM killer */
+	if (!cg_run(memcg, alloc_anon, (void *)MB(100)))
+		goto cleanup;
+
+	if (cg_read_key_long(memcg, "memory.events", "oom ") != 1)
+		goto cleanup;
+
+	if (cg_read_key_long(memcg, "memory.events", "oom_kill ") != 1)
+		goto cleanup;
+
+	if (cg_run(memcg, alloc_anon_50M_check_swap, (void *)MB(30)))
+		goto cleanup;
+
+	max = cg_read_key_long(memcg, "memory.events", "max ");
+	if (max <= 0)
+		goto cleanup;
+
+	ret = KSFT_PASS;
+
+cleanup:
+	cg_destroy(memcg);
+	free(memcg);
+
+	return ret;
+}
+
 /*
  * This test disables swapping and tries to allocate anonymous memory
  * up to OOM. Then it checks for oom and oom_kill events in
@@ -694,6 +784,7 @@ struct memcg_test {
 	T(test_memcg_high),
 	T(test_memcg_max),
 	T(test_memcg_oom_events),
+	T(test_memcg_swap_max),
 };
 #undef T
 
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
