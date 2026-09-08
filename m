Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FFB85427E7;
	Tue,  8 Sep 2026 12:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788871884; cv=none; b=WO9zXaoEPN/rPaWeUC3JBo6OsfJBkpQFN18JyXf2FSUoIDJuNshao+aZGidfXdu/SHM6iSMVUSy72/WSr853rjRigPVDmI0DuU/r6u0FflqHenskW1WV7fA6iKX8PnxdeCOHberu5+HVjMFtPxNu6/oUlSSA1qcQwBSXgO/kBto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788871884; c=relaxed/simple;
	bh=Ag3+sY9gqlDqpft3HY3iH8ORgalnQhAcipJiNJEWcPI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b1VQG73Uqy5SmrI+PuzzQsVjXlS6fsVBeORmi1fkJPvmRhG7rwVKWC2pZ9rYCbafHQntq4Q0Cd3ZVImnGIEIMKWck2AYEJw2Xl3lJ1B9pFR54RMXSXekbkmh/Te1aT+HAVGkVfcZuD0iQv6Z5IzGbn3M2F38+TsND/DiLls0rw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=aiqeN73Q; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=nMNQkBF1; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="aiqeN73Q";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="nMNQkBF1"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 741F91400094;
	Tue,  8 Sep 2026 08:51:21 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Tue, 08 Sep 2026 08:51:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1788871881; x=
	1788958281; bh=h96xKtx2qZMCWy32X4fzhVdoH1fDHGv4dS65yGYxxtY=; b=a
	iqeN73Q3dKFSnie6qlz9jWFOHG9/GFU3uqZz2jSA0DCs5kOK4d9KahljyVFG5tWa
	+9VtOPCTg7OBEE6eQlTtXY3+rIHGWdUbQXRnMJxnjVx+vHHfvMiWBpqHsb9ipiDR
	i+oFXrFOHEo1XDC8cgtFMdvxYg553WRP758fVzhZh7Q02TaHgm3iXug+IobbmNxz
	DpgsfoIawkN5x0IRb0sk/K5gCfzqMuRRmpkSF+AhqEHd4dOdT9Ep6K+zRI4gKtNr
	qn9K1tx4b2Jw4S8RQx9bPZwVelhsa2eLwDzMy7kRy2RYmw46H6piGQyfpd5T2pD5
	pJtiEL+7BIL+BhyZc+jdA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1788871881; x=1788958281; bh=h
	96xKtx2qZMCWy32X4fzhVdoH1fDHGv4dS65yGYxxtY=; b=nMNQkBF1KFhBqwPO5
	518Oshc+gkbjplnBAH/GmQddVYugrFDzFQNycNX3yvmHQADqlhm1N8K+vPiADFNe
	yqyk6y0TXVpA6VcTBnf8QLd3oq2cLM6x5ibOKUqAXQTK1CBHEV3TSKf+KG2GZ8qr
	/jnCEQ/cOBqKiBf3M8gZt4e1lAU1FdtXDkKCnsy/kQRAfnnGCz4lu4pbibc3Obta
	Ey4RDECzP4jhDc/1AhjhGh9hEj83dGG8xeRB+LgQonvpmbBJ687bvcTWq/hmzEbp
	NRFvgqOuF33nuFIx0ihHdLdhX7dLfmI9EzgsAlY2GMAXnX/BrXSVEzXd5RJG7Mu6
	Ubv1A==
X-ME-Sender: <xms:yQSgarfc-ozD7KTx8fSgNrE8Ye_xF1AUoSp780fJlvQy219Iq0d9AQ>
    <xme:yQSgapn8FP44oVGdJuvOeV2BUT6VO6SD91g3wUmrSqCNnI6lUcTYkhoJY6u_mbKl9
    c8weqomT7d3mitIE26_804uCxoyZlfXoy4P0AnXi-ft-Gd-5ABrabnx>
