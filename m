Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.155.198.111
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795220254;
	b=QWi4lc639rK2Uku4KZegZcW5YwZy8FlFmhouf2JiyB/pYVVDUhLA+r1tEIUakTQdu6oY
	 FfkQp3F3l2IzYHgFVMHqib+JiONwxRJamCwEe18p9w7CggL1PVeVwiKGuOwl/WnjOpBsO
	 MAZnrPnIkN/rT9Lt+olAw0jpjDnvp+TfFiU0NCF6UtzC+ITYYpnQK09OWJ5+IpBfFkzBv
	 rxc4HPy2ecIkCBVktvbkgj6MqZKJRrKVBqFUWZDehbYwMVG1AmWgKfT1dn2X/4rnmy2hZ
	 4HF75+GyrmwZOp3aTJty8SPvfXaXa3d6sdENTRbIGbZpH3LHnFy363zQh4j6PPp5hkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795220254;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=nf/eeAUZHpKTdwKmtykzuZ+4WBKSYJqYUwDpSZEpky4=;
	b=dVz3/c/LW/eFqdeCE4o+Fb90Ijlk0LThse4+8aiXpo1pa1gCTCuH2Z1TkbX3ZftO6dFD
	 9AvwNeoCUBft6nUqgo44YqKQXHoHeWkSsIn8jA9OLBAcZBhsIK6j5QoZUoJ41S8Wj2G4F
	 P/kWI+8fNAbohUR60leaurnJa3UOtvFCgmvWfatXm/wu/mlVWtckXwWe0lKkGv+KuEvJp
	 5+f3Li0r8J5z6+1YyaKboqgVTSzN3zFYOjFgbVnFb4OZLGuzgPUK+/yD1SebTXTWr18G+
	 Un7wLbODIAJLmjxBkqFj7wh6IAqfOPZEp7CXZMOSAmfYJN0Tt44NW61ZTuKzs8Xgs8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.com;
	spf=pass smtp.mailfrom=amazon.com;
	dkim=pass header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=iVQ7sSrX;
	arc=none smtp.remote-ip=35.155.198.111
Received: from pdx-out-009.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-009.esa.us-west-2.outbound.mail-perimeter.amazon.com [35.155.198.111])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E36CD606A33C
	for <linux-kselftest@vger.kernel.org>; Sat, 21 Nov 2026 00:17:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E36CD606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=iVQ7sSrX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1795220247; x=1826756247;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nf/eeAUZHpKTdwKmtykzuZ+4WBKSYJqYUwDpSZEpky4=;
  b=iVQ7sSrXruoAXEfr3DMxvEczY2Rz0juMKw9PmT2eOskDjLs+nHAjLpGI
   NCon27x83ec0fWQHi/Ddwu7L9B2meITMMH1aNqUkVqu0SuZDBQA2G3/ZN
   ft82BJGkMtFpWAjAydR1M35DQMlPJnvKDAC8SV8usgI0v+OAzHC1nu7/g
   MExNgmVZjSVU5/rdz/6Y7H+wzFnMnJLoK+dqs13CcCEh+KfKXX5VwBmKL
   uZwnHS+Qvy/Z+QPiXzfW1Hu729LcXqIIJZqdzqglCnnp9Qd17PKhULTCJ
   ls80OwTI2aPiY0Tsmsm6TLRGN+RYGenswii1yK/wfNjWNQSM3B1k1l+RW
   Q==;
X-CSE-ConnectionGUID: Q2wEFfsORmS9kKrt+VqCZQ==
X-CSE-MsgGUID: FErQhRTkRiylZb01VY0riQ==
X-IronPort-AV: E=Sophos;i="6.27,223,1787011200"; 
   d="scan'208";a="34664284"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-009.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2026 00:17:27 +0000
Received: from EX19MTAUWB001.ant.amazon.com [205.251.233.104:4711]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.22.116:2525] with esmtp (Farcaster)
 id e1628c10-5e3b-47ea-9ff9-c8f7e03c1334; Sat, 21 Nov 2026 00:17:26 +0000 (UTC)
X-Farcaster-Flow-ID: e1628c10-5e3b-47ea-9ff9-c8f7e03c1334
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.57;
 Sat, 21 Nov 2026 00:17:26 +0000
Received: from dev-dsk-jamz-1e-e35f4cd9.us-east-1.amazon.com (10.189.35.140)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.57;
 Sat, 21 Nov 2026 00:17:25 +0000
From: Jimmy Zuber <jamz@amazon.com>
To: Miklos Szeredi <miklos@szeredi.hu>
CC: <fuse-devel@lists.linux.dev>, <linux-kselftest@vger.kernel.org>, "Shuah
 Khan" <shuah@kernel.org>, Bernd Schubert <bernd@bsbernd.com>, Jim Harris
	<jiharris@nvidia.com>, Horst Birthelmer <horst@birthelmer.de>, Luis Henriques
	<luis@igalia.com>, NeilBrown <neil@brown.name>, Joanne Koong
	<joannelkoong@gmail.com>
Subject: [PATCH v9 3/3] selftests/fuse: add test for FUSE_OPEN_ATOMIC
Date: Sat, 21 Nov 2026 00:16:08 +0000
Message-ID: <20261121001608.996811-4-jamz@amazon.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261121001608.996811-1-jamz@amazon.com>
References: <20261121001608.996811-1-jamz@amazon.com>
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
X-ClientProxiedBy: EX19D031UWA002.ant.amazon.com (10.13.139.96) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

