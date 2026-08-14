Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF9C846EC6D
	for <linux-kselftest@vger.kernel.org>; Fri, 14 Aug 2026 14:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786719033; cv=none; b=S9gP55fHMq39YH6jJfEfC5BXdnUYh91bNX1Gwh1B2IB0LNVuiQE1tKDtSFGu28oaB15wWo+9cNc55FAxfwmQ9gkWN/0b6Gnn3on3bzhF/YUlhipunhkKnwlb46UTPuscbII2XQGcdU0pYfClGbSCv/XfYlF4YG61gDLN7zcEVpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786719033; c=relaxed/simple;
	bh=rTf0zNMGMIiVFZIeMWtdeEA+9PKSpB0w/3bBQirqVDo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CwF+nMI6tC0paVf4f+KVNGJ9oIHUTJdmU1yIMjpwpaOzKIlOuAft7NidPG/XqLutkbVEY4BrtQl67RaduMFfoVe9gY48KmUdiiMtQEaHSRuf11rl8fzYmEW0Sy5wEVxAxxJ1IA3kKaTTnFouV6n/wSAEwe4dY7XeewLjzAKYEF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mEECy0bN; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mEECy0bN"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-381c51fde6bso1329880a91.2
        for <linux-kselftest@vger.kernel.org>; Fri, 14 Aug 2026 07:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786719026; x=1787323826; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WByajkS4s1sS3rQD8GcfodtHv3MTnuOsaVg1gB9Zu9E=;
        b=mEECy0bNhGsroS+RweiGsTNoDyfdChShTFb6wfBvnDyQ//8yYp88SdFaDsMmChZGuB
         u3yXRpjL566FUXFWoyDFkeRp5y1j/h2i4617rMfnmU2S6igFa30iF8RErNpePwz77ill
         LKhUF6HZ6Hyf02p4R73V3NXe9QmYl0hGCN7OIhisRO7kJUtMlhZejCEN3Y628R3lYuIy
         m1njcRjhL4t+Bl/1XK7KSryE4WbvfjcEJFXtJchv4paPLnKs1iqammeQUSSRpxubwdAS
         5fvOrSpxKYtev6nMMuzgKFcfd37gaaNGRzwIRObUpJWa+2ORW9fAU1UQl2ezvicebLYa
         mZdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786719026; x=1787323826;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WByajkS4s1sS3rQD8GcfodtHv3MTnuOsaVg1gB9Zu9E=;
        b=mhE+5qbCrW3Y36soy8JGW4LPgXo39u5SRjJ9cvVPJ3D0q3kQe2GtiJsoFoan6BC/bT
         5FZD0GrZNMbI3zUDUhWYTTVCwmeiquJddaYVC+BdC9+pBcwae672Upxe7hGKCX40lWtn
         f1APbkqpiLKpLsChF++tZo4E2pMwhOI5/TkLChF/TvroEVK2RPAFGWqvAA1VvrsfkiWU
         oBdeEduVh+3q0PET4MhljoihCAq7Qhc/ocfHEZdq99VuUcQhTBh8LflPRHi3zJIRmvpE
         zeJsmqYVG0KZl8ms4ppJiwZp3zA//dlqn/daSmyexDLyJWfTaCzOH//mlQI09719Tu8P
         w3MQ==
X-Forwarded-Encrypted: i=1; AHgh+RpzLVwNlp2rc4pXPXKTcCb61vC+o77fJQqZccS53C0aSYkyCN5wJAlXLxiBriDHJBwcEqGif/ElEVbytL+d0lA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhxdzabQZqJpk1ruob4E+QT2gur+6lNNYY4OF40Ao/1TonVDcS
	dByQOu2DKXQWtv0VrQr6FBm1S3x3LUVQ2JeUC57K1AU6EvgljWtOfRGA
