Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0557847426D;
	Fri,  7 Aug 2026 11:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786102656; cv=none; b=DSQs2rwQgWGOrt0MMVF/KY9ZzF2xg11J1+bO389kIX5/UmWJSxzrspdZ7xvmCjDgIIfoVx5ytdCDInV23jCecDPnDFi7oORr/UwfMG34CP+myhRaxsq+JkKVF4SnzrFLQHq+NvT8HmH6rHRtg/lftx6xgmUjtGQFwGxkuWR5Dm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786102656; c=relaxed/simple;
	bh=DtaUsi/AmaF/PfbZkl7UuFW6bWfuvRjmbzsb/2kyjmM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QpSt7jTsjyGhq9PVGeBNrX6D0r4lUXcxIX71w+g/ry+NrZdx1eS5UkFPLugnwnGLFvXRWkFvQAQrO+7U6K0ftLmLtxH5ZvIQatOeyJf/J5nsNisxegdsYCjU/jtBUw+BGTfd2RhrcYnL+9YwzMVWQM4m8kauadH1t53F+CoF7jE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=Q9hN0SdJ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=g8Yh/WF6; arc=none smtp.client-ip=202.12.124.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="Q9hN0SdJ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="g8Yh/WF6"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.stl.internal (Postfix) with ESMTP id 78CC51D0008B;
	Fri,  7 Aug 2026 07:37:28 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Fri, 07 Aug 2026 07:37:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1786102648; x=
	1786189048; bh=pirjW+/uVLVtcgVpdoTceZVcLT7vNoA014N2uc8FC80=; b=Q
	9hN0SdJ9Y9uH3hM+MxqgXo0HDBkt/N9uqhuZ6VZBY6lFDAeKwIzjVJ3ZhxC4ugbs
	m27ai2iux7fEFmVLViKGIras0QSTknlk0lid6Nziv1PTjnS9+xZDLyPBeuZICTKB
	/kO5DnhliidD2z1hVOTa0+QSfm21dQRkaQS4cm/fZwqIQrJJHZKGdq6vfyakSzaH
	wVQDLarjIpz9JdDM/WihTv5gUgbEGTjh2RN6OWl9uXCHKyk/zca9tO5xlXqopF3R
	UDyZmc8J5GBjdj/bTH0raHkmND+neoUS1R8gyTjuHJfWWuTLJ7+iCYjwTurVOAyj
	5ZpDPM/R0FAknXCnjvwaA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1786102648; x=1786189048; bh=p
	irjW+/uVLVtcgVpdoTceZVcLT7vNoA014N2uc8FC80=; b=g8Yh/WF6MX99h9Wlw
	o85ZrnLBr8qmIxdASmUlXqOHCW2hkCk/qc/i/QzOfmQTk7nzMfl6SwM0+4jown6w
	slHt1s56OegoN5Ph4WVono6Vntqi4i+jpM2xPhJpQ5g2moOkCtda1Xa8bko2FOS9
	h+Y5MrG0Uk0RsDDjL46a/MSVbvzLgHhvUGFOB97bTSTGDlPcsxoA1b2cmalMbhY+
	SK+ooA4+SGKis82L/3POJahPeJ5d7Gjg2vMV2fUmF5QZVxAnYwssQjT1hquzxGq4
	hmIA1JVjRuEVIJIdrwdFVG2OLr+w6Lc353FNiL8A5+Zxet7RHpBO/kuwrzOsjKVL
	sG4pA==
X-ME-Sender: <xms:eMN1aqrhNgrMntKxg8baWybzxWFmnVxBYSdfDC6MXhnFVGVYhzyfAA>
    <xme:eMN1askY_-rFSIUlIQm69rxFnSZeBS1eMD2RwcsVRLyvTzQWX9eVL7Djr8MxvCo9Z
    JpE55QIJXPvDI9HGP9OiGIZAIekV9lKuolCbu8ZSFSkG4E8Dzj3Y3mq>
