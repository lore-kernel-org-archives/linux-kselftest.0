Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793788677;
	b=2UVq+9D1KR82oxsXd3G6AxW8bSVe8zh4Ckz6NxthWn5EIO6TV18xMa0+PpowUo7TDk1K
	 z1b32BKUgmBQIZSA5xtTeS7KBYTjDZLoNaYVALB3ItDU3/ShpSNywp11U8rtrA2fatLdq
	 rXOTHEx8QQgKxhWgCNRZI36YhI1UF+BD33TD7oGqDJ8U8oNHy2LqT0t7jMPfHFxHU2EzC
	 uxwgYHQ4+WftwI+HVPCuJjMCafEQWbUHwA4OYRZaTCu5Q4gE2j2j45uq0zDy7hw7lOKFW
	 6BQjOUs5ckfD3va1xh4OPtZUNw8jOe8fDrRQ33JDhwg5cgrcSSYH4cgbkF+JQk8XApg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793788677;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=BaXjOgI0G0toZIWjJP4AHV5PLuD+RY+zAAUK7BEoaGw=;
	b=fVkpz0MVyO/oxSEPx+2t0xmYye2SiI+jVuczfeIhP0NOmtj7rN0IKIvoy+cnPCoKpyoQ
	 TDdy69llqVd4eznV2TQFdoO2QHoIJNgg/AfGskPxQpWFevMDSklQ1QISpYkkk/rvVcrmS
	 11SrIRKs+wKJWfIDeX84S5IHj9eR5RSIe+tQxl7HJsFPq2sKi973O1zxqSQbbLQuE8Tge
	 JHAel/o6BelkwUA3Iua36IH+dVtjlKv9Zz05xIvvGFTUkMlQwnsWjV5zkOJ2eAnkY1YBI
	 uneUX5h70Zdy77ZMSY0N7C1Rg06gKDN0zQnwUICvpU8ANtEfe0Hns9Jmas/s0oFW9Nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t7B+0i87;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B0C606D80C
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Nov 2026 10:37:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3B0C606D80C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t7B+0i87
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48df4e9d2d4so332360f8f.3
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Nov 2026 02:37:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793788675; x=1794393475; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BaXjOgI0G0toZIWjJP4AHV5PLuD+RY+zAAUK7BEoaGw=;
        b=t7B+0i87WKCqiRr9Ph/Zdr9nr1I3xzIKBu5PGOwI1BvA1ESzCjkNIXhmTzxQ65fIWu
         UJ8IGOcqd78FMzSjkyjVFh2/V5BiIroPzHVRm5TMV4dL0/1CWq69mK2dePxHYPiYGwhU
         yAR3lC6ek+wIE4IVtZlUf3q5+JvgcdTYNBmdQOKElEkgQOXuEHHBDYA+xN0ghjltlUdW
         19oH+wVmdV/sFP0qGhTBYO5ouXedZ+A0xf0qeI7+6xJKIvLvdXkQAVfmekTJi49efWFX
         ImIUaMVA8YjNW/lUGxHK2t+fHqzjZKogj8+62CrlyirMXcLyWPOwni0MgmFYaXS+ifuI
         P28w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793788675; x=1794393475;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BaXjOgI0G0toZIWjJP4AHV5PLuD+RY+zAAUK7BEoaGw=;
        b=0UfPKoR0OmdMfUZkzXz8UnSOxjpfvHcehXn5O+/GbZH/iKQayIIpqgN/IIlEPPvTa1
         bvr2NKofO+bso5vzQ+in7Z+kZh0AJgDBC9Dzo6I5DA5N2Z03+NeOTvHCr7+WSCE67QJP
         xmIj/5ssFC8/GRymVTaaKqKV6/tB9L33Mlk1zd/rxQNTgP49WtjK6ukJwvFVWnDHLYqf
         vfGLOwdU1jGIw7jzcLMHOCkUTULlutNsUoqWutmNAjsMVCvbArzSvwTN4bHYFodjmejl
         OEIdoo8AHVM1/mboNvvpi0BOQiTVcg4iCItivdD/L+DmzeyDJSfDCDcV4/Xd0kbmrY6+
         CNtQ==
