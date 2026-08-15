Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9CA334D384;
	Sat, 15 Aug 2026 01:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786759180; cv=none; b=NNIXKo0zxoSYB61LuwCY+asP+Sk8IS8nFFadIitLbYjbz62IH9A6DYzTEdDwsQYMfrjWAFUVklDWFVWAndA9lXfUKmxZhUDbdI5lfB12Dl1fUZhK8stZmFew0WuRSIqkKbNmiE8VEvVSSTpu00RtQTTf8bUvMM+iH/X6GOAjYt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786759180; c=relaxed/simple;
	bh=6l8VBCYedhCpNLCqH4lpa4kGPS9nRSFObj0Hr7I8990=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MzH6c3lYloaW3W2ADU1mj/UNx66+s9o+be4Lsj3FlcYyCqOL2mzm8T1klst44RUTpIjRDT2wnPLMg4cWDBH5kpox4pxlCb2Tnh/yHVKzHmn4+54HAxoIzYyBh2wvkCzCVx3txtI8q2Cl0DklU7PnGMEbNe5Nh8nnuq3D7g1lG1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=rsXM3TNO; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=d2mRcc5i; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="rsXM3TNO";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="d2mRcc5i"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.phl.internal (Postfix) with ESMTP id ED405EC022A;
	Fri, 14 Aug 2026 21:59:37 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Fri, 14 Aug 2026 21:59:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1786759177; x=
	1786845577; bh=4qPwRkvpOUtfuWl8Vd1ZbS3CmUow1OnKorGDRJPSt44=; b=r
	sXM3TNOpkQ0bDeikayo57HaHNhnZFPxRt75G1/GaU9VjnOJd6Dx28jcDjB9MgJ1m
	Bi4i7urR9KcvIF0FoY0VY2VPT2HWUOC6f6rwhjNVwyxjhz3BJtAZFFvoXYlJKN0e
	56tyL1CldILvlz/uoJ8g3fUSdJxYyTKIhjCT7CzbQcnDsNXAMlD4Qb7lvF/ddzUi
	yMKRx2KapfEyjrHR6GoJWGvOZ+NobGhglYb2b7COYNG0RBYoj+s7Z/wpZMrHNIpi
	shDxeiq0kXbNtJ5ckkIWcAnmnG762dE95fF2+WaX29szf2PDmhCLY6ckoZDkRkYG
	GOEfygKz5PdL1CBcS8/eA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1786759177; x=1786845577; bh=4
	qPwRkvpOUtfuWl8Vd1ZbS3CmUow1OnKorGDRJPSt44=; b=d2mRcc5iYTpWw90KA
	+ukgAtBxmM/BXvSMYtVfjRq7FFNjPCyJMaDVXB/cpO+cUsqB81g4J1KPx0bgwKHU
	jEZ5rg1aSEV5Bac+0wBeA7EQCDrML2ukAl/3wQr+m8Fg2ykzivLoPQS2WJj01gNs
	aVD3VPG3hoHvMafkysQr7nV8QO3acQUgoxrkTmBO85icJ3VKIOGATz21kxBhGgK/
	vQ6x5urYBBGMg8w/Dxd3egYlfcheggsYeliXz6pkjX704bLAu5NYu3P0M3tlmqJC
	g7rEvEM5vlmq8NbUpOvwAQGGWnGLlugyeWGvEACUNGYnC2c2cBsfxqJxaMaZ2r/4
	MDbjA==
X-ME-Sender: <xms:Cch_anTw-CV5WEmxftfZRwCAM4L_cnjw9W6v8UNFeToM06BFH-0fvw>
    <xme:Cch_asvgIOTM9JjpRj0hLXE770tKR_D52JhJw8lNOTRJKxVnVx2N5vlIWACTUdfo4
    i6iR-CU_V4s55WcXEmPtfPLFo2NoG8s--lkpqRuLZ2CRDCi_XMeog>
