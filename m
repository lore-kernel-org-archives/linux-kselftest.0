Received: from pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com [35.162.73.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 442F131E85A;
	Tue, 21 Apr 2026 19:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.162.73.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776800660; cv=none; b=I3NRVuwsLB6I6ZPmijSDmsEu9vAaSTFv/0ot7/5IPPyKX59tUaCtgXyf3DviAV2MPb0IQ3oYHZDiBExqnEWcGF5NZUaF2cGNy8tifmrmK9rHVmWfRs8pB1XjAI7HKeEHbEwm0o16sTr1QOY8BtgA1mUwizsW0kc+Gm7218TQ0Wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776800660; c=relaxed/simple;
	bh=ixGfEUXN33aHx1jytPOeHI8oF6icQ0d8m9IrlMMCccw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ogdZoj4DSYd0Q9JtiWPn/A7QRz7O0koz31Sfz1UBB+8xlsFP/jIyie4yIStpP54wARTFAg7jEmaqFnWFXlf0CNgykdYVYy1Qv0xYIcstTEVOS0la+zJ0YtcORyZ6BdBXiHUZNzB8y7nEejx7sb+0FS4SSXW1X0kdWBZ3p+j53yY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.de; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=XrRdzuVW; arc=none smtp.client-ip=35.162.73.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="XrRdzuVW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1776800659; x=1808336659;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=DW5ne1Db4EmSL161GRM6ySF68fSBrLbvOXo6fwBHxIA=;
  b=XrRdzuVWUnEZzZH1SEF81CXEjEJh+JDT+H3D+e7WorqfhQ24ds9fbPuA
   rGQi+rUbHzHx/ygrwfTSRuudFAmPjpoxcQcorMu+d/CwQ34lBNsKV6xNq
   cJRS5flzAf7LSOG8Ia5Oi2QOI9IzmJ/yBOKF1y19Yv9ADIllOzHpU7QCj
   jhQAuHoOSQJJ41JROzPXlf+Khz2uCpIKZnEQxRlDGl7cuOznnYxv2ovMS
   6ckbHFI7tqmzTsqjN7u7+hhLw7cmhFZcXruehDJKdFdtn75lXWUfzrsm1
   E3HshMr1BrYqzAQw4Mb0iXRNQPTDQQd/2ady3vfenNOqrn5BYStxFroJQ
   Q==;
X-CSE-ConnectionGUID: uaqjxcFXQNS39ZBqxp0Ljw==
X-CSE-MsgGUID: GlsAsAxGTIa9OlpZPoDnVQ==
X-IronPort-AV: E=Sophos;i="6.23,192,1770595200"; 
   d="scan'208";a="17679924"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 19:44:15 +0000
Received: from EX19MTAUWB002.ant.amazon.com [205.251.233.48:2314]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.57.50:2525] with esmtp (Farcaster)
 id 02e67b7b-3d4a-4719-9a2b-e734d56325f5; Tue, 21 Apr 2026 19:44:14 +0000 (UTC)
X-Farcaster-Flow-ID: 02e67b7b-3d4a-4719-9a2b-e734d56325f5
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Tue, 21 Apr 2026 19:44:14 +0000
Received: from dev-dsk-doebel-1a-7b355d76.us-east-1.amazon.com (10.169.119.5)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Tue, 21 Apr 2026 19:44:13 +0000
From: Bjoern Doebel <doebel@amazon.com>
To: 
CC: Bjoern Doebel <doebel@amazon.com>, Christian Brauner <brauner@kernel.org>,
	Pavel Tikhomirov <ptikhomirov@virtuozzo.com>, Shuah Khan <shuah@kernel.org>,
	"open list:NAMESPACES:" <linux-kernel@vger.kernel.org>, "open list:KERNEL
 SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>
Subject: [PATCH] selftests/pid_namespace: compute pid_max test limits dynamically
Date: Tue, 21 Apr 2026 19:43:38 +0000
Message-ID: <20260421194344.2981537-1-doebel@amazon.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ClientProxiedBy: EX19D043UWC001.ant.amazon.com (10.13.139.202) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The pid_max kselftest hardcodes pid_max values of 400 and 500, but the
kernel enforces a minimum of PIDS_PER_CPU_MIN * num_possible_cpus().
On machines with many possible CPUs (e.g. nr_cpu_ids=128 yields a
minimum of 1024), writing 400 or 500 to /proc/sys/kernel/pid_max
returns EINVAL and all three tests fail.

Compute these limits the same way as the kernel does and set outer_limit
and inner_limit dynamically based on the result. Original test semantics
are preserved (outer < inner, nested namespace capped by parent).

