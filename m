Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=52.13.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793053099;
	b=x33G7Aq6KrNuTRD3VYoRibKTClTGSTv4LxaENGaxC+sUUvl1ZWGyKvrf1LBla2r+B+/I
	 HYk0r1W6BT9XOcFSXXSWkdnULv9aYE9BE01UrQJMwPUdHQF5bwufuIEEi3B/BBgiRWJ8m
	 /YMcgQXXFzbDpLefXiwsbTpY4hyrMU9Z59wmzpBma+eBl/CmMk+4IhgKem3//IPxl24Jo
	 g26JFyvs2WAFYn8Op7s1aBsrQ0DYhU9egxNex+JqCo1LiPj7I6sKaZEt3KO7CElhj5zk9
	 l/EIIllSfxQoAO0HmU+VoK/rkiKHLS8IvzBOqUeX+VbGCUJMNUEdwGCeB2a/npc/liA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793053099;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=C08zoQ9oP6H+XiBnTr+uQ9WmZpT2KbsMbTcRxYAAP6s=;
	b=S67Q3i9p6iPx/NWHgoNwZeFenQ43P1Aw8fhZrMZCSClJYO7C4kXv50YyFNWbyQzU3qzW
	 m19ijiAGUoXH/kT9hDqmFL8mMgvcBbxEy3ll4SzC+TvIGLj3WZmO4unJB0AlsF/IuAQ3p
	 DRxb7eCNYHeya459etMHE8sCBxk7CUyZDLaUDhV084Curw0wrjOoAxUVQOPbMjvdL//xD
	 E48z3jBjzrPGfVBVzx/4HOtz86lp1g8+LKHRVevZkkRf26PSrhtbzGVX2AUGDxYfTI7p/
	 ioT5A+axplXwHZLkiD3Sh85WCAbyz7F7dY8Qp6b0bWqZS6DRHtM0hjJ82gl1ygxjvDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.com;
	spf=pass smtp.mailfrom=amazon.com;
	dkim=pass header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=rkstCe0A;
	arc=none smtp.remote-ip=52.13.214.179
Received: from pdx-out-005.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-005.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.13.214.179])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6497606A31E
	for <linux-kselftest@vger.kernel.org>; Mon, 26 Oct 2026 22:18:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6497606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=rkstCe0A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1793053098; x=1824589098;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=C08zoQ9oP6H+XiBnTr+uQ9WmZpT2KbsMbTcRxYAAP6s=;
  b=rkstCe0A8G6qWipzbz9OZBLKG/IEih16RrD69WsJ/lUyZ6rD5060Nr5D
   QmbbaefoFBTFtZoru0izODS37hMXatzbrPaXbYQNNv4TY1/eN1VvMuPJ8
   1tV2B5uAFR+tmJLk/RrVji+jzhAdokQ84/QatVXYXAdq9t+2NOxVyxoy+
   pqrXR6X7SdtjVH1wSBevHnpEe2tSWFy1MQXvnEWpOn79N0bbea8ABwOMw
   0VY40VGbpX7cGANz3NoLIuQ1UjRafQRNUU2rA+6g7cyiDEIceE9jDNjoi
   KU5wzFYt7jbOCf+au+2+/j5Eit+jYjYMk+7k0kUrqucFLBzs6WYHRPDtF
   w==;
X-CSE-ConnectionGUID: /Y5s1Qf5S9aDK//fhEa5qA==
X-CSE-MsgGUID: GoNv2e1GTta2GEsXkEb82g==
X-IronPort-AV: E=Sophos;i="6.27,180,1787011200"; 
   d="scan'208";a="32282162"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-005.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 22:18:18 +0000
Received: from EX19MTAUWA001.ant.amazon.com [205.251.233.182:18858]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.29.97:2525] with esmtp (Farcaster)
 id f701918d-3602-4d6b-ad62-fb9df35781c8; Mon, 26 Oct 2026 22:18:18 +0000 (UTC)
X-Farcaster-Flow-ID: f701918d-3602-4d6b-ad62-fb9df35781c8
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.204) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Mon, 26 Oct 2026 22:18:17 +0000
Received: from dev-dsk-jamz-1e-e35f4cd9.us-east-1.amazon.com (10.189.35.140)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Mon, 26 Oct 2026 22:18:16 +0000
From: Jimmy Zuber <jamz@amazon.com>
To: Miklos Szeredi <miklos@szeredi.hu>
CC: <fuse-devel@lists.linux.dev>, <linux-kselftest@vger.kernel.org>, "Shuah
 Khan" <shuah@kernel.org>, Bernd Schubert <bernd@bsbernd.com>, Jim Harris
	<jiharris@nvidia.com>, Horst Birthelmer <horst@birthelmer.de>, Luis Henriques
	<luis@igalia.com>, NeilBrown <neil@brown.name>
