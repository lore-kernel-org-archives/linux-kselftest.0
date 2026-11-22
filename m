Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795361240;
	b=aYs2E7DJV3KInEE/CriNbnceJTRXmIa2PHBXQjHnHaiDhSUELZsbNZPYlSszIXzM83F1
	 c+VaLzaVD0cBCvYVl/CUcgYwqqYWtJFR2/LRecQNVNpPgMyClqKWHug6h60KxYY3rlU8q
	 /hE+MqDQmEfCo5lxwqQsuf7HJTAklNcuvIiJX8MATEs2NboMyCDpSvCH1Im0tqxZf3k9d
	 DLIAWQ0brbTjOrvgSOtSsLVp1HnwZpyYeIK9yPgIqt2BJ2IuLQlj+wTwkE4aDH3VF+DU+
	 C0LqI0x0DNgX2piETfRVIKQzYFqZ5i/oiHpBN8OncNfEohYbt0S7QdoXxMOhuwG11Rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795361240;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=QG9b2UaelpX3Wm1347brCg45zPhFGvUkcmcf2KQfdH0=;
	b=lfmCbAJ6YiyqZD2eCf11KjrliippXeHbFZ/tjWijW7KcLJQ+B51ZRb9gsgPbjqTY+D3B
	 c7MsTeb7w+ha6/3HMEwLiNtMdQweU9g1hUUzOVzZv5yRfeS5r039ZGo+oZRM6AhIpAfVu
	 URzPzVYrsn6DbuMYgzjoVZwEIOxbEgodtcnPgvGXzHzV2yOHQ+60N7b5ym5VHkKc05TbE
	 RWmw1dT7EXVgnfajAh3TFVi8n8khjnKfnXlBO/vEcGhVOaaSB7tGNCNi3/soRzxJoi1/U
	 B+77rsCzXdxtxeVAWbw58IKNfWDa11idb51a35nDq+VgFYj0WIPG+Xdd4k6Y9nof5HQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=cVyCRQqd;
	arc=none smtp.remote-ip=109.224.244.17
Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch [109.224.244.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CA92606A331
	for <linux-kselftest@vger.kernel.org>; Sun, 22 Nov 2026 15:27:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CA92606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=cVyCRQqd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1795361236; x=1795620436;
	bh=QG9b2UaelpX3Wm1347brCg45zPhFGvUkcmcf2KQfdH0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=cVyCRQqdkgao3bz1OX6ZlxYZPxR9+4n8JLHVM8Gw5EReevUpkpWuSy9Oji1ZEkp6V
	 dJQ3k0aVXyR9mCcxwh2sIm2KxpEh3GD4hKLbT1BomnxfUv2Nr/zkEpPMHkUIsXUAPB
	 mBM4h89hVrLm4dlfZatV5A+ZyUqZEBzD9i9lRa3x8wIRGt91GW1+jAICyHDfqm8Qnw
	 npRvPIZvJgXTyxwDIzcmx+/m7ySuujhFj6IQwdNXDswvqEvu1W4yiK4Y79tl1xnnVC
	 XiMaeIGjTRB2qqe7hUYt9+jQIKdbXwz4ceKXRNtM9fLbekioJzIxRwNjRO0PRpCiWB
	 oU9F8nuwQ8pUQ==
Date: Sun, 22 Nov 2026 15:27:14 +0000
To: Miklos Szeredi <miklos@szeredi.hu>
From: Yun Wang <7z0423arsenova@proton.me>
Cc: Bernd Schubert <bernd@bsbernd.com>, Joanne Koong <joannelkoong@gmail.com>, Shuah Khan <shuah@kernel.org>, fuse-devel@lists.linux.dev, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/5] selftests/fuse: test a sync-init device before the mount
Message-ID: <20261122152514.467423-6-7z0423arsenova@proton.me>
In-Reply-To: <20261122152514.467423-1-7z0423arsenova@proton.me>
References: <20261122152514.467423-1-7z0423arsenova@proton.me>
Feedback-ID: 227066774:user:proton
X-Pm-Message-ID: ecc7b75af6301248a35516565cc5009ce75ca7b1
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Yun Wang <arsenova@a7snv.com>

