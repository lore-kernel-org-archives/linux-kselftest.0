Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=52.13.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792505911;
	b=oHpWDq40E8VlS5Baq76FROhj920c72VHmRv9fYfzP6pP7ZYJiGInVvIEKV4xdQ67fcEv
	 niboeJItvW+eLd0e6qSN0GieU9FZzXNqRLwQ9pxjQ0e/IF7JsJZor7ZlGI97NmhvU6+/n
	 FervMgScrP+XUvLqU/t/JUxY9qgAaqy7HhG+4dZrKQ97otl4+QLyYlSeMkqzk08ZtvM9X
	 9R1SBaDBWOyBVhnofeI7cm8lA9ZSZvJOc6jMUO1xg7+I0+2kkkVGoE+rN9epxbw/vZ51d
	 59O1UKnyVfY9/u7QdMIbAKYi2dBTzEJ9zN+cw+BPUqyQFAgn/cn1oG9jrPPiOdwb9NQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792505911;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=qJoYhtyG+pEeRAPv7dq6pc+TJZVxrroFXkmjlCL7deo=;
	b=qUtidzuFh3xHWY0rmdadMlC+D5x6+kKByt7+KhDSGCWnBvMFjkn0uv/D+8uqwGjI17Nd
	 6ccdVrLATvD75jlRmWpgKwSsNzvRo4U7VqrwV8RvCmbtwpFF7exmJsq+BFX3uyIjeQwr4
	 CMlkCLhabE4noQEayDwaJU7UAGlw5DPrNjen21Ke+OEmU9KSDRWvS9zwyYEkQMvhMfFqQ
	 /ZUXODzoLoJ8A80ha0LzsgIu1q8MHrEQPEu2w0PhJMMRur5Omqv08Oo7JizY8sDzzOytm
	 xsvv1cPSrdtA0vyWkAKZWsHa8fIcg8FEeNkbA+CajZLsYLUAUvhGcY5zipM8bT5rsdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.com;
	spf=pass smtp.mailfrom=amazon.com;
	dkim=pass header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=jWxPuk9u;
	arc=none smtp.remote-ip=52.13.214.179
Received: from pdx-out-005.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-005.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.13.214.179])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33B28606A32D
	for <linux-kselftest@vger.kernel.org>; Tue, 20 Oct 2026 14:18:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33B28606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=jWxPuk9u
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1792505911; x=1824041911;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qJoYhtyG+pEeRAPv7dq6pc+TJZVxrroFXkmjlCL7deo=;
  b=jWxPuk9u2LYSf0Y/bqp1lmMjmXgxvhRo8UfdFcpfjBOSD0rjTilVQhPX
   u26bF+7XUv1toF60nsD5wWFxN6EuOS7qSdMv2nbmgOG04r3lQg+/Vja1y
   xugpbF/eE2+mNLVGf5TT+MSOaCJw0kOyuCHkvDa5gAk/1EvR1HhNS1Up4
   s7yqR+ZMdUOA18ZSvv6YV5Zl/QLYufbo5AS9oBwljvVGwW76YyB1CanGF
   RX5dPsHQabl19SrBFtj5fBhFdSz/Rj6GYB8esBJkndd5mL70tMxmgsyi1
   0urgrWZOxEKNZ8OclGGxWl3e/JaJkSVFjBB4DzaAJW616rz5iJAPhMSWH
   A==;
X-CSE-ConnectionGUID: wR/6skeqSzauAmoJDrvOvA==
X-CSE-MsgGUID: tx0G/IjcQv+PJtdHWcm3Yg==
X-IronPort-AV: E=Sophos;i="6.27,168,1787011200"; 
   d="scan'208";a="31726056"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-005.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 14:18:30 +0000
Received: from EX19MTAUWB002.ant.amazon.com [205.251.233.48:13572]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.51.105:2525] with esmtp (Farcaster)
 id 6a68bffa-a065-4404-aa6e-009557be59a6; Tue, 20 Oct 2026 14:18:30 +0000 (UTC)
X-Farcaster-Flow-ID: 6a68bffa-a065-4404-aa6e-009557be59a6
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49;
 Tue, 20 Oct 2026 14:18:30 +0000
