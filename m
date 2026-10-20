Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.246.77.92
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792510546;
	b=DHEDQs/KBKf8b5YuY4iXpqUSQOpFP8Xpjx4vMD3TNsTfvnti3CgUtNPJ5D7I33r/okqt
	 BFRvIi5sI1b7t6Wr0wYq1BWZo5TgtoF3EpNjYZEW6BvJ+MOm9ZDqDFM01sblYCW+z+XI9
	 jH4SM9SLr4bSxCWNu2GSVTtNusHegwLBMSno1F6rxKs7bp3FEmc2Gv8rgjZC2p/Gs2KFq
	 fjtJwUgDh3DgWX3VhiFGuq5cGkw8BHpjE4qISRq41OfB3mIpUkok2Kg1J37dfrLAyQQhW
	 Evs5F1SlD+v8BN2a1zrYe7pSHNLbxgv4EHq+uj1iY34eKycrsFV38Ynoh9BrELWPAIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792510546;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=xmQLA2OKcLp2LpvtegkwjWzX0xYZPTNWZrqYn9YqYU8=;
	b=Q9W44mE4ePzAx1V+UQcxe6SW8oMXcHJh5bUdyOEWNAKclzBLmTkFVkx+RR4vgLV3dvnA
	 lsms5fjKzDYXZ4/IKRdIumICoJRQCkaKKQvRp670yGj+Px2ftJBzypDmNECOtysRVS93c
	 rVqeAguDcScp9vUdeoByuJCttxgJ+F3oFIE6lh0PjaEjs5UMDHWGSYLaP2xvskrFSxIrK
	 KWoNjMszrtKXzi5rlpztknvhI2q/NpAR6oBrbpC7OnhFZCKNSPEEL69oZAYSm+DewjXUy
	 xCI80VKTsOFmAbHlCDK2vsveVESuRnyI9prIQ6VK2FJXiMENEf/Z6oKfcvUxoC1Vrzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.com;
	spf=pass smtp.mailfrom=amazon.com;
	dkim=pass header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=TOatYrKZ;
	arc=none smtp.remote-ip=44.246.77.92
Received: from pdx-out-004.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-004.esa.us-west-2.outbound.mail-perimeter.amazon.com [44.246.77.92])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7EC9606A319
	for <linux-kselftest@vger.kernel.org>; Tue, 20 Oct 2026 15:35:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7EC9606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=TOatYrKZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1792510545; x=1824046545;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xmQLA2OKcLp2LpvtegkwjWzX0xYZPTNWZrqYn9YqYU8=;
  b=TOatYrKZnB/AQbLiuyDyNNnLJEjz9K8hJEwRphIIByO7AoE15AcTcujY
   ESetoSXX7djfWkUEbWaaAVsQlqAjX/Dm3cbxXuRpiNUyXpM0frKQg46s2
   TyNRVi+DF4VSUceBDS6C0JDTzRikqQPSQPt0vyl5R3Tcx+l33tuGisyl1
   tx8/3xmyJtiMZ2PT9rDUOi7bAyZtPleUv4PJoO7znOrlpQZHYSBTrNwtK
   i1/50jr8wlucIoLv6mBv902oQWTIf+4eUprHwzTEvH8S0ofJAtFLPCPls
   8yqn/DuXvQyZ7TrPdtHxgtRWkEqcXoTLJd4/vVWf+XBrivsOjWpIbR+l8
   A==;
X-CSE-ConnectionGUID: en32PCnFRqmvh+FKqsB9zQ==
X-CSE-MsgGUID: rorGd5y2QXyCPAGcWCuBqg==
X-IronPort-AV: E=Sophos;i="6.27,168,1787011200"; 
   d="scan'208";a="31748925"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-004.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 15:35:45 +0000
Received: from EX19MTAUWB001.ant.amazon.com [205.251.233.104:3490]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.42.190:2525] with esmtp (Farcaster)
 id 766905f4-2a0f-411e-94a6-a2a9bc70c0b5; Tue, 20 Oct 2026 15:35:45 +0000 (UTC)
