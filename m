Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2AB3367B8E;
	Sat, 15 Aug 2026 01:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786759182; cv=none; b=jvUqWYOqg1rgcGh4Hgxg51g7iOpPEymWJylaC1+Ny7D4CxArrIzj2mdlklNO7M+ulzwCWURlyRvAHglCsvtog/20OKZ/vLFX0PrSwe/t5K3gHCylnt7OOB4JCA3jR5fTKoiImR5zdom4f6zD21j5gJPXSdXUEpz1ixWksJeJUOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786759182; c=relaxed/simple;
	bh=ooI4yMykjGTIPAa7034+pYpwGfXX6+IcoJrym4helMs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ppVitnB5IuQDTrzMbmKX1J24MtxW398ixM2AtZQY2nzNAWBc3WrvOJmqdBVONDc69oMi5I0tHFMeh+28ZiPgILO8kT19GkCwpgPtiYwzGrI2W/Kg9E1hGAbn0lpKehr2aaloYGYLd59/Q+cabFcu77j0aqRI3pLq41ZHyglp2mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=D3mtboiF; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=NsrmYP7W; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="D3mtboiF";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="NsrmYP7W"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.phl.internal (Postfix) with ESMTP id A420CEC0238;
	Fri, 14 Aug 2026 21:59:39 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Fri, 14 Aug 2026 21:59:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1786759179; x=
	1786845579; bh=JK5GVI6pI2lxoa84VhaQKI3w4xKylzP6fAx1cS2WfAU=; b=D
	3mtboiFR8kAyvDL6O4AAcA0NezFYPVsOBnyzr59jVjz0lHrw/n7/MXZAkjs4b620
	+036gY92utRhm5FoKr3ImhrTHrMvMa0uDnoe/umnyg1yirU+b7UuqD0xYXIVzRZ8
	Y8k20gVLeor+svnZLALZeyznV9gJCUo2ztgxE+TnYPRAZg0xzEroHJz/4wTBDmEZ
	F32gFOJbzh5RUAijasgnvSBy475Wysl/HVM99AkmJnHev3rra1H5YOS8W+sclsuk
	ER0opUBTumB5T0E9epZUNA/ZYNx9eQjRAqbelVEjljcWyJW41Nx7lW5qbUI1xasV
	MidifAiUitaU+Q3KHc65w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1786759179; x=1786845579; bh=J
	K5GVI6pI2lxoa84VhaQKI3w4xKylzP6fAx1cS2WfAU=; b=NsrmYP7WnbCsDiaKE
	+BtqmC4eB9oen/ucBplSll7oiH2kHU40wlRIPQoFg94/hKjh2lyiSzRTOp8JvSCq
	JF5337sawFgeLeUC2kRsX2kCG/LeJznHCf2C3k7q/g1fgzy17StdLNjewE5Qrc87
	Yqi5h3mmE+Z4Q0lca9w4fFyHkx/s8k4QoSRDLeTa29D7c/TDRajBIelQ1ILe1TQC
	IIKzxmX8pBMfYjU/Lx1eY32JZ6zCEXr0lEHZfV/n4YkROXIFeNdv41lLGcLavduJ
	++bJ+8HVPZg014EKnk8pcmgQFh2mi2DYEOzGa2FZnpYQgk6Rr1XrytpDg4BzxlDg
	b9OWw==
X-ME-Sender: <xms:C8h_au_OQjBsh7-FIdh74mIiJewAFPyYGwA5-AdIu23kpgytGxV4WQ>
    <xme:C8h_aiod22ZXQXDOjHDrXICf5O6KkvTNbXQPRID4bQ3sBB0RrsPh-Yxy4Ozm1z2cb
    rBs3DuWyRBwDZas8oGX0w6qMVolGZd1isbmbJPakedDayRwUTqCalo>
