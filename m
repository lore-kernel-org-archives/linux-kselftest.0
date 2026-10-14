Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68FA7569F36
	for <linux-kselftest@vger.kernel.org>; Wed, 14 Oct 2026 17:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792000696; cv=none; b=QsCzK8r1BdlnX5cz0XDw3xMMw0ubadc9JtlsSyG+nQNjVMfbVywXehPJtjsyL9VrpJGO/LZ9JbrYSan8CmWMLTkNzc+zh0+L3YOlnAtclI37CzAizHZzZCojG5enJaXBLWGAb4bzVi5X6Bi/eqeXdXacWFXk4p4ZNudAS6ggnes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792000696; c=relaxed/simple;
	bh=kgADQWXY4bo9DrSOROhr95j5ORvOLXp1+MzIATLp8wY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QeF4/cbu6Kv80TjGw9RGCmDuWA0uNlmAVqFjXdOswT46GR+1IZw4JxdYZkn9DGdr9tK5iToOrl/WbGqKEqgJEjVOAlcFIcdx1w8rYi/RSTaszXX9DdNGRQ971C2e47IoBlrNY3WTO5DyNN8pvD2VslwK+l+o9Xt2e1E8QoQLtpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=fxQt/hCi; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="fxQt/hCi"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-917c04630c2so56178886d6.3
        for <linux-kselftest@vger.kernel.org>; Wed, 14 Oct 2026 10:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1792000693; x=1792605493; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oyatGRUxoFSks0yTidJFm5V0CZohajxsNca07bWmCFc=;
        b=fxQt/hCinILzyB5gPoyXcE5vWoREqLEMO3elCpU3QmfM+v/SQwPxfJyEBKCYZaUwAa
         T1fnaDeLan8q62aQtlkZ0rwrll2NDmZtIRjfIdka/FW9rmKm92+I4i78VfiAtXJPaInN
         qCGo5aL2W3ooosZrHwUmi1fy38nfDVgD1pABFHVf5dpMT1b77aye58gPaDxm7dNWpMnO
         cw/Gpx8IrL+0G8QzjHCRpqCt1LPI5sWRpDpfk8dHKb18V+eSt/cXD88we1HUkAz3xsIv
         4CkaRbYoPZGLRdgwk94Gs8d/KmGHmTiRd0KhSbA2fC8qL51NmPxjB5nuxe/m9HSyHUnu
         tyjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792000693; x=1792605493;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oyatGRUxoFSks0yTidJFm5V0CZohajxsNca07bWmCFc=;
        b=y62+If/Bw7Y5VGySHU2TKQYDkQiN/Kdwk8wZyyIAXIlo6+cyjfZRwKWcjWNBa6ajTH
         3t2mkHSbNPSP7jBB9Y/q3IGhAI8I5BxR/gUzF59uYdImfhkbMiiXTI4pkfmdIB6Bmsgu
         TpQIt9lKtfPzKyQt3LSqHu/bdug8tULaU8dGluk3Am07YAlGrN9pfY9Fk73UZc8EA7sj
         ucyDvhQ1650l/j4BKkOCT7Hhybfx4jvDdDFGS8dVd2bIIB3YKmycsQw7W/wPr8xI21QL
         PwigJZXDnTMTH7ABIIb5w58a+G4RHgg/XV7DbMAezl6fjMKYz969uLxJadJoGr+6JrN/
         il4w==
X-Gm-Message-State: AFq9FYLNYDicHeRZ+oth0CJEJWpkwCCebRKvX0yftOQNAZsE5CAzX6dM
	zicj/hrhbu+56YKZ8tQmU8+Y/0qoA6wHyMjjYRkzf6yPD4fui4RBuUIc3iXv7J8V1hzKrSfIUBD
	vCBoy5yE=
X-Gm-Gg: AYBFou0xg8dzvZr+xZ3MHAF3l+k5zQWJef7oVoyIG6JZCfKWQeWk+6pPig+XtntGmiP
	FmoSGh2eUK39MVXXjBMVypR6a2uEJ6QTysT484MLte2Fh2e7DRhDTZjemKqVzQ6J5C1PSX6lCa5
	I4UIBv1lS606S5p9ZXWYm4P4WaLCH0txiGZSFsoWPw96rqkknxBglqbt9MjLupfk2U4+l0J0QHX
	yG57bdIuzNdezDMxlIAwgblCc4K4wcW9f9Fgw1rpecOGuuDzPwhHEOS2MQ9HbEFuqkbE0bZ3b4m
	5LoDM6wLkoaBayrxFJz3U2IVxVtiB/yzTvOkzUMKMFZiOTDtCeRMSBk9WFB6MxUaMV1agCJZnpT
	vo4+5uQEihhFbHWtu4TEvpX/a5An8WXWJyNkIsj9GQhlRxi/1u9cLShhD38j7WWLwqVTb56qzjU
	i7Oy/ecD72zffHvAkAImIQVM4jeLX3ikHgFJxpJCAe7Wa/fZmuQCqWCA8eMIyyaoPVQw+QtvTjD
	4OOmSGVI1y6FW5q9ns0NKoPgBxnrSSqFitBR4V2GekUsE0HKQh3oaqkxLUN