X-Farcaster-Flow-ID: 766905f4-2a0f-411e-94a6-a2a9bc70c0b5
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49;
 Tue, 20 Oct 2026 15:35:44 +0000
Received: from dev-dsk-jamz-1e-e35f4cd9.us-east-1.amazon.com (10.189.35.140)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.53;
 Tue, 20 Oct 2026 15:35:43 +0000
From: Jimmy Zuber <jamz@amazon.com>
To: Miklos Szeredi <miklos@szeredi.hu>
CC: <fuse-devel@lists.linux.dev>, <linux-kselftest@vger.kernel.org>, "Shuah
 Khan" <shuah@kernel.org>, Bernd Schubert <bernd@bsbernd.com>, Jim Harris
	<jiharris@nvidia.com>, Horst Birthelmer <horst@birthelmer.de>, Luis Henriques
	<luis@igalia.com>
Subject: [PATCH 2/2] selftests/fuse: test FUSE_EXCL_CREATE
Date: Tue, 20 Oct 2026 15:34:32 +0000
Message-ID: <20261020153432.3812719-3-jamz@amazon.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261020153432.3812719-1-jamz@amazon.com>
References: <20261020153432.3812719-1-jamz@amazon.com>
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

Check that mkdir(), mknod(), symlink(), link() and renameat2() with
RENAME_NOREPLACE of new names send no FUSE_LOOKUP when the server sets
FUSE_EXCL_CREATE, and that creating an existing name fails with EEXIST.

Assisted-by: Claude:claude-opus-5-5 [Claude-Code]
Signed-off-by: Jimmy Zuber <jamz@amazon.com>
---
 .../selftests/filesystems/fuse/.gitignore     |   1 +
 .../selftests/filesystems/fuse/Makefile       |   3 +-
 .../filesystems/fuse/excl_create_test.c       | 339 ++++++++++++++++++
 3 files changed, 342 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/filesystems/fuse/excl_create_test.c

diff --git a/tools/testing/selftests/filesystems/fuse/.gitignore b/tools/testing/selftests/filesystems/fuse/.gitignore
index b5b03db1118c..325874e7659d 100644
--- a/tools/testing/selftests/filesystems/fuse/.gitignore
+++ b/tools/testing/selftests/filesystems/fuse/.gitignore
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
+excl_create_test
 fuse_mnt
 fusectl_test
 test_syncfs
diff --git a/tools/testing/selftests/filesystems/fuse/Makefile b/tools/testing/selftests/filesystems/fuse/Makefile
index c2de8d225447..9ddb60d36405 100644
--- a/tools/testing/selftests/filesystems/fuse/Makefile
+++ b/tools/testing/selftests/filesystems/fuse/Makefile
@@ -3,7 +3,7 @@
 CFLAGS += -Wall -O2 -g $(KHDR_INCLUDES)
 
 TEST_GEN_PROGS := fusectl_test test_syncfs
-TEST_GEN_PROGS += write_extend_eof_test
+TEST_GEN_PROGS += write_extend_eof_test excl_create_test
 TEST_GEN_FILES := fuse_mnt
 
 # fuse_acl_cache_test requires libfuse3; add it only when the library is present.
@@ -16,6 +16,7 @@ endif
 include ../../lib.mk
 
 $(OUTPUT)/write_extend_eof_test: LDLIBS += -lpthread
+$(OUTPUT)/excl_create_test: LDLIBS += -lpthread
 
 VAR_CFLAGS := $(shell pkg-config fuse --cflags 2>/dev/null)
 ifeq ($(VAR_CFLAGS),)
