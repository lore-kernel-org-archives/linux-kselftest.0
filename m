Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65795370D72
	for <linux-kselftest@vger.kernel.org>; Fri, 15 May 2026 14:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778855680; cv=none; b=X7WHWEDKKkBp+SesOOZxbBga+X27s1VuwpTplVHI7euLq1usvz6rR3mHi/zs8GYfn4zUt3Kf7hxLvwkfGniyw+JuqPFM3w8AcvaL5QFEEn12Po/7PnXS8j5tb0OzT9tuRk+BxtVWK+k9b759SM/wSE1ETrbnPzcXQmEvJ2K2DKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778855680; c=relaxed/simple;
	bh=3+un5tRZ6nomMHS5OwqRvFVZMAmYFO1URnDmHILQWvY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d6eLMZ9fJSfcFkk57wr/+SyIKdi41l/csHkoiBNkquSdqOkkmx7I0U2R2TD6bA/X//wFHdarMAJXCk5OvEVtp3DMuu8dXJ4/Xxz28f6lfB7UkUoJfoTYGei5YsGuZns/i8GoqT6b3RtJbo7C4y/LagwYcGUxCNHoYa4F5BDG14E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GwPrMF0R; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GwPrMF0R"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-44ccbd3290aso7614441f8f.2
        for <linux-kselftest@vger.kernel.org>; Fri, 15 May 2026 07:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778855677; x=1779460477; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eqcNYtqXHyuBuoGn/lDUKrSEtntd8NaZhDAVmVgi+Po=;
        b=GwPrMF0RP7hm7gOFhqL2MlNGUyiipc0AzFZnRNHHR+PVBKIR7OubKovzv9i+D7xJ6y
         91naO4jTzjomZ4RJB8XQTOOfeuoSnFN5zZ9O2qcMrzujE2b3psKX6dDP7oYFrxYzJu1d
         Puy3rb2sqXXL6KEOSFvX577RJDpjtrla6jcKiHnL4oFefqTfub4OMmQ7rG6B7hjJ1Qxd
         02AnbZsBCUksVi9ay8VgXcj3UpJaYjRrmnCNo49oSryjHjTRcHqe5JAb3KZXqWfM+3II
         yWtSyD9zNyuVce44j2jpNjbg/6kIfBfPIczfdRfhxiKJB+ml9L373aUmqRWAxYZhlry9
         gzcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778855677; x=1779460477;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eqcNYtqXHyuBuoGn/lDUKrSEtntd8NaZhDAVmVgi+Po=;
        b=LYG++66cXMjAxWbJ7g/BXjao8JF8O6zG2DpcktRBQ/Xsrt9VxQ5LaoCnEqzqfmQX/U
         tyGdhpvAvomkszz91waGHsQMQrCRmdROaO94yGhbuv+20yo3k1xQkQSCg+lvDY3ayXGq
         yRht7ji1w8XXhJDL9Nzlgu3J0siiKUesPp36ixxuu/Jg+Tn3wtWDBV5wglBBCQgHpwBM
         A7s23u+SFci1adN2NsG5MceDwOnpTJd4V2YY3GdrrCbuiBJCfe6lHIlgNs30OBze8GPb
         SVGFFA7QvOMZmQ661jMXIuBDsYiyjsrhAApmQHuoriWllvbDHX4oZlfhftstAl6wjXrz
         /4cw==
X-Forwarded-Encrypted: i=1; AFNElJ/FxehmkmbrCuhlQ2YK404zz1+03G5QaUebyZPAWaKNEjG49ynIVwzV4o5GJUOhZNKUsy92tM3+wB5sznTWLmM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzcWZPGoijA1hvqv2tUBDQu0QDxexTgsq1s8Bb9Wdy0cpP7FI94
	i0NsN18W34m43/0Cipqcl/dEqYCyl72255HfN9iTrX2yLyLTKtIh/vsT
X-Gm-Gg: Acq92OGZ+3L06j+DFciu8puHUD3j3nb6U4ZLEmqHqpIB/kQYbJZhlrBiCf0YCvxsYRu
	cUNapLTNjaKG94mwiWzN+PfHSbjuXrdiG69HK5Rj1XhQN2p1oEvd4hyi6YVOcV+k5HFSdFmoXu2
	nvK1llmh/7CQcfntCG9spmzyN0wVItN6v5QW2zXEdC2mXrqI7JfnY/Rwzu2KMCHc5OplfCyA+6f
	pTCazFlNY9PD9Rjsp1P3NsxE3pZt1Ysr9Fe/o7h2a3RAvQAZUEvDgJBswhAaaQI18QqrKiw9aDQ
	Om/rBPb4w44j4gCxlAuCTPuz2SnRObpx5+IekTIasCtCyRSYo8SIPtw9jqiw1xuZgO8H7Zkmrb/
	+oo2wdC9qalCib+tMUgGaP/NNIcLK31YfyYXwbVrPIq7m0q32ABhdleC99wvOmocvlU0ksOayca
	E7Zq+rAD7Rd8Ipg30Ck2F9DODo