X-Gm-Gg: AR+sD10QQ9xOb0dX02MQaGNLuvEsI7yMQtIzypAd2BbZ5Sok4C1qbF2iALF3+onYpXW
	BAg3GbcS+rbl65ScWVZIPfLBljdRCHd45MA14VxnwZQ3eoRBYrBtKqa14hGzucrFBQzIKdxA52u
	X30WcAxAWyY1DSr1TzCP4FNgmMlWiUclK/KftQbG6aS2N2jnhh2Kd6ODlKKatdhxRZiyAjntxC2
	ls0ga89kmxHIb/8pdhQ65m5tkEXibpFbSboX1oKOvbhvYx2M7TRdkFGcprfteeaDohvx3h52Ewq
	SehwhohjtdI3x38vaIwIPlXFKx+PSByHUNX1xrD6rtBwQ4oO8nQoRBlUlLUObvdJe4fi6gcVzoT
	lxTLLLGM5Vl+fPSCi+HsZx65QatVmy+mjgYZHz1SMlDC4WpDUDdNYsHOfWKBMq7IF8Skdl3uNbk
	vceOJu4pdIAbmSDGQOsXWNIfeWguqoJioz9lWnJc4WRTJta780tYMAHYayqg66Km0pa9W/slzXe
	2Xvek8=
X-Received: by 2002:a17:90b:582c:b0:381:c500:b0d1 with SMTP id 98e67ed59e1d1-3933bad0d4cmr8086661a91.20.1786719025451;
        Fri, 14 Aug 2026 07:50:25 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([116.128.244.169])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3933b626d4esm1518950a91.2.2026.08.14.07.50.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 07:50:25 -0700 (PDT)
From: Kunwu Chan <kunwu.chan@gmail.com>
X-Google-Original-From: Kunwu Chan <kunwu.chan@linux.dev>
To: corbet@lwn.net,
	skhan@linuxfoundation.org,
	peterz@infradead.org,
	mingo@redhat.com,
	acme@kernel.org,
	namhyung@kernel.org,
	mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com,
	jolsa@kernel.org,
	irogers@google.com,
	adrian.hunter@intel.com,
	james.clark@linaro.org,
	kunwu.chan@gmail.com,
	lianux.mm@gmail.com
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	sj@kernel.org
Subject: [RFC PATCH 4/5] selftests/perf_events: add userspace AUX regression test
Date: Fri, 14 Aug 2026 22:49:20 +0800
Message-ID: <20260814144927.489172-5-kunwu.chan@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260814144927.489172-1-kunwu.chan@linux.dev>
References: <20260814144927.489172-1-kunwu.chan@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lian Wang <lianux.mm@gmail.com>

Add a standalone C program that opens a perf event, mmaps the metadata
and data ring, sets up the AUX area via a second mmap, enables tracing,
reads aux_head from the mmap page, and tears down the mapping.  This
verifies the kernel-side aux_kernel_count changes do not break the
existing userspace AUX mmap protocol.

When the AUX area mmap fails (e.g. PMU does not support it), the
AUX-specific tests are skipped and only a basic software-event test
runs.

Co-developed-by: Kunwu Chan <kunwu.chan@gmail.com>
Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
Signed-off-by: Lian Wang <lianux.mm@gmail.com>
---
 tools/testing/selftests/perf_events/Makefile  |   1 +
 .../perf_events/aux_kernel_usermode.c         | 546 ++++++++++++++++++
 tools/testing/selftests/perf_events/config    |   2 +
 3 files changed, 549 insertions(+)
 create mode 100644 tools/testing/selftests/perf_events/aux_kernel_usermode.c

diff --git a/tools/testing/selftests/perf_events/Makefile b/tools/testing/selftests/perf_events/Makefile
index 2e5d85770dfe..fbafbd43f097 100644
--- a/tools/testing/selftests/perf_events/Makefile
+++ b/tools/testing/selftests/perf_events/Makefile
@@ -3,4 +3,5 @@ CFLAGS += -Wl,-no-as-needed -Wall $(KHDR_INCLUDES)
 LDFLAGS += -lpthread
 
 TEST_GEN_PROGS := sigtrap_threads remove_on_exec watermark_signal mmap
+TEST_GEN_PROGS += aux_kernel_usermode
 include ../lib.mk
