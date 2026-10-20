Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792482633;
	b=BIz+BQK9pS3fEg40mmA1ASrQSbG+fxxHssw38bAkyg9Ihi2uB+1r05JUUDruEPvzJ2fU
	 cWIUW+9AhqUpfhBSl8Kfz1gR46TpuDAxsy/IPqGSqnk7sOgxuvJY3EvqJExHz+05E/mpf
	 7x7dWVEB1lDSNxJ/TsAQKXbe7KX4ywm1s+kWmHNQafgDCVW15eiBhgpWk8ZleK83AL80D
	 tNmCkYkafjdzGXrBEEEeUuqH8TFOLZzhPHdEBIgJ2x0lK4pSynA9Mma/4guvcjl+xaAR5
	 QXzBKbSoyY1reY2FXvlOh4yx8p/FeHlIhnJNJU0DL1VI28K0ROj4Y0I8kclVNZUhLjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792482633;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=Pu3C9gNSSW1SZOaOvtYdw2Ykdk6v6QqTygLjRHUJrNw=;
	b=biqgXXkq0k3FFemOENEBAcxsTw2saU0HPWwks0lbtOuREnj5wcq4qowJviR5AlXf0Kg2
	 kw3rmSrVG3h60lwsbQCPDZbAyV8As0B1R5HG/3nkZM4Ug7xEvbH/cEZamH4AjBgC/EOo7
	 RvF2H3vPFbm3A7WlPXtfI3Ey9SVmuwlwV2091IQ9tad1Bwt7b27IBS1gFXnxROi4Znj8H
	 S+UJyTz3c0C1/o5Ur9ZCYZt6KYlHvh2Pi/QlvhuV5yIjjMbhE3C9CcXG1rD5TTcJ9Z+yx
	 iS3/aiNxPUi0CFLADU8630G9YHM71UKAzHqhCf5FRVpMy4a5xeYdBz/ME7pN2V/hk/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--michalblk.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=KNEzWwh8;
	arc=none smtp.remote-ip=209.85.208.70
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B391606A325
	for <linux-kselftest@vger.kernel.org>; Tue, 20 Oct 2026 07:50:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B391606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--michalblk.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=KNEzWwh8
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-6b1e00100eeso4308735a12.3
        for <linux-kselftest@vger.kernel.org>; Tue, 20 Oct 2026 00:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792482631; x=1793087431; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Pu3C9gNSSW1SZOaOvtYdw2Ykdk6v6QqTygLjRHUJrNw=;
        b=KNEzWwh8XaWIpU1DTRtWXgQKqhe0s83oy6YjwNaGQEzs7MIrrIYC7I5AhhM+hZuOIP
         bKYAI36EwB9xiCxKChnf5+RMli5Vy0vRwXshKchgJeMBJ/dT6yOwoMrdg8hFc+IgGcTF
         vXTsB3kyja51khbbMx7DfUjAw3NCRKk20C39u+HbhqLPHQXbqJfZsSuzF6Itc7nD7jK+
         vS6Xih/X/5kwh+/1yXSNGOwB7aakTqsQWUPbcfgdXvRAfgSaq1u7Ouj4L7uVzOmeUuh8
         lzT+C+UnuIbUglPep3SPQZ3FsWz9xf8XVfMVZJc6rfNOt7mvRFrJXDBn4m7I2GQPCEHZ
         9HCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792482631; x=1793087431;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pu3C9gNSSW1SZOaOvtYdw2Ykdk6v6QqTygLjRHUJrNw=;
        b=gzNe5C4HhulBBEPTcH32eEeyCcvuXd0sziux2HZ2lmNEsR0nTtsL+FVzctMEIihYt1
         Chp3yNphdOhIE18c1fsMYpePB85YGDY3yx4Jilb9gVsoWKC9EJ7FHZ5vnGafVbbvkTjS
         TYNvY3wdMDLrLWoLW7FEAu8sBcIDQSZGAhF9tHm84IA+oDHO1tIM4cuK6jl0Zz4b0SHR
         /LR8iVUa2gHr6s3Njas/yc6lqkt19sZURDuFKcSq/CWOjnJohKunePbuuVdMLe/nfN/U
         7EmjXZWeI1dC0FIjt8gOlH5yO36E/V1CqLMOhhs5EaSyJFrUYCcD5DUPBGZi0oobe5HG
         J3Og==
