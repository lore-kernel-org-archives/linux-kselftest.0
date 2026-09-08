Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FB71548549;
	Tue,  8 Sep 2026 12:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788871909; cv=none; b=hOOdPgA2CrJJzglZ+e0B8ueGW8V22WkFci9u61G1dt6VxTVjmUAtse8E6+cohsGcdYK9Ef9nWGpvf4wUIbC8Hozc8nRBAywyKR0TsgrXUPANwyAk9u5qzwKrHLvb8mEFiKTSClRl+1hh7uOW4jdJpozkPkD/Uve77b/7sCUcfKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788871909; c=relaxed/simple;
	bh=RsIVpZ5qbEkeqtMBGBz7qrrXun1dGGoYmUbBi6WCRjE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ajvn5XVCxD2ixJQutqo+tFwqxpTW7DeIN6J5RX7LxzRmRWDncvyi/ZLEWxruHzVieVfGPfs4pwzhlZIo1xZ9AuKlBbB8bZSBYEPg/neX3gC3J5tC2kApOPsPzgVLpLe8wyjUvBz2k8lmq7Oj3UzxRc59IP831rYJ4e+jGPhfo0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=c9Y3CyAy; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=AvEJhTm2; arc=none smtp.client-ip=103.168.172.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="c9Y3CyAy";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="AvEJhTm2"
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 85507140006E;
	Tue,  8 Sep 2026 08:51:46 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Tue, 08 Sep 2026 08:51:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1788871906; x=
	1788958306; bh=zqvacDlN0e2w6egDKHKDWVi4bm/TZ7c4rTBepRvovoM=; b=c
	9Y3CyAylZLS5kOC0oNs7ri1UFySi9umg5CeHU2uK4jLDC3R4j+IZN1zrsV/NBAt8
	sjTk/mRcgNuuqqgS3W9rQn4N10sIsGQBElj0moQGUapZiVTgkGykyYgu115RX/xr
	5QwP5ydVtCdBfs5Ui15qQNF7UJ9p5vWxjjvm+t4k3cKrEaB/+7jxaJftFGFnjXkV
	WxdOPuiBUXTHkWmw0mdGThKp/9U+7aF3VS9LeZDv28cvmoxhBnMEJbz1ulLA8/F5
	PpvWwVvH0fnfs/YQUjzbdZ3iyLCD0waj0UKR+bezjMcqTlc/BdrF5+JETf/vtZAg
	ZftisHQhkXHacPhz4smug==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1788871906; x=1788958306; bh=z
	qvacDlN0e2w6egDKHKDWVi4bm/TZ7c4rTBepRvovoM=; b=AvEJhTm2JAnnieYVd
	k4g/vlDtlMCYLYcplvJ2DDpmxYlf/roP7IeJY/p7pFcQrA0E/Ih67pjKsfSbDRzn
	134f0ZGRNwjiV/7kdQNrA+Z3BDP1zhcS8k0ipYnpCxqwFYTVQownIR2/VmzM8tvi
	xK1PTCSK6KtMlh8gk3CbTAD1CXMP/tYRNLMrSWVVWwUoZc7BRNFTwPN/xcHz0PZ1
	DDLB6hg3nz5ghDh5iprLlY2BECTPUbjbfLxvpL8R+/EQnI9lzTsvgsAK9kJD2dg+
	G8Ce+cv6Mi2R3UTAvikJ5yGioGNKhDNoBlQPSlxRLHbg5kdTzZNKvIPj95rjoiJU
	+y89Q==
X-ME-Sender: <xms:4gSgakA8SX-DX-Gfh5uAGwEERc7wnrCDCbCHINZ4qGqWVyxtmuGbOA>
    <xme:4gSgaoZ_FDSS5oHmS-bXzy0agCoqwgtNho_DK7aA5D3OHNrm668qLhw3lRmbbITGw
    alVZVMj4WN3O6Vijua3oqkh3VELoNQvyjlZEUxr-Y_VxE9QyKITWy8k>
