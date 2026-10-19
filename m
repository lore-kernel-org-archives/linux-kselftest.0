Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792429938;
	b=Afcam114gnRW4Mr8me9K1l+1FcQXcCGErQrfkYcKGsOjHw/prwCYWgnsRMosnSmrC6Ug
	 Osxh8IniWm44LLYByrcmkREKbii5s9lN7Sxu1iYwG8S402WLkiRaod7a1kCzrv0Vmhxsd
	 15m27BRYNteujD5fQ/fKSJB4AMN0Y2XmsJQiTI/SEz11dMnGzW7vH3WsTy7wSg1eYwawD
	 +G7lPU/jGF58PdNOxXU0QY6i2oiwT6Rue3ecVjldb88mK1zzezm2xF/gjzr8W8MRyH6NE
	 cEyEwwfzZ2IelNl7zWOZ8UJAnVqyX5grt1kt1Agn4ktyy9q8ZE8I7osQLhtkbF0ePCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792429938;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=TjpbZTGan3B30P6ZyrSjX5pZ5tCnJRUq6rHSDYdsfAw=;
	b=Hh8ydqrTghWTO+RpmlVBdY4lEWg6onZlJPiFOM4CcNy3OKsDbCEptT6eYYKuZ2rJbWDI
	 lA4oslQZYSorMKC1jJ29bY5bpKNXX0g3DsSYuSO2xTcxPX3FAjkmcNjP8nESHvmySlCT3
	 usqmAG6CrjqsnyMwk2MnSaqnXO0fQOhQco3WDW3rAZK+pnQvOq10X4zqZjmZxl7IA3N01
	 DTmxxNuuwSVVi6WE4Fzg3oRT2ouQoL8sCP7HOb7o035f6ai/JyDynVaVeR8uTP106YBN5
	 8aH2QAYovtzC6qGhsye7yhE10BY5DCgXdYx/J8m7EJdkPVBTHH187HvS6SGl94zYLpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=f+Rj2LlI;
	arc=none smtp.remote-ip=209.85.160.174
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C8660A2625
	for <linux-kselftest@vger.kernel.org>; Mon, 19 Oct 2026 17:12:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62C8660A2625
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=f+Rj2LlI
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-53669f7b518so12748181cf.2
        for <linux-kselftest@vger.kernel.org>; Mon, 19 Oct 2026 10:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1792429937; x=1793034737; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TjpbZTGan3B30P6ZyrSjX5pZ5tCnJRUq6rHSDYdsfAw=;
        b=f+Rj2LlIJ7Ib2ZLPAgwPRaMlrkj+ouHwCdgYOI3Dj2nGWcKEnBzJ+N6wckysF3gZl+
         b9i9opRR5koPDjQmDtBbArg+GiKUO3LbAMOt6WhQ5niQDXBtQkBCDtiRNNXd4lYk1y1F
         FLY6uCqgS6dgV94vXT3OdrugFx2umS+GCbbykTj9Ufdpi4sRhLk8ijKWSTrw6vuq4pKv
         WGj0e5o6KNfegrPFxc7RWZBQ3wg+urCWspTTSmMT1rhCMfL9S9JxVPxYRnwtdfpg3EHX
         xV9zqo5caL49ntO5iYH8C/3PxuylUpKoTCFvHzGyeriycCoN+hnPa0Oow3lwEmbnVRrk
         kF1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792429937; x=1793034737;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TjpbZTGan3B30P6ZyrSjX5pZ5tCnJRUq6rHSDYdsfAw=;
        b=eGdoqkSsISeM4vwnvsnrvMmWaURxpH8uw8nOejFqVfm9oXSNusHYUOIg7t33Ce8lan
         emRYOmMMZwtNw62NGhOyBit8qLK1Adn2dpYNdzBY7RpFx8dILz7oTOV7lStmC8dCEWds
         6hC7iWcqQmQ+I9z5mz+jFukNCtgJhm91BTWo/MpNiukrwiKJLJdqrUOYuWDMRrnFBJ5D
         vX8fbO9yJEx8w/ndCE57ZvZvdcg/YBVl8xp2R8ctYHsjN9655ZtzvvyAA/0IMNR9FD4w
         4gtGGlFO6WPeIDH0qFBAzBXOg2PX92xVUccqK1XPPviGnvRa1X3SxMzHpPp2hz/GLDPR
         XHCQ==
