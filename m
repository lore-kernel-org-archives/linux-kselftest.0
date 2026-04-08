Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B34A3B19D5
	for <linux-kselftest@vger.kernel.org>; Wed,  8 Apr 2026 14:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775660139; cv=none; b=KuO3xCOTmVIRtj3Lv+0qj/LThYPk3v8qnje/vLF9pdr/A2VW27D2Ftwbf4PzX9wyKLA+AqbVBNv6Lyjfh6WSyyzuHZpFevr1PuculgXM0gIzPigqMm+r9Cnlv24mWw4Ju7hnH+eU3TG/GXZ0JnU1gCE2UtAhcb9ef+OEPlVkzg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775660139; c=relaxed/simple;
	bh=Y2+213sQ20evLCG0V7wuf3xrLthHuVt5lzhfxNy50SY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LlBZ9DiI3iuJltbWkLUHoRB7RIuy0qzG7EcSq+3ADJvmB0zq3MB4+x40n+0kzEiL4wA3a0GCKixnMDpNMXXkDjufyrg5gluS0VOtrQFjiahmlz8ralZfe3RdBBN+RQXwz8bZxUgc8zb4yMA1IupcZTQ2Hoc6Cd4TPyXVn1KGQSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p91QIlo2; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p91QIlo2"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-488aa77a06eso57638825e9.0
        for <linux-kselftest@vger.kernel.org>; Wed, 08 Apr 2026 07:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775660136; x=1776264936; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lTAJnt8Rzxnihpw2s0R85tzSbsKjYZRdJ/xdTQ6GUWU=;
        b=p91QIlo2lK/6GzZZJyo+6v/rcgffeQPF45Gnsp+C+8oP5gNBvYk//bwzwYouBLGJ36
         09nkEXBf+G6oGMLsvTYktWCcmi4z8jpunReHMyviHF+6gB28Mms9CtQP+Xmza0+3F7TE
         qOIzEHnyHihaFpSNzGYaeDdWacbqijZszvUHVZiSsVAr8vxyw2X7mXi2jIqO4CtOJs4E
         0GfW17zFfgvhkXnK8n90MFFXpQZlu+LdUHjjRWzNghw+3loompYXr5ejjsHNuX9hX3f/
         JWwTtGvxKZ15b73p1VFU6aFmH/y46Cslm8BBO6WcP0EExNxapHq1XW8BSoyD9clS6NZz
         PAzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775660136; x=1776264936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lTAJnt8Rzxnihpw2s0R85tzSbsKjYZRdJ/xdTQ6GUWU=;
        b=AAjDCLisMXK2Cz9CVEaOGXZ9H4PPINNgMxmaoxt5ve9r7zYvKXM0soYwxAD+0Llvk/
         UdzA8UxvGWjHM0a18CG0T0dqD7uppsrvC3NfPhdg2K8ZVzvN2pHBuMee6jsepPiCfa8h
         3mA88oKzYEcCEhtfOhX+vRGtWSYn7/Fv84eWwV044SnEDUsAqXtBIeEpaSq2mruGo6TX
         prjqce/BKxLodBGRRcvWVnOWqmman/jFjuodExdpo5qJvKvZm217WYFTSaABcZYVQLIn
         zLU+u/mTQZm1fsuPGjEfj3D3+AI+f8g90SLDe8O0HqTE3eVJJ1QQC9XDJW2Xo6qqhm04
         5i4A==
X-Forwarded-Encrypted: i=1; AJvYcCXHqTGXUDEcM4P2PHeo1gKbLY0gdxF9HKVaol7RLJK3pzeilY5fa8TsYqgucZ3/Iv5+R+A8OYRbGJtk/pt8pkQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHhflhzAc+RYNhPWe8vrcaSdVOalGg/uUEiqj+j6d3YvQjd0xr
	jH0hFLH+HuGdXembIJ0w/U1qV9PfdMvARJXNm+qZ6In7ftLhD9Lee1Vz
