Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F4218175A6F
	for <linux-kselftest@vger.kernel.org>; Wed, 18 Mar 2026 04:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773807496; cv=none; b=AmzjyoSby+dhKJB/SKrzdzIQaJo5E8nM/6yBRXmZpXV1rF1rYO0xSSS6FVHkpU40Skic/u577EwKOtycDp6Uggu61sfBj8rxTKl9CWYNxCIpU19B8vQ5jhJ9EqegAKZHrIqG3UMM4oUu9m0fTKkMIyTtU12Co9g+scm8ESwsuLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773807496; c=relaxed/simple;
	bh=cU4xf4Eh+lqYYN+H3LadtDOPt9AQFQm4099xMMpjf+0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AjdWNSr/0C9IAvluC7D56Pcbhu06QdHE693soByBSGg6VArgKnhuWMF5ybIONjQNvhl3jS3zojgBMA4CCMbN63YifxNIvVTljbqL51MFb613vPdnzv+w3xBk9HFRtVZ+FbJOo1ytj/MTuLyPrbhMLLYqaxqUchCVjifWQZoT6CY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name; spf=pass smtp.mailfrom=chrisdown.name; dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.b=G5sk7Fz6; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.b="G5sk7Fz6"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2aecc6b0861so1603135ad.2
        for <linux-kselftest@vger.kernel.org>; Tue, 17 Mar 2026 21:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1773807494; x=1774412294; darn=vger.kernel.org;
        h=user-agent:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3O/0uI2fOT2z8JCTJP8YkN4bS7/cK07tAt5pbKhSODY=;
        b=G5sk7Fz6CxZzcqHOcP+2/xj5F9MNjzbOr82l4Hneu4J6DPyMH+sziS3axWwvD2Ifvr
         eiAw7GFyo5grF1ARDYHq3wjhVltItZiraRPYtNn2q4VviNZmCJyIff1Xm0UlWUbtn62d
         WXfjU77b1zLd60M9vM9cC9VjlqbJCuWz6oCmM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773807494; x=1774412294;
        h=user-agent:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3O/0uI2fOT2z8JCTJP8YkN4bS7/cK07tAt5pbKhSODY=;
        b=LUEuqkfxL91476ao08m9WgTbEDHMrIGypT6AzbBm+A06CFbiP8Ny0n5oNel6anhyF+
         He6iRzT5olt4k8rX7uB/BSxTXqdmMyFPmr+L31n63akMNvQ5u2jrSkR/mWLn7D8bFWnz
         IaHkA3CKEp+hrkpt0vFCAikjPWzWdTTfjwe8ncKuk6RFR/NJ7xblvdwpVLyLNWLEzJpo
         7PLaNAY6h+VQzW9OO3q65B0s1ftPXv7KBT6l+gcEnKcM4l9gjDgfrJRmevQ7XsFqozi5
         519CQ+832Z9TF74/5vDj+ATbq/kqwiKJDXuvRk/c/MfZ1W/G+CIQbwjpjl6whWfKy6E/
         lhGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYwzXiSK7R9mOOU5SNkNFnDyHNNDFvwrv5S3FhOaA//3dq7nx1zWZIzVa1/gUcZavFRRV5X9OIt60j5W08a0M=@vger.kernel.org
X-Gm-Message-State: AOJu0YyaixZGxjs4sX/FZdIxDxhBVbGzMNtxnAPtAk55KoBnzNyAYEJR
	0a6Y7cg/EjpW52uFb1FfpbVt3l/+yvA6Vt1KM4qiczySGedDNeEvA3wMrTlhHG8mpzw=
X-Gm-Gg: ATEYQzzpkTjN/v7iNPTENws1RwcgYzkXlC6TwzBt8xRxPiASsYJ+Aen5GOf8Vi70vHo
	G+7gLR7WKJzDw3/pWdF4r6uw7zwsSc/ol1Qst+gYeTPZMtgtl5wvhUIJB0CUpNyJskVGpmySY6+
	y0wXo78CYpPgHyMfjyHwvtUt4XB0LqV0onX/b2ZxQzXt0eHr++RKdE/tAkx5n2cQv1mltdcbPQZ
	wlrtsSMbib+ipycGZvBhNqvhvh86iM3RBf4OPWh6XTjx3TQFK9jc9G98geAUQZ5Ci2cFZZIHmNf
	yil8BSmpGeqa8QxLmf67p8NEA5gb5oBECMH1WnjZDDzY21A5J/1i3IG4tiCt+CMFGuoi9Ghj7Fm
	LQTVoHRAp0VMOwgHSuSXwFTgoE3npWMeg/ByOB8ZJrkUVTtn7t4XljzvI8OXIxjruyzVvo5Kftc
	xZcI3ueXJ9DfoUkFJVUdK6
