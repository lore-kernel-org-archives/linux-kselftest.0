Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E50953E9C12;
	Sun, 13 Sep 2026 14:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789308720; cv=none; b=oLLwFPo7y0AzkySAQUa6Gr9e6SKdIw7CZ/6GCJeIo4PnBOq0hiu/SGLMQkS9KZLUMRaLVacnJQcbCoYCYyOiIrpp+lQ3obLuM9KknFhn5+NB0kKAwh/tHN5BshDtnZjHlrmnWtOip/2GrUWawBWjDjx+7Q5Bw4Ydo+hsooWtm3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789308720; c=relaxed/simple;
	bh=5jEcgfzuFG9WzNTEsPant0FzwTi4FP0cWe2BNrm61y0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gWMEoZ6OwAWAZ1IDgQJ/tz3ARKEhCMtjYBJJH1a9WT4P5MlnRWzU0PWVbJnlOu8Xc+oWRErvziblVKfOIt83kqVran3vhvVicwz3yA5ahF3YNDJLYx5d2O6P3pZYdJvmJHjSZcal3MOEL7uCUkC3X30BtkY48OcXXISxyn2Myng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=e+Ssimcp; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="e+Ssimcp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=hb
	5u1gF4u/r+OYROsvy452ERxXcsq25RRWiIzysw9Bw=; b=e+SsimcpYFo/Zo4JmX
	qVtg1iW7lxEEV1cNyKJw95BlgikGqoH7a3oHb1kLpVdSpPuqCNQp3qr/3ovH2Otn
	kUBwZuU6KHa/e1MD7Ds2Pgrc4vGhUa8eoxm82PWppO21mYQNhWDluSqoz+PMP7oQ
	ccg+ezLn5sW1eF25WjHxlehNk=
Received: from localhost (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgD3HwbjrqZqlLvuPw--.46190S2;
	Sun, 13 Sep 2026 22:10:44 +0800 (CST)
From: Hui Su <sh_def@163.com>
To: peterz@infradead.org
Cc: mingo@redhat.com,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com,
	shuah@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Hui Su <sh_def@163.com>
Subject: [PATCH v2 2/2] selftests/sched: Retry PR_SCHED_CORE_GET on EBUSY
Date: Sun, 13 Sep 2026 23:10:40 +0900
Message-ID: <20260913141040.2338964-3-sh_def@163.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260913141040.2338964-1-sh_def@163.com>
References: <20260913141040.2338964-1-sh_def@163.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PSgvCgD3HwbjrqZqlLvuPw--.46190S2
X-Coremail-Antispam: 1Uf129KBjvJXoW3Aw1UZFW7Cw4DCrW8WryUWrg_yoW3Gw1UpF
	W3tw1DtFW8WFW3Jr4kJr4kXFyrGrn8tF47Krsak34Iyw4UGr1UGryIy34aqry7Jr40qw45
	ua1qy3ZFyFy7X3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JU1pBsUUUUU=
X-CM-SenderInfo: xvkbvvri6rljoofrz/xtbCwgQpiGqmruRQswAA3C

During early boot, the pointer hash key may not be initialized when
PR_SCHED_CORE_GET is called. With the preceding kernel fix, GET reports
EBUSY until the pointer hash key becomes available.

Retry the operation for up to one second when it returns EBUSY. Keep the
syscall status separate from the returned cookie and abort the test if
the GET still fails, so an error value cannot be compared as a valid
cookie. Report other errors immediately instead of describing every
failed GET as an unsupported core scheduling system.

cs_prctl_test passes on x86_64 with normal random initialization.

Signed-off-by: Hui Su <sh_def@163.com>
---
v2:
- Return cookie values directly from the fatal error helper to keep the
  selftest comparisons compact.
- Avoid sleeping after the final retry.

 tools/testing/selftests/sched/cs_prctl_test.c | 93 +++++++++++++------
 1 file changed, 63 insertions(+), 30 deletions(-)

diff --git a/tools/testing/selftests/sched/cs_prctl_test.c b/tools/testing/selftests/sched/cs_prctl_test.c
index 52d97fae4dbd..7bd0bc262a6b 100644
--- a/tools/testing/selftests/sched/cs_prctl_test.c
+++ b/tools/testing/selftests/sched/cs_prctl_test.c
@@ -51,6 +51,8 @@ static pid_t gettid(void)
 
 #define MAX_PROCESSES 128
 #define MAX_THREADS   128
+#define CORE_COOKIE_RETRIES	100
+#define CORE_COOKIE_RETRY_US	10000
 
 static const char USAGE[] = "cs_prctl_test [options]\n"
 "    options:\n"
@@ -109,19 +111,43 @@ static void handle_usage(int rc, char *msg)
 	exit(rc);
 }
 
