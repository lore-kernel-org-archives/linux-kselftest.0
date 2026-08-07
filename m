Received: from fhigh-b6-smtp.messagingengine.com (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9F3C470440;
	Fri,  7 Aug 2026 11:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786102626; cv=none; b=aPwwo9PQFvSaj2wk4z0sr+3cf5z4GGCcFtU9xcYgvmWlMjdunuNL7iiJ/naQKgS3bOomO1J1Et5GXdRWAh170DPa1JWCmTGVbEZ63CtNr6AIZ9KTMrCEVDDaqlt5grJEkQo2JIaHoZ4byUIPlLCKRtFrvJIsijkBUO3hiG7VkBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786102626; c=relaxed/simple;
	bh=VTtq9viQF+otnO5yiU7JAUFQCN2Xtr9xJfUI7Jc1JIc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bFU/AaelOmsooDASSwsI9k+fNUpvhbf2MSTPBaN04zgWegHy6lORBkEo71u7XNlgBJqAI0YmfEMrt94+ynSReLsoisfPKm3t+OhqsN+unk+yaW+WuP/J1hg6iNBY2hhEwnMtnBYDe0Zl8FblIWU00MRaisOj2llZCDwg3mSwDIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=uPOnI7Rk; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=bPeb5TJt; arc=none smtp.client-ip=202.12.124.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="uPOnI7Rk";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="bPeb5TJt"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id AB9D07A0120;
	Fri,  7 Aug 2026 07:37:01 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Fri, 07 Aug 2026 07:37:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1786102621; x=
	1786189021; bh=JUc0tI3FwUfzqFn1GnkruP1SC6LnWC+xRZZtn+0X3kI=; b=u
	POnI7Rkap0jtzxCvqzP2YGcxkmZK+a/4axyilNMdTDvIcESS1Y2fPCsL+Prjfqb5
	NrcEy0Ufy2kVDlhavodIHVvz2Mn5DP0jkowDH04+3Spnxeol4U3HpEu6UrwDD2b3
	FRCi0ILFLGYVCvBSVP8AvKY0KWcrJjifkEfgRhKe8q1MmjmYwjnhx60guPiOHsHH
	0qLBmy3DWvImXH8Z1x4CmlAyHDn8Mds36rP4b2ikudSphU1pky8BR4kTVeDLnvA3
	AW/XR4tElu2w8mrvyPODUbu6XP9BA9j7Pwd2kM6OWOYsBuKG9b+/ZV/+tKZcWS3u
	IA11TA5j1QFC9eBeqsZ7w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1786102621; x=1786189021; bh=J
	Uc0tI3FwUfzqFn1GnkruP1SC6LnWC+xRZZtn+0X3kI=; b=bPeb5TJt0Zq+0BPTM
	R7G/KrPUR1OO54THEGlZAFS49jMnYOV/zYURrI/PVdi/nQEfE5PpS+6x/RUsHxin
	aqC+ex4XEnWGP4yiocvfK8BwU4tTCbJlTp9vqIj/cD9kY0JNj0KGMTtQ8PgfR18s
	srjMzQOAsuPY7yS9ZJjS14hOf2JhTNs73024TUsZjhhiK34By2DrSxqn2tohY3kH
	OYCOJ5iUt9gO0ARZ/OXVy2e1GMft4ASSjG03tf9GbWOCHpu+wf126okY/vBSoLpq
	rQWI6HCCvV0YSXFQHHmIbrAl1wqrEPwpK7vrW0kof55QHF/K1DSOTcmzlqSaF3EV
	vKhFQ==
X-ME-Sender: <xms:XcN1ar-loQHiKkYNMSwrI4WSrf-IKUZ-XCf2YiwLfk1SDgoZHr910A>
    <xme:XcN1arpz-yjoRbLGPjjiw3TcQ1bnZVCBlJgTsjWCdYPNY7SHQ8wEUcSuP2m1tIMzR
    gKeenR52ztA_y968KdWsPLCi4oVYldhgJWRfnt4hnxp-wvnGFe4-t-->
X-ME-Received: <xmr:XcN1ahiiPqFw79EpaRhkM5LYWASmr0XQXmW_o7PKjNWQsGNMFIdQahMBPR0>
X-ME-Proxy-Cause: dmFkZTEfW3x2Qrq7ELqxlr/x69vk0aYaa/E/2AWrFAl7yu0Vg+jIGlS0mjOCk5J5e5/NJH
    T3J+l8M+cQ15gxg/u6FQhwxKudsrf7tN5cWcEThveGDS0KcOU0uMrzGx0YBmylEV4PfT2X
    SbTqClZY3SINVohR/2NzYRxeOu5tU+SgKqY1sS5oM8U15+ky277S+G1Ww7YAUM5Z6EK46p
    TQK1COWwyEQl/dhwe51H5lWCLFzTj8K9hkk/JBO/DvOgEgoe5sMihzFP04eKTIrZCF8dte
    tQwhoNU+zszgTlPncqprVsvTwAgpjyPciGBDZXKQScTz4u1orAuTZg8Fi2VomZsbF2qQsR
    eL1kaiHBpp80M4RzDUsAZRJygVAIesBLxby3W54tcHXPJqAPjdtHEFumnKAwb74kc0+J3n
    KlS5iazk/Ooe6XFvlIqXdqyrpLbfIPetzbxMD3rM8ypA4CDMjbgME1dXJFHpFXaauetX3L
    dh8aaJt0hh5AXjzk1uAO2icErMYCxtpqxWilkvL508lIKOkNHC29LP6kDYhGogrbbnZu/K
    rjMBlZ7WOIsjIAt+8knDO1/FrYhkE2E37Z0jou3o9BEH9zLe9kGb6x90gjYFmd/JtJtTbu
    eT2eET2AvAWQVqUvwVJG9CwXzvl7U10CCbLigNt/K/4Q64lGhESar78BxLJQ
X-ME-Proxy: <xmx:XcN1ahClSJ0UeYIe1AXgr01Pk0pu-NkRJDyMBwv_uOvkGUM6TTiNow>
    <xmx:XcN1anv6whV4nGC_Xm1KnkSrLL8EqcIsIvZQj1oO2tXgzWnUswI-NA>
    <xmx:XcN1aj46vAPQzXD3_gLtdtQLdFRrsNAGWUaDcmtCptMWUSXRYSkuuw>
    <xmx:XcN1apemkXi2nQnIe7VmCJJ_1unvME_v6O8QzwmnPJ6g0S_xm2h_nQ>
    <xmx:XcN1agfw6YOpQjs0Lj9EL4rn3Yy84uU8QN4HuMiYY8iSaqbBl25Z5lNJ>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 7 Aug 2026 07:37:00 -0400 (EDT)
From: Kiryl Shutsemau <kirill@shutemov.name>
To: akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	nico.pache@linux.dev
Cc: baolin.wang@linux.alibaba.com,
	baohua@kernel.org,
	dev.jain@arm.com,
	hughd@google.com,
	lance.yang@linux.dev,
	liam@infradead.org,
	mhocko@suse.com,
	rppt@kernel.org,
	ryan.roberts@arm.com,
	shuah@kernel.org,
	surenb@google.com,
	usama.arif@linux.dev,
	vbabka@kernel.org,
	ziy@nvidia.com,
	usama.anjum@arm.com,
	agordeev@linux.ibm.com,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kas@kernel.org
Subject: [PATCH v2 04/17] selftests/mm: retry the swapout the khugepaged swap cases rely on
Date: Fri,  7 Aug 2026 12:36:34 +0100
Message-ID: <20260807113647.3744609-5-kirill@shutemov.name>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260807113647.3744609-1-kirill@shutemov.name>
References: <20260807113647.3744609-1-kirill@shutemov.name>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>

collapse_max_ptes_swap() and collapse_swapin_single_pte() set their
precondition with MADV_PAGEOUT and then require smaps to report exactly the
range they asked for.  MADV_PAGEOUT is best effort: shrink_folio_list()
leaves a folio alone when it cannot reclaim it right away, and a folio
still under writeback from an earlier pageout is the common case.  The
count comes up short by a page or two, and the case fails on its
precondition without testing anything.

It shows on arm64 with 64K pages, where max_ptes_swap is 1024 pages: 64M of
swap per step, and the second step pages out folios the first step has only
just written back.  About one run in four ends in

  # Swapout 1024 of 8192 pages... Fail
  not ok 95 collapse_max_ptes_swap

A probe around the same two steps hits it on roughly one attempt in twenty,
and asking again 50ms later closes the gap within four tries.

Ask again for up to two seconds before reporting failure.  The wait costs
nothing when the first attempt is enough, which is the usual case.

Assisted-by: Claude-Code:claude-opus-5
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 tools/testing/selftests/mm/khugepaged.c | 32 ++++++++++++++++++-------
 1 file changed, 23 insertions(+), 9 deletions(-)

diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/selftests/mm/khugepaged.c
index 9b1da0dd0f8e..69e0fc4b12fb 100644
--- a/tools/testing/selftests/mm/khugepaged.c
+++ b/tools/testing/selftests/mm/khugepaged.c
@@ -241,6 +241,26 @@ static bool check_swap(void *addr, unsigned long size)
 	return swap;
 }
 
