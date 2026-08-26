Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDE3A41BA9B;
	Wed, 26 Aug 2026 12:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787747111; cv=none; b=ht91S4omENS0UJAAeStPQKRFMO+Ei7u8QrEZ1ReB6nVVPUxGLuroKM/iOr5JE3DS57l43/cAo99y1b7N+p1Ne8ZvggPbQnL8M41clDF/0PcqWHPzuCkfSeL8Yerye2VH+a5diBAMVYVd0kw272kt/7Ouv/UlFmteEb6rCer36G4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787747111; c=relaxed/simple;
	bh=GvQPZ0sVbuduLvQoOF9zM5jXfFX1CSDKvuBA3qmf1I8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sS9nG0AnWJzwBiWUWZaY9iM1NIYVV1C5kOItKRsnt8MKldTwXo692hO/whkW2I4hmk/VF5wGlkqXx76a1AQGKBH16+FQI82UKSzweu0qQ19MbFlSjgpMiThqOfudMNouat+wU6rZ6pSLtVg3XiJGVhke5p0A8axPuVdsHesnGy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=uQ4oK8Tl; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="uQ4oK8Tl"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5151E1596;
	Wed, 26 Aug 2026 05:25:03 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 313D83F7D8;
	Wed, 26 Aug 2026 05:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787747107; bh=GvQPZ0sVbuduLvQoOF9zM5jXfFX1CSDKvuBA3qmf1I8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=uQ4oK8TlYljFlraHfvdRd7Krim8N2tNZDk2qqEs+rKXm1fpcULodS+jTeipE4lc2N
	 HMaynMo8ScJfqIL5txZ4T48K+OCtjAS3KEcQZGDAsXRBzmFRzGuKVxtYd+njkqSBBr
	 gst23nZKEvCkrc5DdiopebD9VDTrtXgc5SVnidQA=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Date: Wed, 26 Aug 2026 13:24:39 +0100
Subject: [PATCH v2 1/2] kselftest: mm: prevent random failure of huge page
 split for khugepaged
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-fix_split-v2-1-71153c7f579a@arm.com>
References: <20260826-fix_split-v2-0-71153c7f579a@arm.com>
In-Reply-To: <20260826-fix_split-v2-0-71153c7f579a@arm.com>
To: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
 "Liam R. Howlett" <liam@infradead.org>, Nico Pache <nico.pache@linux.dev>, 
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
 Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
 Usama Arif <usama.arif@linux.dev>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>, 
 Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Yeoreum Yun <yeoreum.yun@arm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2698; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=GvQPZ0sVbuduLvQoOF9zM5jXfFX1CSDKvuBA3qmf1I8=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBqjtsbim5lcCrKm1NTonGxRpo+/uWXYt6fnVqSW
 2zH3AZ2+mCJAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCao7bGwAKCRBt1cPRWsUx
 Mwl1C/9wWoLo2TBd76OtUebEOO9bmK1IDPaAImCIYUhdFcULi+QtYiaD5Dv95d2w/ur8IbUve0/
 H1XJHff2OIt+Cggqmtqw128mL2F0wo+Ak2JZVW1KB0oc8lsbyMHXDswwrZb0lkBh+0IiT5Ne7YT
 XyWGemLyMoggKrStCYhAzx8H4sr4VrxcNAccO8j6O0VFuSW3sgpMTBNRUhhfMUQYkmwiZPMdXO8
 T5/MIBY4rMwZNSg6ouXnHnjQG3F6eFj70MDP7EWR3OijfONE9hx4JIcOGtxEka+E9mizpeb26JB
 ehhQPMO0HbnfXVEWvsaRprxpwpckBw4s5L0mqQAqmNgcJLUIUsMEtBwToVd8lDBxN3szlymtN54
 FKJ3ajlgig/fmTN3Mu/I0vBW8wfk37ly69RS90mhuL5kysqhLDErYPnXRWKTBuLBn0AGEIG0AhK
 /S6GF2qbFCM5LXkiORwjKDIqJLKgTnL8xI4evcfrQX8SFj+13hXf6XWXjbOXX0qRKgRc8=
X-Developer-Key: i=yeoreum.yun@arm.com; a=openpgp;
 fpr=2D83E092DD0533B85875A49D6DD5C3D15AC53133

There're some random failure for split_huge_page_test when khugepaged
collapses pages into pmd again which had split by the test.

Prevent the khugepaged's collapses for split page by setting the
mapped pmd-huge-page with MADV_NOHUGEPAGE before split.

Reported-by: Kevin Brodsky <kevin.brodsky@arm.com>
Reviewed-by: Zi Yan <ziy@nvidia.com>
Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 tools/testing/selftests/mm/split_huge_page_test.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/tools/testing/selftests/mm/split_huge_page_test.c b/tools/testing/selftests/mm/split_huge_page_test.c
index 86a603692826..8f68bc94a5ca 100644
--- a/tools/testing/selftests/mm/split_huge_page_test.c
+++ b/tools/testing/selftests/mm/split_huge_page_test.c
@@ -180,6 +180,10 @@ static void verify_rss_anon_split_huge_page_all_zeroes(char *one_page, int nr_hp
 	if (!rss_anon_before)
 		ksft_exit_fail_msg("No RssAnon is allocated before split\n");
 
+	/* Prevent khugepaged from collapsing the pages. */
+	if (madvise(one_page, len, MADV_NOHUGEPAGE))
+		ksft_print_msg("MADV_NOHUGEPAGE failed to prevent khugepaged from collapsing pages.\n");
+
 	/* split all THPs */
 	write_debugfs(PID_FMT, getpid(), (uint64_t)one_page,
 		      (uint64_t)one_page + len, 0);
@@ -227,6 +231,10 @@ static void split_pmd_thp_to_order(int order)
 	if (!check_huge_anon(one_page, 4 * pmd_pagesize, 4, pmd_pagesize))
 		ksft_exit_fail_msg("No THP is allocated\n");
 
+	/* Prevent khugepaged from collapsing the pages. */
+	if (madvise(one_page, len, MADV_NOHUGEPAGE))
+		ksft_print_msg("MADV_NOHUGEPAGE failed to prevent khugepaged from collapsing pages.\n");
+
 	/* split all THPs */
 	write_debugfs(PID_FMT, getpid(), (uint64_t)one_page,
 		(uint64_t)one_page + len, order);
@@ -313,6 +321,10 @@ static void split_pte_mapped_thp(void)
 		goto out;
 	}
 
+	/* Prevent khugepaged from collapsing the pages. */
+	if (madvise(thp_area, thp_area_size, MADV_NOHUGEPAGE))
+		ksft_print_msg("MADV_NOHUGEPAGE failed to prevent khugepaged from collapsing pages.\n");
+
 	/* Split all THPs through the remapped pages. */
 	write_debugfs(PID_FMT, getpid(), (uint64_t)page_area,
 		      (uint64_t)page_area + page_area_size, 0);
@@ -542,6 +554,9 @@ static int create_pagecache_thp_and_fd(const char *testfile, size_t fd_size,
 		ksft_test_result_skip("Pagecache folio split skipped\n");
 		return -2;
 	}
+	/* Prevent khugepaged from collapsing the pages. */
+	if (madvise(*addr, fd_size, MADV_NOHUGEPAGE))
+		ksft_print_msg("MADV_NOHUGEPAGE failed to prevent khugepaged from collapsing pages.\n");
 	return 0;
 err_out_close:
 	close(*fd);

-- 
2.43.0

