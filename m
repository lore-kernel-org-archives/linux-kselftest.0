Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF5574734CD
	for <linux-kselftest@vger.kernel.org>; Wed,  7 Oct 2026 23:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791414898; cv=none; b=emN51u822j5ww009HJkVKwk6YPL31VaPedAHB2Lxzo4J/ytvaujSpSb/PMVYdZisj9WG6RURVTK9aVMwOfnEyEIWLWIe1J7d5ursOE/fEIByljhszJ9XbB827RdKA6PCnKxUbiRutQLuXPy/ny/3NnnYMbJzGQSYD8L6Eh1O/38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791414898; c=relaxed/simple;
	bh=STXrYHLXEh5sR1ZldvOJqbL4TMifpgj24LBW3510hqQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KWoO9cgj4Vn2YNG5W2Ml5W/KCFpwtKIJjd5xC1txoDcHvm1G/ct7DM7S3q2do7Bw/CyLDZmTxCIiYphQ6cGumFNX6j5YJzMCwcAeJw4SmpblQbKPMYIFZ9AFESe8A1grNkGbdVDmHBHoryNtiD0dFL0WpB5rcfWVQzC/+wUz5Ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rECpZPiI; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rECpZPiI"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3aacde0cc0fso119087a91.2
        for <linux-kselftest@vger.kernel.org>; Wed, 07 Oct 2026 16:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791414896; x=1792019696; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XWFRSjDzEne61Ym+hfFjmLxkYw4IdsRdD630mJbxa3c=;
        b=rECpZPiIgSBvMVWgKtAsqQXrzsu0ZzAUCn37fYajwG/qNZ0isejHKl2YxIUGarRgg5
         lh0dcprL+RX1vHwfHe4fq47Brm6iXsRnstwU68LG87KVQrbYtZabc+RKYfKcHEmHUB+l
         EdL+C/Nl8VskGVBrCns+J6rLYfXc4ehLlyQkueduSCk+BkTEpEKEmd5kSFIWhb2gv8cO
         Pq0lxz/+noP+e5V6rLWknMu8eit40Oate7ho/thzsIh+TIuMYAsLb6rAYU9vEy6yhEv8
         gg0TX71qmNKUiuAI7peFJoRTEKDwcXRvcIdjEiPJVrt7rC/IdOfDf52mIKvNYOF3++Ur
         WUiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791414896; x=1792019696;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XWFRSjDzEne61Ym+hfFjmLxkYw4IdsRdD630mJbxa3c=;
        b=YvTS+57LCtg3CN7AoJpRuedMZiFznE67UytrvKBUOEf4hkb6mVowsJ5vUUMttoM/tc
         rXnCfMn+anF9IdMDvbStqkeXvWdZaAEbFC+2q9+3Rb51LNq1HLVesjTeCEnwE0dxa9Of
         OfdeaXYd/s85IVpqi5BQ20Y4Ai+opBgXGlyBz9Hln2O956s2XTAsX/Yc3+Ox8YR6DZXD
         ywxTV/ZqtIf9XJBlF2m6cSd84m8t1x9KZ1US5sq0SXZCVdkmPqnlh1qFEHp+Gq6FDO6v
         76gWJ/w8FbskuHa6N2aXe2QkglmuJOUWZURguuvzwiA6VfiwDtrGQYJiK94WOlu/5iUg
         5WtA==
X-Forwarded-Encrypted: i=1; AKwUvBw6i9lkEArgVmb1CAyqegPw2GFTKZV7xSPabnbHc+HegW8Lkafa1ZA54B23jNb6xZKiNRAPPpfCrEc8AoY9V7Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYIQ7nlAZUgdp87scch+S9Nijs5TmANW0kWBaPMifIu20d5uZHM2
	glUtYN6C7s5IEjhGMWl+EA35B5Rh/9PTLDtmKJHocWoa5YxURwsKVaJ/