X-ME-Received: <xmr:C8h_ashm9D6zhY8SxJ5egxGeIS6i3u-bw42VPbO317xNgUxRtbp4WJTAxs0>
X-ME-Proxy-Cause: dmFkZTFzGpGFm5W4vTTPFWblEwVteikp8ZQmNhgJQ39PW7T7XQcfx50sk9SsorwQ5kiHE1
    GkGyp58aXi1XV7w9FWqCEkAAXyywQWDaCYDP4jk79Tj+fneRM/f70WhpHyk68ivSHa8CNO
    EHCv/WuNeVKTxC+1Am5pTEbXGz94MYKYsyM7kpGX5dHsQKSWoIOFoaOZhong5pPq1D5dt9
    kZJFmHpp6Lnk5BJwnqgflVky13nVISEGlBe9NK3zcAVq5kZlGc2PqnLHdjdexqJ0GH5I+D
    CyEe7NNeMVRnhwRmAQGYSBBJ6RBvmXxfczeNb/t4Esr0tR7Igh8W/aIlPiSt8FyWTQd+TG
    GnssYIczN2LI/Xz94YDefGLowoNoiM6pqpAUodaYbR6hi2S4OnC2iEHjxeNfrDS9HJXd2f
    6IXWtuE6XJrzJTWNEAJgdYW2s+C51dwE/YnPLYE+HrvL5uB09u1QbSTWUynuv92A4cmqT1
    uMUJOkGjlyorBDYinuQkYUiV5ws9EBM9YxluzUjsCJN7p1yORebiDQdoM8urJIm7L2qpIl
    +k9nX7OtbQij9IAgZW1EW6gDbm9nndabfK8vO5jsdbZ82g1CKkd8Wj8huKmCfXIRb32UZV
    aE5H1qmmSf9V/qWZ3bw3wrXcKyUhCHDA11D0RzeVcbH74bO9xK+ZkznWeKog
X-ME-Proxy: <xmx:C8h_agCEowTTdGnINcVkniOzPBgPbaocYPXr_TyJi-EwEGxt2JWZ5g>
    <xmx:C8h_aquG_2CP1HCFRHBuPZ8ZEW0Uqmp-cOfRzN-f6X4wbb5EKv5oxg>
    <xmx:C8h_aq4Kt06t-My11772voNi3nXnrC9Csc3tKPrEfCINF2irCCkGfA>
    <xmx:C8h_akcG4QPTKYQh8Un8YoXihnV7tQ7V_6HHl1ih4Mc6GmWZUpQfhA>
    <xmx:C8h_ajeMFZzkYFuuwgcfy1GUiHsLOZ2BYSsu1U65Oc2D3lnOmPvc7V6B>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 14 Aug 2026 21:59:39 -0400 (EDT)
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
Subject: [PATCH v4 18/19] selftests/mm: add memory-pressure threads to the khugepaged race harness
Date: Sat, 15 Aug 2026 02:59:00 +0100
Message-ID: <20260815015901.1236937-19-kirill@shutemov.name>
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

The harness races collapse against faults, pins, fork, mremap and
MADV_DONTNEED, but nothing in it elevates a source folio's refcount from
the reclaim or compaction side.

Add two more threads, and run every mode and occupancy limit both with and
without them:

 - pageout: cycles MADV_PAGEOUT over a dedicated neighbour region, faults
   it back in and checks the content each round, since a page's pattern
   must survive the trip through swap.  Left out when the host has no
   swap, because then there is no anon reclaim to drive.

 - compactor: writes /proc/sys/vm/compact_memory in a loop.  Compaction
   isolates and migrates folios, so it competes with a collapse for the
   pages it is gathering, with refcount elevations and migration entries
   of its own.

Each result says whether it ran under pressure:

  ok 2 stepped/strict/pressure: 5s, 88 steps, no corruption

A full run is now twelve combinations; -m and -d narrow it.

Assisted-by: Claude-Code:claude-opus-5
Tested-by: Muhammad Usama Anjum <usama.anjum@arm.com>
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 tools/testing/selftests/mm/khugepaged_race.c | 144 +++++++++++++++++--
 1 file changed, 132 insertions(+), 12 deletions(-)

diff --git a/tools/testing/selftests/mm/khugepaged_race.c b/tools/testing/selftests/mm/khugepaged_race.c
index 3b369046edf5..a23e5bfe78af 100644
--- a/tools/testing/selftests/mm/khugepaged_race.c
+++ b/tools/testing/selftests/mm/khugepaged_race.c
@@ -17,6 +17,12 @@
  * collapses too.  A hole is zero-filled into the new folio rather than
  * copied, and the racing MADV_DONTNEED keeps moving which slots are holes.
  *
+ * Every combination also runs under memory pressure: MADV_PAGEOUT cycling
+ * on a dedicated neighbour region (swap traffic and LRU churn; left out
+ * with a note when the host has no swap) and a compact_memory trigger
+ * loop (compaction migrates source folios, racing collapse's freeze
+ * with refcount elevation and migration entries of its own).
+ *
  * Correctness signals: every racing page must read as its pattern or
  * zero (MADV_DONTNEED), never anything else.  The faulters and the fork
  * children check that continuously, a final sweep checks it once more, plus