X-Received: by 2002:a05:6000:290d:b0:43f:e934:50ac with SMTP id ffacd0b85a97d-45e5c362c4bmr6167043f8f.7.1778855676572;
        Fri, 15 May 2026 07:34:36 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8308:b093:bb00::bc35])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9e767d16sm15773464f8f.6.2026.05.15.07.34.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 07:34:36 -0700 (PDT)
Sender: Alban Crequy <muadda@gmail.com>
From: Alban Crequy <alban.crequy@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Christian Brauner <brauner@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
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
	shuah@kernel.org,
	Usama Arif <usama.arif@linux.dev>,
	David Laight <david.laight.linux@gmail.com>
Subject: [PATCH v4 2/2] selftests/mm: add tests for process_vm_readv flags
Date: Fri, 15 May 2026 16:33:35 +0200
Message-ID: <20260515143335.739511-3-alban.crequy@gmail.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20260515143335.739511-1-alban.crequy@gmail.com>
References: <20260515143335.739511-1-alban.crequy@gmail.com>
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
- invalid pidfd (EBADF)
- invalid pid (ESRCH)
- PROCESS_VM_PIDFD: read via pidfd
- PROCESS_VM_NOWAIT: read from resident memory
- PROCESS_VM_PIDFD | PROCESS_VM_NOWAIT combined
- userfaultfd blocking read (no flags)
- PROCESS_VM_NOWAIT with userfaultfd (non-blocking, returns EFAULT)
- PROCESS_VM_NOWAIT partial read with single iovec across resident
  and non-resident pages (returns page_size bytes)
- PROCESS_VM_NOWAIT partial read with two iovecs, first resident,
  second non-resident (returns page_size bytes)

Tests gracefully SKIP on kernels without PROCESS_VM_PIDFD or
PROCESS_VM_NOWAIT support (EINVAL).

Signed-off-by: Alban Crequy <albancrequy@microsoft.com>
---
v4:
- Add selftests for NOWAIT partial reads across resident and
  non-resident pages (single iovec and two iovecs)
- SKIP tests gracefully on kernels without flag support (Sashiko)
- Verify content of partial reads

v3:
- Add selftest for invalid pidfd (David Hildenbrand)
- Add selftest for invalid pid
- SKIP on kernels without PROCESS_VM_PIDFD support
- Remove hardcoded __NR_pidfd_open fallback, use <sys/syscall.h> (Sashiko)
- SKIP pidfd tests on kernels without pidfd_open (ENOSYS) (Sashiko)
- SKIP userfaultfd tests when unprivileged userfaultfd is disabled (EPERM) (Sashiko)
- Fault in test_data before NOWAIT tests to ensure page is resident (Sashiko)
- Add ksft_process_vm_readv.sh wrapper and run_vmtests.sh entry

v2:
- New patch.

 tools/testing/selftests/mm/Makefile           |   2 +
 .../selftests/mm/ksft_process_vm_readv.sh     |   4 +
 tools/testing/selftests/mm/process_vm_readv.c | 573 ++++++++++++++++++
 tools/testing/selftests/mm/run_vmtests.sh     |   4 +
 4 files changed, 583 insertions(+)
 create mode 100755 tools/testing/selftests/mm/ksft_process_vm_readv.sh
 create mode 100644 tools/testing/selftests/mm/process_vm_readv.c

diff --git a/tools/testing/selftests/mm/Makefile b/tools/testing/selftests/mm/Makefile
index cd24596cdd27..feb3a0b9a57e 100644
--- a/tools/testing/selftests/mm/Makefile
+++ b/tools/testing/selftests/mm/Makefile
@@ -106,6 +106,7 @@ TEST_GEN_FILES += guard-regions
 TEST_GEN_FILES += merge
 TEST_GEN_FILES += rmap
 TEST_GEN_FILES += folio_split_race_test
+TEST_GEN_FILES += process_vm_readv
 
 ifneq ($(ARCH),arm64)
 TEST_GEN_FILES += soft-dirty