X-Gm-Gg: AYBFou3rnBs4DZDjXU1qnzyRvsfo6wNg88p9RSKoRAwNQF3/b1cckxKC8tb0R8x0xgT
	weNsm7Je0Lz0j5nVpQkpLJKTn511zCDP7O+Lut5OjkqFKZ0pElm7xjrdv/pNLsWVaq3KFtNsDQ3
	EpdAvuSLCAc3WwRuhn63fpsEmfLbcQn4FnBWx4xw+lt/dShjplPw267UP0gGPlN6fhKzWyHhoGp
	e/Kjp2uP16muwxz9EqItIMhihBBlm6BY2NfoP/QT/7JczSyamMrKKFe9yhJKOf1TJ/WmUtYdF0d
	7raJi/rgNZsFessRZJ17raY8WOvUNIoSxVBpnYuVTh0DFN5bSG+5ZXHxgZW7sXfK0CXIj1LaaIb
	qpj3CEoybIKd+8K25be5MLsvlR/WIzk5SsOZeDBiZOFQ11SXyeFgwOYW8BKOdLHi4LjiOTPyEZ9
	xN3hNHNqXdCHHN3FHMOIZ2UA9y3PNcG+CwuxI1R4kAR7icjMXE7U+a4D+Zm4Dpw35mX1588R0Mh
	CdHIu0=
X-Received: by 2002:a17:90b:28c8:b0:39e:6a81:c923 with SMTP id 98e67ed59e1d1-3a8a0a921bfmr2438093a91.22.1791414895859;
        Wed, 07 Oct 2026 16:14:55 -0700 (PDT)
Received: from [192.168.0.160] ([76.135.114.51])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a9ff7ff13esm1356270a91.7.2026.10.07.16.14.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 16:14:53 -0700 (PDT)
From: Stanislav Kinsburskii <skinsburskii@gmail.com>
Date: Wed, 07 Oct 2026 16:14:35 -0700
Subject: [PATCH 2/2] selftests: fuse: test per-inode open suppression
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-fuse-per-inode-no-open-v1-2-be5229fe89f5@gmail.com>
References: <20261007-fuse-per-inode-no-open-v1-0-be5229fe89f5@gmail.com>
In-Reply-To: <20261007-fuse-per-inode-no-open-v1-0-be5229fe89f5@gmail.com>
To: Miklos Szeredi <miklos@szeredi.hu>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Shuah Khan <shuah@kernel.org>
Cc: Robert Byrnes <byrnes@wildpumpkin.net>, fuse-devel@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, 
 Stanislav Kinsburskii <skinsburskii@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791414890; l=17133;
 i=skinsburskii@gmail.com; s=20260722; h=from:subject:message-id;
 bh=STXrYHLXEh5sR1ZldvOJqbL4TMifpgj24LBW3510hqQ=;
 b=L/uX88NY954ggxY7kOAkKFSqiee2S+LoNJ6pQcYnTzaPDzeKe6eWkooQJmXIgTTfYCBYpEG15
 wONy8Jl3H3CCJZ8JRcKfsO1IoRSrZ3uKfTiWnuq6WuO365Ay/lS3Jcg
X-Developer-Key: i=skinsburskii@gmail.com; a=ed25519;
 pk=bDpriHBYgeTdkIDweZDCemxsU93neJBOCn3YLIuJpnE=

Add a raw /dev/fuse server and tests for FUSE_PER_INODE_NO_OPEN, without
requiring libfuse to support the new capability or attribute flag.

Check files and directories marked by LOOKUP and READDIRPLUS, unmarked
control files, zero file handles on reads, and hint changes through
GETATTR while handles remain open. Verify that STATX preserves the hint,
atomic O_TRUNC reaches the server, and CREATE retains its release.
Return an unknown OPEN reply flag to check that wire flags cannot
suppress release of server-opened handles.

Run each case with the capability disabled, enabled, enabled with atomic
truncation, and enabled with atomic truncation and writeback caching.
Unmount and join the server before checking request counts so asynchronous
RELEASE requests are accounted for. Skip when mounting is unavailable or
the kernel does not advertise the requested capability.

The test needs permission to create a mount namespace and mount FUSE.

Signed-off-by: Stanislav Kinsburskii <skinsburskii@gmail.com>
---
 .../testing/selftests/filesystems/fuse/.gitignore  |   1 +
 tools/testing/selftests/filesystems/fuse/Makefile  |   2 +
 .../selftests/filesystems/fuse/no_open_test.c      | 511 +++++++++++++++++++++
 3 files changed, 514 insertions(+)

diff --git a/tools/testing/selftests/filesystems/fuse/.gitignore b/tools/testing/selftests/filesystems/fuse/.gitignore
index b5b03db1118c..a4cb079c4bc6 100644
--- a/tools/testing/selftests/filesystems/fuse/.gitignore
+++ b/tools/testing/selftests/filesystems/fuse/.gitignore
@@ -3,3 +3,4 @@ fuse_mnt
 fusectl_test
 test_syncfs
 write_extend_eof_test
