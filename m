Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 178C73AE702
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Mar 2026 14:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772805826; cv=none; b=UYCD7P9YBCQZrshonkpkS3VOJPW7z3zVrZ3zyKq4kx6SCG6R82yLfxYja7iWvdbT9szFyF6QO0iL3zJAM4gfqCv8kUhnwr0WXGNgjn0jwMklIBXY0lSej2VokNwJQo4Iipf/hcadozh5sojbW+I/dGgSnlWruDlTs3itlJF6YtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772805826; c=relaxed/simple;
	bh=BZeeJ1JML7xaZoBvWAKlQYnkV7F90b7mZuzv0ATZ6Jw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JuFd1UrO2OB751tocm3p42kuTBTr2TjDeKZfthBcIW81GscLekybpYpWsbBrzgnVGFW4vZisRSlMswPrBO2nS+hU1yb36AyIELl1cTd7LnNBZMvJ8trPRZkI+BoKW99JGHf8n1UhWiAM5VCG8kejrBDjm8K1U3ZW8xf+FIOkBaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BTynWW/r; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BTynWW/r"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2ae4e538abdso53691165ad.3
        for <linux-kselftest@vger.kernel.org>; Fri, 06 Mar 2026 06:03:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772805824; x=1773410624; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6TnQKdPGtTuRU+46cutq94eviTJ71u1qZiPiKlbjQJQ=;
        b=BTynWW/rBPZ4TsF4UVh/IPVXD6/0mfdrGZdQmVJ48xToAKHY0g1CDJuqDZb2Zs6TIf
         wJoQNbl6uRp0C35s+bYbEPtQMCOsgD4En9gqjYPGle+Wr1LkW/TfKWj0P7FFrtLqxcdf
         KQ2E8sVGvXNIPvS5MeSOGgdVFq9ixcdh+xmyMyX4jTroAcuH/PLyeKz+RHVwkZTPb4et
         m7c0lKkfg10eG5RwdiAvirjJTSvTl/WInPiqj/mcM4KrU0j/DsDrolUpiG7nD7M9sUcO
         yuEB8L9izI5nFLyL0UKuGHcGHZKR8EK6zYOLnL4/FX6NS6DyuqVQSNsixd1BREiWzWfB
         YDdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772805824; x=1773410624;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6TnQKdPGtTuRU+46cutq94eviTJ71u1qZiPiKlbjQJQ=;
        b=Q1jLjO5bWW0fJ5qYXhhWOObJR5FkTzKc83AlGlmmIhXADF1HcCFxhySCUVO/zuVFcZ
         rJquKr7yZQQlj/T186lLG8lcXHU6sGtDZaBBNCYNVLKCQENY8SHyN04+KHQzOxhx6eDa
         6VgoUILE/4FrmVATCZ2tKp/solBPodyT/dHSw5rFTkqQtoHbOZu7VWz0WtLPaIYw0j6m
         02fVww9sPPohgcV+ZqIoWg1gubYPABGJmSKsMTVySdGxnw+K0Y3FWZgSok8nMfXCNn6a
         EiC25T+QKugmZqp0F2Hi/m5JokrvqhQdWyWdRUIkwRQKUTkHSw1UUsrEmQ6e+rS6xv7/
         qnjg==
X-Forwarded-Encrypted: i=1; AJvYcCV3Q0DOSaUSv7jUTNUhop/jBuGjLD3fsdNENdmWWi7uxST9FdCKoGiE7j3ivb1qg7yuPASX6Zs/F/Z5vLPXvwM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYuq6azHFou8MEgna0lwB/Jdohy1cJ2yDPqPNj2BaY4Rsc/em3
	c1N04RhkyyxU3MCivYbNUNq1nMGEAASbnSRqqUZt0WeJn6a8X+A+UPoK
X-Gm-Gg: ATEYQzw2sP8TCr46cr8vMmXXG/C4RBiQp6evBPF0rbGp2lJExTTH82N5yqYV1wDLd9H
	kOvyEedf3ivOXIAmZze3GarVC3ffYkxgfQFQAtskannGnWhxtsTMWi4oHpYnq40IKm/3N1BYl12
	sEVEKlL5wwckvrhcNuR4Zq6FVL3fdQ2yJMXxdWo5IsiwIXnN3+5BACHFrSNZxyfLVSWPY+i/Ybn
	N/3pO8jnzGyLho4NTSmgqFFlVAXOQKvF7gW6Q3tEkRA5xgTR68zdestW5UT8CCmzY66vQiqkzJX
	YHfYwFVGbqo1UMLlwfUYwJNBrsI3ycyI7y5xifOaOw+7jz5QN6yxoaLEIMDe3bUneJBlxr2k/O/
	XC/Du+ergINtG7/Yo4TeA+qsmQs/KmQ4KmZrhYZ8FKioCYzmfCz9/vl6Vim3+3bHmshf++q8E0V
	PHWG3h6Ks4GuyzeJK7WlFkHJbumcApbZfeM4upe6uOE0hwcsJr6og3S2Tz+FSnMv1p/cpuKIevK
	P0=
