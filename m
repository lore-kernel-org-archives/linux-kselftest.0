Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=50.112.246.219
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793217972;
	b=AVCn0laEhT5Rvgjko+2Kkf2kdWnmOiccG90XTLdbUFIKJBrJZOseD1mCAHuQNyxSZzHn
	 iKMthDE3p+ZyHz+zL7TwrNPrvDmDYaeVROSjQ2HW2LrFbhfO+Li2BXMmbfX6AEumLtrEw
	 8sllPjPXqKEdE0oHbI86Sca6ZNS9haDtYmeco8ypei/xTFoTx4gaY6X+wTzBAHtqe6+eu
	 b/UPs+crUoALIZQa197gmW/MzKFjGDZpt/+/QIZ1Jlb1pnVVLR4AozSQAfinvDiwd3xNz
	 lWJEz1Hey9em27NykMAmGcA8989BpRnQ4DEz5mlX93zqeyk+5SLIJVRL5/Hud9jqTHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793217972;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=RJeIednyIqxahDHdc1Rl4XA1df6rYIQc2aop5yTdIx4=;
	b=ext3LklAptIoAwau6005KGLSPHQAS21QgTlrT2l6XsVZsqN3YjNRejGxZNcIQJkZmpfm
	 2sdWiwqDOoCrO/sY29YH5ypQ+UmLjWRj+ZbB/7gRMU1+Rq5xUc650+qZs8rF9r2dvAmtA
	 /WI8VLd/Q+7BtYwMqfQhhq5bUiiFW3fsWGkm86MjygCbWtc9MHMD5rav0zjif+1D2p9oe
	 UX9oGTw5UHc4YpUMdyahmQlk/rLTaPRfIw5/EZqf6hzpvI8dcfLhrpGX5M1lR1a+LC70m
	 kB2dOc2m0wp9r+UOICpRXfYvjCMeFdGFZux52sBpql5NExI89mDJrmQXb/yCBrQsQwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.com;
	spf=pass smtp.mailfrom=amazon.com;
	dkim=pass header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=UhgS1nmT;
	arc=none smtp.remote-ip=50.112.246.219
Received: from pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com [50.112.246.219])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DFC1606A31D
	for <linux-kselftest@vger.kernel.org>; Wed, 28 Oct 2026 20:06:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DFC1606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=UhgS1nmT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1793217971; x=1824753971;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RJeIednyIqxahDHdc1Rl4XA1df6rYIQc2aop5yTdIx4=;
  b=UhgS1nmT5to+vL4A2UnumkU8jkE4vZXoGhwvVPRPCY2wRez8ggeVBSef
   LsTPuC+OD+lSWCJa8z+8DFgd1U7InYL2i/4OfU2ioaN2y6wClRunSk6iw
   jeOxxAihawr9k2+wwBjYaNCD59Zm3xmJaP+rlF2V6sOpLELB6R9BH5PK4
   xqtJ7vwMio3U8mX3k3TVIwu6IYi+G78ADR95pNHSevfhy0n0/+v2epv2G
   kfVnEpYgL4VlzbZToAqsxo9Ks17Wc1m/UZSifAUvXmQ35eAOKzLNx8FE5
   93SRmdiU0fMYRPojOd84Q8mbSOlT6ooX6G2WAAC69YwWzai7vwMMSAzEI
   w==;
X-CSE-ConnectionGUID: ZfnKaRDvSaq2h8ErFBu1IQ==
X-CSE-MsgGUID: SQZo1kaXS72sPufc37FQ0Q==
X-IronPort-AV: E=Sophos;i="6.27,183,1787011200"; 
   d="scan'208";a="32278817"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 20:06:11 +0000
Received: from EX19MTAUWC002.ant.amazon.com [205.251.233.111:14732]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.15.208:2525] with esmtp (Farcaster)
 id ebab4d8d-0f45-4e13-b5bf-54b8ba5ef547; Wed, 28 Oct 2026 20:06:10 +0000 (UTC)