X-ME-Received: <xmr:Cch_alVY1zkeZDOyQVYjRKj6lGhe4vvx6wL1jZL50eN5xv0VGLfQJwbLok0>
X-ME-Proxy-Cause: dmFkZTFzGpGFm5W4vTTPFWblEwVteikp8ZQmNhgJQ39PW7T7XQcfx50sk9SsorwQ5kiHE1
    GkGyp58aXi1XV7w9FWqCEkAAXyywQWDaCYDP4jk79Tj+fneRM/f70WhpHyk68ivSHa8CNO
    EHCv/WuNeVKTxC+1Am5pTEbXGz94MYKYsyM7kpGX5dHsQKSWoIOFoaOZhong5pPq1D5dt9
    kZJFmHpp6Lnk5BJwnqgflVky13nVISEGlBe9NK3zcAVq5kZlGc2PqnLHdjdexqJ0GH5I+D
    CyEe7NNeMVRnhwRmAQGYSBBJ6RBvmXxfczeNb/t4Esr0tR7Igh8W/aIlPiSt8FyWTQd+Pj
    ToEO9Wkaygl0tzRAxiOsUatANGv0MavqvzeRLvpV66n2CVAAFVetansC73Poslu2NI22gA
    LuHvDL56Nnf4nUNnsl4rmbfcyV9TlDqb+JYRr3GQDIpUzFXIeaG+3jlY1/8ryaOqdzRLTK
    VtHSqOmREIUGrw8+Iys5g1m2eidfl+Bv3ONAEXMe4a64tisQZfxfMPAUAo/gKuVWCkyEEG
    SUz0UTj52k6v+IGP3gFtAK34688BHEl6p0pyK0rKrQrIGqVfA1wGz39ATLzIvU+mkOx07L
    1otNCfkXJ4SeWOft+a/+wzrLVnGem4uE1OwH4u0ngNjV7ERIrg7+vp0XONPQ
X-ME-Proxy: <xmx:Cch_agkLRbBIYG60hz5IfPn4h9Cm1Wobze2s-t5-4uaDtD-C4A2nEw>
    <xmx:Cch_aoAbZN4zMSYj3_OYPILMG6Yei6IjGJF7nftTN3FPVdRNu3MhhQ>
    <xmx:Cch_al_HnfqA9QqjZoLdGvDxyONwtI8Md0NS87loOh1pqGzJ9hgMBQ>
    <xmx:Cch_aqRj0vNwu64A-NCW5napaXHnvGkjEh7EF3Umi3okoZVOCUZ_zg>
    <xmx:Cch_agw4jd-SExfx1QJwjyB9voTG2HQGW4G3GNtXE4uwJ5VSHyarN1Z8>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 14 Aug 2026 21:59:37 -0400 (EDT)
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
Subject: [PATCH v4 17/19] selftests/mm: race collapse of windows with holes
Date: Sat, 15 Aug 2026 02:58:59 +0100
Message-ID: <20260815015901.1236937-18-kirill@shutemov.name>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260815015901.1236937-1-kirill@shutemov.name>
References: <20260815015901.1236937-1-kirill@shutemov.name>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>

The harness pins max_ptes_none to 0, so khugepaged only collapses a window
once every PTE in it is present.  A window with holes takes a different
route, and never gets raced.  A hole is zero-filled into the new folio by
clear_user_highpage() rather than copied from anywhere.  Which slots count
as holes keeps moving under the racing MADV_DONTNEED, right up to the
moment the PMD is detached.

Run both ends of the occupancy scale for every driver mode, one after the
other.  mTHP collapse supports only those two, 0 and HPAGE_PMD_NR - 1, and
coerces anything between them to 0.  Each result says which end it ran:

  ok 1 stepped/strict: 5s, 231 steps, no corruption
  ok 2 stepped/holes: 5s, 194 steps, no corruption

Assisted-by: Claude-Code:claude-opus-5
Tested-by: Muhammad Usama Anjum <usama.anjum@arm.com>
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 tools/testing/selftests/mm/khugepaged_race.c | 45 ++++++++++++--------
 1 file changed, 28 insertions(+), 17 deletions(-)

diff --git a/tools/testing/selftests/mm/khugepaged_race.c b/tools/testing/selftests/mm/khugepaged_race.c
index 3128031e28bc..3b369046edf5 100644
--- a/tools/testing/selftests/mm/khugepaged_race.c
+++ b/tools/testing/selftests/mm/khugepaged_race.c
@@ -11,9 +11,11 @@
  *   free	khugepaged left to run (scan_sleep_millisecs=0), for soak;
  *   madvise	MADV_COLLAPSE and MADV_DONTNEED in a loop.
  *
- * All anon THP orders are enabled (inherit) and max_ptes_none is 0, so a
- * window has to be fully populated before khugepaged will collapse it, and
- * the racing MADV_DONTNEED decides which orders it can still use.
+ * All anon THP orders are enabled (inherit).  Occupancy runs at both ends
+ * of what mTHP collapse supports: max_ptes_none 0, where a window must be
+ * fully populated, and HPAGE_PMD_NR - 1, where a window full of holes
+ * collapses too.  A hole is zero-filled into the new folio rather than
+ * copied, and the racing MADV_DONTNEED keeps moving which slots are holes.
  *
  * Correctness signals: every racing page must read as its pattern or
  * zero (MADV_DONTNEED), never anything else.  The faulters and the fork
