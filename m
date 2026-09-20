Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDBD61A0BF1
	for <linux-kselftest@vger.kernel.org>; Sun, 20 Sep 2026 07:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789888842; cv=none; b=aHVIInh14BkfR+hFmH1lMKCAMXsqA9/PRrs4a005lT9wm+8TsMJo2k2Mlz8twzRq1THSiwmD/ruF1Jlv0QW7j8lx2sb8c+00cD+Q24DzdNzAKkvsu2YccSej8lIQJivxHhVxe6tUa+YEKzayEhTvasqULE5mvT61ih4hEcLqfrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789888842; c=relaxed/simple;
	bh=Bahp3kxrHBjatSfpkgnaRh889D7Q2r/ojrekaxKXonc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mdKkPEZXpx9nPXncB3O5mwcf8/8wZFxCGm1ikyGUqNNdb05h9871uQWv/2S26MzObm6uKmVBO5/KqvfaINcmUP9XNZTmeyEmyNsVDxNe4LL1jrim6w929dgvT0K+KB8BDUaBcBRLbSnztJ1+FR+8ZSSPy5vjybpj9ciVewv5Nt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HzBIReeq; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HzBIReeq"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39d654f02baso1735490a91.3
        for <linux-kselftest@vger.kernel.org>; Sun, 20 Sep 2026 00:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789888839; x=1790493639; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1kgBE5sZukO+BKrvKP8udVj6iMzKq546dLIF59T8CjI=;
        b=HzBIReeq1yq66tRXXz68tHzWtuDLQEmM7JDKd2emQGrO6Rp1rK33lwH2sYMBRkjOD2
         VZ0y3hF7ZBj/ZiFEDaOmZCE80dO9u3Zhvb7WgvdYBTY+KSgizL0VlKrX/u1NeWMiwE5X
         5xZ1erfdJ5gAnVDVwki/Z1jCwae300O8HqPYKANIAs9YE6ARtHCmnQHun9oYIwKVbF6c
         f58bvpwu/5PAPE8HkHE+OM88k7XtzEIlZNudCG5HkG3gxvv68GrlwuI0LFMPtqaHMxNB
         CvCZmmOHnNw2jOfM0H7YJGxPBqsXeoGywyOpQFKT4UlMY/H2rQ8mzssYcquSJdY4Y0Ik
         FTMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789888839; x=1790493639;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1kgBE5sZukO+BKrvKP8udVj6iMzKq546dLIF59T8CjI=;
        b=Y5NVR4Buli45cKv7ymcyE8rsncd01munYf5DPSeb7FJhOoJ0Hh7lqhvChkGFXUI/oW
         FLasW460rowBDX8IuFIEDR3Lg9He8mkRZXFkFV3Fh6T/vaZ+g5uAg1WyDntzONgwExu9
         ge4P6Dzd7IlDhqishwPsK0phm42QeH3R1NNzswNAJ+ESn42BGRCerJvX1j6+bYjXQo92
         i6n1b8EBRUcUJv7eec8kNsimkQhQALxV0UYggi8JQGpTGa1IpR7axvB15O5WBBO0b9h6
         dIbpGeSFbJ57D/TV6rhrqTYavnBlFkvKYFXuEilsWBxq6KS2nWiCswzhJ3JVZDRPR0zl
         ir4A==
X-Forwarded-Encrypted: i=1; AKwUvBw2+Ukt9eyPrTsix8Qbh/7inqsTqOviexCQmwSCSTpufZM9E5FXwcxkYxEZyxzwuN76/dvfqoM6H3aL3gfHipQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lC37RVrvpWzLMRIr0QKn8i1aRS/uLDZnNhMDINxz/WNAjw4ARp
	f2ZT6ZZ41ZGghj6HLXjYMXi+32wjJV23d+qiU1MgsNJZPO5FP/U4J9c7
