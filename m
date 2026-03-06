Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABD303E8C6C
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Mar 2026 16:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772813625; cv=none; b=IMZ1PoFx/o9WoeuFAoBB9mX+pBJo6xabmyDbC4/5oYmDqqUfuoqImjC9F8CBr/J/2BX7wtwsGfRm/cGA+9QVryDqrkx17K4/NXxOhxJ6OK8Yr2fTgLBciyTM7ub7g2Pyo9K59ZKYuyeOagts0b5Bf+KTnrmYTsx0Wy8k+jkKC5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772813625; c=relaxed/simple;
	bh=NxSdl5yGIkYpf0qnKogIYBNzpYELmbJSNhIZrqL4g1c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TWDXhKsMSyZuV8/9O1zo7KlPC7ymXSGq7wzFodU+ek2PwC89E8d4DXYSU+reEFub8YJgzXB2CZrZRU4OLc2eDrleSEWSxE8C5G1YTmWVjFPVr/987dTRHekE1mDtSE3mIFVXU3QKvP2sSwZz8QeAXu1Rvw4tLUTv5CPeY6haS3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hKAkEBvv; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hKAkEBvv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772813623;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l7hWemiWFfPKWWobIMiiiRloN5fsIthWM22POlNE8Ec=;
	b=hKAkEBvvKUQn9FhDmBtllUP9Xt1gtYEjpqvNQJuZKTdzYS2DYbGsOOFG8PR8d7M7LQHFt0
	jawPh7y7Q1tdY0iLe2PS1JRBVrGE4m5VLNEm89NyG9XWXgWNoz6BIl/D25TKbwEmCGB+Ts
	YCYGP9jSHP49SiQVvEIY1Zp7yzZ/9xc=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-37-bekmns86N1-GgHKOeWKv7g-1; Fri,
 06 Mar 2026 11:13:39 -0500
X-MC-Unique: bekmns86N1-GgHKOeWKv7g-1
X-Mimecast-MFC-AGG-ID: bekmns86N1-GgHKOeWKv7g_1772813618
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C22CF1956088;
	Fri,  6 Mar 2026 16:13:37 +0000 (UTC)
Received: from jlelli-thinkpadt14gen4.remote.csb (unknown [10.45.224.3])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4FD063003EAA;
	Fri,  6 Mar 2026 16:13:33 +0000 (UTC)
From: Juri Lelli <juri.lelli@redhat.com>
Date: Fri, 06 Mar 2026 17:10:09 +0100
Subject: [PATCH RFC 4/7] selftests/sched: Add basic SCHED_DEADLINE
 functionality tests
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-upstream-deadline-kselftests-v1-4-2b23ef74c46a@redhat.com>
References: <20260306-upstream-deadline-kselftests-v1-0-2b23ef74c46a@redhat.com>
In-Reply-To: <20260306-upstream-deadline-kselftests-v1-0-2b23ef74c46a@redhat.com>
To: Shuah Khan <shuah@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>, 
 Dietmar Eggemann <dietmar.eggemann@arm.com>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 Valentin Schneider <vschneid@redhat.com>, 
 Clark Williams <williams@redhat.com>, Gabriele Monaco <gmonaco@redhat.com>, 
 Tommaso Cucinotta <tommaso.cucinotta@santannapisa.it>, 
 Luca Abeni <luca.abeni@santannapisa.it>, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Juri Lelli <juri.lelli@redhat.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772813592; l=6864;
 i=juri.lelli@redhat.com; s=20250626; h=from:subject:message-id;
 bh=NxSdl5yGIkYpf0qnKogIYBNzpYELmbJSNhIZrqL4g1c=;
 b=O3lG0UKvF6dRYEVcR+3ACS063EsyNoD82ch/w+fP6i7nEyws9Qofqfuv/ZMg0h/ML3Gnrkgk5
 vLpJ9zb0YcVA74fQnJ9rJRDzyaJxfR4Eid0K/5F1P7Kbp8Vfm3ljS1x
X-Developer-Key: i=juri.lelli@redhat.com; a=ed25519;
 pk=kSwf88oiY/PYrNMRL/tjuBPiSGzc+U3bD13Zag6wO5Q=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