Add atomic_open_test. atomic_open_test contains a FUSE server that
reads requests from /dev/fuse and counts the requests that the kernel
sends for open(). Each test case checks the result of open(), and most
also check the requests: for names in and out of the dcache, with
O_CREAT, O_EXCL and O_TRUNC, for files that the VFS denies, for the
page cache, for replies that the kernel rejects, and for servers
without FUSE_OPEN_ATOMIC.

Each test case runs with three server configurations: without
FUSE_OPEN_ATOMIC, with it, and with it and FUSE_ATOMIC_O_TRUNC. Each
test case runs in its own mount namespace, and skips below protocol
7.48 or when the system refuses /dev/fuse or the fuse mount.

Signed-off-by: Jimmy Zuber <jamz@amazon.com>
---
 .../selftests/filesystems/fuse/.gitignore     |   1 +
 .../selftests/filesystems/fuse/Makefile       |   3 +-
 .../filesystems/fuse/atomic_open_test.c       | 920 ++++++++++++++++++
 3 files changed, 923 insertions(+), 1 deletion(-)
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
index 0000000000000..51cdf685bf678
--- /dev/null
+++ b/tools/testing/selftests/filesystems/fuse/atomic_open_test.c
@@ -0,0 +1,920 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Test the requests that open() sends with and without FUSE_OPEN_ATOMIC,
+ * against a raw /dev/fuse server.
+ *
+ * Requires root to mount fuse.
+ */
+#define _GNU_SOURCE
+#include <errno.h>
+#include <fcntl.h>
+#include <grp.h>
+#include <poll.h>
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
+#include <sys/syscall.h>
+#include <sys/uio.h>
+#include <sys/wait.h>
+#include <linux/errno.h>
+#include <linux/fuse.h>
+#include <linux/openat2.h>
+
+#include "../../kselftest_harness.h"
+
+#define MAX_WRITE	(128 * 1024)
+#define MAX_ENTRIES	16
+#define NOBODY		65534
+#define MNT		"/tmp/mnt"
+
+struct entry {
+	uint64_t parent;
+	char name[64];
+	uint64_t nodeid;
+	uint32_t mode;
+	uint64_t size;
+};
+
+/* Malformed FUSE_OPEN_ATOMIC replies for an existing regular file */
+enum bad_reply {
+	BAD_NONE,
+	BAD_SHORT,		/* without fuse_open_out */
+	BAD_ZERO_NODEID,
+	BAD_ROOT_NODEID,
+	BAD_PARTIAL_MASK,	/* without all of STATX_BASIC_STATS */
+	BAD_CREATED,		/* FUSE_OPEN_ATOMIC_CREATED */
+	BAD_EXCL,		/* opened for O_CREAT | O_EXCL */
+	BAD_FLAG,		/* an undefined reply flag */
+	BAD_RESERVED,		/* a nonzero reserved field */
+	BAD_HONORED,		/* an atomic_flags bit not requested */
+};
+
+/* Server state, shared with the server thread */
+struct server {
+	int fd;
+	/* Written with a struct event for each FORGET and RELEASE */
+	int event_pipe[2];
+	int atomic, atomic_o_trunc;
+	/* Protocol minor version of the kernel, from FUSE_INIT */
+	uint32_t minor;
+	struct entry ent[MAX_ENTRIES];
+	int nent;
+	int nr_lookup, nr_create, nr_open, nr_open_atomic, nr_setattr;
+	int nr_release, nr_read, nr_enosys, nr_root_getattr;
+	/* Requests that carried O_TRUNC */
+	int nr_trunc;
+	/* flags of the last FUSE_OPEN_ATOMIC */
+	uint32_t open_flags;
+	/* FUSE_OPEN_ATOMIC requests with other than the expected inputs */
+	int nr_bad_request;
+	/* FUSE_OPEN: -ENOSYS */
+	int no_open;
+	/* Reply -ENOENT for a missing name without O_CREAT */
+	int enoent;
+	/* Reply with only the entry for an existing file */
+	int entry_only;
+	/* Reply FUSE_OPEN_ATOMIC_CREATED for an existing file */
+	int created_existing;
+	enum bad_reply bad;
+};
+
+struct event {
+	uint32_t opcode;
+	uint64_t nodeid;
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
+	/* Errors here are teardown races (device closed on unmount) */
+	if (writev(fd, iov, data ? 2 : 1) < 0)
+		return;
+}
+
+static void post_event(struct server *s, uint32_t opcode, uint64_t nodeid)
+{
+	struct event ev = { opcode, nodeid };
+
+	/* The test reads the pipe; a full pipe means nobody waits */
+	if (write(s->event_pipe[1], &ev, sizeof(ev)) < 0)
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
+static struct entry *find_node(struct server *s, uint64_t nodeid)
+{
+	int i;
+
+	for (i = 0; i < s->nent; i++)
+		if (s->ent[i].nodeid == nodeid)
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
+static void fill_attr(struct fuse_attr *attr, struct entry *e)
+{
+	attr->ino = e->nodeid;
+	attr->mode = e->mode;
+	attr->nlink = S_ISDIR(e->mode) ? 2 : 1;
+	attr->size = e->size;
+	attr->blksize = 4096;
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
+	fill_attr(&out->attr, e);
+}
+
+static void fill_open_atomic(struct fuse_open_atomic_out *out,
+			     struct entry *e)
+{
+	memset(out, 0, sizeof(*out));
+	out->entry_valid = 3600;
+	if (!e)
+		return;
+	out->nodeid = e->nodeid;
+	out->attr_valid = 3600;
+	out->stat.mask = STATX_BASIC_STATS;
+	out->stat.ino = e->nodeid;
+	out->stat.mode = e->mode;
+	out->stat.nlink = S_ISDIR(e->mode) ? 2 : 1;
+	out->stat.size = e->size;
+	out->stat.blksize = 4096;
+}
+
+static void do_create(struct server *s, struct fuse_in_header *ih)
+{
+	struct fuse_create_in *in = (void *)(ih + 1);
+	const char *name = (char *)(in + 1);
+	struct entry *e = find_in(s, ih->nodeid, name);
+	struct {
+		struct fuse_entry_out entry;
+		struct fuse_open_out open;
+	} out = {0};
+
+	s->nr_create++;
+	if (e && (in->flags & O_EXCL))
+		return reply(s->fd, ih->unique, -EEXIST, NULL, 0);
+	if (!e)
+		e = add_in(s, ih->nodeid, name, S_IFREG | in->mode);
+	if (!e)
+		return reply(s->fd, ih->unique, -ENOSPC, NULL, 0);
+	fill_entry(&out.entry, e);
+	reply(s->fd, ih->unique, 0, &out, sizeof(out));
+}
+
+static void do_open_atomic(struct server *s, struct fuse_in_header *ih)
+{
+	struct fuse_open_atomic_in *in = (void *)(ih + 1);
+	const char *name = (char *)(in + 1);
+	struct entry *e = find_in(s, ih->nodeid, name);
+	struct fuse_open_atomic_out out;
+	size_t len = sizeof(out);
+	int excl = (in->flags & O_CREAT) && (in->flags & O_EXCL);
+
+	if (!s->atomic) {
+		s->nr_enosys++;
+		return reply(s->fd, ih->unique, -ENOSYS, NULL, 0);
+	}
+	s->nr_open_atomic++;
+	s->open_flags = in->flags;
+	s->nr_bad_request += in->open_flags || in->atomic_flags ||
+			     in->reserved[0] || in->reserved[1] ||
+			     in->sx_mask != STATX_BASIC_STATS;
+	if (in->flags & O_TRUNC)
+		s->nr_trunc++;
+	if (e && excl && s->bad != BAD_EXCL)
+		return reply(s->fd, ih->unique, -EEXIST, NULL, 0);
+	if (!e && (in->flags & O_CREAT)) {
+		e = add_in(s, ih->nodeid, name, S_IFREG | in->mode);
+		if (!e)
+			return reply(s->fd, ih->unique, -ENOSPC, NULL, 0);
+		fill_open_atomic(&out, e);
+		out.flags = FUSE_OPEN_ATOMIC_OPENED | FUSE_OPEN_ATOMIC_CREATED;
+	} else {
+		fill_open_atomic(&out, e);
+		if (!e && s->enoent)
+			return reply(s->fd, ih->unique, -ENOENT, NULL, 0);
+		if (!e || !S_ISREG(e->mode) || s->entry_only)
+			return reply(s->fd, ih->unique, 0, &out, len);
+		out.flags = FUSE_OPEN_ATOMIC_OPENED;
+		if (s->created_existing || s->bad == BAD_CREATED)
+			out.flags |= FUSE_OPEN_ATOMIC_CREATED;
+	}
+	if (s->bad == BAD_SHORT)
+		len = offsetof(struct fuse_open_atomic_out, open);
+	if (s->bad == BAD_ZERO_NODEID)
+		out.nodeid = 0;
+	if (s->bad == BAD_ROOT_NODEID)
+		out.nodeid = FUSE_ROOT_ID;
+	if (s->bad == BAD_HONORED)
+		out.atomic_flags = 1;
+	if (s->bad == BAD_RESERVED)
+		out.reserved = 1;
+	if (s->bad == BAD_FLAG)
+		out.flags |= 1u << 31;
+	if (s->bad == BAD_PARTIAL_MASK)
+		out.stat.mask = STATX_TYPE | STATX_MODE;
+	reply(s->fd, ih->unique, 0, &out, len);
+}
+
+static void do_init(struct server *s, struct fuse_in_header *ih)
+{
+	struct fuse_init_in *in = (void *)(ih + 1);
+	struct fuse_init_out out = {0};
+
+	s->minor = in->minor;
+	out.major = FUSE_KERNEL_VERSION;
+	out.minor = in->minor < FUSE_KERNEL_MINOR_VERSION ?
+		    in->minor : FUSE_KERNEL_MINOR_VERSION;
+	out.max_readahead = in->max_readahead;
+	out.max_write = MAX_WRITE;
+	out.max_background = 16;
+	out.congestion_threshold = 12;
+	if (s->atomic_o_trunc)
+		out.flags = FUSE_ATOMIC_O_TRUNC;
+	reply(s->fd, ih->unique, 0, &out, sizeof(out));
+}
+
+/* GETATTR and SETATTR; a size in SETATTR truncates */
+static void do_attr(struct server *s, struct fuse_in_header *ih)
+{
+	struct fuse_setattr_in *in = (void *)(ih + 1);
+	struct entry *e = find_node(s, ih->nodeid);
+	struct fuse_attr_out out = {
+		.attr_valid = 3600,
+		.attr = { .ino = FUSE_ROOT_ID, .mode = S_IFDIR | 0777,
+			  .nlink = 2 },
+	};
+
+	if (ih->opcode == FUSE_GETATTR && ih->nodeid == FUSE_ROOT_ID)
+		s->nr_root_getattr++;
+	if (ih->opcode == FUSE_SETATTR) {
+		s->nr_setattr++;
+		if (e && (in->valid & FATTR_SIZE))
+			e->size = in->size;
+	}
+	if (e) {
+		memset(&out.attr, 0, sizeof(out.attr));
+		fill_attr(&out.attr, e);
+	}
+	reply(s->fd, ih->unique, 0, &out, sizeof(out));
+}
+
+static void do_read(struct server *s, struct fuse_in_header *ih)
+{
+	struct fuse_read_in *in = (void *)(ih + 1);
+	struct entry *e = find_node(s, ih->nodeid);
+	static char data[MAX_WRITE];
+	size_t len = 0;
+
+	s->nr_read++;
+	if (e && in->offset < e->size)
+		len = e->size - in->offset;
+	if (len > in->size)
+		len = in->size;
+	reply(s->fd, ih->unique, 0, data, len);
+}
+
+static void handle(struct server *s, struct fuse_in_header *ih)
+{
+	struct fuse_open_in *open_in = (void *)(ih + 1);
+	struct fuse_batch_forget_in *forget_in = (void *)(ih + 1);
+	struct fuse_forget_one *one = (void *)(forget_in + 1);
+	struct fuse_entry_out entry;
+	struct fuse_open_out open = {0};
+	uint32_t i;
+
+	switch (ih->opcode) {
+	case FUSE_INIT:
+		return do_init(s, ih);
+	case FUSE_GETATTR:
+	case FUSE_SETATTR:
+		return do_attr(s, ih);
+	case FUSE_LOOKUP:
+		s->nr_lookup++;
+		if (s->enoent && !find_in(s, ih->nodeid, (char *)(ih + 1)))
+			return reply(s->fd, ih->unique, -ENOENT, NULL, 0);
+		fill_entry(&entry, find_in(s, ih->nodeid, (char *)(ih + 1)));
+		return reply(s->fd, ih->unique, 0, &entry, sizeof(entry));
+	case FUSE_CREATE:
+		return do_create(s, ih);
+	case FUSE_OPEN_ATOMIC:
+		return do_open_atomic(s, ih);
+	case FUSE_OPEN:
+		s->nr_open++;
+		if (s->no_open)
+			return reply(s->fd, ih->unique, -ENOSYS, NULL, 0);
+		if (open_in->flags & O_TRUNC) {
+			s->nr_trunc++;
+			find_node(s, ih->nodeid)->size = 0;
+		}
+		return reply(s->fd, ih->unique, 0, &open, sizeof(open));
+	case FUSE_OPENDIR:
+		return reply(s->fd, ih->unique, 0, &open, sizeof(open));
+	case FUSE_READ:
+		return do_read(s, ih);
+	case FUSE_RELEASE:
+		s->nr_release++;
+		post_event(s, FUSE_RELEASE, ih->nodeid);
+		return reply(s->fd, ih->unique, 0, NULL, 0);
+	case FUSE_FLUSH:
+	case FUSE_RELEASEDIR:
+		return reply(s->fd, ih->unique, 0, NULL, 0);
+	case FUSE_FORGET:
+		return post_event(s, FUSE_FORGET, ih->nodeid);
+	case FUSE_BATCH_FORGET:
+		for (i = 0; i < forget_in->count; i++)
+			post_event(s, FUSE_FORGET, one[i].nodeid);
+		return;
+	default:
+		return reply(s->fd, ih->unique, -ENOSYS, NULL, 0);
+	}
+}
+
+static void *server_thread(void *arg)
+{
+	struct server *s = arg;
+	static char buf[MAX_WRITE + 4096];
+
+	for (;;) {
+		ssize_t n = read(s->fd, buf, sizeof(buf));
+
+		if (n < 0 && (errno == EINTR || errno == EAGAIN))
+			continue;
+		if (n < 0)
+			return NULL;	/* device closed on unmount */
+		if (n >= (ssize_t)sizeof(struct fuse_in_header))
+			handle(s, (struct fuse_in_header *)buf);
+	}
+}
+
+FIXTURE(fuse)
+{
+	struct server *srv;
+	int nobody;
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
+static int become_nobody(void)
+{
+	return setgroups(0, NULL) || setgid(NOBODY) || setuid(NOBODY);
+}
+
+static bool can_become_nobody(void)
+{
+	int status;
+	pid_t pid = fork();
+
+	if (pid == 0)
+		_exit(become_nobody());
+	return pid > 0 && waitpid(pid, &status, 0) == pid &&
+	       WIFEXITED(status) && !WEXITSTATUS(status);
+}
+
+/*
+ * Each test runs in its own process and mount namespace: the mount, the
+ * server thread and its device go away when the test exits.
+ */
+FIXTURE_SETUP(fuse)
+{
+	struct server *s;
+	char opts[128];
+	struct stat st;
+	pthread_t t;
+	int err;
+
+	if (geteuid() != 0)
+		SKIP(return, "need root to mount fuse");
+	if (unshare(CLONE_NEWNS) ||
+	    mount(NULL, "/", NULL, MS_REC | MS_PRIVATE, NULL))
+		SKIP(return, "no private mount namespace: %s", strerror(errno));
+	if (mount("tmpfs", "/tmp", "tmpfs", 0, NULL))
+		SKIP(return, "cannot mount tmpfs: %s", strerror(errno));
+	self->nobody = can_become_nobody();
+
+	s = mmap(NULL, sizeof(*s), PROT_READ | PROT_WRITE,
+		 MAP_SHARED | MAP_ANONYMOUS, -1, 0);
+	ASSERT_NE(MAP_FAILED, s);
+	self->srv = s;
+	ASSERT_EQ(0, pipe(s->event_pipe));
+	ASSERT_EQ(0, fcntl(s->event_pipe[1], F_SETFL, O_NONBLOCK));
+	s->atomic = variant->atomic;
+	s->atomic_o_trunc = variant->atomic_o_trunc;
+	add_in(s, FUSE_ROOT_ID, "ro", S_IFREG | 0444);
+	add_in(s, FUSE_ROOT_ID, "rw", S_IFREG | 0644);
+	add_in(s, FUSE_ROOT_ID, "dir", S_IFDIR | 0755);
+
+	s->fd = open("/dev/fuse", O_RDWR);
+	err = errno;
+	if (s->fd < 0) {
+		ASSERT_TRUE(err == ENOENT || err == ENODEV || err == ENXIO ||
+			    err == EACCES || err == EPERM);
+		SKIP(return, "cannot open /dev/fuse: %s", strerror(err));
+	}
+	ASSERT_EQ(0, mkdir(MNT, 0755));
+	snprintf(opts, sizeof(opts),
+		 "fd=%d,rootmode=40000,user_id=0,group_id=0,default_permissions,allow_other",
+		 s->fd);
+	if (mount("fuse", MNT, "fuse", 0, opts)) {
+		err = errno;
+		ASSERT_TRUE(err == EPERM || err == EACCES || err == ENODEV);
+		SKIP(return, "cannot mount fuse: %s", strerror(err));
+	}
+	ASSERT_EQ(0, pthread_create(&t, NULL, server_thread, s));
+	pthread_detach(t);
+	/* Wait for FUSE_INIT: the root GETATTR is queued behind it */
+	ASSERT_EQ(0, stat(MNT, &st));
+	if (s->minor < 48)
+		SKIP(return, "kernel without FUSE_OPEN_ATOMIC (protocol 7.48)");
+}
+
+FIXTURE_TEARDOWN(fuse)
+{
+	EXPECT_EQ(0, self->srv->nr_bad_request);
+	/* MNT_FORCE aborts the connection, so open files close at exit */
+	umount2(MNT, MNT_FORCE);
+}
+
+/* Open @name as an unprivileged user and return the errno, or 0 */
+static int open_as_nobody(struct __test_metadata *_metadata,
+			  const char *name, int flags)
+{
+	char path[128];
+	int status, fd;
+	pid_t pid;
+
+	snprintf(path, sizeof(path), MNT "/%s", name);
+	pid = fork();
+	ASSERT_GE(pid, 0);
+	if (pid == 0) {
+		if (become_nobody())
+			_exit(255);
+		fd = open(path, flags, 0644);
+		_exit(fd < 0 ? errno : 0);
+	}
+	ASSERT_EQ(pid, waitpid(pid, &status, 0));
+	ASSERT_TRUE(WIFEXITED(status));
+	ASSERT_NE(255, WEXITSTATUS(status));
+	return WEXITSTATUS(status);
+}
+
+static int open_at(const char *name, int flags)
+{
+	char path[128];
+
+	snprintf(path, sizeof(path), MNT "/%s", name);
+	return open(path, flags, 0644);
+}
+
+static void open_close(struct __test_metadata *_metadata, const char *name,
+		       int flags)
+{
+	int fd = open_at(name, flags);
+
+	ASSERT_GE(fd, 0);
+	close(fd);
+}
+
+static uint64_t nodeid(struct server *s, const char *name)
+{
+	return find_in(s, FUSE_ROOT_ID, name)->nodeid;
+}
+
+/* Wait up to ten seconds for the server to receive @opcode for @node */
+static void wait_event(struct __test_metadata *_metadata, struct server *s,
+		       uint32_t opcode, uint64_t node)
+{
+	struct pollfd pfd = { .fd = s->event_pipe[0], .events = POLLIN };
+	struct event ev;
+
+	do {
+		ASSERT_EQ(1, poll(&pfd, 1, 10000))
+			TH_LOG("no opcode %u for nodeid %llu", opcode,
+			       (unsigned long long)node);
+		ASSERT_EQ(sizeof(ev), read(s->event_pipe[0], &ev, sizeof(ev)));
+	} while (ev.opcode != opcode || ev.nodeid != node);
+}
+
+/* Drop the dentry of @name, as the server can at any time */
+static void inval_entry(struct __test_metadata *_metadata, struct server *s,
+			const char *name)
+{
+	struct fuse_notify_inval_entry_out out = {
+		.parent = FUSE_ROOT_ID,
+		.namelen = strlen(name),
+	};
+	struct fuse_out_header oh = {
+		.len = sizeof(oh) + sizeof(out) + out.namelen + 1,
+		.error = FUSE_NOTIFY_INVAL_ENTRY,
+	};
+	struct iovec iov[3] = {
+		{ &oh, sizeof(oh) },
+		{ &out, sizeof(out) },
+		{ (void *)name, out.namelen + 1 },
+	};
+
+	ASSERT_EQ(oh.len, writev(s->fd, iov, 3));
+}
+
+/*
+ * Read "rw" into the page cache through a file that stays open as @fd,
+ * and drop its dentry.
+ */
+static void cache_rw(struct __test_metadata *_metadata, struct server *s,
+		     int *fd)
+{
+	char buf[16];
+
+	find_in(s, FUSE_ROOT_ID, "rw")->size = 4096;
+	*fd = open_at("rw", O_RDONLY);
+	ASSERT_GE(*fd, 0);
+	ASSERT_EQ(sizeof(buf), pread(*fd, buf, sizeof(buf), 0));
+	inval_entry(_metadata, s, "rw");
+}
+
+/* Read "rw" through @fd again, and return the number of FUSE_READs */
+static int reread_rw(struct server *s, int fd)
+{
+	char buf[16];
+	ssize_t n = pread(fd, buf, sizeof(buf), 0);
+
+	close(fd);
+	return n == sizeof(buf) ? s->nr_read : -1;
+}
+
+TEST_F(fuse, create_new)
+{
+	open_close(_metadata, "a", O_CREAT | O_WRONLY);
+	open_close(_metadata, "b", O_CREAT | O_EXCL | O_WRONLY);
+
+	EXPECT_EQ(0, self->srv->nr_open);
+	EXPECT_EQ(variant->atomic ? 2 : 0, self->srv->nr_open_atomic);
+	EXPECT_EQ(variant->atomic ? 0 : 2, self->srv->nr_lookup);
+	EXPECT_EQ(variant->atomic ? 0 : 2, self->srv->nr_create);
+}
+
+TEST_F(fuse, create_negative)
+{
+	struct stat st;
+
+	/* O_CREAT on a cached negative dentry */
+	ASSERT_EQ(-1, stat(MNT "/a", &st));
+	open_close(_metadata, "a", O_CREAT | O_WRONLY);
+	ASSERT_EQ(0, stat(MNT "/a", &st));
+	EXPECT_EQ(1, self->srv->nr_lookup);
+	EXPECT_EQ(variant->atomic ? 1 : 0, self->srv->nr_open_atomic);
+	EXPECT_EQ(variant->atomic ? 0 : 1, self->srv->nr_create);
+}
+
+TEST_F(fuse, create_rejected)
+{
+	struct stat st;
+	int getattr;
+
+	/* The server created the name of a rejected reply */
+	if (!variant->atomic)
+		SKIP(return, "the server lacks FUSE_OPEN_ATOMIC");
+	ASSERT_EQ(-1, stat(MNT "/a", &st));
+	self->srv->bad = BAD_FLAG;
+	ASSERT_EQ(-1, open_at("a", O_CREAT | O_WRONLY));
+	EXPECT_EQ(EIO, errno);
+	/* The kernel refetches the name and the directory attributes */
+	getattr = self->srv->nr_root_getattr;
+	ASSERT_EQ(0, stat(MNT, &st));
+	EXPECT_EQ(getattr + 1, self->srv->nr_root_getattr);
+	ASSERT_EQ(0, stat(MNT "/a", &st));
+	EXPECT_EQ(2, self->srv->nr_lookup);
+}
+
+TEST_F(fuse, create_existing)
+{
+	if (!self->nobody)
+		SKIP(return, "cannot switch to uid %d", NOBODY);
+	ASSERT_EQ(-1, open_at("ro", O_CREAT | O_EXCL | O_WRONLY));
+	EXPECT_EQ(EEXIST, errno);
+	/* may_open() runs after the reply, and fput() releases the file */
+	EXPECT_EQ(EACCES, open_as_nobody(_metadata, "ro", O_CREAT | O_RDWR));
+	if (variant->atomic)
+		wait_event(_metadata, self->srv, FUSE_RELEASE,
+			   nodeid(self->srv, "ro"));
+	EXPECT_EQ(0, self->srv->nr_create);
+}
+
+TEST_F(fuse, read_only)
+{
+	ASSERT_EQ(0, mount(NULL, MNT, NULL,
+			   MS_REMOUNT | MS_BIND | MS_RDONLY, NULL));
+	/* An existing name gives EEXIST, not EROFS */
+	ASSERT_EQ(-1, open_at("rw", O_CREAT | O_EXCL | O_WRONLY));
+	EXPECT_EQ(EEXIST, errno);
+	ASSERT_EQ(-1, open_at("ro", O_RDONLY | O_TRUNC));
+	EXPECT_EQ(EROFS, errno);
+
+	EXPECT_EQ(0, self->srv->nr_create);
+	if (variant->atomic_o_trunc) {
+		EXPECT_EQ(0, self->srv->nr_open_atomic);
+		EXPECT_EQ(2, self->srv->nr_lookup);
+	} else {
+		EXPECT_EQ(variant->atomic ? 1 : 0, self->srv->nr_open_atomic);
+		EXPECT_EQ(variant->atomic ? 1 : 2, self->srv->nr_lookup);
+	}
+}
+
+TEST_F(fuse, open_existing)
+{
+	if (!self->nobody)
+		SKIP(return, "cannot switch to uid %d", NOBODY);
+	/* may_open() runs after the reply, and fput() releases the file */
+	EXPECT_EQ(EACCES, open_as_nobody(_metadata, "ro", O_RDWR));
+	if (variant->atomic)
+		wait_event(_metadata, self->srv, FUSE_RELEASE,
+			   nodeid(self->srv, "ro"));
+	open_close(_metadata, "rw", O_RDONLY);
+	ASSERT_EQ(-1, open_at("missing", O_RDONLY));
+	EXPECT_EQ(ENOENT, errno);
+	/* A zero nodeid is cached like a negative LOOKUP */
+	ASSERT_EQ(-1, open_at("missing", O_RDONLY));
+	EXPECT_EQ(ENOENT, errno);
+
+	EXPECT_EQ(variant->atomic ? 0 : 1, self->srv->nr_open);
+	EXPECT_EQ(variant->atomic ? 3 : 0, self->srv->nr_open_atomic);
+	EXPECT_EQ(variant->atomic ? 0 : 3, self->srv->nr_lookup);
+}
+
+TEST_F(fuse, open_enoent)
+{
+	struct stat st;
+
+	/* -ENOENT gives what FUSE_LOOKUP gives: no negative dentry cached */
+	self->srv->enoent = 1;
+	ASSERT_EQ(-1, open_at("missing", O_RDONLY));
+	EXPECT_EQ(ENOENT, errno);
+	ASSERT_EQ(-1, stat(MNT "/missing", &st));
+	EXPECT_EQ(ENOENT, errno);
+	EXPECT_EQ(variant->atomic ? 1 : 0, self->srv->nr_open_atomic);
+	EXPECT_EQ(variant->atomic ? 1 : 2, self->srv->nr_lookup);
+}
+
+TEST_F(fuse, open_trunc)
+{
+	open_close(_metadata, "rw", O_WRONLY | O_TRUNC);
+	/* As a shell "> ro" */
+	open_close(_metadata, "ro", O_CREAT | O_TRUNC | O_WRONLY);
+
+	EXPECT_EQ(0, self->srv->nr_create);
+	if (variant->atomic && !variant->atomic_o_trunc) {
+		/* The server opens the file and SETATTR truncates it */
+		EXPECT_EQ(2, self->srv->nr_open_atomic);
+		EXPECT_EQ(0, self->srv->nr_lookup);
+		EXPECT_EQ(0, self->srv->nr_open);
+		EXPECT_EQ(0, self->srv->nr_trunc);
+		EXPECT_EQ(2, self->srv->nr_setattr);
+	} else {
+		/* FUSE_OPEN truncates with FUSE_ATOMIC_O_TRUNC, after LOOKUP */
+		EXPECT_EQ(0, self->srv->nr_open_atomic);
+		EXPECT_EQ(2, self->srv->nr_lookup);
+		EXPECT_EQ(2, self->srv->nr_open);
+		EXPECT_EQ(variant->atomic_o_trunc ? 2 : 0, self->srv->nr_trunc);
+		EXPECT_EQ(variant->atomic_o_trunc ? 0 : 2,
+			  self->srv->nr_setattr);
+	}
+}
+
+TEST_F(fuse, open_directory)
+{
+	/* The server returns the entry only, and the VFS opens it */
+	open_close(_metadata, "dir", O_RDONLY);
+	EXPECT_EQ(variant->atomic ? 1 : 0, self->srv->nr_open_atomic);
+	EXPECT_EQ(variant->atomic ? 0 : 1, self->srv->nr_lookup);
+}
+
+TEST_F(fuse, open_o_directory)
+{
+	/* For O_DIRECTORY the kernel sends FUSE_LOOKUP */
+	open_close(_metadata, "dir", O_RDONLY | O_DIRECTORY);
+	ASSERT_EQ(-1, open_at("rw", O_RDONLY | O_DIRECTORY));
+	EXPECT_EQ(ENOTDIR, errno);
+	EXPECT_EQ(0, self->srv->nr_open_atomic);
+	EXPECT_EQ(2, self->srv->nr_lookup);
+	EXPECT_EQ(0, self->srv->nr_open);
+}
+
+TEST_F(fuse, open_entry_only)
+{
+	/* The server returns the entry only; FUSE_OPEN opens the file */
+	self->srv->entry_only = 1;
+	open_close(_metadata, "rw", O_RDONLY);
+	EXPECT_EQ(variant->atomic ? 1 : 0, self->srv->nr_open_atomic);
+	EXPECT_EQ(variant->atomic ? 0 : 1, self->srv->nr_lookup);
+	EXPECT_EQ(1, self->srv->nr_open);
+}
+
+TEST_F(fuse, open_regular)
+{
+	struct open_how how = { .flags = O_RDONLY | OPENAT2_REGULAR };
+	uint32_t flags;
+	int fd;
+
+	/* OPENAT2_REGULAR is not part of the request */
+	if (!variant->atomic)
+		SKIP(return, "the server lacks FUSE_OPEN_ATOMIC");
+	fd = syscall(__NR_openat2, AT_FDCWD, MNT "/rw", &how, sizeof(how));
+	if (fd < 0 && (errno == EINVAL || errno == ENOSYS) &&
+	    !self->srv->nr_open_atomic)
+		SKIP(return, "openat2 without OPENAT2_REGULAR");
+	ASSERT_GE(fd, 0);
+	close(fd);
+	flags = self->srv->open_flags;
+	inval_entry(_metadata, self->srv, "rw");
+	open_close(_metadata, "rw", O_RDONLY);
+	EXPECT_EQ(self->srv->open_flags, flags);
+	EXPECT_EQ(2, self->srv->nr_open_atomic);
+	/* The VFS refuses a directory */
+	fd = syscall(__NR_openat2, AT_FDCWD, MNT "/dir", &how, sizeof(how));
+	if (fd >= 0)
+		close(fd);
+	EXPECT_EQ(-1, fd);
+	EXPECT_EQ(EFTYPE, errno);
+	EXPECT_EQ(3, self->srv->nr_open_atomic);
+}
+
+TEST_F(fuse, open_drops_cache)
+{
+	int fd;
+
+	cache_rw(_metadata, self->srv, &fd);
+	/* An open without FOPEN_KEEP_CACHE drops the cached pages */
+	open_close(_metadata, "rw", O_RDONLY);
+	EXPECT_EQ(2, reread_rw(self->srv, fd));
+	/* Each open is one FUSE_OPEN_ATOMIC, or FUSE_LOOKUP and FUSE_OPEN */
+	EXPECT_EQ(variant->atomic ? 0 : 2, self->srv->nr_open);
+	EXPECT_EQ(variant->atomic ? 2 : 0, self->srv->nr_open_atomic);
+}
+
+TEST_F(fuse, create_drops_cache)
+{
+	int fd;
+
+	cache_rw(_metadata, self->srv, &fd);
+	self->srv->created_existing = 1;
+	open_close(_metadata, "rw", O_CREAT | O_RDWR);
+	EXPECT_EQ(2, reread_rw(self->srv, fd));
+}
+
+TEST_F(fuse, bad_replies)
+{
+	/* A parsed reply with a nonzero nodeid takes a lookup reference */
+	enum { NONE, RW, ROOT };
+	static const struct {
+		enum bad_reply bad;
+		int flags;
+		int release;
+		int forget;
+	} cases[] = {
+		{ BAD_SHORT, O_RDONLY, 0, NONE },
+		{ BAD_ZERO_NODEID, O_RDONLY, 1, NONE },
+		{ BAD_ROOT_NODEID, O_RDONLY, 1, ROOT },
+		{ BAD_PARTIAL_MASK, O_RDONLY, 1, RW },
+		{ BAD_CREATED, O_RDONLY, 1, RW },
+		{ BAD_EXCL, O_CREAT | O_EXCL | O_WRONLY, 1, RW },
+		{ BAD_FLAG, O_RDONLY, 1, RW },
+		{ BAD_RESERVED, O_RDONLY, 1, RW },
+		{ BAD_HONORED, O_RDONLY, 1, RW },
+	};
+	uint64_t forget[] = { 0, nodeid(self->srv, "rw"), FUSE_ROOT_ID };
+	int i, released = 0;
+
+	if (!variant->atomic)
+		SKIP(return, "the server lacks FUSE_OPEN_ATOMIC");
+	for (i = 0; i < ARRAY_SIZE(cases); i++) {
+		self->srv->bad = cases[i].bad;
+		ASSERT_EQ(-1, open_at("rw", cases[i].flags));
+		EXPECT_EQ(EIO, errno);
+		released += cases[i].release;
+		EXPECT_EQ(released, self->srv->nr_release)
+			TH_LOG("bad reply %d", cases[i].bad);
+	}
+	/* FORGETs arrive in the order of the replies */
+	for (i = 0; i < ARRAY_SIZE(cases); i++)
+		if (cases[i].forget != NONE)
+			wait_event(_metadata, self->srv, FUSE_FORGET,
+				   forget[cases[i].forget]);
+}
+
+TEST_F(fuse, open_atomic_enosys)
+{
+	/* After -ENOSYS the kernel sends FUSE_LOOKUP */
+	if (variant->atomic)
+		SKIP(return, "the server implements FUSE_OPEN_ATOMIC");
+	open_close(_metadata, "rw", O_RDONLY);
+	open_close(_metadata, "a", O_CREAT | O_WRONLY);
+
+	EXPECT_EQ(1, self->srv->nr_enosys);
+	EXPECT_EQ(0, self->srv->nr_open_atomic);
+	EXPECT_EQ(2, self->srv->nr_lookup);
+	EXPECT_EQ(1, self->srv->nr_open);
+	EXPECT_EQ(1, self->srv->nr_create);
+}
+
+TEST_F(fuse, no_open_mode)
+{
+	struct stat st;
+
+	/* FUSE_OPEN gets -ENOSYS */
+	self->srv->no_open = 1;
+	ASSERT_EQ(0, stat(MNT "/rw", &st));
+	open_close(_metadata, "rw", O_RDONLY);
+	/* Names not in the dcache take FUSE_LOOKUP and FUSE_CREATE */
+	open_close(_metadata, "ro", O_RDONLY);
+	open_close(_metadata, "a", O_CREAT | O_WRONLY);
+
+	EXPECT_EQ(0, self->srv->nr_enosys);
+	EXPECT_EQ(0, self->srv->nr_open_atomic);
+	EXPECT_EQ(1, self->srv->nr_open);
+	EXPECT_EQ(3, self->srv->nr_lookup);
+	EXPECT_EQ(1, self->srv->nr_create);
+}
+
+TEST_F(fuse, name_too_long)
+{
+	char path[1200];
+	int len;
+
+	/* Longer than the 1024 byte limit of a server without FUSE_MAX_PAGES */
+	len = snprintf(path, sizeof(path), MNT "/");
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

