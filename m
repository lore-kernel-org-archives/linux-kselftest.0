Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 540F1347BA9;
	Sun, 20 Sep 2026 11:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789905392; cv=none; b=R/jTKts9lxieRF7qbH7uUjhmtlKhAP8Gug1NkqwFeAII+8+H7dBzHUR0M+HEjLhI9YXo728+H9nftB3MEGF/FgZWXrwDxWKEy+psaGlfmaelhXJt4C3KBriEe4nZppVdvGD6pnY4uj/2EQeDOWFlNbgF/iAO+5vJU4DVvguiF6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789905392; c=relaxed/simple;
	bh=ZIPYjqYciGVphhbYnTgn5E+0Kyitjs4W/8Qb8mOv2gA=;
	h=Date:From:To:CC:Subject:In-Reply-To:Message-ID:MIME-Version:
	 Content-Type; b=jkC9yLn36+lcnmL7u42F7wNNSva139jrjXymPc0V94XzLHpJ9hYkQu1lc3P0bOX9bZQiTLwskmLUo49mb0hxNXL2qfItq6NcvTE/PszIkgnxV+qJ7sn3CiAUnQGe29z4nUTwFrNELy2PGcFn9MpsoZ6IlWCgLyACDA/NlIijJY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=owqherd3; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=zByV/oKc; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="owqherd3";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="zByV/oKc"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1789905387; bh=YUmmqfrOHURhxdHBd/AfXiT
	B6Cxf0E05PkLPnMSDFIY=; b=owqherd3hZQtNypTLYbSCkNC16Zl5rZxu5Mv+P7OAAuXo+UvGn
	KnsoqPtf+NGmSW52LwLR8wD/lw7uT8hDLy8uVlrbPOL0+955Rv4Otfc8CfOcaVtqBWm/G74GI1x
	Ws8qYylE7o6IAInd9tfc+A/ZtOo1HY0ZPsubPUHSKQkPgl9t06EwMflRyUCSUjpNaJj8Fbuib4e
	Wy1xbzl5F9RztB/vBjjgd/TZ8NQaKqF55qrkJKBz1VHKHCn33l33p0VPnW7DCwXlZPfDFUOxJsT
	dW1+sOzntCj27XUWBb53yD13QyHQ+T4LulVEWmh56m0daP1som0ToLMcuHzLt8CshTw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1789905387; bh=YUmmqfrOHURhxdHBd/AfXiT
	B6Cxf0E05PkLPnMSDFIY=; b=zByV/oKcQpZABHhCNjtvcz1t3vt4yecgRe3aTnfhgbHrzB4Scd
	f+H8YjHT4/mkzy5XtFm80rz5gqZV6uEydaAw==;
Date: Sun, 20 Sep 2026 12:56:27 +0100
From: Bradley Morgan <brads@mainlining.org>
To: benquike@gmail.com
CC: kees@kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, luto@amacapital.net, shuah@kernel.org,
 wad@chromium.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v3=5D_seccomp=3A_restore_knotif-=3Estat?=
 =?US-ASCII?Q?e_when_SECCOMP=5FADDFD=5FFLAG=5FSEND_is_interrupted?=
In-Reply-To: <20260920072036.3888061-1-benquike@gmail.com>
Message-ID: <A3F8F45D-3B9B-4E52-B076-7924FF3AF360@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On 20 September 2026 08:20:36 BST, Hui Peng <benquike@gmail.com> wrote:
>In seccomp_notify_addfd(), when SECCOMP_ADDFD_FLAG_SEND is set in
>addfd.flags, knotif->state is optimistically transitioned from
>SECCOMP_NOTIFY_SENT to SECCOMP_NOTIFY_REPLIED before waking the tracee
>and waiting on kaddfd.completion:
>
>	if (addfd.flags & SECCOMP_ADDFD_FLAG_SEND) {
>		knotif->state = SECCOMP_NOTIFY_REPLIED;
>		...
>	}
>
>If wait_for_completion_interruptible(&kaddfd.completion) is interrupted
>by a signal before the tracee dequeues the kaddfd request
>(!list_empty(&kaddfd.list)), seccomp_notify_addfd() removes kaddfd from
>knotif->addfd and returns -EINTR to the supervisor without having
>installed the file descriptor.
>
>However, knotif->state is left as SECCOMP_NOTIFY_REPLIED (with
>knotif->error == 0 and knotif->val == 0). This causes two problems:
>
>1. When the tracee runs in do_user_notif(), it checks
>   if (knotif.state != SECCOMP_NOTIFY_REPLIED) after calling
>   seccomp_handle_addfd(). Because knotif->state is already
>   SECCOMP_NOTIFY_REPLIED, the tracee exits the notification wait loop
>   prematurely and returns 0 from the trapped syscall without the file
>   descriptor ever having been installed.
>
>2. If the supervisor retries SECCOMP_IOCTL_NOTIF_ADDFD or
>   SECCOMP_IOCTL_NOTIF_SEND before the tracee runs, it fails with
>   -EINPROGRESS because knotif->state is no longer SECCOMP_NOTIFY_SENT.
>
>Fix this by restoring knotif->state back to SECCOMP_NOTIFY_SENT if
>SECCOMP_ADDFD_FLAG_SEND was set and kaddfd was not consumed before the
>interrupted wait. Also add a seccomp_bpf selftest
>(user_notification_addfd_send_interrupted) covering this race.
>
>Fixes: 0ae71c1990f3 ("seccomp: Add a flag to atomically addfd and perform send")