A server that uses FUSE_DEV_IOC_SYNC_INIT has the device before the
mount does.  Test that calls which must not block don't wait for the
mount, and that waiters armed before it see its requests.

The fuse_dev tests never mount.  poll(2) with a zero timeout or
together with an eventfd, epoll_ctl(2), read(2) and splice(2) on an
O_NONBLOCK device, FUSE_IO_URING_CMD_REGISTER through io_uring, and the
close of a device opened with O_ASYNC must return at once; where they
wait for the mount, the harness kills them after two seconds.  A
blocking read(2) must still wait, until an alarm ends it.  Two tests
send a REGISTER or a POLL_ADD from one thread and a NOP to the same
ring from another: the NOP must not have to wait for the mount, as it
does when the first thread sleeps with the ring's uring_lock held.
Each test also runs on a device without sync init, which must keep
failing at once.

The mount tests arm epoll (level triggered, edge triggered and with
EPOLLEXCLUSIVE) or a multishot io_uring poll before the mount, then
mount as root of a new user namespace.  The waiter has to report
FUSE_INIT, and then a request queued after the mount, without being
armed again.

io_uring is set up with its system calls, with the 128-byte SQEs that
FUSE_IO_URING_CMD_* needs, so the test doesn't depend on liburing.  No
privileges are needed; the tests skip without /dev/fuse,
FUSE_DEV_IOC_SYNC_INIT, io_uring or user namespaces, and the uring_cmd
test also without CONFIG_FUSE_IO_URING.

Signed-off-by: Yun Wang <arsenova@a7snv.com>
---
 .../selftests/filesystems/fuse/.gitignore     |   1 +
 .../selftests/filesystems/fuse/Makefile       |   2 +
 .../filesystems/fuse/fuse_sync_init_test.c    | 532 ++++++++++++++++++
 3 files changed, 535 insertions(+)
 create mode 100644 tools/testing/selftests/filesystems/fuse/fuse_sync_init=
_test.c

diff --git a/tools/testing/selftests/filesystems/fuse/.gitignore b/tools/te=
sting/selftests/filesystems/fuse/.gitignore
index 7c787313e69b..9066f735cfe2 100644
--- a/tools/testing/selftests/filesystems/fuse/.gitignore
+++ b/tools/testing/selftests/filesystems/fuse/.gitignore
@@ -6,3 +6,4 @@ write_extend_eof_test
 fuse_acl_cache_test
 fuse_symlink_cache_test
 fuse_readdir_cache_test
+fuse_sync_init_test
diff --git a/tools/testing/selftests/filesystems/fuse/Makefile b/tools/test=
ing/selftests/filesystems/fuse/Makefile
index e3ae3acff113..15630db378ca 100644
--- a/tools/testing/selftests/filesystems/fuse/Makefile
+++ b/tools/testing/selftests/filesystems/fuse/Makefile
@@ -7,11 +7,13 @@ TEST_GEN_PROGS +=3D write_extend_eof_test
 TEST_GEN_PROGS +=3D fuse_acl_cache_test
 TEST_GEN_PROGS +=3D fuse_symlink_cache_test
 TEST_GEN_PROGS +=3D fuse_readdir_cache_test
+TEST_GEN_PROGS +=3D fuse_sync_init_test
 TEST_GEN_FILES :=3D fuse_mnt
=20
 include ../../lib.mk
=20
 $(OUTPUT)/write_extend_eof_test: LDLIBS +=3D -lpthread
+$(OUTPUT)/fuse_sync_init_test: LDLIBS +=3D -lpthread
=20
 VAR_CFLAGS :=3D $(shell pkg-config fuse3 --cflags 2>/dev/null)
 ifeq ($(VAR_CFLAGS),)
