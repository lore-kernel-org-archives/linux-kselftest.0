Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.225.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794363034;
	b=SxSK0TwnrdWFMjqAGTVvsQbJd7G1qrbHnEOfndWrNVT82cPXZ+NzRr1/HzsnYeiq3Ts6
	 GPpJIKHLu9WbJQUlH4qg0abO4y1g9inqQ1L+LAg6YnepLPIn+3SP76IX7fkLZiSgRMebH
	 LuEcJFzFMieP16fIN2c9B/iEjrJxGi5tkDjM7FmW84C8gtV5H/SVd1o6iKxJsNop1l2Jm
	 rDiA+oM7FIS5XlMEcPlBPrjCDyp7+8Go+r7ZT6EK3oRGQr8niCuoLKCkyMIeewQmjih6T
	 OH1sWrxjpfh1dv24ATkhIGyyCx6FiSFWp0O+sw92+isDUad7AeXTjuhLsmCc2e59DFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794363034;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:User-Agent;
	bh=Ik0iuyriivwGuaOXOQXI6fjCvEcrYQv+lAummPtyyW8=;
	b=ksKuqsZ6MWVM5vzcJ/Q9LHS398simeKqG4kTBzF06aZ/xa/Pli8gtuQEb9Vmguf2pYlD
	 xxHlCsTwQ3WpfS/EbzlFwb0wXpSTPw6gElvl0t4lQyPHajDjVjoAPGVlCogbFCgc1sEi1
	 GpUvin5GUdcEZN0ZO4UQEKa0T7zLWIBCBFOPtzdXKjTVcITOyGhPXykKeI5/llbvLGPp9
	 ws7TUUB5BmQuw/vTgYID+CV1k7/N0KFexjNh8ajYvYxUnvhqo+ZXMCbRqdY9jF57IvOlD
	 GN0Ug3yiQmbmauJXnHAJ2gcH8V1gWK0p+5/pvtUMI3R6HNG/3A8bLOm/aCusn9kpgHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b="aXCEX/ZV";
	arc=none smtp.remote-ip=74.125.225.139
Received: from mail-wm2-f11.google.com (mail-wm2-f11.google.com [74.125.225.139])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15CFA606A31C
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 02:10:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15CFA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=aXCEX/ZV
Received: by mail-wm2-f11.google.com with SMTP id 5b1f17b1804b1-4b769975b2bso11040855e9.1
        for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 18:10:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794363032; x=1794967832; darn=vger.kernel.org;
        h=user-agent:content-disposition:content-type:mime-version:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ik0iuyriivwGuaOXOQXI6fjCvEcrYQv+lAummPtyyW8=;
        b=aXCEX/ZVYiciuJXUjDyhkQyJ46nLkNHH99OFXnqCa1qBF2zOgisTBA9Eqa0u+iqFKJ
         gtO9zEgWM3T7x4DZKhEjgBseCq/UpJMePBNrGwsnP591pCbNiWzXuVX8eN0BNXQ4KzVP
         +G/63n0cbn9bjbjoITgzcoJh+eQlSl/f27Gko=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794363032; x=1794967832;
        h=user-agent:content-disposition:content-type:mime-version:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Ik0iuyriivwGuaOXOQXI6fjCvEcrYQv+lAummPtyyW8=;
        b=t3agn5ZCKMWi0Q/ix4l4V6IHC9FiNNlFwtwBcwYSmjoDR3kS9RgyFWKKh/Cpf9w1Oc
         3o2QLrViuFkegeLUEUqa0H5wSM/VWfdHSZQoFv1tOKL/e3BzYgXqsCxRi4LE3G/GyPGw
         f3a0p8M9jwUi/mEAQgKLBDZyVB97w08XkcC0sU35RG4GQg9sYhRQUMZ1HBaeM3UTvnve
         NjfTTt/kFlusz8dXi8OxDvOovj0zYmFrZ8Iio3Qbfugq/YDxTBhENjouIhwou4UmIUp2
         Jw01atouOtZ4geRaFfyZQPhvOz+6xPL4UruP9pquP4NBvMiMzpp1SRy0U+pkqMD0X99F
         BY7w==
X-Forwarded-Encrypted: i=1; AL+hErG/vRlqKklEzJ3BY3tcvrRjlMt29BCUq4d+9o34xJQGhRjKKEnVizd2FWcAsGGijnUQsnIvV03gkOb6ojucO+8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9weEtea6RKghC2ghA/VNcrm4Sx3H9PNhfChKMlnggMagA3o6X4
	v34+MNLgY3JrMqh1yx/Igi8RptLOkjNWUmIjtebGD6fWGshxnH1a1Q6xMc05RTfQqSrWAJLkCc9
	Vsp2aj7JRrrgpivjQig==
