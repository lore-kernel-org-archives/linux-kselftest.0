Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792429936;
	b=iPCJU45OWrPUl/Z9McKGswBvWxmwbLdB2UHKHQAKg3GMshEKQdDQqzJq4pwOhQ+BycAX
	 HzZryl1xCaE1JVcbmFDgpAOWo5pH8R6cSa278yYPVjyN7cw1jr8WOZlPwOlVMhAsh21D+
	 rQ09AV/Q+4MmymVbm5/QC51NpeeTL455S53nGdT4Y+kUVFJxEBYvcr6FWp1IRUpRj6WCB
	 +iYdfpmWLmRqfwdSGW6WV03Bpe3lqqL+pqymgv6Vz//OmguhobGYrzpjbLLeNB28TLx5h
	 D7wgONZTd3Abkph9Q4TtwJ/FHScFZwEIgamBT6Vl0R/CISfPElbDB9SRkxuYOJWkAGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792429936;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8qFckcVknZKC1C4pPWUrwsUrEjWk0AoowGLlvfAhkn0=;
	b=XsvxQIya0mID7f7k66cFXNSXiNffPSLImabYqvjVeG1RwfUPiBlJEsdTDrrJFFp9YxEw
	 KOxRsIuV21WnqFmRVampcYLPb1PQQWXotgb9jTMeN2XxBkCZsx1lI1iQb4pdnbEbNFvGV
	 8+GM4xuH40OoeDSB3p8TNXaP2VfHIojvj09SOnpNuhnsTK1l5xwBuVr+pRu82zihUlJ1/
	 BDeXEXQjh0QCAepHa9UjWs/7KKRpRXDm8zJoZJQkfACfd3qxPuN0GUE+ThHOPUQSrua2d
	 V8lc0qVNjvGVU6Dq63CJ2dPvLcUhh5aFqug5POkggzhvoSJ6ks3tCAQzvJJ0l0qfIkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=lht1fSJO;
	arc=none smtp.remote-ip=209.85.222.176
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E885960A2601
	for <linux-kselftest@vger.kernel.org>; Mon, 19 Oct 2026 17:12:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E885960A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=lht1fSJO
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-93f20b304c0so226770885a.3
        for <linux-kselftest@vger.kernel.org>; Mon, 19 Oct 2026 10:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1792429935; x=1793034735; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8qFckcVknZKC1C4pPWUrwsUrEjWk0AoowGLlvfAhkn0=;
        b=lht1fSJOPnXXFo3yk3u+BruN9IgforV9oHn2Nw/BKsSvRLLfxHdFEUe5zD9hDb8gmk
         tRv+dZB3hwvWB6SNJ5OZHlWmLL8RIy7AIs7Hqp/0E9DigbDZVf5/9RWFgvPi6Eqo9jty
         suuOJrdXpVXcTJzubsH5iPk+j1GpOGdI0JW4wSeYcSnVrgEpJWav1Rb1DaHrcWxlTlMD
         csq4fbinKJuBdpC7Sc3MnUHM//6FdqDM37hSIOtayDgHab8R0jvMiJ1X1w4QHqitAKmC
         a3vOROjbcAbC8QEgphXXBDpEPa9sYWFJ6wgl6gxfzYmaI68cs4ita/PcSvXIjpmYSCg/
         HB/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792429935; x=1793034735;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8qFckcVknZKC1C4pPWUrwsUrEjWk0AoowGLlvfAhkn0=;
        b=OGcYVzhQqtZ0eiOimLI3SrInKMKOanN4ZeKe6m3aEK+RYfD/FehYM/Ar1p/hsFDMqb
         Hq3HPoyliFc0nDe8J4+Mtj8xuGGHrAZUhNmM3Q6SF/ecAcnHdVmnT3M6uwR6mYL+MezT
         0+nvQI9INAPfvLqoQTz49MBp/BI/wiKpMB7BChPiZD8gPnUZyflkz5vfWE7mZ8OzeM8h
         TGdjdmrMELSyuaD5PkVQbDh+HH+IT+74/Z+vO2JA3XFRN4+zin8yS9ltLH4pNudom2xs
         MuD5Z3vxCjOFZE0XV1elDl1Oyy8LRpNXnW9fFFE0P+DKg+5dVnKhieDDH9d4yQzjfAtF
         lyJg==
X-Gm-Message-State: AFq9FYLSqE+hJEFeNHBA2WyNhdqzrZheuGdRHUFBSBF2+Soe9vv8phU6
	2elqxXQNCd60ubQ2/o1oMBuT9sgKUwY8nwDZrJ37IZxgNQ1sGKaihobOgVlahUGbu8BdBGt3X+m
	lgFChj1o=