Add initial test coverage for SCHED_DEADLINE scheduler functionality.
This patch introduces two fundamental tests that validate core
SCHED_DEADLINE behavior using the test framework and utility library.

The basic_scheduling test creates a cpuhog process with SCHED_DEADLINE
policy and verifies the scheduling policy is correctly set to policy 6
(SCHED_DEADLINE). It confirms the task executes successfully for the
specified duration using reasonable parameters with 30ms runtime, 100ms
deadline, and 100ms period. This validates the fundamental operation of
setting SCHED_DEADLINE policy and running deadline-scheduled tasks.

The parameter_validation test ensures the kernel properly validates
SCHED_DEADLINE parameters. It tests that invalid parameter combinations
such as runtime greater than deadline are correctly rejected with
EINVAL, while valid parameter configurations are accepted. This confirms
the kernel's parameter validation logic is working correctly and
prevents misconfigured deadline tasks from being scheduled.

Both tests use the dl_util library for SCHED_DEADLINE operations and
follow the framework pattern with automatic registration via
REGISTER_DL_TEST(). The tests pass cleanly in VM environments with 2
tests passing, 0 skipped, and 0 failed.

Assisted-by: Claude Code: claude-sonnet-4-5@20250929
Signed-off-by: Juri Lelli <juri.lelli@redhat.com>
---
 tools/testing/selftests/sched/deadline/Makefile |   7 +-
 tools/testing/selftests/sched/deadline/basic.c  | 127 ++++++++++++++++++++++++
 2 files changed, 132 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/sched/deadline/Makefile b/tools/testing/selftests/sched/deadline/Makefile
index ea3fdfbef459e..3fb4568a59e20 100644
--- a/tools/testing/selftests/sched/deadline/Makefile
+++ b/tools/testing/selftests/sched/deadline/Makefile
@@ -14,8 +14,7 @@ OUTPUT_DIR := $(OUTPUT)
 UTIL_OBJS := $(OUTPUT)/dl_util.o
 
 # Test object files (all .c files except runner.c, dl_util.c, cpuhog.c)
-# Will be populated as we add tests
-TEST_OBJS :=
+TEST_OBJS := $(OUTPUT)/basic.o
 
 # Runner binary links utility and test objects
 $(OUTPUT)/runner: runner.c $(UTIL_OBJS) $(TEST_OBJS) dl_test.h | $(OUTPUT_DIR)
@@ -29,6 +28,10 @@ $(OUTPUT)/cpuhog: cpuhog.c | $(OUTPUT_DIR)
 $(OUTPUT)/dl_util.o: dl_util.c dl_util.h | $(OUTPUT_DIR)
 	$(CC) $(CFLAGS) -c $< -o $@
 
+# Test files
+$(OUTPUT)/basic.o: basic.c dl_test.h dl_util.h | $(OUTPUT_DIR)
+	$(CC) $(CFLAGS) -c $< -o $@
+
 $(OUTPUT_DIR):
 	mkdir -p $@
 