X-Forwarded-Encrypted: i=1; AKwUvBzGCiCwrzoHKKVCzjprcOXd0jJBnUb/g3GiORRgP9ppP+halh0oA+V3rySjNxxcMGaJSJ4uFXq+bPxCkBCzHQE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9IQn1UGVIeYtLVXUY5nTQ+9CJHUMV04EtbUN1pOpOv+bIajdzz
	lwNJtj4Y2XYK4CXHRsU76XHcBmpS7+631X9aqImOy0JKsoPDHQjuCq1h
X-Gm-Gg: AYBFou2MTjZfR1ib7UvOnSGv0By3Iykd49mRZSYTHJ+nSY5Fj5FleQ+sS6n4juNNIJ4
	+M/Vkfk4+KU58J+OAIyEcvsyIepZP9BAWyxAqvBVNrz6X/wgIbnVm7jTc5j5sA9yQxO16yAnR5E
	wZCaVo38PjwhB+Rdb4hON0S2lSkfNx4IPIOF7PQEt5dPVVR+/fqCo+Ab25zz5pm2q8gEYjeayHH
	AOhlbRubYyZ4aSet0dWk6POYaBht55VCDUyOKWszNIGw77a4F7YTPJsetNN7PnFXh7dReOqsyxx
	AB9DjcOEPPI/4xHYd+7FDWVAIZXwq8EVXoOtLxJQ4E8c+fnJ+SwwH7p6ONClkuTkJ9qwoWV24Bb
	IFXYH2atpIB8P1+fQPvcbKxdpIf330wa3HMl9d02KO86omLH4/ckiGIw8XXsH7euK3FxrW8tzXq
	ra9YwyHouBgAZ82pbEl7npJvrurMavv/QO7i915l//WU5wsduXC1S9QHipct+rWSJ96TaU9c5r+
	D7itbaLLaw4+x9ZBAjulZ8sADAxyAFZcf0AqnnudyCjjwjeIwtF10OnSxNWq0fD2lSyjnhEIqSc
	Hsg3yj/dLoUuzOyJz7YsDnjajpGBZ7CDFBPRcNw5Ne/N7r9sK5lRBgzaoHHyzEuTh4J7J/dnLnI
	5
X-Received: by 2002:a05:600c:6212:b0:4b0:a7aa:843 with SMTP id 5b1f17b1804b1-4b0a7aa0a54mr194648655e9.25.1793788674899;
        Wed, 04 Nov 2026 02:37:54 -0800 (PST)