-static unsigned long get_cs_cookie(int pid)
+static int get_cs_cookie(int pid, unsigned long long *cookie)
 {
-	unsigned long long cookie;
-	int ret;
+	int i, ret, err = 0;
 
-	ret = prctl(PR_SCHED_CORE, PR_SCHED_CORE_GET, pid, PIDTYPE_PID,
-		    (unsigned long)&cookie);
-	if (ret) {
-		printf("Not a core sched system\n");
-		return -1UL;
+	for (i = 0; i < CORE_COOKIE_RETRIES; i++) {
+		ret = prctl(PR_SCHED_CORE, PR_SCHED_CORE_GET, pid, PIDTYPE_PID,
+			    (unsigned long)cookie);
+		if (!ret)
+			return 0;
+
+		err = errno;
+		if (err != EBUSY || i == CORE_COOKIE_RETRIES - 1)
+			break;
+
+		usleep(CORE_COOKIE_RETRY_US);
 	}
 
-	return cookie;
+	if (err == EBUSY)
+		printf("Timed out waiting for core sched cookie\n");
+	else
+		printf("Failed to get core sched cookie: %s\n", strerror(err));
+
+	return err;
+}
+
+static unsigned long long get_cs_cookie_or_die(int pid)
+{
+	unsigned long long cookie;
+	int err;
+
+	err = get_cs_cookie(pid, &cookie);
+	if (!err)
+		return cookie;
+
+	errno = err;
+	handle_error("get core sched cookie");
+	__builtin_unreachable();
 }
 
 static int child_func_thread(void __attribute__((unused))*arg)
@@ -202,15 +228,16 @@ void disp_processes(int num_processes, struct child_args proc[])
 {
 	int i, j;
 
-	printf("tid=%d, / tgid=%d / pgid=%d: %lx\n", gettid(), getpid(), getpgid(0),
-	       get_cs_cookie(getpid()));
+	printf("tid=%d, / tgid=%d / pgid=%d: %llx\n", gettid(), getpid(), getpgid(0),
+	       get_cs_cookie_or_die(getpid()));
 
 	for (i = 0; i < num_processes; ++i) {
-		printf("    tid=%d, / tgid=%d / pgid=%d: %lx\n", proc[i].cpid, proc[i].cpid,
-		       getpgid(proc[i].cpid), get_cs_cookie(proc[i].cpid));
+		printf("    tid=%d, / tgid=%d / pgid=%d: %llx\n", proc[i].cpid, proc[i].cpid,
+		       getpgid(proc[i].cpid), get_cs_cookie_or_die(proc[i].cpid));
 		for (j = 0; j < proc[i].num_threads; ++j) {
-			printf("        tid=%d, / tgid=%d / pgid=%d: %lx\n", proc[i].thr_tids[j],
-			       proc[i].cpid, getpgid(0), get_cs_cookie(proc[i].thr_tids[j]));
+			printf("        tid=%d, / tgid=%d / pgid=%d: %llx\n", proc[i].thr_tids[j],
+			       proc[i].cpid, getpgid(0),
+			       get_cs_cookie_or_die(proc[i].thr_tids[j]));
 		}
 	}
 	puts("\n");
@@ -280,30 +307,32 @@ int main(int argc, char *argv[])
 	create_processes(num_processes, num_threads, procs);
 	need_cleanup = 1;
 	disp_processes(num_processes, procs);
-	validate(get_cs_cookie(0) == 0);
+	validate(get_cs_cookie_or_die(0) == 0);
 
 	printf("\n## Set a cookie on entire process group\n");
 	if (_prctl(PR_SCHED_CORE, PR_SCHED_CORE_CREATE, 0, PIDTYPE_PGID, 0) < 0)
 		handle_error("core_sched create failed -- PGID");
 	disp_processes(num_processes, procs);
 
-	validate(get_cs_cookie(0) != 0);
+	validate(get_cs_cookie_or_die(0) != 0);
 
 	/* get a random process pid */
 	pidx = rand() % num_processes;
 	pid = procs[pidx].cpid;
 
-	validate(get_cs_cookie(0) == get_cs_cookie(pid));
-	validate(get_cs_cookie(0) == get_cs_cookie(procs[pidx].thr_tids[0]));
+	validate(get_cs_cookie_or_die(0) == get_cs_cookie_or_die(pid));
+	validate(get_cs_cookie_or_die(0) ==
+		 get_cs_cookie_or_die(procs[pidx].thr_tids[0]));
 
 	printf("\n## Set a new cookie on entire process/TGID [%d]\n", pid);
 	if (_prctl(PR_SCHED_CORE, PR_SCHED_CORE_CREATE, pid, PIDTYPE_TGID, 0) < 0)
 		handle_error("core_sched create failed -- TGID");
 	disp_processes(num_processes, procs);
 
-	validate(get_cs_cookie(0) != get_cs_cookie(pid));
-	validate(get_cs_cookie(pid) != 0);
-	validate(get_cs_cookie(pid) == get_cs_cookie(procs[pidx].thr_tids[0]));
+	validate(get_cs_cookie_or_die(0) != get_cs_cookie_or_die(pid));
+	validate(get_cs_cookie_or_die(pid) != 0);
+	validate(get_cs_cookie_or_die(pid) ==
+		 get_cs_cookie_or_die(procs[pidx].thr_tids[0]));
 
 	printf("\n## Copy the cookie of current/PGID[%d], to pid [%d] as PIDTYPE_PID\n",
 	       getpid(), pid);
@@ -311,9 +340,10 @@ int main(int argc, char *argv[])
 		handle_error("core_sched share to itself failed -- PID");
 	disp_processes(num_processes, procs);
 
-	validate(get_cs_cookie(0) == get_cs_cookie(pid));
-	validate(get_cs_cookie(pid) != 0);
-	validate(get_cs_cookie(pid) != get_cs_cookie(procs[pidx].thr_tids[0]));
+	validate(get_cs_cookie_or_die(0) == get_cs_cookie_or_die(pid));
+	validate(get_cs_cookie_or_die(pid) != 0);
+	validate(get_cs_cookie_or_die(pid) !=
+		 get_cs_cookie_or_die(procs[pidx].thr_tids[0]));
 
 	printf("\n## Copy cookie from a thread [%d] to current/PGID [%d] as PIDTYPE_PID\n",
 	       procs[pidx].thr_tids[0], getpid());
@@ -322,17 +352,20 @@ int main(int argc, char *argv[])
 		handle_error("core_sched share from thread failed -- PID");
 	disp_processes(num_processes, procs);
 
-	validate(get_cs_cookie(0) == get_cs_cookie(procs[pidx].thr_tids[0]));
-	validate(get_cs_cookie(pid) != get_cs_cookie(procs[pidx].thr_tids[0]));
+	validate(get_cs_cookie_or_die(0) ==
+		 get_cs_cookie_or_die(procs[pidx].thr_tids[0]));
+	validate(get_cs_cookie_or_die(pid) !=
+		 get_cs_cookie_or_die(procs[pidx].thr_tids[0]));
 
 	printf("\n## Copy cookie from current [%d] to current as pidtype PGID\n", getpid());
 	if (_prctl(PR_SCHED_CORE, PR_SCHED_CORE_SHARE_TO, 0, PIDTYPE_PGID, 0) < 0)
 		handle_error("core_sched share to self failed -- PGID");
 	disp_processes(num_processes, procs);
 
-	validate(get_cs_cookie(0) == get_cs_cookie(pid));
-	validate(get_cs_cookie(pid) != 0);
-	validate(get_cs_cookie(pid) == get_cs_cookie(procs[pidx].thr_tids[0]));
+	validate(get_cs_cookie_or_die(0) == get_cs_cookie_or_die(pid));
+	validate(get_cs_cookie_or_die(pid) != 0);
+	validate(get_cs_cookie_or_die(pid) ==
+		 get_cs_cookie_or_die(procs[pidx].thr_tids[0]));
 
 	validate(_prctl(PR_SCHED_CORE, PR_SCHED_CORE_MAX, 0, PIDTYPE_PGID, 0) < 0
 		&& errno == EINVAL);
-- 
2.55.0