X-Gm-Message-State: AFq9FYJHW5L4HJSRZZqpRGMmlTJXF1sU/kpdazLQSVKyksE+JYO8YrXC
	p1OHfXeb0uAlDd2TiqMFtwVIT+WH2w40m/pfYppXCyYhpFRUjjszHHBKxQ04T/p5XDH4Y0B+tNn
	F8sVhJsM=
X-Gm-Gg: AYBFou2YWPKvtfKoZPsRWRD72+J0NGG4FHLiwOKINNznNLzCeKg11KQBe4nFpqSM80F
	0xSBVO4G4U+YsF1YxBTM7K2F0+J95QrO2CdlJGcnvsmkIDW5XI5/Vj1L2G5PxL9N19C8EICc8r/
	xnus3O30Q8/XX9X+MAjBKH1GL5fmLF0snTY3Sq1p3dNzETKD462Co/TmFy12UDCrAneS446gH+g
	4QPPnVBJRLpwhoh8kBdz+O8j+XchgTljkC+u2hNhfnacS2rorukLGd1wopl8kq/OQam3Zzkf4hD
	yaYCVuLCKp8r2R9AszWjrSp2RY+bB6QCh8iwhKIqNn5+Cak5O5s2vGia88ctBvZUKDOiFdFS/93
	w8envoYa1T9eF0W+SFlg3ppGwDFPb9Ubj87MpLzc3B/Ud1TRnSHL8fZNct2FbZhQiKbueSrzUfi
	F94z7FXk/1G0gFIckc3iFw9lA6YWnvzgnVZ9ILYH2k3hThnXjknVtuOVA6jEWHGvXhJaRWt5cMk
	jguw4YefsbTzAkfSRAwfkP/7pooxh7tgs5Lgo9uMAuTTOr2yK5iLnJIumrX
X-Received: by 2002:a05:622a:514e:b0:530:42d4:4c9a with SMTP id d75a77b69052e-5364605937emr117819301cf.44.1792429936970;
        Mon, 19 Oct 2026 10:12:16 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c040d4cedsm723116d6.34.2026.10.19.10.12.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 10:12:16 -0700 (PDT)
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
	shuah@kernel.org,
	Sarthak Sharma <sarthak.sharma@arm.com>
Subject: [PATCH v3 5/7] selftests/mm: check MADV_COLD and MADV_PAGEOUT on partly advised THPs
Date: Mon, 19 Oct 2026 13:12:04 -0400
Message-ID: <20261019171206.3331374-6-gourry@gourry.net>
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

Check that paging out a whole PMD-mapped THP swaps it without corrupting
it, and that pages outside the range stay mapped after paging out a base
page or half of a PMD- or PTE-mapped THP.

Also check that MADV_COLD on half of either THP preserves its contents.

Tests skip when PMD-sized THPs cannot be allocated, and the MADV_PAGEOUT
tests also when MADV_PAGEOUT cannot swap. With /proc/kpageflags the
PTE-mapped cases also confirm that PTE-mapping left the folio large.

Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
Reviewed-by: Sarthak Sharma <sarthak.sharma@arm.com>
---
v3: Kept Sarthak's Reviewed-by; the MADV_PAGEOUT tests now skip only if
MADV_PAGEOUT cannot swap, and fail if reclaim then does not happen, as he
suggested for v2 7/8.
---
 .../testing/selftests/mm/madv_cold_pageout.c  | 238 ++++++++++++++++++
 1 file changed, 238 insertions(+)