Received: from andreayoga.wind3.hub ([151.76.4.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b40ff10f88sm36342995e9.0.2026.11.04.02.37.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 02:37:54 -0800 (PST)
From: Andrea Parri <parri.andrea@gmail.com>
To: Kees Cook <kees@kernel.org>
Cc: Andrea Parri <parri.andrea@gmail.com>,
	Andy Lutomirski <luto@amacapital.net>,
	Will Drewry <wad@chromium.org>,
	Shuah Khan <shuah@kernel.org>,
	Rodrigo Campos <rodrigo@kinvolk.io>,
	Christian Brauner <brauner@kernel.org>,
	Tycho Andersen <tycho@tycho.pizza>,
	Sargun Dhillon <sargun@sargun.me>,
	Hui Peng <benquike@gmail.com>,
	Bradley Morgan <brads@mainlining.org>,
	Cong Wang <cwang@multikernel.io>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	bpf@vger.kernel.org
Subject: [PATCH 4/4] seccomp: publish user notifications after copying them to userspace
Date: Wed,  4 Nov 2026 11:37:34 +0100
Message-ID: <20261104103736.71956-5-parri.andrea@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261104103736.71956-1-parri.andrea@gmail.com>
References: <20261104103736.71956-1-parri.andrea@gmail.com>
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

SECCOMP_FILTER_FLAG_RESTART_BEFORE_RECV restarts a syscall when a signal
interrupts its notification before the supervisor receives it. However,
seccomp_notify_recv() marks the notification SENT before copy_to_user().
Unless WAIT_KILLABLE_RECV is also set, a signal in that window makes the
target return EINTR while the supervisor can receive a stale notification
ID; with it, the signal is held back until the reply.

  CPU 1 (target)                   CPU 2 (supervisor)
  ------------------------------   ------------------------------
                                   mark notification SENT
  receive signal
  observe SENT                     copy notification to user
  remove notification
  return EINTR                     return success with stale ID

Cure this by reserving the notification in a new RECEIVING state. Move it
to SENT after copy_to_user() succeeds and it remains on the notification
list. The target's interrupted wait treats RECEIVING like INIT, while the
receiver returns ENOENT if the target withdraws the notification during
the copy.

When it returns ENOENT, the receiver clears the copied notification, so
userspace can retry with the same zeroed buffer, and returns EFAULT if
clearing fails.

The copy failure path no longer wakes a killable waiter. The target only
switches to a killable wait once its notification is SENT, which now
happens after the copy, and a SENT notification never returns to INIT.

Filters without RESTART_BEFORE_RECV see the same change. Without
WAIT_KILLABLE_RECV, the receiver fails with ENOENT instead of returning a
withdrawn ID. With it, a signal during the copy is handled normally, as
documented for signals sent before userspace receives the notification.

This should be safe because notify_lock protects every state transition
and the post-copy list lookup. seccomp_notify_recv() works from its
by-value copy across the unlocked copy and looks the notification up again
by ID, so it does not dereference the target's stack object after the
target can remove it.

Add a regression test which uses userfaultfd to stop copy_to_user() in the
race window and checks that the buffer is zeroed again on ENOENT. All four
flag variants fail without the kernel change and pass with it when run with
the following command.

  ./seccomp_bpf -t during_receive

The test needs CONFIG_USERFAULTFD, so add it to the seccomp selftest
config.

The race was found and the fix was written with the help of an LLM.

Fixes: f7952251ecc3 ("seccomp: allow restarting interrupted unreceived notifications")
Cc: stable@vger.kernel.org
Signed-off-by: Andrea Parri <parri.andrea@gmail.com>
---
 kernel/seccomp.c                              |  59 ++++----
 tools/testing/selftests/seccomp/config        |   1 +
 tools/testing/selftests/seccomp/seccomp_bpf.c | 132 ++++++++++++++++++
 3 files changed, 161 insertions(+), 31 deletions(-)

diff --git a/kernel/seccomp.c b/kernel/seccomp.c
index 75a758128db2d..7dfd5eec6d640 100644
--- a/kernel/seccomp.c
+++ b/kernel/seccomp.c
@@ -54,6 +54,7 @@
 
 enum notify_state {
 	SECCOMP_NOTIFY_INIT,
+	SECCOMP_NOTIFY_RECEIVING,
 	SECCOMP_NOTIFY_SENT,
 	SECCOMP_NOTIFY_REPLIED,
 };
@@ -74,11 +75,12 @@ struct seccomp_knotif {
 
 	/*
 	 * Notification states. When SECCOMP_RET_USER_NOTIF is returned, a
-	 * struct seccomp_knotif is created and starts out in INIT. Once the
-	 * handler reads the notification off of an FD, it transitions to SENT.
-	 * If a signal is received the state transitions back to INIT and
-	 * another message is sent. When the userspace handler replies, state
-	 * transitions to REPLIED.
+	 * struct seccomp_knotif is created and starts out in INIT. A receiver
+	 * reserves it by moving it to RECEIVING. Once the notification has been
+	 * copied to userspace, it transitions to SENT; if copying fails, it
+	 * returns to INIT. An interrupted wait may withdraw the notification in
+	 * any state, including RECEIVING. When the userspace handler replies,
+	 * state transitions to REPLIED.
 	 */
 	enum notify_state state;
 
@@ -1225,7 +1227,7 @@ static int seccomp_do_user_notification(int this_syscall,
 			 */
 			if (!(!wait_killable && should_sleep_killable(match, &n))) {
 				if (err == -ERESTARTSYS && match->restart_before_recv &&
-				    n.state == SECCOMP_NOTIFY_INIT)
+				    n.state <= SECCOMP_NOTIFY_RECEIVING)
 					err = -ERESTARTNOINTR;
 				goto interrupted;
 			}
@@ -1600,40 +1602,35 @@ static long seccomp_notify_recv(struct seccomp_filter *filter,
 	 * when we were able to acquire the rw lock.
 	 */
 	if (!knotif) {
-		ret = -ENOENT;
-		goto out;
+		mutex_unlock(&filter->notify_lock);
+		return -ENOENT;
 	}
 
 	unotif.id = knotif->id;
 	unotif.pid = task_pid_vnr(knotif->task);
 	unotif.data = *(knotif->data);
-
-	seccomp_notify_set_sent(filter, knotif);
-	ret = 0;
-out:
+	knotif->state = SECCOMP_NOTIFY_RECEIVING;
 	mutex_unlock(&filter->notify_lock);
 
-	if (ret == 0 && copy_to_user(buf, &unotif, sizeof(unotif))) {
-		ret = -EFAULT;
+	ret = copy_to_user(buf, &unotif, sizeof(unotif)) ? -EFAULT : 0;
 
-		/*
-		 * Userspace screwed up. To make sure that we keep this
-		 * notification alive, let's reset it back to INIT. It
-		 * may have died when we released the lock, so we need to make
-		 * sure it's still around.
-		 */
-		mutex_lock(&filter->notify_lock);
-		knotif = find_notification(filter, unotif.id);
-		if (knotif) {
-			/* Reset the process to make sure it's not stuck */
-			if (should_sleep_killable(filter, knotif))
-				complete(&knotif->ready);
-			knotif->state = SECCOMP_NOTIFY_INIT;
-			atomic_inc(&filter->notif->requests);
-			wake_up_poll(&filter->wqh, EPOLLIN | EPOLLRDNORM);
-		}
-		mutex_unlock(&filter->notify_lock);
+	mutex_lock(&filter->notify_lock);
+	knotif = find_notification(filter, unotif.id);
+	if (!knotif) {
+		if (!ret)
+			ret = -ENOENT;
+	} else if (!ret) {
+		seccomp_notify_set_sent(filter, knotif);
+	} else {
+		knotif->state = SECCOMP_NOTIFY_INIT;
+		atomic_inc(&filter->notif->requests);
+		wake_up_poll(&filter->wqh, EPOLLIN | EPOLLRDNORM);
 	}
+	mutex_unlock(&filter->notify_lock);
+
+	/* Leave the buffer zeroed so that userspace can retry unchanged. */
+	if (ret == -ENOENT && clear_user(buf, sizeof(unotif)))
+		ret = -EFAULT;
 
 	return ret;
 }
diff --git a/tools/testing/selftests/seccomp/config b/tools/testing/selftests/seccomp/config
index ad431a5178fbe..c6e14eb473fd9 100644
--- a/tools/testing/selftests/seccomp/config
+++ b/tools/testing/selftests/seccomp/config
@@ -1,4 +1,5 @@
 CONFIG_PID_NS=y
 CONFIG_SECCOMP=y
 CONFIG_SECCOMP_FILTER=y
+CONFIG_USERFAULTFD=y
 CONFIG_USER_NS=y
diff --git a/tools/testing/selftests/seccomp/seccomp_bpf.c b/tools/testing/selftests/seccomp/seccomp_bpf.c
index 123eddb0c0d64..1ac5b6960a1ce 100644
--- a/tools/testing/selftests/seccomp/seccomp_bpf.c
+++ b/tools/testing/selftests/seccomp/seccomp_bpf.c
@@ -22,6 +22,7 @@
 
 #include <errno.h>
 #include <linux/filter.h>
+#include <linux/userfaultfd.h>
 #include <sys/epoll.h>
 #include <sys/prctl.h>
 #include <sys/ptrace.h>
@@ -5137,6 +5138,137 @@ TEST_F(notification_restart, failed_receive)
 	notification_result(_metadata, self, -1, EAGAIN);
 }
 
+#ifdef __NR_userfaultfd
+struct notification_receive_args {
+	struct seccomp_notif *req;
+	int listener;
+	int ret;
+	int err;
+};
+
+static void *notification_receive(void *data)
+{
+	struct notification_receive_args *args = data;
+
+	args->ret = ioctl(args->listener, SECCOMP_IOCTL_NOTIF_RECV, args->req);
+	args->err = errno;
+	return NULL;
+}
+
+/*
+ * Write-protect the range through a new userfaultfd and return it, or
+ * return -1 with a skip reason if this kernel cannot report the fault.
+ */
+static int notification_uffd_wp(struct __test_metadata *_metadata,
+				const struct uffdio_range *range,
+				char *reason, size_t reason_len)
+{
+	struct uffdio_writeprotect wp = {};
+	struct uffdio_register reg = {};
+	struct uffdio_api api = {
+		.api = UFFD_API,
+		.features = UFFD_FEATURE_PAGEFAULT_FLAG_WP,
+	};
+	int ret, uffd;
+
+	/* Kernel-originated faults require a privileged userfaultfd. */
+	uffd = syscall(__NR_userfaultfd, O_CLOEXEC | O_NONBLOCK);
+	if (uffd < 0) {
+		snprintf(reason, reason_len,
+			 "userfaultfd for kernel faults unavailable: %s",
+			 strerror(errno));
+		return -1;
+	}
+	ret = ioctl(uffd, UFFDIO_API, &api);
+	if (ret < 0 && errno == EINVAL) {
+		snprintf(reason, reason_len, "userfaultfd API is not available");
+		goto skip;
+	}
+	ASSERT_EQ(ret, 0);
+	if (!(api.features & UFFD_FEATURE_PAGEFAULT_FLAG_WP)) {
+		snprintf(reason, reason_len,
+			 "userfaultfd write protection is not available");
+		goto skip;
+	}
+
+	reg.range = *range;
+	reg.mode = UFFDIO_REGISTER_MODE_WP;
+	ASSERT_EQ(ioctl(uffd, UFFDIO_REGISTER, &reg), 0);
+	wp.range = *range;
+	wp.mode = UFFDIO_WRITEPROTECT_MODE_WP;
+	ASSERT_EQ(ioctl(uffd, UFFDIO_WRITEPROTECT, &wp), 0);
+	return uffd;
+
+skip:
+	ASSERT_EQ(close(uffd), 0);
+	return -1;
+}
+
+TEST_F(notification_restart, during_receive)
+{
+	struct notification_receive_args args = { .listener = self->listener };
+	struct seccomp_notif req = {};
+	struct seccomp_notif_resp resp = {};
+	struct uffdio_writeprotect wp = {};
+	struct uffdio_range range = {};
+	struct pollfd pfd = { .events = POLLIN };
+	struct uffd_msg msg;
+	char reason[128];
+	pthread_t thread;
+	long page_size;
+	int uffd;
+
+	page_size = sysconf(_SC_PAGESIZE);
+	ASSERT_GT(page_size, 0);
+	args.req = mmap(NULL, page_size, PROT_READ | PROT_WRITE,
+			MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+	ASSERT_NE(args.req, MAP_FAILED);
+	memset(args.req, 0, page_size);
+
+	range.start = (unsigned long)args.req;
+	range.len = page_size;
+	uffd = notification_uffd_wp(_metadata, &range, reason, sizeof(reason));
+	if (uffd < 0) {
+		ASSERT_EQ(munmap(args.req, page_size), 0);
+		SKIP(return, "%s", reason);
+	}
+
+	notification_restart_child(_metadata, self);
+	notification_pending(_metadata, self->listener);
+	ASSERT_EQ(pthread_create(&thread, NULL, notification_receive, &args), 0);
+	pfd.fd = uffd;
+	ASSERT_EQ(poll(&pfd, 1, 5000), 1);
+	ASSERT_EQ(read(uffd, &msg, sizeof(msg)), sizeof(msg));
+	ASSERT_EQ(msg.event, UFFD_EVENT_PAGEFAULT);
+	ASSERT_TRUE(msg.arg.pagefault.flags & UFFD_PAGEFAULT_FLAG_WP);
+
+	/* Withdraw the notification while copy_to_user() is stalled. */
+	notification_signal(_metadata, self);
+	wp.range = range;
+	wp.mode = 0;
+	ASSERT_EQ(ioctl(uffd, UFFDIO_WRITEPROTECT, &wp), 0);
+	ASSERT_EQ(pthread_join(thread, NULL), 0);
+	ASSERT_EQ(args.ret, -1);
+	EXPECT_EQ(args.err, ENOENT);
+	EXPECT_EQ(memcmp(args.req, &req, sizeof(req)), 0);
+	ASSERT_EQ(close(uffd), 0);
+	ASSERT_EQ(munmap(args.req, page_size), 0);
+
+	if (!variant->restart) {
+		notification_result(_metadata, self, -1, EINTR);
+		return;
+	}
+
+	notification_pending(_metadata, self->listener);
+	ASSERT_EQ(ioctl(self->listener, SECCOMP_IOCTL_NOTIF_RECV,
+			&req), 0);
+	resp.id = req.id;
+	resp.flags = SECCOMP_USER_NOTIF_FLAG_CONTINUE;
+	ASSERT_EQ(ioctl(self->listener, SECCOMP_IOCTL_NOTIF_SEND, &resp), 0);
+	notification_result(_metadata, self, getpid(), 0);
+}
+#endif
+
 TEST_F(notification_restart, after_receive)
 {
 	struct seccomp_notif req = {};
-- 
2.53.0