Received: from dev-dsk-jamz-1e-e35f4cd9.us-east-1.amazon.com (10.189.35.140)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.53;
 Tue, 20 Oct 2026 14:18:29 +0000
From: jamz <jamz@amazon.com>
To: Miklos Szeredi <miklos@szeredi.hu>
CC: Jimmy Zuber <jamz@amazon.com>, <fuse-devel@lists.linux.dev>,
	<linux-kselftest@vger.kernel.org>, Shuah Khan <shuah@kernel.org>, "Bernd
 Schubert" <bernd@bsbernd.com>, Jim Harris <jiharris@nvidia.com>, "Horst
 Birthelmer" <horst@birthelmer.de>, Luis Henriques <luis@igalia.com>,
	NeilBrown <neil@brown.name>
Subject: [PATCH 3/3] selftests/fuse: add test for FUSE_OPEN_ATOMIC
Date: Tue, 20 Oct 2026 14:16:47 +0000
Message-ID: <20261020141647.3271341-4-jamz@amazon.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261020141647.3271341-1-jamz@amazon.com>
References: <20261020141647.3271341-1-jamz@amazon.com>
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
Content-Type: text/plain
X-ClientProxiedBy: EX19D031UWC003.ant.amazon.com (10.13.139.252) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

From: Jimmy Zuber <jamz@amazon.com>

Check the requests sent when opening and creating new, existing, missing
and expired names, against a raw /dev/fuse server with and without
FUSE_OPEN_ATOMIC, and that opening an existing read-only file is still
permission checked.

Assisted-by: Claude:claude-opus-5-5 [Claude-Code]
Signed-off-by: Jimmy Zuber <jamz@amazon.com>
---
 .../selftests/filesystems/fuse/.gitignore     |   1 +
 .../selftests/filesystems/fuse/Makefile       |   3 +-
 .../filesystems/fuse/atomic_open_test.c       | 473 ++++++++++++++++++
 3 files changed, 476 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/filesystems/fuse/atomic_open_test.c

diff --git a/tools/testing/selftests/filesystems/fuse/.gitignore b/tools/testing/selftests/filesystems/fuse/.gitignore
index b5b03db1118c..6e529fee96d4 100644
--- a/tools/testing/selftests/filesystems/fuse/.gitignore
+++ b/tools/testing/selftests/filesystems/fuse/.gitignore
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
+atomic_open_test
 fuse_mnt
 fusectl_test
 test_syncfs
diff --git a/tools/testing/selftests/filesystems/fuse/Makefile b/tools/testing/selftests/filesystems/fuse/Makefile
index c2de8d225447..2fe20f0e9143 100644
--- a/tools/testing/selftests/filesystems/fuse/Makefile
+++ b/tools/testing/selftests/filesystems/fuse/Makefile
@@ -3,7 +3,7 @@
 CFLAGS += -Wall -O2 -g $(KHDR_INCLUDES)
 
 TEST_GEN_PROGS := fusectl_test test_syncfs
-TEST_GEN_PROGS += write_extend_eof_test
+TEST_GEN_PROGS += write_extend_eof_test atomic_open_test
 TEST_GEN_FILES := fuse_mnt
 
 # fuse_acl_cache_test requires libfuse3; add it only when the library is present.
@@ -16,6 +16,7 @@ endif
 include ../../lib.mk
 
 $(OUTPUT)/write_extend_eof_test: LDLIBS += -lpthread
+$(OUTPUT)/atomic_open_test: LDLIBS += -lpthread
 
 VAR_CFLAGS := $(shell pkg-config fuse --cflags 2>/dev/null)
 ifeq ($(VAR_CFLAGS),)