Oh my godd you

1: removed me from CC
2: removed my R-B tag!

What is your AI doing!

NAK. I can't review something like this!

Add a assisted by tag and CC me and I'll look at it


>Signed-off-by: Hui Peng <benquike@gmail.com>
>---
>Changes in v3:
>- Actually include the tools/testing/selftests/seccomp/seccomp_bpf.c
>  regression test in the patch diff (v2 accidentally omitted the selftest
>  hunk), with detailed comments explaining the race and test setup.
>
>Changes in v2:
>- Add user_notification_addfd_send_interrupted regression test to
>  tools/testing/selftests/seccomp/seccomp_bpf.c as requested by Kees Cook.
>
> kernel/seccomp.c                              |   2 +
> tools/testing/selftests/seccomp/seccomp_bpf.c | 161 ++++++++++++++++++
> 2 files changed, 163 insertions(+)
>
>diff --git a/kernel/seccomp.c b/kernel/seccomp.c
>index 86cf4460d69e..94c7ba80a8f7 100644
>--- a/kernel/seccomp.c
>+++ b/kernel/seccomp.c
>@@ -1808,10 +1808,13 @@ static long seccomp_notify_addfd(struct seccomp_filter *filter,
> 	 * We need to check again if the addfd request has been handled,
> 	 * and if not, we will remove it from the queue.
> 	 */
>-	if (list_empty(&kaddfd.list))
>+	if (list_empty(&kaddfd.list)) {
> 		ret = kaddfd.ret;
>-	else
>+	} else {
> 		list_del(&kaddfd.list);
>+		if (addfd.flags & SECCOMP_ADDFD_FLAG_SEND)
>+			knotif->state = SECCOMP_NOTIFY_SENT;
>+	}
> 
> out_unlock:
> 	mutex_unlock(&filter->notify_lock);
>diff --git a/tools/testing/selftests/seccomp/seccomp_bpf.c b/tools/testing/selftests/seccomp/seccomp_bpf.c
>index 0622bc2acad4..e565728f9eb2 100644
>--- a/tools/testing/selftests/seccomp/seccomp_bpf.c
>+++ b/tools/testing/selftests/seccomp/seccomp_bpf.c
>@@ -4368,6 +4368,173 @@ TEST(user_notification_addfd_rlimit)
> 	close(memfd);
> }
> 
>+static void sigusr1_handler(int signo)
>+{
>+}
>+
>+/*
>+ * Verify that when SECCOMP_IOCTL_NOTIF_ADDFD with SECCOMP_ADDFD_FLAG_SEND is
>+ * interrupted by a signal before the tracee dequeues the addfd request,
>+ * knotif->state is restored from SECCOMP_NOTIFY_REPLIED back to
>+ * SECCOMP_NOTIFY_SENT so that:
>+ *   1. The woken tracee sees knotif->state == SECCOMP_NOTIFY_SENT in
>+ *      do_user_notif() and goes back to sleep instead of prematurely
>+ *      returning 0 from the trapped syscall without the FD installed.
>+ *   2. The supervisor can retry SECCOMP_IOCTL_NOTIF_ADDFD (or
>+ *      SECCOMP_IOCTL_NOTIF_SEND) instead of failing with -EINPROGRESS.
>+ *
>+ * To deterministically hit the race window where the supervisor sleeps in
>+ * wait_for_completion_interruptible(&kaddfd.completion) after waking the
>+ * tracee (complete(&knotif->ready)) but before the tracee runs
>+ * seccomp_handle_addfd(), pin all processes to a single CPU and enforce a
>+ * strict 3-tier scheduling priority hierarchy on that CPU:
>+ *   - Supervisor:            SCHED_FIFO priority 99 (highest)
>+ *   - Signal helper (sig_pid): SCHED_FIFO priority 50 (middle)
>+ *   - Tracee (pid):          SCHED_IDLE             (lowest)
>+ */
>+TEST(user_notification_addfd_send_interrupted)
>+{
>+	/*
>+	 * Save parent_pid before user_notif_syscall(__NR_getppid, ...) installs
>+	 * the seccomp filter on the calling process; children inherit that
>+	 * filter, so sig_pid must not call getppid().
>+	 */
>+	pid_t pid, sig_pid, parent_pid = getpid();
>+	long ret;
>+	int status, listener, memfd;
>+	struct seccomp_notif_addfd addfd = {};
>+	struct seccomp_notif req = {};
>+	struct sigaction sa = {};
>+	struct sched_param sp_tracee_idle = { .sched_priority = 0 };
>+	struct sched_param sp_supervisor_fifo = { .sched_priority = 99 };
>+	struct sched_param sp_sig_helper_fifo = { .sched_priority = 50 };
>+	struct timespec delay = { .tv_nsec = 15000000 };
>+	cpu_set_t cpuset;
>+	int cpu;
>+
>+	/* Pin the supervisor (and its future child processes) to one CPU. */
>+	cpu = sched_getcpu();
>+	if (cpu >= 0) {
>+		CPU_ZERO(&cpuset);
>+		CPU_SET(cpu, &cpuset);
>+		sched_setaffinity(0, sizeof(cpuset), &cpuset);
>+	}
>+
>+	sa.sa_handler = sigusr1_handler;
>+	ASSERT_EQ(sigaction(SIGUSR1, &sa, NULL), 0);
>+
>+	memfd = memfd_create("test", 0);
>+	ASSERT_GE(memfd, 0);
>+
>+	ret = prctl(PR_SET_NO_NEW_PRIVS, 1, 0, 0, 0);
>+	ASSERT_EQ(0, ret) {
>+		TH_LOG("Kernel does not support PR_SET_NO_NEW_PRIVS!");
>+	}
>+
>+	/*
>+	 * Follow the convention of other user_notification_* tests in this
>+	 * file by trapping __NR_getppid: because the filter is installed on
>+	 * the supervisor before fork(), the trapped syscall must be a
>+	 * side-effect-free syscall that the supervisor itself never invokes.
>+	 * Even though getppid() does not normally return an FD,
>+	 * SECCOMP_ADDFD_FLAG_SEND replaces the trapped syscall's return value
>+	 * with the newly installed FD number (42).
>+	 */
>+	listener = user_notif_syscall(__NR_getppid,
>+				      SECCOMP_FILTER_FLAG_NEW_LISTENER);
>+	ASSERT_GE(listener, 0);
>+
>+	pid = fork();
>+	ASSERT_GE(pid, 0);
>+
>+	if (pid == 0) {
>+		/*
>+		 * Tracee: invoke __NR_getppid as a dummy trigger syscall to
>+		 * trap into do_user_notif(). Verify that the syscall returns
>+		 * the injected FD number (42) and that FD 42 is open.
>+		 */
>+		ret = syscall(__NR_getppid);
>+		exit(ret != 42 || fcntl(42, F_GETFD) < 0);
>+	}
>+
>+	/* Wait for the tracee to trap in do_user_notif(). */
>+	ASSERT_EQ(ioctl(listener, SECCOMP_IOCTL_NOTIF_RECV, &req), 0);
>+
>+	/*
>+	 * Demote the tracee to SCHED_IDLE and promote the supervisor to
>+	 * SCHED_FIFO(99) on the same CPU.
>+	 */
>+	sched_setscheduler(pid, SCHED_IDLE, &sp_tracee_idle);
>+	if (sched_setscheduler(0, SCHED_FIFO, &sp_supervisor_fifo) != 0) {
>+		close(listener);
>+		close(memfd);
>+		kill(pid, SIGKILL);
>+		waitpid(pid, NULL, 0);
>+		SKIP(return, "SCHED_FIFO requires CAP_SYS_NICE");
>+	}
>+
>+	addfd.srcfd = memfd;
>+	addfd.newfd_flags = O_CLOEXEC;
>+	addfd.newfd = 42;
>+	addfd.id = req.id;
>+	addfd.flags = SECCOMP_ADDFD_FLAG_SETFD | SECCOMP_ADDFD_FLAG_SEND;
>+
>+	/*
>+	 * Fork a signal helper on the same CPU and set it to SCHED_FIFO(50).
>+	 * Because the supervisor is currently running at SCHED_FIFO(99) on
>+	 * this CPU, sig_pid is queued on the runqueue but cannot run until the
>+	 * supervisor blocks inside the kernel.
>+	 *
>+	 * When the supervisor invokes ioctl(SECCOMP_IOCTL_NOTIF_ADDFD) below:
>+	 *   1. seccomp_notify_addfd() sets knotif->state = SECCOMP_NOTIFY_REPLIED,
>+	 *      wakes the tracee (SCHED_IDLE), and blocks in
>+	 *      wait_for_completion_interruptible(&kaddfd.completion).
>+	 *   2. The CPU scheduler immediately runs sig_pid (SCHED_FIFO 50)
>+	 *      ahead of the woken tracee (SCHED_IDLE).
>+	 *   3. sig_pid sends SIGUSR1 to parent_pid, waking the supervisor
>+	 *      (SCHED_FIFO 99), which immediately preempts sig_pid, aborts the
>+	 *      wait with -ERESTARTSYS (-EINTR), removes kaddfd from
>+	 *      knotif->addfd, and restores knotif->state = SECCOMP_NOTIFY_SENT
>+	 *      before the tracee has executed a single instruction.
>+	 */
>+	sig_pid = fork();
>+	ASSERT_GE(sig_pid, 0);
>+	if (sig_pid == 0) {
>+		sched_setscheduler(0, SCHED_FIFO, &sp_sig_helper_fifo);
>+		kill(parent_pid, SIGUSR1);
>+		_exit(0);
>+	}
>+
>+	EXPECT_EQ(ioctl(listener, SECCOMP_IOCTL_NOTIF_ADDFD, &addfd), -1);
>+	EXPECT_EQ(errno, EINTR);
>+	EXPECT_EQ(waitpid(sig_pid, &status, 0), sig_pid);
>+
>+	/*
>+	 * Restore normal scheduling and sleep briefly so the woken tracee
>+	 * runs in do_user_notif(). With knotif->state restored to
>+	 * SECCOMP_NOTIFY_SENT, the tracee must loop back to sleep waiting for
>+	 * the notification reply rather than returning 0 from __NR_getppid.
>+	 */
>+	sched_setscheduler(0, SCHED_OTHER, &sp_tracee_idle);
>+	sched_setscheduler(pid, SCHED_OTHER, &sp_tracee_idle);
>+	nanosleep(&delay, NULL);
>+
>+	/*
>+	 * Retry SECCOMP_IOCTL_NOTIF_ADDFD. Because knotif->state is
>+	 * SECCOMP_NOTIFY_SENT, the retry succeeds (returns 42) instead of
>+	 * failing with -EINPROGRESS, installs FD 42 into the tracee, and wakes
>+	 * the tracee to complete the syscall with return value 42.
>+	 */
>+	EXPECT_EQ(ioctl(listener, SECCOMP_IOCTL_NOTIF_ADDFD, &addfd), 42);
>+
>+	EXPECT_EQ(waitpid(pid, &status, 0), pid);
>+	EXPECT_EQ(true, WIFEXITED(status));
>+	EXPECT_EQ(0, WEXITSTATUS(status));
>+
>+	close(listener);
>+	close(memfd);
>+}
>+
> #ifndef SECCOMP_USER_NOTIF_FD_SYNC_WAKE_UP
> #define SECCOMP_USER_NOTIF_FD_SYNC_WAKE_UP (1UL << 0)
> #define SECCOMP_IOCTL_NOTIF_SET_FLAGS  SECCOMP_IOW(4, __u64)
>

--- Thanks!
"I'm not a very positive person" - Linus torvalds