+/*
+ * MADV_PAGEOUT is best effort: shrink_folio_list() leaves a folio alone
+ * when it cannot reclaim it right away, and one still under writeback from
+ * an earlier pageout is the common case.  The swap count the caller asks
+ * for then arrives a moment later, so ask again before giving up.
+ */
+static bool swapout_range(void *p, unsigned long size)
+{
+	int i;
+
+	for (i = 0; i < 40; i++) {
+		if (madvise(p, size, MADV_PAGEOUT))
+			ksft_exit_fail_perror("madvise(MADV_PAGEOUT)");
+		if (check_swap(p, size))
+			return true;
+		usleep(50 * 1000);
+	}
+	return false;
+}
+
 static bool is_swap_available(unsigned long size)
 {
 	unsigned long swap_total = 0;
@@ -881,9 +901,7 @@ static void collapse_swapin_single_pte(struct collapse_context *c, struct mem_op
 	p = ops->setup_area(1);
 	ops->fault(p, 0, hpage_pmd_size);
 
-	if (madvise(p, page_size, MADV_PAGEOUT))
-		ksft_exit_fail_perror("madvise(MADV_PAGEOUT)");
-	if (check_swap(p, page_size)) {
+	if (swapout_range(p, page_size)) {
 		success("OK");
 	} else {
 		fail("Fail");
@@ -920,9 +938,7 @@ static void collapse_max_ptes_swap(struct collapse_context *c, struct mem_ops *o
 	p = ops->setup_area(1);
 	ops->fault(p, 0, hpage_pmd_size);
 
-	if (madvise(p, (max_ptes_swap + 1) * page_size, MADV_PAGEOUT))
-		ksft_exit_fail_perror("madvise(MADV_PAGEOUT)");
-	if (check_swap(p, (max_ptes_swap + 1) * page_size)) {
+	if (swapout_range(p, (max_ptes_swap + 1) * page_size)) {
 		success("OK");
 	} else {
 		fail("Fail");
@@ -937,9 +953,7 @@ static void collapse_max_ptes_swap(struct collapse_context *c, struct mem_ops *o
 		ops->fault(p, 0, hpage_pmd_size);
 		ksft_print_msg("Swapout %d of %d pages...", max_ptes_swap,
 		       hpage_pmd_nr);
-		if (madvise(p, max_ptes_swap * page_size, MADV_PAGEOUT))
-			ksft_exit_fail_perror("madvise(MADV_PAGEOUT)");
-		if (check_swap(p, max_ptes_swap * page_size)) {
+		if (swapout_range(p, max_ptes_swap * page_size)) {
 			success("OK");
 		} else {
 			fail("Fail");
-- 
2.54.0

