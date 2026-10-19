Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792429941;
	b=CofQKXSOAZ+eval3zpv3U6y+uSm9VA9Jb/slkv9M7a5XSDUdTNf0VVbfUD1EOEUkpvK3
	 v2Wuhh0OJ0OuGwjbhbthb9TR6vMVkxApZzkNS+O2PAUMrFi1KeD77XnB01M1QvznyFKE4
	 gwc3xEWJdIRcl6l7bEoZoBlE6bUpfwi5U1SPJ6cYC9U5nyyf+MRqFFe+2kC0KoX4rKE3d
	 lG+sFmbGb+QZM7rGpsMh6fEcl/4DKZQXK2ahXOAT4B2wOyOXIWqMguDVo/KJWqa7PgCss
	 UljZZZL0XJyfOjwxYtgI4neIn8h4nTlCsYXzflx49vJr3CXcNDD2suXP5dWXq8irXRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792429941;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=CHAyG17ULwqYW3XMyT+/P6CxC7w9alZQfDxEUV7e7EU=;
	b=uAZA6j33Pj04wJjs8vMBiIGTVsfx6D1hOxJqKy90jzdFSem/91KodAovKB8yEgGGNkzc
	 NxIeUUxBk/p6eXEbTqG/AqfZM07NcZZK90BFJ5riUqKiYVHBdS+TZP9QqLwB/8OhuREdN
	 tFwI5Z9bHbecNX65+QPYRHqcfpz44Rae552UEESIyce39WQ/CeWFeJ+NDINVBzc+0S1y5
	 k4j6Z3IHj/oJlusPR+66FBfTZ1oyPycQKmebVhdhrhtp3EvNA8OXfXQhmgp2d+6EYI8ff
	 LZqnG8f9GVyXC/bUlDbyGG/Dio1uQ7jD47l6ys/Xr81oQmcW2L1k1HDNRNR/nryoTFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=crDgUAL9;
	arc=none smtp.remote-ip=209.85.219.44
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4928F60A380A
	for <linux-kselftest@vger.kernel.org>; Mon, 19 Oct 2026 17:12:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4928F60A380A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=crDgUAL9
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-91b54d1e9cdso21466876d6.1
        for <linux-kselftest@vger.kernel.org>; Mon, 19 Oct 2026 10:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1792429940; x=1793034740; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CHAyG17ULwqYW3XMyT+/P6CxC7w9alZQfDxEUV7e7EU=;
        b=crDgUAL9qkEv7ws9tA4vseh/nxiljRLnLZSFJeOO60Wm/+5yy9LRGbzLzcYzCJtEgi
         009UkpNOgzaGAWQfxhma5ADU70StE7QrRGm3QUjMsVB0/f54J6gmcngrbmrKgh3Z2WNl
         BJrQlfDNZVSPjTDkCTk3BTGfMuPMMS2ao7hbWqRq20O0Q+w5G/MxnhRcUXeOtI0zK5tq
         lKSUZgSDbJnpV1yLJAsCnWHxsdUv9UJBGI7fG11hut1l3uNkdhKwyESXhZzOf08IzP1E
         2wcoNbbumI6g6NLWZMqoTZVeMbzgTW7DkJbyZmNX3jVvD4te7Tbfl82cmIwIZ9ZRKWkC
         zd/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792429940; x=1793034740;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CHAyG17ULwqYW3XMyT+/P6CxC7w9alZQfDxEUV7e7EU=;
        b=RkZWZAX3PA858dqyNIkLyJL7M2NvQyB7P6+83fGJk/bN6ujfCyMPsgJJ2V2iFElaVx
         irjTdflniOdnEsgod61RWPhRlzUJF9rp/5s9xVDqMbLG5WG6XldXPTn/JT3qiG8ZRQT7
         Ks1DLPlrDLuPUaBMytuYgdr0mVcLfHdrKJYDYv7HgY2aZYFYc+EbSBjokeAJVhnVeRLY
         6s18yxZq8NPnXsyP3QXyYW+7svrCXBJpSStHxu5kI4TOPUf+Qjk/Hbo4Sy9F0Rqz+QU/
         rvJ73PG2kVeGqhb89hZ6EYoE6P4lv6vkIBxOyCYKNpNRBWELuWOCdR4Iwij18MtrFdC/
         1NRg==
X-Gm-Message-State: AFq9FYLgQDvWGIwX16myTFP+o8PfMPfJ19cmO81Dl6pNE+/Xg1oV762z
	bUzApkwM7X1bGJpMEnC9CsTyMosYpMBWpSVBuUiRfVwxrk4P5PmRV5MxdYJFaM0noMQ/WW8CWDF
	7tuk5d5g=