@@ -167,6 +168,7 @@ TEST_PROGS += ksft_pfnmap.sh
 TEST_PROGS += ksft_pkey.sh
 TEST_PROGS += ksft_process_madv.sh
 TEST_PROGS += ksft_process_mrelease.sh
+TEST_PROGS += ksft_process_vm_readv.sh
 TEST_PROGS += ksft_rmap.sh
 TEST_PROGS += ksft_soft_dirty.sh
 TEST_PROGS += ksft_thp.sh
diff --git a/tools/testing/selftests/mm/ksft_process_vm_readv.sh b/tools/testing/selftests/mm/ksft_process_vm_readv.sh
new file mode 100755
index 000000000000..09d0fcc9a35d
--- /dev/null
+++ b/tools/testing/selftests/mm/ksft_process_vm_readv.sh
@@ -0,0 +1,4 @@
+#!/bin/sh -e
+# SPDX-License-Identifier: GPL-2.0
+
+./run_vmtests.sh -t process_vm_readv
diff --git a/tools/testing/selftests/mm/process_vm_readv.c b/tools/testing/selftests/mm/process_vm_readv.c
new file mode 100644
index 000000000000..c6ce7ed75c98
--- /dev/null
+++ b/tools/testing/selftests/mm/process_vm_readv.c
@@ -0,0 +1,573 @@
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
+	if (pidfd < 0 && errno == ENOSYS)
+		SKIP(return, "pidfd_open not supported");
+	ASSERT_GE(pidfd, 0);
+
+	n = process_vm_readv(pidfd, &local_iov, 1, &remote_iov, 1,
+			     PROCESS_VM_PIDFD | PROCESS_VM_NOWAIT);
+	ASSERT_EQ(-1, n);
+	if (errno == EINVAL)
+		SKIP(return,
+		     "PROCESS_VM_PIDFD or PROCESS_VM_NOWAIT not supported");
+	ASSERT_EQ(EFAULT, errno);
+
+	close(pidfd);
+}
+
+/*
+ * Test: read with an invalid pidfd should return an error, not crash
+ */
+TEST(read_invalid_pidfd)
+{
+	uint8_t buf[sizeof(test_data)] = { 0 };
+	struct iovec local_iov = { .iov_base = buf, .iov_len = sizeof(buf) };
+	struct iovec remote_iov = {
+		.iov_base = (void *)test_data,
+		.iov_len = sizeof(test_data)
+	};
+	ssize_t n;
+
+	/* fd 9999 is almost certainly not a valid pidfd */
+	n = process_vm_readv(9999, &local_iov, 1, &remote_iov, 1,
+			     PROCESS_VM_PIDFD);
+	ASSERT_EQ(-1, n);
+	if (errno == EINVAL)
+		SKIP(return, "PROCESS_VM_PIDFD not supported");
+	ASSERT_EQ(EBADF, errno);
+}
+
+/*
+ * Test: read with an invalid pid should return ESRCH
+ */
+TEST(read_invalid_pid)
+{
+	uint8_t buf[sizeof(test_data)] = { 0 };
+	struct iovec local_iov = { .iov_base = buf, .iov_len = sizeof(buf) };
+	struct iovec remote_iov = {
+		.iov_base = (void *)test_data,
+		.iov_len = sizeof(test_data)
+	};
+	ssize_t n;
+
+	/* pid 999999 is almost certainly not a valid process */
+	n = process_vm_readv(999999, &local_iov, 1, &remote_iov, 1, 0);
+	ASSERT_EQ(-1, n);
+	ASSERT_EQ(ESRCH, errno);
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
+	if (pidfd < 0 && errno == ENOSYS)
+		SKIP(return, "pidfd_open not supported");
+	ASSERT_GE(pidfd, 0);
+
+	n = process_vm_readv(pidfd, &local_iov, 1, &remote_iov, 1,
+			     PROCESS_VM_PIDFD);
+	if (n == -1 && errno == EINVAL)
+		SKIP(return, "PROCESS_VM_PIDFD not supported");
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
+	*(volatile uint64_t *)test_data; /* fault in page for NOWAIT */
+	memset(buf, POISON_BYTE, sizeof(buf));
+	n = process_vm_readv(getpid(), &local_iov, 1, &remote_iov, 1,
+			     PROCESS_VM_NOWAIT);
+	if (n == -1 && errno == EINVAL)
+		SKIP(return, "PROCESS_VM_NOWAIT not supported");
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
+	*(volatile uint64_t *)test_data; /* fault in page for NOWAIT */
+	memset(buf, POISON_BYTE, sizeof(buf));
+	pidfd = sys_pidfd_open(getpid(), 0);
+	if (pidfd < 0 && errno == ENOSYS)
+		SKIP(return, "pidfd_open not supported");
+	ASSERT_GE(pidfd, 0);
+
+	n = process_vm_readv(pidfd, &local_iov, 1, &remote_iov, 1,
+			     PROCESS_VM_PIDFD | PROCESS_VM_NOWAIT);
+	if (n == -1 && errno == EINVAL)
+		SKIP(return, "PROCESS_VM_PIDFD or PROCESS_VM_NOWAIT not supported");
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
+		return -errno;
+
+	if (ioctl(uffd, UFFDIO_API, &api)) {
+		close(uffd);
+		return -errno;
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
+	struct uffdio_copy uffd_copy;
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
+	uffd_copy.dst = msg.arg.pagefault.address & ~(page_size - 1);
+	uffd_copy.src = (unsigned long)page;
+	uffd_copy.len = page_size;
+	uffd_copy.mode = 0;
+	ioctl(ha->uffd, UFFDIO_COPY, &uffd_copy);
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
+	if (uffd == -EPERM)
+		SKIP(return, "userfaultfd requires privileges (vm.unprivileged_userfaultfd=0)");
+	if (uffd == -ENOSYS)
+		SKIP(return, "userfaultfd not supported");
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
+	if (uffd == -EPERM)
+		SKIP(return, "userfaultfd requires privileges (vm.unprivileged_userfaultfd=0)");
+	if (uffd == -ENOSYS)
+		SKIP(return, "userfaultfd not supported");
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
+	if (n == -1 && errno == EINVAL)
+		SKIP(return, "PROCESS_VM_NOWAIT not supported");
+	ASSERT_EQ(-1, n);
+	ASSERT_EQ(EFAULT, errno);
+
+	munmap(mem, page_size);
+	close(uffd);
+}
+
+/*
+ * Test: NOWAIT read across two pages with a single iovec, where the
+ * first page is resident and the second is not. Tests whether a
+ * partial read within a single iovec element is possible.
+ */
+TEST(read_nowait_partial_single_iovec)
+{
+	int uffd;
+	void *mem;
+	long page_size = sysconf(_SC_PAGESIZE);
+	uint8_t *buf;
+	struct iovec local_iov;
+	struct iovec remote_iov;
+	struct uffdio_copy uffd_copy;
+	ssize_t n;
+	void *src_page;
+
+	uffd = setup_userfaultfd();
+	if (uffd == -EPERM)
+		SKIP(return, "userfaultfd requires privileges (vm.unprivileged_userfaultfd=0)");
+	if (uffd == -ENOSYS)
+		SKIP(return, "userfaultfd not supported");
+	ASSERT_GE(uffd, 0);
+
+	/* Allocate 2 pages and register with userfaultfd */
+	mem = register_uffd_region(uffd, 2 * page_size);
+	ASSERT_NE(NULL, mem);
+
+	/* Resolve page 1 via UFFDIO_COPY, leave page 2 missing */
+	src_page = mmap(NULL, page_size, PROT_READ | PROT_WRITE,
+			MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+	ASSERT_NE(MAP_FAILED, src_page);
+	memset(src_page, 0xAA, page_size);
+
+	uffd_copy.dst = (unsigned long)mem;
+	uffd_copy.src = (unsigned long)src_page;
+	uffd_copy.len = page_size;
+	uffd_copy.mode = 0;
+	ASSERT_EQ(0, ioctl(uffd, UFFDIO_COPY, &uffd_copy));
+	munmap(src_page, page_size);
+
+	/* Read across both pages with a single iovec */
+	buf = malloc(2 * page_size);
+	ASSERT_NE(NULL, buf);
+	memset(buf, POISON_BYTE, 2 * page_size);
+
+	local_iov.iov_base = buf;
+	local_iov.iov_len = 2 * page_size;
+	remote_iov.iov_base = mem;
+	remote_iov.iov_len = 2 * page_size;
+
+	n = process_vm_readv(getpid(), &local_iov, 1, &remote_iov, 1,
+			     PROCESS_VM_NOWAIT);
+	if (n == -1 && errno == EINVAL)
+		SKIP(return, "PROCESS_VM_NOWAIT not supported");
+	ASSERT_EQ(page_size, n);
+
+	/* Verify the first page was read correctly */
+	for (int i = 0; i < page_size; i++)
+		ASSERT_EQ(0xAA, buf[i]);
+
+	free(buf);
+	munmap(mem, 2 * page_size);
+	close(uffd);
+}
+
+/*
+ * Test: NOWAIT read across two pages with two iovecs (one per page),
+ * where the first page is resident and the second is not. Tests
+ * whether the syscall returns bytes from the first iovec.
+ */
+TEST(read_nowait_partial_two_iovecs)
+{
+	int uffd;
+	void *mem;
+	long page_size = sysconf(_SC_PAGESIZE);
+	uint8_t *buf1, *buf2;
+	struct iovec local_iov[2];
+	struct iovec remote_iov[2];
+	struct uffdio_copy uffd_copy;
+	ssize_t n;
+	void *src_page;
+
+	uffd = setup_userfaultfd();
+	if (uffd == -EPERM)
+		SKIP(return, "userfaultfd requires privileges (vm.unprivileged_userfaultfd=0)");
+	if (uffd == -ENOSYS)
+		SKIP(return, "userfaultfd not supported");
+	ASSERT_GE(uffd, 0);
+
+	/* Allocate 2 pages and register with userfaultfd */
+	mem = register_uffd_region(uffd, 2 * page_size);
+	ASSERT_NE(NULL, mem);
+
+	/* Resolve page 1 via UFFDIO_COPY, leave page 2 missing */
+	src_page = mmap(NULL, page_size, PROT_READ | PROT_WRITE,
+			MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+	ASSERT_NE(MAP_FAILED, src_page);
+	memset(src_page, 0xBB, page_size);
+
+	uffd_copy.dst = (unsigned long)mem;
+	uffd_copy.src = (unsigned long)src_page;
+	uffd_copy.len = page_size;
+	uffd_copy.mode = 0;
+	ASSERT_EQ(0, ioctl(uffd, UFFDIO_COPY, &uffd_copy));
+	munmap(src_page, page_size);
+
+	/* Two iovecs: one for each page */
+	buf1 = malloc(page_size);
+	buf2 = malloc(page_size);
+	ASSERT_NE(NULL, buf1);
+	ASSERT_NE(NULL, buf2);
+	memset(buf1, POISON_BYTE, page_size);
+	memset(buf2, POISON_BYTE, page_size);
+
+	local_iov[0].iov_base = buf1;
+	local_iov[0].iov_len = page_size;
+	local_iov[1].iov_base = buf2;
+	local_iov[1].iov_len = page_size;
+
+	remote_iov[0].iov_base = mem;
+	remote_iov[0].iov_len = page_size;
+	remote_iov[1].iov_base = (char *)mem + page_size;
+	remote_iov[1].iov_len = page_size;
+
+	n = process_vm_readv(getpid(), local_iov, 2, remote_iov, 2,
+			     PROCESS_VM_NOWAIT);
+	if (n == -1 && errno == EINVAL)
+		SKIP(return, "PROCESS_VM_NOWAIT not supported");
+	ASSERT_EQ(page_size, n);
+
+	/* Verify the first page was read correctly */
+	for (int i = 0; i < page_size; i++)
+		ASSERT_EQ(0xBB, buf1[i]);
+
+	free(buf1);
+	free(buf2);
+	munmap(mem, 2 * page_size);
+	close(uffd);
+}
+
+TEST_HARNESS_MAIN
diff --git a/tools/testing/selftests/mm/run_vmtests.sh b/tools/testing/selftests/mm/run_vmtests.sh
index d8468451b3a3..7d30f6101088 100755
--- a/tools/testing/selftests/mm/run_vmtests.sh
+++ b/tools/testing/selftests/mm/run_vmtests.sh
@@ -91,6 +91,8 @@ separated by spaces:
 	test VMA merge cases behave as expected
 - rmap
 	test rmap behaves as expected
+- process_vm_readv
+	test process_vm_readv flags (pidfd, nowait)
 - memory-failure
 	test memory-failure behaves as expected
 
@@ -531,6 +533,8 @@ CATEGORY="page_frag" run_test ./test_page_frag.sh nonaligned
 
 CATEGORY="rmap" run_test ./rmap
 
+CATEGORY="process_vm_readv" run_test ./process_vm_readv
+
 # Try to load hwpoison_inject if not present.
 HWPOISON_DIR=/sys/kernel/debug/hwpoison/
 if [ ! -d "$HWPOISON_DIR" ]; then
-- 
2.45.0