@@ -247,6 +249,8 @@ int main(int argc, char **argv)
 	const int nr_threads = ARRAY_SIZE(thread_names);
 	pthread_t threads[ARRAY_SIZE(thread_names)];
 	static const char * const all_modes[] = { "stepped", "free", "madvise" };
+	static const bool occupancies[] = { false, true };	/* strict, holes */
+	const int nr_occupancies = ARRAY_SIZE(occupancies);
 	const char *one_mode[1];
 	const char * const *modes = all_modes;
 	int nr_modes = ARRAY_SIZE(all_modes);
@@ -279,6 +283,7 @@ int main(int argc, char **argv)
 			usage();
 		}
 	}
+
 	if (mode_arg) {
 		if (strcmp(mode_arg, "stepped") && strcmp(mode_arg, "free") &&
 		    strcmp(mode_arg, "madvise"))
@@ -318,7 +323,7 @@ int main(int argc, char **argv)
 		 -1, 0) != (void *)mremap_scratch)
 		ksft_exit_fail_perror("mmap() mremap scratch");
 
-	ksft_set_plan(nr_modes);
+	ksft_set_plan(nr_modes * nr_occupancies);
 
 	thp_save_settings();
 	thp_read_settings(&settings);
@@ -330,8 +335,9 @@ int main(int argc, char **argv)
 	 */
 	thp_push_settings(&settings);
 
-	for (int m = 0; m < nr_modes; m++) {
-		const char *mode = modes[m];
+	for (int mn = 0; mn < nr_modes * nr_occupancies; mn++) {
+		const char *mode = modes[mn / nr_occupancies];
+		bool holes = occupancies[mn % nr_occupancies];
 
 		thp_read_settings(&settings);
 		settings.thp_enabled = THP_MADVISE;
@@ -341,14 +347,16 @@ int main(int argc, char **argv)
 		settings.khugepaged.scan_sleep_millisecs =
 			strcmp(mode, "free") ? 1000 : 0;
 		settings.khugepaged.alloc_sleep_millisecs = 10;
+
 		/*
-		 * Strict occupancy: mTHP collapse only supports 0 or
-		 * HPAGE_PMD_NR - 1 and coerces anything else to 0 anyway, and 0
-		 * also keeps khugepaged from burning the whole step in doomed
-		 * PMD-sized allocations on 512M-PMD configs: under racing
-		 * MADV_DONTNEED a fully populated PMD area is rare.
+		 * mTHP collapse only supports the two ends of the occupancy
+		 * scale: 0 or HPAGE_PMD_NR - 1 (anything else coerces to 0).
+		 * Strict needs a fully populated window, which is rare under
+		 * racing MADV_DONTNEED; hole-heavy windows collapse instead,
+		 * so the two ends race different paths.
 		 */
-		settings.khugepaged.max_ptes_none = 0;
+		settings.khugepaged.max_ptes_none = holes ?
+			(hpage_pmd_size / page_size) - 1 : 0;
 		settings.khugepaged.pages_to_scan =
 			nr_areas * (hpage_pmd_size / page_size) * 8;
 		for (i = 0; i < NR_ORDERS; i++) {
@@ -415,8 +423,9 @@ int main(int argc, char **argv)
 			check_page(i);
 
 		ksft_test_result(!corrupted,
-				 "%s: %ds, %d steps, no corruption\n",
-				 mode, duration_s, steps);
+				 "%s/%s: %ds, %d steps, no corruption\n",
+				 mode, holes ? "holes" : "strict",
+				 duration_s, steps);
 
 		/*
 		 * Hand the address space and the settings back before the
@@ -430,9 +439,11 @@ int main(int argc, char **argv)
 
 		if (corrupted) {
 			/* Memory is suspect; the rest would prove nothing. */
-			while (++m < nr_modes)
-				ksft_test_result_skip("%s: skipped after corruption\n",
-						      modes[m]);
+			while (++mn < nr_modes * nr_occupancies)
+				ksft_test_result_skip("%s/%s: skipped after corruption\n",
+						      modes[mn / nr_occupancies],
+						      occupancies[mn % nr_occupancies] ?
+						      "holes" : "strict");
 			break;
 		}
 	}
-- 
2.54.0