@@ -60,6 +66,8 @@ static unsigned long page_size;
 static char *region;		/* NR_AREAS * hpage_pmd_size */
 static char *mremap_area;	/* region + NR_SHARED_AREAS areas */
 static char *mremap_scratch;	/* well above the region */
+static char *pageout_area;	/* dedicated pressure region */
+static size_t pageout_size;
 static int gup_fd = -1;
 static volatile int stop;
 static volatile int corrupted;
@@ -218,6 +226,70 @@ static void *mremapper_fn(void *arg)
 	return NULL;
 }
 
+/*
+ * Swap traffic and LRU churn on a region of our own. The content
+ * check is exact: a page out and back through swap must preserve the
+ * pattern, and nothing else ever writes here.
+ */
+static void *pageout_fn(void *arg)
+{
+	unsigned int seed = (unsigned long)arg;
+	unsigned long nr = pageout_size / page_size;
+	unsigned long i;
+
+	for (i = 0; i < nr; i++)
+		*(unsigned int *)(pageout_area + i * page_size) = pattern(i);
+
+	while (!stop) {
+		madvise(pageout_area, pageout_size, MADV_PAGEOUT);
+		for (i = 0; i < nr && !stop; i++) {
+			unsigned int val = *(unsigned int *)(pageout_area +
+							     i * page_size);
+
+			if (val != pattern(i)) {
+				corrupted = 1;
+				ksft_print_msg("Pageout corruption at page %lu: %#x != %#x\n",
+					       i, val, pattern(i));
+			}
+		}
+		usleep(rand_r(&seed) % 2000);
+	}
+	return NULL;
+}
+
+/* Compaction migrates the collapse sources out from under us. */
+static void *compactor_fn(void *arg)
+{
+	unsigned int seed = (unsigned long)arg;
+	int fd = open("/proc/sys/vm/compact_memory", O_WRONLY);
+
+	if (fd < 0) {
+		ksft_print_msg("No compact_memory; compactor idle\n");
+		return NULL;
+	}
+	while (!stop) {
+		if (write(fd, "1", 1) < 0)
+			break;
+		usleep(10000 + rand_r(&seed) % 100000);
+	}
+	close(fd);
+	return NULL;
+}
+
+static bool swap_available(void)
+{
+	char line[256];
+	int lines = 0;
+	FILE *fp = fopen("/proc/swaps", "r");
+
+	if (!fp)
+		return false;
+	while (fgets(line, sizeof(line), fp))
+		lines++;
+	fclose(fp);
+	return lines > 1;
+}
+
 static unsigned long now_ms(void)
 {
 	struct timeval tv;
@@ -240,17 +312,23 @@ int main(int argc, char **argv)
 {
 	static const char * const thread_names[] = {
 		"faulter", "faulter2", "dontneed", "pinner", "forker",
-		"mremapper",
+		"mremapper", "pageout", "compactor",
 	};
 	void *(*const thread_fns[])(void *) = {
 		faulter_fn, faulter_fn, dontneed_fn, pinner_fn, forker_fn,
-		mremapper_fn,
+		mremapper_fn, pageout_fn, compactor_fn,
 	};
+	enum { T_FAULTER, T_FAULTER2, T_DONTNEED, T_PINNER, T_FORKER,
+	       T_MREMAPPER, T_PAGEOUT, T_COMPACTOR };
+	const unsigned long pageout_bit = 1UL << T_PAGEOUT;
+	const unsigned long compactor_bit = 1UL << T_COMPACTOR;
 	const int nr_threads = ARRAY_SIZE(thread_names);
 	pthread_t threads[ARRAY_SIZE(thread_names)];
 	static const char * const all_modes[] = { "stepped", "free", "madvise" };
 	static const bool occupancies[] = { false, true };	/* strict, holes */
+	static const bool pressures[] = { false, true };	/* quiet, under pressure */
 	const int nr_occupancies = ARRAY_SIZE(occupancies);
+	const int nr_pressures = ARRAY_SIZE(pressures);
 	const char *one_mode[1];
 	const char * const *modes = all_modes;
 	int nr_modes = ARRAY_SIZE(all_modes);
@@ -259,6 +337,7 @@ int main(int argc, char **argv)
 	unsigned long end_ms;
 	int duration_s = 5;
 	unsigned long thread_mask = ~0UL;
+	unsigned long base_mask;
 	int nr_areas_arg = 0;
 	unsigned long i;
 	int steps = 0;
@@ -323,7 +402,12 @@ int main(int argc, char **argv)
 		 -1, 0) != (void *)mremap_scratch)
 		ksft_exit_fail_perror("mmap() mremap scratch");
 