X-ME-Received: <xmr:yQSgamtbsb_PKkOsc-VARtP32Ru5cYhjwocxEvgd7jLBpDVh5HRam1dqKDg>
X-ME-Proxy-Cause: dmFkZTGuvEMc9jYu2f0uyTmUF7l0J7NybVdULRlrJFmokmmiolg4yH1+7h97U05D2w+OYm
    AZhWoHmMPT2EsIB4AC7PxRFoqN+CF4x8etMK41ayTMd5Tw55ZxqvSYpb69cNUy0p/dfOGv
    05P0JRk7g5kt5eTL1k2cO9e1oUb7lrROdNyUSbigYjG7Zs/tNKx+L8+9HHw+CSw5cJpWIQ
    j2DrX13NeCZvnLN36sWkEk/U0EX1Q1izKAtzdjMuXhus4PGMhEw3kJKafKZkgCRsnWRxXR
    Wv8osDa5aTh9mnjCTFnYcP83hQ8y7tmPYrDENim+Q79mFJR5sJUGN5QsCu80CUB5y6e4LS
    xzIxbC5h6FEB304ULXKH+UdNg/3/VZNGLdFKJEhyuZ37YXfrIEJqhw4AEPtVdO1Fsq1uD1
    ybowd4oDyqQgqXRwPMW9eRnmSHMA5yacNRdVo9Cg+0k5RhhScDbTnEfdtCCCT4sPsV5Kdt
    IEhRb1h68Nq4GbavNPr1vAL7gBeS/fUaJk5zyiN4layUtJDyU1apTBVeK2gcc2cG7LDEqm
    0iuRDQfs/yUtPTbZbEXO5bjMbJRF0NRK8EU1Ps86KKLZXej3EcZncXDp5EMY7pW1vuKomO
    oE2dMwQmIg7E4HnI81C21OYaUO9ajEDCuvdfB4BmTco//t9BZQCTmPbVLGzA
X-ME-Proxy: <xmx:yQSgakxAqPiSG9qJhf0_dHlkxq7Y4lP-VhbphB37QSWZoXIGQRLLvg>
    <xmx:yQSgapwRSYF77CLdU9VVeTu10a0cv7edsVI_ocsfBabg193Kw68kKw>
    <xmx:yQSgaq4GznkQT-QzdgS3dKsrXXZOJDI7YTMlt66lY14lU1WzkKtOUQ>
    <xmx:yQSgaiDWEqdTrkiRfTiu127zgN0QBHz8oS4P-4DJuMFAzP__KHjC2g>
    <xmx:yQSganOZ2b8BwNwKeofkESaOZZl97kO-3EJhqddm9Wjdak0gtWfCoQNU>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 8 Sep 2026 08:51:20 -0400 (EDT)
From: Kiryl Shutsemau <kirill@shutemov.name>
To: akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	rppt@kernel.org
Cc: linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	usama.anjum@arm.com,
	usama.arif@linux.dev,
	baolin.wang@linux.alibaba.com,
	nico.pache@linux.dev,
	ziy@nvidia.com,
	baohua@kernel.org,
	dev.jain@arm.com,
	hughd@google.com,
	lance.yang@linux.dev,
	liam@infradead.org,
	mhocko@suse.com,
	ryan.roberts@arm.com,
	shuah@kernel.org,
	surenb@google.com,
	vbabka@kernel.org,
	agordeev@linux.ibm.com,
	jgg@ziepe.ca,
	leon@kernel.org,
	kernel-team@meta.com,
	"Kiryl Shutsemau (Meta)" <kas@kernel.org>
Subject: [PATCH v5 05/19] selftests/mm: make the swap cases' swapout reliable
Date: Tue,  8 Sep 2026 13:50:51 +0100
Message-ID: <20260908125105.1510704-6-kirill@shutemov.name>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260908125105.1510704-1-kirill@shutemov.name>
References: <20260908125105.1510704-1-kirill@shutemov.name>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>

collapse_swapin_single_pte() and collapse_max_ptes_swap() swap a range out
and then require smaps to report exactly the count they asked for.  Two
things keep that count from arriving.

MADV_PAGEOUT is best effort, so the count often turns up a moment late.