X-Gm-Gg: AYBFou3d6DhluvD0wGN3h/icKhqkZu3KCY3khJVKUS14J125BKgcmXWAgPWBmp2ZOP8
	LGd4aFfeJRr/iO9X5I+AvwEVK6H8MOMRd/dcXBNrnMhOTnEWlmPv6CyO41fFY2o4JFT4T9Up8Ec
	0clMELvJJe3wavT9qguZW9mzustDWkA9vzuIEOD8AiFIV3uFWNA+G9sUwYoDL5Dw8hgK3/pATA1
	K1XuG9qmLPiY0NyaMmEO7oVso4kiQ9FmD2bwNvPX3CeoU3OSVuoJC4CIiBmo+DLa2cQ0AyQJm/g
	JvJeG8651X9T2VyWj6cjpTF7ipDjAF+yeCmDz4+ADZ00zQWLaFomrlPFQF2D/tkZBQP7YMYyNpA
	6N04cMzWDkX1aA+f8y0cQbPg1fAbD8Sgwe07qyCc0FAj6kJPJCaYL9TQCzDtLwYuxBBIMERJhMJ
	v4IFi5xQ1htgrEHYcj/pC0HGv0nIjH+sU87NnKYu6fFcC2gwuk2Rzw8VdjpM3qTp0164UfEkUEg
	NZoxC81Z8zdtiS4F5xaB9ZJYHVB1RsIIk1Q/jRIGhU/ZlDyvm6g6Yo++4j5kv3myxhotaFOOtmp
	IVR0n0kHyQ==
X-Received: by 2002:a17:90b:5690:b0:398:bee5:61d6 with SMTP id 98e67ed59e1d1-39e54cfabf6mr12319727a91.24.1789888838645;
        Sun, 20 Sep 2026 00:20:38 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a041b87bfesm541212a91.3.2026.09.20.00.20.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 00:20:38 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: Kees Cook <kees@kernel.org>,
	Andy Lutomirski <luto@amacapital.net>,
	Will Drewry <wad@chromium.org>,
	Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Hui Peng <benquike@gmail.com>
Subject: [PATCH v3] seccomp: restore knotif->state when SECCOMP_ADDFD_FLAG_SEND is interrupted
Date: Sun, 20 Sep 2026 07:20:36 +0000
Message-ID: <20260920072036.3888061-1-benquike@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
In-Reply-To: <202609192050.D1E0CD96@keescook>
References: <202609192050.D1E0CD96@keescook>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In seccomp_notify_addfd(), when SECCOMP_ADDFD_FLAG_SEND is set in
addfd.flags, knotif->state is optimistically transitioned from
SECCOMP_NOTIFY_SENT to SECCOMP_NOTIFY_REPLIED before waking the tracee
and waiting on kaddfd.completion:

	if (addfd.flags & SECCOMP_ADDFD_FLAG_SEND) {
		knotif->state = SECCOMP_NOTIFY_REPLIED;
		...
	}

If wait_for_completion_interruptible(&kaddfd.completion) is interrupted
by a signal before the tracee dequeues the kaddfd request
(!list_empty(&kaddfd.list)), seccomp_notify_addfd() removes kaddfd from
knotif->addfd and returns -EINTR to the supervisor without having
installed the file descriptor.

However, knotif->state is left as SECCOMP_NOTIFY_REPLIED (with
knotif->error == 0 and knotif->val == 0). This causes two problems:

1. When the tracee runs in do_user_notif(), it checks
   if (knotif.state != SECCOMP_NOTIFY_REPLIED) after calling
   seccomp_handle_addfd(). Because knotif->state is already
   SECCOMP_NOTIFY_REPLIED, the tracee exits the notification wait loop
   prematurely and returns 0 from the trapped syscall without the file
   descriptor ever having been installed.