Subject: [PATCH v4 3/3] selftests/fuse: add test for FUSE_OPEN_ATOMIC
Date: Mon, 26 Oct 2026 22:16:39 +0000
Message-ID: <20261026221639.628325-4-jamz@amazon.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261026221639.628325-1-jamz@amazon.com>
References: <20261026221639.628325-1-jamz@amazon.com>
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
X-ClientProxiedBy: EX19D031UWC004.ant.amazon.com (10.13.139.246) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

Check the requests sent when opening and creating new, existing, missing
and expired names, against a raw /dev/fuse server with and without
FUSE_OPEN_ATOMIC, and that opening an existing read-only file is still
permission checked. Also check that an O_TMPFILE file has no name in
its directory, that a fuse_open_out without backing_id_64 is accepted,
that a name longer than name_max fails, that a reopen through
/proc/self/fd opens by nodeid, that an expired name sees a directory
replacing it and permissions the server revoked, and that O_CREAT |
O_EXCL without write access to the directory and O_TRUNC on a read-only
mount fail with EEXIST and EROFS.

Assisted-by: Claude:claude-opus-5-5 [Claude-Code]
Signed-off-by: Jimmy Zuber <jamz@amazon.com>
---
 .../selftests/filesystems/fuse/.gitignore     |   1 +
 .../selftests/filesystems/fuse/Makefile       |   3 +-
 .../filesystems/fuse/atomic_open_test.c       | 645 ++++++++++++++++++
 3 files changed, 648 insertions(+), 1 deletion(-)
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
index 0000000000000..075162a9e8804
--- /dev/null
+++ b/tools/testing/selftests/filesystems/fuse/atomic_open_test.c
@@ -0,0 +1,645 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Test open() and create with and without FUSE_OPEN_ATOMIC.
+ *
+ * Requires root to mount fuse.
+ */
+#define _GNU_SOURCE
+#include <errno.h>
+#include <fcntl.h>
+#include <limits.h>
+#include <pthread.h>
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
+	uint64_t attr_valid;
+};
+
+/* Server state, shared with the responder thread. */
+struct server {
+	int fd;
+	int atomic;
+	struct entry ent[MAX_ENTRIES];
+	int nent;
+	int nr_lookup, nr_create, nr_open, nr_open_atomic, nr_setattr;
+	int nr_getattr;
+	/* Send fuse_open_out without backing_id_64, as older servers do */
+	int short_open;
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
+	e->attr_valid = 3600;
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
+	out->attr_valid = e->attr_valid;
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
+			else
+				s->nr_getattr++;
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
+					out.attr_valid = eo.attr_valid;
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
+			reply(s->fd, ih->unique, 0, &out,
+			      sizeof(out.entry) + open_out_size(s));
+			break;
+		}
+		case FUSE_TMPFILE: {
+			struct fuse_create_in *in = (void *)(ih + 1);
+			struct entry e = {
+				.nodeid = 100,
+				.mode = S_IFREG | in->mode,
+				.entry_valid = 3600,
+				.attr_valid = 3600,
+			};
+			struct {
+				struct fuse_entry_out entry;
+				struct fuse_open_out open;
+			} out = {0};
+
+			fill_entry(&out.entry, &e);
+			reply(s->fd, ih->unique, 0, &out,
+			      sizeof(out.entry) + open_out_size(s));
+			break;
+		}
+		case FUSE_OPEN: {
+			struct fuse_open_out out = {0};
+
+			s->nr_open++;
+			reply(s->fd, ih->unique, 0, &out, open_out_size(s));
+			break;
+		}
+		case FUSE_OPENDIR: {
+			struct fuse_open_out out = {0};
+
+			reply(s->fd, ih->unique, 0, &out, open_out_size(s));
+			break;
+		}
+		case FUSE_FLUSH:
+		case FUSE_RELEASE:
+		case FUSE_RELEASEDIR:
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
+	struct entry *e;
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
+	self->srv->fd = -1;
+	self->srv->atomic = variant->atomic;
+	add(self->srv, "ro", S_IFREG | 0444);
+	add(self->srv, "rw", S_IFREG | 0644);
+	add(self->srv, "stale", S_IFREG | 0644)->entry_valid = 0;
+	add(self->srv, "rodir", S_IFDIR | 0755);
+	add(self->srv, "shared", S_IFREG | 0666)->entry_valid = 0;
+	e = add(self->srv, "noac", S_IFREG | 0644);
+	e->entry_valid = 0;
+	e->attr_valid = 0;
+
+	self->srv->fd = open("/dev/fuse", O_RDWR);
+	if (self->srv->fd < 0 && (errno == ENOENT || errno == ENODEV))
+		SKIP(return, "no /dev/fuse");
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
+	/* The detached server thread may still use self->srv */
+	if (self->srv && self->srv != MAP_FAILED && self->srv->fd >= 0)
+		close(self->srv->fd);
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
+	char link[64], path[PATH_MAX];
+	ssize_t len;
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
+	snprintf(link, sizeof(link), "/proc/self/fd/%d", fd);
+	len = readlink(link, path, sizeof(path) - 1);
+	ASSERT_GT(len, 0);
+	path[len] = '\0';
+	/* The tmpfile has no name in the directory */
+	EXPECT_NE(NULL, strstr(path, " (deleted)"));
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
+TEST_F(fuse, short_open_out)
+{
+	int fd;
+
+	self->srv->short_open = 1;
+
+	fd = open_at(self->dir, "a", O_CREAT | O_WRONLY);
+	ASSERT_GE(fd, 0);
+	close(fd);
+
+	fd = open_at(self->dir, "rw", O_RDWR);
+	ASSERT_GE(fd, 0);
+	close(fd);
+
+	/* The entry has expired, so the second open checks the name */
+	fd = open_at(self->dir, "stale", O_RDONLY);
+	ASSERT_GE(fd, 0);
+	close(fd);
+	fd = open_at(self->dir, "stale", O_RDONLY);
+	ASSERT_GE(fd, 0);
+	close(fd);
+}
+
+TEST_F(fuse, name_too_long)
+{
+	char path[1200];
+	int len;
+
+	len = snprintf(path, sizeof(path), "%s/", self->dir);
+	memset(path + len, 'x', 1100);
+	path[len + 1100] = '\0';
+	ASSERT_EQ(-1, open(path, O_CREAT | O_WRONLY, 0644));
+	EXPECT_EQ(ENAMETOOLONG, errno);
+	EXPECT_EQ(0, self->srv->nr_open_atomic);
+	EXPECT_EQ(0, self->srv->nr_create);
+}
+
+TEST_F(fuse, reopen_by_fd)
+{
+	char link[64];
+	int fd, fd2;
+
+	fd = open_at(self->dir, "stale", O_RDONLY);
+	ASSERT_GE(fd, 0);
+
+	/*
+	 * The server renames the file: the reopen finds the name gone, and the
+	 * retry opens the file by nodeid
+	 */
+	strcpy(find(self->srv, "stale")->name, "moved");
+	snprintf(link, sizeof(link), "/proc/self/fd/%d", fd);
+	fd2 = open(link, O_RDONLY);
+	ASSERT_GE(fd2, 0);
+	close(fd2);
+	close(fd);
+
+	if (variant->atomic) {
+		EXPECT_EQ(2, self->srv->nr_open_atomic);
+		EXPECT_EQ(1, self->srv->nr_open);
+	}
+}
+
+TEST_F(fuse, open_directory_replaced)
+{
+	struct entry *e;
+	int fd;
+
+	fd = open_at(self->dir, "stale", O_RDONLY);
+	ASSERT_GE(fd, 0);
+	close(fd);
+
+	/* The server replaces the file with a directory */
+	e = find(self->srv, "stale");
+	e->nodeid = 300;
+	e->mode = S_IFDIR | 0755;
+	fd = open_at(self->dir, "stale", O_RDONLY | O_DIRECTORY);
+	ASSERT_GE(fd, 0);
+	close(fd);
+}
+
+TEST_F(fuse, open_permission_revoked)
+{
+	int fd;
+
+	fd = open_at(self->dir, "shared", O_RDONLY);
+	ASSERT_GE(fd, 0);
+	close(fd);
+
+	/* The cached attributes still allow writing; the server's do not */
+	find(self->srv, "shared")->mode = S_IFREG | 0644;
+	EXPECT_EQ(EACCES, open_as_nobody(self->dir, "shared", O_WRONLY));
+}
+
+TEST_F(fuse, open_attrs_expired)
+{
+	int fd;
+
+	fd = open_at(self->dir, "noac", O_RDONLY);
+	ASSERT_GE(fd, 0);
+	close(fd);
+	fd = open_at(self->dir, "noac", O_RDONLY);
+	ASSERT_GE(fd, 0);
+	close(fd);
+
+	/* may_open() needs fresh attributes, so the reopen looks the name up */
+	if (variant->atomic) {
+		EXPECT_EQ(1, self->srv->nr_lookup);
+		EXPECT_EQ(0, self->srv->nr_open);
+	}
+}
+
+TEST_F(fuse, create_excl_no_write)
+{
+	/* Without write access to the directory, O_EXCL still sees the name */
+	EXPECT_EQ(EEXIST, open_as_nobody(self->dir, "rodir/rw",
+					 O_CREAT | O_EXCL | O_WRONLY));
+}
+
+TEST_F(fuse, trunc_read_only)
+{
+	ASSERT_EQ(0, mount(NULL, self->dir, NULL,
+			   MS_REMOUNT | MS_BIND | MS_RDONLY, NULL));
+	ASSERT_EQ(-1, open_at(self->dir, "rw", O_RDONLY | O_TRUNC));
+	EXPECT_EQ(EROFS, errno);
+	/* The server leaves the file unopened */
+	EXPECT_EQ(0, self->srv->nr_open_atomic);
+	EXPECT_EQ(0, self->srv->nr_open);
+}
+
+TEST_HARNESS_MAIN
-- 
2.50.1