X-Gm-Gg: AYBFou0xZST6F2ZRT9ZCHKdquYWbXl1Qef4ZT8ATXOZ+57oBZPoeWcfouxGVNV5CdeP
	Xx2GTaWrYYr08S6dzAS8+k8zdSud85pmhlQnzMRkL5uZS75zKyXSZS+cwRhU0oDDPW9SCofdb2g
	b0NpqDvFR3p2r8MLSvcViKew5jJ+4mmvuh2may9a9x+okEG7XDuMeD82dB3ox74MbM+i+2fBpEQ
	gywD5idD31n1r+UjcWZCmtxm6k+1tDeoC2ZC5LI6UQ+WoRz5HRQuW/ipzPatB+dYsb+NqU/BLER
	42pA+tL4rsvlnQTUhV91x8E6+wcmUIg9MFaN+IS8iTG/VqnrQ+BqgWoV9c9whVxEosJHAXt0JOS
	BJUuQEHCzwWNmRbXlH4fkVCB83CHCijRU6BgKfvRbQLOPDcBrluZrCPo80Q0e9qeDpONVkjYLc1
	23XN3aDMFzzV1zEu0m2vPTaFy9PRFns+CKsftgn1yqnMj8EetVPHGx39nzpQbHVkQkBkpIlMjG0
	SVhjtjBAge8+tBCe5PvRpH/MpZx3tJnY44I9fbkpw7w7BM0YYdS6yVNN8vqfD1BFhXe/8BQejLF
	G4PgF07EB0BtKyEMezti3XWpboY8NeZXC5yWXmfhEBx15+5UBIsvyapQOxgYmSuAzFGGmjSC6M6
	nK8cKxxahcFRalm3SGqRiKgz2azWMRc5CFLRDDd6Y0aWgNEENYumKubqtBWDM0CkASuGAYuLvoB
	yGG8ObgCAcA6iI+t9U19n8Xtql98NzuEi5KtsrSDEeMhkd5Nagjg5I
X-Received: by 2002:a05:600c:348d:b0:4a2:148b:c88c with SMTP id 5b1f17b1804b1-4ba0935cdafmr11818455e9.8.1794363031801;
        Tue, 10 Nov 2026 18:10:31 -0800 (PST)
Received: from localhost ([199.201.64.8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4983585c5c4sm6776753f8f.17.2026.11.10.18.10.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 18:10:31 -0800 (PST)
Date: Tue, 10 Nov 2026 18:10:28 -0800
From: Chris Down <chris@chrisdown.name>
To: Andrew Morton <akpm@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>
Cc: Peter Xu <peterx@redhat.com>, David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>,
	Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: [PATCH v4] selftests/mm: Add UFFDIO_MOVE huge zeropage PMD
 regression test
Message-ID: <avPOlMOmUdjPe5NJ@chrisdown.name>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)

The move-pmd test exercises UFFDIO_MOVE on anonymous THPs but does not
cover the huge zeropage PMD path.

Add a test that faults in a huge zeropage PMD, moves it in response to
one missing fault, and checks that the destination still maps the huge
zeropage.

Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Signed-off-by: Chris Down <chris@chrisdown.name>
---

v3 at https://lore.kernel.org/r/abongwF3X0G8xY1I@chrisdown.name

Sorry, this got lost in my backlog, so resending. This is the companion for my 
earlier CVE patch.

v4:

- Clarify the PMD size skip message, rename pmd_pages to nr_pages_per_pmd,
  and use a single expected pagemap category mask (thanks, David)
- Read AnonHugePages from smaps to preserve the accounting check after
  check_huge_anon() switched to pagemap

 tools/testing/selftests/mm/uffd-unit-tests.c | 98 ++++++++++++++++++++
 tools/testing/selftests/mm/vm_util.c         | 29 ++++++
 tools/testing/selftests/mm/vm_util.h         |  2 +
 3 files changed, 129 insertions(+)

diff --git a/tools/testing/selftests/mm/uffd-unit-tests.c b/tools/testing/selftests/mm/uffd-unit-tests.c
index 2a97ba1d6feb..f05437078101 100644
--- a/tools/testing/selftests/mm/uffd-unit-tests.c
+++ b/tools/testing/selftests/mm/uffd-unit-tests.c
@@ -2034,6 +2034,97 @@ static void uffd_move_pmd_test(uffd_global_test_opts_t *gopts, uffd_test_args_t
 			      uffd_move_pmd_handle_fault);
 }
 