X-Gm-Gg: AeBDiev3fbUn0vd1gJ1LG8R2Z2zzBQdISCDE7nEgtLmDbwcvCkB3lmPKTQKHUPxNhO9
	3riYZfqOWIpEoBOZh9MDoKSdyRKBp4mmXyo7/T5G7re76Dy5aEuc6oyR6054zqrPdy0g5vNPJBJ
	MqLNPz0j8QjfCNTWJI9Kzh/6eBtNipVCJxrCDBNqBZ8cx69e4ifXjeUevNhTAYElRSEJY/gK7LB
	vKmyzawVuV43hThjBhaYSnJF/LD5cd89QmLnk1Dz1OYNo5+i9w+rtBQ3gaNlLWuCJsZnbGTHStu
	Ndhg4OzUpuu3wBGxM6CEexkNjOvur4n9+rRGIMYk+wErNoY1Jdoj8buXHKZBlo4SfVb0FlseaFs
	u8N0DnNf24NayMYeRk7O959FZoVmpOPNVHbK/J9JDVnuX5Xu4C8xbX4lG3F+JNAkB9ELynLXFiO
	/iSM75gEjV5COUQK/nV6+/n1Gp
X-Received: by 2002:a05:600c:3b19:b0:486:fab9:a578 with SMTP id 5b1f17b1804b1-4889976af3bmr294382785e9.11.1775660135451;
        Wed, 08 Apr 2026 07:55:35 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8308:b093:bb00::3006])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4f5294sm55762103f8f.35.2026.04.08.07.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 07:55:34 -0700 (PDT)
Sender: Alban Crequy <muadda@gmail.com>
From: Alban Crequy <alban.crequy@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Christian Brauner <brauner@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Alban Crequy <alban.crequy@gmail.com>,
	Alban Crequy <albancrequy@microsoft.com>,
	Peter Xu <peterx@redhat.com>,
	Willy Tarreau <w@1wt.eu>,
	linux-kselftest@vger.kernel.org,
	shuah@kernel.org
Subject: [PATCH v2 2/2] selftests/mm: add tests for process_vm_readv flags
Date: Wed,  8 Apr 2026 16:54:36 +0200
Message-ID: <20260408145436.843538-3-alban.crequy@gmail.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20260408145436.843538-1-alban.crequy@gmail.com>
References: <20260408145436.843538-1-alban.crequy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alban Crequy <albancrequy@microsoft.com>

Add selftests for the PROCESS_VM_PIDFD and PROCESS_VM_NOWAIT flags
introduced in process_vm_readv/writev.

Tests cover:
- basic read with no flags
- invalid flags (EINVAL)
- invalid address (EFAULT)
- flag validation precedence over address validation
- PROCESS_VM_PIDFD: read via pidfd
- PROCESS_VM_NOWAIT: read from resident memory
- PROCESS_VM_PIDFD | PROCESS_VM_NOWAIT combined
- userfaultfd blocking read (no flags)
- PROCESS_VM_NOWAIT with userfaultfd (non-blocking, returns EFAULT)

Signed-off-by: Alban Crequy <albancrequy@microsoft.com>
---
New in v2.

 tools/testing/selftests/mm/Makefile           |   1 +
 tools/testing/selftests/mm/process_vm_readv.c | 368 ++++++++++++++++++
 2 files changed, 369 insertions(+)
 create mode 100644 tools/testing/selftests/mm/process_vm_readv.c

diff --git a/tools/testing/selftests/mm/Makefile b/tools/testing/selftests/mm/Makefile
index 7a5de4e9bf52..056d9d961f6b 100644
--- a/tools/testing/selftests/mm/Makefile
+++ b/tools/testing/selftests/mm/Makefile
@@ -105,6 +105,7 @@ TEST_GEN_FILES += droppable
 TEST_GEN_FILES += guard-regions
 TEST_GEN_FILES += merge
 TEST_GEN_FILES += rmap
+TEST_GEN_FILES += process_vm_readv
 
 ifneq ($(ARCH),arm64)
 TEST_GEN_FILES += soft-dirty
