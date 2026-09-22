Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 497A039CD12
	for <linux-kselftest@vger.kernel.org>; Tue, 22 Sep 2026 02:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790044330; cv=none; b=CCJZPWKsc5afS6ZFJgmzSj0L6ZYy3UicRMyT7HwIrTJa4qyFR7RIeTrhgKOHVZjWn8NIosUBu31rZ9AwfGCS9rLHmjzRnVd9tCq5CDFIRvAphjDf2BdoMkLDaekAoOs9nte3FDmcQw8a2hl+nV7daYii6oflQm4t/f9f9OeIGVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790044330; c=relaxed/simple;
	bh=OWrmlEyHyg7cYKICRi9qQd8KLeurdcnjIE3fpyU+tBw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HWOhjOQv+JEbA7orJhdIUzsh15oXKdt9WonKhxHp1hxCu9MLcY1fosVmINTFXIQytJlZRlg6XgU74s2GwLLH2CCuMx4wcEbzcCa/vSxHR5UhCG2oOBGWQnlTATZbnxDay/cMzFibnDHxllDnWGU1bJDStiI0COHEJF3lsyZFMBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LV4Od/BD; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LV4Od/BD"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc4d04d740cso2188838a12.0
        for <linux-kselftest@vger.kernel.org>; Mon, 21 Sep 2026 19:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790044326; x=1790649126; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4mFagjV1SEq8DGpthdMn6xHW8xleMxzMDlgFzTrE6fc=;
        b=LV4Od/BDzUoepFUMNBt085ZRwbw7pJjHyQ1iahJAwdMY0UrFoabckigEwMJuaotToV
         Fx1cyiOJeo/GLViQPjpr016MsIeFRU1M+Nje8+KZGLKaWj8nhp8pVuH7yYzLNBvLat7P
         Bgvt43ETMKH68H2UNa029p7uNMbhfeyGHNIouuB4Oex2uNCj0pAcKGASJLTdIBY/hYI3
         CuOD66LhweOoNcHdyLlNagX0ylSTck7YStHFBiBp3OhlRxa5yEVnFcsSewzxZDxmAR3B
         nQ/MwVJ5Q++5UktJ+kaKcgn15pYGJ1/b+uEO3N1s6rcQwkdjmLtO+PTBx9HTRAkvoZOm
         Drkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790044326; x=1790649126;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4mFagjV1SEq8DGpthdMn6xHW8xleMxzMDlgFzTrE6fc=;
        b=oyVETsJ0nJPPoSUKkHzmCYhgZ3FhkZz8XH6GflWFsdIZcvb8vI0g6Zk801Tn6JHIq3
         7EHybyGILo0E4FfcJdw0COLnm/ZqjcUIWhdEt+XPBEUysHFT6AlxazSblmK2iBDq5i5Y
         bihZZ+YZywIeKQDxMvT1aSZNdL/KeC5oWDOp9DJ7omsUE3y3HFlrjFNl0+Y1Pa3c35Eg
         sMo5DNLAo8HLyYRzITR+d2AXV6s8Pb8N5xjzZF10r7ToLiH+S9vzE4qc2QKGBBeZ/UK2
         1DacNemIGBvTVjfov6727Bgjit792Mt2wR/eW9zCkb5xP2hnUe8Zbrjppk4RYtC6emM3
         59mA==
X-Forwarded-Encrypted: i=1; AKwUvBy0D7DGdgXQue4GxN1HiK72O/r8pBG4vHGSJ3Af4kRdymchV0A6WyUOyni9O8EiMfXUCFhR6QbiPGaJfPmbgEQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mGts5d5TLW5GrhoRkTSM/lUMFfHzujpLdP32uzIQVwUzDfNZt/
	egJYbnM8rzuT33lW+0rhaqTcoJ2RcO8z02l7g2Dq+RYk/ana/3kAs8TY
