Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A44D34BA28;
	Sun,  2 Aug 2026 19:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785700407; cv=none; b=psElRogDcKQbYXMK9/Bf92TXnxLyddzWSr8nOE9HCtgZ8PHQkEbN1xj+hHaH3++ub77DIFKLjSPGvF05DRkznQzps/6FEhCt/2rsWR3Ck0scyhhDv7iclOk4ib/OhHBxOMyPKHwswXsA5PalJxz2/5mUwWJSNia06MCTAsGveOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785700407; c=relaxed/simple;
	bh=97307fGTriEvyv1xdaKU7b4a1B4CW2nWC3qM5u9GDXg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=l0zFxOQyflWVmqCmOQEeh8HR3VIkfgUPsW+vNPetT868u8YMd9uMJdjZWU7W8XnK+p5/3chfkhOfssF6lq4QvzcWQM5qD94YcqVPzMx8i2K8smkOrXRnqXnZr+CDOu46G9ctxZQKvwjEZBtXLV5jdAwr6Cw01AyGq7q6ODAFA5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=yWrm+U/7; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=G26MfNUC; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="yWrm+U/7";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="G26MfNUC"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 6C4B4EC009A;
	Sun,  2 Aug 2026 15:53:24 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Sun, 02 Aug 2026 15:53:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm1;
	 t=1785700404; x=1785786804; bh=2c04viUKNcyHIhwoJZycJfPOVi3SeTtB
	J4GmRbTe/aM=; b=yWrm+U/7nm6MzG1dXJJW53fouBM8wh4F7u9str+PDJ4CIhIK
	CBDnuAh8AV/AsITnaObFEMo039h9MkMDpECGa5EcfSXeFpLpAwYOqMuo8dTLc2Bv
	opUWnoAIV85ZbyATG9pyFt37VxSjjvLiovfwJFUPxumglyfzalfNLf6zuN9QTXUR
	htbv/TxFNwvJ7Tv2Y5aAuCyCZliLLGOOOAuZtmc32cAa75H79+4/hWVnXt+4QOlN
	PLIvFEhSIxdjj0oDDIysdIa0GyXY0aUZJLEHjKN18xTLAEXsgSjX4x6q22THnuiL
	gJIobAElp/bjoB3+fDpBAoaRs+J0gUUJWorf+Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1785700404; x=
	1785786804; bh=2c04viUKNcyHIhwoJZycJfPOVi3SeTtBJ4GmRbTe/aM=; b=G
	26MfNUCRsWMe8prJiJZmMIaQugODfgLH3p7bJ93/tFtPvqqc3Ms9f+zq1XJwKQiD
	fG2At1k/PFT7t0KWSECXJVWvmw+UsZl/KBeo+DSNkF9hFJ7uzqT79BISfr+FS+QT
	eT2FvlA5PYcawn1LLBgs0jcIEsI+TGk/zA+ou8YOZNtCLJiAdSCP4tgfMUGGPxSa
	r0PG6ZLXiFgWcY6AqukRGIHaoAe3Ezc7i29tDIEAJC2tVxNo9c4uD5Fq204t/fZ2
	8NgO9XZNgmxPEG3k+M5KXHoYVc/JztypgEbuVprpQM6pNz6Ye0GA9yEQNPAAkSGb
	5FGyvBuDPl7Ph+L2alwPQ==
X-ME-Sender: <xms:NKBvaozybnXtfoN90SPaFDXbFBf1ufJl_4MVrEgnFC8ygaX1DJZ2sQ>
    <xme:NKBvamy18lmvrcGBLaspAOw5RUJoFmGNh_qxS-mdSuqdE-Qx4CfC1mCtMAn13JLnW
    Qayre4wkTyXFEl_8dBdKY3qTFbwiNGEUnNh-LkSp_7_cMe8ngkeS3VP>
X-ME-Received: <xmr:NKBvanTkC4kyUWLu3vikY5T09rx0F97cSGdQ-Z_TuZ-7-eCO0ZrO_YricTs>
X-ME-Proxy-Cause: dmFkZTF0jcSSKFGDg2KrIu5c43P4SsiipwcvDQBe+CHxos2n8PFgvSXAdv5YVW583HVAOz
    W5evq6qe09LpHqloXNM1K7VWF721j2bpam5IryqVMcYz9qouNwbpBEKv3Y5gifbeJAqW/Q
    YZQrbB51yLEk86mWZaGZ1Drq0Xy949i11wvFP7mkSWE3f4+XiyFqs+bTi+V6AVpUjNMMFr
    yeY2fCKzWlrX4GavSe/JRyGqxABGArlOuRBA0IP4mMA1yNK8fSDYGTdjzDrtr8AjwNqVIi
    3BcHDiClTVSc/WD5f6J8XCsMYF+6dE+0Mr4gWnl6eMmh6FUU5GqCPEjsceh07AxGuRDdTX
    XdmLUZnQtOIo3U12N6vnFLsjhbT6fpNHt4ncCPLjHXv3aD+KUCMK6s6F3lRJxFNOMbgc/U
    7M8qiCi4FTGopPjRHwo8pszqIV5/QQBgCpl3sYpkredorGFz5WdT1fT+V/MeK8EskgLaNh
    UYmt/EhKngGhHufRIXqnTlZUgWgEgyc/ng55idQJ5FtdW3FytevGVbGVrEOEddplajbHt9
    2gnOmC6xkFWB58lo1pGQWWNw8KdkvTh3Vb6cSHwZYFrchM0fhW2zPSkGx7BwwtCejS0vay
    7vHahGFctGxRqhClNQrtPMmAyXmh5oQR0cZQvY0pdTmCITbLENM8FG+aEWRQ
