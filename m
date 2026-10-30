Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793379679;
	b=GmeZkGVcHrawFRU4Bs0iJw0VjDqtkn2qaJ+aT4RrKNOCqZUgghgNQPcZzUJOQjbDq8pc
	 A/xpEYiio1d5aM99OTFQHOpK/VwMBFB+vjgktgbntPy3NnkO836v6kJumhqpKmVbfP+bi
	 iMxCb268XyLSDoc1hf3MOKYUJ1r0dzE7eXLInlfsu4ihawkCCtuj3/aqctyWRSty2ciWh
	 Khjoz4/0fEm/ZtgALYjCJvnmxdAgcO/RvXp5ILMovjCGneEUQuRqTK5ncZ39Xqcqh5YOv
	 WS1tYSSDW8ZrmiKkwzV38Us9GbEFOzhe3QBlfXtSXkyEEK1Jx7Z9p10YxuFTTYoOFWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793379679;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=xvrYZ0vevd0WRZhsvkJLTJASZ1aW+K5RqejugueGri8=;
	b=lJcRr4Ck/He/Gz91ofs+00qQE9Ye2rK8EwE2hCsjHci0L0BYZtTUsWeZB4eL2DjKWgwp
	 sAzFKKdl2bpNFJV3kD10ALREXt4J00u+cOHWvZlwcE1W573lQeTOS2T8IQGMEa3Ylhzpm
	 aFhmowCTEtT+q46siMmYc3KLUms8lH0pQlrxH5/8oq5e4bG15BppWg6qNuL/CXcCxUzJV
	 pu2z+nOWlQy5bgWxPQ0QZUuZuUbL20OybPHvV5ybGkO/7hCU8Z7qzyXSqDljOy3IQV2Zi
	 fFl8QJuN/I6GmUKauOYg5B8NAfXMVnOR70lqejXLvTPFRhUT6bXE/NFdvQnM7pNNWNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="B+/Fexre";
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9580D606A32E
	for <linux-kselftest@vger.kernel.org>; Fri, 30 Oct 2026 17:01:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9580D606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B+/Fexre
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso6964285e9.2
        for <linux-kselftest@vger.kernel.org>; Fri, 30 Oct 2026 10:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793379677; x=1793984477; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xvrYZ0vevd0WRZhsvkJLTJASZ1aW+K5RqejugueGri8=;
        b=B+/Fexre9x2j5Zjl7nDpGMebby/lrWSjir+pkpCkd9JgWi8SY/vWBtyBS+SppIALIr
         ARebLq7b/qwKJgmjZtVJlilgbkKlM8EAqxHrGHhVHDoMpgS2RYC5rGdSqOGYOpKougNW
         ooeX8CUPKN0+TTIlRoWbe+SpCVC2QtI2odsQLwNRftB1Yj3J9dt7oIQh9sBIaXc/9N5j
         s0FGcQAOVCBXaxMP+ENwL1+jfQnx2KW1M3YphfQWzORBahukN/8EXd+z8d8v+uNwFRHT
         6l8oojenS7mr055QehStcHIQxht65n645uRH5P/Td7BIJPuTYxp9I1+wfJ2fvtC3dCX+
         OdWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793379677; x=1793984477;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xvrYZ0vevd0WRZhsvkJLTJASZ1aW+K5RqejugueGri8=;
        b=TYHgye+LT6kR5MnZQFZO6jOfP0ipvmJwT3oqcPo0HYaF7nuXmAKVAKph++mFfjSFIh
         KoLvyDQp70IFyx5uh1460tDTmtqewZkYiDqx+iXVFxzA+AUvAj1MRxWkfLwP1346pLbX
         WshEmKley7US1aaHpPLHYWZbWbziCRAap0qxfAmjuEzW/grYhQlIqSD8hTbLZyjFmZ7e
         bKuB8U+hYHn67noL3BJHdCCnOHS95vhcbaWEnMhp8FM7tDsjT/Jz5z3CMaEUCIcDWEi7
         Y6T5bj4BJPWjyeoUwzsTiTla18pTBZ+FfczHCcgLtW4SoJX8rNI7YbHe0Evos1qyA+Nl
         JKxg==
X-Forwarded-Encrypted: i=1; AKwUvBw0AIzVp/7rnmXfy7cakXWaJ/pQwY/m3Gfu+3JT5fw15WPM+DA+GgKHSLN/T3TshVNlKx05gUXuPbytzxxxXds=@vger.kernel.org
X-Gm-Message-State: AFq9FYLnfT78+MynQFqWJGtF/5qxvOzkP3cbFkoPn9GFK5sUTS125t7h
	OSviLpwChh8oLUTKeIQftitX44+PyaEN4nXWXhl20KGDmF/Cr4Mh6QCo