diff --git a/tools/testing/selftests/filesystems/fuse/atomic_open_test.c b/tools/testing/selftests/filesystems/fuse/atomic_open_test.c
new file mode 100644
index 000000000000..880367d6cb96
--- /dev/null
+++ b/tools/testing/selftests/filesystems/fuse/atomic_open_test.c
@@ -0,0 +1,473 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Test open() and create with and without FUSE_OPEN_ATOMIC.
+ *
+ * Requires root to mount fuse.
+ */
+#define _GNU_SOURCE
+#include <errno.h>
+#include <fcntl.h>
+#include <pthread.h>
+#include <stdint.h>
+#include <string.h>
+#include <unistd.h>
+#include <sys/mman.h>
+#include <sys/mount.h>
+#include <sys/stat.h>
+#include <sys/uio.h>
+#include <sys/wait.h>
+#include <linux/fuse.h>
+
+#include "../../kselftest_harness.h"
+
+#define FUSE_ROOT_ID	1
+#define MAX_WRITE	(128 * 1024)
+#define MAX_ENTRIES	16
+#define NOBODY		65534
+
+struct entry {
+	char name[64];
+	uint64_t nodeid;
+	uint32_t mode;
+	uint64_t entry_valid;
+};
+
+/* Server state, shared with the responder thread. */
+struct server {
+	int fd;
+	int atomic;
+	struct entry ent[MAX_ENTRIES];
+	int nent;
+	int nr_lookup, nr_create, nr_open, nr_open_atomic, nr_setattr;
+};
+
+static void reply(int fd, uint64_t unique, int error, void *data, size_t len)
+{
+	struct fuse_out_header oh = {
+		.len = sizeof(oh) + (data ? len : 0),
+		.error = error,
+		.unique = unique,
+	};
+	struct iovec iov[2] = { { &oh, sizeof(oh) }, { data, len } };
+
+	/* Errors here are teardown races (device closed on unmount); ignore. */
+	if (writev(fd, iov, data ? 2 : 1) < 0)
+		return;
+}
+
+static struct entry *find(struct server *s, const char *name)
+{
+	int i;
+
+	for (i = 0; i < s->nent; i++)
+		if (!strcmp(s->ent[i].name, name))
+			return &s->ent[i];
+	return NULL;
+}
+
+static struct entry *add(struct server *s, const char *name, uint32_t mode)
+{
+	struct entry *e = &s->ent[s->nent];
+
+	snprintf(e->name, sizeof(e->name), "%.63s", name);
+	e->nodeid = FUSE_ROOT_ID + 1 + s->nent++;
+	e->mode = mode;
+	e->entry_valid = 3600;
+	return e;
+}
+
+/* A NULL entry is a negative entry, cached like a found one. */
+static void fill_entry(struct fuse_entry_out *out, struct entry *e)
+{
+	memset(out, 0, sizeof(*out));
+	out->entry_valid = e ? e->entry_valid : 3600;
+	if (!e)
+		return;
+	out->nodeid = e->nodeid;
+	out->attr_valid = 3600;
+	out->attr.ino = e->nodeid;
+	out->attr.mode = e->mode;
+	out->attr.nlink = S_ISDIR(e->mode) ? 2 : 1;
+	out->attr.blksize = 4096;
+}
+
+static void *server_thread(void *arg)
+{
+	struct server *s = arg;
+	static char buf[MAX_WRITE + 4096];
+
+	for (;;) {
+		ssize_t n = read(s->fd, buf, sizeof(buf));
+		struct fuse_in_header *ih = (void *)buf;
+
+		if (n < 0) {
+			if (errno == EINTR || errno == EAGAIN)
+				continue;
+			return NULL;	/* device closed on unmount */
+		}
+		if (n < (ssize_t)sizeof(*ih))
+			continue;
+
+		switch (ih->opcode) {
+		case FUSE_INIT: {
+			struct fuse_init_in *in = (void *)(ih + 1);
+			struct fuse_init_out out = {0};
+
+			out.major = FUSE_KERNEL_VERSION;
+			out.minor = FUSE_KERNEL_MINOR_VERSION;
+			out.max_readahead = in->max_readahead;
+			out.max_write = MAX_WRITE;
+			out.max_background = 16;
+			out.congestion_threshold = 12;
+			out.flags = FUSE_INIT_EXT;
+			reply(s->fd, ih->unique, 0, &out, sizeof(out));
+			break;
+		}
+		case FUSE_GETATTR:
+		case FUSE_SETATTR: {
+			struct fuse_attr_out out = {0};
+			struct fuse_entry_out eo;
+			int i;
+
+			if (ih->opcode == FUSE_SETATTR)
+				s->nr_setattr++;
+			out.attr_valid = 3600;
+			if (ih->nodeid == FUSE_ROOT_ID) {
+				out.attr.ino = FUSE_ROOT_ID;
+				out.attr.mode = S_IFDIR | 0777;
+				out.attr.nlink = 2;
+			}
+			for (i = 0; i < s->nent; i++) {
+				if (s->ent[i].nodeid == ih->nodeid) {
+					fill_entry(&eo, &s->ent[i]);
+					out.attr = eo.attr;
+				}
+			}
+			reply(s->fd, ih->unique, 0, &out, sizeof(out));
+			break;
+		}
+		case FUSE_LOOKUP: {
+			struct fuse_entry_out out;
+
+			s->nr_lookup++;
+			fill_entry(&out, find(s, (char *)(ih + 1)));
+			reply(s->fd, ih->unique, 0, &out, sizeof(out));
+			break;
+		}
+		case FUSE_CREATE:
+		case FUSE_OPEN_ATOMIC: {
+			struct fuse_create_in *in = (void *)(ih + 1);
+			const char *name = (char *)(in + 1);
+			struct entry *e = find(s, name);
+			struct {
+				struct fuse_entry_out entry;
+				struct fuse_open_out open;
+			} out = {0};
+
+			if (ih->opcode == FUSE_CREATE)
+				s->nr_create++;
+			else
+				s->nr_open_atomic++;
+			if (ih->opcode == FUSE_OPEN_ATOMIC && !s->atomic) {
+				reply(s->fd, ih->unique, -ENOSYS, NULL, 0);
+				break;
+			}
+			if (e && (in->flags & O_CREAT) &&
+			    (in->flags & O_EXCL)) {
+				reply(s->fd, ih->unique, -EEXIST, NULL, 0);
+				break;
+			}
+			if (!e && !(in->flags & O_CREAT)) {
+				fill_entry(&out.entry, NULL);
+				reply(s->fd, ih->unique, 0, &out.entry,
+				      sizeof(out.entry));
+				break;
+			}
+			if (e && (!S_ISREG(e->mode) || (in->flags & O_TRUNC))) {
+				fill_entry(&out.entry, e);
+				reply(s->fd, ih->unique, 0, &out.entry,
+				      sizeof(out.entry));
+				break;
+			}
+			if (!e) {
+				e = add(s, name, S_IFREG | in->mode);
+				if (ih->opcode == FUSE_OPEN_ATOMIC)
+					out.open.open_flags = FOPEN_CREATED;
+			}
+			fill_entry(&out.entry, e);
+			reply(s->fd, ih->unique, 0, &out, sizeof(out));
+			break;
+		}
+		case FUSE_TMPFILE: {
+			struct fuse_create_in *in = (void *)(ih + 1);
+			struct entry e = {
+				.nodeid = 100,
+				.mode = S_IFREG | in->mode,
+				.entry_valid = 3600,
+			};
+			struct {
+				struct fuse_entry_out entry;
+				struct fuse_open_out open;
+			} out = {0};
+
+			fill_entry(&out.entry, &e);
+			reply(s->fd, ih->unique, 0, &out, sizeof(out));
+			break;
+		}
+		case FUSE_OPEN: {
+			struct fuse_open_out out = {0};
+
+			s->nr_open++;
+			reply(s->fd, ih->unique, 0, &out, sizeof(out));
+			break;
+		}
+		case FUSE_FLUSH:
+		case FUSE_RELEASE:
+			reply(s->fd, ih->unique, 0, NULL, 0);
+			break;
+		case FUSE_FORGET:
+		case FUSE_BATCH_FORGET:
+			break;
+		default:
+			reply(s->fd, ih->unique, -EOPNOTSUPP, NULL, 0);
+			break;
+		}
+	}
+}
+
+FIXTURE(fuse)
+{
+	struct server *srv;
+	char dir[64];
+	int mounted;
+};
+
+FIXTURE_VARIANT(fuse)
+{
+	int atomic;
+};
+
+FIXTURE_VARIANT_ADD(fuse, atomic)
+{
+	.atomic = 1,
+};
+
+FIXTURE_VARIANT_ADD(fuse, plain)
+{
+	.atomic = 0,
+};
+
+FIXTURE_SETUP(fuse)
+{
+	char opts[128];
+	struct stat st;
+	pthread_t t;
+
+	if (geteuid() != 0)
+		SKIP(return, "need root to mount fuse");
+
+	self->srv = mmap(NULL, sizeof(*self->srv), PROT_READ | PROT_WRITE,
+			 MAP_SHARED | MAP_ANONYMOUS, -1, 0);
+	ASSERT_NE(MAP_FAILED, self->srv);
+	self->srv->atomic = variant->atomic;
+	add(self->srv, "ro", S_IFREG | 0444);
+	add(self->srv, "rw", S_IFREG | 0644);
+	add(self->srv, "stale", S_IFREG | 0644)->entry_valid = 0;
+
+	self->srv->fd = open("/dev/fuse", O_RDWR);
+	ASSERT_GE(self->srv->fd, 0);
+
+	strcpy(self->dir, "/tmp/fuse_aopen_XXXXXX");
+	ASSERT_NE(NULL, mkdtemp(self->dir));
+
+	snprintf(opts, sizeof(opts),
+		 "fd=%d,rootmode=40000,user_id=0,group_id=0,default_permissions,allow_other",
+		 self->srv->fd);
+	ASSERT_EQ(0, mount("fuse", self->dir, "fuse", 0, opts));
+	self->mounted = 1;
+
+	ASSERT_EQ(0, pthread_create(&t, NULL, server_thread, self->srv));
+	pthread_detach(t);
+
+	/* Wait for FUSE_INIT: the root GETATTR is queued behind it */
+	ASSERT_EQ(0, stat(self->dir, &st));
+}
+
+FIXTURE_TEARDOWN(fuse)
+{
+	if (self->mounted)
+		umount2(self->dir, MNT_DETACH);
+	if (self->srv && self->srv != MAP_FAILED) {
+		if (self->srv->fd > 0)
+			close(self->srv->fd);
+		munmap(self->srv, sizeof(*self->srv));
+	}
+	if (self->dir[0])
+		rmdir(self->dir);
+}
+
+/* Open @name as an unprivileged user and return the errno, or 0. */
+static int open_as_nobody(const char *dir, const char *name, int flags)
+{
+	char path[128];
+	int status, fd;
+	pid_t pid;
+
+	snprintf(path, sizeof(path), "%s/%s", dir, name);
+	pid = fork();
+	if (pid < 0)
+		return -1;
+	if (pid == 0) {
+		if (setgid(NOBODY) || setuid(NOBODY))
+			_exit(255);
+		fd = open(path, flags, 0644);
+		_exit(fd < 0 ? errno : 0);
+	}
+	if (waitpid(pid, &status, 0) != pid || !WIFEXITED(status))
+		return -1;
+	return WEXITSTATUS(status);
+}
+
+static int open_at(const char *dir, const char *name, int flags)
+{
+	char path[128];
+
+	snprintf(path, sizeof(path), "%s/%s", dir, name);
+	return open(path, flags, 0644);
+}
+
+TEST_F(fuse, create_new)
+{
+	int fd;
+
+	fd = open_at(self->dir, "a", O_CREAT | O_WRONLY);
+	ASSERT_GE(fd, 0);
+	close(fd);
+
+	fd = open_at(self->dir, "b", O_CREAT | O_EXCL | O_WRONLY);
+	ASSERT_GE(fd, 0);
+	close(fd);
+
+	fd = open(self->dir, O_TMPFILE | O_RDWR, 0600);
+	ASSERT_GE(fd, 0);
+	close(fd);
+
+	EXPECT_EQ(0, self->srv->nr_open);
+	if (variant->atomic) {
+		EXPECT_EQ(2, self->srv->nr_open_atomic);
+		EXPECT_EQ(0, self->srv->nr_lookup);
+		EXPECT_EQ(0, self->srv->nr_create);
+	} else {
+		EXPECT_EQ(1, self->srv->nr_open_atomic);
+		EXPECT_EQ(2, self->srv->nr_lookup);
+		EXPECT_EQ(2, self->srv->nr_create);
+	}
+}
+
+TEST_F(fuse, create_existing)
+{
+	int fd;
+
+	ASSERT_EQ(-1, open_at(self->dir, "ro", O_CREAT | O_EXCL | O_WRONLY));
+	ASSERT_EQ(EEXIST, errno);
+	ASSERT_EQ(EACCES, open_as_nobody(self->dir, "ro", O_CREAT | O_RDWR));
+
+	/* Truncation goes through FUSE_OPEN and SETATTR. */
+	fd = open_at(self->dir, "rw", O_CREAT | O_TRUNC | O_WRONLY);
+	ASSERT_GE(fd, 0);
+	close(fd);
+
+	EXPECT_EQ(0, self->srv->nr_create);
+	EXPECT_EQ(1, self->srv->nr_open);
+	EXPECT_EQ(1, self->srv->nr_setattr);
+	if (variant->atomic) {
+		EXPECT_EQ(3, self->srv->nr_open_atomic);
+		EXPECT_EQ(0, self->srv->nr_lookup);
+	} else {
+		EXPECT_EQ(1, self->srv->nr_open_atomic);
+		EXPECT_EQ(2, self->srv->nr_lookup);
+	}
+}
+
+TEST_F(fuse, open_existing)
+{
+	int fd;
+
+	ASSERT_EQ(EACCES, open_as_nobody(self->dir, "ro", O_RDWR));
+
+	fd = open_at(self->dir, "ro", O_RDONLY);
+	ASSERT_GE(fd, 0);
+	close(fd);
+
+	ASSERT_EQ(-1, open_at(self->dir, "missing", O_RDONLY));
+	ASSERT_EQ(ENOENT, errno);
+	ASSERT_EQ(-1, open_at(self->dir, "missing", O_RDONLY));
+	ASSERT_EQ(ENOENT, errno);
+
+	EXPECT_EQ(1, self->srv->nr_open);
+	if (variant->atomic) {
+		EXPECT_EQ(2, self->srv->nr_open_atomic);
+		EXPECT_EQ(0, self->srv->nr_lookup);
+	} else {
+		EXPECT_EQ(1, self->srv->nr_open_atomic);
+		EXPECT_EQ(2, self->srv->nr_lookup);
+	}
+}
+
+TEST_F(fuse, open_stale)
+{
+	struct stat st;
+	int fd;
+
+	fd = open_at(self->dir, "stale", O_RDONLY);
+	ASSERT_GE(fd, 0);
+	close(fd);
+
+	/* The entry has expired, the reopen checks the name. */
+	fd = open_at(self->dir, "stale", O_RDONLY);
+	ASSERT_GE(fd, 0);
+	close(fd);
+
+	/* Another file takes the name: the open finds the new one. */
+	find(self->srv, "stale")->nodeid = 200;
+	fd = open_at(self->dir, "stale", O_RDONLY);
+	ASSERT_GE(fd, 0);
+	ASSERT_EQ(0, fstat(fd, &st));
+	EXPECT_EQ(200, st.st_ino);
+	close(fd);
+
+	if (variant->atomic) {
+		EXPECT_EQ(4, self->srv->nr_open_atomic);
+		EXPECT_EQ(0, self->srv->nr_lookup);
+		EXPECT_EQ(0, self->srv->nr_open);
+	} else {
+		EXPECT_EQ(1, self->srv->nr_open_atomic);
+		EXPECT_EQ(4, self->srv->nr_lookup);
+		EXPECT_EQ(3, self->srv->nr_open);
+	}
+}
+
+TEST_F(fuse, open_stale_first)
+{
+	char path[128];
+	struct stat st;
+	int fd;
+
+	/* The first FUSE_OPEN_ATOMIC comes from reopening a cached name */
+	snprintf(path, sizeof(path), "%s/stale", self->dir);
+	ASSERT_EQ(0, stat(path, &st));
+	fd = open(path, O_RDONLY);
+	ASSERT_GE(fd, 0);
+	close(fd);
+
+	EXPECT_EQ(1, self->srv->nr_open_atomic);
+	if (variant->atomic) {
+		EXPECT_EQ(1, self->srv->nr_lookup);
+		EXPECT_EQ(0, self->srv->nr_open);
+	} else {
+		EXPECT_EQ(2, self->srv->nr_lookup);
+		EXPECT_EQ(1, self->srv->nr_open);
+	}
+}
+
+TEST_HARNESS_MAIN
-- 
2.50.1