2. If the supervisor retries SECCOMP_IOCTL_NOTIF_ADDFD or
   SECCOMP_IOCTL_NOTIF_SEND before the tracee runs, it fails with
   -EINPROGRESS because knotif->state is no longer SECCOMP_NOTIFY_SENT.

Fix this by restoring knotif->state back to SECCOMP_NOTIFY_SENT if
SECCOMP_ADDFD_FLAG_SEND was set and kaddfd was not consumed before the
interrupted wait. Also add a seccomp_bpf selftest
(user_notification_addfd_send_interrupted) covering this race.

Fixes: 0ae71c1990f3 ("seccomp: Add a flag to atomically addfd and perform send")
Signed-off-by: Hui Peng <benquike@gmail.com>
---
Changes in v3:
- Actually include the tools/testing/selftests/seccomp/seccomp_bpf.c
  regression test in the patch diff (v2 accidentally omitted the selftest
  hunk), with detailed comments explaining the race and test setup.

Changes in v2:
- Add user_notification_addfd_send_interrupted regression test to
  tools/testing/selftests/seccomp/seccomp_bpf.c as requested by Kees Cook.

 kernel/seccomp.c                              |   2 +
 tools/testing/selftests/seccomp/seccomp_bpf.c | 161 ++++++++++++++++++
 2 files changed, 163 insertions(+)

diff --git a/kernel/seccomp.c b/kernel/seccomp.c
index 86cf4460d69e..94c7ba80a8f7 100644
--- a/kernel/seccomp.c
+++ b/kernel/seccomp.c
@@ -1808,10 +1808,13 @@ static long seccomp_notify_addfd(struct seccomp_filter *filter,
 	 * We need to check again if the addfd request has been handled,
 	 * and if not, we will remove it from the queue.
 	 */
-	if (list_empty(&kaddfd.list))
+	if (list_empty(&kaddfd.list)) {
 		ret = kaddfd.ret;
-	else
+	} else {
 		list_del(&kaddfd.list);
+		if (addfd.flags & SECCOMP_ADDFD_FLAG_SEND)
+			knotif->state = SECCOMP_NOTIFY_SENT;
+	}
 
 out_unlock:
 	mutex_unlock(&filter->notify_lock);
diff --git a/tools/testing/selftests/seccomp/seccomp_bpf.c b/tools/testing/selftests/seccomp/seccomp_bpf.c
index 0622bc2acad4..e565728f9eb2 100644
--- a/tools/testing/selftests/seccomp/seccomp_bpf.c
+++ b/tools/testing/selftests/seccomp/seccomp_bpf.c
@@ -4368,6 +4368,173 @@ TEST(user_notification_addfd_rlimit)
 	close(memfd);
 }
 