-	ksft_set_plan(nr_modes * nr_occupancies);
+	base_mask = thread_mask;
+	if (!swap_available())
+		/* No swap, no anon reclaim: compaction-only pressure. */
+		ksft_print_msg("no swap: the pageout thread stays idle\n");
+
+	ksft_set_plan(nr_modes * nr_occupancies * nr_pressures);
 
 	thp_save_settings();
 	thp_read_settings(&settings);
@@ -335,9 +419,17 @@ int main(int argc, char **argv)
 	 */
 	thp_push_settings(&settings);
 
-	for (int mn = 0; mn < nr_modes * nr_occupancies; mn++) {
-		const char *mode = modes[mn / nr_occupancies];
-		bool holes = occupancies[mn % nr_occupancies];
+	for (int run = 0; run < nr_modes * nr_occupancies * nr_pressures; run++) {
+		int rem = run % (nr_occupancies * nr_pressures);
+		const char *mode = modes[run / (nr_occupancies * nr_pressures)];
+		bool holes = occupancies[rem / nr_pressures];
+		bool pressure = pressures[rem % nr_pressures];
+
+		thread_mask = base_mask;
+		if (!pressure)
+			thread_mask &= ~(pageout_bit | compactor_bit);
+		else if (!swap_available())
+			thread_mask &= ~pageout_bit;
 
 		thp_read_settings(&settings);
 		settings.thp_enabled = THP_MADVISE;
@@ -373,6 +465,24 @@ int main(int argc, char **argv)
 			ksft_exit_fail_perror("mmap() playground");
 		mremap_area = region + nr_shared_areas * hpage_pmd_size;
 
+		if (thread_mask & pageout_bit) {
+			/*
+			 * Big enough to cycle real reclaim, small enough not
+			 * to dominate a TCG guest: 4 PMD areas, clamped to
+			 * [16M, 64M].
+			 */
+			pageout_size = 4 * hpage_pmd_size;
+			if (pageout_size < 16UL << 20)
+				pageout_size = 16UL << 20;
+			if (pageout_size > 64UL << 20)
+				pageout_size = 64UL << 20;
+			pageout_area = mmap(NULL, pageout_size,
+					    PROT_READ | PROT_WRITE,
+					    MAP_ANONYMOUS | MAP_PRIVATE, -1, 0);
+			if (pageout_area == MAP_FAILED)
+				ksft_exit_fail_perror("mmap() pageout area");
+		}
+
 		/* Populate so the first pass has something to collapse. */
 		for (i = 0; i < nr_shared_areas * hpage_pmd_size / page_size; i++)
 			*(unsigned int *)(region + i * page_size) = pattern(i);
@@ -423,8 +533,9 @@ int main(int argc, char **argv)
 			check_page(i);
 
 		ksft_test_result(!corrupted,
-				 "%s/%s: %ds, %d steps, no corruption\n",
+				 "%s/%s%s: %ds, %d steps, no corruption\n",
 				 mode, holes ? "holes" : "strict",
+				 pressure ? "/pressure" : "",
 				 duration_s, steps);
 
 		/*
@@ -433,17 +544,26 @@ int main(int argc, char **argv)
 		 * and its scan cadence differs.
 		 */
 		munmap(region, nr_areas * hpage_pmd_size);
+		if (pageout_area) {
+			munmap(pageout_area, pageout_size);
+			pageout_area = NULL;
+		}
 		thp_pop_settings();
 		stop = 0;
 		steps = 0;
 
 		if (corrupted) {
 			/* Memory is suspect; the rest would prove nothing. */
-			while (++mn < nr_modes * nr_occupancies)
-				ksft_test_result_skip("%s/%s: skipped after corruption\n",
-						      modes[mn / nr_occupancies],
-						      occupancies[mn % nr_occupancies] ?
-						      "holes" : "strict");
+			while (++run < nr_modes * nr_occupancies * nr_pressures) {
+				rem = run % (nr_occupancies * nr_pressures);
+
+				ksft_test_result_skip("%s/%s%s: skipped after corruption\n",
+						      modes[run / (nr_occupancies * nr_pressures)],
+						      occupancies[rem / nr_pressures] ?
+						      "holes" : "strict",
+						      pressures[rem % nr_pressures] ?
+						      "/pressure" : "");
+			}
 			break;
 		}
 	}
-- 
2.54.0

