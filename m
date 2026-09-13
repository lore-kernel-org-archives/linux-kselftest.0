Received: from mail-yx2-f3.google.com (mail-yx2-f3.google.com [74.125.224.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E0403612E2
	for <linux-kselftest@vger.kernel.org>; Sun, 13 Sep 2026 03:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789271460; cv=none; b=DWgzanMIF4Cayo2bYjJg3HxKUYkAvKrSZWleMabCX1MAr8nEUqaImPMN31nvmucBFxRcEPVWdgGiQGa79bIiXj7gZAFnzbzeVmhp/JIYdoVvs4cB2fwloA6d5opz2wl1MDbbsKsGYu/4RRRMPhb6v/8b9QOwZ6Gg0H9KbKgK6Tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789271460; c=relaxed/simple;
	bh=z987aQm7fysSc5bXENvhUfqefX9b+19naI/tCG0VCNY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N67ArOcqPxrBWIUjq45LUxpjBfUVEXGLe8MKkPK6U+CVePG65BqHhFtMlnz/uzlNOoAGnhjBuMm11U5+2/X5HrtRzruIJSd5m4MIOq/HmTGrioy/CukIk1sX3k33sois5/5zkN04b+JhHGi/B2S1A7nJIVG30tBLUrcVt1TT5I0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=northecho.dev; spf=none smtp.mailfrom=northecho.dev; dkim=pass (2048-bit key) header.d=northecho-dev.20251104.gappssmtp.com header.i=@northecho-dev.20251104.gappssmtp.com header.b=nwINJ8OW; arc=none smtp.client-ip=74.125.224.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=northecho.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=northecho.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=northecho-dev.20251104.gappssmtp.com header.i=@northecho-dev.20251104.gappssmtp.com header.b="nwINJ8OW"
Received: by mail-yx2-f3.google.com with SMTP id 956f58d0204a3-671180edc60so40872d50.0
        for <linux-kselftest@vger.kernel.org>; Sat, 12 Sep 2026 20:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=northecho-dev.20251104.gappssmtp.com; s=20251104; t=1789271458; x=1789876258; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PhlZj/NPra6jX+8oLOX1GbEtFNOW9cOUMkEt6kcqKus=;
        b=nwINJ8OW50SFuhhdgE9vTFAYiYciDGGCjbhmWpZiKLYZ7LSdfGq/zXfLq/xHgpJL4/
         2+5noEI7VIn4DUNvTw0bIFEvUMcVBeBWjTofFh0b7BZGmZSjQIC9gRqd0h1pDv20KjwE
         A3tizourzLGCOSsSDo0i9B+BZ+n0gqn+UEQ5EZjuUqqO9pijwZfXyCLxVJC79hHYmVWf
         O3cIBN6TuPiyLefVfT8AUE81OQkligZIr4ps9+Eo41Uu7fcA019VafMf5xFQHYkaHwTH
         d5P3VTEihAxOMPlkypJ9R3Yxf6bFNZklltKfK7Bl9XFyAsms/n09uwJF0F7AEov4yQwR
         ISqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789271458; x=1789876258;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PhlZj/NPra6jX+8oLOX1GbEtFNOW9cOUMkEt6kcqKus=;
        b=IiF/LtRtYN5pciZCBw5VEYKyLRBMOqhSa1JszVI3Pc1shDao4PxFn7GIF0ahtE39Pf
         o1nIexk3jT2ejIIFKZzdfT1TTeswlTBpP6119pvRxkX0uHdEVYyHRZgqpCuNvxDS0iOX
         yJ27WUI1xxZocdHLfNBrJg92q3ega6s2ZBo8yEZsaTjOV93fsi0U6Imva+Iw+cNv6Qzv
         KPD9TD0tmDmmu5pWpctAtZMh0Z/0qyXWtprRuQXS/8Gn4B29b7BJjPpi/5G42axG8PRm
         XVYi/SEjW1nymwW5dsNgon8o9CjyPkp2nt2jW11vP5RY58cd5S9vitgyACE59tFlwm9S
         Ekew==
X-Forwarded-Encrypted: i=1; AKwUvBwPlQJy6tcN67uHiKArFTkwAtPf/PgR1Y0d7FZbLAMD8LtXf4s5KfdEIiTSnh2hXzGwmemHw6TsQaicfxiHXJk=@vger.kernel.org
X-Gm-Message-State: AFuF++lW9zhQ3BiCSZIJQqYTe440qCqNp7+pyaTALaysuxt89gprzODA
	3SvY97nhrGg+uawcpckYt+sDTzNiXsBTaavRrXqMOaCXLefShKoGymH42fLYf9f+gltV
X-Gm-Gg: AYBFou3oIO8qIktv7pVHaolHDFqo0amzXs9k3z1A2kJabPHvW5veA2X9Cydn7OkYlSO
	qxua2K2DgWTUMacOI6Hy8oXhJg9RGDcuaLTUketrsFLyzXEGJ1L1nw905BRacoQs/CYDiFHvyQ4
	LQXyoGsCBelLUPjsA12/NL/uOvjnZgPyzHNfmsrzuZditxs+CNRvLdmra/k0KNTckXXupQhzhWB
	Jq59Nt35dF5II/rcB9Cx6iciQHqmumgD9mPf6w86q3yAGF2O5eoY9J68R5WGImaaF5uOvAr28Qc
	vq0ASXqCCsD8QEQ9QsNvqhRpUAXu0505CAOvUZB8DeBFXgha7oytLk2yM/XTqR91xx4qyJAcIXd
	dlRqkOTnTB1Wr6XMT6XocH/VHyZMuxhWwx01R8MntdZRKE0bKexVWVhEhRDUA51pw5F9Yjwh2Ok
	z4JtTbfhk31FNMidz6sBUjXUvEInHcKULBbN4le0lAJ1tVXnJEiskzqk5On2D6eF7NU08Jtcq6/
	C+GO92wl85CQXWRkb2kD2sRlYBX8FlT/PtVMr9/
X-Received: by 2002:a05:690c:16:b0:870:48aa:473e with SMTP id 00721157ae682-884abebe372mr44040107b3.0.1789271457776;
        Sat, 12 Sep 2026 20:50:57 -0700 (PDT)
Received: from kelso (99-10-92-174.lightspeed.rlghnc.sbcglobal.net. [99.10.92.174])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67125b8bf08sm2884330d50.2.2026.09.12.20.50.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 20:50:56 -0700 (PDT)
From: Christopher Lusk <clusk@northecho.dev>
To: kees@kernel.org,
	shuah@kernel.org
Cc: luto@kernel.org,
	wad@chromium.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ruanjinjie@huawei.com,
	tglx@kernel.org
Subject: [PATCH] selftests/seccomp: add regression test for TSYNC during ptrace-stop
Date: Sat, 12 Sep 2026 23:50:29 -0400
Message-ID: <20260913035029.545181-1-clusk@northecho.dev>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 4a3591287fb7 ("entry: Fix seccomp bypass after ptrace with TSYNC")
fixed a bypass in the generic syscall entry path. While a thread is
stopped at the syscall-entry ptrace stop, another thread can install a
seccomp filter with SECCOMP_FILTER_FLAG_TSYNC, which sets
SYSCALL_WORK_SECCOMP on the stopped thread. syscall_trace_enter() sampled
the work flags once on entry, so the later seccomp check read a stale mask
and skipped the newly synchronized filter, silently letting the syscall
through. The fix rereads the work flags after ptrace handling. That fix
shipped without a regression test.

Add one to seccomp_bpf. A tracer holds a target thread at its
syscall-entry stop for getppid(2); a sibling thread then installs a TSYNC
filter that returns SECCOMP_RET_ERRNO for getppid; the target is resumed.
The test asserts that the raw getppid() returns -1 with the filter's
errno, that is, the filter installed during the stop is enforced on the
resumed syscall. ptrace holds the target at the exact stop, so the
ordering is deterministic rather than racy. A dedicated test is used
because neither the existing TSYNC nor TRACE fixture represents the
tracer plus stopped target plus live TSYNC worker ordering.

The test was written with the assistance of Claude (claude-opus-4-8) and
Codex (gpt-5.6-sol), which drafted the orchestration and the test body;
the result was reviewed by hand. It was validated by running it against a
kernel with that commit reverted, where it fails (getppid returns the
real parent PID with no errno), and against the fixed kernel, where it
passes. The full seccomp_bpf suite passes on the fixed kernel (107 pass,
5 skip, 0 fail) and builds cleanly with W=1.

Assisted-by: Claude:claude-opus-4-8
Assisted-by: Codex:gpt-5.6-sol
Signed-off-by: Christopher Lusk <clusk@northecho.dev>
---
 tools/testing/selftests/seccomp/seccomp_bpf.c | 238 ++++++++++++++++++
 1 file changed, 238 insertions(+)

diff --git a/tools/testing/selftests/seccomp/seccomp_bpf.c b/tools/testing/selftests/seccomp/seccomp_bpf.c
index 0622bc2acad4..56e08390c944 100644
--- a/tools/testing/selftests/seccomp/seccomp_bpf.c
+++ b/tools/testing/selftests/seccomp/seccomp_bpf.c
@@ -3022,6 +3022,244 @@ TEST_F(TSYNC, two_siblings_not_under_filter)
 	ASSERT_EQ(0, ret);  /* just us chickens */
 }
 
+#define TSYNC_PTRACE_ERRNO E2BIG
+
+struct tsync_ptrace_worker {
+	int ready_fd;
+	int trigger_fd;
+	int result_fd;
+	struct sock_fprog *prog;
+};
+
+struct tsync_ptrace_result {
+	long ret;
+	int err;
+};
+
+static ssize_t read_nointr(int fd, void *buf, size_t count)
+{
+	ssize_t ret;
+
+	do {
+		ret = read(fd, buf, count);
+	} while (ret < 0 && errno == EINTR);
+
+	return ret;
+}
+
+static ssize_t write_nointr(int fd, const void *buf, size_t count)
+{
+	ssize_t ret;
+
+	do {
+		ret = write(fd, buf, count);
+	} while (ret < 0 && errno == EINTR);
+
+	return ret;
+}
+
+static void *tsync_ptrace_worker(void *data)
+{
+	struct tsync_ptrace_worker *worker = data;
+	struct tsync_ptrace_result result = {
+		.ret = -1,
+		.err = 0,
+	};
+	char byte = '.';
+
+	if (write_nointr(worker->ready_fd, &byte, sizeof(byte)) != sizeof(byte))
+		return NULL;
+	if (read_nointr(worker->trigger_fd, &byte, sizeof(byte)) != sizeof(byte))
+		return NULL;
+
+	if (prctl(PR_SET_NO_NEW_PRIVS, 1, 0, 0, 0)) {
+		result.err = errno;
+	} else {
+		errno = 0;
+		result.ret = seccomp(SECCOMP_SET_MODE_FILTER,
+				     SECCOMP_FILTER_FLAG_TSYNC, worker->prog);
+		result.err = errno;
+	}
+
+	write_nointr(worker->result_fd, &result, sizeof(result));
+	return NULL;
+}
+
+/*
+ * Regression test for 4a3591287fb7 ("entry: Fix seccomp bypass after
+ * ptrace with TSYNC").  The ptrace stop is after syscall work flags were
+ * sampled, so a filter synchronized here must be observed before dispatch.
+ */
+TEST(TSYNC_during_ptrace_stop)
+{
+	struct sock_filter filter[] = {
+		BPF_STMT(BPF_LD | BPF_W | BPF_ABS,
+			 offsetof(struct seccomp_data, nr)),
+		BPF_JUMP(BPF_JMP | BPF_JEQ | BPF_K, __NR_getppid, 0, 1),
+		BPF_STMT(BPF_RET | BPF_K,
+			 SECCOMP_RET_ERRNO | TSYNC_PTRACE_ERRNO),
+		BPF_STMT(BPF_RET | BPF_K, SECCOMP_RET_ALLOW),
+	};
+	struct sock_fprog prog = {
+		.len = (unsigned short)ARRAY_SIZE(filter),
+		.filter = filter,
+	};
+	struct tsync_ptrace_result tsync_result, syscall_result;
+	int ready_pipe[2], trigger_pipe[2], tsync_pipe[2], syscall_pipe[2];
+	struct ptrace_syscall_info syscall_info = { };
+	bool target_entry = false;
+	pid_t tracee;
+	int status, i;
+	long ret;
+	char byte = '!';
+
+	ASSERT_EQ(0, pipe(ready_pipe));
+	ASSERT_EQ(0, pipe(trigger_pipe));
+	ASSERT_EQ(0, pipe(tsync_pipe));
+	ASSERT_EQ(0, pipe(syscall_pipe));
+
+	tracee = fork();
+	ASSERT_GE(tracee, 0);
+	if (tracee == 0) {
+		struct tsync_ptrace_worker worker = {
+			.ready_fd = ready_pipe[1],
+			.trigger_fd = trigger_pipe[0],
+			.result_fd = tsync_pipe[1],
+			.prog = &prog,
+		};
+		pthread_t sibling;
+		int err;
+
+		close(trigger_pipe[1]);
+		close(tsync_pipe[0]);
+		close(syscall_pipe[0]);
+
+		if (ptrace(PTRACE_TRACEME, 0, NULL, NULL))
+			_exit(1);
+		if (prctl(PR_SET_NO_NEW_PRIVS, 1, 0, 0, 0))
+			_exit(2);
+
+		err = pthread_create(&sibling, NULL, tsync_ptrace_worker,
+				     &worker);
+		if (err)
+			_exit(3);
+		if (read_nointr(ready_pipe[0], &byte, sizeof(byte)) != sizeof(byte))
+			_exit(4);
+		if (raise(SIGSTOP))
+			_exit(5);
+
+		errno = 0;
+		syscall_result.ret = syscall(__NR_getppid);
+		syscall_result.err = errno;
+
+		err = pthread_join(sibling, NULL);
+		if (err)
+			_exit(6);
+		if (write_nointr(syscall_pipe[1], &syscall_result,
+				 sizeof(syscall_result)) != sizeof(syscall_result))
+			_exit(7);
+		_exit(0);
+	}
+
+	close(ready_pipe[0]);
+	close(ready_pipe[1]);
+	close(trigger_pipe[0]);
+	close(tsync_pipe[1]);
+	close(syscall_pipe[1]);
+
+	ASSERT_EQ(tracee, waitpid(tracee, &status, 0));
+	ASSERT_TRUE(WIFSTOPPED(status)) {
+		kill(tracee, SIGKILL);
+		waitpid(tracee, NULL, 0);
+	}
+	ASSERT_EQ(SIGSTOP, WSTOPSIG(status)) {
+		kill(tracee, SIGKILL);
+		waitpid(tracee, NULL, 0);
+	}
+	ASSERT_EQ(0, ptrace(PTRACE_SETOPTIONS, tracee, NULL,
+			    PTRACE_O_TRACESYSGOOD)) {
+		kill(tracee, SIGKILL);
+		waitpid(tracee, NULL, 0);
+	}
+	ASSERT_EQ(0, ptrace(PTRACE_SYSCALL, tracee, NULL, 0)) {
+		kill(tracee, SIGKILL);
+		waitpid(tracee, NULL, 0);
+	}
+
+	for (i = 0; i < 16; i++) {
+		ASSERT_EQ(tracee, waitpid(tracee, &status, 0)) {
+			kill(tracee, SIGKILL);
+			waitpid(tracee, NULL, 0);
+		}
+		ASSERT_TRUE(WIFSTOPPED(status)) {
+			kill(tracee, SIGKILL);
+			waitpid(tracee, NULL, 0);
+		}
+		if (WSTOPSIG(status) == (SIGTRAP | 0x80)) {
+			memset(&syscall_info, 0, sizeof(syscall_info));
+			ret = ptrace(PTRACE_GET_SYSCALL_INFO, tracee,
+				     sizeof(syscall_info), &syscall_info);
+			ASSERT_GE(ret, 0) {
+				kill(tracee, SIGKILL);
+				waitpid(tracee, NULL, 0);
+			}
+			if (syscall_info.op == PTRACE_SYSCALL_INFO_ENTRY &&
+			    syscall_info.entry.nr == __NR_getppid) {
+				target_entry = true;
+				break;
+			}
+		}
+		ASSERT_EQ(0, ptrace(PTRACE_SYSCALL, tracee, NULL, 0)) {
+			kill(tracee, SIGKILL);
+			waitpid(tracee, NULL, 0);
+		}
+	}
+	ASSERT_TRUE(target_entry) {
+		kill(tracee, SIGKILL);
+		waitpid(tracee, NULL, 0);
+	}
+
+	ASSERT_EQ(sizeof(byte),
+		  write_nointr(trigger_pipe[1], &byte, sizeof(byte))) {
+		kill(tracee, SIGKILL);
+		waitpid(tracee, NULL, 0);
+	}
+	ASSERT_EQ(sizeof(tsync_result),
+		  read_nointr(tsync_pipe[0], &tsync_result,
+			      sizeof(tsync_result))) {
+		kill(tracee, SIGKILL);
+		waitpid(tracee, NULL, 0);
+	}
+	if (tsync_result.ret == -1 && tsync_result.err == ENOSYS) {
+		kill(tracee, SIGKILL);
+		waitpid(tracee, NULL, 0);
+		SKIP(return, "Kernel does not support seccomp syscall");
+	}
+	ASSERT_EQ(0, tsync_result.ret) {
+		TH_LOG("TSYNC failed: ret %ld, errno %d", tsync_result.ret,
+		       tsync_result.err);
+		kill(tracee, SIGKILL);
+		waitpid(tracee, NULL, 0);
+	}
+
+	ASSERT_EQ(0, ptrace(PTRACE_CONT, tracee, NULL, 0)) {
+		kill(tracee, SIGKILL);
+		waitpid(tracee, NULL, 0);
+	}
+	ASSERT_EQ(sizeof(syscall_result),
+		  read_nointr(syscall_pipe[0], &syscall_result,
+			      sizeof(syscall_result))) {
+		kill(tracee, SIGKILL);
+		waitpid(tracee, NULL, 0);
+	}
+	ASSERT_EQ(tracee, waitpid(tracee, &status, 0));
+	ASSERT_TRUE(WIFEXITED(status));
+	ASSERT_EQ(0, WEXITSTATUS(status));
+
+	EXPECT_EQ(-1, syscall_result.ret);
+	EXPECT_EQ(TSYNC_PTRACE_ERRNO, syscall_result.err);
+}
+
 /* Make sure restarted syscalls are seen directly as "restart_syscall". */
 TEST(syscall_restart)
 {
-- 
2.55.0