X-ME-Received: <xmr:eMN1antj664BNqUz5UwWUQ9IHYs3e5C41tFNlaDPjx6dpV8MXTuU9HqaKT4>
X-ME-Proxy-Cause: dmFkZTEcBCtHwgFqhRPkncf0k+1ylINMWkiJotqLKgP2XUmyCnaVLH6jJFUJYUtwVpCetV
    bzy51nCrHgVQnKUbL6xUc35a2wACIZl+NbR3y/w0ModeWlKP4SKCXfcn2Mi8esZBMBdaWx
    faB4jzBJOawj2LBnFTgyCBiywrPp7FpNgfXB5cgYmB0wgvQ/HhhWAfKjMf/weJgLhMF/VV
    yXrMoja9EZiHjuXu8bb94hiDoU2fqI8TuwJJmzzN4TUL6MxSST+GnkpA2ZnKWVewXCphJB
    Lec89iAB+bDvFyV3zsxjbJ8cA1IEQ3aF+gxi5HDHtN75oTRJtbf/Sd54tDaiXy5fa0cQX5
    hoGETtTIfFLGj1cGbXs4/N0rNKNVrZgeu1OU1QhAOZ7bPZc3Aw4JqqhOgEIexTauJZxkHU
    TbWF4BgZy0M4TbmGMdjoesA5287sX/xP4xHusiyuAp+GBpqhHmkmTvjKuXPRjKfVOqi0I1
    RL9MiNNUq75n+PI2g1y2ZZc7rmd3xeZEl1E6coDyGfmfuDk/5ftusYa+ukpqGLMxSVfYAS
    ijiJYmhr3aMVUvE1AQl64BB8i5VpuNLTyO9VuJ1p/8t2Lnq1L+CNDOKErEKx3n3kTvpvfI
    3DwLmLDIO16LxOm4k3YjuSFLS0SjcFaAcQbmVLF7pxpDdfjB3r545/i6foFw
X-ME-Proxy: <xmx:eMN1ajfu2cYELSHHTqnw6RPvfzenRaaDZXEOED7X68YiHgeuDfHG9A>
    <xmx:eMN1ahYqTJJoY0IRrz2MMBQhwFPo9aYHjClRQlnBu-Luj3y-ePpTpA>
    <xmx:eMN1aj3Bzpcv031zHIpkLAii6HDyvxlXXSxxwl7qwInmS9ouowLj5A>
    <xmx:eMN1aio70r4Qf1SXvhfKX7_7irnLgKo896ih0SkB-KOwR57wQGdimg>
    <xmx:eMN1aqLYxdpofsqQOUtz5Y2DurtILfygebTam6eLttDT1-Z0q2z6emoH>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 7 Aug 2026 07:37:27 -0400 (EDT)
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
Subject: [PATCH v2 15/17] selftests/mm: race collapse of windows with holes
Date: Fri,  7 Aug 2026 12:36:45 +0100
Message-ID: <20260807113647.3744609-16-kirill@shutemov.name>
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

The harness pins max_ptes_none to 0, so khugepaged only collapses a window
once every PTE in it is present.  Collapsing a window that has holes never
happens, and that is a different path: a hole is not copied from anywhere
but zero-filled into the new folio, and the slot is re-checked under the
page table lock at install time in case a racing fault filled it first.

Run both ends of the occupancy scale, one after the other, for every
driver mode -- mTHP collapse supports only those two, 0 and
HPAGE_PMD_NR - 1, and coerces anything between them to 0.  Each result
says which end it ran:

  ok 1 stepped/strict: 5s, 231 steps, no corruption
  ok 2 stepped/holes: 5s, 194 steps, no corruption

-z narrows a run to the hole-heavy end, the way -m narrows it to one mode.

Assisted-by: Claude-Code:claude-opus-5
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 tools/testing/selftests/mm/khugepaged_race.c | 57 +++++++++++++-------
 1 file changed, 39 insertions(+), 18 deletions(-)

diff --git a/tools/testing/selftests/mm/khugepaged_race.c b/tools/testing/selftests/mm/khugepaged_race.c
index 3dc651dc56b3..a2a91906285b 100644
--- a/tools/testing/selftests/mm/khugepaged_race.c
+++ b/tools/testing/selftests/mm/khugepaged_race.c
@@ -11,9 +11,12 @@
  *   free	khugepaged left to run (scan_sleep_millisecs=0), for soak;
  *   madvise	MADV_COLLAPSE in a loop.
  *
- * All anon THP orders are enabled (inherit) and max_ptes_none is 0, so a
- * window has to be fully populated before khugepaged will collapse it, and
- * the racing MADV_DONTNEED decides which orders it can still use.
+ * All anon THP orders are enabled (inherit).  Occupancy runs at both ends
+ * of what mTHP collapse supports: max_ptes_none 0, where a window must be
+ * fully populated, and HPAGE_PMD_NR - 1, where a window full of holes
+ * collapses too.  The holes are not copied from anywhere -- they are
+ * zero-filled, and re-checked under the page table lock at install time in
+ * case a racing fault got there first.
  *
  * Correctness signals: every racing page must read as its pattern or
  * zero (MADV_DONTNEED), never anything else.  The faulters and the fork
