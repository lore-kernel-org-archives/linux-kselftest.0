Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B5632D3ED2
	for <linux-kselftest@vger.kernel.org>; Mon, 23 Mar 2026 06:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774246720; cv=none; b=HdrocAtnliGPhHzTM5+SCzL8jEhQCcHTeIcN+9fW9t05piVvSvNzyGLWqpWM+Y6BnlF/b5ljXafmA9QkbkwSzBZNsO8ui9gARX/E/rpwMredi8Jq8mNbTHEmnI2JHdx81Tsx0N9tOLtl5PdIVaOAhCVkuCLWR7wSYVkNhH+1Kv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774246720; c=relaxed/simple;
	bh=+ulAROqp9BMIRtRE4eo+g729Mhzx4E2ZBQpnF5QZ/ss=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jQSPnOAgRS6PTJep1LpyWd8c0SeCJDBGhJq7m3DM8DiA6HFZY56hUoiha19d4wANLS0A+0FgNOrix/w9aseIgGwJbof4ivsRA1ev3j9Q5RNG6BdjAGgzItfgWSznGSefFsOh1pjM2q0+I/+gt6bxMzf0+c7Od0BeWR7tbEBK/Lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FNuQCoqF; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FNuQCoqF"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-35a211df8e3so2717222a91.2
        for <linux-kselftest@vger.kernel.org>; Sun, 22 Mar 2026 23:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774246719; x=1774851519; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YiuGiJFK7s0mZykuC5VH9QL+rWRsJnNtRmf0Tu1VMg4=;
        b=FNuQCoqFGjW3ZmttAlGR1LI1prgSDilSgNuVUCcQz9TyPLTcJjH/xgTH/GO6ef5ZuF
         q7oGdK/nBw/zSmBfg6iK0jVOqNjnmlDHq4y6ir4fBXzI4yIXmm2X1NeckpkkB5dtMs8E
         HjUVbjYTDFu1VNiq2nRc1H/LjoGiMNA9anmeed+fSBlw83owWCMdfKBviE+5uZNI6hIQ
         j68AGWMgbX1cKYdMxh1OFZRPSGYOj+btp17AYS9fnbxAh83K5CScQD+G+iAUzjMGuqcj
         t+irIc/8CAS5JlnE/XEAwBq0YZPt3sWoR1d+/Z6poOk+tMnsyLiA6zZV+8swHEPB4op5
         XqFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774246719; x=1774851519;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YiuGiJFK7s0mZykuC5VH9QL+rWRsJnNtRmf0Tu1VMg4=;
        b=mL4sM7gC0EM4MZwMLP1vPjVdxY7Y+xPCcBGahzSHMl9Q2293ujohBwiOe2Zke+p5v8
         hXrVkjvVlXM6AZRY9ujvLhZ65yc0i7QwbZFqDDJYu6NQJuX9O2VSE/TXZTsivWJCk0X7
         B1OsbFxh/GIE1qxRlzkaPgIsdX9bs3UlnysAi5VAUIZjD0dI6WNuQi5XVdIXXYn0CL1v
         4SF38/G4j7KAMsSE+nh0/HUBfXlJci1rE3mGNLm66EhfnLyXuucawl5ZU9kjtKNtxI2h
         I34228ZDku0t+Cx0Z/rfwEp4zWGwFROFzsKg2+iSFxHvCuETIJ+wofEm/2lBdXQxbc1S
         CJ8w==
X-Forwarded-Encrypted: i=1; AJvYcCWUNXlENoyHGBq35Xi0Qr5MeqkQySIS3kxy5rOrBW/egYdQWs+Er32+rR1w9eEOlNjenCUJF3IQMZb8oNoeWZE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzg1XfEBnSO5AD4GfeCd1QxXe+cS6zZYl9+YfodeMZbvBUt4+V2
	qUyf9A3zwZyWAK4fDetswltFCh15MtW9YLRYfrCzA5WKG+fF2XN6r4ZP
X-Gm-Gg: ATEYQzyEzo2HnaHNHxtgvrHBZVu/42SsYMLYiAtHrHjGWNUSwM2VP7rWaj9INZ18/6s
	IPnsyckNMgohFiBWr5x6Xf+7y2SVCplKC+fqUhTfrO1ugJxM+i4YJBXVtH/GnR0pV1GL8FVijvW
	0jJkmgJqMSI0YceUH2lk6IoYoKionY/r0hJTsdem86esMSHTD/kiAr4DnGMGfOeWoWDTv/WaEpv
	a83Y1YNHPqg8vlui3ThCvETnR207yEyhTnkMXmIOvJQ0pulRz45LE47l3cP0eBUPBYByLXi2+db
	8KJ3XscX40vkyCALJPB9D6jaYc2/P3ycSRN3zvko5QV0wu0hfL47pAQ3VJzDE5Le7JyF6S1k78q
	A7yPEJo2BkzCq74PFrCBfI863nibGFlGSOCl1nw4I3kp2CdsXTYdT7R2KbpNECfpA31YdKCwEWf
	CNfNd5vcZWuwbf2uwRI39yDYPZvkIe1KEsSGhwJOSdRmlel0fwNcHU3IccKHoOdbz38Ipo3deOJ
	CQ=