+no_open_test
diff --git a/tools/testing/selftests/filesystems/fuse/Makefile b/tools/testing/selftests/filesystems/fuse/Makefile
index c2de8d225447..b9682e7a2aef 100644
--- a/tools/testing/selftests/filesystems/fuse/Makefile
+++ b/tools/testing/selftests/filesystems/fuse/Makefile
@@ -4,6 +4,7 @@ CFLAGS += -Wall -O2 -g $(KHDR_INCLUDES)
 
 TEST_GEN_PROGS := fusectl_test test_syncfs
 TEST_GEN_PROGS += write_extend_eof_test
+TEST_GEN_PROGS += no_open_test
 TEST_GEN_FILES := fuse_mnt
 
 # fuse_acl_cache_test requires libfuse3; add it only when the library is present.
@@ -16,6 +17,7 @@ endif
 include ../../lib.mk
 
 $(OUTPUT)/write_extend_eof_test: LDLIBS += -lpthread
+$(OUTPUT)/no_open_test: LDLIBS += -lpthread
 
 VAR_CFLAGS := $(shell pkg-config fuse --cflags 2>/dev/null)
 ifeq ($(VAR_CFLAGS),)
diff --git a/tools/testing/selftests/filesystems/fuse/no_open_test.c b/tools/testing/selftests/filesystems/fuse/no_open_test.c
new file mode 100644
index 000000000000..fd36dc96bb98
--- /dev/null
+++ b/tools/testing/selftests/filesystems/fuse/no_open_test.c
@@ -0,0 +1,511 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Exercise the wire protocol without requiring new libfuse interfaces. */
+#define _GNU_SOURCE
+#include <dirent.h>
+#include <errno.h>
+#include <fcntl.h>
+#include <linux/fuse.h>
+#include <pthread.h>
+#include <sched.h>
+#include <stdatomic.h>
+#include <stdint.h>
+#include <sys/mount.h>
+#include <sys/stat.h>
+#include <sys/uio.h>
+#include <unistd.h>
+
+#include "../../kselftest_harness.h"
+
+enum { FILE_ID = 2, DIR_ID, CONTROL_ID, CREATE_ID, NR_INODES };
+
+struct server {
+	int fd;
+	bool negotiate;
+	bool atomic_trunc;
+	bool writeback;
+	atomic_bool supported;
+	atomic_uint attr_flags;
+	unsigned int opens[NR_INODES];
+	unsigned int releases[NR_INODES];
+	unsigned int zero_reads;
+	unsigned int zero_readdirs;
+	unsigned int statx_count;
+	unsigned int lookup_count;
+	unsigned int plus_count;
+	unsigned int truncates;
+	unsigned int size;
+	bool created;
+	int error;
+};
+
+static void reply(struct server *s, uint64_t unique, int error,
+		  void *data, size_t len)
+{
+	struct fuse_out_header out = {
+		.len = sizeof(out) + len,
+		.error = error,
+		.unique = unique,
+	};
+	struct iovec iov[] = { { &out, sizeof(out) }, { data, len } };
+
+	if (writev(s->fd, iov, len ? 2 : 1) != out.len)
+		s->error = errno ?: EIO;
+}
+
+static void fill_attr(struct server *s, struct fuse_attr *attr, uint64_t id)
+{
+	bool isdir = id == FUSE_ROOT_ID || id == DIR_ID;
+
+	attr->ino = id;
+	attr->mode = (isdir ? S_IFDIR : S_IFREG) | 0755;
+	attr->nlink = isdir ? 2 : 1;
+	attr->size = isdir ? 0 : s->size;
+	attr->blksize = 4096;
+	if (id != FUSE_ROOT_ID && id != CONTROL_ID)
+		attr->flags = atomic_load(&s->attr_flags);
+}
+
+static void fill_entry(struct server *s, struct fuse_entry_out *out, uint64_t id)
+{
+	out->nodeid = id;
+	out->generation = 1;
+	out->entry_valid = 3600;
+	out->attr_valid = 3600;
+	fill_attr(s, &out->attr, id);
+}
+
+static void *serve(void *arg)
+{
+	struct server *s = arg;
+	union {
+		struct fuse_in_header header;
+		char bytes[16384];
+	} buf;
+
+	for (;;) {
+		struct fuse_in_header *in = &buf.header;
+		void *payload = in + 1;
+		ssize_t len = read(s->fd, &buf, sizeof(buf));
+		uint64_t id;
+
+		if (len < 0 && errno == EINTR)
+			continue;
+		if (len < 0 && errno == ENODEV)
+			return NULL;
+		if (len < (ssize_t)sizeof(*in)) {
+			s->error = EIO;
+			return NULL;
+		}
+		id = in->nodeid;
+		if (id >= NR_INODES) {
+			s->error = EINVAL;
+			reply(s, in->unique, -EINVAL, NULL, 0);
+			continue;
+		}
+		switch (in->opcode) {
+		case FUSE_INIT: {
+			struct fuse_init_in *init = payload;
+			struct fuse_init_out out = {
+				.major = FUSE_KERNEL_VERSION,
+				.minor = FUSE_KERNEL_MINOR_VERSION,
+				.max_write = 4096,
+				.flags = FUSE_INIT_EXT | FUSE_DO_READDIRPLUS,
+			};
+			uint64_t flags = init->flags;
+
+			if (init->flags & FUSE_INIT_EXT)
+				flags |= (uint64_t)init->flags2 << 32;
+			atomic_store(&s->supported, flags & FUSE_PER_INODE_NO_OPEN);
+			if (out.minor > init->minor)
+				out.minor = init->minor;
+			if (s->negotiate)
+				out.flags2 = (flags & FUSE_PER_INODE_NO_OPEN) >> 32;
+			if (s->atomic_trunc)
+				out.flags |= FUSE_ATOMIC_O_TRUNC;
+			if (s->writeback)
+				out.flags |= FUSE_WRITEBACK_CACHE;
+			reply(s, in->unique, 0, &out, sizeof(out));
+			break;
+		}
+		case FUSE_LOOKUP: {
+			struct fuse_entry_out out = {};
+			const char *name = payload;
+
+			s->lookup_count++;
+			if (!strcmp(name, "file")) {
+				id = FILE_ID;
+			} else if (!strcmp(name, "dir")) {
+				id = DIR_ID;
+			} else if (!strcmp(name, "control")) {
+				id = CONTROL_ID;
+			} else if (!strcmp(name, "created") && s->created) {
+				id = CREATE_ID;
+			} else {
+				reply(s, in->unique, -ENOENT, NULL, 0);
+				break;
+			}
+			fill_entry(s, &out, id);
+			reply(s, in->unique, 0, &out, sizeof(out));
+			break;
+		}
+		case FUSE_GETATTR:
+		case FUSE_SETATTR: {
+			struct fuse_attr_out out = { .attr_valid = 3600 };
+
+			if (in->opcode == FUSE_SETATTR) {
+				struct fuse_setattr_in *attr = payload;
+
+				if (attr->valid & FATTR_SIZE) {
+					s->size = attr->size;
+					s->truncates++;
+				}
+			}
+			fill_attr(s, &out.attr, id);
+			reply(s, in->unique, 0, &out, sizeof(out));
+			break;
+		}
+		case FUSE_STATX: {
+			struct fuse_statx_out out = { .attr_valid = 3600 };
+			struct fuse_attr attr = {};
+
+			s->statx_count++;
+			fill_attr(s, &attr, id);
+			out.stat.mask = STATX_BASIC_STATS | STATX_BTIME;
+			out.stat.ino = attr.ino;
+			out.stat.mode = attr.mode;
+			out.stat.nlink = attr.nlink;
+			out.stat.size = attr.size;
+			out.stat.blksize = attr.blksize;
+			reply(s, in->unique, 0, &out, sizeof(out));
+			break;
+		}
+		case FUSE_OPEN:
+		case FUSE_OPENDIR: {
+			struct fuse_open_in *open = payload;
+			struct fuse_open_out out = {
+				.fh = 100 + id,
+				.open_flags = FOPEN_KEEP_CACHE,
+			};
+
+			s->opens[id]++;
+			/* Unknown wire bits must not act as private release flags. */
+			out.open_flags |= 1U << 30;
+			if (open->flags & O_TRUNC) {
+				s->size = 0;
+				s->truncates++;
+			}
+			reply(s, in->unique, 0, &out, sizeof(out));
+			break;
+		}
+		case FUSE_CREATE: {
+			struct {
+				struct fuse_entry_out entry;
+				struct fuse_open_out open;
+			} out = {};
+
+			s->created = true;
+			fill_entry(s, &out.entry, CREATE_ID);
+			out.open.fh = 100 + CREATE_ID;
+			out.open.open_flags = FOPEN_KEEP_CACHE;
+			reply(s, in->unique, 0, &out, sizeof(out));
+			break;
+		}
+		case FUSE_READ: {
+			struct fuse_read_in *read = payload;
+			char data = 'x';
+
+			if (!read->fh)
+				s->zero_reads++;
+			reply(s, in->unique, 0, &data,
+			      read->offset < s->size && read->size ? 1 : 0);
+			break;
+		}
+		case FUSE_READDIR:
+		case FUSE_READDIRPLUS: {
+			struct fuse_read_in *read = payload;
+			union {
+				struct fuse_direntplus entry;
+				char data[FUSE_DIRENT_ALIGN(FUSE_NAME_OFFSET_DIRENTPLUS + 4)];
+			} out = {};
+			struct fuse_direntplus *entry = &out.entry;
+
+			if (!read->fh)
+				s->zero_readdirs++;
+			if (id != FUSE_ROOT_ID || read->offset ||
+			    in->opcode != FUSE_READDIRPLUS) {
+				reply(s, in->unique, 0, NULL, 0);
+				break;
+			}
+			s->plus_count++;
+			fill_entry(s, &entry->entry_out, FILE_ID);
+			entry->dirent.ino = FILE_ID;
+			entry->dirent.off = 1;
+			entry->dirent.namelen = 4;
+			entry->dirent.type = DT_REG;
+			memcpy(entry->dirent.name, "file", 4);
+			reply(s, in->unique, 0, &out, sizeof(out));
+			break;
+		}
+		case FUSE_RELEASE:
+		case FUSE_RELEASEDIR: {
+			struct fuse_release_in *release = payload;
+
+			s->releases[id]++;
+			if (release->fh != 100 + id)
+				s->error = EINVAL;
+			reply(s, in->unique, 0, NULL, 0);
+			break;
+		}
+		case FUSE_FLUSH:
+		case FUSE_FSYNC:
+		case FUSE_ACCESS:
+		case FUSE_DESTROY:
+			reply(s, in->unique, 0, NULL, 0);
+			break;
+		case FUSE_FORGET:
+		case FUSE_BATCH_FORGET:
+			break;
+		default:
+			reply(s, in->unique, -ENOSYS, NULL, 0);
+		}
+	}
+}
+
+FIXTURE(no_open) {
+	struct server server;
+	pthread_t thread;
+	bool running;
+	bool mounted;
+	char dir[64];
+	int root;
+};
+
+FIXTURE_VARIANT(no_open) {
+	bool negotiate;
+	bool atomic_trunc;
+	bool writeback;
+};
+
+FIXTURE_VARIANT_ADD(no_open, unnegotiated) {};
+
+FIXTURE_VARIANT_ADD(no_open, negotiated) { .negotiate = true };
+
+FIXTURE_VARIANT_ADD(no_open, atomic_trunc) {
+	.negotiate = true, .atomic_trunc = true,
+};
+
+FIXTURE_VARIANT_ADD(no_open, writeback) {
+	.negotiate = true, .atomic_trunc = true, .writeback = true,
+};
+
+static void cleanup(FIXTURE_DATA(no_open) * self)
+{
+	if (self->root >= 0)
+		close(self->root);
+	if (self->mounted)
+		umount2(self->dir, MNT_DETACH);
+	if (self->running) {
+		pthread_cancel(self->thread);
+		pthread_join(self->thread, NULL);
+	}
+	if (self->server.fd >= 0)
+		close(self->server.fd);
+	if (self->dir[0])
+		rmdir(self->dir);
+}
+
+FIXTURE_SETUP(no_open)
+{
+	struct server *s = &self->server;
+	struct stat st;
+	char opts[128];
+	int err;
+
+	self->root = -1;
+	s->fd = -1;
+	if (unshare(CLONE_NEWNS))
+		SKIP(return, "need a mount namespace: %s", strerror(errno));
+	ASSERT_EQ(mount(NULL, "/", NULL, MS_REC | MS_PRIVATE, NULL), 0);
+	s->fd = open("/dev/fuse", O_RDWR | O_CLOEXEC);
+	if (s->fd < 0)
+		SKIP(return, "cannot open /dev/fuse: %s", strerror(errno));
+	strcpy(self->dir, "/tmp/fuse_no_open_XXXXXX");
+	ASSERT_NE(mkdtemp(self->dir), NULL);
+	snprintf(opts, sizeof(opts),
+		 "fd=%d,rootmode=40000,user_id=%u,group_id=%u,default_permissions",
+		 s->fd, getuid(), getgid());
+	if (mount("fuse", self->dir, "fuse", MS_NOSUID | MS_NODEV, opts)) {
+		err = errno;
+		cleanup(self);
+		SKIP(return, "cannot mount FUSE: %s", strerror(err));
+	}
+	self->mounted = true;
+	s->negotiate = variant->negotiate;
+	s->atomic_trunc = variant->atomic_trunc;
+	s->writeback = variant->writeback;
+	s->size = 1;
+	atomic_init(&s->attr_flags, FUSE_ATTR_NO_OPEN);
+	atomic_init(&s->supported, false);
+	err = pthread_create(&self->thread, NULL, serve, s);
+	if (err) {
+		cleanup(self);
+		ASSERT_EQ(err, 0);
+	}
+	self->running = true;
+	ASSERT_EQ(stat(self->dir, &st), 0);
+	if (variant->negotiate && !atomic_load(&s->supported)) {
+		cleanup(self);
+		SKIP(return, "kernel lacks FUSE_PER_INODE_NO_OPEN");
+	}
+	self->root = open(self->dir, O_PATH | O_DIRECTORY);
+	ASSERT_GE(self->root, 0);
+}
+
+FIXTURE_TEARDOWN(no_open)
+{
+	cleanup(self);
+}
+
+/* Drain asynchronous releases before checking both presence and absence. */
+static void finish(struct __test_metadata *_metadata, FIXTURE_DATA(no_open) * self)
+{
+	ASSERT_EQ(close(self->root), 0);
+	self->root = -1;
+	ASSERT_EQ(umount(self->dir), 0);
+	self->mounted = false;
+	ASSERT_EQ(pthread_join(self->thread, NULL), 0);
+	self->running = false;
+	ASSERT_EQ(self->server.error, 0);
+}
+
+static void refresh_attr(struct __test_metadata *_metadata,
+			 FIXTURE_DATA(no_open) * self, unsigned int mask)
+{
+	struct statx st;
+
+	ASSERT_EQ(statx(self->root, "file", AT_STATX_FORCE_SYNC, mask, &st), 0);
+}
+
+TEST_F(no_open, files_and_directories)
+{
+	int fd = openat(self->root, "file", O_RDONLY);
+	DIR *dir;
+	char data;
+
+	ASSERT_GE(fd, 0);
+	ASSERT_EQ(read(fd, &data, 1), 1);
+	EXPECT_EQ(data, 'x');
+	ASSERT_EQ(close(fd), 0);
+	fd = openat(self->root, "dir", O_RDONLY | O_DIRECTORY);
+	ASSERT_GE(fd, 0);
+	dir = fdopendir(fd);
+	ASSERT_NE(dir, NULL);
+	errno = 0;
+	ASSERT_EQ(readdir(dir), NULL);
+	ASSERT_EQ(errno, 0);
+	ASSERT_EQ(closedir(dir), 0);
+	fd = openat(self->root, "control", O_RDONLY);
+	ASSERT_GE(fd, 0);
+	ASSERT_EQ(close(fd), 0);
+	finish(_metadata, self);
+	EXPECT_EQ(self->server.opens[FILE_ID], !variant->negotiate);
+	EXPECT_EQ(self->server.releases[FILE_ID], !variant->negotiate);
+	EXPECT_EQ(self->server.opens[DIR_ID], !variant->negotiate);
+	EXPECT_EQ(self->server.releases[DIR_ID], !variant->negotiate);
+	EXPECT_EQ(self->server.opens[CONTROL_ID], 1);
+	EXPECT_EQ(self->server.releases[CONTROL_ID], 1);
+	EXPECT_EQ(self->server.zero_reads, variant->negotiate);
+	EXPECT_EQ(self->server.zero_readdirs, variant->negotiate);
+}
+
+TEST_F(no_open, hint_changes_with_open_handles)
+{
+	int local, remote, local_again;
+
+	local = openat(self->root, "file", O_RDONLY);
+	ASSERT_GE(local, 0);
+	atomic_store(&self->server.attr_flags, 0);
+	refresh_attr(_metadata, self, STATX_BASIC_STATS);
+	remote = openat(self->root, "file", O_RDONLY);
+	ASSERT_GE(remote, 0);
+	/* Clearing the hint must not cause a RELEASE for the first handle. */
+	ASSERT_EQ(close(local), 0);
+	atomic_store(&self->server.attr_flags, FUSE_ATTR_NO_OPEN);
+	refresh_attr(_metadata, self, STATX_BASIC_STATS);
+	local_again = openat(self->root, "file", O_RDONLY);
+	ASSERT_GE(local_again, 0);
+	/* Setting the hint must not lose the server's existing handle. */
+	ASSERT_EQ(close(remote), 0);
+	ASSERT_EQ(close(local_again), 0);
+	finish(_metadata, self);
+	EXPECT_EQ(self->server.opens[FILE_ID], variant->negotiate ? 1 : 3);
+	EXPECT_EQ(self->server.releases[FILE_ID], variant->negotiate ? 1 : 3);
+}
+
+TEST_F(no_open, statx_preserves_hint)
+{
+	int fd;
+
+	refresh_attr(_metadata, self, STATX_BASIC_STATS | STATX_BTIME);
+	fd = openat(self->root, "file", O_RDONLY);
+	ASSERT_GE(fd, 0);
+	ASSERT_EQ(close(fd), 0);
+	finish(_metadata, self);
+	EXPECT_EQ(self->server.statx_count, 1);
+	EXPECT_EQ(self->server.opens[FILE_ID], !variant->negotiate);
+	EXPECT_EQ(self->server.releases[FILE_ID], !variant->negotiate);
+}
+
+TEST_F(no_open, truncate)
+{
+	int fd = openat(self->root, "file", O_WRONLY | O_TRUNC);
+	bool server_open = !variant->negotiate || variant->atomic_trunc;
+	struct stat st;
+
+	ASSERT_GE(fd, 0);
+	ASSERT_EQ(fstat(fd, &st), 0);
+	EXPECT_EQ(st.st_size, 0);
+	ASSERT_EQ(close(fd), 0);
+	finish(_metadata, self);
+	EXPECT_EQ(self->server.size, 0);
+	EXPECT_EQ(self->server.truncates, 1);
+	EXPECT_EQ(self->server.opens[FILE_ID], server_open);
+	EXPECT_EQ(self->server.releases[FILE_ID], server_open);
+}
+
+TEST_F(no_open, create_releases_handle)
+{
+	int fd = openat(self->root, "created", O_CREAT | O_EXCL | O_RDWR, 0600);
+
+	ASSERT_GE(fd, 0);
+	ASSERT_EQ(close(fd), 0);
+	finish(_metadata, self);
+	EXPECT_TRUE(self->server.created);
+	EXPECT_EQ(self->server.opens[CREATE_ID], 0);
+	EXPECT_EQ(self->server.releases[CREATE_ID], 1);
+}
+
+TEST_F(no_open, readdirplus_populates_hint)
+{
+	int fd = openat(self->root, ".", O_RDONLY | O_DIRECTORY);
+	struct dirent *entry;
+	DIR *dir;
+
+	ASSERT_GE(fd, 0);
+	dir = fdopendir(fd);
+	ASSERT_NE(dir, NULL);
+	entry = readdir(dir);
+	ASSERT_NE(entry, NULL);
+	ASSERT_STREQ(entry->d_name, "file");
+	ASSERT_EQ(closedir(dir), 0);
+	fd = openat(self->root, "file", O_RDONLY);
+	ASSERT_GE(fd, 0);
+	ASSERT_EQ(close(fd), 0);
+	finish(_metadata, self);
+	EXPECT_EQ(self->server.plus_count, 1);
+	EXPECT_EQ(self->server.lookup_count, 0);
+	EXPECT_EQ(self->server.opens[FILE_ID], !variant->negotiate);
+	EXPECT_EQ(self->server.releases[FILE_ID], !variant->negotiate);
+}
+
+TEST_HARNESS_MAIN

-- 
2.43.0

