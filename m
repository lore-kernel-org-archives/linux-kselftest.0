Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=158.69.130.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795805906;
	b=DziNqb3udDiPxoCOci0ocybI4YUpFwWUcml/ZRXoeZZSsRHOVqqnpqvekTOb63AlhQ9V
	 fn26d1r643OocICFY10lZQtHHBHJ3D8GpSj7wo8zGzJcGAGOmPI44a7DnKUpsDYTOwnD0
	 W+DmSu0M+sUpNPINgKe6i1hVjYcSQTlGUfQTlsn1xkNKKMl37NsI4/BCfj0bltyuxa33B
	 7V/d1f9QC9DuxlZ6Nw05Oa+D66RWfNrAcMrCRyIeNNkKAngxnB2uxPq/8C8kQDjEKZWJJ
	 v6rzXcqGYME/mzLkOVF86+tzmDFEOyQz6vP3ZzpBfFk7WX/5Gf7oFo+V7SG4FKPTgnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795805906;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8OhAk9cmyRbLG0MiVOEFk9DU+w4LVEx3Semv5sjBMcE=;
	b=E8GnMbEZ5kHXixy+VCSYAleqrhaX4ubOIR5x03ZoVFSoBSY4fS3JR3rkCuJabLYe5tkd
	 jU0hs6sgPjnSj2eXeqAwdnYvQjZ+km+bVWNpWFJvgFh15Yjl5YeTa1ChUVZ1SmLmc+Rl6
	 nYiS7oMGmqQvV3Wa4RYmCTofFbAsjFUWBEXWosmUp2u+D7b0hTmsNCg7rReV0n2GbrsnZ
	 hr/4J9TZY99Bc6lrNmVCTc2IUkZd9C4m/K28v75fVYM5yWPvBPMfav7eE0bmWHb/cAg+W
	 cPNmI5kLYaIdrbH6NiZJMH1C7aIkWuhBYj80u4VyB0cok4wVWzut2BAaHefphQ1ksVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=efficios.com;
	spf=pass smtp.mailfrom=efficios.com;
	dkim=pass header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=smtpout1 header.b=k+iM5TPE;
	arc=none smtp.remote-ip=158.69.130.18