Signed-off-by: Bjoern Doebel <doebel@amazon.com>
---
 .../testing/selftests/pid_namespace/pid_max.c | 153 ++++++++++++++----
 1 file changed, 119 insertions(+), 34 deletions(-)

diff --git a/tools/testing/selftests/pid_namespace/pid_max.c b/tools/testing/selftests/pid_namespace/pid_max.c
index c9519e7385b6..8bd600f55421 100644
--- a/tools/testing/selftests/pid_namespace/pid_max.c
+++ b/tools/testing/selftests/pid_namespace/pid_max.c
@@ -12,10 +12,76 @@
 #include <syscall.h>
 #include <sys/mount.h>
 #include <sys/wait.h>
+#include <unistd.h>
 
 #include "kselftest_harness.h"
 #include "../pidfd/pidfd.h"
 
+/*
+ * The kernel computes the minimum allowed pid_max as:
+ *   max(RESERVED_PIDS + 1, PIDS_PER_CPU_MIN * num_possible_cpus())
+ * Mirror that here so the test values are always valid.
+ *
+ * Note: glibc's get_nprocs_conf() returns the number of *configured*
+ * (present) CPUs, not *possible* CPUs.  The kernel uses
+ * num_possible_cpus() which corresponds to /sys/devices/system/cpu/possible.
+ * These can differ significantly (e.g. 16 configured vs 128 possible).
+ */
+#define RESERVED_PIDS		300
+#define PIDS_PER_CPU_MIN	8
+
+/* Count CPUs from a range list like "0-31" or "0-15,32-47". */
+static int num_possible_cpus(void)
+{
+	FILE *f;
+	int count = 0;
+	int lo, hi;
+
+	f = fopen("/sys/devices/system/cpu/possible", "r");
+	if (!f)
+		return 0;
+
+	while (fscanf(f, "%d", &lo) == 1) {
+		if (fscanf(f, "-%d", &hi) == 1)
+			count += hi - lo + 1;
+		else
+			count++;
+		/* skip comma separator */
+		fscanf(f, ",");
+	}
+
+	fclose(f);
+	return count;
+}
+
+static int pid_min(void)
+{
+	int cpu_min = PIDS_PER_CPU_MIN * num_possible_cpus();
+
+	return cpu_min > (RESERVED_PIDS + 1) ? cpu_min : (RESERVED_PIDS + 1);
+}
+
+struct pid_max_cfg {
+	int outer;
+	int inner;
+};
+
+/*
+ * Outer and inner pid_max limits used by the tests.  The outer limit is
+ * the more restrictive ancestor; the inner limit is set higher in a
+ * nested namespace but must still be capped by the outer limit.
+ * Both are derived from the kernel's minimum so they are always writable.
+ */
+#define PID_MAX_CFG_INIT { .outer = pid_min() + 100, .inner = pid_min() + 200 }
+
+static int write_int_to_fd(int fd, int val)
+{
+	char buf[24];
+	int len = snprintf(buf, sizeof(buf), "%d", val);
+
+	return write(fd, buf, len);
+}
+
 #define __STACK_SIZE (8 * 1024 * 1024)
 static pid_t do_clone(int (*fn)(void *), void *arg, int flags)
 {
@@ -37,6 +103,7 @@ static pid_t do_clone(int (*fn)(void *), void *arg, int flags)
 
 static int pid_max_cb(void *data)
 {
+	struct pid_max_cfg *cfg = data;
 	int fd, ret;
 	pid_t pid;
 
@@ -60,18 +127,18 @@ static int pid_max_cb(void *data)
 		return -1;
 	}
 
-	ret = write(fd, "500", sizeof("500") - 1);
+	ret = write_int_to_fd(fd, cfg->inner);
 	if (ret < 0) {
 		fprintf(stderr, "%m - Failed to write pid_max\n");
 		return -1;
 	}
 
-	for (int i = 0; i < 501; i++) {
+	for (int i = 0; i < cfg->inner + 1; i++) {
 		pid = fork();
 		if (pid == 0)
 			exit(EXIT_SUCCESS);
 		wait_for_pid(pid);
-		if (pid > 500) {
+		if (pid > cfg->inner) {
 			fprintf(stderr, "Managed to create pid number beyond limit\n");
 			return -1;
 		}
@@ -82,6 +149,7 @@ static int pid_max_cb(void *data)
 
 static int pid_max_nested_inner(void *data)
 {
+	struct pid_max_cfg *cfg = data;
 	int fret = -1;
 	pid_t pids[2];
 	int fd, i, ret;
@@ -106,7 +174,7 @@ static int pid_max_nested_inner(void *data)
 		return fret;
 	}
 
-	ret = write(fd, "500", sizeof("500") - 1);
+	ret = write_int_to_fd(fd, cfg->inner);
 	close(fd);
 	if (ret < 0) {
 		fprintf(stderr, "%m - Failed to write pid_max\n");
@@ -133,8 +201,8 @@ static int pid_max_nested_inner(void *data)
 		return fret;
 	}
 
-	/* Now make sure that we wrap pids at 400. */
-	for (i = 0; i < 510; i++) {
+	/* Now make sure that we wrap pids at outer_limit. */
+	for (i = 0; i < cfg->inner + 10; i++) {
 		pid_t pid;
 
 		pid = fork();
@@ -145,7 +213,7 @@ static int pid_max_nested_inner(void *data)
 			exit(EXIT_SUCCESS);
 
 		wait_for_pid(pid);
-		if (pid >= 500) {
+		if (pid >= cfg->inner) {
 			fprintf(stderr, "Managed to create process with pid %d beyond configured limit\n", pid);
 			return fret;
 		}
@@ -156,15 +224,20 @@ static int pid_max_nested_inner(void *data)
 
 static int pid_max_nested_outer(void *data)
 {
-	int fret = -1, nr_procs = 400;
-	pid_t pids[1000];
-	int fd, i, ret;
+	struct pid_max_cfg *cfg = data;
+	int fret = -1, nr_procs = 0;
+	pid_t *pids;
+	int fd, ret;
 	pid_t pid;
 
+	pids = malloc(cfg->outer * sizeof(pid_t));
+	if (!pids)
+		return -1;
+
 	ret = mount("", "/", NULL, MS_PRIVATE | MS_REC, 0);
 	if (ret) {
 		fprintf(stderr, "%m - Failed to make rootfs private mount\n");
-		return fret;
+		goto out;
 	}
 
 	umount2("/proc", MNT_DETACH);
@@ -172,27 +245,27 @@ static int pid_max_nested_outer(void *data)
 	ret = mount("proc", "/proc", "proc", 0, NULL);
 	if (ret) {
 		fprintf(stderr, "%m - Failed to mount proc\n");
-		return fret;
+		goto out;
 	}
 
 	fd = open("/proc/sys/kernel/pid_max", O_RDWR | O_CLOEXEC | O_NOCTTY);
 	if (fd < 0) {
 		fprintf(stderr, "%m - Failed to open pid_max\n");
-		return fret;
+		goto out;
 	}
 
-	ret = write(fd, "400", sizeof("400") - 1);
+	ret = write_int_to_fd(fd, cfg->outer);
 	close(fd);
 	if (ret < 0) {
 		fprintf(stderr, "%m - Failed to write pid_max\n");
-		return fret;
+		goto out;
 	}
 
 	/*
-	 * Create 397 processes. This leaves room for do_clone() (398) and
-	 * one more 399. So creating another process needs to fail.
+	 * Create (outer - 4) processes. This leaves room for do_clone()
+	 * and one more process. So creating another process needs to fail.
 	 */
-	for (nr_procs = 0; nr_procs < 396; nr_procs++) {
+	for (nr_procs = 0; nr_procs < cfg->outer - 4; nr_procs++) {
 		pid = fork();
 		if (pid < 0)
 			goto reap;
@@ -203,7 +276,7 @@ static int pid_max_nested_outer(void *data)
 		pids[nr_procs] = pid;
 	}
 
-	pid = do_clone(pid_max_nested_inner, NULL, CLONE_NEWPID | CLONE_NEWNS);
+	pid = do_clone(pid_max_nested_inner, cfg, CLONE_NEWPID | CLONE_NEWNS);
 	if (pid < 0) {
 		fprintf(stderr, "%m - Failed to clone nested pidns\n");
 		goto reap;
@@ -220,20 +293,27 @@ static int pid_max_nested_outer(void *data)
 	for (int i = 0; i < nr_procs; i++)
 		wait_for_pid(pids[i]);
 
+out:
+	free(pids);
 	return fret;
 }
 
 static int pid_max_nested_limit_inner(void *data)
 {
-	int fret = -1, nr_procs = 400;
+	struct pid_max_cfg *cfg = data;
+	int fret = -1, nr_procs = 0;
 	int fd, ret;
 	pid_t pid;
-	pid_t pids[1000];
+	pid_t *pids;
+
+	pids = malloc(cfg->inner * sizeof(pid_t));
+	if (!pids)
+		return -1;
 
 	ret = mount("", "/", NULL, MS_PRIVATE | MS_REC, 0);
 	if (ret) {
 		fprintf(stderr, "%m - Failed to make rootfs private mount\n");
-		return fret;
+		goto out;
 	}
 
 	umount2("/proc", MNT_DETACH);
@@ -241,23 +321,23 @@ static int pid_max_nested_limit_inner(void *data)
 	ret = mount("proc", "/proc", "proc", 0, NULL);
 	if (ret) {
 		fprintf(stderr, "%m - Failed to mount proc\n");
-		return fret;
+		goto out;
 	}
 
 	fd = open("/proc/sys/kernel/pid_max", O_RDWR | O_CLOEXEC | O_NOCTTY);
 	if (fd < 0) {
 		fprintf(stderr, "%m - Failed to open pid_max\n");
-		return fret;
+		goto out;
 	}
 
-	ret = write(fd, "500", sizeof("500") - 1);
+	ret = write_int_to_fd(fd, cfg->inner);
 	close(fd);
 	if (ret < 0) {
 		fprintf(stderr, "%m - Failed to write pid_max\n");
-		return fret;
+		goto out;
 	}
 
-	for (nr_procs = 0; nr_procs < 500; nr_procs++) {
+	for (nr_procs = 0; nr_procs < cfg->inner; nr_procs++) {
 		pid = fork();
 		if (pid < 0)
 			break;
@@ -268,7 +348,7 @@ static int pid_max_nested_limit_inner(void *data)
 		pids[nr_procs] = pid;
 	}
 
-	if (nr_procs >= 400) {
+	if (nr_procs >= cfg->outer) {
 		fprintf(stderr, "Managed to create processes beyond the configured outer limit\n");
 		goto reap;
 	}
@@ -279,11 +359,14 @@ static int pid_max_nested_limit_inner(void *data)
 	for (int i = 0; i < nr_procs; i++)
 		wait_for_pid(pids[i]);
 
+out:
+	free(pids);
 	return fret;
 }
 
 static int pid_max_nested_limit_outer(void *data)
 {
+	struct pid_max_cfg *cfg = data;
 	int fd, ret;
 	pid_t pid;
 
@@ -307,14 +390,14 @@ static int pid_max_nested_limit_outer(void *data)
 		return -1;
 	}
 
-	ret = write(fd, "400", sizeof("400") - 1);
+	ret = write_int_to_fd(fd, cfg->outer);
 	close(fd);
 	if (ret < 0) {
 		fprintf(stderr, "%m - Failed to write pid_max\n");
 		return -1;
 	}
 
-	pid = do_clone(pid_max_nested_limit_inner, NULL, CLONE_NEWPID | CLONE_NEWNS);
+	pid = do_clone(pid_max_nested_limit_inner, cfg, CLONE_NEWPID | CLONE_NEWNS);
 	if (pid < 0) {
 		fprintf(stderr, "%m - Failed to clone nested pidns\n");
 		return -1;
@@ -330,28 +413,30 @@ static int pid_max_nested_limit_outer(void *data)
 
 TEST(pid_max_simple)
 {
+	struct pid_max_cfg cfg = PID_MAX_CFG_INIT;
 	pid_t pid;
 
-
-	pid = do_clone(pid_max_cb, NULL, CLONE_NEWPID | CLONE_NEWNS);
+	pid = do_clone(pid_max_cb, &cfg, CLONE_NEWPID | CLONE_NEWNS);
 	ASSERT_GT(pid, 0);
 	ASSERT_EQ(0, wait_for_pid(pid));
 }
 
 TEST(pid_max_nested_limit)
 {
+	struct pid_max_cfg cfg = PID_MAX_CFG_INIT;
 	pid_t pid;
 
-	pid = do_clone(pid_max_nested_limit_outer, NULL, CLONE_NEWPID | CLONE_NEWNS);
+	pid = do_clone(pid_max_nested_limit_outer, &cfg, CLONE_NEWPID | CLONE_NEWNS);
 	ASSERT_GT(pid, 0);
 	ASSERT_EQ(0, wait_for_pid(pid));
 }
 
 TEST(pid_max_nested)
 {
+	struct pid_max_cfg cfg = PID_MAX_CFG_INIT;
 	pid_t pid;
 
-	pid = do_clone(pid_max_nested_outer, NULL, CLONE_NEWPID | CLONE_NEWNS);
+	pid = do_clone(pid_max_nested_outer, &cfg, CLONE_NEWPID | CLONE_NEWNS);
 	ASSERT_GT(pid, 0);
 	ASSERT_EQ(0, wait_for_pid(pid));
 }
-- 
2.50.1




Amazon Web Services Development Center Germany GmbH
Tamara-Danz-Str. 13
10243 Berlin
Geschaeftsfuehrung: Christof Hellmis, Andreas Stieger
Eingetragen am Amtsgericht Charlottenburg unter HRB 257764 B
Sitz: Berlin
Ust-ID: DE 365 538 597