diff --git a/tools/testing/selftests/mm/process_vm_readv.c b/tools/testing/selftests/mm/process_vm_readv.c
new file mode 100644
index 000000000000..cc25471410b5
--- /dev/null
+++ b/tools/testing/selftests/mm/process_vm_readv.c
@@ -0,0 +1,368 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#define _GNU_SOURCE
+#include <errno.h>
+#include <fcntl.h>
+#include <poll.h>
+#include <pthread.h>
+#include <signal.h>
+#include <stdbool.h>
+#include <stdint.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/ioctl.h>
+#include <sys/mman.h>
+#include <sys/syscall.h>
+#include <sys/uio.h>
+#include <sys/wait.h>
+#include <unistd.h>
+#include <linux/userfaultfd.h>
+
+#include "kselftest_harness.h"
+
+#ifndef PROCESS_VM_PIDFD
+#define PROCESS_VM_PIDFD	(1UL << 0)
+#endif
+
+#ifndef PROCESS_VM_NOWAIT
+#define PROCESS_VM_NOWAIT	(1UL << 1)
+#endif
+
+#ifndef __NR_pidfd_open
+#define __NR_pidfd_open 434
+#endif
+
+static int sys_pidfd_open(pid_t pid, unsigned int flags)
+{
+	return syscall(__NR_pidfd_open, pid, flags);
+}
+
+static const uint8_t test_data[] = { 0x01, 0x02, 0x03, 0x04,
+				     0x05, 0x06, 0x07, 0x08 };
+#define POISON_BYTE 0xCC
+
+/*
+ * Test: basic process_vm_readv with no flags
+ */
+TEST(read_basic)
+{
+	uint8_t buf[sizeof(test_data)];
+	struct iovec local_iov = { .iov_base = buf, .iov_len = sizeof(buf) };
+	struct iovec remote_iov = {
+		.iov_base = (void *)test_data,
+		.iov_len = sizeof(test_data)
+	};
+	ssize_t n;
+
+	memset(buf, POISON_BYTE, sizeof(buf));
+	n = process_vm_readv(getpid(), &local_iov, 1, &remote_iov, 1, 0);
+	ASSERT_EQ(sizeof(test_data), n);
+	ASSERT_EQ(0, memcmp(buf, test_data, sizeof(test_data)));
+}
+
+/*
+ * Test: invalid flags should return EINVAL
+ */
+TEST(read_invalid_flags)
+{
+	uint8_t buf[8] = { 0 };
+	struct iovec local_iov = { .iov_base = buf, .iov_len = sizeof(buf) };
+	struct iovec remote_iov = {
+		.iov_base = (void *)test_data,
+		.iov_len = sizeof(test_data)
+	};
+	ssize_t n;
+
+	n = process_vm_readv(getpid(), &local_iov, 1, &remote_iov, 1, 255);
+	ASSERT_EQ(-1, n);
+	ASSERT_EQ(EINVAL, errno);
+}
+
+/*
+ * Test: invalid address should return EFAULT
+ */
+TEST(read_invalid_address)
+{
+	uint8_t buf[8] = { 0 };
+	struct iovec local_iov = { .iov_base = buf, .iov_len = sizeof(buf) };
+	struct iovec remote_iov = { .iov_base = NULL, .iov_len = 8 };
+	ssize_t n;
+
+	n = process_vm_readv(getpid(), &local_iov, 1, &remote_iov, 1, 0);
+	ASSERT_EQ(-1, n);
+	ASSERT_EQ(EFAULT, errno);
+}
+
+/*
+ * Test: invalid address with invalid flags should return EINVAL
+ * (flag check happens before address validation)
+ */
+TEST(read_invalid_address_invalid_flags)
+{
+	uint8_t buf[8] = { 0 };
+	struct iovec local_iov = { .iov_base = buf, .iov_len = sizeof(buf) };
+	struct iovec remote_iov = { .iov_base = NULL, .iov_len = 8 };
+	ssize_t n;
+
+	n = process_vm_readv(getpid(), &local_iov, 1, &remote_iov, 1, 255);
+	ASSERT_EQ(-1, n);
+	ASSERT_EQ(EINVAL, errno);
+}
+
+/*
+ * Test: invalid address with all valid flags should return EFAULT
+ * (flags are valid so we get past the flag check to the address check)
+ */
+TEST(read_invalid_address_all_valid_flags)
+{
+	int pidfd;
+	struct iovec local_iov = { .iov_base = NULL, .iov_len = 8 };
+	struct iovec remote_iov = { .iov_base = NULL, .iov_len = 8 };
+	ssize_t n;
+
+	pidfd = sys_pidfd_open(getpid(), 0);
+	ASSERT_GE(pidfd, 0);
+
+	n = process_vm_readv(pidfd, &local_iov, 1, &remote_iov, 1,
+			     PROCESS_VM_PIDFD | PROCESS_VM_NOWAIT);
+	ASSERT_EQ(-1, n);
+	ASSERT_EQ(EFAULT, errno);
+
+	close(pidfd);
+}
+
+/*
+ * Test: read with PIDFD flag
+ */
+TEST(read_pidfd)
+{
+	uint8_t buf[sizeof(test_data)];
+	struct iovec local_iov = { .iov_base = buf, .iov_len = sizeof(buf) };
+	struct iovec remote_iov = {
+		.iov_base = (void *)test_data,
+		.iov_len = sizeof(test_data)
+	};
+	ssize_t n;
+	int pidfd;
+
+	memset(buf, POISON_BYTE, sizeof(buf));
+	pidfd = sys_pidfd_open(getpid(), 0);
+	ASSERT_GE(pidfd, 0);
+
+	n = process_vm_readv(pidfd, &local_iov, 1, &remote_iov, 1,
+			     PROCESS_VM_PIDFD);
+	ASSERT_EQ(sizeof(test_data), n);
+	ASSERT_EQ(0, memcmp(buf, test_data, sizeof(test_data)));
+
+	close(pidfd);
+}
+
+/*
+ * Test: read with NOWAIT from resident memory (should succeed)
+ */
+TEST(read_nowait_resident)
+{
+	uint8_t buf[sizeof(test_data)];
+	struct iovec local_iov = { .iov_base = buf, .iov_len = sizeof(buf) };
+	struct iovec remote_iov = {
+		.iov_base = (void *)test_data,
+		.iov_len = sizeof(test_data)
+	};
+	ssize_t n;
+
+	memset(buf, POISON_BYTE, sizeof(buf));
+	n = process_vm_readv(getpid(), &local_iov, 1, &remote_iov, 1,
+			     PROCESS_VM_NOWAIT);
+	ASSERT_EQ(sizeof(test_data), n);
+	ASSERT_EQ(0, memcmp(buf, test_data, sizeof(test_data)));
+}
+
+/*
+ * Test: read with PIDFD + NOWAIT from resident memory
+ */
+TEST(read_pidfd_nowait_resident)
+{
+	uint8_t buf[sizeof(test_data)];
+	struct iovec local_iov = { .iov_base = buf, .iov_len = sizeof(buf) };
+	struct iovec remote_iov = {
+		.iov_base = (void *)test_data,
+		.iov_len = sizeof(test_data)
+	};
+	ssize_t n;
+	int pidfd;
+
+	memset(buf, POISON_BYTE, sizeof(buf));
+	pidfd = sys_pidfd_open(getpid(), 0);
+	ASSERT_GE(pidfd, 0);
+
+	n = process_vm_readv(pidfd, &local_iov, 1, &remote_iov, 1,
+			     PROCESS_VM_PIDFD | PROCESS_VM_NOWAIT);
+	ASSERT_EQ(sizeof(test_data), n);
+	ASSERT_EQ(0, memcmp(buf, test_data, sizeof(test_data)));
+
+	close(pidfd);
+}
+
+/*
+ * Userfaultfd helpers for NOWAIT tests
+ */
+static int setup_userfaultfd(void)
+{
+	struct uffdio_api api = { .api = UFFD_API };
+	int uffd;
+
+	uffd = syscall(__NR_userfaultfd, O_CLOEXEC | O_NONBLOCK);
+	if (uffd < 0)
+		return -1;
+
+	if (ioctl(uffd, UFFDIO_API, &api)) {
+		close(uffd);
+		return -1;
+	}
+
+	return uffd;
+}
+
+static void *register_uffd_region(int uffd, size_t size)
+{
+	struct uffdio_register reg;
+	void *mem;
+
+	mem = mmap(NULL, size, PROT_READ | PROT_WRITE,
+		   MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+	if (mem == MAP_FAILED)
+		return NULL;
+
+	reg.range.start = (unsigned long)mem;
+	reg.range.len = size;
+	reg.mode = UFFDIO_REGISTER_MODE_MISSING;
+	if (ioctl(uffd, UFFDIO_REGISTER, &reg)) {
+		munmap(mem, size);
+		return NULL;
+	}
+
+	return mem;
+}
+
+struct uffd_handler_args {
+	int uffd;
+	const void *content;
+	size_t content_len;
+};
+
+static void *uffd_handler_thread(void *arg)
+{
+	struct uffd_handler_args *ha = arg;
+	struct uffd_msg msg;
+	struct uffdio_copy copy;
+	struct pollfd pfd = {
+		.fd = ha->uffd,
+		.events = POLLIN
+	};
+	void *page;
+	long page_size = sysconf(_SC_PAGESIZE);
+	int ret;
+
+	page = mmap(NULL, page_size, PROT_READ | PROT_WRITE,
+		    MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+	if (page == MAP_FAILED)
+		return (void *)(long)-ENOMEM;
+
+	memcpy(page, ha->content, ha->content_len);
+
+	ret = poll(&pfd, 1, 5000);
+	if (ret <= 0)
+		goto out;
+
+	if (read(ha->uffd, &msg, sizeof(msg)) != sizeof(msg))
+		goto out;
+
+	if (msg.event != UFFD_EVENT_PAGEFAULT)
+		goto out;
+
+	copy.dst = msg.arg.pagefault.address & ~(page_size - 1);
+	copy.src = (unsigned long)page;
+	copy.len = page_size;
+	copy.mode = 0;
+	ioctl(ha->uffd, UFFDIO_COPY, &copy);
+
+out:
+	munmap(page, page_size);
+	return NULL;
+}
+
+/*
+ * Test: read from userfaultfd-registered memory (no flags, should block
+ * until page fault is resolved by handler thread)
+ */
+TEST(read_userfaultfd_blocking)
+{
+	int uffd;
+	void *mem;
+	long page_size = sysconf(_SC_PAGESIZE);
+	uint8_t buf[sizeof(test_data)];
+	struct iovec local_iov = { .iov_base = buf, .iov_len = sizeof(buf) };
+	struct iovec remote_iov;
+	struct uffd_handler_args ha;
+	pthread_t handler;
+	ssize_t n;
+
+	memset(buf, POISON_BYTE, sizeof(buf));
+
+	uffd = setup_userfaultfd();
+	ASSERT_GE(uffd, 0);
+
+	mem = register_uffd_region(uffd, page_size);
+	ASSERT_NE(NULL, mem);
+
+	ha.uffd = uffd;
+	ha.content = test_data;
+	ha.content_len = sizeof(test_data);
+	ASSERT_EQ(0, pthread_create(&handler, NULL, uffd_handler_thread, &ha));
+
+	remote_iov.iov_base = mem;
+	remote_iov.iov_len = sizeof(test_data);
+	n = process_vm_readv(getpid(), &local_iov, 1, &remote_iov, 1, 0);
+	ASSERT_EQ(sizeof(test_data), n);
+	ASSERT_EQ(0, memcmp(buf, test_data, sizeof(test_data)));
+
+	pthread_join(handler, NULL);
+	munmap(mem, page_size);
+	close(uffd);
+}
+
+/*
+ * Test: read with NOWAIT from userfaultfd-registered memory that has
+ * not been faulted in yet. Should return EFAULT (not block).
+ */
+TEST(read_nowait_userfaultfd)
+{
+	int uffd;
+	void *mem;
+	long page_size = sysconf(_SC_PAGESIZE);
+	uint8_t buf[sizeof(test_data)] = { 0 };
+	struct iovec local_iov = { .iov_base = buf, .iov_len = sizeof(buf) };
+	struct iovec remote_iov;
+	ssize_t n;
+
+	uffd = setup_userfaultfd();
+	ASSERT_GE(uffd, 0);
+
+	mem = register_uffd_region(uffd, page_size);
+	ASSERT_NE(NULL, mem);
+
+	/* Ensure the page is not present */
+	madvise(mem, page_size, MADV_DONTNEED);
+
+	remote_iov.iov_base = mem;
+	remote_iov.iov_len = sizeof(test_data);
+	n = process_vm_readv(getpid(), &local_iov, 1, &remote_iov, 1,
+			     PROCESS_VM_NOWAIT);
+	ASSERT_EQ(-1, n);
+	ASSERT_EQ(EFAULT, errno);
+
+	munmap(mem, page_size);
+	close(uffd);
+}
+
+TEST_HARNESS_MAIN
-- 
2.45.0