X-Gm-Gg: AYBFou392o8PRNluFPSVZ01k8b/f+PtrQ/69n3gnrrkHRb4tLGZnmjcpNp23Tch/1IR
	f7ugLMF2qkP6GimDhf+VlBaJyRxdT88kH2OTALLjsonwYEOBtK+WmU6uNPJRgj5kDCoaUTifCoj
	CGdyca7BJqBCZROzZ/2Fz79UOlWWs72BAywbeCSHrtCgFMTENCik9i5vdJxCW5VL3B4sLnm9tdT
	YJ3X0jH8I5qJQOJbL09xb+OlEM9yyAr9y+tn7lMLQhAnwdW/W80bPwLS08KpgBHel/vgQvhxCi3
	2eWYwtpWmsHeTIkvzN0n+2A+pBFlcTYYORrZrqGl5ETAMaXHqcBYRM1nW9cJT0LQw5abIodZWe1
	zj/uIyInzJT+p5NLvTBRyxm8dZblsZM0DF9/6uv1UKYwES6D11kdgeBia0+9SyRG7cU89WRmPjU
	KWdfYLaPjreF8q/RYoyBtHYF0Q75W9mr5ShT7562YGxzIQyeyNpg8oQOa/0NPosdoWJxa8qwaqI
	z6JpQDwao8ftdB3Cm3o3t/jCvTMQiALk7n7CS0pbQchQWndJ3BkjcWE4rOHJcT4s3R2Hkhk89wY
	n0XDcYFMjg==
X-Received: by 2002:a17:90b:2d44:b0:39d:8794:5564 with SMTP id 98e67ed59e1d1-39e54ce36fdmr19680388a91.12.1790044326199;
        Mon, 21 Sep 2026 19:32:06 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a06e5a5eb4sm501764a91.14.2026.09.21.19.32.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 19:32:05 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: Kees Cook <kees@kernel.org>
Cc: Andy Lutomirski <luto@amacapital.net>,
	Will Drewry <wad@chromium.org>,
	Shuah Khan <shuah@kernel.org>,
	Bradley Morgan <brads@mainlining.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	stable@vger.kernel.org,
	Hui Peng <benquike@gmail.com>
Subject: [PATCH v5] seccomp: restore knotif->state when SECCOMP_ADDFD_FLAG_SEND is interrupted
Date: Tue, 22 Sep 2026 02:32:04 +0000
Message-ID: <20260922023204.2504832-1-benquike@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
In-Reply-To: <202609210158.F3D96F157@keescook>
References: <202609210158.F3D96F157@keescook>
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

Tested in QEMU against Linux 7.3.0-rc3 using the
user_notification_addfd_send_interrupted selftest added in this patch
(./seccomp_bpf -t user_notification_addfd_send_interrupted): on the
unfixed kernel the test fails because the retry ioctl(listener,
SECCOMP_IOCTL_NOTIF_ADDFD, &addfd) returns -EINPROGRESS (-1) and the
tracee prematurely exits do_user_notif() with return value 0 instead of
FD 42, whereas with this patch applied the test passes.

Fixes: 0ae71c7720e3 ("seccomp: Support atomic "addfd + send reply"")
Cc: stable@vger.kernel.org
Reviewed-by: Bradley Morgan <brads@mainlining.org>
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
Changes in v5:
- Check the return values of all sched_setscheduler() calls in
  user_notification_addfd_send_interrupted, as requested by Kees Cook.
- Restore SCHED_OTHER on the supervisor and tracee immediately after
  ioctl(SECCOMP_IOCTL_NOTIF_ADDFD) returns (and on fork() failure) so
  the test cannot remain SCHED_FIFO on a single-CPU VM/CI runner, as
  suggested by Kees Cook.
- Rename pid and struct sched_param variables (tracee_pid, sp_zero,
  sp_fifo_high, sp_fifo_mid) for clarity.

Changes in v4:
- Restore Reviewed-by: Bradley Morgan <brads@mainlining.org> and Cc:
  stable@vger.kernel.org tags from v1 (and restore Bradley Morgan to Cc),
  and add Assisted-by: LLM tag.
