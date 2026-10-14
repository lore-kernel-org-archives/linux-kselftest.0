Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F39856510A
	for <linux-kselftest@vger.kernel.org>; Wed, 14 Oct 2026 17:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792000700; cv=none; b=FgNIoWjhYSWTMHlBg+/qaPeMAmqa9mlU3oq9dXSlgJhp8NWnF9yg6ZIhwcrrG8abeMhRqJdi1CxKY+whhC0REHVWHLeN/uMNuPVzaA69U7sgkyf0eZ2yygQhDsHKrDipbowIsRiVHETHtN2PxgA2Wla+2WHBevX5xBBzLBCUCPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792000700; c=relaxed/simple;
	bh=55AKAcloP0Hhq283j5ufC3ZfrBrRU4KaHhe44m64V+w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u4PbIsFTIn+Qi4MJXF0m8toDHDnPOhTvGYlojka4+ztjyjqCKncMU2CkETyNIzZ7hJigK371h5NjXaJprgqlUMkkhnG1mjkxweZOJMSJONTKqJWNDwflARCpANNDi52Gl5/JKngvXzuyvx1l44RIhHZTHfI7/TSvEOV6vJtAopE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=pgppgxq3; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="pgppgxq3"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-533972e0cccso50544591cf.0
        for <linux-kselftest@vger.kernel.org>; Wed, 14 Oct 2026 10:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1792000696; x=1792605496; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gCaGfSim3PIx3Nsok29/mbPBbK9Nc93PZX36t0w056I=;
        b=pgppgxq3lGIDLWf/o76lCQ84qFlrKno8AG6Vbv777FqhYTZ0wiUhm6keQn3iqua2DZ
         r5ch059TKBXrZNMiPRnO/eAVzjvRzXTyzFitCaHiErHppvxJDjay1xLkeGfai556ZDJa
         ORP1VwkpeZXEVu+u6rcqYgObK+2T5PDJ1+In2/L78nAjugCtKpeUeMdZv8N2eIbm/hCV
         3A+NFwcWeVtjjAprBRbQi56BntN26jkQtNNcirM2+ylNQ+KlvNokVcc9Ns6rtBozYNms
         Vq1W81N6brNms1AlZOgfLDfk53gg3CCwTW7MZv8tWw8SF/IqS8wHw7MpxavLb2ph2RdQ
         e2hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792000696; x=1792605496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gCaGfSim3PIx3Nsok29/mbPBbK9Nc93PZX36t0w056I=;
        b=PxcslYeKmM2y1F4rAblbisCkbaSHcfYe67UTw+2kvuFYbsDYqIBIxoa/TEO8jMjqK3
         w+4PJNY0mHO8+hNdVjYAaMmrvAcQy9+TbQbFNkm0D+qE3h9OX+XRICqB66+7cgjlcYQm
         wan/LRlEpLlkzk1J19Xs1jG/BriYMEYPiJ7KpP56T4K9liy2krK0weGmZ7S4PwTaID2b
         yvaXmIelKgYTx6lx3CSPHQDgptib46y/1q+DZxLFNOLjk2/I0OcA5P9mPLbMfjE8fAYl
         /0hBXlv7o83OpDbvjraXHZ9FYcp+K5yV2zfQjsrscnr0JSDwZ1gZfc9lFp9vZrj4SH7v
         6r9Q==
X-Gm-Message-State: AFq9FYKfNPeGQcJoe3k9lHlbp9UJoLkmoypDD25Rc+E7r6vqWWuDDXHS
	LmJUVvt1D87+5QRRMOV+SHJYf2WZP7rFbaadjCkedKQaLiyDFarHeCPCUfywrftiYGqrDCl3DAv
	p6m1fHlo=
X-Gm-Gg: AYBFou1Mim86RkjwPK0PPl3USqJHHuv+eMPCP37aqY5PxXjcq9XrDNnKI98P3i2QBvZ
	UWeMMPVi2g8kzyqx8YmvdWNsHwO1m5hv6J9S9OLFzgY7823MEjM1IFGkp3Bk59VyzOtWKmzML0I
	T5+q5ZgmZsxjYgQYaibgdHN9/30bC9jLu9NOuknHBPWjHTnyGD/0OxpsbiXzhH3jU/gAAf9c6vV
	bEYduRJK8iLkSelImrc3z/WAkg/4UN7qQS+Ljd3nsB8/1br9it433UkUT2ye6YvNhg+zZHk0qmh
	Gjntd4G25UGRkVPeSvHcntOYY1k+aK3bm6I+DqK2vOQLhHQ2PIs5Nmq3NSe95ZOUU4GXPLgsNpq
	wxlzX3+DoUdodwO6QPWxLiXQC4U8f6ukhjH/CLy/6CSm71pv5kqiCa1IzmMbeiERSUBDiSiN0NY
	LVX/tCH9bQgSNTi4nkTbJok/HnuKwBMaptHJNVFVwNTcDOh8TtxkFxcM9mCmnX/3MSY6TEv71TU
	3tltoBpxVk1L7txcirNOMqvVxsvTJViTxTQOLSRjWqP0wAoXLIewSedh7t5