diff --git a/tools/testing/selftests/mm/madv_cold_pageout.c b/tools/testing/selftests/mm/madv_cold_pageout.c
index 7d92f0ecbd27..b5eec490fb68 100644
--- a/tools/testing/selftests/mm/madv_cold_pageout.c
+++ b/tools/testing/selftests/mm/madv_cold_pageout.c
@@ -8,6 +8,7 @@
 #include <sched.h>
 #include <stdbool.h>
 #include <stdint.h>
+#include <string.h>
 #include <sys/ipc.h>
 #include <sys/mman.h>
 #include <sys/shm.h>
@@ -17,10 +18,15 @@
 #include "kselftest_harness.h"
 #include "vm_util.h"
 
+#ifndef MADV_COLLAPSE
+#define MADV_COLLAPSE 25
+#endif
+
 /* Reclaim can fail transiently, so retry for up to a second. */
 #define PAGEOUT_RETRIES 100
 
 static size_t page_size;
+static size_t pmd_size;
 /* Whether MADV_PAGEOUT can swap out anonymous memory, see main(). */
 static bool can_swap;
 
@@ -92,6 +98,111 @@ FIXTURE_TEARDOWN(madv_cold_pageout)
 	close(self->pagemap_fd);
 }
 
+/*
+ * Reserve a PMD-aligned range, so that memory mapped over it with MAP_FIXED
+ * can be backed by PMD-mapped THPs.
+ */
+static char *reserve_aligned(struct __test_metadata *_metadata, size_t size)
+{
+	char *reservation, *aligned;
+
+	reservation = mmap(NULL, size + pmd_size, PROT_NONE,
+			   MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+	ASSERT_NE(reservation, MAP_FAILED);
+
+	aligned = (char *)(((uintptr_t)reservation + pmd_size - 1) &
+			   ~(pmd_size - 1));
+	if (aligned != reservation)
+		ASSERT_EQ(munmap(reservation, aligned - reservation), 0);
+	ASSERT_EQ(munmap(aligned + size, reservation + pmd_size - aligned), 0);
+
+	return aligned;
+}
+
+/* Map PMD-aligned anonymous memory filled with 1s. */
+static char *map_aligned_pages(struct __test_metadata *_metadata, size_t size)
+{
+	char *mapping = reserve_aligned(_metadata, size);
+
+	ASSERT_EQ(mmap(mapping, size, PROT_READ | PROT_WRITE,
+		       MAP_PRIVATE | MAP_ANONYMOUS | MAP_FIXED, -1, 0),
+		  mapping);
+	memset(mapping, 1, size);
+
+	return mapping;
+}
+
+/*
+ * Collapse a PMD-aligned range into PMD-mapped THPs, and confirm the result
+ * with check_huge(). MADV_COLLAPSE may fail transiently with EAGAIN.
+ */
+static bool collapse(char *mapping, size_t size,
+		     bool (*check_huge)(void *, size_t, int, uint64_t))
+{
+	int nr_hpages = size / pmd_size;
+	int retry;
+
+	for (retry = 0; retry < 10; retry++) {
+		if (madvise(mapping, size, MADV_COLLAPSE)) {
+			if (errno != EAGAIN)
+				return false;
+		} else if (check_huge(mapping, size, nr_hpages, pmd_size)) {
+			return true;
+		}
+		usleep(10000);
+	}
+
+	return false;
+}
+
+/* Map a PMD-mapped anonymous THP filled with 1s, or return NULL. */
+static char *map_thp(struct __test_metadata *_metadata)
+{
+	char *mapping;
+
+	if (!pmd_size)
+		return NULL;
+	mapping = map_aligned_pages(_metadata, pmd_size);
+	if (collapse(mapping, pmd_size, check_huge_anon))
+		return mapping;
+	ASSERT_EQ(munmap(mapping, pmd_size), 0);
+	return NULL;
+}
+
+/*
+ * Changing the protection of one page PTE-maps a THP. When /proc/kpageflags
+ * is readable, also check that the folio is still large.
+ */
+static void pte_map_thp(struct __test_metadata *_metadata, char *mapping,
+			int pagemap_fd, int kpageflags_fd)
+{
+	unsigned long pfn;
+	uint64_t flags;
+
+	ASSERT_EQ(mprotect(mapping + page_size, page_size, PROT_READ), 0);
+	ASSERT_EQ(mprotect(mapping + page_size, page_size,
+			   PROT_READ | PROT_WRITE), 0);
+	ASSERT_TRUE(check_huge_anon(mapping, pmd_size, 0, pmd_size));
+	if (kpageflags_fd < 0)
+		return;
+
+	pfn = pagemap_get_pfn(pagemap_fd, mapping);
+	ASSERT_NE(pfn, -1UL);
+	ASSERT_EQ(pageflags_get(pfn, kpageflags_fd, &flags), 0);
+	ASSERT_TRUE(flags & KPF_COMPOUND_HEAD);
+}
+
+static void assert_filled(struct __test_metadata *_metadata,
+			  const char *mapping, size_t size)
+{
+	size_t offset;
+
+	for (offset = 0; offset < size; offset += page_size) {
+		ASSERT_EQ(mapping[offset], 1)
+			TH_LOG("memory changed at offset %zu", offset);
+	}
+}
+
 /* Page out the range until its first page is swapped, or madvise() fails. */
 static bool pageout_until_swapped(char *mapping, size_t size, int pagemap_fd)
 {
@@ -124,6 +235,11 @@ static bool pageout_until_unmapped(char *mapping, size_t size, int pagemap_fd)
 	return false;
 }
 
+static bool page_is_present(int pagemap_fd, char *addr)
+{
+	return pagemap_get_entry(pagemap_fd, addr) & PM_PRESENT;
+}
+
 /* Create an unlinked, zero-filled temporary file, or return -1. */
 static int create_temp_file(size_t size)
 {
@@ -452,6 +568,127 @@ TEST_F(madv_cold_pageout, pageout_skips_unevictable_page)
 	ASSERT_EQ(shmdt(mapping), 0);
 }
 
+/* MADV_PAGEOUT of a whole THP must swap it without corrupting it. */
+TEST_F(madv_cold_pageout, pageout_swaps_thp)
+{
+	char *mapping;
+
+	if (!can_swap)
+		SKIP(return, "MADV_PAGEOUT cannot swap");
+	mapping = map_thp(_metadata);
+	if (!mapping)
+		SKIP(return, "could not allocate a PMD-sized THP");
+
+	ASSERT_TRUE(pageout_until_swapped(mapping, pmd_size, self->pagemap_fd));
+	assert_filled(_metadata, mapping, pmd_size);
+
+	ASSERT_EQ(munmap(mapping, pmd_size), 0);
+}
+
+/*
+ * MADV_PAGEOUT must not reclaim pages outside the advised range. kswapd or
+ * page migration could also unmap them, but neither should happen when the
+ * selftests run by themselves.
+ */
+TEST_F(madv_cold_pageout, pageout_stays_within_range)
+{
+	char *mapping;
+
+	if (!can_swap)
+		SKIP(return, "MADV_PAGEOUT cannot swap");
+	mapping = mmap(NULL, 3 * page_size, PROT_READ | PROT_WRITE,
+		       MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+	ASSERT_NE(mapping, MAP_FAILED);
+	memset(mapping, 1, 3 * page_size);
+	ASSERT_TRUE(pageout_until_swapped(mapping + page_size, page_size,
+					  self->pagemap_fd));
+
+	ASSERT_TRUE(page_is_present(self->pagemap_fd, mapping));
+	ASSERT_TRUE(page_is_present(self->pagemap_fd, mapping + 2 * page_size));
+	assert_filled(_metadata, mapping, 3 * page_size);
+
+	ASSERT_EQ(munmap(mapping, 3 * page_size), 0);
+}
+
+/*
+ * MADV_PAGEOUT of half of a THP must split it, and reclaim only the advised
+ * half. See pageout_stays_within_range about other unmapping.
+ */
+static void pageout_half_thp(struct __test_metadata *_metadata, char *mapping,
+			     int pagemap_fd)
+{
+	size_t offset;
+
+	ASSERT_TRUE(pageout_until_swapped(mapping, pmd_size / 2, pagemap_fd));
+
+	for (offset = pmd_size / 2; offset < pmd_size; offset += page_size) {
+		ASSERT_TRUE(page_is_present(pagemap_fd, mapping + offset))
+			TH_LOG("page at offset %zu was unmapped", offset);
+	}
+	assert_filled(_metadata, mapping, pmd_size);
+}
+
+TEST_F(madv_cold_pageout, pageout_stays_within_pmd_mapped_thp)
+{
+	char *mapping;
+
+	if (!can_swap)
+		SKIP(return, "MADV_PAGEOUT cannot swap");
+	mapping = map_thp(_metadata);
+	if (!mapping)
+		SKIP(return, "could not allocate a PMD-sized THP");
+
+	pageout_half_thp(_metadata, mapping, self->pagemap_fd);
+
+	ASSERT_EQ(munmap(mapping, pmd_size), 0);
+}
+
+TEST_F(madv_cold_pageout, pageout_stays_within_pte_mapped_thp)
+{
+	char *mapping;
+
+	if (!can_swap)
+		SKIP(return, "MADV_PAGEOUT cannot swap");
+	mapping = map_thp(_metadata);
+	if (!mapping)
+		SKIP(return, "could not allocate a PMD-sized THP");
+	pte_map_thp(_metadata, mapping, self->pagemap_fd, self->kpageflags_fd);
+
+	pageout_half_thp(_metadata, mapping, self->pagemap_fd);
+
+	ASSERT_EQ(munmap(mapping, pmd_size), 0);
+}
+
+/* MADV_COLD on part of a THP may split it, but must not change it. */
+TEST_F(madv_cold_pageout, cold_preserves_half_of_pmd_mapped_thp)
+{
+	char *mapping;
+
+	mapping = map_thp(_metadata);
+	if (!mapping)
+		SKIP(return, "could not allocate a PMD-sized THP");
+
+	ASSERT_EQ(madvise(mapping, pmd_size / 2, MADV_COLD), 0);
+	assert_filled(_metadata, mapping, pmd_size);
+
+	ASSERT_EQ(munmap(mapping, pmd_size), 0);
+}
+
+TEST_F(madv_cold_pageout, cold_preserves_half_of_pte_mapped_thp)
+{
+	char *mapping;
+
+	mapping = map_thp(_metadata);
+	if (!mapping)
+		SKIP(return, "could not allocate a PMD-sized THP");
+	pte_map_thp(_metadata, mapping, self->pagemap_fd, self->kpageflags_fd);
+
+	ASSERT_EQ(madvise(mapping, pmd_size / 2, MADV_COLD), 0);
+	assert_filled(_metadata, mapping, pmd_size);
+
+	ASSERT_EQ(munmap(mapping, pmd_size), 0);
+}
+
 /* Swap out an anonymous page, to see whether swap works at all. */
 static bool probe_swap(int pagemap_fd)
 {
@@ -474,6 +711,7 @@ int main(int argc, char **argv)
 	int pagemap_fd;
 
 	page_size = getpagesize();
+	pmd_size = read_pmd_pagesize();
 	/* The harness forks each test, which inherits this. */
 	pin_to_current_cpu();
 	/* Only root can reserve the page that hugetlb_vma_is_rejected maps. */
-- 
2.56.0