X-Gm-Gg: AYBFou3x+Smaa9E0W9zLVs6LIi8cxWyeAsaah3mt5pNhUmJ6Gnxlka9qLM6e/LfdLXN
	ayKCUnHKvXawM6bxRzNCYrZIEj/9pCtmWzEje5TlF88A12dBjDR0XyPDawDXrciaUtIitSh0/sZ
	uvg1LtH+0DY8dn11/lL91iyUSC95vfWSNqfDwjY+Y/PPgAzyIEA+OgALPzwD0v4/d7hPg3d4DP6
	Fm0cjT/kmCSeMs5HctFLHZOklpeVpDaqI77TzI/zeVk4/TDph2C/5Cz8DZ+9j4vU0Bmf6iuoh7v
	ka9/xAqlupapsIJZsPqYlKBntlXgZ6UwWnxT/UazYwwH9Aup6HiB6cg+KxMwloxId+sFqnN1wVP
	TOo5ZvyzmScnLYSShBTC8ehmz8m4TtK89n2J33iPdzT6d5I3fOSGy4jTJnRtld6z6aKDJAYQ4my
	EJiJQ6ky7hbtmT2aw3FjrkNl7Mwzpe4Xcc958xqE0WrE1spJljxE8l9ZXyu2lBFT1qwHyITjT3O
	6et6OqTHZQkaqnu+nvTXFvzdNkDPBbg2DTPVMwsQ73kQYfJMygylYUahXYZmmkarNyKC9bkHwTc
	+CYGRuAqRD1FRdngoS8ZrdDcED/AAGlyt9EPMpsxITZ8rjBZXV7VIdHlCJCK3cw=
X-Received: by 2002:a05:620a:489b:b0:93e:7192:191c with SMTP id af79cd13be357-93f29cc8286mr1416628785a.17.1792429934790;
        Mon, 19 Oct 2026 10:12:14 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c040d4cedsm723116d6.34.2026.10.19.10.12.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 10:12:14 -0700 (PDT)
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: linux-kselftest@vger.kernel.org
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
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
Subject: [PATCH v3 4/7] selftests/mm: check that MADV_COLD and MADV_PAGEOUT preserve shared memory
Date: Mon, 19 Oct 2026 13:12:03 -0400
Message-ID: <20261019171206.3331374-5-gourry@gourry.net>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261019171206.3331374-1-gourry@gourry.net>
References: <20261019171206.3331374-1-gourry@gourry.net>
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

Both hints are non-destructive, but the tests so far only check that for
private anonymous memory. Shared memory reaches reclaim differently:

Test the following:
 - a dirty shared file page must be written back or left resident,
 - shared anonymous memory is paged out through shmem
 - a SHM_LOCK'd segment is unevictable without its VMA being VM_LOCKED.

MADV_PAGEOUT unmaps a shmem page before it tries to swap it out
so none of these needs swap.

The SHM_LOCK test confirms the page is unevictable and skips otherwise.

Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
v3: Dropped Sarthak's Reviewed-by from v2 5/8: added the fixture check
    for hidden PFNs and create_temp_file(), and the shared anonymous
    test now fails rather than skips when the page is not unmapped.
---
 .../testing/selftests/mm/madv_cold_pageout.c  | 177 ++++++++++++++++++
 tools/testing/selftests/mm/vm_util.h          |   1 +
 2 files changed, 178 insertions(+)

diff --git a/tools/testing/selftests/mm/madv_cold_pageout.c b/tools/testing/selftests/mm/madv_cold_pageout.c
index 0874726ec141..7d92f0ecbd27 100644
--- a/tools/testing/selftests/mm/madv_cold_pageout.c
+++ b/tools/testing/selftests/mm/madv_cold_pageout.c
@@ -7,7 +7,11 @@
 #include <fcntl.h>
 #include <sched.h>
 #include <stdbool.h>
+#include <stdint.h>
+#include <sys/ipc.h>
 #include <sys/mman.h>
+#include <sys/shm.h>
+#include <sys/stat.h>
 #include <unistd.h>
 
 #include "kselftest_harness.h"
@@ -44,19 +48,47 @@ static void pin_to_current_cpu(void)
 	CPU_FREE(mask);
 }
 
+/* Whether pagemap shows PFNs, which it only does with CAP_SYS_ADMIN. */
+static bool pagemap_shows_pfns(struct __test_metadata *_metadata,
+			       int pagemap_fd)
+{
+	unsigned long pfn;
+	char *page;
+
+	page = mmap(NULL, page_size, PROT_READ | PROT_WRITE,
+		    MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+	ASSERT_NE(page, MAP_FAILED);
+	page[0] = 1;
+	pfn = pagemap_get_pfn(pagemap_fd, page);
+	ASSERT_EQ(munmap(page, page_size), 0);
+
+	return pfn && pfn != -1UL;
+}
+
 FIXTURE(madv_cold_pageout)
 {
 	int pagemap_fd;
+	/* Needs root, and is -1 unless pagemap also shows PFNs. */
+	int kpageflags_fd;
 };
 
 FIXTURE_SETUP(madv_cold_pageout)
 {
 	self->pagemap_fd = open("/proc/self/pagemap", O_RDONLY);
 	ASSERT_GE(self->pagemap_fd, 0);
+	self->kpageflags_fd = open("/proc/kpageflags", O_RDONLY);
+	/* Page flags are no use without the PFNs to look them up by. */
+	if (self->kpageflags_fd >= 0 &&
+	    !pagemap_shows_pfns(_metadata, self->pagemap_fd)) {
+		close(self->kpageflags_fd);
+		self->kpageflags_fd = -1;
+	}
 }
 
 FIXTURE_TEARDOWN(madv_cold_pageout)
 {
+	if (self->kpageflags_fd >= 0)
+		close(self->kpageflags_fd);
 	close(self->pagemap_fd);
 }
 
@@ -76,6 +108,58 @@ static bool pageout_until_swapped(char *mapping, size_t size, int pagemap_fd)
 	return false;
 }
 