+static void uffd_move_pmd_huge_zeropage_test(uffd_global_test_opts_t *gopts,
+					     uffd_test_args_t *targs)
+{
+	unsigned long pmd_size = read_pmd_pagesize();
+	unsigned long nr_pages_per_pmd;
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
+		uffd_test_skip("Could not detect PMD size");
+		return;
+	}
+	if (!detect_huge_zeropage()) {
+		uffd_test_skip("transparent huge zeropage disabled");
+		return;
+	}
+
+	nr_pages_per_pmd = pmd_size / gopts->page_size;
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
+	if (max_offs + nr_pages_per_pmd > gopts->nr_pages) {
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
+	force_read_pages(aligned_src, nr_pages_per_pmd, gopts->page_size);
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
+	force_read_pages(gopts->area_dst, nr_pages_per_pmd, gopts->page_size);
+
+	if (write(gopts->pipefd[1], &c, sizeof(c)) != sizeof(c))
+		err("pipe write");
+	if (pthread_join(uffd_mon, NULL))
+		err("join() failed");
+
+	if (args.missing_faults != 1 || args.minor_faults != 0)
+		uffd_test_fail("stats check error");
+	else if (!pagemap_is_huge_zero(pagemap_fd, gopts->area_dst))
+		uffd_test_fail("moved destination is not a huge zeropage PMD");
+	else if (smaps_has_anon_huge_pages(gopts->area_dst))
+		uffd_test_fail("moved huge zeropage PMD counted as AnonHugePages");
+	else
+		uffd_test_pass();
+
+	gopts->area_src = orig_area_src;
+	gopts->area_dst = orig_area_dst;
+	close(pagemap_fd);
+}
+
 static void uffd_move_pmd_split_test(uffd_global_test_opts_t *gopts, uffd_test_args_t *targs)
 {
 	if (madvise(gopts->area_dst, gopts->nr_pages * gopts->page_size, MADV_NOHUGEPAGE))
@@ -2357,6 +2448,13 @@ uffd_test_case_t uffd_tests[] = {
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
index 515031b8283d..0b8a5100e393 100644
--- a/tools/testing/selftests/mm/vm_util.c
+++ b/tools/testing/selftests/mm/vm_util.c
@@ -122,6 +122,18 @@ bool pagemap_is_populated(int fd, char *start)
 				PAGE_IS_PRESENT | PAGE_IS_SWAPPED);
 }
 
+bool pagemap_is_huge_zero(int fd, char *start)
+{
+	const uint64_t expected = PAGE_IS_PRESENT | PAGE_IS_PFNZERO | PAGE_IS_HUGE;
+	uint64_t categories;
+
+	if (!pagemap_scan_supported(fd, start))
+		return false;
+
+	categories = pagemap_scan_get_categories(fd, start);
+	return (categories & expected) == expected;
+}
+
 unsigned long pagemap_get_pfn(int fd, char *start)
 {
 	uint64_t entry = pagemap_get_entry(fd, start);
@@ -351,6 +363,23 @@ char *__get_smap_entry(void *addr, const char *pattern, char *buf, size_t len)
 	return entry;
 }
 
+bool smaps_has_anon_huge_pages(void *addr)
+{
+	char buf[MAX_LINE_LENGTH];
+	unsigned long anon_huge_kb;
+	char *entry, *end;
+
+	entry = __get_smap_entry(addr, "AnonHugePages:", buf, sizeof(buf));
+	if (!entry)
+		ksft_exit_fail_msg("could not find AnonHugePages\n");
+
+	anon_huge_kb = strtoul(entry, &end, 10);
+	if (end == entry)
+		ksft_exit_fail_msg("could not parse AnonHugePages\n");
+
+	return anon_huge_kb != 0;
+}
+
 static bool check_large_folios(void *addr, size_t len, int nr_hpages,
 		uint64_t hpage_size)
 {
diff --git a/tools/testing/selftests/mm/vm_util.h b/tools/testing/selftests/mm/vm_util.h
index b5d59729d432..a9b84d4391f8 100644
--- a/tools/testing/selftests/mm/vm_util.h
+++ b/tools/testing/selftests/mm/vm_util.h
@@ -89,11 +89,13 @@ uint64_t pagemap_get_entry(int fd, char *start);
 bool pagemap_is_softdirty(int fd, char *start);
 bool pagemap_is_swapped(int fd, char *start);
 bool pagemap_is_populated(int fd, char *start);
+bool pagemap_is_huge_zero(int fd, char *start);
 unsigned long pagemap_get_pfn(int fd, char *start);
 void clear_softdirty(void);
 bool check_for_pattern(FILE *fp, const char *pattern, char *buf, size_t len);
 uint64_t read_pmd_pagesize(void);
 unsigned long rss_anon(void);
+bool smaps_has_anon_huge_pages(void *addr);
 bool check_huge_anon(void *addr, size_t len, int nr_hpages, uint64_t hpage_size);
 bool check_huge_file(void *addr, size_t len, int nr_hpages, uint64_t hpage_size);
 int64_t allocate_transhuge(void *ptr, int pagemap_fd);

base-commit: 067c5c24cef23d913b67eaaf71ae67e7169a6620
-- 
2.54.0