X-ME-Proxy: <xmx:NKBvapNErVdY8WBxizWZtuzbZs5bKQeNf00ChjeO_xyTmpL2b0wRVA>
    <xmx:NKBvaiSIpIYiw1H6n45D9z34-FaSiRYZ0q6Fk5s5n6PZCqiblCi-bg>
    <xmx:NKBvak-mxvXGIjg7jfJFshNgTEe31d28DC4YMoGqDCg8cnNcj6FHEQ>
    <xmx:NKBvakVCi-k3SWXKrHQ-fIuMHQDHxUte4NqaYycuDSbhxRi6ujLRXA>
    <xmx:NKBvaiswm8GPm3Svm_gK2nxdcRwj-qpNwOM843SelLh4egXjA12Loek5>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 2 Aug 2026 15:53:23 -0400 (EDT)
From: Kiryl Shutsemau <kirill@shutemov.name>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Nico Pache <nico.pache@linux.dev>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>,
	Barry Song <baohua@kernel.org>,
	Dev Jain <dev.jain@arm.com>,
	Hugh Dickins <hughd@google.com>,
	Lance Yang <lance.yang@linux.dev>,
	"Liam R. Howlett" <liam@infradead.org>,
	Michal Hocko <mhocko@suse.com>,
	Mike Rapoport <rppt@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Usama Arif <usama.arif@linux.dev>,
	Vlastimil Babka <vbabka@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Kiryl Shutsemau (Meta)" <kas@kernel.org>
Subject: [PATCH 12/16] selftests/mm: add memory-pressure threads to the khugepaged race harness
Date: Sun,  2 Aug 2026 20:52:44 +0100
Message-ID: <20260802195254.1937477-13-kirill@shutemov.name>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260802195254.1937477-1-kirill@shutemov.name>
References: <20260802195254.1937477-1-kirill@shutemov.name>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>

The race harness exercises collapse against faults, pins, fork, mremap and
MADV_DONTNEED, but nothing in it ever elevates a source folio's refcount
from the reclaim or compaction side: LRU isolation, migration of a source
folio out from under the collapse, or swap traffic churning the LRU while
a collapse is in progress.

Add -p, which starts two more racing threads:

 - pageout: cycles MADV_PAGEOUT over a dedicated neighbor region
   (4 PMD areas, clamped to [16M, 64M]), faulting everything back in and
   verifying content each round -- swap traffic and LRU churn with an
   exact correctness check, since a page's pattern must survive the round
   trip through swap. Disabled with a note when the host has no swap:
   without it there is no anon reclaim to drive.

 - compactor: writes to /proc/sys/vm/compact_memory in a loop. Compaction
   isolates and migrates folios, so it competes with a collapse for the
   very pages it is trying to gather, with transient refcount elevations
   and migration entries of its own.

Assisted-by: Claude-Code:claude-opus-5
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 tools/testing/selftests/mm/khugepaged_race.c | 109 ++++++++++++++++++-
 tools/testing/selftests/mm/run_vmtests.sh    |   2 +
 2 files changed, 107 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/mm/khugepaged_race.c b/tools/testing/selftests/mm/khugepaged_race.c
index 2e36e242caa7..304c72b4ee3c 100644
--- a/tools/testing/selftests/mm/khugepaged_race.c
+++ b/tools/testing/selftests/mm/khugepaged_race.c
@@ -22,6 +22,12 @@
  * clear, zero-filled copy, install-time pte_none() verify and abort)
  * race the faulters directly.
  *
+ * -p adds memory pressure to any of the above: MADV_PAGEOUT cycling
+ * on a dedicated neighbor region (swap traffic and LRU churn; skipped
+ * with a note when the host has no swap) and a compact_memory trigger
+ * loop (compaction migrates source folios, racing collapse's freeze
+ * with refcount elevation and migration entries of its own).
+ *
  * Correctness signals: every racing page must read as its pattern or
  * zero (MADV_DONTNEED), never anything else — checked continuously by
  * the faulters and the fork children and once at the end — plus
@@ -64,6 +70,8 @@ static unsigned long page_size;
 static char *region;		/* NR_AREAS * hpage_pmd_size */
 static char *mremap_area;	/* region + NR_SHARED_AREAS areas */
 static char *mremap_scratch;	/* well above the region */
