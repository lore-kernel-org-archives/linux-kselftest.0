Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 190342F3C07;
	Sat, 19 Sep 2026 00:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789777536; cv=none; b=Ebqyy9Y7f2nkXMp8+5NEP37qs9owvhVO4JVpEcSlcR7kr02KZqslzWuOCNONoUMpkDT/GdmSiTBS8i1I6SIZmtWrICcYLzKe+yjuqSQfjyUkecNMbxfIDvq1fbfDW34oLmWDjf8Nt3BTLlnhTf/ymJOKclbDynGDXOxJtqGJUlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789777536; c=relaxed/simple;
	bh=GvKrau4wLEyE8GU3Un/RSoTxypsV0iNq26gyohcwXj0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T7OjvTc+bKs30v0AKpPc3IEWmUoSl+NClGmDsdZMkFFC2Z/ALiBUqcM/sc1SmNC1Kb79epyMuI9RFCI40qA3lp4GlAsE/+Mjte9zghJWiYqbPlenfKBkw9qIOhys8k0y+Znjr/h+fcz5eG+awbrzasq3cCgNTnIscw6Hpq+vUio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=ANdQgC+W; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=OUvKr+t8; arc=none smtp.client-ip=103.168.172.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="ANdQgC+W";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="OUvKr+t8"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.phl.internal (Postfix) with ESMTP id B4C08EC0232;
	Fri, 18 Sep 2026 20:25:31 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Fri, 18 Sep 2026 20:25:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1789777531; x=
	1789863931; bh=0hSKa8/sTyi+jf6ploRbE5LilQNqTTyCg9z8yjvcVBA=; b=A
	NdQgC+W2bZFOcVIoI4T8bHZS0N1i8PAzJVNbgghGQyba3z7Y7q3XMa8rPUkQTTgm
	f8w6jJBqUVAq7dFgNdvrv+c2xWLmizvRXCQXaDlkP44OtYa57KIbYPj51wu+S6p1
	kxHANAVyrHR+b5OFD+p0KYdOzNBaqrgRTMG21buK75KTh2GE8aUuTo3o21sXxumX
	5V8Bqzhy23s1sNpXg5BQ82dVrxrerIOWUwIMCwBC27W1JoBHvVieGfMXt5WZMr5j
	hDFFPUbNURVCk+oSdnoYnxNXlfISP062th4XcJQ2mezNXu70iEgt7GiQMn7uegF/
	9dRShJfYweO/zQaIyQfRg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1789777531; x=1789863931; bh=0
	hSKa8/sTyi+jf6ploRbE5LilQNqTTyCg9z8yjvcVBA=; b=OUvKr+t8nldXfgooL
	J15lfCu1YPcoKvc6mCAds2YTBu2p1wwGaDuFmLKcMlklPcTX0aC+Q/V0GWUaMtyA
	jq0zOO+Q44xn0p+U0GxiUWf26eDpnqONHWoBOl169cRkRC9pWjS2cRUXFc0rmas+
	pg1HCk52i6FrhnMUFpxRpAd52ikU4OdAOYcSO/kQoGnA+26vIHtUdVce1kamILfQ
	t0knQO5zBY3MsU394pEPu8ez1rdDkPtq3xsWQBhWB7hesv0nalFExpG1P1wfytrF
	Tc8MslSC+FCUCb/ffXE/A0sEPrgo7T7ZcMqUKQWmpXAAJtwFMIqU0keuns0zUung
	a9Kpw==
X-ME-Sender: <xms:e9atagx5N91UxjBh8aSO4vAjD_nIgXW33l1EN3OD2ylmGoPxojZ7gg>
    <xme:e9atasrqs3CkNprJzMYmyvgODFXELUNEEPpZUaZnbTh15dx-FXGxFUm4_in-YtP3y
    VQ52FOSAQ5hu6mc-0ou5Oeapb4MKDuqnuQWr2KiHZ6NA-2L75U7ydAQ>