X-ME-Received: <xmr:4gSgasvhMkxP_B2HgY__LP7sXQfJQGkCRTFBeYLI3XK-K24bGcK8wfrFO0o>
X-ME-Proxy-Cause: dmFkZTEFE5qoX+UuF24uzYsEDVhBj7K7PVNhp/QrdS9IridywNr6zbUVHRTwEJHEkegH78
    2Q0FzpV7Ffbkv2IdJy+2X+gRr5j/GVU+OmQCyX7TrMKkR+B67hpV4qik2kuPcySyPVfL0N
    fjj0puKIPOVKC53VUKH1AFABHK+HgKXG4fFGTm0bttO6aht4AByKsMi5q5m3My1bWaIsHx
    VvWLDqNEgw9NR009yUV13rBPhKD5hG186SgbvLIVXWjVzTBDRGAi2tS1solDyldiLqdSzW
    Z7lbjekX5xhyyUWYdDppP3CJdHwaOTYUEqdi4pIet3xRU1rw2DJzUGF3Njycnc94ehWzPa
    vyAAOqe73Pl13+klFC5N/QOg1BhsXHpd+vVpfxLPxcnWMqyPAjq9YobTdfsrZ7COd/vDux
    AcdlwHGf6V6gdwGca+kLxFa4//EDlDVxr9FWn7d4CP+XYBPZRFx1Y5HpkUnEMvxYp8jn2v
    VMB2tnByHyvca8cjYMG2uRxTeArPeslgB1YFWCkOBLje8bLCFvxkQ1laerqKTxH5AUQYlh
    ldLdqHSvRU+u4z7McyHtiJwTtFIlJEWKTih1uh/MravE8iA21qbIxTnwg6VcYuj/RpZ27d
    Lj88J0kjUTocPL4rn5NVEXbn+olYGpziUqynafsRUsnixcqPM1XmZMqz2tHw
X-ME-Proxy: <xmx:4gSgaq_ue6OnGowX8LalEnBJKcDXeOUxjjhdQ7oP7g-8GDTxyhHCzQ>
    <xmx:4gSgasU5mQOeVXTUUVrju3J1Li86er0RTG2evnA86-UF-NXr4DxxPQ>
    <xmx:4gSgautAsu1DuTrg03f3x0W_wn5XiNzkE-ccfeDi7eKhS7hNR8N7TA>
    <xmx:4gSgaq8d1LVqwyLPtVe43Wp5clWrVCBJ9asUTVMql_abWj4hcWDUHg>
    <xmx:4gSgakcBS7Q6qodGBD3XhI7VTX9xiCF_1cjzpAaxHUn5Xd06inMrE5nE>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 8 Sep 2026 08:51:45 -0400 (EDT)
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
Subject: [PATCH v5 18/19] selftests/mm: add memory-pressure threads to the khugepaged race harness
Date: Tue,  8 Sep 2026 13:51:04 +0100
Message-ID: <20260908125105.1510704-19-kirill@shutemov.name>
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

The harness races collapse against faults, pins, fork, mremap and
MADV_DONTNEED, but nothing in it runs reclaim or compaction against the
collapse.

Add two more threads, and run every mode and occupancy limit both with and
without them:

 - pageout: cycles MADV_PAGEOUT over a region of its own, faults it back
   in and checks the content each round, since a page's pattern must
   survive the trip through swap.  Left out when the host has no swap,
   because then there is no anon reclaim to drive.

 - compactor: writes /proc/sys/vm/compact_memory in a loop.  Compaction
   isolates and migrates folios, so it competes with a collapse for the
   pages it is gathering, with refcount elevations and migration entries
   of its own.

Each result says whether it ran under pressure:

  ok 2 stepped/strict/pressure: 5s, 88 steps, no corruption

A full run is now twelve combinations; -m picks one mode, -d shortens
each run.

Assisted-by: LLM
Tested-by: Muhammad Usama Anjum <usama.anjum@arm.com>
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 tools/testing/selftests/mm/khugepaged_race.c | 142 ++++++++++++++++---
 1 file changed, 122 insertions(+), 20 deletions(-)

diff --git a/tools/testing/selftests/mm/khugepaged_race.c b/tools/testing/selftests/mm/khugepaged_race.c
index f31f12fc0390..1f4aa23834db 100644
--- a/tools/testing/selftests/mm/khugepaged_race.c
+++ b/tools/testing/selftests/mm/khugepaged_race.c
@@ -44,6 +44,8 @@ static unsigned long page_size;
 static char *region;
 static char *mremap_area;
 static char *mremap_scratch;
+static char *pageout_area;
+static size_t pageout_size;
 static int gup_fd = -1;
 static volatile int stop;
 static volatile int corrupted;
@@ -199,6 +201,69 @@ static void *mremapper_fn(void *arg)
 	return NULL;
 }
 