+static void sigusr1_handler(int signo)
+{
+}
+
+/*
+ * Verify that when SECCOMP_IOCTL_NOTIF_ADDFD with SECCOMP_ADDFD_FLAG_SEND is
+ * interrupted by a signal before the tracee dequeues the addfd request,
+ * knotif->state is restored from SECCOMP_NOTIFY_REPLIED back to
+ * SECCOMP_NOTIFY_SENT so that:
+ *   1. The woken tracee sees knotif->state == SECCOMP_NOTIFY_SENT in
+ *      do_user_notif() and goes back to sleep instead of prematurely
+ *      returning 0 from the trapped syscall without the FD installed.
+ *   2. The supervisor can retry SECCOMP_IOCTL_NOTIF_ADDFD (or
+ *      SECCOMP_IOCTL_NOTIF_SEND) instead of failing with -EINPROGRESS.
+ *
+ * To deterministically hit the race window where the supervisor sleeps in
+ * wait_for_completion_interruptible(&kaddfd.completion) after waking the
+ * tracee (complete(&knotif->ready)) but before the tracee runs
+ * seccomp_handle_addfd(), pin all processes to a single CPU and enforce a
+ * strict 3-tier scheduling priority hierarchy on that CPU:
+ *   - Supervisor:            SCHED_FIFO priority 99 (highest)
+ *   - Signal helper (sig_pid): SCHED_FIFO priority 50 (middle)
+ *   - Tracee (pid):          SCHED_IDLE             (lowest)
+ */
+TEST(user_notification_addfd_send_interrupted)
+{
+	/*
+	 * Save parent_pid before user_notif_syscall(__NR_getppid, ...) installs
+	 * the seccomp filter on the calling process; children inherit that
+	 * filter, so sig_pid must not call getppid().
+	 */
+	pid_t pid, sig_pid, parent_pid = getpid();
+	long ret;
+	int status, listener, memfd;
+	struct seccomp_notif_addfd addfd = {};
+	struct seccomp_notif req = {};
+	struct sigaction sa = {};
+	struct sched_param sp_tracee_idle = { .sched_priority = 0 };
+	struct sched_param sp_supervisor_fifo = { .sched_priority = 99 };
+	struct sched_param sp_sig_helper_fifo = { .sched_priority = 50 };
+	struct timespec delay = { .tv_nsec = 15000000 };
+	cpu_set_t cpuset;
+	int cpu;
+
+	/* Pin the supervisor (and its future child processes) to one CPU. */
+	cpu = sched_getcpu();
+	if (cpu >= 0) {
+		CPU_ZERO(&cpuset);
+		CPU_SET(cpu, &cpuset);
+		sched_setaffinity(0, sizeof(cpuset), &cpuset);
+	}
+
+	sa.sa_handler = sigusr1_handler;
+	ASSERT_EQ(sigaction(SIGUSR1, &sa, NULL), 0);
+
+	memfd = memfd_create("test", 0);
+	ASSERT_GE(memfd, 0);
+
+	ret = prctl(PR_SET_NO_NEW_PRIVS, 1, 0, 0, 0);
+	ASSERT_EQ(0, ret) {
+		TH_LOG("Kernel does not support PR_SET_NO_NEW_PRIVS!");
+	}
+
+	/*
+	 * Follow the convention of other user_notification_* tests in this
+	 * file by trapping __NR_getppid: because the filter is installed on
+	 * the supervisor before fork(), the trapped syscall must be a
+	 * side-effect-free syscall that the supervisor itself never invokes.
+	 * Even though getppid() does not normally return an FD,
+	 * SECCOMP_ADDFD_FLAG_SEND replaces the trapped syscall's return value
+	 * with the newly installed FD number (42).
+	 */
+	listener = user_notif_syscall(__NR_getppid,
+				      SECCOMP_FILTER_FLAG_NEW_LISTENER);
+	ASSERT_GE(listener, 0);
+
+	pid = fork();
+	ASSERT_GE(pid, 0);
+
+	if (pid == 0) {
+		/*
+		 * Tracee: invoke __NR_getppid as a dummy trigger syscall to
+		 * trap into do_user_notif(). Verify that the syscall returns
+		 * the injected FD number (42) and that FD 42 is open.
+		 */
+		ret = syscall(__NR_getppid);
+		exit(ret != 42 || fcntl(42, F_GETFD) < 0);
+	}
+
+	/* Wait for the tracee to trap in do_user_notif(). */
+	ASSERT_EQ(ioctl(listener, SECCOMP_IOCTL_NOTIF_RECV, &req), 0);
+
+	/*
+	 * Demote the tracee to SCHED_IDLE and promote the supervisor to
+	 * SCHED_FIFO(99) on the same CPU.
+	 */
+	sched_setscheduler(pid, SCHED_IDLE, &sp_tracee_idle);
+	if (sched_setscheduler(0, SCHED_FIFO, &sp_supervisor_fifo) != 0) {
+		close(listener);
+		close(memfd);
+		kill(pid, SIGKILL);
+		waitpid(pid, NULL, 0);
+		SKIP(return, "SCHED_FIFO requires CAP_SYS_NICE");
+	}
+
+	addfd.srcfd = memfd;
+	addfd.newfd_flags = O_CLOEXEC;
+	addfd.newfd = 42;
+	addfd.id = req.id;
+	addfd.flags = SECCOMP_ADDFD_FLAG_SETFD | SECCOMP_ADDFD_FLAG_SEND;
+
+	/*
+	 * Fork a signal helper on the same CPU and set it to SCHED_FIFO(50).
+	 * Because the supervisor is currently running at SCHED_FIFO(99) on
+	 * this CPU, sig_pid is queued on the runqueue but cannot run until the
+	 * supervisor blocks inside the kernel.
+	 *
+	 * When the supervisor invokes ioctl(SECCOMP_IOCTL_NOTIF_ADDFD) below:
+	 *   1. seccomp_notify_addfd() sets knotif->state = SECCOMP_NOTIFY_REPLIED,
+	 *      wakes the tracee (SCHED_IDLE), and blocks in
+	 *      wait_for_completion_interruptible(&kaddfd.completion).
+	 *   2. The CPU scheduler immediately runs sig_pid (SCHED_FIFO 50)
+	 *      ahead of the woken tracee (SCHED_IDLE).
+	 *   3. sig_pid sends SIGUSR1 to parent_pid, waking the supervisor
+	 *      (SCHED_FIFO 99), which immediately preempts sig_pid, aborts the
+	 *      wait with -ERESTARTSYS (-EINTR), removes kaddfd from
+	 *      knotif->addfd, and restores knotif->state = SECCOMP_NOTIFY_SENT
+	 *      before the tracee has executed a single instruction.
+	 */
+	sig_pid = fork();
+	ASSERT_GE(sig_pid, 0);
+	if (sig_pid == 0) {
+		sched_setscheduler(0, SCHED_FIFO, &sp_sig_helper_fifo);
+		kill(parent_pid, SIGUSR1);
+		_exit(0);
+	}
+
+	EXPECT_EQ(ioctl(listener, SECCOMP_IOCTL_NOTIF_ADDFD, &addfd), -1);
+	EXPECT_EQ(errno, EINTR);
+	EXPECT_EQ(waitpid(sig_pid, &status, 0), sig_pid);
+
+	/*
+	 * Restore normal scheduling and sleep briefly so the woken tracee
+	 * runs in do_user_notif(). With knotif->state restored to
+	 * SECCOMP_NOTIFY_SENT, the tracee must loop back to sleep waiting for
+	 * the notification reply rather than returning 0 from __NR_getppid.
+	 */
+	sched_setscheduler(0, SCHED_OTHER, &sp_tracee_idle);
+	sched_setscheduler(pid, SCHED_OTHER, &sp_tracee_idle);
+	nanosleep(&delay, NULL);
+
+	/*
+	 * Retry SECCOMP_IOCTL_NOTIF_ADDFD. Because knotif->state is
+	 * SECCOMP_NOTIFY_SENT, the retry succeeds (returns 42) instead of
+	 * failing with -EINPROGRESS, installs FD 42 into the tracee, and wakes
+	 * the tracee to complete the syscall with return value 42.
+	 */
+	EXPECT_EQ(ioctl(listener, SECCOMP_IOCTL_NOTIF_ADDFD, &addfd), 42);
+
+	EXPECT_EQ(waitpid(pid, &status, 0), pid);
+	EXPECT_EQ(true, WIFEXITED(status));
+	EXPECT_EQ(0, WEXITSTATUS(status));
+
+	close(listener);
+	close(memfd);
+}
+
 #ifndef SECCOMP_USER_NOTIF_FD_SYNC_WAKE_UP
 #define SECCOMP_USER_NOTIF_FD_SYNC_WAKE_UP (1UL << 0)
 #define SECCOMP_IOCTL_NOTIF_SET_FLAGS  SECCOMP_IOW(4, __u64)
-- 
2.49.0