X-Received: by 2002:a17:903:1666:b0:2ae:3afc:eb42 with SMTP id d9443c01a7336-2b06e3f7ce6mr19434655ad.38.1773807494369;
        Tue, 17 Mar 2026 21:18:14 -0700 (PDT)
Received: from localhost ([116.86.198.140])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b06e632418sm12962395ad.81.2026.03.17.21.18.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 21:18:13 -0700 (PDT)
Date: Wed, 18 Mar 2026 12:18:11 +0800
From: Chris Down <chris@chrisdown.name>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Mike Rapoport <rppt@kernel.org>, Peter Xu <peterx@redhat.com>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>,
	Matthew Wilcox <willy@infradead.org>, kernel-team@fb.com,
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] selftests/mm: Add UFFDIO_MOVE huge zeropage PMD
 regression test
Message-ID: <abongwF3X0G8xY1I@chrisdown.name>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/2.3 (50e3b1f3) (2026-01-25)

The existing uffd-unit-tests move-pmd coverage exercises PMD-sized
UFFDIO_MOVE on anonymous THPs, but it does not force the huge zeropage
PMD path in move_pages_huge_pmd().

Add a dedicated anonymous UFFDIO_MOVE PMD test that exercises this
relatively comprehensively.

Signed-off-by: Chris Down <chris@chrisdown.name>
---
 tools/testing/selftests/mm/uffd-unit-tests.c | 100 +++++++++++++++++++
 tools/testing/selftests/mm/vm_util.c         |  12 +++
 tools/testing/selftests/mm/vm_util.h         |   1 +
 3 files changed, 113 insertions(+)

diff --git a/tools/testing/selftests/mm/uffd-unit-tests.c b/tools/testing/selftests/mm/uffd-unit-tests.c
index 6f5e404a446c..9cc4cbab9a23 100644
--- a/tools/testing/selftests/mm/uffd-unit-tests.c
+++ b/tools/testing/selftests/mm/uffd-unit-tests.c
@@ -1227,6 +1227,99 @@ static void uffd_move_pmd_test(uffd_global_test_opts_t *gopts, uffd_test_args_t
 			      uffd_move_pmd_handle_fault);
 }
 