X-Received: by 2002:a05:6214:4c42:b0:91b:5d3b:4ac1 with SMTP id 6a1803df08f44-91b5d3b4e3cmr222099726d6.54.1792000691642;
        Wed, 14 Oct 2026 10:58:11 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b97b95847sm58498006d6.32.2026.10.14.10.58.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 10:58:11 -0700 (PDT)
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	shuah@kernel.org
Subject: [PATCH 5/8] selftests/mm: check that MADV_COLD and MADV_PAGEOUT preserve shared memory
Date: Wed, 14 Oct 2026 13:57:53 -0400
Message-ID: <20261014175756.2035176-6-gourry@gourry.net>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261014175756.2035176-1-gourry@gourry.net>
References: <20261014175756.2035176-1-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Both hints are non-destructive, but the tests so far only check that for
private anonymous memory. Shared memory reaches reclaim through different
paths: a dirty shared file page must be written back or left resident,
shared anonymous memory is paged out through shmem, and a SHM_LOCK'd
segment is unevictable without its VMA being VM_LOCKED.

Check that MADV_COLD and MADV_PAGEOUT preserve a dirty shared file page,
that MADV_PAGEOUT preserves a shared anonymous page, and that it leaves a
SHM_LOCK'd page resident. The SHM_LOCK test needs root to confirm through
/proc/kpageflags that the page is unevictable, and skips if it is not.

Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 tools/testing/selftests/mm/madvise.c | 138 +++++++++++++++++++++++++++
 tools/testing/selftests/mm/vm_util.h |   1 +
 2 files changed, 139 insertions(+)

diff --git a/tools/testing/selftests/mm/madvise.c b/tools/testing/selftests/mm/madvise.c
index bd78f63f1314..0851f5428e3d 100644
--- a/tools/testing/selftests/mm/madvise.c
+++ b/tools/testing/selftests/mm/madvise.c
@@ -7,7 +7,10 @@
 #include <fcntl.h>
 #include <sched.h>
 #include <stdbool.h>
+#include <stdint.h>
+#include <sys/ipc.h>
 #include <sys/mman.h>
+#include <sys/shm.h>
 #include <unistd.h>
 
 #include "kselftest_harness.h"
@@ -21,6 +24,8 @@ static size_t page_size;
 FIXTURE(madvise)
 {
 	int pagemap_fd;
+	/* Opening it needs CAP_SYS_ADMIN, -1 otherwise. */
+	int kpageflags_fd;
 };
 
 FIXTURE_SETUP(madvise)
@@ -29,10 +34,13 @@ FIXTURE_SETUP(madvise)
 
 	self->pagemap_fd = open("/proc/self/pagemap", O_RDONLY);
 	ASSERT_GE(self->pagemap_fd, 0);
+	self->kpageflags_fd = open("/proc/kpageflags", O_RDONLY);
 }
 
 FIXTURE_TEARDOWN(madvise)
 {
+	if (self->kpageflags_fd >= 0)
+		close(self->kpageflags_fd);
 	close(self->pagemap_fd);
 }
 
@@ -52,6 +60,22 @@ static bool pageout_until_swapped(struct __test_metadata *_metadata,
 	return false;
 }
 