+/* Page out the range until its first page is unmapped, or madvise() fails. */
+static bool pageout_until_unmapped(char *mapping, size_t size, int pagemap_fd)
+{
+	int retry;
+
+	for (retry = 0; retry < PAGEOUT_RETRIES; retry++) {
+		if (madvise(mapping, size, MADV_PAGEOUT))
+			return false;
+		if (!pagemap_is_populated(pagemap_fd, mapping))
+			return true;
+		usleep(10000);
+	}
+
+	return false;
+}
+
+/* Create an unlinked, zero-filled temporary file, or return -1. */
+static int create_temp_file(size_t size)
+{
+	char template[] = "/tmp/madv_cold_pageout-XXXXXX";
+	int fd;
+
+	fd = mkstemp(template);
+	if (fd < 0)
+		return -1;
+	unlink(template);
+	if (ftruncate(fd, size)) {
+		close(fd);
+		return -1;
+	}
+
+	return fd;
+}
+
+/* Map an unlinked, zero-filled temporary file with the given permissions. */
+static char *map_temp_file(struct __test_metadata *_metadata, size_t size,
+			   int flags, mode_t mode)
+{
+	char *mapping;
+	int fd;
+
+	fd = create_temp_file(size);
+	ASSERT_GE(fd, 0);
+	ASSERT_EQ(fchmod(fd, mode), 0);
+
+	mapping = mmap(NULL, size, PROT_READ | PROT_WRITE, flags, fd, 0);
+	ASSERT_NE(mapping, MAP_FAILED);
+	close(fd);
+
+	return mapping;
+}
+
 /*
  * Both hints are best effort, so these tests check what userspace can rely
  * on: which mappings are accepted, which pages must never be reclaimed, and
@@ -275,6 +359,99 @@ TEST_F(madv_cold_pageout, pageout_skips_swapped_pte)
 	check_skips_swapped_pte(_metadata, self->pagemap_fd, MADV_PAGEOUT);
 }
 
+/* MADV_COLD must not discard a dirty page of a shared file mapping. */
+TEST_F(madv_cold_pageout, cold_preserves_dirty_shared_file_page)
+{
+	char *mapping;
+
+	mapping = map_temp_file(_metadata, page_size, MAP_SHARED, 0600);
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
+TEST_F(madv_cold_pageout, pageout_preserves_dirty_shared_file_page)
+{
+	char *mapping;
+
+	mapping = map_temp_file(_metadata, page_size, MAP_SHARED, 0600);
+	mapping[0] = 1;
+
+	if (!pageout_until_unmapped(mapping, page_size, self->pagemap_fd))
+		SKIP(return, "MADV_PAGEOUT did not unmap the page");
+	ASSERT_EQ(mapping[0], 1);
+
+	ASSERT_EQ(munmap(mapping, page_size), 0);
+}
+
+/* MADV_PAGEOUT must not lose the contents of shared anonymous memory. */
+TEST_F(madv_cold_pageout, pageout_preserves_shared_anon_page)
+{
+	char *mapping;
+
+	mapping = mmap(NULL, page_size, PROT_READ | PROT_WRITE,
+		       MAP_SHARED | MAP_ANONYMOUS, -1, 0);
+	ASSERT_NE(mapping, MAP_FAILED);
+	mapping[0] = 1;
+
+	/* MADV_PAGEOUT unmaps a shmem page even when it cannot swap it out. */
+	ASSERT_TRUE(pageout_until_unmapped(mapping, page_size,
+					   self->pagemap_fd));
+	ASSERT_EQ(mapping[0], 1);
+
+	ASSERT_EQ(munmap(mapping, page_size), 0);
+}
+
+/*
+ * SHM_LOCK makes shmem pages unevictable without setting VM_LOCKED on the
+ * VMA, so MADV_PAGEOUT accepts the range but must not reclaim the page.
+ */
+TEST_F(madv_cold_pageout, pageout_skips_unevictable_page)
+{
+	unsigned long pfn;
+	uint64_t flags;
+	char *mapping;
+	int shmid;
+
+	if (self->kpageflags_fd < 0)
+		SKIP(return, "cannot read page flags");
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
 /* Swap out an anonymous page, to see whether swap works at all. */
 static bool probe_swap(int pagemap_fd)
 {
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