X-ME-Received: <xmr:e9atakjMiGrPUXnwRG4SBJMUOg0eB2FXbrjWM4G6kmFk_LjRBwk63-D9UMs>
X-ME-Proxy-Cause: dmFkZTFdeCslqvGFSSbmnhtdeah2m5aJ+JS0pA7YZcLyjOSl38+BaMD8ToGDiujTmfb1FY
    hwc6MyP6OTrwB9YZ5cf4L42pzgHwmSUyeXVwqH+rQjzPLdOU7n8WI+L1MfkDKNJ/RFAPzh
    NlCaR2Fewfb53OcTxvB5KvIlzV5JISHwTvfMhxp8O5pDxNZaie3hjiM7DwEdIJtFqP5P16
    IJzN4rLPSq8PL3AzI9mCzJTBQz13YM+0hrUjs/JUttTBmoH69TA/2ONguP0NQ8nHQtvIz0
    3uJBRgi18k1Lqi8M3Hll9BkUCzWjsIEVqdaORpYkNdmWXEBvzlr7NFm9TsFftEQV4t5xs5
    JYtk2rCMb4KS87zC7serU0f9USLxq0fLzi7UaQV0oWZxxP9NbTq3K9wpk2GV/8P30K8k0A
    p0SSrjokXJVK9PMUwRPKpAu5O6c3/d1Wjf2Q/6rduQ0xbcl0kyQp/CLcSqGkFVNaSN3E3O
    nu5z2Su6ZetWS2nFgWLQ+bQWNOB9lDQgXXc9oGBeAchiC3RtK6tTOahUr6v/M3fAgbKRCR
    2nfMVRtUvk+6ZLz1wQ8G1tIpZxTNRonsWIIxDluPYOuPeVzJvUk0UIgeO0zr3iORf76ofj
    MKMjYL2NgwtDyckSq3QcqMKsuxvhlXXyjxvbq9CMsa6fjH2G5jLODhL5SX6Q
X-ME-Proxy: <xmx:e9atamXchfflHJvj5EzER2gDSfs1Rvn9n2NrCmeoqGIl-ssmIOROmw>
    <xmx:e9atakH-7rSXPydVfPHsnxU5aeHSCg1UJ81MinF1zJ5xe8sDYxJVGQ>
    <xmx:e9atau8GLMhN6otidUU6ztmBp-LaqNhIMnS770f4NxclyQd4SWDEpA>
    <xmx:e9atas1XPxNBiaog36kkg8PBKpw8-lq4F2Yv5QbVA9gJKP53RBTqnQ>
    <xmx:e9atajMaGFaBWEYnylNlaq-VcNm--wkkOjy2swqacnsYs_PNU6DmmdZc>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 18 Sep 2026 20:25:31 -0400 (EDT)
From: Kiryl Shutsemau <kirill@shutemov.name>
To: Andrew Morton <akpm@linux-foundation.org>,
	"David Hildenbrand (Arm)" <david@kernel.org>,
	"Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: "Kiryl Shutsemau (Meta)" <kas@kernel.org>,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Muhammad Usama Anjum <usama.anjum@arm.com>,
	Usama Arif <usama.arif@linux.dev>,
	"Nico Pache (Red Hat)" <nico.pache@linux.dev>,
	Zi Yan <ziy@nvidia.com>,
	Barry Song <baohua@kernel.org>,
	Dev Jain <dev.jain@arm.com>,
	Hugh Dickins <hughd@google.com>,
	Lance Yang <lance.yang@linux.dev>,
	"Liam R. Howlett" <liam@infradead.org>,
	Michal Hocko <mhocko@suse.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	"Vlastimil Babka (SUSE)" <vbabka@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Leon Romanovsky <leon@kernel.org>,
	kernel-team@meta.com
Subject: [PATCH v6 18/19] selftests/mm: add memory-pressure threads to the khugepaged race harness
Date: Sat, 19 Sep 2026 01:24:48 +0100
Message-ID: <20260919002451.496763-19-kirill@shutemov.name>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260919002451.496763-1-kirill@shutemov.name>
References: <20260919002451.496763-1-kirill@shutemov.name>
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
index 6575045c0482..68046f0bf6d3 100644
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
@@ -204,6 +206,69 @@ static void *mremapper_fn(void *arg)
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
@@ -227,17 +292,23 @@ int main(int argc, char **argv)
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
@@ -246,6 +317,9 @@ int main(int argc, char **argv)
 	unsigned long end_ms;
 	int duration_s = 5;
 	unsigned long thread_mask = ~0UL;
+	unsigned long base_mask;
+	bool have_swap;
+	char label[64];
 	int nr_areas_arg = 0;
 	unsigned long i;
 	int steps = 0;
@@ -305,7 +379,13 @@ int main(int argc, char **argv)
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
@@ -313,9 +393,25 @@ int main(int argc, char **argv)
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
@@ -349,6 +445,20 @@ int main(int argc, char **argv)
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
@@ -397,26 +507,18 @@ int main(int argc, char **argv)
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