X-Received: by 2002:a17:90b:510a:b0:359:3426:c60a with SMTP id 98e67ed59e1d1-35bd2bd6af9mr10233363a91.4.1774246718756;
        Sun, 22 Mar 2026 23:18:38 -0700 (PDT)
Received: from mi-HP-ProDesk-680-G6-PCI-Microtower-PC.mioffice.cn ([43.224.245.226])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bc60ebdcasm11857973a91.9.2026.03.22.23.18.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 23:18:38 -0700 (PDT)
From: zhidao su <soolaugust@gmail.com>
X-Google-Original-From: zhidao su <suzhidao@xiaomi.com>
To: sched-ext@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	tj@kernel.org,
	void@manifault.com,
	arighi@nvidia.com,
	changwoo@igalia.com,
	peterz@infradead.org,
	mingo@redhat.com,
	shuah@kernel.org,
	zhidao su <suzhidao@xiaomi.com>
Subject: [PATCH 1/2] selftests/sched_ext: Add basic sub-sched functionality test
Date: Mon, 23 Mar 2026 14:18:31 +0800
Message-ID: <20260323061832.2743315-1-suzhidao@xiaomi.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implement a new selftest to verify sub-sched (nested scheduler)
attachment and detachment. This test was missing despite sub-sched
being a complex feature that has seen multiple bug fixes (cgroup
double-put, uninitialized return value, abort path issues).

Sub-sched allows a child BPF scheduler to manage tasks within a
specific cgroup subtree, coordinating with the parent scheduler
via sub_attach/sub_detach operations.

Test structure:
- Parent BPF scheduler: Implements sub_attach/sub_detach ops;
  sub_attach returns s32 as required by the kernel ABI
- Child BPF scheduler: Minimal dispatch logic, configured with
  sub_cgroup_id pointing to a test cgroup
- Test driver: Creates a cgroup under /sys/fs/cgroup/ (cgroupfs),
  obtains the cgroup ID via stat().st_ino (which equals the kernfs
  node ID on cgroupfs), loads both schedulers, attaches child to
  the cgroup, verifies clean detachment

Note: The cgroup must be created under /sys/fs/cgroup/ rather than
/tmp/, because cgroup_get_from_id() uses kernfs_find_and_get_node_by_id()
in the cgroupfs kernfs root. A tmpfs inode is not a valid cgroup ID.

Signed-off-by: zhidao su <suzhidao@xiaomi.com>
---
 tools/testing/selftests/sched_ext/Makefile    |   1 +
 tools/testing/selftests/sched_ext/sub_sched.c | 200 ++++++++++++++++++
 .../selftests/sched_ext/sub_sched_child.bpf.c |  31 +++
 .../sched_ext/sub_sched_parent.bpf.c          |  35 +++
 4 files changed, 267 insertions(+)
 create mode 100644 tools/testing/selftests/sched_ext/sub_sched.c
 create mode 100644 tools/testing/selftests/sched_ext/sub_sched_child.bpf.c
 create mode 100644 tools/testing/selftests/sched_ext/sub_sched_parent.bpf.c

diff --git a/tools/testing/selftests/sched_ext/Makefile b/tools/testing/selftests/sched_ext/Makefile
index 84e4f69b8833..211eef9443a9 100644
--- a/tools/testing/selftests/sched_ext/Makefile
+++ b/tools/testing/selftests/sched_ext/Makefile
@@ -190,6 +190,7 @@ auto-test-targets :=			\
 	select_cpu_dispatch_dbl_dsp	\
 	select_cpu_vtime		\
 	rt_stall			\
+	sub_sched			\
 	test_example			\
 	total_bw			\
 