Received: from smtpout.efficios.com (smtpout.efficios.com [158.69.130.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48234606A680;
	Fri, 27 Nov 2026 18:58:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48234606A680
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficios.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=smtpout1 header.b=k+iM5TPE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
	s=smtpout1; t=1795805904;
	bh=8OhAk9cmyRbLG0MiVOEFk9DU+w4LVEx3Semv5sjBMcE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=k+iM5TPElSj1dbgrdm2qfBlRm8aBltLlIst7b+qlNPITkXSx/eGYnteK+Gl6n2FZY
	 sNH9eTrJdRBsP0DNU3esCJIVdLzcJnflDFW9NXN4vFeLf/UKo+/VnXmWf4K/yUy6tq
	 Jd0xFhlIaluuyLEeXROJ83cr+2yq/DxU3KBIbXGUf2JN6z9OigFMY+tG+DQNZsgBs/
	 vuQkKmTMta4PldYhxY4JZ8PfhetMSFtpskq6lYDlob8+X+L4dmA5qSQiAHsurKru+J
	 vuEmgug9saEoZks1c8+Bf+4AFE3Tpk671N8YZXYiT/mcQuMEB4VAyP1U3VA/JzIEbS
	 alz5jrq/QFn/Q==
Received: from thinkos.internal.efficios.com (mtl.efficios.com [216.120.195.104])
	by smtpout.efficios.com (Postfix) with ESMTPSA id 4jbjNw3XYwzXD0;
	Fri, 27 Nov 2026 13:58:24 -0500 (EST)
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Shuah Khan <shuah@kernel.org>,
	Aniket Gattani <aniketgattani@google.com>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	"Paul E. McKenney" <paulmck@kernel.org>
Subject: [PATCH v2 07/16] selftests/membarrier: Test command arguments and registration lifetime
Date: Fri, 27 Nov 2026 13:58:12 -0500
Message-ID: <20261127185822.158216-8-mathieu.desnoyers@efficios.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127185822.158216-1-mathieu.desnoyers@efficios.com>
References: <20261127185822.158216-1-mathieu.desnoyers@efficios.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The existing tests issue each command once with valid arguments, in
one fixed order of registrations. They miss the following:

 - the query mask is not compared with the commands which the kernel
   accepts. Commit 809232619f5b ("sched/membarrier: Fix
   membarrier-rseq fence command missing from query bitmask") fixed
   such a mismatch,
 - only MEMBARRIER_CMD_QUERY is tested with an invalid flag,
 - only the stress test issues the rseq command. Its registration,
   its -EPERM result and its CPU argument are not checked,
 - each registration is not tested alone. Commit fc0d77387cb5
   ("sched/membarrier: Fix private expedited registration check")
   fixed an interaction between two registrations,
 - the registrations are not tested across fork, exec and CLONE_VM.

Add membarrier_test_cmd for those. It uses the kselftest harness,
which runs each test in its own process. A registration cannot be
undone, so each test needs a new process.

The sync core and rseq registration tests fail without commit
"sched/membarrier: Report only completed registrations".

Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
---
 tools/testing/selftests/membarrier/.gitignore |   1 +
 tools/testing/selftests/membarrier/Makefile   |   1 +
 .../membarrier/membarrier_test_cmd.c          | 352 ++++++++++++++++++
 3 files changed, 354 insertions(+)
 create mode 100644 tools/testing/selftests/membarrier/membarrier_test_cmd.c

diff --git a/tools/testing/selftests/membarrier/.gitignore b/tools/testing/selftests/membarrier/.gitignore
index 58969a5e4613..45b995b884a6 100644
--- a/tools/testing/selftests/membarrier/.gitignore
+++ b/tools/testing/selftests/membarrier/.gitignore
@@ -3,3 +3,4 @@ membarrier_test_multi_thread
 membarrier_test_single_thread
 membarrier_rseq_stress
 membarrier_test_ipi
+membarrier_test_cmd
diff --git a/tools/testing/selftests/membarrier/Makefile b/tools/testing/selftests/membarrier/Makefile
index ee5b9deb808b..c7fa0573e978 100644
--- a/tools/testing/selftests/membarrier/Makefile
+++ b/tools/testing/selftests/membarrier/Makefile
@@ -5,6 +5,7 @@ LDLIBS += -lpthread
 TEST_GEN_PROGS := membarrier_test_single_thread \
 		membarrier_test_multi_thread \
 		membarrier_test_ipi \
+		membarrier_test_cmd \
 		membarrier_rseq_stress
 
 LOCAL_HDRS += membarrier_test_impl.h
diff --git a/tools/testing/selftests/membarrier/membarrier_test_cmd.c b/tools/testing/selftests/membarrier/membarrier_test_cmd.c
new file mode 100644
index 000000000000..5982861f77b6
--- /dev/null
+++ b/tools/testing/selftests/membarrier/membarrier_test_cmd.c
@@ -0,0 +1,352 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Check the membarrier command arguments and the lifetime of the
+ * registrations.
+ *
+ * The test harness runs each test in its own process. This matters
+ * because a membarrier registration cannot be undone.
+ */
+#define _GNU_SOURCE
+#include <linux/membarrier.h>
+#include <sys/wait.h>
+#include <syscall.h>
+#include <limits.h>
+#include <pthread.h>
+#include <signal.h>
+#include <stdlib.h>
+#include <string.h>
+#include <unistd.h>
+#include <sched.h>
+#include <errno.h>
+
+#include "kselftest_harness.h"
+
+#define STACK_SIZE	(64 * 1024)
+
+#define REGISTER_CMDS						\
+	(MEMBARRIER_CMD_REGISTER_GLOBAL_EXPEDITED |		\
+	 MEMBARRIER_CMD_REGISTER_PRIVATE_EXPEDITED |		\
+	 MEMBARRIER_CMD_REGISTER_PRIVATE_EXPEDITED_SYNC_CORE |	\
+	 MEMBARRIER_CMD_REGISTER_PRIVATE_EXPEDITED_RSEQ)
+
+/* Pairs of registration command and command which needs it. */
+static const struct {
+	int register_cmd;
+	int cmd;
+} private_cmds[] = {
+	{ MEMBARRIER_CMD_REGISTER_PRIVATE_EXPEDITED,
+	  MEMBARRIER_CMD_PRIVATE_EXPEDITED },
+	{ MEMBARRIER_CMD_REGISTER_PRIVATE_EXPEDITED_SYNC_CORE,
+	  MEMBARRIER_CMD_PRIVATE_EXPEDITED_SYNC_CORE },
+	{ MEMBARRIER_CMD_REGISTER_PRIVATE_EXPEDITED_RSEQ,
+	  MEMBARRIER_CMD_PRIVATE_EXPEDITED_RSEQ },
+};
+
+static int sys_membarrier(int cmd, unsigned int flags, int cpu_id)
+{
+	return syscall(__NR_membarrier, cmd, flags, cpu_id);
+}
+
+static int query(void)
+{
+	return sys_membarrier(MEMBARRIER_CMD_QUERY, 0, 0);
+}
+
+static int get_registrations(void)
+{
+	return sys_membarrier(MEMBARRIER_CMD_GET_REGISTRATIONS, 0, 0);
+}
+
+/* Each command is either in the query mask or returns -EINVAL. */
+TEST(query_matches_commands)
+{
+	int mask = query(), bit, ret;
+
+	ASSERT_GE(mask, 0);
+	for (bit = 0; bit < 32; bit++) {
+		int cmd = (int)(1U << bit);
+
+		errno = 0;
+		ret = sys_membarrier(cmd, 0, 0);
+		if (mask & cmd) {
+			EXPECT_NE(errno, EINVAL) {
+				TH_LOG("command 0x%x is in the query mask", cmd);
+			}
+		} else {
+			EXPECT_EQ(ret, -1);
+			EXPECT_EQ(errno, EINVAL) {
+				TH_LOG("command 0x%x is not in the query mask", cmd);
+			}
+		}
+	}
+}
+
+/* A command is a single bit. */
+TEST(invalid_commands)
+{
+	static const int cmds[] = {
+		-1, INT_MAX,
+		MEMBARRIER_CMD_GLOBAL | MEMBARRIER_CMD_GLOBAL_EXPEDITED,
+		MEMBARRIER_CMD_PRIVATE_EXPEDITED |
+			MEMBARRIER_CMD_REGISTER_PRIVATE_EXPEDITED,
+	};
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(cmds); i++) {
+		EXPECT_EQ(sys_membarrier(cmds[i], 0, 0), -1);
+		EXPECT_EQ(errno, EINVAL);
+	}
+}
+
+/* Only the rseq command accepts a flag: MEMBARRIER_CMD_FLAG_CPU. */
+TEST(invalid_flags)
+{
+	static const unsigned int flags[] = {
+		MEMBARRIER_CMD_FLAG_CPU, 1U << 1, 1U << 31, ~0U,
+		MEMBARRIER_CMD_FLAG_CPU | (1U << 1),
+	};
+	int mask = query(), bit, i;
+
+	ASSERT_GE(mask, 0);
+	/* Bit -1 stands for MEMBARRIER_CMD_QUERY, which is 0. */
+	for (bit = -1; bit < 32; bit++) {
+		int cmd = bit < 0 ? MEMBARRIER_CMD_QUERY : (int)(1U << bit);
+
+		if (cmd && !(mask & cmd))
+			continue;
+		for (i = 0; i < ARRAY_SIZE(flags); i++) {
+			if (cmd == MEMBARRIER_CMD_PRIVATE_EXPEDITED_RSEQ &&
+			    flags[i] == MEMBARRIER_CMD_FLAG_CPU)
+				continue;
+			EXPECT_EQ(sys_membarrier(cmd, flags[i], 0), -1);
+			EXPECT_EQ(errno, EINVAL) {
+				TH_LOG("command 0x%x flags 0x%x", cmd, flags[i]);
+			}
+		}
+	}
+}
+
+/* A private command needs its own registration. */
+TEST(private_needs_registration)
+{
+	int mask = query(), registered = get_registrations(), i;
+
+	ASSERT_GE(mask, 0);
+	ASSERT_GE(registered, 0);
+	for (i = 0; i < ARRAY_SIZE(private_cmds); i++) {
+		if (!(mask & private_cmds[i].cmd))
+			continue;
+		/* The C library may have registered already. */
+		if (registered & private_cmds[i].register_cmd)
+			continue;
+		EXPECT_EQ(sys_membarrier(private_cmds[i].cmd, 0, 0), -1);
+		EXPECT_EQ(errno, EPERM);
+	}
+	if ((mask & MEMBARRIER_CMD_PRIVATE_EXPEDITED_RSEQ) &&
+	    !(registered & MEMBARRIER_CMD_REGISTER_PRIVATE_EXPEDITED_RSEQ)) {
+		EXPECT_EQ(sys_membarrier(MEMBARRIER_CMD_PRIVATE_EXPEDITED_RSEQ,
+					 MEMBARRIER_CMD_FLAG_CPU, 0), -1);
+		EXPECT_EQ(errno, EPERM);
+	}
+}
+
+/*
+ * Issue one registration command. It must add its own bit to the
+ * registrations, and no other bit. It must allow its own command, and
+ * no other command.
+ */
+static void register_one(struct __test_metadata *_metadata, int register_cmd)
+{
+	int mask = query(), before = get_registrations(), i;
+
+	ASSERT_GE(mask, 0);
+	ASSERT_GE(before, 0);
+	if (!(mask & register_cmd))
+		SKIP(return, "command 0x%x is not available", register_cmd);
+	ASSERT_EQ(sys_membarrier(register_cmd, 0, 0), 0);
+	EXPECT_EQ(get_registrations(), before | register_cmd);
+	/* A second registration succeeds and changes nothing. */
+	ASSERT_EQ(sys_membarrier(register_cmd, 0, 0), 0);
+	EXPECT_EQ(get_registrations(), before | register_cmd);
+
+	for (i = 0; i < ARRAY_SIZE(private_cmds); i++) {
+		if (!(mask & private_cmds[i].cmd))
+			continue;
+		if ((before | register_cmd) & private_cmds[i].register_cmd) {
+			EXPECT_EQ(sys_membarrier(private_cmds[i].cmd, 0, 0), 0);
+		} else {
+			EXPECT_EQ(sys_membarrier(private_cmds[i].cmd, 0, 0), -1);
+			EXPECT_EQ(errno, EPERM);
+		}
+	}
+}
+
+TEST(register_global_expedited)
+{
+	register_one(_metadata, MEMBARRIER_CMD_REGISTER_GLOBAL_EXPEDITED);
+}
+
+TEST(register_private_expedited)
+{
+	register_one(_metadata, MEMBARRIER_CMD_REGISTER_PRIVATE_EXPEDITED);
+}
+
+TEST(register_private_expedited_sync_core)
+{
+	register_one(_metadata,
+		     MEMBARRIER_CMD_REGISTER_PRIVATE_EXPEDITED_SYNC_CORE);
+}
+
+TEST(register_private_expedited_rseq)
+{
+	register_one(_metadata, MEMBARRIER_CMD_REGISTER_PRIVATE_EXPEDITED_RSEQ);
+}
+
+/* Register every command, one at a time. Return the registrations. */
+static int register_all(struct __test_metadata *_metadata)
+{
+	int mask = query(), expected = get_registrations(), bit;
+
+	for (bit = 0; bit < 31; bit++) {
+		int cmd = 1 << bit;
+
+		if (!(cmd & REGISTER_CMDS & mask))
+			continue;
+		ASSERT_EQ(sys_membarrier(cmd, 0, 0), 0);
+		expected |= cmd;
+		EXPECT_EQ(get_registrations(), expected);
+	}
+	return expected;
+}
+
+TEST(register_all_commands)
+{
+	register_all(_metadata);
+}
+
+static void *thread_pause(void *arg)
+{
+	for (;;)
+		pause();
+	return NULL;
+}
+
+/*
+ * The rseq command accepts any CPU number. It ignores a CPU which does
+ * not exist. A negative CPU number selects all CPUs.
+ *
+ * The kernel only looks at the CPU number of a multi-threaded process,
+ * so keep a second thread alive.
+ */
+TEST(rseq_cpu_argument)
+{
+	static const int cpus[] = { 0, INT_MAX, -1, INT_MIN };
+	pthread_t thread;
+	int i;
+
+	if (!(query() & MEMBARRIER_CMD_PRIVATE_EXPEDITED_RSEQ))
+		SKIP(return, "the rseq command is not available");
+	ASSERT_EQ(pthread_create(&thread, NULL, thread_pause, NULL), 0);
+	ASSERT_EQ(sys_membarrier(MEMBARRIER_CMD_REGISTER_PRIVATE_EXPEDITED_RSEQ,
+				 0, 0), 0);
+	EXPECT_EQ(sys_membarrier(MEMBARRIER_CMD_PRIVATE_EXPEDITED_RSEQ,
+				 MEMBARRIER_CMD_FLAG_CPU, sched_getcpu()), 0);
+	for (i = 0; i < ARRAY_SIZE(cpus); i++) {
+		EXPECT_EQ(sys_membarrier(MEMBARRIER_CMD_PRIVATE_EXPEDITED_RSEQ,
+					 MEMBARRIER_CMD_FLAG_CPU, cpus[i]), 0) {
+			TH_LOG("cpu_id %d", cpus[i]);
+		}
+	}
+	/* Without the flag, the CPU argument is ignored. */
+	EXPECT_EQ(sys_membarrier(MEMBARRIER_CMD_PRIVATE_EXPEDITED_RSEQ,
+				 0, INT_MAX), 0);
+}
+
+/* A forked child inherits the registrations. */
+TEST(fork_inherits_registrations)
+{
+	int expected = register_all(_metadata), status;
+	pid_t pid;
+
+	pid = fork();
+	ASSERT_GE(pid, 0);
+	if (!pid)
+		_exit(get_registrations() != expected);
+	ASSERT_EQ(waitpid(pid, &status, 0), pid);
+	EXPECT_TRUE(WIFEXITED(status));
+	EXPECT_EQ(WEXITSTATUS(status), 0);
+}
+
+/*
+ * exec() drops the registrations. The new program image starts with
+ * the registrations which this test program had when it started.
+ */
+static int initial_registrations;
+
+TEST(exec_drops_registrations)
+{
+	char expected[16];
+	int status;
+	pid_t pid;
+
+	register_all(_metadata);
+	snprintf(expected, sizeof(expected), "%d", initial_registrations);
+	pid = fork();
+	ASSERT_GE(pid, 0);
+	if (!pid) {
+		execl("/proc/self/exe", "membarrier_test_cmd",
+		      "--expect-registrations", expected, NULL);
+		_exit(2);
+	}
+	ASSERT_EQ(waitpid(pid, &status, 0), pid);
+	EXPECT_TRUE(WIFEXITED(status));
+	if (WEXITSTATUS(status) == 2)
+		SKIP(return, "cannot exec /proc/self/exe");
+	EXPECT_EQ(WEXITSTATUS(status), 0);
+}
+
+static int clone_vm_fn(void *arg)
+{
+	int cmd = *(int *)arg;
+
+	return sys_membarrier(cmd, 0, 0) ? 1 : 0;
+}
+
+/*
+ * The registrations belong to the mm. A task of another thread group
+ * which shares the mm (CLONE_VM without CLONE_THREAD) registers for
+ * both thread groups.
+ */
+TEST(clone_vm_shares_registrations)
+{
+	int cmd = MEMBARRIER_CMD_REGISTER_PRIVATE_EXPEDITED;
+	int before = get_registrations(), status;
+	char *stack;
+	pid_t pid;
+
+	ASSERT_GE(before, 0);
+	stack = malloc(STACK_SIZE);
+	ASSERT_NE(stack, NULL);
+	pid = clone(clone_vm_fn, stack + STACK_SIZE, CLONE_VM | SIGCHLD, &cmd);
+	ASSERT_GE(pid, 0);
+	ASSERT_EQ(waitpid(pid, &status, 0), pid);
+	EXPECT_TRUE(WIFEXITED(status));
+	EXPECT_EQ(WEXITSTATUS(status), 0);
+	EXPECT_EQ(get_registrations(), before | cmd);
+	EXPECT_EQ(sys_membarrier(MEMBARRIER_CMD_PRIVATE_EXPEDITED, 0, 0), 0);
+	free(stack);
+}
+
+int main(int argc, char **argv)
+{
+	/* New program image of exec_drops_registrations. */
+	if (argc == 3 && !strcmp(argv[1], "--expect-registrations"))
+		return get_registrations() != atoi(argv[2]);
+
+	if (query() < 0)
+		ksft_exit_skip("sys membarrier (CONFIG_MEMBARRIER) is disabled.\n");
+	initial_registrations = get_registrations();
+	if (initial_registrations < 0)
+		ksft_exit_skip("MEMBARRIER_CMD_GET_REGISTRATIONS is not available.\n");
+	return test_harness_run(argc, argv);
+}
-- 
2.47.3