And wait_for_scan() leaves the range eligible for collapsing, so
khugepaged is still working on it.  Collapsing reads the swapped-out pages
back in, so the daemon empties the swap as fast as the case fills it.  On
arm64 with 64K pages max_ptes_swap is 1024 pages, which is 64M a step, and
the case loses the race:

    # Swapout 1024 of 8192 pages... Fail
    not ok 10 collapse_max_ptes_swap

Retry for up to two seconds, holding the range out of khugepaged's reach
meanwhile.  The collapse each case runs next restores MADV_HUGEPAGE, so
only the setup is affected.

If the pages still won't swap out, skip: no swap, swap too small or full,
a memcg cap or busy writeback. None of that is a kernel bug.

Assisted-by: LLM
Reviewed-by: Muhammad Usama Anjum <usama.anjum@arm.com>
Tested-by: Muhammad Usama Anjum <usama.anjum@arm.com>
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 tools/testing/selftests/mm/khugepaged.c | 41 +++++++++++++++++--------
 1 file changed, 29 insertions(+), 12 deletions(-)

diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/selftests/mm/khugepaged.c
index 73bf07c39145..398430c33872 100644
--- a/tools/testing/selftests/mm/khugepaged.c
+++ b/tools/testing/selftests/mm/khugepaged.c
@@ -220,6 +220,29 @@ static bool check_swap(void *addr, unsigned long size)
 	return swap;
 }
 
+static bool swapout_range(void *p, unsigned long size)
+{
+	int i;
+
+	/* keep khugepaged from collapsing the range and swapping it back in */
+	if (madvise(p, size, MADV_NOHUGEPAGE))
+		ksft_exit_fail_perror("madvise(MADV_NOHUGEPAGE)");
+
+	/*
+	 * Retry several times because MADV_PAGEOUT is best effort.  Sleep
+	 * between the retries to give outstanding writeback a chance to
+	 * finish.
+	 */
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
 static void *alloc_mapping(int nr)
 {
 	void *p;
@@ -823,12 +846,10 @@ static void collapse_swapin_single_pte(struct collapse_context *c, struct mem_op
 	ops->fault(p, 0, hpage_pmd_size);
 
 	ksft_print_msg("Swapout one page...");
-	if (madvise(p, page_size, MADV_PAGEOUT))
-		ksft_exit_fail_perror("madvise(MADV_PAGEOUT)");
-	if (check_swap(p, page_size)) {
+	if (swapout_range(p, page_size)) {
 		success("OK");
 	} else {
-		fail("Fail");
+		skip("Could not swap out");
 		goto out;
 	}
 
@@ -849,12 +870,10 @@ static void collapse_max_ptes_swap(struct collapse_context *c, struct mem_ops *o
 	ops->fault(p, 0, hpage_pmd_size);
 
 	ksft_print_msg("Swapout %d of %d pages...", max_ptes_swap + 1, hpage_pmd_nr);
-	if (madvise(p, (max_ptes_swap + 1) * page_size, MADV_PAGEOUT))
-		ksft_exit_fail_perror("madvise(MADV_PAGEOUT)");
-	if (check_swap(p, (max_ptes_swap + 1) * page_size)) {
+	if (swapout_range(p, (max_ptes_swap + 1) * page_size)) {
 		success("OK");
 	} else {
-		fail("Fail");
+		skip("Could not swap out");
 		goto out;
 	}
 
@@ -866,12 +885,10 @@ static void collapse_max_ptes_swap(struct collapse_context *c, struct mem_ops *o
 		ops->fault(p, 0, hpage_pmd_size);
 		ksft_print_msg("Swapout %d of %d pages...", max_ptes_swap,
 		       hpage_pmd_nr);
-		if (madvise(p, max_ptes_swap * page_size, MADV_PAGEOUT))
-			ksft_exit_fail_perror("madvise(MADV_PAGEOUT)");
-		if (check_swap(p, max_ptes_swap * page_size)) {
+		if (swapout_range(p, max_ptes_swap * page_size)) {
 			success("OK");
 		} else {
-			fail("Fail");
+			skip("Could not swap out");
 			goto out;
 		}
 
-- 
2.54.0