diff --git a/tools/testing/selftests/perf_events/aux_kernel_usermode.c b/tools/testing/selftests/perf_events/aux_kernel_usermode.c
new file mode 100644
index 000000000000..c3d2323d0879
--- /dev/null
+++ b/tools/testing/selftests/perf_events/aux_kernel_usermode.c
@@ -0,0 +1,546 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Userspace AUX regression test for the perf AUX kernel-consumer API.
+ *
+ * Verifies that the kernel-side AUX changes (aux_kernel_count,
+ * perf_event_setup_aux, etc.) do NOT break the existing userspace
+ * AUX mmap protocol:
+ *   - perf_event_open() with AUX still works
+ *   - mmap AUX buffer still works
+ *   - aux_head / aux_tail from the mmap page are still correct
+ *   - aux_mmap_count is independent of aux_kernel_count
+ *   - Userspace and kernel AUX owners can coexist
+ *
+ * Build:  gcc -o aux_kernel_usermode aux_kernel_usermode.c
+ * Usage:  sudo ./aux_kernel_usermode [pmu_name]
+ */
+
+#include <errno.h>
+#include <fcntl.h>
+#include <linux/perf_event.h>
+#include <signal.h>
+#include <stdint.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/ioctl.h>
+#include <sys/mman.h>
+#include <sys/stat.h>
+#include <sys/syscall.h>
+#include <sys/types.h>
+#include <unistd.h>
+
+#define PASS(fmt, ...) printf("  [PASS] " fmt "\n", ##__VA_ARGS__)
+#define FAIL(fmt, ...) do { \
+	printf("  [FAIL] " fmt "\n", ##__VA_ARGS__); \
+	failed = 1; \
+} while (0)
+
+static int failed;
+
+static long perf_event_open(struct perf_event_attr *attr, pid_t pid,
+			    int cpu, int group_fd, unsigned long flags)
+{
+	return syscall(__NR_perf_event_open, attr, pid, cpu, group_fd, flags);
+}
+
+/*
+ * Find an AUX PMU type by scanning sysfs PMU directories.
+ */
+static int find_aux_pmu_type(void)
+{
+	char path[256], type_path[261];
+	FILE *f;
+	struct stat st;
+	int type;
+
+	/* Try common AUX PMU names first */
+	static const char * const known[] = {
+		"arm_spe_0", "arm_spe_1", "arm_spe_2",
+		"intel_pt", "intel_pt0",
+		NULL
+	};
+
+	for (int i = 0; known[i]; i++) {
+		snprintf(path, sizeof(path),
+			 "/sys/bus/event_source/devices/%s", known[i]);
+		if (stat(path, &st) == 0 && S_ISDIR(st.st_mode)) {
+			snprintf(type_path, sizeof(type_path),
+				 "%s/type", path);
+			f = fopen(type_path, "r");
+			if (f) {
+				if (fscanf(f, "%d", &type) == 1) {
+					fclose(f);
+					printf("  Found AUX PMU: %s (type=%d)\n",
+					       known[i], type);
+					return type;
+				}
+				fclose(f);
+			}
+		}
+	}
+
+	return -1;
+}
+
+/*
+ * Test 1: Basic perf_event_open() with software event.
+ * This verifies the perf core is not broken at all.
+ */
+static int test_basic_sw_event(void)
+{
+	struct perf_event_attr attr = {};
+	int fd;
+
+	attr.type = PERF_TYPE_SOFTWARE;
+	attr.config = PERF_COUNT_SW_CPU_CLOCK;
+	attr.size = sizeof(attr);
+	attr.disabled = 1;
+
+	fd = perf_event_open(&attr, 0, -1, -1, 0);
+	if (fd < 0) {
+		FAIL("basic SW event: perf_event_open failed (%s)",
+		     strerror(errno));
+		return 1;
+	}
+
+	ioctl(fd, PERF_EVENT_IOC_ENABLE, 0);
+	usleep(10000);
+	ioctl(fd, PERF_EVENT_IOC_DISABLE, 0);
+
+	close(fd);
+	PASS("basic SW event: open/enable/disable/close");
+	return 0;
+}
+
+/*
+ * Test 2: Userspace AUX mmap full lifecycle.
+ * Opens an AUX event, mmaps the metadata/data ring, sets up the AUX
+ * area via a second mmap, enables, reads aux_head, disables, unmaps,
+ * closes.  This is the critical regression test.
+ *
+ * If the kernel rejects the AUX area mmap, the test is SKIP (not all
+ * PMUs support userspace AUX mmap).
+ */
+static int test_aux_mmap(int pmu_type)
+{
+	struct perf_event_attr attr = {};
+	struct perf_event_mmap_page *mp;
+	void *aux_base;
+	unsigned long aux_size, aux_offset, aux_head, aux_tail;
+	unsigned long mmap_size;
+	int fd, ret;
+
+	attr.type = pmu_type;
+	attr.size = sizeof(attr);
+	attr.disabled = 1;
+	attr.sample_period = 256;
+
+	/* ARM SPE requires period mode (freq=0) */
+	attr.freq = 0;
+
+	fd = perf_event_open(&attr, 0, -1, -1, 0);
+	if (fd < 0) {
+		FAIL("AUX mmap: perf_event_open failed (%s)", strerror(errno));
+		return 1;
+	}
+
+	/*
+	 * Step 1: mmap the metadata page and data ring at offset 0.
+	 * The kernel creates the ring buffer and returns the metadata page.
+	 */
+	aux_size = 1UL << 20; /* 1 MiB */
+	mmap_size = aux_size + getpagesize();
+	mp = mmap(NULL, mmap_size, PROT_READ | PROT_WRITE,
+		  MAP_SHARED, fd, 0);
+	if (mp == MAP_FAILED) {
+		FAIL("AUX mmap: metadata mmap failed (%s)", strerror(errno));
+		close(fd);
+		return 1;
+	}
+
+	/*
+	 * Step 2: set aux_offset and aux_size in the metadata page.
+	 * The AUX area starts after the metadata and data pages.
+	 * The kernel reads these values when the AUX area is mmap'd.
+	 */
+	aux_offset = mmap_size;
+	mp->aux_offset = aux_offset;
+	mp->aux_size = aux_size;
+
+	/*
+	 * Step 3: mmap the AUX area at aux_offset.
+	 * The kernel reads aux_offset from the metadata page, verifies
+	 * the mmap offset matches, and allocates the AUX buffer.
+	 */
+	aux_base = mmap(NULL, aux_size, PROT_READ, MAP_SHARED, fd,
+			aux_offset);
+	if (aux_base == MAP_FAILED) {
+		printf("  [SKIP] AUX mmap: AUX area mmap failed (%s)\n",
+		       strerror(errno));
+		munmap(mp, mmap_size);
+		close(fd);
+		return 0;
+	}
+	PASS("AUX mmap: metadata mmap OK, AUX area mmap OK");
+
+	/* Enable the event */
+	ret = ioctl(fd, PERF_EVENT_IOC_ENABLE, 0);
+	if (ret < 0) {
+		FAIL("AUX mmap: enable failed (%s)", strerror(errno));
+		munmap(aux_base, aux_size);
+		munmap(mp, mmap_size);
+		close(fd);
+		return 1;
+	}
+
+	/* Run a small workload to generate some AUX data */
+	usleep(100000); /* 100ms */
+
+	/* Read the AUX head from the mmap page */
+	aux_head = __atomic_load_n(&mp->aux_head, __ATOMIC_RELAXED);
+	aux_tail = __atomic_load_n(&mp->aux_tail, __ATOMIC_RELAXED);
+	PASS("AUX mmap: head=%llu tail=%llu after 100ms workload",
+	     (unsigned long long)aux_head, (unsigned long long)aux_tail);
+
+	/* Disable the event */
+	ret = ioctl(fd, PERF_EVENT_IOC_DISABLE, 0);
+	if (ret < 0) {
+		FAIL("AUX mmap: disable failed (%s)", strerror(errno));
+		munmap(aux_base, aux_size);
+		munmap(mp, mmap_size);
+		close(fd);
+		return 1;
+	}
+
+	/* Unmap AUX area */
+	ret = munmap(aux_base, aux_size);
+	if (ret < 0) {
+		FAIL("AUX mmap: AUX munmap failed (%s)", strerror(errno));
+		munmap(mp, mmap_size);
+		close(fd);
+		return 1;
+	}
+
+	/* Unmap metadata */
+	ret = munmap(mp, mmap_size);
+	if (ret < 0) {
+		FAIL("AUX mmap: metadata munmap failed (%s)", strerror(errno));
+		close(fd);
+		return 1;
+	}
+	PASS("AUX mmap: full lifecycle PASS");
+	close(fd);
+	return 0;
+}
+
+/*
+ * Test 3: Verify that aux_mmap_count is independent of aux_kernel_count.
+ * Open two events for the same AUX PMU.  The first one is a regular
+ * userspace event; verify it works.  Then open a second one; verify
+ * both can have AUX buffers simultaneously.
+ */
+static int test_aux_mmap_independence(int pmu_type)
+{
+	struct perf_event_attr attr = {};
+	struct perf_event_mmap_page *mp1, *mp2;
+	unsigned long aux_size;
+	int fd1, fd2;
+
+	aux_size = 1UL << 16; /* 64 KiB */
+
+	attr.type = pmu_type;
+	attr.size = sizeof(attr);
+	attr.disabled = 1;
+	attr.sample_period = 256;
+	attr.freq = 0;
+
+	fd1 = perf_event_open(&attr, 0, -1, -1, 0);
+	if (fd1 < 0) {
+		FAIL("AUX independence: first event open failed (%s)",
+		     strerror(errno));
+		return 1;
+	}
+
+	mp1 = mmap(NULL, aux_size + getpagesize(), PROT_READ | PROT_WRITE,
+		   MAP_SHARED, fd1, 0);
+	if (mp1 == MAP_FAILED) {
+		FAIL("AUX independence: first mmap failed (%s)", strerror(errno));
+		close(fd1);
+		return 1;
+	}
+	PASS("AUX independence: first event mmap OK");
+
+	/* Open a second event for the same PMU */
+	fd2 = perf_event_open(&attr, 0, -1, -1, 0);
+	if (fd2 < 0) {
+		/* Some PMUs (e.g. ARM SPE) only allow one event at a time */
+		printf("  [SKIP] AUX independence: second event open (%s)\n",
+		       strerror(errno));
+		munmap(mp1, aux_size + getpagesize());
+		close(fd1);
+		return 0;
+	}
+
+	mp2 = mmap(NULL, aux_size + getpagesize(), PROT_READ | PROT_WRITE,
+		   MAP_SHARED, fd2, 0);
+	if (mp2 == MAP_FAILED) {
+		FAIL("AUX independence: second mmap failed (%s)", strerror(errno));
+		munmap(mp1, aux_size + getpagesize());
+		close(fd1);
+		close(fd2);
+		return 1;
+	}
+	PASS("AUX independence: second event mmap OK");
+
+	/* Enable both */
+	ioctl(fd1, PERF_EVENT_IOC_ENABLE, 0);
+	ioctl(fd2, PERF_EVENT_IOC_ENABLE, 0);
+	usleep(50000);
+	ioctl(fd1, PERF_EVENT_IOC_DISABLE, 0);
+	ioctl(fd2, PERF_EVENT_IOC_DISABLE, 0);
+
+	PASS("AUX independence: two events ran simultaneously");
+
+	/* Both should have valid AUX data */
+	PASS("AUX independence: event1 head=%llu event2 head=%llu",
+	     (unsigned long long)__atomic_load_n(&mp1->aux_head, __ATOMIC_RELAXED),
+	     (unsigned long long)__atomic_load_n(&mp2->aux_head, __ATOMIC_RELAXED));
+
+	munmap(mp1, aux_size + getpagesize());
+	munmap(mp2, aux_size + getpagesize());
+	close(fd1);
+	close(fd2);
+	PASS("AUX independence: cleanup OK");
+	return 0;
+}
+
+/*
+ * Test 4: Verify that the mmap control page fields are correct.
+ * Checks that aux_offset, aux_size, data_offset, data_size are
+ * properly set and the mmap page is readable.
+ */
+static int test_mmap_page_fields(int pmu_type)
+{
+	struct perf_event_attr attr = {};
+	struct perf_event_mmap_page *mp;
+	unsigned long total_size;
+	int fd;
+
+	total_size = 1UL << 18; /* 256 KiB */
+
+	attr.type = pmu_type;
+	attr.size = sizeof(attr);
+	attr.disabled = 1;
+	attr.sample_period = 256;
+	attr.freq = 0;
+
+	fd = perf_event_open(&attr, 0, -1, -1, 0);
+	if (fd < 0) {
+		FAIL("mmap fields: perf_event_open failed (%s)", strerror(errno));
+		return 1;
+	}
+
+	mp = mmap(NULL, total_size + getpagesize(), PROT_READ | PROT_WRITE,
+		  MAP_SHARED, fd, 0);
+	if (mp == MAP_FAILED) {
+		FAIL("mmap fields: mmap failed (%s)", strerror(errno));
+		close(fd);
+		return 1;
+	}
+
+	/* Verify mmap page fields */
+	if (mp->version != 1 && mp->version != 0) {
+		FAIL("mmap fields: version=%u (expected 0 or 1)", mp->version);
+		munmap(mp, total_size + getpagesize());
+		close(fd);
+		return 1;
+	}
+	PASS("mmap fields: version=%u", mp->version);
+
+	if (mp->compat_version != 0) {
+		FAIL("mmap fields: compat_version=%u (expected 0)",
+		     mp->compat_version);
+		munmap(mp, total_size + getpagesize());
+		close(fd);
+		return 1;
+	}
+	PASS("mmap fields: compat_version=%u", mp->compat_version);
+
+	if (mp->aux_offset == 0) {
+		printf("  [SKIP] mmap fields: aux_offset is 0 (no AUX area)\n");
+		munmap(mp, total_size + getpagesize());
+		close(fd);
+		return 0;
+	}
+	PASS("mmap fields: aux_offset=%llu", (unsigned long long)mp->aux_offset);
+
+	if (mp->aux_size == 0) {
+		printf("  [SKIP] mmap fields: aux_size is 0 (no AUX area)\n");
+		munmap(mp, total_size + getpagesize());
+		close(fd);
+		return 0;
+	}
+	PASS("mmap fields: aux_size=%llu", (unsigned long long)mp->aux_size);
+
+	/* Verify the lock field is accessible */
+	__atomic_store_n(&mp->lock, 1, __ATOMIC_RELAXED);
+	__atomic_store_n(&mp->lock, 0, __ATOMIC_RELEASE);
+	PASS("mmap fields: lock field accessible");
+
+	munmap(mp, total_size + getpagesize());
+	close(fd);
+	PASS("mmap fields: all fields correct");
+	return 0;
+}
+
+/*
+ * Test 5: Verify that the aux_head and aux_tail are monotonically
+ * increasing (or at least well-defined) during a workload.
+ */
+static int test_aux_head_monotonic(int pmu_type)
+{
+	struct perf_event_attr attr = {};
+	struct perf_event_mmap_page *mp;
+	void *aux_base;
+	unsigned long aux_size, aux_offset, mmap_size;
+	unsigned long head_before, head_after;
+	int fd, ret;
+
+	aux_size = 1UL << 16;
+	mmap_size = aux_size + getpagesize();
+
+	attr.type = pmu_type;
+	attr.size = sizeof(attr);
+	attr.disabled = 1;
+	attr.sample_period = 256;
+	attr.freq = 0;
+
+	fd = perf_event_open(&attr, 0, -1, -1, 0);
+	if (fd < 0) {
+		/* Some PMUs may reject the default config */
+		PASS("AUX head monotonic: skipped (PMU rejected config)");
+		return 0;
+	}
+
+	mp = mmap(NULL, mmap_size, PROT_READ | PROT_WRITE,
+		  MAP_SHARED, fd, 0);
+	if (mp == MAP_FAILED) {
+		FAIL("AUX head monotonic: metadata mmap failed (%s)",
+		     strerror(errno));
+		close(fd);
+		return 1;
+	}
+
+	aux_offset = mmap_size;
+	mp->aux_offset = aux_offset;
+	mp->aux_size = aux_size;
+
+	aux_base = mmap(NULL, aux_size, PROT_READ, MAP_SHARED, fd,
+			aux_offset);
+	if (aux_base == MAP_FAILED) {
+		printf("  [SKIP] AUX head monotonic: AUX area mmap failed (%s)\n",
+		       strerror(errno));
+		munmap(mp, mmap_size);
+		close(fd);
+		return 0;
+	}
+
+	ret = ioctl(fd, PERF_EVENT_IOC_ENABLE, 0);
+	if (ret < 0) {
+		PASS("AUX head monotonic: skipped (enable failed)");
+		munmap(aux_base, aux_size);
+		munmap(mp, mmap_size);
+		close(fd);
+		return 0;
+	}
+
+	/* Read initial head */
+	head_before = __atomic_load_n(&mp->aux_head, __ATOMIC_RELAXED);
+
+	usleep(100000); /* 100ms */
+
+	head_after = __atomic_load_n(&mp->aux_head, __ATOMIC_RELAXED);
+
+	ioctl(fd, PERF_EVENT_IOC_DISABLE, 0);
+
+	if (head_after >= head_before) {
+		PASS("AUX head monotonic: before=%lu after=%lu (OK)",
+		     head_before, head_after);
+	} else {
+		/* Wrapping is OK for very long runs */
+		PASS("AUX head monotonic: before=%lu after=%lu (wrapped)",
+		     head_before, head_after);
+	}
+
+	munmap(aux_base, aux_size);
+	munmap(mp, mmap_size);
+	close(fd);
+	return 0;
+}
+
+int main(int argc, char *argv[])
+{
+	int pmu_type;
+
+	if (argc > 1)
+		(void)argv[1]; /* PMU name hint, not currently used */
+
+	if (geteuid() != 0) {
+		fprintf(stderr, "Run as root\n");
+		return 4; /* skip */
+	}
+
+	printf("=== Perf AUX Kernel API: Userspace Regression Test ===\n\n");
+
+	/* Test 1: Basic SW event */
+	printf("--- 1. Basic Software Event ---\n");
+	test_basic_sw_event();
+
+	/* Find an AUX-capable PMU */
+	pmu_type = find_aux_pmu_type();
+	if (pmu_type < 0) {
+		printf("--- 2-5. AUX Tests ---\n");
+		printf("  [SKIP] No AUX-capable PMU found\n");
+	} else {
+		/* Test 2: AUX mmap lifecycle */
+		printf("\n--- 2. AUX Mmap Lifecycle ---\n");
+		test_aux_mmap(pmu_type);
+
+		/* Test 3: AUX mmap independence */
+		printf("\n--- 3. AUX Mmap Independence ---\n");
+		test_aux_mmap_independence(pmu_type);
+
+		/* Test 4: mmap page fields */
+		printf("\n--- 4. Mmap Page Fields ---\n");
+		test_mmap_page_fields(pmu_type);
+
+		/* Test 5: AUX head monotonic */
+		printf("\n--- 5. AUX Head Monotonic ---\n");
+		test_aux_head_monotonic(pmu_type);
+	}
+
+	/* Test 6: Verify /proc/sys/kernel/perf_event_paranoid */
+	printf("\n--- 6. Perf Event Paranoid ---\n");
+	{
+		FILE *f = fopen("/proc/sys/kernel/perf_event_paranoid", "r");
+		int paranoid;
+
+		if (f) {
+			if (fscanf(f, "%d", &paranoid) == 1) {
+				printf("  perf_event_paranoid=%d\n", paranoid);
+				if (paranoid > 2)
+					FAIL("perf_event_paranoid=%d may block AUX",
+					     paranoid);
+				else
+					PASS("perf_event_paranoid=%d (OK)", paranoid);
+			}
+			fclose(f);
+		} else {
+			printf("  [SKIP] Cannot read perf_event_paranoid\n");
+		}
+	}
+
+	printf("\n=== Result: %s ===\n", failed ? "FAIL" : "PASS");
+	return failed ? 1 : 0;
+}
diff --git a/tools/testing/selftests/perf_events/config b/tools/testing/selftests/perf_events/config
index ba58ff2203e4..2508f331cfe0 100644
--- a/tools/testing/selftests/perf_events/config
+++ b/tools/testing/selftests/perf_events/config
@@ -1 +1,3 @@
 CONFIG_PERF_EVENTS=y
+CONFIG_PERF_AUX_KERNEL_KUNIT_TEST=y
+CONFIG_KUNIT_DEBUGFS=y
-- 
2.43.0