X-Received: by 2002:a17:902:f78a:b0:2ae:4948:f866 with SMTP id d9443c01a7336-2ae8239bd5emr22877785ad.22.1772805824108;
        Fri, 06 Mar 2026 06:03:44 -0800 (PST)
Received: from mi-HP-ProDesk-680-G6-PCI-Microtower-PC.mioffice.cn ([43.224.245.226])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae840ccb6csm29134715ad.92.2026.03.06.06.03.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 06:03:43 -0800 (PST)
From: zhidao su <soolaugust@gmail.com>
X-Google-Original-From: zhidao su <suzhidao@xiaomi.com>
To: tj@kernel.org,
	sched-ext@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: void@manifault.com,
	arighi@nvidia.com,
	changwoo@igalia.com,
	linux-kselftest@vger.kernel.org,
	Su Zhidao <suzhidao@xiaomi.com>
Subject: [PATCH 4/5] sched_ext/selftests: Add bypass mode operational test
Date: Fri,  6 Mar 2026 22:03:24 +0800
Message-ID: <20260306140325.2710927-5-suzhidao@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260306140325.2710927-1-suzhidao@xiaomi.com>
References: <20260306140325.2710927-1-suzhidao@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Su Zhidao <suzhidao@xiaomi.com>

Add a test that verifies the sched_ext bypass mechanism does not
prevent tasks from running to completion.

The test attaches a minimal global FIFO scheduler, spawns worker
processes that complete a fixed computation, detaches the scheduler
(which triggers bypass mode while workers are still active), and
verifies all workers complete successfully under bypass mode.

This exercises the scheduler attach/detach lifecycle and verifies
that bypass mode (activated during unregistration to guarantee
forward progress) does not stall running tasks.

Signed-off-by: Su Zhidao <suzhidao@xiaomi.com>
---
 tools/testing/selftests/sched_ext/Makefile    |   1 +
 .../testing/selftests/sched_ext/bypass.bpf.c  |  32 ++++++
 tools/testing/selftests/sched_ext/bypass.c    | 105 ++++++++++++++++++
 3 files changed, 138 insertions(+)
 create mode 100644 tools/testing/selftests/sched_ext/bypass.bpf.c
 create mode 100644 tools/testing/selftests/sched_ext/bypass.c

diff --git a/tools/testing/selftests/sched_ext/Makefile b/tools/testing/selftests/sched_ext/Makefile
index a3bbe2c7911b..5fb6278d3f97 100644
--- a/tools/testing/selftests/sched_ext/Makefile
+++ b/tools/testing/selftests/sched_ext/Makefile
@@ -162,6 +162,7 @@ endef
 all_test_bpfprogs := $(foreach prog,$(wildcard *.bpf.c),$(INCLUDE_DIR)/$(patsubst %.c,%.skel.h,$(prog)))
 
 auto-test-targets :=			\
+	bypass				\
 	create_dsq			\
 	dequeue				\
 	enq_last_no_enq_fails		\