diff --git a/tools/testing/selftests/filesystems/fuse/excl_create_test.c b/tools/testing/selftests/filesystems/fuse/excl_create_test.c
new file mode 100644
index 000000000000..36b675554256
--- /dev/null
+++ b/tools/testing/selftests/filesystems/fuse/excl_create_test.c
@@ -0,0 +1,339 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Test mkdir(), mknod(), symlink(), link() and renameat2() with
+ * RENAME_NOREPLACE, with and without FUSE_EXCL_CREATE.
+ *
+ * Requires root to mount fuse.
+ */
+#define _GNU_SOURCE
+#include <errno.h>
+#include <fcntl.h>
+#include <pthread.h>
+#include <stdint.h>
+#include <stdio.h>
+#include <string.h>
+#include <unistd.h>
+#include <sys/mman.h>
+#include <sys/mount.h>
+#include <sys/stat.h>
+#include <sys/uio.h>
+#include <linux/fuse.h>
+
+#include "../../kselftest_harness.h"
+
+#define FUSE_ROOT_ID	1
+#define MAX_WRITE	(128 * 1024)
+#define MAX_ENTRIES	16
+
+struct entry {
+	char name[64];
+	uint64_t nodeid;
+	uint32_t mode;
+};
+
+/* Server state, shared with the responder thread. */
+struct server {
+	int fd;
+	int excl;
+	struct entry ent[MAX_ENTRIES];
+	int nent;
+	int nr_lookup, nr_mkobj, nr_rename;
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
+	return e;
+}
+
+/* A NULL entry is a negative entry, cached like a found one. */
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
+static void *server_thread(void *arg)
+{
+	struct server *s = arg;
+	static char buf[MAX_WRITE + 4096];
+
+	for (;;) {
+		ssize_t n = read(s->fd, buf, sizeof(buf));
+		struct fuse_in_header *ih = (void *)buf;
+		char *in = (char *)(ih + 1);
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
+			struct fuse_init_in *init = (void *)in;
+			struct fuse_init_out out = {0};
+
+			out.major = FUSE_KERNEL_VERSION;
+			out.minor = FUSE_KERNEL_MINOR_VERSION;
+			out.max_readahead = init->max_readahead;
+			out.max_write = MAX_WRITE;
+			out.max_background = 16;
+			out.congestion_threshold = 12;
+			out.flags = FUSE_INIT_EXT;
+			if (s->excl)
+				out.flags2 = FUSE_EXCL_CREATE >> 32;
+			reply(s->fd, ih->unique, 0, &out, sizeof(out));
+			break;
+		}
+		case FUSE_GETATTR: {
+			struct fuse_attr_out out = {0};
+			struct fuse_entry_out eo;
+			int i;
+
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
+			fill_entry(&out, find(s, in));
+			reply(s->fd, ih->unique, 0, &out, sizeof(out));
+			break;
+		}
+		case FUSE_MKNOD:
+		case FUSE_MKDIR:
+		case FUSE_SYMLINK:
+		case FUSE_LINK: {
+			struct fuse_entry_out out;
+			const char *name;
+			uint32_t mode;
+
+			s->nr_mkobj++;
+			if (ih->opcode == FUSE_MKNOD) {
+				struct fuse_mknod_in *mi = (void *)in;
+
+				name = (char *)(mi + 1);
+				mode = mi->mode;
+			} else if (ih->opcode == FUSE_MKDIR) {
+				struct fuse_mkdir_in *mi = (void *)in;
+
+				name = (char *)(mi + 1);
+				mode = S_IFDIR | mi->mode;
+			} else if (ih->opcode == FUSE_SYMLINK) {
+				name = in;
+				mode = S_IFLNK | 0777;
+			} else {
+				name = (char *)((struct fuse_link_in *)in + 1);
+				mode = S_IFREG | 0644;
+			}
+			if (find(s, name)) {
+				reply(s->fd, ih->unique, -EEXIST, NULL, 0);
+				break;
+			}
+			fill_entry(&out, add(s, name, mode));
+			if (ih->opcode == FUSE_LINK)
+				out.attr.nlink = 2;
+			reply(s->fd, ih->unique, 0, &out, sizeof(out));
+			break;
+		}
+		case FUSE_RENAME2: {
+			struct fuse_rename2_in *ri = (void *)in;
+			const char *oldname = (char *)(ri + 1);
+			const char *newname = oldname + strlen(oldname) + 1;
+			struct entry *e = find(s, oldname);
+
+			s->nr_rename++;
+			if (!e || ri->flags != RENAME_NOREPLACE) {
+				reply(s->fd, ih->unique, -EINVAL, NULL, 0);
+				break;
+			}
+			if (find(s, newname)) {
+				reply(s->fd, ih->unique, -EEXIST, NULL, 0);
+				break;
+			}
+			snprintf(e->name, sizeof(e->name), "%.63s", newname);
+			reply(s->fd, ih->unique, 0, NULL, 0);
+			break;
+		}
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
+	int excl;
+};
+
+FIXTURE_VARIANT_ADD(fuse, excl)
+{
+	.excl = 1,
+};
+
+FIXTURE_VARIANT_ADD(fuse, plain)
+{
+	.excl = 0,
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
+	self->srv->excl = variant->excl;
+	add(self->srv, "src", S_IFREG | 0644);
+	add(self->srv, "taken", S_IFREG | 0644);
+
+	self->srv->fd = open("/dev/fuse", O_RDWR);
+	ASSERT_GE(self->srv->fd, 0);
+
+	strcpy(self->dir, "/tmp/fuse_excl_XXXXXX");
+	ASSERT_NE(NULL, mkdtemp(self->dir));
+
+	snprintf(opts, sizeof(opts),
+		 "fd=%d,rootmode=40000,user_id=0,group_id=0", self->srv->fd);
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
+TEST_F(fuse, create_new)
+{
+	char path[128], src[128];
+
+	snprintf(path, sizeof(path), "%s/d", self->dir);
+	ASSERT_EQ(0, mkdir(path, 0755));
+	snprintf(path, sizeof(path), "%s/f", self->dir);
+	ASSERT_EQ(0, mkfifo(path, 0644));
+	snprintf(path, sizeof(path), "%s/l", self->dir);
+	ASSERT_EQ(0, symlink("src", path));
+	snprintf(src, sizeof(src), "%s/src", self->dir);
+	snprintf(path, sizeof(path), "%s/h", self->dir);
+	ASSERT_EQ(0, link(src, path));
+	snprintf(path, sizeof(path), "%s/r", self->dir);
+	ASSERT_EQ(0, renameat2(AT_FDCWD, src, AT_FDCWD, path,
+			       RENAME_NOREPLACE));
+
+	EXPECT_EQ(4, self->srv->nr_mkobj);
+	EXPECT_EQ(1, self->srv->nr_rename);
+	/* Only "src" is looked up with FUSE_EXCL_CREATE */
+	EXPECT_EQ(variant->excl ? 1 : 6, self->srv->nr_lookup);
+}
+
+TEST_F(fuse, create_existing)
+{
+	char path[128], src[128];
+
+	snprintf(path, sizeof(path), "%s/taken", self->dir);
+	ASSERT_EQ(-1, mkdir(path, 0755));
+	ASSERT_EQ(EEXIST, errno);
+	ASSERT_EQ(-1, symlink("src", path));
+	ASSERT_EQ(EEXIST, errno);
+	snprintf(src, sizeof(src), "%s/src", self->dir);
+	ASSERT_EQ(-1, renameat2(AT_FDCWD, src, AT_FDCWD, path,
+				RENAME_NOREPLACE));
+	ASSERT_EQ(EEXIST, errno);
+
+	if (variant->excl) {
+		/* Only "src" is looked up */
+		EXPECT_EQ(2, self->srv->nr_mkobj);
+		EXPECT_EQ(1, self->srv->nr_rename);
+		EXPECT_EQ(1, self->srv->nr_lookup);
+	} else {
+		/* The cached name is looked up again for each request */
+		EXPECT_EQ(0, self->srv->nr_mkobj);
+		EXPECT_EQ(0, self->srv->nr_rename);
+		EXPECT_EQ(4, self->srv->nr_lookup);
+	}
+}
+
+TEST_HARNESS_MAIN
-- 
2.50.1