X-Forwarded-Encrypted: i=1; AKwUvBzyUscMKwMRyGYQM1rceeu6ZrhUSkbvee9rHv5iXGRmh1d86OGRBnjGu8c/YgXqVEmuVYVHMoE0fVtOO6RdKmU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ/pa18O95nG4Y/DVh8lDTW9sB88SefT42VMxiQs5sM1ucdTpxh
	Ok/mUdSQcLz+3Q4fD+6qqfA1J2B+GGxTUnGTwgF2qBSVe/a/uYCcmKsCdm2RRVrx8mDtj6JCuTz
	2CTiiuyI5ICWRxGxLKQ==
X-Received: from edr4.prod.google.com ([2002:a05:6402:44c4:b0:6ac:b90c:5524])
 (user=michalblk job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:44da:b0:6b1:b849:c7d8 with SMTP id 4fb4d7f45d1cf-6b3a81ac904mr4648985a12.38.1792482631297;
 Tue, 20 Oct 2026 00:50:31 -0700 (PDT)
Date: Tue, 20 Oct 2026 07:50:29 +0000
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261020075029.330343-1-michalblk@google.com>
Subject: [PATCH v2] selftests/sched_ext: Add class_switch_stall test
From: Michal Blaszczyk <michalblk@google.com>
To: Tejun Heo <tj@kernel.org>, David Vernet <void@manifault.com>, Andrea Righi <arighi@nvidia.com>, 
	Changwoo Min <changwoo@igalia.com>
Cc: sched-ext@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Kuba Piecuch <jpiecuch@google.com>, 
	Michal Blaszczyk <michalblk@google.com>
Content-Type: text/plain; charset="UTF-8"

Add a test for a task which leaves SCHED_EXT while it's waiting. Its
scheduler keeps the task waiting on a DSQ after it wakes up. The test
switches the task to SCHED_OTHER while it's waiting, lets it sleep outside
of SCHED_EXT for longer than the watchdog timeout, then switches it back
and wakes it up. The scheduler keeps it waiting again, for longer than the
watchdog interval but shorter than the timeout, which the watchdog must not
report as a stall.

Without commit 993e8fbfecbb ("sched_ext: Reset runnable_at when a task
leaves its scheduler"), the watchdog charges the task for the time it
spent outside of SCHED_EXT and aborts the scheduler.

Assisted-by: LLM
Signed-off-by: Michal Blaszczyk <michalblk@google.com>
---

Notes:
    v2: Raise the watchdog timeout to 3s and the park time to 2s, set
    timeout_ms from userspace, shorten the time outside of SCHED_EXT to
    TIMEOUT_MS + 1s, and derive the second read timeout from TIMEOUT_MS
    (Andrea). Rebase on sched_ext/for-7.4-fixes, which has the fix this
    tests, and refer to the fix by its commit ID.
    
    v1: https://lore.kernel.org/r/20261019124146.3582127-3-michalblk@google.com

 tools/testing/selftests/sched_ext/Makefile    |   1 +
 .../sched_ext/class_switch_stall.bpf.c        | 120 +++++++++
 .../selftests/sched_ext/class_switch_stall.c  | 245 ++++++++++++++++++
 3 files changed, 366 insertions(+)
 create mode 100644 tools/testing/selftests/sched_ext/class_switch_stall.bpf.c
 create mode 100644 tools/testing/selftests/sched_ext/class_switch_stall.c

diff --git a/tools/testing/selftests/sched_ext/Makefile b/tools/testing/selftests/sched_ext/Makefile
index c5d3a2eaea7da..44083f1c65969 100644
--- a/tools/testing/selftests/sched_ext/Makefile
+++ b/tools/testing/selftests/sched_ext/Makefile
@@ -165,6 +165,7 @@ all_test_bpfprogs := $(foreach prog,$(wildcard *.bpf.c),$(INCLUDE_DIR)/$(patsubs
 
 auto-test-targets :=			\
 	cgroup_nr_cpus			\
+	class_switch_stall		\
 	create_dsq			\
 	dequeue				\
 	dequeue_iter			\
diff --git a/tools/testing/selftests/sched_ext/class_switch_stall.bpf.c b/tools/testing/selftests/sched_ext/class_switch_stall.bpf.c
new file mode 100644
index 0000000000000..8268dcb45a0cc
--- /dev/null
+++ b/tools/testing/selftests/sched_ext/class_switch_stall.bpf.c
@@ -0,0 +1,120 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * A scheduler that keeps the target task waiting on a DSQ when it wakes up,
+ * until it's switched out of SCHED_EXT or, if @park_ns is set, for @park_ns.
+ * This lets userspace switch the target out while it's waiting.
+ *
+ * Copyright (c) 2026 Google LLC.
+ */
+
+#include <scx/common.bpf.h>
+
+char _license[] SEC("license") = "GPL";
+
+#define PARK_DSQ 0
+
+UEI_DEFINE(uei);
+
+s32 target_pid;		/* set by userspace */
+bool park;		/* set by userspace, cleared when parking */
+u64 park_ns;		/* set by userspace, how long to park, 0 for no limit */
+u64 nr_parked;		/* how many times the target has been parked */
+u64 nr_released;	/* how many times the target has been released */
+
+static bool released;	/* set by the timer, cleared when parking */
+static s32 target_cpu;	/* CPU to kick when the timer fires */
+
+struct release_timer {
+	struct bpf_timer timer;
+};
+
+struct {
+	__uint(type, BPF_MAP_TYPE_ARRAY);
+	__uint(max_entries, 1);
+	__type(key, u32);
+	__type(value, struct release_timer);
+} release_timer SEC(".maps");
+
+static int release_timerfn(void *map, int *key, struct bpf_timer *timer)
+{
+	released = true;
+	scx_bpf_kick_cpu(target_cpu, 0);
+	return 0;
+}
+
+s32 BPF_STRUCT_OPS(class_switch_stall_select_cpu, struct task_struct *p,
+		   s32 prev_cpu, u64 wake_flags)
+{
+	/* Don't dispatch directly so that wakeups go to ops.enqueue(). */
+	return prev_cpu;
+}
+
+void BPF_STRUCT_OPS(class_switch_stall_enqueue, struct task_struct *p,
+		    u64 enq_flags)
+{
+	struct release_timer *rt;
+	u32 key = 0;
+
+	if (p->pid != target_pid || !park || !(enq_flags & SCX_ENQ_WAKEUP)) {
+		scx_bpf_dsq_insert(p, SCX_DSQ_GLOBAL, SCX_SLICE_DFL, enq_flags);
+		return;
+	}
+
+	park = false;
+	released = false;
+	target_cpu = scx_bpf_task_cpu(p);
+	scx_bpf_dsq_insert(p, PARK_DSQ, SCX_SLICE_DFL, enq_flags);
+	__sync_fetch_and_add(&nr_parked, 1);
+
+	if (!park_ns)
+		return;
+
+	rt = bpf_map_lookup_elem(&release_timer, &key);
+	if (!rt) {
+		scx_bpf_error("failed to look up the release timer");
+		return;
+	}
+	bpf_timer_start(&rt->timer, park_ns, 0);
+}
+
+void BPF_STRUCT_OPS(class_switch_stall_dispatch, s32 cpu,
+		    struct task_struct *prev)
+{
+	if (released && scx_bpf_dsq_move_to_local(PARK_DSQ, 0))
+		__sync_fetch_and_add(&nr_released, 1);
+}
+
+s32 BPF_STRUCT_OPS_SLEEPABLE(class_switch_stall_init)
+{
+	struct release_timer *rt;
+	u32 key = 0;
+	s32 ret;
+
+	ret = scx_bpf_create_dsq(PARK_DSQ, -1);
+	if (ret)
+		return ret;
+
+	rt = bpf_map_lookup_elem(&release_timer, &key);
+	if (!rt)
+		return -ESRCH;
+
+	bpf_timer_init(&rt->timer, &release_timer, CLOCK_MONOTONIC);
+	bpf_timer_set_callback(&rt->timer, release_timerfn);
+	return 0;
+}
+
+void BPF_STRUCT_OPS(class_switch_stall_exit, struct scx_exit_info *ei)
+{
+	UEI_RECORD(uei, ei);
+}
+
+SEC(".struct_ops.link")
+struct sched_ext_ops class_switch_stall_ops = {
+	.select_cpu		= (void *)class_switch_stall_select_cpu,
+	.enqueue		= (void *)class_switch_stall_enqueue,
+	.dispatch		= (void *)class_switch_stall_dispatch,
+	.init			= (void *)class_switch_stall_init,
+	.exit			= (void *)class_switch_stall_exit,
+	.flags			= SCX_OPS_SWITCH_PARTIAL,
+	.name			= "class_switch_stall",
+};
diff --git a/tools/testing/selftests/sched_ext/class_switch_stall.c b/tools/testing/selftests/sched_ext/class_switch_stall.c
new file mode 100644
index 0000000000000..2d0ca85caabb7
--- /dev/null
+++ b/tools/testing/selftests/sched_ext/class_switch_stall.c
@@ -0,0 +1,245 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Check that a task which leaves SCHED_EXT while it's waiting doesn't carry
+ * that wait over to its next stay on SCHED_EXT. If it did, the watchdog would
+ * count the time the task spent outside SCHED_EXT as waiting and abort the
+ * scheduler.
+ *
+ * Copyright (c) 2026 Google LLC.
+ */
+#define _GNU_SOURCE
+
+#include <bpf/bpf.h>
+#include <poll.h>
+#include <sched.h>
+#include <scx/common.h>
+#include <signal.h>
+#include <stdio.h>
+#include <string.h>
+#include <sys/wait.h>
+#include <unistd.h>
+#include "class_switch_stall.bpf.skel.h"
+#include "scx_test.h"
+
+#ifndef SCHED_EXT
+#define SCHED_EXT 7
+#endif
+
+/* watchdog timeout, the watchdog checks every half of it */
+#define TIMEOUT_MS 3000
+/* longer than the watchdog interval, but shorter than the timeout */
+#define PARK_MS 2000
+/* time spent outside of SCHED_EXT, a stale wait would exceed the timeout */
+#define OUTSIDE_MS (TIMEOUT_MS + 1000)
+
+static enum scx_test_status setup(void **ctx)
+{
+	struct class_switch_stall *skel;
+
+	skel = class_switch_stall__open();
+	SCX_FAIL_IF(!skel, "Failed to open");
+	SCX_ENUM_INIT(skel);
+	skel->struct_ops.class_switch_stall_ops->timeout_ms = TIMEOUT_MS;
+	SCX_FAIL_IF(class_switch_stall__load(skel), "Failed to load skel");
+
+	*ctx = skel;
+
+	return SCX_TEST_PASS;
+}
+
+/* Echoes back each byte from @in_fd. */
+static void child_main(int in_fd, int out_fd)
+{
+	char c;
+
+	while (read(in_fd, &c, 1) == 1) {
+		if (write(out_fd, &c, 1) != 1)
+			_exit(1);
+	}
+	_exit(0);
+}
+
+static bool read_byte(int fd, int timeout_ms)
+{
+	struct pollfd pfd = { .fd = fd, .events = POLLIN };
+	char c;
+
+	return poll(&pfd, 1, timeout_ms) == 1 && read(fd, &c, 1) == 1;
+}
+
+/* Waits for up to 1s for @pid to be in interruptible sleep. */
+static bool wait_for_sleeping(pid_t pid)
+{
+	char path[64], buf[512], *state;
+	bool sleeping;
+	FILE *f;
+	int i;
+
+	snprintf(path, sizeof(path), "/proc/%d/stat", pid);
+
+	for (i = 0; i < 1000; i++) {
+		f = fopen(path, "r");
+		if (!f)
+			return false;
+		/* The state follows "(comm)", and comm may contain ')'. */
+		state = fgets(buf, sizeof(buf), f) ? strrchr(buf, ')') : NULL;
+		sleeping = state && !strncmp(state, ") S", 3);
+		fclose(f);
+		if (sleeping)
+			return true;
+		usleep(1000);
+	}
+	return false;
+}
+
+/* Waits for up to 1s for the target to have been parked @cnt times in total. */
+static bool wait_for_parked(struct class_switch_stall *skel, u64 cnt)
+{
+	int i;
+
+	for (i = 0; i < 1000; i++) {
+		if (skel->bss->nr_parked >= cnt)
+			return true;
+		usleep(1000);
+	}
+	return false;
+}
+
+static bool set_policy(pid_t pid, int policy)
+{
+	struct sched_param param = {};
+
+	return !sched_setscheduler(pid, policy, &param);
+}
+
+static enum scx_test_status run(void *ctx)
+{
+	struct class_switch_stall *skel = ctx;
+	enum scx_test_status status = SCX_TEST_FAIL;
+	int to_child[2] = { -1, -1 }, from_child[2] = { -1, -1 };
+	struct bpf_link *link = NULL;
+	pid_t pid = -1;
+	int i;
+
+	if (pipe(to_child) || pipe(from_child)) {
+		SCX_ERR("Failed to create pipes");
+		goto out;
+	}
+
+	link = bpf_map__attach_struct_ops(skel->maps.class_switch_stall_ops);
+	if (!link) {
+		SCX_ERR("Failed to attach scheduler");
+		goto out;
+	}
+
+	pid = fork();
+	if (pid == 0)
+		child_main(to_child[0], from_child[1]);
+	if (pid < 0) {
+		SCX_ERR("Failed to fork");
+		goto out;
+	}
+	skel->bss->target_pid = pid;
+
+	if (!wait_for_sleeping(pid) || !set_policy(pid, SCHED_EXT)) {
+		SCX_ERR("Failed to switch the child to SCHED_EXT");
+		goto out;
+	}
+
+	/*
+	 * Keep the child waiting on the DSQ after it wakes up, and switch it to
+	 * SCHED_OTHER while it's still waiting.
+	 */
+	skel->bss->park_ns = 0;
+	skel->bss->park = true;
+	if (write(to_child[1], "a", 1) != 1 || !wait_for_parked(skel, 1)) {
+		SCX_ERR("The child wasn't parked");
+		goto out;
+	}
+	if (!set_policy(pid, SCHED_OTHER) || !read_byte(from_child[0], 1000)) {
+		SCX_ERR("The child didn't run after leaving SCHED_EXT");
+		goto out;
+	}
+
+	/* Let time pass while the child sleeps outside of SCHED_EXT. */
+	if (!wait_for_sleeping(pid)) {
+		SCX_ERR("The child didn't block in read()");
+		goto out;
+	}
+	usleep(OUTSIDE_MS * 1000);
+
+	/*
+	 * Bring the child back and keep it waiting for longer than the watchdog
+	 * interval, but shorter than the timeout. Its wait must start now, not
+	 * when it started waiting before it left SCHED_EXT.
+	 */
+	if (!set_policy(pid, SCHED_EXT)) {
+		SCX_ERR("Failed to switch the child back to SCHED_EXT");
+		goto out;
+	}
+	skel->bss->park_ns = PARK_MS * 1000000ULL;
+	skel->bss->park = true;
+	if (write(to_child[1], "b", 1) != 1 || !wait_for_parked(skel, 2)) {
+		SCX_ERR("The child wasn't parked again");
+		goto out;
+	}
+	/*
+	 * A stall is detected up to a watchdog interval after the timeout. Wait
+	 * long enough for it to be reported by the exit info below.
+	 */
+	if (!read_byte(from_child[0], 2 * TIMEOUT_MS)) {
+		SCX_ERR("The child didn't run after the second wait");
+		goto out;
+	}
+
+	/*
+	 * Only the watchdog aborting the scheduler lets the child run before
+	 * it's released. The exit info is recorded asynchronously, wait for it.
+	 */
+	if (skel->bss->nr_released != 1)
+		SCX_TIMED_WAIT_UEI(skel, uei, 1000);
+
+	if (UEI_EXITED(skel, uei)) {
+		SCX_ERR("Scheduler exited (kind=%llu): %s",
+			(unsigned long long)skel->data->uei.kind,
+			skel->data->uei.msg);
+		goto out;
+	}
+	if (skel->bss->nr_released != 1) {
+		SCX_ERR("The child was released %llu times, expected 1",
+			(unsigned long long)skel->bss->nr_released);
+		goto out;
+	}
+
+	status = SCX_TEST_PASS;
+out:
+	if (pid > 0) {
+		kill(pid, SIGKILL);
+		waitpid(pid, NULL, 0);
+	}
+	if (link)
+		bpf_link__destroy(link);
+	for (i = 0; i < 2; i++) {
+		if (to_child[i] >= 0)
+			close(to_child[i]);
+		if (from_child[i] >= 0)
+			close(from_child[i]);
+	}
+	return status;
+}
+
+static void cleanup(void *ctx)
+{
+	struct class_switch_stall *skel = ctx;
+
+	class_switch_stall__destroy(skel);
+}
+
+struct scx_test class_switch_stall = {
+	.name = "class_switch_stall",
+	.description = "Verify that leaving SCHED_EXT ends a task's wait",
+	.setup = setup,
+	.run = run,
+	.cleanup = cleanup,
+};
+REGISTER_SCX_TEST(&class_switch_stall)

base-commit: e2859566ffbc3a9f33308255114ccf167124e048
-- 
2.56.0.212.g129ede20d9-goog

