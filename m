Received: from mail-dy2-f12.google.com (mail-dy2-f12.google.com [74.125.229.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CBB54D6C25
	for <linux-kselftest@vger.kernel.org>; Thu, 24 Sep 2026 20:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790282544; cv=none; b=RGBPTHg28dRgK7QVKZ1wVU21ob0M+q72KZe1pWZWqqDebVtXvEqUrVwINGoEgEhr81A0Ti6xzDL2Olkdgqacpw52z2RMT0UoZ0XKM4QYis+aiAm0tRCVtdplf2SoUb6vaQHJX/9VUd7KHWU0iyj5zb+e/W8TzvwXBGkNOx3/y/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790282544; c=relaxed/simple;
	bh=cqxpIjT7+OaMZ0dtk8ejWhpu/1wYH0cc5jMty8Ds7Ys=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lYoKxUlUPEUkPHTw60I9x2bDh9VKNTPIPWRzv5A/sLow1azKxeIBVCuR19aZ10lV24+0lu0ScXGpnU9HvNVIaAjhxQD1SlD3lu+ymZWEo0B3IJp92j/o+yTYxcmjdYIWqiW9Xq2OKVUj3UFObBoXpYU6j7wL3kThIjJndJVdVJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NbrS33ub; arc=none smtp.client-ip=74.125.229.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NbrS33ub"
Received: by mail-dy2-f12.google.com with SMTP id 5a478bee46e88-328664b752eso99318eec.1
        for <linux-kselftest@vger.kernel.org>; Thu, 24 Sep 2026 13:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790282535; x=1790887335; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kbwJSqTGaUlliYwuSU2088BChxyXusMw7vXczuO3o0k=;
        b=NbrS33ubUDa7B+FxUvbIDr77E0s7DvOe0SG8feCvUmaOLek1kSrStDjq7Wm+Lo4KWK
         a3EiCgxDfZ4aIVMFAKO2DPhH6dorxy+A3vQcmFZ19R/yNqDQTw2miW/AlvfEbhgqmNe4
         xDLLYCDriB6U1b1l2vYV7X9+v/eGvcdqCqxLODGf0ETBeCiHb8GQOK8M5sS6Vv0iqJHL
         g9FVT6zZy/oimDL8jVYGw005PGBqWK8kiVSVtiXI8Uf5G4odNl5L8ndk6TgVQ2dw4GGA
         YhghdcTzhloEoWUnYlyq776cUTZKajN9/esERC0G0490xL0nrOlooEoFwxpCm+4caqpI
         Qb5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790282535; x=1790887335;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kbwJSqTGaUlliYwuSU2088BChxyXusMw7vXczuO3o0k=;
        b=jQw0uB7Rv+IAsZhsYpF3ZE43aHAvEaPl6rnZ3yhv9mhtMhQfEd9cxY0jItf+/MTnzR
         fgHohDCOZD7Sj81CuwyPlkLBaRBvVvUdqP7MBxbSZ61w6eux3pszuoYVAMEdPH4u54Iv
         97AfzQuCFqH1k1OFt+uL5NlFBeWNR8VnO3sitzlbDgZavPsrGXz1ZYGpG5fYcoiw99DL
         NCmV93t259SPtFI2Odx0zsWVbdy2aZ/Os+xZJChsznm+RTRsbntvnlTneGrxRvIMKyPv
         edpxC1uZzHqyhJfNRD1T/Ck9v1UJn/qB1jlrtHWY8oXszJZvHX3USn8TEntCPXAPH3Pc
         llcg==
X-Forwarded-Encrypted: i=1; AKwUvBzMgawUV6WsOGb0P+LUmbI5YcTMojctfjmd/wqUzJvNkIjgQoN2jhb38cJKZJ/3O6U5tfCA3c2T0E4k61lll/g=@vger.kernel.org
X-Gm-Message-State: AFuF++kfhybDLbZWtveMTH0YcE8mui0qyoErOKQ+9P1jNnwMP6iRSY1K
	rBJcCPwxfy4oQuQ9wB/9OOqn31gPuI0LEta91i/X6LA0aeBKbl1RwuRh
X-Gm-Gg: AYBFou0uk4mO/tvqTDxW+uXTm1IwPkr6qHK2OWducxsBa0X+IhM8ZkE18/DVjY9J1ry
	aE2WKCuYJsIm2wGo2nuNr9qTRt7nZcifjny/HcsCACLiAubyeS8Q0/4mOw2yv3y1aVEf5Ot4SNs
	PW10A3Io2yTBJ03Wh8EE3nHezOzrhuo5ikHcYT8cizZ5uxJSqyiR/aEQqXbRwSqyiiVF5tNXvqy
	73/1yeCPCew9Odr1qi3ly/ujem6htu6I1I7uFNWGcVgD2RtEKZP8LvjsuRJSFYPV0lWzS+7Lt+o
	vWKpMon0fqk22CHv5+kipry3+SbDE2Mbs9zXBqd6m8eCc+bTr8AOVK21lwsSKeVU5hgQ0SaejOG
	r7oL8ekeIbEs0Hml1gSUweQtko/u2vN8dFJhok0hEx5VFt0kUcOtTm6XiHjkhSTRa1GP4BnEpc5
	dh+nSvwQCjseV5iNG9U+9DJQ4wa7wW6qXzVyr45HlXsY0foUurLQZnWsYVVvK+EZz5WF2Iay4Ye
	n4VCZ3g59F9qu4MeKXPsUrMUEc9bk/PBBwbC2DYxA==
X-Received: by 2002:a05:7301:6406:b0:33b:faec:b73c with SMTP id 5a478bee46e88-34000c2d82bmr2824149eec.25.1790282534476;
        Thu, 24 Sep 2026 13:42:14 -0700 (PDT)
Received: from pop-os.scu.edu ([129.210.115.107])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34141d2fe4bsm1073470eec.4.2026.09.24.13.42.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 13:42:13 -0700 (PDT)
From: Cong Wang <xiyou.wangcong@gmail.com>
To: Kees Cook <kees@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Will Drewry <wad@chromium.org>,
	Christian Brauner <brauner@kernel.org>,
	Andy Lutomirski <luto@amacapital.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 2/3] selftests/seccomp: cover restart of unreceived notifications
Date: Thu, 24 Sep 2026 13:42:08 -0700
Message-ID: <20260924204209.477694-3-xiyou.wangcong@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260924204209.477694-1-xiyou.wangcong@gmail.com>
References: <20260924204209.477694-1-xiyou.wangcong@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Cong Wang <cwang@multikernel.io>

Exercise restart and killable-wait flag combinations before receipt,
after a failed receive, and after receipt. Cover repeated interruptions,
listener closure, fatal signals, flag validation and supervisor errors.

Verify that restarted fork creates exactly one child, close releases its
descriptor, and denied fork returns EAGAIN. Preserve compatibility
checks with restart disabled. Synchronize pre-receipt signals through a
socket and check post-receipt response preservation without task-state
polling.

All 136 seccomp selftests passed before the polling cleanup. After
that change, all four revised post-receipt variants and the existing
wait-killable test passed.

Assisted-by: Codex:gpt-6
Signed-off-by: Cong Wang <cwang@multikernel.io>
---
 tools/testing/selftests/seccomp/seccomp_bpf.c | 354 ++++++++++++++++++
 1 file changed, 354 insertions(+)

diff --git a/tools/testing/selftests/seccomp/seccomp_bpf.c b/tools/testing/selftests/seccomp/seccomp_bpf.c
index 0622bc2acad4..6635340c0428 100644
--- a/tools/testing/selftests/seccomp/seccomp_bpf.c
+++ b/tools/testing/selftests/seccomp/seccomp_bpf.c
@@ -307,6 +307,10 @@ struct seccomp_notif_addfd_big {
 #define SECCOMP_FILTER_FLAG_WAIT_KILLABLE_RECV (1UL << 5)
 #endif
 
+#ifndef SECCOMP_FILTER_FLAG_RESTART_BEFORE_RECV
+#define SECCOMP_FILTER_FLAG_RESTART_BEFORE_RECV (1UL << 6)
+#endif
+
 #ifndef seccomp
 int seccomp(unsigned int op, unsigned int flags, void *args)
 {
@@ -4639,6 +4643,356 @@ static long get_proc_syscall(struct __test_metadata *_metadata, int pid)
 	return ret;
 }
 
+
+static void notification_restart_handler(int sig)
+{
+	char c;
+	int saved_errno = errno;
+
+	if (write(handled, "s", 1) != 1 || read(handled, &c, 1) != 1)
+		_exit(1);
+	errno = saved_errno;
+}
+
+FIXTURE(notification_restart) {
+	int listener;
+	int sync[2];
+	pid_t pid;
+};
+
+FIXTURE_VARIANT(notification_restart) {
+	bool restart;
+	bool killable;
+};
+
+FIXTURE_VARIANT_ADD(notification_restart, neither) {
+	.restart = false, .killable = false,
+};
+FIXTURE_VARIANT_ADD(notification_restart, restart) {
+	.restart = true, .killable = false,
+};
+FIXTURE_VARIANT_ADD(notification_restart, killable) {
+	.restart = false, .killable = true,
+};
+FIXTURE_VARIANT_ADD(notification_restart, both) {
+	.restart = true, .killable = true,
+};
+
+FIXTURE_SETUP(notification_restart)
+{
+	unsigned int flags = SECCOMP_FILTER_FLAG_NEW_LISTENER;
+
+	self->pid = -1;
+	self->listener = -1;
+	self->sync[0] = self->sync[1] = -1;
+	ASSERT_EQ(prctl(PR_SET_NO_NEW_PRIVS, 1, 0, 0, 0), 0);
+	ASSERT_EQ(socketpair(AF_UNIX, SOCK_STREAM, 0, self->sync), 0);
+	if (variant->restart)
+		flags |= SECCOMP_FILTER_FLAG_RESTART_BEFORE_RECV;
+	if (variant->killable)
+		flags |= SECCOMP_FILTER_FLAG_WAIT_KILLABLE_RECV;
+	self->listener = user_notif_syscall(__NR_getppid, flags);
+	ASSERT_GE(self->listener, 0);
+}
+
+FIXTURE_TEARDOWN(notification_restart)
+{
+	if (self->pid > 0) {
+		kill(self->pid, SIGKILL);
+		waitpid(self->pid, NULL, 0);
+	}
+	close(self->listener);
+	close(self->sync[0]);
+	close(self->sync[1]);
+}
+
+static void notification_restart_child(struct __test_metadata *_metadata,
+				       struct _test_data_notification_restart *self)
+{
+	struct sigaction action = { .sa_handler = notification_restart_handler };
+	long result[2];
+
+	self->pid = fork();
+	ASSERT_GE(self->pid, 0);
+	if (self->pid)
+		return;
+
+	close(self->listener);
+	close(self->sync[0]);
+	handled = self->sync[1];
+	if (sigemptyset(&action.sa_mask) || sigaction(SIGUSR1, &action, NULL))
+		_exit(1);
+	result[0] = syscall(__NR_getppid);
+	result[1] = errno;
+	if (write(handled, result, sizeof(result)) != sizeof(result))
+		_exit(1);
+	_exit(0);
+}
+
+static void notification_pending(struct __test_metadata *_metadata, int fd)
+{
+	struct pollfd pfd = { .fd = fd, .events = POLLIN };
+
+	ASSERT_EQ(poll(&pfd, 1, 5000), 1);
+	ASSERT_TRUE(pfd.revents & POLLIN);
+}
+
+static void notification_signal(struct __test_metadata *_metadata,
+				struct _test_data_notification_restart *self)
+{
+	struct pollfd pfd = { .fd = self->sync[0], .events = POLLIN };
+	char c;
+
+	ASSERT_EQ(kill(self->pid, SIGUSR1), 0);
+	ASSERT_EQ(poll(&pfd, 1, 5000), 1);
+	ASSERT_EQ(read(self->sync[0], &c, 1), 1);
+	ASSERT_EQ(c, 's');
+	/* The handler holds the task until the abandoned request is checked. */
+	pfd.fd = self->listener;
+	ASSERT_EQ(poll(&pfd, 1, 0), 0);
+	ASSERT_EQ(write(self->sync[0], "r", 1), 1);
+}
+
+static void notification_result(struct __test_metadata *_metadata,
+				struct _test_data_notification_restart *self,
+				long value, int error)
+{
+	long result[2];
+	int status;
+
+	ASSERT_EQ(read(self->sync[0], result, sizeof(result)), sizeof(result));
+	EXPECT_EQ(result[0], value);
+	if (value == -1)
+		EXPECT_EQ(result[1], error);
+	ASSERT_EQ(waitpid(self->pid, &status, 0), self->pid);
+	self->pid = -1;
+	ASSERT_TRUE(WIFEXITED(status));
+	EXPECT_EQ(WEXITSTATUS(status), 0);
+}
+
+TEST_F(notification_restart, before_receive)
+{
+	struct seccomp_notif req = {};
+	struct seccomp_notif_resp resp = {};
+	int i;
+
+	notification_restart_child(_metadata, self);
+	for (i = 0; i < 3; i++) {
+		notification_pending(_metadata, self->listener);
+		notification_signal(_metadata, self);
+		if (!variant->restart) {
+			notification_result(_metadata, self, -1, EINTR);
+			return;
+		}
+	}
+	notification_pending(_metadata, self->listener);
+	ASSERT_EQ(ioctl(self->listener, SECCOMP_IOCTL_NOTIF_RECV, &req), 0);
+	resp.id = req.id;
+	resp.flags = SECCOMP_USER_NOTIF_FLAG_CONTINUE;
+	ASSERT_EQ(ioctl(self->listener, SECCOMP_IOCTL_NOTIF_SEND, &resp), 0);
+	notification_result(_metadata, self, getpid(), 0);
+}
+
+TEST_F(notification_restart, failed_receive)
+{
+	struct seccomp_notif_resp resp = {};
+	struct seccomp_notif req = {};
+	void *buf;
+
+	buf = mmap(NULL, sizeof(req), PROT_READ, MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+	ASSERT_NE(buf, MAP_FAILED);
+	notification_restart_child(_metadata, self);
+	notification_pending(_metadata, self->listener);
+	ASSERT_EQ(ioctl(self->listener, SECCOMP_IOCTL_NOTIF_RECV, buf), -1);
+	ASSERT_EQ(errno, EFAULT);
+	ASSERT_EQ(munmap(buf, sizeof(req)), 0);
+	notification_signal(_metadata, self);
+	if (!variant->restart) {
+		notification_result(_metadata, self, -1, EINTR);
+		return;
+	}
+	notification_pending(_metadata, self->listener);
+	ASSERT_EQ(ioctl(self->listener, SECCOMP_IOCTL_NOTIF_RECV, &req), 0);
+	resp.id = req.id;
+	resp.error = -EAGAIN;
+	ASSERT_EQ(ioctl(self->listener, SECCOMP_IOCTL_NOTIF_SEND, &resp), 0);
+	notification_result(_metadata, self, -1, EAGAIN);
+}
+
+TEST_F(notification_restart, after_receive)
+{
+	struct seccomp_notif req = {};
+	struct seccomp_notif_resp resp = {};
+	char c;
+
+	notification_restart_child(_metadata, self);
+	notification_pending(_metadata, self->listener);
+	ASSERT_EQ(ioctl(self->listener, SECCOMP_IOCTL_NOTIF_RECV, &req), 0);
+	if (!variant->killable) {
+		notification_signal(_metadata, self);
+		notification_result(_metadata, self, -1, EINTR);
+		ASSERT_EQ(ioctl(self->listener, SECCOMP_IOCTL_NOTIF_ID_VALID, &req.id), -1);
+		EXPECT_EQ(errno, ENOENT);
+		return;
+	}
+	ASSERT_EQ(kill(self->pid, SIGUSR1), 0);
+	/* Either ordering of signal delivery and reply must preserve the response. */
+	resp.id = req.id;
+	resp.val = USER_NOTIF_MAGIC;
+	ASSERT_EQ(ioctl(self->listener, SECCOMP_IOCTL_NOTIF_SEND, &resp), 0);
+	ASSERT_EQ(read(self->sync[0], &c, 1), 1);
+	ASSERT_EQ(c, 's');
+	ASSERT_EQ(write(self->sync[0], "r", 1), 1);
+	notification_result(_metadata, self, USER_NOTIF_MAGIC, 0);
+}
+
+TEST_F(notification_restart, fork_and_close)
+{
+	struct sigaction action = { .sa_handler = notification_restart_handler };
+	struct sock_filter filter[] = {
+		BPF_STMT(BPF_LD | BPF_W | BPF_ABS, offsetof(struct seccomp_data, nr)),
+#ifdef __NR_fork
+		BPF_JUMP(BPF_JMP | BPF_JEQ | BPF_K, __NR_fork, 0, 1),
+		BPF_STMT(BPF_RET | BPF_K, SECCOMP_RET_USER_NOTIF),
+#endif
+#ifdef __NR_clone
+		BPF_JUMP(BPF_JMP | BPF_JEQ | BPF_K, __NR_clone, 0, 1),
+		BPF_STMT(BPF_RET | BPF_K, SECCOMP_RET_USER_NOTIF),
+#endif
+#ifdef __NR_clone3
+		BPF_JUMP(BPF_JMP | BPF_JEQ | BPF_K, __NR_clone3, 0, 1),
+		BPF_STMT(BPF_RET | BPF_K, SECCOMP_RET_USER_NOTIF),
+#endif
+		BPF_JUMP(BPF_JMP | BPF_JEQ | BPF_K, __NR_close, 0, 1),
+		BPF_STMT(BPF_RET | BPF_K, SECCOMP_RET_USER_NOTIF),
+		BPF_STMT(BPF_RET | BPF_K, SECCOMP_RET_ALLOW),
+	};
+	struct sock_fprog prog = { .len = ARRAY_SIZE(filter), .filter = filter };
+	char control[CMSG_SPACE(sizeof(int))] = {};
+	char c = 'f';
+	struct iovec iov = { .iov_base = &c, .iov_len = 1 };
+	struct msghdr msg = {
+		.msg_iov = &iov, .msg_iovlen = 1,
+		.msg_control = control, .msg_controllen = sizeof(control),
+	};
+	struct cmsghdr *cmsg;
+	unsigned int flags = SECCOMP_FILTER_FLAG_NEW_LISTENER;
+	int i, fd, listener, status;
+	long result[2] = {};
+	pid_t child;
+
+	if (variant->restart)
+		flags |= SECCOMP_FILTER_FLAG_RESTART_BEFORE_RECV;
+	if (variant->killable)
+		flags |= SECCOMP_FILTER_FLAG_WAIT_KILLABLE_RECV;
+	ASSERT_EQ(close(self->listener), 0);
+	self->listener = -1;
+	self->pid = fork();
+	ASSERT_GE(self->pid, 0);
+	if (!self->pid) {
+		close(self->sync[0]);
+		handled = self->sync[1];
+		ASSERT_EQ(sigemptyset(&action.sa_mask), 0);
+		ASSERT_EQ(sigaction(SIGUSR1, &action, NULL), 0);
+		fd = open("/dev/null", O_RDONLY);
+		ASSERT_GE(fd, 0);
+		listener = seccomp(SECCOMP_SET_MODE_FILTER, flags, &prog);
+		ASSERT_GE(listener, 0);
+		cmsg = CMSG_FIRSTHDR(&msg);
+		cmsg->cmsg_level = SOL_SOCKET;
+		cmsg->cmsg_type = SCM_RIGHTS;
+		cmsg->cmsg_len = CMSG_LEN(sizeof(listener));
+		memcpy(CMSG_DATA(cmsg), &listener, sizeof(listener));
+		ASSERT_EQ(sendmsg(handled, &msg, 0), 1);
+
+		child = fork();
+		if (!child)
+			_exit(0);
+		if (variant->restart) {
+			ASSERT_GT(child, 0);
+			ASSERT_EQ(waitpid(child, &status, 0), child);
+			ASSERT_TRUE(WIFEXITED(status));
+			ASSERT_EQ(WEXITSTATUS(status), 0);
+			ASSERT_EQ(waitpid(-1, &status, WNOHANG), -1);
+			ASSERT_EQ(errno, ECHILD);
+			ASSERT_EQ(close(fd), 0);
+			ASSERT_EQ(fcntl(fd, F_GETFD), -1);
+			ASSERT_EQ(errno, EBADF);
+		} else {
+			ASSERT_EQ(child, -1);
+			ASSERT_EQ(errno, EINTR);
+			ASSERT_EQ(close(fd), -1);
+			ASSERT_EQ(errno, EINTR);
+			ASSERT_GE(fcntl(fd, F_GETFD), 0);
+		}
+
+		ASSERT_EQ(fork(), -1);
+		ASSERT_EQ(errno, EAGAIN);
+		ASSERT_EQ(write(handled, result, sizeof(result)), sizeof(result));
+		_exit(0);
+	}
+	ASSERT_EQ(recvmsg(self->sync[0], &msg, 0), 1);
+	ASSERT_FALSE(msg.msg_flags & MSG_CTRUNC);
+	cmsg = CMSG_FIRSTHDR(&msg);
+	ASSERT_NE(cmsg, NULL);
+	ASSERT_EQ(cmsg->cmsg_level, SOL_SOCKET);
+	ASSERT_EQ(cmsg->cmsg_type, SCM_RIGHTS);
+	ASSERT_EQ(cmsg->cmsg_len, CMSG_LEN(sizeof(listener)));
+	memcpy(&self->listener, CMSG_DATA(cmsg), sizeof(self->listener));
+
+	for (i = 0; i < 3; i++) {
+		struct seccomp_notif req = {};
+		struct seccomp_notif_resp resp = {};
+
+		notification_pending(_metadata, self->listener);
+		if (i < 2 || variant->restart) {
+			notification_signal(_metadata, self);
+			if (!variant->restart)
+				continue;
+			notification_pending(_metadata, self->listener);
+		}
+		ASSERT_EQ(ioctl(self->listener, SECCOMP_IOCTL_NOTIF_RECV, &req), 0);
+		EXPECT_EQ(req.pid, self->pid);
+		resp.id = req.id;
+		if (i == 2)
+			resp.error = -EAGAIN;
+		else
+			resp.flags = SECCOMP_USER_NOTIF_FLAG_CONTINUE;
+		ASSERT_EQ(ioctl(self->listener, SECCOMP_IOCTL_NOTIF_SEND, &resp), 0);
+	}
+	notification_result(_metadata, self, 0, 0);
+}
+
+TEST_F(notification_restart, fatal_signal)
+{
+	int status;
+
+	notification_restart_child(_metadata, self);
+	notification_pending(_metadata, self->listener);
+	ASSERT_EQ(kill(self->pid, SIGKILL), 0);
+	ASSERT_EQ(waitpid(self->pid, &status, 0), self->pid);
+	self->pid = -1;
+	ASSERT_TRUE(WIFSIGNALED(status));
+	EXPECT_EQ(WTERMSIG(status), SIGKILL);
+}
+
+TEST_F(notification_restart, listener_closed)
+{
+	notification_restart_child(_metadata, self);
+	notification_pending(_metadata, self->listener);
+	ASSERT_EQ(close(self->listener), 0);
+	self->listener = -1;
+	notification_result(_metadata, self, -1, ENOSYS);
+}
+
+TEST(user_notification_restart_requires_listener)
+{
+	ASSERT_EQ(prctl(PR_SET_NO_NEW_PRIVS, 1, 0, 0, 0), 0);
+	EXPECT_EQ(user_notif_syscall(__NR_getppid,
+				   SECCOMP_FILTER_FLAG_RESTART_BEFORE_RECV), -1);
+	EXPECT_EQ(errno, EINVAL);
+}
+
 /* Ensure non-fatal signals prior to receive are unmodified */
 TEST(user_notification_wait_killable_pre_notification)
 {
-- 
2.43.0