+/* Page out the range until its first page is no longer mapped. */
+static bool pageout_until_evicted(struct __test_metadata *_metadata,
+				  char *mapping, size_t size, int pagemap_fd)
+{
+	int retry;
+
+	for (retry = 0; retry < PAGEOUT_RETRIES; retry++) {
+		ASSERT_EQ(madvise(mapping, size, MADV_PAGEOUT), 0);
+		if (!pagemap_is_populated(pagemap_fd, mapping))
+			return true;
+		usleep(10000);
+	}
+
+	return false;
+}
+
 /*
  * Keep this task on one CPU, so that draining that CPU's LRU batches drains
  * the folios this task faulted in.
@@ -67,6 +91,25 @@ static void pin_to_current_cpu(struct __test_metadata *_metadata)
 	ASSERT_EQ(sched_setaffinity(0, sizeof(mask), &mask), 0);
 }
 
+/* Map a shared mapping of an unlinked, zero-filled temporary file. */
+static char *map_temp_file(struct __test_metadata *_metadata, size_t size)
+{
+	char template[] = "/tmp/madvise-pageout-XXXXXX";
+	char *mapping;
+	int fd;
+
+	fd = mkstemp(template);
+	ASSERT_GE(fd, 0);
+	ASSERT_EQ(unlink(template), 0);
+	ASSERT_EQ(ftruncate(fd, size), 0);
+
+	mapping = mmap(NULL, size, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
+	ASSERT_NE(mapping, MAP_FAILED);
+	close(fd);
+
+	return mapping;
+}
+
 /*
  * Both hints are best effort, so these tests check what userspace can rely
  * on: which mappings are accepted, which pages must never be reclaimed, and
@@ -267,4 +310,99 @@ TEST_F(madvise, pageout_skips_swapped_pte)
 	check_skips_swapped_pte(_metadata, self->pagemap_fd, MADV_PAGEOUT);
 }
 
+/* MADV_COLD must not discard a dirty page of a shared file mapping. */
+TEST_F(madvise, cold_preserves_dirty_shared_file_page)
+{
+	char *mapping;
+
+	mapping = map_temp_file(_metadata, page_size);
+	mapping[0] = 1;
+
+	ASSERT_EQ(madvise(mapping, page_size, MADV_COLD), 0);
+	ASSERT_EQ(mapping[0], 1);
+
+	ASSERT_EQ(munmap(mapping, page_size), 0);
+}
+
+/*
+ * MADV_PAGEOUT may write a dirty shared file page back or leave it resident,
+ * but must not discard it.
+ */
+TEST_F(madvise, pageout_preserves_dirty_shared_file_page)
+{
+	char *mapping;
+
+	mapping = map_temp_file(_metadata, page_size);
+	mapping[0] = 1;
+
+	if (!pageout_until_evicted(_metadata, mapping, page_size,
+				   self->pagemap_fd))
+		SKIP(return, "MADV_PAGEOUT did not unmap the page");
+	ASSERT_EQ(mapping[0], 1);
+
+	ASSERT_EQ(munmap(mapping, page_size), 0);
+}
+
+/* MADV_PAGEOUT must not lose the contents of shared anonymous memory. */
+TEST_F(madvise, pageout_preserves_shared_anon_page)
+{
+	char *mapping;
+
+	mapping = mmap(NULL, page_size, PROT_READ | PROT_WRITE,
+		       MAP_SHARED | MAP_ANONYMOUS, -1, 0);
+	ASSERT_NE(mapping, MAP_FAILED);
+	mapping[0] = 1;
+
+	if (!pageout_until_evicted(_metadata, mapping, page_size,
+				   self->pagemap_fd))
+		SKIP(return, "MADV_PAGEOUT did not evict the page");
+	ASSERT_EQ(mapping[0], 1);
+
+	ASSERT_EQ(munmap(mapping, page_size), 0);
+}
+
+/*
+ * SHM_LOCK makes shmem pages unevictable without setting VM_LOCKED on the
+ * VMA, so MADV_PAGEOUT accepts the range but must not reclaim the page.
+ */
+TEST_F(madvise, pageout_skips_unevictable_page)
+{
+	unsigned long pfn;
+	uint64_t flags;
+	char *mapping;
+	int shmid;
+
+	if (self->kpageflags_fd < 0)
+		SKIP(return, "requires root to read page flags");
+	shmid = shmget(IPC_PRIVATE, page_size, IPC_CREAT | 0600);
+	ASSERT_GE(shmid, 0);
+	if (shmctl(shmid, SHM_LOCK, NULL)) {
+		shmctl(shmid, IPC_RMID, NULL);
+		SKIP(return, "could not lock a shmem segment");
+	}
+	mapping = shmat(shmid, NULL, 0);
+	/* The segment is destroyed once it is detached. */
+	shmctl(shmid, IPC_RMID, NULL);
+	ASSERT_NE(mapping, (void *)-1);
+	pin_to_current_cpu(_metadata);
+	mapping[0] = 1;
+
+	/*
+	 * MADV_COLD drains this CPU's LRU add batch, which makes the page
+	 * unevictable.
+	 */
+	ASSERT_EQ(madvise(mapping, page_size, MADV_COLD), 0);
+	pfn = pagemap_get_pfn(self->pagemap_fd, mapping);
+	ASSERT_NE(pfn, -1UL);
+	ASSERT_EQ(pageflags_get(pfn, self->kpageflags_fd, &flags), 0);
+	if (!(flags & KPF_UNEVICTABLE))
+		SKIP(return, "could not make the page unevictable");
+
+	ASSERT_EQ(madvise(mapping, page_size, MADV_PAGEOUT), 0);
+	ASSERT_TRUE(pagemap_is_populated(self->pagemap_fd, mapping));
+	ASSERT_EQ(mapping[0], 1);
+
+	ASSERT_EQ(shmdt(mapping), 0);
+}
+
 TEST_HARNESS_MAIN
diff --git a/tools/testing/selftests/mm/vm_util.h b/tools/testing/selftests/mm/vm_util.h
index b5d59729d432..95898e045bac 100644
--- a/tools/testing/selftests/mm/vm_util.h
+++ b/tools/testing/selftests/mm/vm_util.h
@@ -24,6 +24,7 @@
 
 #define KPF_COMPOUND_HEAD             BIT_ULL(15)
 #define KPF_COMPOUND_TAIL             BIT_ULL(16)
+#define KPF_UNEVICTABLE               BIT_ULL(18)
 #define KPF_HWPOISON                  BIT_ULL(19)
 #define KPF_THP                       BIT_ULL(22)
 /*
-- 
2.56.0