diff --git a/tools/testing/selftests/filesystems/fuse/fuse_sync_init_test.c=
 b/tools/testing/selftests/filesystems/fuse/fuse_sync_init_test.c
new file mode 100644
index 000000000000..98eab737ea8a
--- /dev/null
+++ b/tools/testing/selftests/filesystems/fuse/fuse_sync_init_test.c
@@ -0,0 +1,532 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * A /dev/fuse fd in sync-init mode (FUSE_DEV_IOC_SYNC_INIT) is opened bef=
ore
+ * the mount.  Until the mount, calls that must not block have to return a=
t
+ * once, and waiters armed before it have to see the requests that come af=
ter
+ * it.  A call that sleeps instead makes its test hit the harness timeout.
+ *
+ * The fuse_dev tests never mount.  Each runs on a sync-init fd, where
+ * non-blocking calls must not wait (while a blocking read still does), an=
d
+ * on an fd without sync init, which keeps failing at once.  The mount tes=
ts
+ * mount as root of a new user namespace.
+ */
+#define _GNU_SOURCE
+#include <errno.h>
+#include <fcntl.h>
+#include <poll.h>
+#include <pthread.h>
+#include <sched.h>
+#include <signal.h>
+#include <string.h>
+#include <time.h>
+#include <unistd.h>
+#include <sys/epoll.h>
+#include <sys/eventfd.h>
+#include <sys/ioctl.h>
+#include <sys/mman.h>
+#include <sys/mount.h>
+#include <sys/stat.h>
+#include <sys/syscall.h>
+#include <sys/uio.h>
+#include <sys/xattr.h>
+#include <linux/fuse.h>
+#include <linux/io_uring.h>
+
+#include "kselftest_harness.h"
+
+#define MNT=09"/tmp/fuse"
+
+/* A minimal io_uring with 128-byte SQEs, which FUSE_IO_URING_CMD_* needs =
*/
+struct ring {
+=09int fd;
+=09void *sq, *cq;
+=09size_t sq_sz, cq_sz, sqes_sz;
+=09unsigned int *sq_tail, *sq_mask, *sq_array;
+=09unsigned int *cq_head, *cq_tail, *cq_mask;
+=09struct io_uring_sqe *sqes;
+=09struct io_uring_cqe *cqes;
+};
+
+static void ring_exit(struct ring *r)
+{
+=09if (r->sq && r->sq !=3D MAP_FAILED)
+=09=09munmap(r->sq, r->sq_sz);
+=09if (r->cq && r->cq !=3D MAP_FAILED)
+=09=09munmap(r->cq, r->cq_sz);
+=09if (r->sqes && r->sqes !=3D MAP_FAILED)
+=09=09munmap(r->sqes, r->sqes_sz);
+=09if (r->fd >=3D 0)
+=09=09close(r->fd);
+=09memset(r, 0, sizeof(*r));
+=09r->fd =3D -1;
+}
+
+static int ring_init(struct ring *r, unsigned int entries)
+{
+=09struct io_uring_params p =3D { .flags =3D IORING_SETUP_SQE128 };
+=09char *sq, *cq;
+
+=09memset(r, 0, sizeof(*r));
+=09r->fd =3D syscall(__NR_io_uring_setup, entries, &p);
+=09if (r->fd < 0)
+=09=09return -1;
+=09r->sq_sz =3D p.sq_off.array + p.sq_entries * sizeof(unsigned int);
+=09r->cq_sz =3D p.cq_off.cqes + p.cq_entries * sizeof(*r->cqes);
+=09r->sqes_sz =3D p.sq_entries * 2 * sizeof(*r->sqes);
+=09sq =3D r->sq =3D mmap(NULL, r->sq_sz, PROT_READ | PROT_WRITE, MAP_SHARE=
D,
+=09=09=09  r->fd, IORING_OFF_SQ_RING);
+=09cq =3D r->cq =3D mmap(NULL, r->cq_sz, PROT_READ | PROT_WRITE, MAP_SHARE=
D,
+=09=09=09  r->fd, IORING_OFF_CQ_RING);
+=09r->sqes =3D mmap(NULL, r->sqes_sz, PROT_READ | PROT_WRITE, MAP_SHARED,
+=09=09       r->fd, IORING_OFF_SQES);
+=09if (sq =3D=3D MAP_FAILED || cq =3D=3D MAP_FAILED || r->sqes =3D=3D MAP_=
FAILED) {
+=09=09int err =3D errno;
+
+=09=09ring_exit(r);
+=09=09errno =3D err;
+=09=09return -1;
+=09}
+=09r->sq_tail =3D (void *)(sq + p.sq_off.tail);
+=09r->sq_mask =3D (void *)(sq + p.sq_off.ring_mask);
+=09r->sq_array =3D (void *)(sq + p.sq_off.array);
+=09r->cq_head =3D (void *)(cq + p.cq_off.head);
+=09r->cq_tail =3D (void *)(cq + p.cq_off.tail);
+=09r->cq_mask =3D (void *)(cq + p.cq_off.ring_mask);
+=09r->cqes =3D (void *)(cq + p.cq_off.cqes);
+=09return 0;
+}
+
+/* Return a zeroed SQE at the tail; publish via ring_commit()/ring_submit(=
). */
+static struct io_uring_sqe *ring_sqe(struct ring *r)
+{
+=09unsigned int idx =3D *r->sq_tail & *r->sq_mask;
+=09struct io_uring_sqe *sqe =3D &r->sqes[idx * 2];
+
+=09memset(sqe, 0, 2 * sizeof(*sqe));
+=09return sqe;
+}
+
+static void ring_commit(struct ring *r)
+{
+=09unsigned int tail =3D *r->sq_tail;
+=09unsigned int idx =3D tail & *r->sq_mask;
+
+=09r->sq_array[idx] =3D idx;
+=09__atomic_store_n(r->sq_tail, tail + 1, __ATOMIC_RELEASE);
+}
+
+static int ring_enter(struct ring *r)
+{
+=09return syscall(__NR_io_uring_enter, r->fd, 1, 0, 0, NULL, 0);
+}
+
+static int ring_submit(struct ring *r)
+{
+=09ring_commit(r);
+=09return ring_enter(r);
+}
+
+/* Wait up to @ms for a CQE; return 1 and its result in @res, or 0. */
+static int ring_cqe(struct ring *r, int ms, int *res)
+{
+=09struct pollfd pfd =3D { .fd =3D r->fd, .events =3D POLLIN };
+=09unsigned int head =3D *r->cq_head;
+
+=09if (head =3D=3D __atomic_load_n(r->cq_tail, __ATOMIC_ACQUIRE)) {
+=09=09int ret;
+
+=09=09do {
+=09=09=09ret =3D poll(&pfd, 1, ms);
+=09=09} while (ret < 0 && errno =3D=3D EINTR);
+=09=09if (ret !=3D 1 ||
+=09=09    head =3D=3D __atomic_load_n(r->cq_tail, __ATOMIC_ACQUIRE))
+=09=09=09return 0;
+=09}
+=09*res =3D r->cqes[head & *r->cq_mask].res;
+=09__atomic_store_n(r->cq_head, head + 1, __ATOMIC_RELEASE);
+=09return 1;
+}
+
+static int open_dev(struct __test_metadata *const _metadata, bool sync_ini=
t)
+{
+=09int fd =3D open("/dev/fuse", O_RDWR | O_NONBLOCK);
+
+=09if (fd < 0)
+=09=09SKIP(return -1, "/dev/fuse: %s", strerror(errno));
+=09if (sync_init && ioctl(fd, FUSE_DEV_IOC_SYNC_INIT)) {
+=09=09if (errno =3D=3D ENOTTY) {
+=09=09=09close(fd);
+=09=09=09SKIP(return -1, "no FUSE_DEV_IOC_SYNC_INIT (v6.18)");
+=09=09}
+=09=09ASSERT_EQ(0, errno);
+=09}
+=09return fd;
+}
+
+FIXTURE(fuse_dev) {
+=09int fd;
+};
+
+FIXTURE_VARIANT(fuse_dev) {
+=09bool sync_init;
+=09int err;=09/* what a non-blocking call gets before the mount */
+};
+
+FIXTURE_VARIANT_ADD(fuse_dev, sync_init) {
+=09.sync_init =3D true,
+=09.err =3D EAGAIN,
+};
+
+FIXTURE_VARIANT_ADD(fuse_dev, plain) {
+=09.err =3D EPERM,
+};
+
+FIXTURE_SETUP(fuse_dev)
+{
+=09self->fd =3D open_dev(_metadata, variant->sync_init);
+}
+
+FIXTURE_TEARDOWN(fuse_dev)
+{
+=09if (self->fd >=3D 0)
+=09=09close(self->fd);
+}
+
+TEST_F_TIMEOUT(fuse_dev, poll, 2)
+{
+=09struct pollfd pfd =3D { .fd =3D self->fd, .events =3D POLLIN };
+
+=09ASSERT_EQ(!variant->sync_init, poll(&pfd, 1, 0));
+=09if (!variant->sync_init)
+=09=09ASSERT_EQ(POLLERR, pfd.revents);
+}
+
+static void *kick(void *efd)
+{
+=09usleep(100 * 1000);
+=09eventfd_write(*(int *)efd, 1);
+=09return NULL;
+}
+
+/* libfuse's sync-init worker polls the fd together with an eventfd. */
+TEST_F_TIMEOUT(fuse_dev, poll_eventfd, 2)
+{
+=09struct pollfd pfd[2] =3D {
+=09=09{ .fd =3D self->fd, .events =3D POLLIN },
+=09=09{ .fd =3D eventfd(0, 0), .events =3D POLLIN },
+=09};
+=09pthread_t thread;
+
+=09ASSERT_LE(0, pfd[1].fd);
+=09ASSERT_EQ(0, pthread_create(&thread, NULL, kick, &pfd[1].fd));
+=09ASSERT_LE(1, poll(pfd, 2, -1));
+=09if (variant->sync_init) {
+=09=09ASSERT_EQ(0, pfd[0].revents);
+=09=09ASSERT_EQ(POLLIN, pfd[1].revents);
+=09} else {
+=09=09ASSERT_EQ(POLLERR, pfd[0].revents);
+=09}
+=09ASSERT_EQ(0, pthread_join(thread, NULL));
+=09close(pfd[1].fd);
+}
+
+TEST_F_TIMEOUT(fuse_dev, epoll, 2)
+{
+=09struct epoll_event ev =3D { .events =3D EPOLLIN };
+=09int epfd =3D epoll_create1(0);
+
+=09ASSERT_LE(0, epfd);
+=09ASSERT_EQ(0, epoll_ctl(epfd, EPOLL_CTL_ADD, self->fd, &ev));
+=09ASSERT_EQ(!variant->sync_init, epoll_wait(epfd, &ev, 1, 0));
+=09if (!variant->sync_init)
+=09=09ASSERT_EQ(EPOLLERR, ev.events);
+=09close(epfd);
+}
+
+TEST_F_TIMEOUT(fuse_dev, read, 2)
+{
+=09char buf[FUSE_MIN_READ_BUFFER];
+
+=09ASSERT_EQ(-1, read(self->fd, buf, sizeof(buf)));
+=09ASSERT_EQ(variant->err, errno);
+}
+
+TEST_F_TIMEOUT(fuse_dev, splice, 2)
+{
+=09int p[2];
+
+=09ASSERT_EQ(0, pipe(p));
+=09ASSERT_EQ(-1, splice(self->fd, NULL, p[1], NULL,
+=09=09=09     FUSE_MIN_READ_BUFFER, 0));
+=09ASSERT_EQ(variant->err, errno);
+=09close(p[0]);
+=09close(p[1]);
+}
+
+/*
+ * open(2) doesn't call ->fasync for O_ASYNC, but the last close turns it
+ * off through ->fasync, and that must not wait for a mount either.
+ */
+TEST_F_TIMEOUT(fuse_dev, fasync_close, 2)
+{
+=09int fd =3D open("/dev/fuse", O_RDWR | O_ASYNC);
+
+=09ASSERT_LE(0, fd);
+=09if (variant->sync_init)
+=09=09ASSERT_EQ(0, ioctl(fd, FUSE_DEV_IOC_SYNC_INIT));
+=09ASSERT_EQ(0, close(fd));
+}
+
+static void nop(int sig)
+{
+}
+
+/* A blocking read still waits for the mount, until a signal ends it. */
+TEST_F_TIMEOUT(fuse_dev, read_blocking, 3)
+{
+=09struct sigaction sa =3D { .sa_handler =3D nop };=09/* no SA_RESTART */
+=09char buf[FUSE_MIN_READ_BUFFER];
+
+=09ASSERT_EQ(0, sigaction(SIGALRM, &sa, NULL));
+=09ASSERT_EQ(0, fcntl(self->fd, F_SETFL, 0));
+=09alarm(1);
+=09ASSERT_EQ(-1, read(self->fd, buf, sizeof(buf)));
+=09alarm(0);
+=09ASSERT_EQ(variant->sync_init ? EINTR : EPERM, errno);
+}
+
+static void prep(struct io_uring_sqe *sqe, __u8 opcode, int fd)
+{
+=09sqe->opcode =3D opcode;
+=09sqe->fd =3D fd;
+=09if (opcode =3D=3D IORING_OP_URING_CMD)
+=09=09sqe->cmd_op =3D FUSE_IO_URING_CMD_REGISTER;
+=09else
+=09=09sqe->poll32_events =3D POLLIN;
+}
+
+TEST_F_TIMEOUT(fuse_dev, uring_cmd, 2)
+{
+=09struct ring r;
+=09int res;
+
+=09if (ring_init(&r, 1))
+=09=09SKIP(return, "io_uring_setup: %s", strerror(errno));
+=09prep(ring_sqe(&r), IORING_OP_URING_CMD, self->fd);
+=09ASSERT_EQ(1, ring_submit(&r));
+=09ASSERT_EQ(1, ring_cqe(&r, 1000, &res));
+=09ring_exit(&r);
+=09if (res =3D=3D -EOPNOTSUPP)
+=09=09SKIP(return, "no CONFIG_FUSE_IO_URING");
+=09ASSERT_EQ(-variant->err, res);
+}
+
+static void *submit(void *r)
+{
+=09ring_enter(r);
+=09return NULL;
+}
+
+/*
+ * io_uring issues the command and polls the fd with the ring's uring_lock
+ * held: another thread submitting to the same ring must not have to wait
+ * for the mount.
+ */
+static void ring_lock(struct __test_metadata *const _metadata, int fd,
+=09=09      __u8 opcode)
+{
+=09struct timespec t0, t1;
+=09pthread_t thread;
+=09struct ring r;
+
+=09if (ring_init(&r, 4))
+=09=09SKIP(return, "io_uring_setup: %s", strerror(errno));
+=09prep(ring_sqe(&r), opcode, fd);
+=09ring_commit(&r);
+=09ASSERT_EQ(0, pthread_create(&thread, NULL, submit, &r));
+=09usleep(100 * 1000);
+=09ring_sqe(&r)->opcode =3D IORING_OP_NOP;
+=09ring_commit(&r);
+=09clock_gettime(CLOCK_MONOTONIC, &t0);
+=09ASSERT_EQ(1, ring_enter(&r));
+=09clock_gettime(CLOCK_MONOTONIC, &t1);
+=09ASSERT_GT(500, (t1.tv_sec - t0.tv_sec) * 1000 +
+=09=09       (t1.tv_nsec - t0.tv_nsec) / 1000000);
+=09ASSERT_EQ(0, pthread_join(thread, NULL));
+=09ring_exit(&r);
+}
+
+TEST_F_TIMEOUT(fuse_dev, ring_lock_cmd, 2)
+{
+=09ring_lock(_metadata, self->fd, IORING_OP_URING_CMD);
+}
+
+TEST_F_TIMEOUT(fuse_dev, ring_lock_poll, 2)
+{
+=09ring_lock(_metadata, self->fd, IORING_OP_POLL_ADD);
+}
+
+FIXTURE(mount) {
+=09int fd;
+=09int epfd;
+=09struct ring r;
+=09int err;=09/* errno of the thread that mounts or calls getxattr */
+};
+
+FIXTURE_VARIANT(mount) {
+=09__u32 events;=09/* epoll events, or 0 for a multishot io_uring poll */
+};
+
+FIXTURE_VARIANT_ADD(mount, epoll) {
+=09.events =3D EPOLLIN,
+};
+
+/* Edge triggered: only a wakeup reports the request after the mount */
+FIXTURE_VARIANT_ADD(mount, epoll_et) {
+=09.events =3D EPOLLIN | EPOLLET,
+};
+
+/* The forwarded wakeup has to reach an exclusive waiter too */
+FIXTURE_VARIANT_ADD(mount, epoll_excl) {
+=09.events =3D EPOLLIN | EPOLLEXCLUSIVE,
+};
+
+FIXTURE_VARIANT_ADD(mount, io_uring) {
+};
+
+static int write_file(const char *path, const char *val)
+{
+=09int fd =3D open(path, O_WRONLY);
+=09int ret =3D fd < 0 ? -1 : write(fd, val, strlen(val));
+
+=09if (fd >=3D 0)
+=09=09close(fd);
+=09return ret =3D=3D (int)strlen(val) ? 0 : -1;
+}
+
+FIXTURE_SETUP(mount)
+{
+=09uid_t uid =3D getuid();
+=09gid_t gid =3D getgid();
+=09char map[32];
+
+=09snprintf(map, sizeof(map), "0 %u 1", uid);
+=09if (unshare(CLONE_NEWUSER | CLONE_NEWNS) ||
+=09    write_file("/proc/self/setgroups", "deny") ||
+=09    write_file("/proc/self/uid_map", map))
+=09=09SKIP(return, "no user namespace: %s", strerror(errno));
+=09snprintf(map, sizeof(map), "0 %u 1", gid);
+=09ASSERT_EQ(0, write_file("/proc/self/gid_map", map));
+=09ASSERT_EQ(0, mount(NULL, "/", NULL, MS_REC | MS_PRIVATE, NULL));
+=09ASSERT_EQ(0, mount("tmpfs", "/tmp", "tmpfs", 0, NULL));
+=09ASSERT_EQ(0, mkdir(MNT, 0755));
+=09self->epfd =3D -1;
+=09self->r.fd =3D -1;
+=09self->fd =3D open_dev(_metadata, true);
+}
+
+FIXTURE_TEARDOWN(mount)
+{
+=09umount2(MNT, MNT_DETACH);
+=09if (self->epfd >=3D 0)
+=09=09close(self->epfd);
+=09ring_exit(&self->r);
+=09if (self->fd >=3D 0)
+=09=09close(self->fd);
+}
+
+static void *do_mount(void *arg)
+{
+=09FIXTURE_DATA(mount) * self =3D arg;
+=09char opts[64];
+
+=09snprintf(opts, sizeof(opts),
+=09=09 "fd=3D%d,rootmode=3D40000,user_id=3D0,group_id=3D0", self->fd);
+=09self->err =3D mount("fuse", MNT, "fuse", 0, opts) ? errno : 0;
+=09return NULL;
+}
+
+static void *do_getxattr(void *arg)
+{
+=09FIXTURE_DATA(mount) * self =3D arg;
+=09char buf[16];
+
+=09self->err =3D getxattr(MNT, "user.x", buf, sizeof(buf)) < 0 ? errno : 0=
;
+=09return NULL;
+}
+
+/* Answer the queued requests: FUSE_INIT, and -ENODATA for the rest. */
+static void serve(struct __test_metadata *const _metadata, int fd)
+{
+=09struct fuse_init_out init =3D {
+=09=09.major =3D FUSE_KERNEL_VERSION,
+=09=09.minor =3D FUSE_KERNEL_MINOR_VERSION,
+=09=09.max_write =3D 4096,
+=09};
+=09__u64 buf[FUSE_MIN_READ_BUFFER / sizeof(__u64)];
+=09struct fuse_in_header *in =3D (void *)buf;
+=09struct fuse_out_header out;
+=09struct iovec iov[2] =3D { { &out, sizeof(out) }, { &init, sizeof(init) =
} };
+=09int n;
+
+=09while (read(fd, buf, sizeof(buf)) >=3D (ssize_t)sizeof(*in)) {
+=09=09n =3D in->opcode =3D=3D FUSE_INIT ? 2 : 1;
+=09=09out.unique =3D in->unique;
+=09=09out.error =3D n =3D=3D 2 ? 0 : -ENODATA;
+=09=09out.len =3D sizeof(out) + (n =3D=3D 2 ? sizeof(init) : 0);
+=09=09ASSERT_EQ((ssize_t)out.len, writev(fd, iov, n));
+=09}
+}
+
+/* Wait up to @ms for the waiter armed before the mount; return its events=
. */
+static int wait_event(FIXTURE_DATA(mount) * self, int ms)
+{
+=09struct epoll_event ev;
+=09int res;
+
+=09if (self->epfd >=3D 0)
+=09=09return epoll_wait(self->epfd, &ev, 1, ms) =3D=3D 1 ? ev.events : 0;
+=09return ring_cqe(&self->r, ms, &res) ? res : 0;
+}
+
+TEST_F_TIMEOUT(mount, wake, 5)
+{
+=09struct epoll_event ev =3D { .events =3D variant->events };
+=09pthread_t thread;
+
+=09/* Arm the waiter before the mount */
+=09if (variant->events) {
+=09=09self->epfd =3D epoll_create1(0);
+=09=09ASSERT_LE(0, self->epfd);
+=09=09ASSERT_EQ(0, epoll_ctl(self->epfd, EPOLL_CTL_ADD, self->fd, &ev));
+=09} else {
+=09=09struct io_uring_sqe *sqe;
+
+=09=09if (ring_init(&self->r, 4))
+=09=09=09SKIP(return, "io_uring_setup: %s", strerror(errno));
+=09=09sqe =3D ring_sqe(&self->r);
+=09=09prep(sqe, IORING_OP_POLL_ADD, self->fd);
+=09=09sqe->len =3D IORING_POLL_ADD_MULTI;
+=09=09ASSERT_EQ(1, ring_submit(&self->r));
+=09}
+
+=09/* mount(2) waits for the reply to FUSE_INIT */
+=09ASSERT_EQ(0, pthread_create(&thread, NULL, do_mount, self));
+=09ASSERT_EQ(POLLIN, wait_event(self, 1000));
+=09serve(_metadata, self->fd);
+=09ASSERT_EQ(0, pthread_join(thread, NULL));
+=09ASSERT_EQ(0, self->err);
+
+=09/* Drain any leftover mount events before testing a new request */
+=09while (wait_event(self, 100))
+=09=09serve(_metadata, self->fd);
+
+=09/* A request after the mount, without arming the waiter again */
+=09ASSERT_EQ(0, pthread_create(&thread, NULL, do_getxattr, self));
+=09ASSERT_EQ(POLLIN, wait_event(self, 1000));
+=09serve(_metadata, self->fd);
+=09ASSERT_EQ(0, pthread_join(thread, NULL));
+=09ASSERT_EQ(ENODATA, self->err);
+}
+
+TEST_HARNESS_MAIN
--=20
2.56.1