- Fix Fixes: tag SHA and subject (0ae71c7720e3 ("seccomp: Support atomic
  "addfd + send reply"")).
- Fix truncated word "interrupted" in the Subject line.

Changes in v3:
- Actually include the tools/testing/selftests/seccomp/seccomp_bpf.c
  regression test in the patch diff (v2 accidentally omitted the selftest
  hunk), with detailed comments explaining the race and test setup.

Changes in v2:
- Add user_notification_addfd_send_interrupted regression test to
  tools/testing/selftests/seccomp/seccomp_bpf.c as requested by Kees Cook.

 kernel/seccomp.c                              |   5 +-
 tools/testing/selftests/seccomp/seccomp_bpf.c | 184 ++++++++++++++++++
 2 files changed, 187 insertions(+), 2 deletions(-)

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
index 0622bc2acad4..8cafac59ec7b 100644
--- a/tools/testing/selftests/seccomp/seccomp_bpf.c
+++ b/tools/testing/selftests/seccomp/seccomp_bpf.c
@@ -4368,6 +4368,184 @@ TEST(user_notification_addfd_rlimit)
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
+	pid_t tracee_pid, sig_pid, parent_pid = getpid();
+	long ret;
+	int status, listener, memfd, err;
+	struct seccomp_notif_addfd addfd = {};
+	struct seccomp_notif req = {};
+	struct sigaction sa = {};
+	struct sched_param sp_zero = { .sched_priority = 0 };
+	struct sched_param sp_fifo_high = { .sched_priority = 99 };
+	struct sched_param sp_fifo_mid = { .sched_priority = 50 };
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
+	tracee_pid = fork();
+	ASSERT_GE(tracee_pid, 0);
+
+	if (tracee_pid == 0) {
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
+	ASSERT_EQ(sched_setscheduler(tracee_pid, SCHED_IDLE, &sp_zero), 0);
+	if (sched_setscheduler(0, SCHED_FIFO, &sp_fifo_high) != 0) {
+		kill(tracee_pid, SIGKILL);
+		waitpid(tracee_pid, NULL, 0);
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
+	if (sig_pid < 0) {
+		sched_setscheduler(0, SCHED_OTHER, &sp_zero);
+		kill(tracee_pid, SIGKILL);
+		waitpid(tracee_pid, NULL, 0);
+	}
+	ASSERT_GE(sig_pid, 0);
+	if (sig_pid == 0) {
+		if (sched_setscheduler(0, SCHED_FIFO, &sp_fifo_mid) != 0)
+			_exit(1);
+		kill(parent_pid, SIGUSR1);
+		_exit(0);
+	}
+
+	ret = ioctl(listener, SECCOMP_IOCTL_NOTIF_ADDFD, &addfd);
+	err = errno;
+
+	/*
+	 * Restore normal scheduling ASAP so the supervisor does not remain
+	 * SCHED_FIFO on a single-CPU machine/VM/CI, then sleep briefly so the
+	 * woken tracee runs in do_user_notif(). With knotif->state restored to
+	 * SECCOMP_NOTIFY_SENT, the tracee must loop back to sleep waiting for
+	 * the notification reply rather than returning 0 from __NR_getppid.
+	 */
+	ASSERT_EQ(sched_setscheduler(0, SCHED_OTHER, &sp_zero), 0);
+	ASSERT_EQ(sched_setscheduler(tracee_pid, SCHED_OTHER, &sp_zero), 0);
+
+	EXPECT_EQ(ret, -1);
+	EXPECT_EQ(err, EINTR);
+	EXPECT_EQ(waitpid(sig_pid, &status, 0), sig_pid);
+	EXPECT_EQ(true, WIFEXITED(status));
+	EXPECT_EQ(0, WEXITSTATUS(status));
+
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
+	EXPECT_EQ(waitpid(tracee_pid, &status, 0), tracee_pid);
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