X-Gm-Gg: AYBFou2xCF7OeIxoUTqQu8nAQC3JU79NdUl0vhmW3345jSTN83B6DoCTqgQI/xSHkm/
	sSG88hWKPUv0oQ6/2X/zYQzHw5aTa4wEQ8QwTwYXIi0RXTGC1um0PtITB0H1gU41eNnkP01JDkt
	uT+/dSMCA2XdaTaZmxdiPRhuRs8Ojl91NsaOfgo45wSjNbc9RNDSvdTad47WaIdXeyZafGPnwUa
	aR5c5n8LMuZsiB6qxjsKJv/DFjEPf0y416hddoiPtQ1RS2Lmjdtq21kGkju+g7L8nAcLkNq4j6i
	3NVxAUkYeMnx0k0O67HWW8jiVSuRVt+tMH24YMKVdYUD7PB1dA1aM9Ryr1EXdaTisQWBPvOkRgN
	Vs3jdOlyas3j7SJzl2q7xLSBggxgQL7unQi0Y4zYkevmfr41nY3tLVrLcRGpeQQzT9yZQoHeHKH
	OLXhcIuWSygG91Ak9829HwrXszwniFLHvFX9Sa9iTec57ADfDQcYHlivq+aQD4E/9um3+hoI4Ha
	eW56MCYIfPa08JxPrsZY3YO2dgqapAo7jfT7YmuAHRhnqQHqUwzXvO20lXZ
X-Received: by 2002:a05:6214:1d2a:b0:91b:7f54:8dc1 with SMTP id 6a1803df08f44-91bdf3e5077mr140461206d6.50.1792429940088;
        Mon, 19 Oct 2026 10:12:20 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c040d4cedsm723116d6.34.2026.10.19.10.12.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 10:12:19 -0700 (PDT)
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
Subject: [PATCH v3 7/7] selftests/mm: check that unauthorized MADV_PAGEOUT skips large file folios
Date: Mon, 19 Oct 2026 13:12:06 -0400
Message-ID: <20261019171206.3331374-8-gourry@gourry.net>
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

A caller that neither owns nor may write a file may page out the COW
pages of a private mapping of it, but not its file pages. When the
advised range only partly covers a large file folio, the folio must be
filtered out before it is split, on separate paths for PMD- and
PTE-mapped folios.

Splitting a file folio unmaps all of it, and a partly covered folio can
only be reclaimed after a split, so a split is the failure to look for.

Check that partial MADV_PAGEOUT by such a caller leaves every mapped page
of a PMD-sized shmem folio mapped, both when a PMD maps it and when a
mapping of half of it maps it with PTEs. Since this checks for a split
rather than for reclaim, it needs no swap.

Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
Reviewed-by: Sarthak Sharma <sarthak.sharma@arm.com>
---
 .../testing/selftests/mm/madv_cold_pageout.c  | 114 ++++++++++++++++++
 1 file changed, 114 insertions(+)

diff --git a/tools/testing/selftests/mm/madv_cold_pageout.c b/tools/testing/selftests/mm/madv_cold_pageout.c
index f5a81d7bd08b..5a226ccbacb2 100644
--- a/tools/testing/selftests/mm/madv_cold_pageout.c
+++ b/tools/testing/selftests/mm/madv_cold_pageout.c
@@ -195,6 +195,33 @@ static void pte_map_thp(struct __test_metadata *_metadata, char *mapping,
 	ASSERT_TRUE(flags & KPF_COMPOUND_HEAD);
 }
 
+static char *map_aligned_file(struct __test_metadata *_metadata, int fd,
+			      size_t size, int flags)
+{
+	char *mapping = reserve_aligned(_metadata, size);
+
+	ASSERT_EQ(mmap(mapping, size, PROT_READ | PROT_WRITE, flags | MAP_FIXED,
+		       fd, 0), mapping);
+
+	return mapping;
+}
+
+/* Create a PMD-sized shmem file filled with 1s. */
+static int create_shmem_file(struct __test_metadata *_metadata)
+{
+	char *shared;
+	int fd;
+
+	fd = memfd_create("madv_cold_pageout", 0);
+	ASSERT_GE(fd, 0);
+	ASSERT_EQ(ftruncate(fd, pmd_size), 0);
+	shared = map_aligned_file(_metadata, fd, pmd_size, MAP_SHARED);
+	memset(shared, 1, pmd_size);
+	ASSERT_EQ(munmap(shared, pmd_size), 0);
+
+	return fd;
+}
+
 static void assert_filled(struct __test_metadata *_metadata,
 			  const char *mapping, size_t size)
 {
@@ -792,6 +819,93 @@ TEST_F(madv_cold_pageout, pageout_private_file_reclaims_only_cow)
 	ASSERT_EQ(munmap(mapping, 2 * page_size), 0);
 }
 
