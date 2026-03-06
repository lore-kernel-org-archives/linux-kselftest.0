Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B2BF3932DA
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Mar 2026 12:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772801359; cv=none; b=oEdBStHeO6lnTp4qrs6u7QO7K294/VDx1cpqB2kWScHfmzyu2tLiVpR0juTiIv8fK/pqYNBih6vgdZYJte4mqUKICrGcXMZ2bra030cvB3Q9c6yw+yicnsY/q7QI3BOB+mlwntOrkhBWuPM99/8se51ZQ0oQZ7ySPxamDCMSzrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772801359; c=relaxed/simple;
	bh=BZeeJ1JML7xaZoBvWAKlQYnkV7F90b7mZuzv0ATZ6Jw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kcCRb4zFnkjhOkJjLTwOf+75JrpJmZhmkYfkxhzEzADW2fANMDogEgRl8PVqK9u4LajEEasLJqQVVkGiKpYyQ4mpt9F5enaig+QemNpbfP5B8ACGjUmFBQ5qZOv8ckQVjoWHua/l9mZWM+YIX4W0US1lFXRoo36uosfFRqivBKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ruv+3MI9; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ruv+3MI9"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2a9296b3926so68026355ad.1
        for <linux-kselftest@vger.kernel.org>; Fri, 06 Mar 2026 04:49:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772801357; x=1773406157; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6TnQKdPGtTuRU+46cutq94eviTJ71u1qZiPiKlbjQJQ=;
        b=Ruv+3MI9uh9UmKCqZJuzUEQDiMDwyf2WsPQ/dzzFIMEcQ1Fsa1Vq7jjPAj/wv5Ku8y
         NF64Hprvi3encEih0iGaugA792BkY4TOeBUKAlOgtDgrPfA1x+7Yhj0P89BJC7uFGhw+
         9x/z9DhdZivVjl7mF5KCJ+/iZIioXlNRQ27LfAi+VqPGbTV8vCIpYoRf88dgj1GRQAl3
         y/N8KObAFi4WxHq6rJPmNgRC08QspaCkz7P0NrclnxKvBSASQA9uF4Pk5oZk8TCkg8L9
         qBCdp/vu2z+1gtxSfa6RiY3zrKCmBXpshRa3DMmj2oK0KKkDLtthE8ixzp//JlWAq6ih
         5ymw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772801357; x=1773406157;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6TnQKdPGtTuRU+46cutq94eviTJ71u1qZiPiKlbjQJQ=;
        b=LoDtvBeF1gV5DT9DeBqKNjf2se3UMVvyfAovRLhKd2BQJFrj+k583wQWo1sMmdLqsv
         QsT4PHcuTj3N/KNECbJ3x1/AI0Ai+kvP7syt1zth1YAcWUYs2LM+1LN+H3UXohKJwKCm
         SADXfZZTQegWVqmJoE186sfw8Y3IRHkDj7XiLfk2ICfJTELGN5qbknKbpcgNm8BYJSh9
         xDkAbR8+jdll8uyOhI1blbQB7wr+mVCVcN8fqDBUL6Q1ke1AdI4lWCJEuJlttfoSk/Ut
         PDAmsdaZuKsmAHtzG6pFx4BVXhM92+sBg7eYLpOyzLp59ofDdjTUCq+DESOlIYqjnUKJ
         Nu5g==
X-Forwarded-Encrypted: i=1; AJvYcCW4BuhNVKyOZnGVksII7ij5152hUhsZxbOrgKNfDo5ccTOYX1GVRypbjdvjFmtUxiDMCLn32ouJ/VOndzV6PcM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrYUQz1MySg2YzfHYDV9XOh92swBVoVypB0vNS8hlzNgi1IJRl
	Le2vKABglNTTPsLgOkYmMYJKBt/57AJ33SNn13t9Hj/WSsNJuj0IwVzeGOSyTq/p
X-Gm-Gg: ATEYQzyyos2XHBvKuiRrFDJRjwsz/efAtXD+QGwZbEVp8IKO8tLZfIx0O1FSGNxvXTg
	p5XTBZH/jD9D2HRVi/rJrgEHngdE5WW7ls6gQcIrJMtljl3gZw3/qZLQDYUbvmbASnQmBZw7lNA
	VbMBYAwuD68XFAhA4x69O897CP1x2WQ8gcs6Y4MY2PY6bEX1do/wKM1loVf0qPmwy9E0QIrG1+s
	3PHImgcarmjcn+k/yX9H0yaaWb8i07ErkV3Ow0ia4RIDqCXrKX1rZA4At+n/marEyx3mdWq7iMW
	ZZ2nHdm0PlweOOX/70JOBHBH9JZ6oJ/uf9kavcQPfA08CbHdeFJVxlc4XxPCmgrPjV3k/b7DXsV
	jn1Rrw/XsSkh0iX4t8nnG6344l5UjB/hdpm4D5ZvJdVucXBMea5Ua6Iw5wKtZCfusF/eI+wtV3u
	wOPt1x8OQzo8HsY8ICTA4D+ujrFn0nwaWKXruPN5IBrezitQFd2dciLwkSCnlEUURXtamA/R2iT
	Bvg7JV/b1zynQ==
X-Received: by 2002:a17:902:d544:b0:2ae:7f3a:b213 with SMTP id d9443c01a7336-2ae8252fb45mr22420835ad.47.1772801357343;
        Fri, 06 Mar 2026 04:49:17 -0800 (PST)
Received: from mi-HP-ProDesk-680-G6-PCI-Microtower-PC.mioffice.cn ([43.224.245.226])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83e78f77sm27712845ad.21.2026.03.06.04.49.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 04:49:17 -0800 (PST)
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
Date: Fri,  6 Mar 2026 20:49:00 +0800
Message-ID: <20260306124901.2653465-4-suzhidao@xiaomi.com>
X-Mailer: git-send-email 2.43.0
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