diff --git a/tools/testing/selftests/sched/deadline/basic.c b/tools/testing/selftests/sched/deadline/basic.c
new file mode 100644
index 0000000000000..f1c4e8c751b61
--- /dev/null
+++ b/tools/testing/selftests/sched/deadline/basic.c
@@ -0,0 +1,127 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Basic SCHED_DEADLINE functionality tests
+ *
+ * Validates fundamental SCHED_DEADLINE scheduler operations including
+ * policy setup, parameter validation, and basic task execution.
+ */
+
+#define _GNU_SOURCE
+#include <stdio.h>
+#include <stdlib.h>
+#include <unistd.h>
+#include <sys/types.h>
+#include <sys/wait.h>
+#include <errno.h>
+#include <sched.h>
+#include "dl_test.h"
+#include "dl_util.h"
+
+/*
+ * Test: Basic SCHED_DEADLINE scheduling
+ *
+ * Verifies that a task can be successfully scheduled with SCHED_DEADLINE
+ * policy and executes correctly.
+ */
+static enum dl_test_status test_basic_scheduling_run(void *ctx)
+{
+	pid_t pid;
+	int policy;
+	int status;
+	uint64_t runtime_ns, deadline_ns, period_ns;
+
+	/* Use reasonable deadline parameters: 30ms/100ms/100ms */
+	runtime_ns = dl_ms_to_ns(30);
+	deadline_ns = dl_ms_to_ns(100);
+	period_ns = dl_ms_to_ns(100);
+
+	/* Create a cpuhog process with SCHED_DEADLINE */
+	pid = dl_create_cpuhog(runtime_ns, deadline_ns, period_ns, 2);
+	DL_FAIL_IF(pid < 0, "Failed to create cpuhog process: %s",
+		   strerror(errno));
+
+	/* Process is now running with SCHED_DEADLINE set */
+	printf("  Created cpuhog with SCHED_DEADLINE (PID %d)\n", pid);
+
+	/* Verify it's using SCHED_DEADLINE (policy 6) */
+	policy = dl_get_policy(pid);
+	DL_FAIL_IF(policy < 0, "Failed to read scheduling policy");
+	DL_EQ(policy, SCHED_DEADLINE);
+
+	/* Alternative check using helper */
+	DL_ASSERT(dl_is_deadline_task(pid));
+
+	printf("  cpuhog running with SCHED_DEADLINE (PID %d)\n", pid);
+
+	/* Wait for cpuhog to complete (2 seconds) */
+	if (waitpid(pid, &status, 0) < 0) {
+		dl_cleanup_cpuhog(pid);
+		DL_FAIL("waitpid failed: %s", strerror(errno));
+	}
+
+	/* Verify it exited successfully */
+	DL_FAIL_IF(!WIFEXITED(status), "Process did not exit normally");
+	DL_EQ(WEXITSTATUS(status), 0);
+
+	printf("  cpuhog completed successfully\n");
+
+	return DL_TEST_PASS;
+}
+
+static struct dl_test test_basic_scheduling = {
+	.name = "basic_scheduling",
+	.description = "Verify basic SCHED_DEADLINE policy setup and execution",
+	.run = test_basic_scheduling_run,
+};
+REGISTER_DL_TEST(&test_basic_scheduling);
+
+/*
+ * Test: SCHED_DEADLINE parameter validation
+ *
+ * Verifies that the kernel correctly validates deadline parameters,
+ * rejecting invalid configurations and accepting valid ones.
+ */
+static enum dl_test_status test_parameter_validation_run(void *ctx)
+{
+	int ret;
+	uint64_t runtime_ns, deadline_ns, period_ns;
+
+	printf("  Testing invalid parameters (runtime > deadline)...\n");
+
+	/* Invalid: runtime (200ms) > deadline (100ms) */
+	runtime_ns = dl_ms_to_ns(200);
+	deadline_ns = dl_ms_to_ns(100);
+	period_ns = dl_ms_to_ns(100);
+
+	ret = dl_set_sched_attr(0, runtime_ns, deadline_ns, period_ns);
+	DL_FAIL_IF(ret == 0, "Invalid parameters were accepted (runtime > deadline)");
+	DL_FAIL_IF(errno != EINVAL, "Expected EINVAL, got %s", strerror(errno));
+
+	printf("  Invalid parameters correctly rejected with EINVAL\n");
+
+	printf("  Testing valid parameters...\n");
+
+	/* Valid: runtime (30ms) <= deadline (100ms) <= period (100ms) */
+	runtime_ns = dl_ms_to_ns(30);
+	deadline_ns = dl_ms_to_ns(100);
+	period_ns = dl_ms_to_ns(100);
+
+	ret = dl_set_sched_attr(0, runtime_ns, deadline_ns, period_ns);
+	DL_FAIL_IF(ret < 0, "Valid parameters were rejected: %s", strerror(errno));
+
+	printf("  Valid parameters correctly accepted\n");
+
+	/* Reset to normal scheduling using sched_setscheduler */
+	struct sched_param param = { .sched_priority = 0 };
+
+	sched_setscheduler(0, SCHED_OTHER, &param);
+
+	return DL_TEST_PASS;
+}
+
+static struct dl_test test_parameter_validation = {
+	.name = "parameter_validation",
+	.description = "Verify SCHED_DEADLINE parameter validation (accept/reject)",
+	.run = test_parameter_validation_run,
+};
+REGISTER_DL_TEST(&test_parameter_validation);

-- 
2.53.0