X-Farcaster-Flow-ID: ebab4d8d-0f45-4e13-b5bf-54b8ba5ef547
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC002.ant.amazon.com (10.250.64.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Wed, 28 Oct 2026 20:06:10 +0000
Received: from dev-dsk-jamz-1e-e35f4cd9.us-east-1.amazon.com (10.189.35.140)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Wed, 28 Oct 2026 20:06:09 +0000
From: Jimmy Zuber <jamz@amazon.com>
To: Miklos Szeredi <miklos@szeredi.hu>
CC: <fuse-devel@lists.linux.dev>, <linux-kselftest@vger.kernel.org>, "Shuah
 Khan" <shuah@kernel.org>, Bernd Schubert <bernd@bsbernd.com>, Jim Harris
	<jiharris@nvidia.com>, Horst Birthelmer <horst@birthelmer.de>, Luis Henriques
	<luis@igalia.com>, NeilBrown <neil@brown.name>
Subject: [PATCH v5 2/2] selftests/fuse: add test for FUSE_OPEN_ATOMIC
Date: Wed, 28 Oct 2026 20:04:59 +0000
Message-ID: <20261028200459.2922951-3-jamz@amazon.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261028200459.2922951-1-jamz@amazon.com>
References: <20261028200459.2922951-1-jamz@amazon.com>
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
X-ClientProxiedBy: EX19D031UWC002.ant.amazon.com (10.13.139.212) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

Add atomic_open_test. A raw /dev/fuse server counts the requests the
kernel sends for open() and create, and each test checks both the result
and that FUSE_OPEN_ATOMIC replaces LOOKUP + OPEN or LOOKUP + CREATE
where it should: new, existing and missing names, directories, O_TRUNC,
permission checks after the reply, and a reply the kernel rejects.

Each test runs against a server that replies -ENOSYS to
FUSE_OPEN_ATOMIC, one that implements it, and one that also sets
FUSE_ATOMIC_O_TRUNC, in its own mount namespace. The tests skip on
kernels older than protocol 7.48.

Assisted-by: Claude:claude-opus-5-5 [Claude-Code]
Signed-off-by: Jimmy Zuber <jamz@amazon.com>
---
 .../selftests/filesystems/fuse/.gitignore     |   1 +
 .../selftests/filesystems/fuse/Makefile       |   3 +-
 .../filesystems/fuse/atomic_open_test.c       | 552 ++++++++++++++++++
 3 files changed, 555 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/filesystems/fuse/atomic_open_test.c

diff --git a/tools/testing/selftests/filesystems/fuse/.gitignore b/tools/testing/selftests/filesystems/fuse/.gitignore
index 7c787313e69b6..faac6d969ef94 100644
--- a/tools/testing/selftests/filesystems/fuse/.gitignore
+++ b/tools/testing/selftests/filesystems/fuse/.gitignore
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
+atomic_open_test
 fuse_mnt
 fusectl_test
 test_syncfs
diff --git a/tools/testing/selftests/filesystems/fuse/Makefile b/tools/testing/selftests/filesystems/fuse/Makefile
index e3ae3acff1139..8390d6019513b 100644
--- a/tools/testing/selftests/filesystems/fuse/Makefile
+++ b/tools/testing/selftests/filesystems/fuse/Makefile
@@ -3,7 +3,7 @@
 CFLAGS += -Wall -O2 -g $(KHDR_INCLUDES)
 
 TEST_GEN_PROGS := fusectl_test test_syncfs
-TEST_GEN_PROGS += write_extend_eof_test
+TEST_GEN_PROGS += write_extend_eof_test atomic_open_test
 TEST_GEN_PROGS += fuse_acl_cache_test
 TEST_GEN_PROGS += fuse_symlink_cache_test
 TEST_GEN_PROGS += fuse_readdir_cache_test
@@ -12,6 +12,7 @@ TEST_GEN_FILES := fuse_mnt
 include ../../lib.mk
 
 $(OUTPUT)/write_extend_eof_test: LDLIBS += -lpthread
+$(OUTPUT)/atomic_open_test: LDLIBS += -lpthread
 
 VAR_CFLAGS := $(shell pkg-config fuse3 --cflags 2>/dev/null)
 ifeq ($(VAR_CFLAGS),)
diff --git a/tools/testing/selftests/filesystems/fuse/atomic_open_test.c b/tools/testing/selftests/filesystems/fuse/atomic_open_test.c
new file mode 100644
index 0000000000000..a42870ee85a04
--- /dev/null
+++ b/tools/testing/selftests/filesystems/fuse/atomic_open_test.c
@@ -0,0 +1,552 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Test the requests that open() and create send with and without
+ * FUSE_OPEN_ATOMIC, against a raw /dev/fuse server.
+ *
+ * Requires root to mount fuse.
+ */
+#define _GNU_SOURCE
+#include <errno.h>
+#include <fcntl.h>
+#include <grp.h>
+#include <pthread.h>
+#include <sched.h>
+#include <stddef.h>
+#include <stdint.h>
+#include <stdio.h>
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
+#define MAX_WRITE	(128 * 1024)
+#define MAX_ENTRIES	16
+#define NOBODY		65534
+
+struct entry {
+	uint64_t parent;
+	char name[64];
+	uint64_t nodeid;
+	uint32_t mode;
+};
+
+/* Server state, shared with the responder thread */
+struct server {
+	int fd;
+	int atomic, atomic_o_trunc;
+	/* Protocol minor version of the kernel, from FUSE_INIT */
+	uint32_t minor;
+	struct entry ent[MAX_ENTRIES];
+	int nent;
+	int nr_lookup, nr_create, nr_open, nr_open_atomic, nr_setattr;
+	int nr_enosys;
+	/* Requests that carried O_TRUNC */
+	int nr_trunc;
+	/* Send fuse_open_out without backing_id_64, as older servers do */
+	int short_open;
+	/* Reply to FUSE_OPEN_ATOMIC with an opened file and a zero nodeid */
+	int open_no_nodeid;
+};
+
+static size_t open_out_size(struct server *s)
+{
+	if (s->short_open)
+		return offsetof(struct fuse_open_out, backing_id_64);
+	return sizeof(struct fuse_open_out);
+}
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
+	/* Errors here are teardown races (device closed on unmount) */
+	if (writev(fd, iov, data ? 2 : 1) < 0)
+		return;
+}
+
+static struct entry *find_in(struct server *s, uint64_t parent,
+			     const char *name)
+{
+	int i;
+
+	for (i = 0; i < s->nent; i++)
+		if (s->ent[i].parent == parent && !strcmp(s->ent[i].name, name))
+			return &s->ent[i];
+	return NULL;
+}
+
+static struct entry *add_in(struct server *s, uint64_t parent,
+			    const char *name, uint32_t mode)
+{
+	struct entry *e = &s->ent[s->nent];
+
+	if (s->nent >= MAX_ENTRIES)
+		return NULL;
+	e->parent = parent;
+	snprintf(e->name, sizeof(e->name), "%.63s", name);
+	e->nodeid = FUSE_ROOT_ID + 1 + s->nent++;
+	e->mode = mode;
+	return e;
+}
+
+static struct entry *add(struct server *s, const char *name, uint32_t mode)
+{
+	return add_in(s, FUSE_ROOT_ID, name, mode);
+}
+
+/* A NULL entry is a negative entry, cached like a found one */
+static void fill_entry(struct fuse_entry_out *out, struct entry *e)
+{
+	memset(out, 0, sizeof(*out));
+	out->entry_valid = 3600;
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
+static void do_open_atomic(struct server *s, struct fuse_in_header *ih)
+{
+	struct fuse_create_in *in = (void *)(ih + 1);
+	const char *name = (char *)(in + 1);
+	struct entry *e = find_in(s, ih->nodeid, name);
+	struct {
+		struct fuse_entry_out entry;
+		struct fuse_open_out open;
+	} out = {0};
+	size_t len = sizeof(out.entry) + open_out_size(s);
+
+	if (ih->opcode == FUSE_OPEN_ATOMIC && !s->atomic) {
+		s->nr_enosys++;
+		return reply(s->fd, ih->unique, -ENOSYS, NULL, 0);
+	}
+	if (ih->opcode == FUSE_CREATE)
+		s->nr_create++;
+	else
+		s->nr_open_atomic++;
+	if (in->flags & O_TRUNC)
+		s->nr_trunc++;
+	if (e && (in->flags & O_CREAT) && (in->flags & O_EXCL))
+		return reply(s->fd, ih->unique, -EEXIST, NULL, 0);
+	if (e && !(in->flags & O_CREAT) && s->open_no_nodeid) {
+		fill_entry(&out.entry, NULL);
+		return reply(s->fd, ih->unique, 0, &out, len);
+	}
+	if (!e && !(in->flags & O_CREAT)) {
+		fill_entry(&out.entry, NULL);
+		return reply(s->fd, ih->unique, 0, &out.entry,
+			     sizeof(out.entry));
+	}
+	if (e && !S_ISREG(e->mode)) {
+		fill_entry(&out.entry, e);
+		return reply(s->fd, ih->unique, 0, &out.entry,
+			     sizeof(out.entry));
+	}
+	if (!e) {
+		e = add_in(s, ih->nodeid, name, S_IFREG | in->mode);
+		if (!e)
+			return reply(s->fd, ih->unique, -ENOSPC, NULL, 0);
+		if (ih->opcode == FUSE_OPEN_ATOMIC)
+			out.open.open_flags = FOPEN_CREATED;
+	}
+	fill_entry(&out.entry, e);
+	reply(s->fd, ih->unique, 0, &out, len);
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
+			s->minor = in->minor;
+			out.major = FUSE_KERNEL_VERSION;
+			out.minor = FUSE_KERNEL_MINOR_VERSION;
+			out.max_readahead = in->max_readahead;
+			out.max_write = MAX_WRITE;
+			out.max_background = 16;
+			out.congestion_threshold = 12;
+			if (s->atomic_o_trunc)
+				out.flags = FUSE_ATOMIC_O_TRUNC;
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
+			out.attr.ino = FUSE_ROOT_ID;
+			out.attr.mode = S_IFDIR | 0777;
+			out.attr.nlink = 2;
+			for (i = 0; i < s->nent; i++) {
+				if (s->ent[i].nodeid == ih->nodeid) {
+					fill_entry(&eo, &s->ent[i]);
+					out.attr = eo.attr;
+					out.attr_valid = eo.attr_valid;
+				}
+			}
+			reply(s->fd, ih->unique, 0, &out, sizeof(out));
+			break;
+		}
+		case FUSE_LOOKUP: {
+			struct fuse_entry_out out;
+			struct entry *e;
+
+			s->nr_lookup++;
+			e = find_in(s, ih->nodeid, (char *)(ih + 1));
+			fill_entry(&out, e);
+			reply(s->fd, ih->unique, 0, &out, sizeof(out));
+			break;
+		}
+		case FUSE_CREATE:
+		case FUSE_OPEN_ATOMIC:
+			do_open_atomic(s, ih);
+			break;
+		case FUSE_OPEN: {
+			struct fuse_open_in *in = (void *)(ih + 1);
+			struct fuse_open_out out = {0};
+
+			s->nr_open++;
+			if (in->flags & O_TRUNC)
+				s->nr_trunc++;
+			reply(s->fd, ih->unique, 0, &out, open_out_size(s));
+			break;
+		}
+		case FUSE_OPENDIR: {
+			struct fuse_open_out out = {0};
+
+			reply(s->fd, ih->unique, 0, &out, open_out_size(s));
+			break;
+		}
+		case FUSE_RELEASE:
+		case FUSE_FLUSH:
+		case FUSE_RELEASEDIR:
+			reply(s->fd, ih->unique, 0, NULL, 0);
+			break;
+		case FUSE_FORGET:
+		case FUSE_BATCH_FORGET:
+			break;
+		default:
+			reply(s->fd, ih->unique, -ENOSYS, NULL, 0);
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
+	int atomic_o_trunc;
+};
+
+FIXTURE_VARIANT_ADD(fuse, atomic)
+{
+	.atomic = 1,
+};
+
+FIXTURE_VARIANT_ADD(fuse, atomic_trunc)
+{
+	.atomic = 1,
+	.atomic_o_trunc = 1,
+};
+
+FIXTURE_VARIANT_ADD(fuse, plain)
+{
+	.atomic = 0,
+};
+
+static void cleanup(FIXTURE_DATA(fuse) *self)
+{
+	if (self->mounted)
+		umount2(self->dir, MNT_DETACH);
+	self->mounted = 0;
+	/* The detached server thread may still use self->srv */
+	if (self->srv && self->srv != MAP_FAILED && self->srv->fd >= 0)
+		close(self->srv->fd);
+	if (self->srv && self->srv != MAP_FAILED)
+		self->srv->fd = -1;
+	if (self->dir[0])
+		rmdir(self->dir);
+	self->dir[0] = '\0';
+}
+
+FIXTURE_SETUP(fuse)
+{
+	char opts[128];
+	struct stat st;
+	pthread_t t;
+	int ret;
+
+	if (geteuid() != 0)
+		SKIP(return, "need root to mount fuse");
+
+	/* Mounts made by the test go away with its mount namespace */
+	ASSERT_EQ(0, unshare(CLONE_NEWNS));
+	ASSERT_EQ(0, mount(NULL, "/", NULL, MS_REC | MS_PRIVATE, NULL));
+
+	self->srv = mmap(NULL, sizeof(*self->srv), PROT_READ | PROT_WRITE,
+			 MAP_SHARED | MAP_ANONYMOUS, -1, 0);
+	ASSERT_NE(MAP_FAILED, self->srv);
+	self->srv->fd = -1;
+	self->srv->atomic = variant->atomic;
+	self->srv->atomic_o_trunc = variant->atomic_o_trunc;
+	add(self->srv, "ro", S_IFREG | 0444);
+	add(self->srv, "rw", S_IFREG | 0644);
+	add(self->srv, "dir", S_IFDIR | 0755);
+
+	self->srv->fd = open("/dev/fuse", O_RDWR);
+	if (self->srv->fd < 0 && (errno == ENOENT || errno == ENODEV)) {
+		cleanup(self);
+		SKIP(return, "no /dev/fuse");
+	}
+	ASSERT_GE(self->srv->fd, 0);
+
+	strcpy(self->dir, "/tmp/fuse_aopen_XXXXXX");
+	if (!mkdtemp(self->dir)) {
+		self->dir[0] = '\0';
+		cleanup(self);
+	}
+	ASSERT_NE('\0', self->dir[0]);
+
+	snprintf(opts, sizeof(opts),
+		 "fd=%d,rootmode=40000,user_id=0,group_id=0,default_permissions,allow_other",
+		 self->srv->fd);
+	ret = mount("fuse", self->dir, "fuse", 0, opts);
+	if (ret)
+		cleanup(self);
+	ASSERT_EQ(0, ret);
+	self->mounted = 1;
+
+	ret = pthread_create(&t, NULL, server_thread, self->srv);
+	if (!ret) {
+		pthread_detach(t);
+		/* Wait for FUSE_INIT: the root GETATTR is queued behind it */
+		ret = stat(self->dir, &st);
+	}
+	/* The harness skips teardown when setup fails or skips */
+	if (ret || self->srv->minor < 48)
+		cleanup(self);
+	ASSERT_EQ(0, ret);
+	if (self->srv->minor < 48)
+		SKIP(return, "kernel without FUSE_OPEN_ATOMIC (protocol 7.48)");
+}
+
+FIXTURE_TEARDOWN(fuse)
+{
+	cleanup(self);
+}
+
+/* Open @name as an unprivileged user and return the errno, or 0 */
+static int open_as_nobody(struct __test_metadata *_metadata, const char *dir,
+			  const char *name, int flags)
+{
+	char path[128];
+	int status, fd;
+	pid_t pid;
+
+	snprintf(path, sizeof(path), "%s/%s", dir, name);
+	pid = fork();
+	ASSERT_GE(pid, 0);
+	if (pid == 0) {
+		if (setgroups(0, NULL) || setgid(NOBODY) || setuid(NOBODY))
+			_exit(255);
+		fd = open(path, flags, 0644);
+		_exit(fd < 0 ? errno : 0);
+	}
+	ASSERT_EQ(pid, waitpid(pid, &status, 0));
+	ASSERT_TRUE(WIFEXITED(status));
+	/* 255: the child could not drop its privileges */
+	ASSERT_NE(255, WEXITSTATUS(status));
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
+static void open_close(struct __test_metadata *_metadata, const char *dir,
+		       const char *name, int flags)
+{
+	int fd = open_at(dir, name, flags);
+
+	ASSERT_GE(fd, 0);
+	close(fd);
+}
+
+TEST_F(fuse, create_new)
+{
+	open_close(_metadata, self->dir, "a", O_CREAT | O_WRONLY);
+	open_close(_metadata, self->dir, "b", O_CREAT | O_EXCL | O_WRONLY);
+
+	EXPECT_EQ(0, self->srv->nr_open);
+	EXPECT_EQ(variant->atomic ? 2 : 0, self->srv->nr_open_atomic);
+	EXPECT_EQ(variant->atomic ? 0 : 2, self->srv->nr_lookup);
+	EXPECT_EQ(variant->atomic ? 0 : 2, self->srv->nr_create);
+}
+
+TEST_F(fuse, create_existing)
+{
+	ASSERT_EQ(-1, open_at(self->dir, "ro", O_CREAT | O_EXCL | O_WRONLY));
+	EXPECT_EQ(EEXIST, errno);
+	/* The VFS checks the open after the reply */
+	EXPECT_EQ(EACCES, open_as_nobody(_metadata, self->dir, "ro",
+					 O_CREAT | O_RDWR));
+	EXPECT_EQ(0, self->srv->nr_create);
+}
+
+TEST_F(fuse, open_existing)
+{
+	/* The VFS checks the open after the reply */
+	EXPECT_EQ(EACCES, open_as_nobody(_metadata, self->dir, "ro", O_RDWR));
+	open_close(_metadata, self->dir, "rw", O_RDONLY);
+	ASSERT_EQ(-1, open_at(self->dir, "missing", O_RDONLY));
+	EXPECT_EQ(ENOENT, errno);
+	/* A zero nodeid is cached like a negative LOOKUP */
+	ASSERT_EQ(-1, open_at(self->dir, "missing", O_RDONLY));
+	EXPECT_EQ(ENOENT, errno);
+
+	EXPECT_EQ(variant->atomic ? 0 : 1, self->srv->nr_open);
+	EXPECT_EQ(variant->atomic ? 3 : 0, self->srv->nr_open_atomic);
+	EXPECT_EQ(variant->atomic ? 0 : 3, self->srv->nr_lookup);
+}
+
+TEST_F(fuse, open_trunc)
+{
+	open_close(_metadata, self->dir, "rw", O_WRONLY | O_TRUNC);
+	/* As a shell "> ro" */
+	open_close(_metadata, self->dir, "ro", O_CREAT | O_TRUNC | O_WRONLY);
+
+	EXPECT_EQ(0, self->srv->nr_create);
+	if (variant->atomic_o_trunc) {
+		/* FUSE_OPEN truncates, after a LOOKUP */
+		EXPECT_EQ(0, self->srv->nr_open_atomic);
+		EXPECT_EQ(2, self->srv->nr_lookup);
+		EXPECT_EQ(2, self->srv->nr_open);
+		EXPECT_EQ(2, self->srv->nr_trunc);
+		EXPECT_EQ(0, self->srv->nr_setattr);
+	} else if (variant->atomic) {
+		/* The server opens the file and SETATTR truncates it */
+		EXPECT_EQ(2, self->srv->nr_open_atomic);
+		EXPECT_EQ(0, self->srv->nr_lookup);
+		EXPECT_EQ(0, self->srv->nr_open);
+		EXPECT_EQ(0, self->srv->nr_trunc);
+		EXPECT_EQ(2, self->srv->nr_setattr);
+	} else {
+		EXPECT_EQ(2, self->srv->nr_lookup);
+		EXPECT_EQ(2, self->srv->nr_open);
+		EXPECT_EQ(2, self->srv->nr_setattr);
+	}
+}
+
+TEST_F(fuse, open_directory)
+{
+	/* The server returns the entry only, and the VFS opens it */
+	open_close(_metadata, self->dir, "dir", O_RDONLY);
+	EXPECT_EQ(variant->atomic ? 1 : 0, self->srv->nr_open_atomic);
+	EXPECT_EQ(variant->atomic ? 0 : 1, self->srv->nr_lookup);
+}
+
+TEST_F(fuse, short_open_out)
+{
+	self->srv->short_open = 1;
+	open_close(_metadata, self->dir, "a", O_CREAT | O_WRONLY);
+	open_close(_metadata, self->dir, "rw", O_RDWR);
+
+	EXPECT_EQ(variant->atomic ? 2 : 0, self->srv->nr_open_atomic);
+	EXPECT_EQ(variant->atomic ? 0 : 1, self->srv->nr_open);
+}
+
+TEST_F(fuse, open_reply_no_nodeid)
+{
+	int fd;
+
+	/* An opened file needs a nodeid */
+	self->srv->open_no_nodeid = 1;
+	fd = open_at(self->dir, "rw", O_RDONLY);
+	if (variant->atomic) {
+		ASSERT_EQ(-1, fd);
+		EXPECT_EQ(EIO, errno);
+	} else {
+		ASSERT_GE(fd, 0);
+		close(fd);
+	}
+}
+
+TEST_F(fuse, open_atomic_enosys)
+{
+	/* After -ENOSYS the kernel sends FUSE_LOOKUP */
+	self->srv->atomic = 0;
+	open_close(_metadata, self->dir, "rw", O_RDONLY);
+	open_close(_metadata, self->dir, "a", O_CREAT | O_WRONLY);
+
+	EXPECT_EQ(1, self->srv->nr_enosys);
+	EXPECT_EQ(0, self->srv->nr_open_atomic);
+	EXPECT_EQ(2, self->srv->nr_lookup);
+	EXPECT_EQ(1, self->srv->nr_open);
+	EXPECT_EQ(1, self->srv->nr_create);
+}
+
+TEST_F(fuse, name_too_long)
+{
+	char path[1200];
+	int len;
+
+	/* Longer than the 1024 byte limit of a server without FUSE_MAX_PAGES */
+	len = snprintf(path, sizeof(path), "%s/", self->dir);
+	memset(path + len, 'x', 1100);
+	path[len + 1100] = '\0';
+	ASSERT_EQ(-1, open(path, O_CREAT | O_WRONLY, 0644));
+	EXPECT_EQ(ENAMETOOLONG, errno);
+	EXPECT_EQ(0, self->srv->nr_enosys);
+	EXPECT_EQ(0, self->srv->nr_open_atomic);
+	EXPECT_EQ(0, self->srv->nr_create);
+}
+
+TEST_HARNESS_MAIN
-- 
2.50.1