+/*
+ * Swap traffic and LRU churn on a region nothing else writes, so a page's
+ * pattern must survive the trip through swap exactly.
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
+/* Compaction migrates the collapse sources while they are being gathered */
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
@@ -222,17 +287,23 @@ int main(int argc, char **argv)
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
@@ -241,6 +312,9 @@ int main(int argc, char **argv)
 	unsigned long end_ms;
 	int duration_s = 5;
 	unsigned long thread_mask = ~0UL;
+	unsigned long base_mask;
+	bool have_swap;
+	char label[64];
 	int nr_areas_arg = 0;
 	unsigned long i;
 	int steps = 0;
@@ -300,7 +374,13 @@ int main(int argc, char **argv)
 		 -1, 0) != (void *)mremap_scratch)
 		ksft_exit_fail_perror("mmap() mremap scratch");
 
-	ksft_set_plan(nr_modes * nr_occupancies);
+	base_mask = thread_mask;
+	have_swap = swap_available();
+	if (!have_swap)
+		/* No swap, no anon reclaim: compaction-only pressure */
+		ksft_print_msg("no swap: the pageout thread is not started\n");
+
+	ksft_set_plan(nr_modes * nr_occupancies * nr_pressures);
 
 	thp_save_settings();
 	thp_read_settings(&settings);
@@ -308,9 +388,25 @@ int main(int argc, char **argv)
 	/* Base of the settings stack; the bottom entry is never popped */
 	thp_push_settings(&settings);
 
-	for (int run = 0; run < nr_modes * nr_occupancies; run++) {
-		const char *mode = modes[run / nr_occupancies];
-		bool holes = occupancies[run % nr_occupancies];
+	for (int run = 0; run < nr_modes * nr_occupancies * nr_pressures; run++) {
+		int rem = run % (nr_occupancies * nr_pressures);
+		const char *mode = modes[run / (nr_occupancies * nr_pressures)];
+		bool holes = occupancies[rem / nr_pressures];
+		bool pressure = pressures[rem % nr_pressures];
+
+		snprintf(label, sizeof(label), "%s/%s%s", mode,
+			 holes ? "holes" : "strict", pressure ? "/pressure" : "");
+		if (corrupted) {
+			/* Memory is suspect; the rest would prove nothing */
+			ksft_test_result_skip("%s: skipped after corruption\n", label);
+			continue;
+		}
+
+		thread_mask = base_mask;
+		if (!pressure)
+			thread_mask &= ~(pageout_bit | compactor_bit);
+		else if (!have_swap)
+			thread_mask &= ~pageout_bit;
 
 		thp_read_settings(&settings);
 		settings.thp_enabled = THP_MADVISE;
@@ -344,6 +440,20 @@ int main(int argc, char **argv)
 			ksft_exit_fail_perror("mmap() playground");
 		mremap_area = region + nr_shared_areas * hpage_pmd_size;
 
+		if (thread_mask & pageout_bit) {
+			/* Enough to drive real reclaim without swamping a small guest */
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
 		/* Populate so the first pass has something to collapse */
 		for (i = 0; i < nr_shared_areas * hpage_pmd_size / page_size; i++)
 			*(unsigned int *)(region + i * page_size) = pattern(i);
@@ -392,26 +502,18 @@ int main(int argc, char **argv)
 		for (i = 0; i < nr_shared_areas * hpage_pmd_size / page_size; i++)
 			check_page(i);
 
-		ksft_test_result(!corrupted,
-				 "%s/%s: %ds, %d steps, no corruption\n",
-				 mode, holes ? "holes" : "strict",
-				 duration_s, steps);
+		ksft_test_result(!corrupted, "%s: %ds, %d steps, no corruption\n",
+				 label, duration_s, steps);
 
 		/* The next mode maps the same fixed address with its own settings */
 		munmap(region, nr_areas * hpage_pmd_size);
+		if (pageout_area) {
+			munmap(pageout_area, pageout_size);
+			pageout_area = NULL;
+		}
 		thp_pop_settings();
 		stop = 0;
 		steps = 0;
-
-		if (corrupted) {
-			/* Memory is suspect; the rest would prove nothing */
-			while (++run < nr_modes * nr_occupancies)
-				ksft_test_result_skip("%s/%s: skipped after corruption\n",
-						      modes[run / nr_occupancies],
-						      occupancies[run % nr_occupancies] ?
-						      "holes" : "strict");
-			break;
-		}
 	}
 
 	ksft_finished();
-- 
2.54.0