diff --git a/tools/testing/selftests/sched_ext/bypass.bpf.c b/tools/testing/selftests/sched_ext/bypass.bpf.c
new file mode 100644
index 000000000000..cb37c8df6834
--- /dev/null
+++ b/tools/testing/selftests/sched_ext/bypass.bpf.c
@@ -0,0 +1,32 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * BPF scheduler for bypass mode operational test.
+ *
+ * Implements a minimal global FIFO scheduler. The userspace side
+ * attaches this scheduler, runs worker tasks to completion, and
+ * verifies that tasks complete successfully.
+ *
+ * Copyright (c) 2026 Xiaomi Corporation.
+ */
+#include <scx/common.bpf.h>
+
+char _license[] SEC("license") = "GPL";
+
+UEI_DEFINE(uei);
+
+void BPF_STRUCT_OPS(bypass_enqueue, struct task_struct *p, u64 enq_flags)
+{
+	scx_bpf_dsq_insert(p, SCX_DSQ_GLOBAL, SCX_SLICE_DFL, enq_flags);
+}
+
+void BPF_STRUCT_OPS(bypass_exit, struct scx_exit_info *ei)
+{
+	UEI_RECORD(uei, ei);
+}
+
+SEC(".struct_ops.link")
+struct sched_ext_ops bypass_ops = {
+	.enqueue		= (void *)bypass_enqueue,
+	.exit			= (void *)bypass_exit,
+	.name			= "bypass_test",
+};
diff --git a/tools/testing/selftests/sched_ext/bypass.c b/tools/testing/selftests/sched_ext/bypass.c
new file mode 100644
index 000000000000..952f09d76bdb
--- /dev/null
+++ b/tools/testing/selftests/sched_ext/bypass.c
@@ -0,0 +1,105 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Verify the sched_ext bypass mechanism: spawn worker tasks and ensure
+ * they run to completion while a BPF scheduler is active.
+ *
+ * The bypass mechanism (activated on scheduler unregistration) must
+ * guarantee forward progress. This test verifies that worker tasks
+ * complete successfully when the scheduler is detached.
+ *
+ * Copyright (c) 2026 Xiaomi Corporation.
+ */
+#define _GNU_SOURCE
+#include <unistd.h>
+#include <sys/wait.h>
+#include <bpf/bpf.h>
+#include <scx/common.h>
+#include "scx_test.h"
+#include "bypass.bpf.skel.h"
+
+#define NUM_BYPASS_WORKERS 4
+
+static void worker_fn(void)
+{
+	volatile int sum = 0;
+	int i;
+
+	/*
+	 * Do enough work to still be running when bpf_link__destroy()
+	 * is called, ensuring tasks are active during bypass mode.
+	 */
+	for (i = 0; i < 10000000; i++)
+		sum += i;
+}
+
+static enum scx_test_status setup(void **ctx)
+{
+	struct bypass *skel;
+
+	skel = bypass__open();
+	SCX_FAIL_IF(!skel, "Failed to open bypass skel");
+	SCX_ENUM_INIT(skel);
+	SCX_FAIL_IF(bypass__load(skel), "Failed to load bypass skel");
+
+	*ctx = skel;
+	return SCX_TEST_PASS;
+}
+
+static enum scx_test_status run(void *ctx)
+{
+	struct bypass *skel = ctx;
+	struct bpf_link *link;
+	pid_t pids[NUM_BYPASS_WORKERS];
+	int i, status;
+
+	link = bpf_map__attach_struct_ops(skel->maps.bypass_ops);
+	SCX_FAIL_IF(!link, "Failed to attach bypass scheduler");
+
+	/*
+	 * Spawn worker processes. These must complete successfully
+	 * even as the scheduler is active and then detached (which
+	 * triggers bypass mode).
+	 */
+	for (i = 0; i < NUM_BYPASS_WORKERS; i++) {
+		pids[i] = fork();
+		SCX_FAIL_IF(pids[i] < 0, "fork() failed for worker %d", i);
+
+		if (pids[i] == 0) {
+			worker_fn();
+			_exit(0);
+		}
+	}
+
+	/*
+	 * Detach the scheduler while workers are still running. This
+	 * triggers bypass mode, which must guarantee forward progress
+	 * for all active tasks.
+	 */
+	bpf_link__destroy(link);
+
+	/* Workers must complete successfully under bypass mode */
+	for (i = 0; i < NUM_BYPASS_WORKERS; i++) {
+		SCX_FAIL_IF(waitpid(pids[i], &status, 0) != pids[i],
+			    "waitpid failed for worker %d", i);
+		SCX_FAIL_IF(!WIFEXITED(status) || WEXITSTATUS(status) != 0,
+			    "Worker %d did not exit cleanly", i);
+	}
+
+	SCX_EQ(skel->data->uei.kind, EXIT_KIND(SCX_EXIT_UNREG));
+
+	return SCX_TEST_PASS;
+}
+
+static void cleanup(void *ctx)
+{
+	bypass__destroy(ctx);
+}
+
+struct scx_test bypass_test = {
+	.name		= "bypass",
+	.description	= "Verify tasks complete during bypass mode",
+	.setup		= setup,
+	.run		= run,
+	.cleanup	= cleanup,
+};
+REGISTER_SCX_TEST(&bypass_test)
-- 
2.43.0