+static char *pageout_area;	/* -p: dedicated pressure region */
+static size_t pageout_size;
 static int gup_fd = -1;
 static volatile int stop;
 static volatile int corrupted;
@@ -189,6 +197,70 @@ static void *mremapper_fn(void *arg)
 	return NULL;
 }
 
+/*
+ * -p: swap traffic and LRU churn on a region of our own. The content
+ * check is exact — a page out and back through swap must preserve the
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
+/* -p: compaction migrates the collapse sources out from under us. */
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
@@ -200,8 +272,9 @@ static unsigned long now_ms(void)
 static void usage(void)
 {
 	fprintf(stderr,
-		"Usage: khugepaged_race [-d seconds] [-m stepped|free|madvise] [-z] [-a areas]\n"
+		"Usage: khugepaged_race [-d seconds] [-m stepped|free|madvise] [-z] [-p] [-a areas]\n"
 		"\t-z: permissive max_ptes_none (hole-heavy windows)\n"
+		"\t-p: memory pressure (pageout + compaction) threads\n"
 		"\t-a: number of shared PMD-sized playground areas (default 3)\n");
 	exit(1);
 }
@@ -210,12 +283,13 @@ int main(int argc, char **argv)
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
+	const unsigned long pageout_bit = 1UL << 6, compactor_bit = 1UL << 7;
 	const int nr_threads = ARRAY_SIZE(thread_names);
 	pthread_t threads[ARRAY_SIZE(thread_names)];
 	const char *mode = "stepped";
@@ -225,11 +299,12 @@ int main(int argc, char **argv)
 	unsigned long thread_mask = ~0UL;
 	int nr_areas_arg = 0;
 	bool permissive_none = false;
+	bool pressure = false;
 	unsigned long i;
 	int steps = 0;
 	int opt;
 
-	while ((opt = getopt(argc, argv, "a:d:m:t:zh")) != -1) {
+	while ((opt = getopt(argc, argv, "a:d:m:t:zph")) != -1) {
 		switch (opt) {
 		case 'a':
 			nr_areas_arg = atoi(optarg);
@@ -247,6 +322,9 @@ int main(int argc, char **argv)
 		case 'z':
 			permissive_none = true;
 			break;
+		case 'p':
+			pressure = true;
+			break;
 		default:
 			usage();
 		}
@@ -271,6 +349,14 @@ int main(int argc, char **argv)
 	nr_shared_areas = nr_areas_arg > 0 ? nr_areas_arg : DEFAULT_SHARED_AREAS;
 	nr_areas = nr_shared_areas + 1;
 
+	if (!pressure) {
+		thread_mask &= ~(pageout_bit | compactor_bit);
+	} else if (!swap_available()) {
+		/* No swap, no anon reclaim: compaction-only pressure. */
+		ksft_print_msg("-p without swap: pageout thread disabled\n");
+		thread_mask &= ~pageout_bit;
+	}
+
 	ksft_set_plan(1);
 
 	thp_save_settings();
@@ -311,6 +397,21 @@ int main(int argc, char **argv)
 	mremap_area = region + nr_shared_areas * hpage_pmd_size;
 	mremap_scratch = (char *)BASE_ADDR + 2 * nr_areas * hpage_pmd_size;
 
+	if (thread_mask & pageout_bit) {
+		/*
+		 * Big enough to cycle real reclaim, small enough not to
+		 * dominate a TCG guest: 4 PMD areas, clamped to [16M, 64M].
+		 */
+		pageout_size = 4 * hpage_pmd_size;
+		pageout_size = pageout_size < (16UL << 20) ? (16UL << 20) :
+			       pageout_size > (64UL << 20) ? (64UL << 20) :
+			       pageout_size;
+		pageout_area = mmap(NULL, pageout_size, PROT_READ | PROT_WRITE,
+				    MAP_ANONYMOUS | MAP_PRIVATE, -1, 0);
+		if (pageout_area == MAP_FAILED)
+			ksft_exit_fail_perror("mmap() pageout area");
+	}
+
 	/* Populate so the first pass has something to collapse. */
 	for (i = 0; i < nr_shared_areas * hpage_pmd_size / page_size; i++)
 		*(unsigned int *)(region + i * page_size) = pattern(i);
diff --git a/tools/testing/selftests/mm/run_vmtests.sh b/tools/testing/selftests/mm/run_vmtests.sh
index 83a04b1e2520..f826cf940c3d 100755
--- a/tools/testing/selftests/mm/run_vmtests.sh
+++ b/tools/testing/selftests/mm/run_vmtests.sh
@@ -415,6 +415,8 @@ CATEGORY="thp" run_test ./khugepaged_race -d 5 -m madvise
 
 CATEGORY="thp" run_test ./khugepaged_race -d 5 -m stepped -z
 
+CATEGORY="thp" run_test ./khugepaged_race -d 5 -m stepped -p
+
 CATEGORY="thp" run_test ./khugepaged
 
 CATEGORY="thp" run_test ./khugepaged -s 2
-- 
2.54.0