+static void uffd_move_pmd_huge_zeropage_test(uffd_global_test_opts_t *gopts,
+					     uffd_test_args_t *targs)
+{
+	unsigned long pmd_size = read_pmd_pagesize();
+	unsigned long pmd_pages;
+	unsigned long bytes = gopts->nr_pages * gopts->page_size;
+	char *orig_area_src = gopts->area_src, *orig_area_dst = gopts->area_dst;
+	char *aligned_src, *aligned_dst;
+	unsigned long src_offs, dst_offs, max_offs;
+	pthread_t uffd_mon;
+	struct uffd_args args = { 0 };
+	char c = '\0';
+	int pagemap_fd;
+
+	if (pmd_size <= gopts->page_size) {
+		uffd_test_skip("huge page size is 0, feature missing?");
+		return;
+	}
+	if (!detect_huge_zeropage()) {
+		uffd_test_skip("transparent huge zeropage disabled");
+		return;
+	}
+
+	pmd_pages = pmd_size / gopts->page_size;
+	if (bytes < pmd_size) {
+		uffd_test_skip("not enough pages for one PMD-sized move");
+		return;
+	}
+
+	aligned_src = ALIGN_UP(orig_area_src, pmd_size);
+	aligned_dst = ALIGN_UP(orig_area_dst, pmd_size);
+	src_offs = (aligned_src - orig_area_src) / gopts->page_size;
+	dst_offs = (aligned_dst - orig_area_dst) / gopts->page_size;
+	max_offs = src_offs > dst_offs ? src_offs : dst_offs;
+	if (max_offs + pmd_pages > gopts->nr_pages) {
+		uffd_test_skip("could not find aligned PMD-sized src/dst window");
+		return;
+	}
+
+	if (madvise(orig_area_dst, bytes, MADV_HUGEPAGE))
+		err("madvise(MADV_HUGEPAGE) failure");
+	if (madvise(orig_area_src, bytes, MADV_DONTFORK))
+		err("madvise(MADV_DONTFORK) failure");
+	if (madvise(aligned_src, pmd_size, MADV_DONTNEED))
+		err("madvise(MADV_DONTNEED) failure");
+
+	/* Fault in a PMD-sized huge zeropage mapping in the source. */
+	force_read_pages(aligned_src, pmd_pages, gopts->page_size);
+
+	pagemap_fd = pagemap_open();
+	if (!pagemap_is_huge_zero(pagemap_fd, aligned_src)) {
+		close(pagemap_fd);
+		uffd_test_skip("could not fault in the huge zeropage");
+		return;
+	}
+	gopts->area_src = aligned_src;
+	gopts->area_dst = aligned_dst;
+
+	if (uffd_register(gopts->uffd, gopts->area_dst, pmd_size, true, false, false))
+		err("register failure");
+
+	args.gopts = gopts;
+	args.handle_fault = uffd_move_pmd_handle_fault;
+	if (pthread_create(&uffd_mon, NULL, uffd_poll_thread, &args))
+		err("uffd_poll_thread create");
+
+	/*
+	 * One fault on dst should trigger a single PMD-sized UFFDIO_MOVE from
+	 * the huge zeropage PMD we populated in the source.
+	 */
+	force_read_pages(gopts->area_dst, pmd_pages, gopts->page_size);
+
+	if (write(gopts->pipefd[1], &c, sizeof(c)) != sizeof(c))
+		err("pipe write");
+	if (pthread_join(uffd_mon, NULL))
+		err("join() failed");
+
+	if (args.missing_faults != 1 || args.minor_faults != 0) {
+		uffd_test_fail("stats check error");
+	} else if (!pagemap_is_huge_zero(pagemap_fd, gopts->area_dst)) {
+		uffd_test_fail("moved destination is not a huge zeropage PMD");
+	} else if (!check_huge_anon(gopts->area_dst, 0, pmd_size)) {
+		/* vm_normal_page_pmd() must continue to treat the moved PMD as special. */
+		uffd_test_fail("moved huge zeropage PMD counted as AnonHugePages");
+	} else {
+		uffd_test_pass();
+	}
+
+	gopts->area_src = orig_area_src;
+	gopts->area_dst = orig_area_dst;
+	close(pagemap_fd);
+}
+
 static void uffd_move_pmd_split_test(uffd_global_test_opts_t *gopts, uffd_test_args_t *targs)
 {
 	if (madvise(gopts->area_dst, gopts->nr_pages * gopts->page_size, MADV_NOHUGEPAGE))
@@ -1550,6 +1643,13 @@ uffd_test_case_t uffd_tests[] = {
 		.uffd_feature_required = UFFD_FEATURE_MOVE,
 		.test_case_ops = &uffd_move_test_pmd_case_ops,
 	},
+	{
+		.name = "move-pmd-huge-zeropage",
+		.uffd_fn = uffd_move_pmd_huge_zeropage_test,
+		.mem_targets = MEM_ANON,
+		.uffd_feature_required = UFFD_FEATURE_MOVE,
+		.test_case_ops = &uffd_move_test_pmd_case_ops,
+	},
 	{
 		.name = "move-pmd-split",
 		.uffd_fn = uffd_move_pmd_split_test,
diff --git a/tools/testing/selftests/mm/vm_util.c b/tools/testing/selftests/mm/vm_util.c
index a6d4ff7dfdc0..55cc4cc058a2 100644
--- a/tools/testing/selftests/mm/vm_util.c
+++ b/tools/testing/selftests/mm/vm_util.c
@@ -120,6 +120,18 @@ bool pagemap_is_populated(int fd, char *start)
 				PAGE_IS_PRESENT | PAGE_IS_SWAPPED);
 }
 
+bool pagemap_is_huge_zero(int fd, char *start)
+{
+	uint64_t categories;
+
+	if (!pagemap_scan_supported(fd, start))
+		return false;
+
+	categories = pagemap_scan_get_categories(fd, start);
+	return (categories & (PAGE_IS_PRESENT | PAGE_IS_PFNZERO | PAGE_IS_HUGE)) ==
+		(PAGE_IS_PRESENT | PAGE_IS_PFNZERO | PAGE_IS_HUGE);
+}
+
 unsigned long pagemap_get_pfn(int fd, char *start)
 {
 	uint64_t entry = pagemap_get_entry(fd, start);
diff --git a/tools/testing/selftests/mm/vm_util.h b/tools/testing/selftests/mm/vm_util.h
index e9c4e24769c1..e0b6ae1b12f5 100644
--- a/tools/testing/selftests/mm/vm_util.h
+++ b/tools/testing/selftests/mm/vm_util.h
@@ -85,6 +85,7 @@ uint64_t pagemap_get_entry(int fd, char *start);
 bool pagemap_is_softdirty(int fd, char *start);
 bool pagemap_is_swapped(int fd, char *start);
 bool pagemap_is_populated(int fd, char *start);
+bool pagemap_is_huge_zero(int fd, char *start);
 unsigned long pagemap_get_pfn(int fd, char *start);
 void clear_softdirty(void);
 bool check_for_pattern(FILE *fp, const char *pattern, char *buf, size_t len);

base-commit: f0caa1d49cc07b30a7e2f104d3853ec6dc1c3cad
-- 
2.53.0