diff --git a/tools/testing/selftests/sched_ext/sub_sched.c b/tools/testing/selftests/sched_ext/sub_sched.c
new file mode 100644
index 000000000000..4fbd4a60ab03
--- /dev/null
+++ b/tools/testing/selftests/sched_ext/sub_sched.c
@@ -0,0 +1,200 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Basic test for sub-sched functionality.
+ *
+ * Tests the ability to attach a child scheduler to a specific cgroup
+ * via the sub_cgroup_id mechanism.
+ *
+ * Copyright (c) 2026 Xiaomi Corporation.
+ */
+
+#include <bpf/bpf.h>
+#include <errno.h>
+#include <fcntl.h>
+#include <scx/common.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/mount.h>
+#include <sys/stat.h>
+#include <sys/types.h>
+#include <unistd.h>
+#include "sub_sched_parent.bpf.skel.h"
+#include "sub_sched_child.bpf.skel.h"
+#include "scx_test.h"
+
+#define TEST_CGROUP_PATH "/sys/fs/cgroup/test_sub_sched"
+
+struct test_context {
+	struct sub_sched_parent *parent_skel;
+	struct sub_sched_child *child_skel;
+	char cgroup_path[256];
+};
+
+/**
+ * Create a cgroup v2 for testing.
+ * Returns the inode number (which serves as cgroup ID) on success, -1 on error.
+ */
+static u64 create_test_cgroup(const char *path)
+{
+	struct stat st;
+
+	/* Create the test cgroup directory */
+	if (mkdir(path, 0755) < 0) {
+		if (errno != EEXIST) {
+			SCX_ERR("Failed to create cgroup: %s", strerror(errno));
+			return -1;
+		}
+	}
+
+	/* Get the inode number (cgroup ID) */
+	if (stat(path, &st) < 0) {
+		SCX_ERR("Failed to stat cgroup: %s", strerror(errno));
+		return -1;
+	}
+
+	return st.st_ino;
+}
+
+static void cleanup_cgroup(const char *path)
+{
+	if (rmdir(path) < 0 && errno != ENOENT)
+		SCX_ERR("Warning: Failed to cleanup cgroup: %s", strerror(errno));
+}
+
+/**
+ * Setup: Create cgroup, load both parent and child BPF programs.
+ */
+static enum scx_test_status setup(void **ctx)
+{
+	struct test_context *test_ctx;
+	u64 cgroup_id;
+
+	test_ctx = calloc(1, sizeof(*test_ctx));
+	if (!test_ctx)
+		return SCX_TEST_FAIL;
+
+	/* Create test cgroup */
+	snprintf(test_ctx->cgroup_path, sizeof(test_ctx->cgroup_path),
+		 "%s.%d", TEST_CGROUP_PATH, getpid());
+
+	cgroup_id = create_test_cgroup(test_ctx->cgroup_path);
+	if (cgroup_id == (u64)-1) {
+		SCX_ERR("Failed to create test cgroup");
+		free(test_ctx);
+		return SCX_TEST_FAIL;
+	}
+
+	/* Load parent scheduler */
+	test_ctx->parent_skel = sub_sched_parent__open();
+	if (!test_ctx->parent_skel) {
+		SCX_ERR("Failed to open parent BPF skeleton");
+		cleanup_cgroup(test_ctx->cgroup_path);
+		free(test_ctx);
+		return SCX_TEST_FAIL;
+	}
+
+	SCX_ENUM_INIT(test_ctx->parent_skel);
+	if (sub_sched_parent__load(test_ctx->parent_skel)) {
+		SCX_ERR("Failed to load parent BPF program");
+		sub_sched_parent__destroy(test_ctx->parent_skel);
+		cleanup_cgroup(test_ctx->cgroup_path);
+		free(test_ctx);
+		return SCX_TEST_FAIL;
+	}
+
+	/* Load child scheduler */
+	test_ctx->child_skel = sub_sched_child__open();
+	if (!test_ctx->child_skel) {
+		SCX_ERR("Failed to open child BPF skeleton");
+		sub_sched_parent__destroy(test_ctx->parent_skel);
+		cleanup_cgroup(test_ctx->cgroup_path);
+		free(test_ctx);
+		return SCX_TEST_FAIL;
+	}
+
+	/* Set sub_cgroup_id to the test cgroup's inode */
+	test_ctx->child_skel->struct_ops.sub_sched_child_ops->sub_cgroup_id = cgroup_id;
+
+	SCX_ENUM_INIT(test_ctx->child_skel);
+	if (sub_sched_child__load(test_ctx->child_skel)) {
+		SCX_ERR("Failed to load child BPF program");
+		sub_sched_child__destroy(test_ctx->child_skel);
+		sub_sched_parent__destroy(test_ctx->parent_skel);
+		cleanup_cgroup(test_ctx->cgroup_path);
+		free(test_ctx);
+		return SCX_TEST_FAIL;
+	}
+
+	*ctx = test_ctx;
+	return SCX_TEST_PASS;
+}
+
+/**
+ * Run: Test loading parent, then loading child scheduler.
+ *
+ * This tests:
+ * 1. Parent scheduler loads successfully
+ * 2. Child scheduler attaches to the specified cgroup
+ * 3. No crashes or resource leaks
+ */
+static enum scx_test_status run(void *ctx)
+{
+	struct test_context *test_ctx = ctx;
+	struct bpf_link *parent_link;
+	struct bpf_link *child_link;
+
+	/* Attach parent scheduler */
+	parent_link = bpf_map__attach_struct_ops(test_ctx->parent_skel->maps.sub_sched_parent_ops);
+	if (!parent_link) {
+		SCX_ERR("Failed to attach parent scheduler");
+		return SCX_TEST_FAIL;
+	}
+
+	/* Attach child scheduler to the cgroup */
+	child_link = bpf_map__attach_struct_ops(test_ctx->child_skel->maps.sub_sched_child_ops);
+	if (!child_link) {
+		SCX_ERR("Failed to attach child scheduler");
+		bpf_link__destroy(parent_link);
+		return SCX_TEST_FAIL;
+	}
+
+	/* Let both schedulers run briefly to ensure they don't crash */
+	sleep(1);
+
+	/* Detach child first (sub-sched must be detached before parent) */
+	bpf_link__destroy(child_link);
+
+	/* Then detach parent */
+	bpf_link__destroy(parent_link);
+
+	return SCX_TEST_PASS;
+}
+
+static void cleanup(void *ctx)
+{
+	struct test_context *test_ctx = ctx;
+
+	if (!test_ctx)
+		return;
+
+	if (test_ctx->child_skel)
+		sub_sched_child__destroy(test_ctx->child_skel);
+
+	if (test_ctx->parent_skel)
+		sub_sched_parent__destroy(test_ctx->parent_skel);
+
+	cleanup_cgroup(test_ctx->cgroup_path);
+
+	free(test_ctx);
+}
+
+struct scx_test sub_sched_basic = {
+	.name = "sub_sched_basic",
+	.description = "Test basic sub-sched attachment and detachment",
+	.setup = setup,
+	.run = run,
+	.cleanup = cleanup,
+};
+
+REGISTER_SCX_TEST(&sub_sched_basic)
diff --git a/tools/testing/selftests/sched_ext/sub_sched_child.bpf.c b/tools/testing/selftests/sched_ext/sub_sched_child.bpf.c
new file mode 100644
index 000000000000..4df9f049def1
--- /dev/null
+++ b/tools/testing/selftests/sched_ext/sub_sched_child.bpf.c
@@ -0,0 +1,31 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Child scheduler for sub-sched testing.
+ *
+ * This is a minimal scheduler that attaches to a specific cgroup via
+ * sub_cgroup_id. The BPF loader will populate sub_cgroup_id at load time
+ * before attaching.
+ *
+ * Copyright (c) 2026 Xiaomi Corporation.
+ */
+
+#include <scx/common.bpf.h>
+
+char _license[] SEC("license") = "GPL";
+
+__u64 dispatch_count;
+
+void BPF_STRUCT_OPS(sub_sched_child_dispatch, s32 cpu, struct task_struct *prev)
+{
+	/* Minimal dispatch: just return without dispatching anything.
+	 * The kernel will use the default scheduling paths.
+	 */
+	__sync_fetch_and_add(&dispatch_count, 1);
+}
+
+SEC(".struct_ops.link")
+struct sched_ext_ops sub_sched_child_ops = {
+	.name			= "sub_sched_child",
+	.sub_cgroup_id		= 0,  /* Will be set by user space */
+	.dispatch		= (void *)sub_sched_child_dispatch,
+};
diff --git a/tools/testing/selftests/sched_ext/sub_sched_parent.bpf.c b/tools/testing/selftests/sched_ext/sub_sched_parent.bpf.c
new file mode 100644
index 000000000000..8b632b31c682
--- /dev/null
+++ b/tools/testing/selftests/sched_ext/sub_sched_parent.bpf.c
@@ -0,0 +1,35 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Parent scheduler for sub-sched testing.
+ *
+ * This scheduler demonstrates the sub_attach/sub_detach ops that allow
+ * a parent scheduler to manage sub-schedulers attached to specific cgroups.
+ *
+ * Copyright (c) 2026 Xiaomi Corporation.
+ */
+
+#include <scx/common.bpf.h>
+
+char _license[] SEC("license") = "GPL";
+
+/* Simple counter for diagnostics */
+__u64 attach_count;
+__u64 detach_count;
+
+s32 BPF_STRUCT_OPS(parent_sub_attach, struct scx_sub_attach_args *args)
+{
+	__sync_fetch_and_add(&attach_count, 1);
+	return 0;
+}
+
+void BPF_STRUCT_OPS(parent_sub_detach, struct scx_sub_detach_args *args)
+{
+	__sync_fetch_and_add(&detach_count, 1);
+}
+
+SEC(".struct_ops.link")
+struct sched_ext_ops sub_sched_parent_ops = {
+	.name			= "sub_sched_parent",
+	.sub_attach		= (void *)parent_sub_attach,
+	.sub_detach		= (void *)parent_sub_detach,
+};
-- 
2.43.0