X-Received: by 2002:a05:622a:1f0b:b0:535:1291:f1c5 with SMTP id d75a77b69052e-535acef8d28mr253194901cf.54.1792000696292;
        Wed, 14 Oct 2026 10:58:16 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b97b95847sm58498006d6.32.2026.10.14.10.58.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 10:58:15 -0700 (PDT)
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
Subject: [PATCH 8/8] selftests/mm: check that unauthorized MADV_PAGEOUT skips large file folios
Date: Wed, 14 Oct 2026 13:57:56 -0400
Message-ID: <20261014175756.2035176-9-gourry@gourry.net>
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

A caller that neither owns nor may write a file may page out the COW pages
of a private mapping of it, but not its file pages. When the advised range
only partly covers a large file folio, the folio must be filtered out
before it is split or reclaimed, on separate paths for PMD- and PTE-mapped
folios.

Check that partial MADV_PAGEOUT by such a caller leaves every page of a
PMD-sized shmem folio resident, both when a PMD maps it and when a mapping
of half of it maps it with PTEs.

Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 tools/testing/selftests/mm/madvise.c | 121 +++++++++++++++++++++++++--
 1 file changed, 115 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/mm/madvise.c b/tools/testing/selftests/mm/madvise.c
index 74202fed2d04..d59c03ec8191 100644
--- a/tools/testing/selftests/mm/madvise.c
+++ b/tools/testing/selftests/mm/madvise.c
@@ -88,10 +88,11 @@ static char *map_aligned_pages(struct __test_metadata *_metadata, size_t size)
 }
 
 /*
- * Collapse a PMD-aligned range into PMD-mapped anonymous THPs. MADV_COLLAPSE
- * may fail transiently with EAGAIN.
+ * Collapse a PMD-aligned range into PMD-mapped THPs, and confirm the result
+ * with check_huge(). MADV_COLLAPSE may fail transiently with EAGAIN.
  */
-static bool collapse(char *mapping, size_t size)
+static bool collapse(char *mapping, size_t size,
+		     bool (*check_huge)(void *, size_t, int, uint64_t))
 {
 	int nr_hpages = size / pmd_size;
 	int retry;
@@ -100,8 +101,7 @@ static bool collapse(char *mapping, size_t size)
 		if (madvise(mapping, size, MADV_COLLAPSE)) {
 			if (errno != EAGAIN)
 				return false;
-		} else if (check_huge_anon(mapping, size, nr_hpages,
-					   pmd_size)) {
+		} else if (check_huge(mapping, size, nr_hpages, pmd_size)) {
 			return true;
 		}
 		usleep(10000);
@@ -118,7 +118,7 @@ static char *map_thp(struct __test_metadata *_metadata)
 	if (!pmd_size)
 		return NULL;
 	mapping = map_aligned_pages(_metadata, pmd_size);
-	if (collapse(mapping, pmd_size))
+	if (collapse(mapping, pmd_size, check_huge_anon))
 		return mapping;
 	ASSERT_EQ(munmap(mapping, pmd_size), 0);
 	return NULL;
@@ -147,6 +147,33 @@ static void pte_map_thp(struct __test_metadata *_metadata, char *mapping,
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
+	fd = memfd_create("madvise-pageout", 0);
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
@@ -734,4 +761,86 @@ TEST_F(madvise, pageout_private_file_reclaims_only_cow)
 	ASSERT_EQ(munmap(mapping, 2 * page_size), 0);
 }
 
+/*
+ * An unauthorized caller must not page out a large file folio of a private
+ * mapping, even when the advised range only partly covers it. See
+ * pageout_stays_within_range about other unmapping.
+ */
+TEST_F(madvise, pageout_private_file_skips_large_file_folio)
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
+	for (offset = 0; offset < pmd_size; offset += page_size)
+		ASSERT_TRUE(page_is_present(self->pagemap_fd,
+					    mapping + offset));
+	assert_filled(_metadata, mapping, pmd_size);
+
+	ASSERT_EQ(munmap(mapping, pmd_size), 0);
+	close(fd);
+}
+
+/*
+ * An unauthorized caller must not page out a large file folio that a private
+ * mapping maps with PTEs, even when the advised range covers only part of it.
+ * See pageout_stays_within_range about other unmapping.
+ */
+TEST_F(madvise, pageout_private_file_skips_pte_mapped_file_folio)
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
+		SKIP(return, "requires root to read page flags");
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
+	for (offset = 0; offset < size; offset += page_size)
+		ASSERT_TRUE(page_is_present(self->pagemap_fd,
+					    mapping + offset));
+	assert_filled(_metadata, mapping, size);
+
+	ASSERT_EQ(munmap(mapping, size), 0);
+	close(fd);
+}
+
 TEST_HARNESS_MAIN
-- 
2.56.0