@@ -196,9 +199,11 @@ static unsigned long now_ms(void)
 static void usage(void)
 {
 	fprintf(stderr,
-		"Usage: khugepaged_race [-d seconds] [-m stepped|free|madvise] [-a areas]\n"
+		"Usage: khugepaged_race [-d seconds] [-m stepped|free|madvise] [-z] [-a areas]\n"
 		"\tWithout -m, every mode runs in turn.\n"
 		"\t-d: seconds per mode (default 5)\n"
+		"\tBoth occupancy limits run unless -z asks for holes only.\n"
+		"\t-z: only max_ptes_none = HPAGE_PMD_NR - 1 (hole-heavy)\n"
 		"\t-a: number of shared PMD-sized playground areas (default 3)\n");
 	exit(1);
 }
@@ -216,6 +221,9 @@ int main(int argc, char **argv)
 	const int nr_threads = ARRAY_SIZE(thread_names);
 	pthread_t threads[ARRAY_SIZE(thread_names)];
 	static const char * const all_modes[] = { "stepped", "free", "madvise" };
+	static const int all_nones[] = { 0, 1 };	/* strict, holes */
+	const int *nones = all_nones;
+	int nr_nones = ARRAY_SIZE(all_nones);
 	const char *one_mode[1];
 	const char * const *modes = all_modes;
 	int nr_modes = ARRAY_SIZE(all_modes);
@@ -225,11 +233,12 @@ int main(int argc, char **argv)
 	int duration_s = 5;
 	unsigned long thread_mask = ~0UL;
 	int nr_areas_arg = 0;
+	bool holes_only = false;
 	unsigned long i;
 	int steps = 0;
 	int opt;
 
-	while ((opt = getopt(argc, argv, "a:d:m:t:h")) != -1) {
+	while ((opt = getopt(argc, argv, "a:d:m:t:zh")) != -1) {
 		switch (opt) {
 		case 'a':
 			nr_areas_arg = atoi(optarg);
@@ -244,10 +253,18 @@ int main(int argc, char **argv)
 			/* debug: bitmask of racing threads to start */
 			thread_mask = strtoul(optarg, NULL, 0);
 			break;
+		case 'z':
+			holes_only = true;
+			break;
 		default:
 			usage();
 		}
 	}
+	if (holes_only) {
+		nones = all_nones + 1;
+		nr_nones = 1;
+	}
+
 	if (mode_arg) {
 		if (strcmp(mode_arg, "stepped") && strcmp(mode_arg, "free") &&
 		    strcmp(mode_arg, "madvise"))
@@ -287,7 +304,7 @@ int main(int argc, char **argv)
 		 -1, 0) != (void *)mremap_scratch)
 		ksft_exit_fail_perror("mmap() mremap scratch");
 
-	ksft_set_plan(nr_modes);
+	ksft_set_plan(nr_modes * nr_nones);
 
 	thp_save_settings();
 	thp_read_settings(&settings);
@@ -299,8 +316,9 @@ int main(int argc, char **argv)
 	 */
 	thp_push_settings(&settings);
 
-	for (int m = 0; m < nr_modes; m++) {
-		const char *mode = modes[m];
+	for (int mn = 0; mn < nr_modes * nr_nones; mn++) {
+		const char *mode = modes[mn / nr_nones];
+		bool holes = nones[mn % nr_nones];
 
 		thp_read_settings(&settings);
 		settings.thp_enabled = THP_MADVISE;
@@ -310,14 +328,16 @@ int main(int argc, char **argv)
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
@@ -383,8 +403,9 @@ int main(int argc, char **argv)
 			check_page(i);
 
 		ksft_test_result(!corrupted,
-				 "%s: %ds, %d steps, no corruption\n",
-				 mode, duration_s, steps);
+				 "%s/%s: %ds, %d steps, no corruption\n",
+				 mode, holes ? "holes" : "strict",
+				 duration_s, steps);
 
 		/*
 		 * Hand the address space and the settings back before the
@@ -398,9 +419,9 @@ int main(int argc, char **argv)
 
 		if (corrupted) {
 			/* Memory is suspect; the rest would prove nothing. */
-			while (++m < nr_modes)
+			while (++mn < nr_modes * nr_nones)
 				ksft_test_result_skip("%s: skipped after corruption\n",
-						      modes[m]);
+						      modes[mn / nr_nones]);
 			break;
 		}
 	}
-- 
2.54.0