X-Gm-Gg: AYBFou3CK1GRjUPcaS+O1TmcjAGXAk6/nUzZInJGoIC9reMs/oot735r1Azg6BSyR5O
	ykmTPBM2j+mZzeKYIC6aJ/WRlYyk9fbidgY2+EnUlQkuggiUx/2lGg4JnOdXTP+UVB6rW9E3lG/
	opQx56U79clRX2+LWmAuijEVX6zOzczLLQnZqbwerWzZJbt5dpoNzxznL4wgWXTiZJ2QUJjJa4/
	u5xcZE38UCrAPbclMEYNDTVuj9gsf9YkvHiopFWc/ThMa9vfjzOufCg4VcfTI6y2r13yj3MlurV
	fmxTdBNU5H3NrRxU0eay1nMmyYKu0eUZFYgEGOqWsPeCvmz8Vxdpp4t2ws7j1Ynx0TSDAGMhJT7
	xyO7K6oma7lyQ1liCAFA86DtUXDzHAQShDHVih9Ojh+6b3TlIRmmlL9vI9mym0qpXQy0LbH9NAB
	PxX99egecZ373JLJE8fYOhsedBDzQ04NZ8Q+fBy14UvjPj8MKbYkF9FHviXT0HNFIbrF7SJq7qx
	8RVXWOFq4rw4KCXah7zo75W6jJTTp9J2ZFaw3uSpPik5CZNrA8vUhjeff2cVTDT2LzTePy0d4WF
	mAsPH7T54/wwhkvTPUR94fQYL98ZH0rb6de2hjUBsUS/98n/TqmoZ6A9SL+WPlgXVXw=
X-Received: by 2002:a05:600c:8b4c:b0:4a5:1cf1:b7b8 with SMTP id 5b1f17b1804b1-4ac17b2cf8amr65565185e9.28.1793379674473;
        Fri, 30 Oct 2026 10:01:14 -0700 (PDT)