+/*
+ * An unauthorized caller must leave a large file folio of a private mapping
+ * alone, even when the advised range only partly covers it. Splitting the
+ * folio would unmap all of it, so every page must stay mapped, which needs
+ * no swap to check. See pageout_stays_within_range about other unmapping.
+ */
+TEST_F(madv_cold_pageout, pageout_private_file_skips_large_file_folio)
+{
+	char *mapping;
+	size_t offset;
+	int fd;
+
+	if (!pmd_size)
+		SKIP(return, "PMD-sized THPs are not supported");
+	if (geteuid())
+		SKIP(return, "requires root to change credentials");
+	fd = create_shmem_file(_metadata);
+	mapping = map_aligned_file(_metadata, fd, pmd_size, MAP_PRIVATE);
+	if (!collapse(mapping, pmd_size, check_huge_file))
+		SKIP(return, "could not allocate a PMD-sized shmem THP");
+	ASSERT_EQ(fchmod(fd, 0400), 0);
+	if (!drop_privileges())
+		SKIP(return, "could not drop privileges");
+
+	ASSERT_EQ(madvise(mapping, pmd_size / 2, MADV_PAGEOUT), 0);
+	for (offset = 0; offset < pmd_size; offset += page_size) {
+		ASSERT_TRUE(page_is_present(self->pagemap_fd,
+					    mapping + offset))
+			TH_LOG("page at offset %zu was unmapped", offset);
+	}
+	assert_filled(_metadata, mapping, pmd_size);
+
+	ASSERT_EQ(munmap(mapping, pmd_size), 0);
+	close(fd);
+}
+
+/*
+ * The same holds for a large file folio that a private mapping maps with
+ * PTEs: every page the mapping maps must stay mapped. See
+ * pageout_stays_within_range about other unmapping.
+ */
+TEST_F(madv_cold_pageout, pageout_private_file_skips_pte_mapped_file_folio)
+{
+	const size_t size = pmd_size / 2;
+	char *mapping, *shared;
+	unsigned long pfn;
+	uint64_t flags;
+	size_t offset;
+	int fd;
+
+	if (!pmd_size)
+		SKIP(return, "PMD-sized THPs are not supported");
+	if (geteuid())
+		SKIP(return, "requires root to change credentials");
+	if (self->kpageflags_fd < 0)
+		SKIP(return, "cannot read page flags");
+	fd = create_shmem_file(_metadata);
+	shared = map_aligned_file(_metadata, fd, pmd_size, MAP_SHARED);
+	if (!collapse(shared, pmd_size, check_huge_file))
+		SKIP(return, "could not allocate a PMD-sized shmem THP");
+	ASSERT_EQ(munmap(shared, pmd_size), 0);
+
+	/* Mapping half of the folio leaves it mapped by PTEs. */
+	mapping = mmap(NULL, size, PROT_READ | PROT_WRITE, MAP_PRIVATE, fd, 0);
+	ASSERT_NE(mapping, MAP_FAILED);
+	assert_filled(_metadata, mapping, size);
+	pfn = pagemap_get_pfn(self->pagemap_fd, mapping);
+	ASSERT_NE(pfn, -1UL);
+	ASSERT_EQ(pageflags_get(pfn, self->kpageflags_fd, &flags), 0);
+	if (!(flags & KPF_COMPOUND_HEAD))
+		SKIP(return, "the shmem THP was split");
+	ASSERT_EQ(fchmod(fd, 0400), 0);
+	if (!drop_privileges())
+		SKIP(return, "could not drop privileges");
+
+	ASSERT_EQ(madvise(mapping, size / 2, MADV_PAGEOUT), 0);
+	for (offset = 0; offset < size; offset += page_size) {
+		ASSERT_TRUE(page_is_present(self->pagemap_fd,
+					    mapping + offset))
+			TH_LOG("page at offset %zu was unmapped", offset);
+	}
+	assert_filled(_metadata, mapping, size);
+
+	ASSERT_EQ(munmap(mapping, size), 0);
+	close(fd);
+}
+
 /* Swap out an anonymous page, to see whether swap works at all. */
 static bool probe_swap(int pagemap_fd)
 {
-- 
2.56.0