Received: from unix.. (244.red-81-44-253.staticip.rima-tde.net. [81.44.253.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ac0950d533sm41126555e9.3.2026.10.30.10.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 10:01:13 -0700 (PDT)
From: =?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Mark Brown <broonie@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] selftests/arm64: GCS must survive io_uring SQPOLL worker exit
Date: Fri, 30 Oct 2026 14:00:46 -0300
Message-ID: <20261030170046.439736-2-ivanrwcm25@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261030170046.439736-1-ivanrwcm25@gmail.com>
References: <179330742036.2531571.12603232226357262067.b4-ty@b4>
 <20261030170046.439736-1-ivanrwcm25@gmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

SQPOLL threads are create_io_thread() workers (args->fn + CLONE_VM).
They inherit GCS tracking via arch_dup_task_struct(); without
gcs_reset_thread() their exit runs gcs_free() on the parent's stack.

Create a SQPOLL ring, wait for iou-sqp-* to appear and leave
/proc/self/task (close only queues async teardown), then check the
parent ss VMA count is unchanged. QEMU: pass with the reset, SIGSEGV
without it.

Signed-off-by: Iván Ezequiel Rodriguez <ivanrwcm25@gmail.com>
---
 tools/testing/selftests/arm64/gcs/Makefile    |   2 +-
 .../selftests/arm64/gcs/gcs-uring-worker.c    | 254 ++++++++++++++++++
 2 files changed, 255 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/arm64/gcs/gcs-uring-worker.c

diff --git a/tools/testing/selftests/arm64/gcs/Makefile b/tools/testing/selftests/arm64/gcs/Makefile
index f1365eea31c9..a427041f8cd1 100644
--- a/tools/testing/selftests/arm64/gcs/Makefile
+++ b/tools/testing/selftests/arm64/gcs/Makefile
@@ -7,7 +7,7 @@
 #
 
 TEST_GEN_PROGS := basic-gcs libc-gcs gcs-locking gcs-stress gcspushm gcsstr \
-		  gcs-clone-pidfd
+		  gcs-clone-pidfd gcs-uring-worker
 TEST_GEN_PROGS_EXTENDED := gcs-stress-thread
 
 LDLIBS+=-lpthread
diff --git a/tools/testing/selftests/arm64/gcs/gcs-uring-worker.c b/tools/testing/selftests/arm64/gcs/gcs-uring-worker.c
new file mode 100644
index 000000000000..737e1a14177b
--- /dev/null
+++ b/tools/testing/selftests/arm64/gcs/gcs-uring-worker.c
@@ -0,0 +1,254 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * io_uring SQPOLL uses create_io_thread() (args->fn + CLONE_VM) and
+ * inherits GCS tracking via arch_dup_task_struct(). Without
+ * gcs_reset_thread() on that path, worker exit runs deactivate_mm()
+ * -> gcs_free() and unmaps the parent's GCS.
+ *
+ * close(2) on the ring only queues teardown; wait for the iou-sqp-*
+ * thread to leave /proc/self/task so gcs_free() has finished before
+ * counting VMAs.
+ *
+ * After enabling GCS, do not return from main() through libc frames
+ * that were pushed before enable.
+ */
+#define _GNU_SOURCE
+
+#include <dirent.h>
+#include <errno.h>
+#include <fcntl.h>
+#include <linux/io_uring.h>
+#include <stdint.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/auxv.h>
+#include <sys/mman.h>
+#include <sys/syscall.h>
+#include <unistd.h>
+
+#include <asm/hwcap.h>
+
+#include "kselftest.h"
+#include "gcs-util.h"
+
+#ifndef HWCAP_GCS
+#define HWCAP_GCS			(1UL << 32)
+#endif
+
+#ifndef __NR_io_uring_setup
+#define __NR_io_uring_setup		425
+#endif
+#ifndef __NR_io_uring_enter
+#define __NR_io_uring_enter		426
+#endif
+
+#define SQPOLL_WAIT_MS			5000
+
+struct uring {
+	int fd;
+	struct io_uring_params params;
+	void *sq;
+	size_t sq_len;
+	struct io_uring_sqe *sqes;
+	size_t sqes_len;
+};
+
+static int count_ss_vmas(void)
+{
+	FILE *f;
+	char line[256];
+	int vmas = 0;
+
+	f = fopen("/proc/self/smaps", "r");
+	if (!f)
+		ksft_exit_fail_msg("fopen /proc/self/smaps: %s\n",
+				   strerror(errno));
+
+	while (fgets(line, sizeof(line), f)) {
+		if (!strncmp(line, "VmFlags:", 8) && strstr(line, " ss"))
+			vmas++;
+	}
+	fclose(f);
+	return vmas;
+}
+
+static bool has_iou_sqp(void)
+{
+	DIR *d;
+	struct dirent *de;
+	char path[96], comm[32];
+	int fd, n;
+	bool found = false;
+
+	d = opendir("/proc/self/task");
+	if (!d)
+		return false;
+
+	while ((de = readdir(d))) {
+		if (de->d_name[0] < '1' || de->d_name[0] > '9')
+			continue;
+		if (snprintf(path, sizeof(path), "/proc/self/task/%s/comm",
+			     de->d_name) >= (int)sizeof(path))
+			continue;
+		fd = open(path, O_RDONLY);
+		if (fd < 0)
+			continue;
+		n = read(fd, comm, sizeof(comm) - 1);
+		close(fd);
+		if (n <= 0)
+			continue;
+		comm[n] = '\0';
+		if (!strncmp(comm, "iou-sqp-", 8)) {
+			found = true;
+			break;
+		}
+	}
+	closedir(d);
+	return found;
+}
+
+static int wait_iou_sqp(bool want, int timeout_ms)
+{
+	int slept = 0;
+
+	while (has_iou_sqp() != want) {
+		if (slept >= timeout_ms)
+			return -ETIMEDOUT;
+		usleep(1000);
+		slept++;
+	}
+	return 0;
+}
+
+static void uring_close(struct uring *r)
+{
+	if (r->sqes && r->sqes != MAP_FAILED) {
+		munmap(r->sqes, r->sqes_len);
+		r->sqes = MAP_FAILED;
+	}
+	if (r->sq && r->sq != MAP_FAILED) {
+		munmap(r->sq, r->sq_len);
+		r->sq = MAP_FAILED;
+	}
+	if (r->fd >= 0) {
+		close(r->fd);
+		r->fd = -1;
+	}
+}
+
+static int uring_sqpoll_open(struct uring *r)
+{
+	size_t cq_len;
+	int ret;
+
+	memset(r, 0, sizeof(*r));
+	r->fd = -1;
+	r->sq = MAP_FAILED;
+	r->sqes = MAP_FAILED;
+
+	r->params.flags = IORING_SETUP_SQPOLL;
+	r->params.sq_thread_idle = 100;
+	r->fd = syscall(__NR_io_uring_setup, 8, &r->params);
+	if (r->fd < 0)
+		return -errno;
+
+	if (!(r->params.features & IORING_FEAT_SINGLE_MMAP)) {
+		ret = -EOPNOTSUPP;
+		goto err;
+	}
+
+	r->sq_len = r->params.sq_off.array +
+		    r->params.sq_entries * sizeof(unsigned int);
+	cq_len = r->params.cq_off.cqes +
+		 r->params.cq_entries * sizeof(struct io_uring_cqe);
+	if (cq_len > r->sq_len)
+		r->sq_len = cq_len;
+
+	r->sq = mmap(NULL, r->sq_len, PROT_READ | PROT_WRITE,
+		     MAP_SHARED | MAP_POPULATE, r->fd, IORING_OFF_SQ_RING);
+	if (r->sq == MAP_FAILED) {
+		ret = -errno;
+		goto err;
+	}
+
+	r->sqes_len = r->params.sq_entries * sizeof(struct io_uring_sqe);
+	r->sqes = mmap(NULL, r->sqes_len, PROT_READ | PROT_WRITE,
+		       MAP_SHARED | MAP_POPULATE, r->fd, IORING_OFF_SQES);
+	if (r->sqes == MAP_FAILED) {
+		ret = -errno;
+		goto err;
+	}
+
+	return 0;
+err:
+	uring_close(r);
+	return ret;
+}
+
+int main(void)
+{
+	struct uring ring;
+	unsigned long gcs_mode;
+	long rc;
+	int vmas0, vmas1;
+
+	ksft_print_header();
+
+	if (!(getauxval(AT_HWCAP) & HWCAP_GCS))
+		ksft_exit_skip("GCS not supported\n");
+
+	rc = my_syscall2(__NR_prctl, PR_GET_SHADOW_STACK_STATUS, &gcs_mode);
+	if (rc)
+		ksft_exit_fail_msg("PR_GET_SHADOW_STACK_STATUS: %ld\n", rc);
+
+	if (!(gcs_mode & PR_SHADOW_STACK_ENABLE)) {
+		rc = my_syscall2(__NR_prctl, PR_SET_SHADOW_STACK_STATUS,
+				 PR_SHADOW_STACK_ENABLE);
+		if (rc == -EOPNOTSUPP || rc == -EINVAL || rc == -EBUSY)
+			ksft_exit_skip("cannot enable GCS: %ld\n", rc);
+		if (rc)
+			ksft_exit_fail_msg("PR_SET_SHADOW_STACK_STATUS: %ld\n",
+					   rc);
+	}
+
+	rc = uring_sqpoll_open(&ring);
+	if (rc == -ENOSYS || rc == -EINVAL || rc == -EPERM ||
+	    rc == -EOPNOTSUPP || rc == -EACCES)
+		ksft_exit_skip("io_uring SQPOLL unavailable: %s\n",
+			       strerror(-rc));
+	if (rc)
+		ksft_exit_fail_msg("io_uring_setup SQPOLL: %s\n",
+				   strerror(-rc));
+
+	rc = syscall(__NR_io_uring_enter, ring.fd, 0, 0,
+		     IORING_ENTER_SQ_WAKEUP, NULL, 0);
+	if (rc < 0)
+		ksft_exit_fail_msg("io_uring_enter SQ_WAKEUP: %s\n",
+				   strerror(errno));
+
+	if (wait_iou_sqp(true, SQPOLL_WAIT_MS)) {
+		uring_close(&ring);
+		ksft_exit_fail_msg("SQPOLL thread did not appear\n");
+	}
+
+	vmas0 = count_ss_vmas();
+	if (vmas0 < 1) {
+		uring_close(&ring);
+		ksft_exit_fail_msg("expected a GCS VMA before worker exit\n");
+	}
+
+	ksft_set_plan(1);
+
+	uring_close(&ring);
+
+	if (wait_iou_sqp(false, SQPOLL_WAIT_MS))
+		ksft_exit_fail_msg("SQPOLL thread did not exit\n");
+
+	vmas1 = count_ss_vmas();
+	ksft_test_result(vmas1 == vmas0,
+			 "parent GCS VMA survives SQPOLL exit (%d -> %d)\n",
+			 vmas0, vmas1);
+
+	ksft_finished();
+}
-- 
2.43.0

