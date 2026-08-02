Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68F59342146;
	Sun,  2 Aug 2026 19:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785700394; cv=none; b=Z36cSxJsuMrhVbNM0m7tLtDhorh/t1gpiN6g+xNjTwcjR+cZsR0mRi/Koi3NYvM5E7ozJq3oH5bNTQ7cbvUpVaQh10vvES8qualEiWsjPrEvea+38Rj3pCQF3Z5E4QoPSNVOCly01pEcYw2rqe2ro8abKpjutkgDCXtLgg8PzXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785700394; c=relaxed/simple;
	bh=Mcwo4RSGfK8wgm54cuDrDDihLstb3SBDQiNEWcNjCP0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ob37BJfS83axUEZjjlFxCtFmyZR8WeoB12aT4B9+q+lv9R0T1jjNYbG3DKdEFThTZVSHB2VC3sttjYSeKttnAbuc8L4Eak3i42lR7rR5IzMXb36aIIOhoh9Rr6c24Gxe10CZCF1Qqm/e3JK/Hj/zZBxG5sJhFsi1N7s6XvEt+H4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=Wli25CZf; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=jkkO2faS; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="Wli25CZf";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="jkkO2faS"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id B3673EC0098;
	Sun,  2 Aug 2026 15:53:11 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Sun, 02 Aug 2026 15:53:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm1;
	 t=1785700391; x=1785786791; bh=1WPM1DppkjKUgv0LPs11qP7SdNGZ55iE
	+fQR3xyAJ80=; b=Wli25CZfPZBdyUYeoHkMI6Vi/yyR0o4PVljO+K7aBBweqAKH
	vy4pt1FgkR5HHC28Sut7skVWp6hyML2cALp6sIb+AEAG7paGH9R/yKcOIgSMxFeS
	X2D0UfS+AsCbIROcqqYrfZPNsqRRG9z1WXaL43AdT9pM1fgJdo4Nvi4p2ngdG5ri
	xQWOi8nbDcGerKmTHb793NaaU9ti9UHrkqgKz88eEKoZDCRwCNFIdt4gAsgQ0WQX
	crMqCdzlwhteHTPuMrI4nUGFD3C/NGONv/d6BCIbqjxUL9otW288ktDN23UfjDty
	/QiMH0zGyHvogQdmfGb3yLo3nLIzIPnlQQnx3w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1785700391; x=
	1785786791; bh=1WPM1DppkjKUgv0LPs11qP7SdNGZ55iE+fQR3xyAJ80=; b=j
	kkO2faSH2qqbw+T00QbtAO4xgPflQrLgoP/jfVuvCI/JzosxCvugK+gG0WRa1ylj
	56Axndz04/lrJsVHMXezyCzcrCwRnRn4+pT2bMfRzJwCZqhCALMpmLGDFRKvWMLw
	fecC31hR0rY2Fu/FREdUIbHiaOvzoKlIfBq1UlPUW6QYku6t3L9aRXYHwnYaUuHX
	1+0A3nm66TvNVO69Tw0XCPL3d4SOLoPCj7xCYJVausQiI2lGCt0IhUwsJ3REYWQ8
	zFwHJ8DC68oL6N/oj2blWOBZ/pzo4DOulbVXM2c7fhiOTBENUZvxJipgGUBq5P4M
	fNCxabwMllF5ylrIfZ9Lw==
X-ME-Sender: <xms:J6BvahdyZ1Z0qbKr44sYmiMCHEch0_di3GVfGYwhDEMuArrnZiHlKA>
    <xme:J6Bvapvle4Sw_gJPuG4kjaDJzNRrWYzSaRJ0fEBI7xcG3cQq7XbM9rpfGbnSfwiAz
    z_CT5QY5M9ipkI7B_P0TRuvo2j1uZRJI9aMFJg7yRv6j4Jo_gxtKII>
X-ME-Received: <xmr:J6BvaneiExRAj_AZpfIdrTEbcowUduzT_pscTnRIyhTiP56GglK3jWlkfwg>
X-ME-Proxy-Cause: dmFkZTF0jcSSKFGDg2KrIu5c43P4SsiipwcvDQBe+CHxos2n8PFgvSXAdv5YVW583HVAOz
    W5evq6qe09LpHqloXNM1K7VWF721j2bpam5IryqVMcYz9qouNwbpBEKv3Y5gifbeJAqW/Q
    YZQrbB51yLEk86mWZaGZ1Drq0Xy949i11wvFP7mkSWE3f4+XiyFqs+bTi+V6AVpUjNMMFr
    yeY2fCKzWlrX4GavSe/JRyGqxABGArlOuRBA0IP4mMA1yNK8fSDYGTdjzDrtr8AjwNqVIi
    3BcHDiClTVSc/WD5f6J8XCsMYF+6dE+0Mr4gWnl6eMmh6FUU5GqCPEjsceh07AxGuRDdN+
    Mp3rzXyvTq+D0mEH5/Ucwuk1nG5jG3LFCFh30C0hEnfxRqaW+SrVC9nZQIVO1yWvGsXy9F
    r+nirxscbPhY67oKZa+lnbjq6d7SRR4ufPvzjKUEzGg7cxqAud2bfbq9sI5eoES8VJujED
    W6CgeZrF7vP4Z+MCGj+D+rXtWwOEiUkBy4spPxX3ShPUPosw0Cq/im07TlCwQgFT6VDqIL
    f8N7nijDyr6xCe8fXjY8DMvjYzCvkkh7x0DLLodIBHzNzBf4K4C6P0K+M1TesMrsICNIZo
    wfJLuZBVgQ5R7ie8ivhbe8NDc5pkn4wjFjqY1etOwigorFvV2gRqfYlnXQyQ
X-ME-Proxy: <xmx:J6Bvatrdc0MZ66-DzBzwlFyWGfWYv2j1NII_V5-6MSI86-N9qrrSPg>
    <xmx:J6Bval-VXTc94xGLiwqgQcSPnGfPeQNpCEhGw1YeQG3up0hIJtzTyQ>
    <xmx:J6Bvam5K2NKG1GtC4-x83lr6NbaCOIeEWUDr--rTQu58EW4_6tPy_A>
    <xmx:J6Bvanj9FRLFGp2SMGRQR9DZCGO6NII2iZQ7SpJ8_x02pCFrYRhMFg>
    <xmx:J6BvalX9NCcC5kfDItu38cQISPYpFXyInvdGjBANVlgGurUFxrYkjWdT>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 2 Aug 2026 15:53:10 -0400 (EDT)
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
Subject: [PATCH 06/16] selftests/mm: add khugepaged race harness
Date: Sun,  2 Aug 2026 20:52:38 +0100
Message-ID: <20260802195254.1937477-7-kirill@shutemov.name>
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

Collapse serializes against faults, GUP, fork, mremap and zapping
through a protocol of locks, TLB flushes and refcount checks; none of
the khugepaged selftests exercise it under contention.

Add khugepaged_race: two faulters, MADV_DONTNEED, transient FOLL_PIN
(gup_test), fork and mremap threads race one of three collapse
drivers over the same ranges:

  stepped   khugepaged driven one full pass at a time via
            khugepaged_full_pass() — deterministic extent per step;
  free      free-running khugepaged (scan_sleep_millisecs=0) — soak;
  madvise   MADV_COLLAPSE + MADV_DONTNEED loop — the PMD-order axis.

All anon THP orders are enabled (inherit) and max_ptes_none is 0, so
a window collapses only once fully populated; the racing
MADV_DONTNEED then steers selection across orders as pages come
and go. Every racing page must
read as its pattern or zero, never anything else — checked
continuously by the faulters and fork children, and in a final sweep.
The kernel-side assertions (DEBUG_VM, page_table_check, KASAN,
lockdep) are the other half of the oracle; runners should inspect
dmesg.

The racing threads share three PMD-sized areas by default, plus one
owned by the mremap thread; -a overrides the count for
memory-constrained or emulated hosts, where a 512M PMD (arm64/64K)
makes the default playground multi-gigabyte.

Short runs are wired into run_vmtests.sh; soak length is -d.

Assisted-by: Claude-Code:claude-opus-5
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 tools/testing/selftests/mm/.gitignore        |   1 +
 tools/testing/selftests/mm/Makefile          |   1 +
 tools/testing/selftests/mm/khugepaged_race.c | 354 +++++++++++++++++++
 tools/testing/selftests/mm/run_vmtests.sh    |   7 +
 4 files changed, 363 insertions(+)
 create mode 100644 tools/testing/selftests/mm/khugepaged_race.c

diff --git a/tools/testing/selftests/mm/.gitignore b/tools/testing/selftests/mm/.gitignore
index 54eefd8f97bc..b3b26447cd23 100644
--- a/tools/testing/selftests/mm/.gitignore
+++ b/tools/testing/selftests/mm/.gitignore
@@ -67,3 +67,4 @@ prctl_thp_disable
 rmap
 folio_split_race_test
 folio_order_check
+khugepaged_race
diff --git a/tools/testing/selftests/mm/Makefile b/tools/testing/selftests/mm/Makefile
index 33917c76b871..046bae8d1eff 100644
--- a/tools/testing/selftests/mm/Makefile
+++ b/tools/testing/selftests/mm/Makefile
@@ -105,6 +105,7 @@ TEST_GEN_FILES += merge
 TEST_GEN_FILES += rmap
 TEST_GEN_FILES += folio_split_race_test
 TEST_GEN_FILES += folio_order_check
+TEST_GEN_FILES += khugepaged_race
 
 ifneq ($(ARCH),arm64)
 TEST_GEN_FILES += soft-dirty
diff --git a/tools/testing/selftests/mm/khugepaged_race.c b/tools/testing/selftests/mm/khugepaged_race.c
new file mode 100644
index 000000000000..b586a114e4cd
--- /dev/null
+++ b/tools/testing/selftests/mm/khugepaged_race.c
@@ -0,0 +1,354 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * khugepaged race harness.
+ *
+ * Runs collapse against concurrent faults, transient GUP pins
+ * (gup_test), fork, mremap and MADV_DONTNEED over the same ranges, in
+ * one of three driver modes:
+ *
+ *   stepped	khugepaged, driven synchronously one full pass at a time
+ *		through khugepaged_full_pass() — the primary driver: the
+ *		full scan+collapse path with a deterministic extent per
+ *		step;
+ *   free	free-running khugepaged (scan_sleep_millisecs=0) — the
+ *		soak;
+ *   madvise	MADV_COLLAPSE in a loop — the legacy-PMD regression
+ *		axis.
+ *
+ * All anon THP orders are enabled (inherit) and max_ptes_none is set
+ * mid-range, so the MADV_DONTNEED holes steer selection across orders.
+ *
+ * Correctness signals: every racing page must read as its pattern or
+ * zero (MADV_DONTNEED), never anything else — checked continuously by
+ * the faulters and the fork children and once at the end — plus
+ * whatever DEBUG_VM / page_table_check / KASAN / lockdep report in
+ * dmesg, which the caller is expected to inspect.
+ */
+#define _GNU_SOURCE
+#include <errno.h>
+#include <fcntl.h>
+#include <pthread.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/ioctl.h>
+#include <sys/mman.h>
+#include <sys/time.h>
+#include <sys/wait.h>
+#include <unistd.h>
+
+#include "kselftest.h"
+#include "vm_util.h"
+#include "hugepage_settings.h"
+#include "../../../../mm/gup_test.h"
+
+#define BASE_ADDR	((void *)(1UL << 30))
+/*
+ * Shared playground for faults/pins/fork/dontneed: several PMD-sized
+ * areas the racing threads spread across, plus one area owned by the
+ * mremap thread. More areas means more independent regions collapsing
+ * at once; the default suits a normal machine. On a memory-constrained
+ * host -- or under emulation, where a 512M PMD (arm64/64K) makes the
+ * default playground multi-gigabyte -- pass -a to shrink it.
+ */
+#define DEFAULT_SHARED_AREAS	3
+static int nr_shared_areas;
+static int nr_areas;
+
+static unsigned long hpage_pmd_size;
+static unsigned long page_size;
+static char *region;		/* NR_AREAS * hpage_pmd_size */
+static char *mremap_area;	/* region + NR_SHARED_AREAS areas */
+static char *mremap_scratch;	/* well above the region */
+static int gup_fd = -1;
+static volatile int stop;
+static volatile int corrupted;
+
+static unsigned int pattern(unsigned long page_idx)
+{
+	unsigned int val = (unsigned int)page_idx * 2654435761U;
+
+	return val ? val : 1;	/* never collides with the zero-fill */
+}
+
+static void check_page(unsigned long page_idx)
+{
+	unsigned int val = *(unsigned int *)(region + page_idx * page_size);
+
+	if (val && val != pattern(page_idx)) {
+		corrupted = 1;
+		ksft_print_msg("Corruption at page %lu: %#x != %#x\n",
+			       page_idx, val, pattern(page_idx));
+	}
+}
+
+static unsigned long rand_page(unsigned int *seed)
+{
+	return (unsigned long)rand_r(seed) %
+	       (nr_shared_areas * hpage_pmd_size / page_size);
+}
+
+static void *faulter_fn(void *arg)
+{
+	unsigned int seed = (unsigned long)arg;
+
+	while (!stop) {
+		unsigned long page_idx = rand_page(&seed);
+
+		if (rand_r(&seed) & 1)
+			*(unsigned int *)(region + page_idx * page_size) =
+				pattern(page_idx);
+		else
+			check_page(page_idx);
+	}
+	return NULL;
+}
+
+static void *dontneed_fn(void *arg)
+{
+	unsigned int seed = (unsigned long)arg;
+
+	while (!stop) {
+		unsigned long page_idx = rand_page(&seed);
+		unsigned long nr = 1UL << (rand_r(&seed) % 6);	/* 1..32 pages */
+
+		madvise(region + page_idx * page_size, nr * page_size,
+			MADV_DONTNEED);
+		usleep(rand_r(&seed) % 500);
+	}
+	return NULL;
+}
+
+static void *pinner_fn(void *arg)
+{
+	unsigned int seed = (unsigned long)arg;
+
+	while (!stop) {
+		struct gup_test gup = {};
+		unsigned long page_idx = rand_page(&seed);
+
+		gup.addr = (unsigned long)(region + page_idx * page_size);
+		gup.size = 16 * page_size;
+		gup.nr_pages_per_call = 16;
+		gup.gup_flags = 1;	/* FOLL_WRITE */
+		/* Racing MADV_DONTNEED makes transient failures expected. */
+		ioctl(gup_fd, PIN_FAST_BENCHMARK, &gup);
+		usleep(rand_r(&seed) % 200);
+	}
+	return NULL;
+}
+
+static void *forker_fn(void *arg)
+{
+	unsigned int seed = (unsigned long)arg;
+
+	while (!stop) {
+		pid_t pid = fork();
+
+		if (pid == 0) {
+			for (int i = 0; i < 16; i++)
+				check_page(rand_page(&seed));
+			_exit(corrupted);
+		}
+		if (pid > 0) {
+			int wstatus;
+
+			waitpid(pid, &wstatus, 0);
+			if (WIFEXITED(wstatus) && WEXITSTATUS(wstatus))
+				corrupted = 1;
+		}
+		usleep(rand_r(&seed) % 2000);
+	}
+	return NULL;
+}
+
+static void *mremapper_fn(void *arg)
+{
+	unsigned int seed = (unsigned long)arg;
+
+	while (!stop) {
+		void *p;
+
+		p = mremap(mremap_area, hpage_pmd_size, hpage_pmd_size,
+			   MREMAP_MAYMOVE | MREMAP_FIXED, mremap_scratch);
+		if (p == MAP_FAILED)
+			ksft_exit_fail_perror("mremap() away");
+		for (int i = 0; i < 8; i++)
+			mremap_scratch[(rand_r(&seed) %
+				(hpage_pmd_size / page_size)) * page_size] = 1;
+		p = mremap(mremap_scratch, hpage_pmd_size, hpage_pmd_size,
+			   MREMAP_MAYMOVE | MREMAP_FIXED, mremap_area);
+		if (p == MAP_FAILED)
+			ksft_exit_fail_perror("mremap() back");
+		usleep(rand_r(&seed) % 2000);
+	}
+	return NULL;
+}
+
+static unsigned long now_ms(void)
+{
+	struct timeval tv;
+
+	gettimeofday(&tv, NULL);
+	return tv.tv_sec * 1000UL + tv.tv_usec / 1000;
+}
+
+static void usage(void)
+{
+	fprintf(stderr,
+		"Usage: khugepaged_race [-d seconds] [-m stepped|free|madvise] [-a areas]\n"
+		"\t-a: number of shared PMD-sized playground areas (default 3)\n");
+	exit(1);
+}
+
+int main(int argc, char **argv)
+{
+	static const char * const thread_names[] = {
+		"faulter", "faulter2", "dontneed", "pinner", "forker",
+		"mremapper",
+	};
+	void *(*const thread_fns[])(void *) = {
+		faulter_fn, faulter_fn, dontneed_fn, pinner_fn, forker_fn,
+		mremapper_fn,
+	};
+	const int nr_threads = ARRAY_SIZE(thread_names);
+	pthread_t threads[ARRAY_SIZE(thread_names)];
+	const char *mode = "stepped";
+	struct thp_settings settings;
+	unsigned long end_ms;
+	int duration_s = 10;
+	unsigned long thread_mask = ~0UL;
+	int nr_areas_arg = 0;
+	unsigned long i;
+	int steps = 0;
+	int opt;
+
+	while ((opt = getopt(argc, argv, "a:d:m:t:h")) != -1) {
+		switch (opt) {
+		case 'a':
+			nr_areas_arg = atoi(optarg);
+			break;
+		case 'd':
+			duration_s = atoi(optarg);
+			break;
+		case 'm':
+			mode = optarg;
+			break;
+		case 't':
+			/* debug: bitmask of racing threads to start */
+			thread_mask = strtoul(optarg, NULL, 0);
+			break;
+		default:
+			usage();
+		}
+	}
+	if (strcmp(mode, "stepped") && strcmp(mode, "free") &&
+	    strcmp(mode, "madvise"))
+		usage();
+
+	ksft_print_header();
+	if (!thp_available())
+		ksft_exit_skip("Transparent Hugepages not available\n");
+
+	page_size = getpagesize();
+	hpage_pmd_size = read_pmd_pagesize();
+	if (!hpage_pmd_size)
+		ksft_exit_fail_msg("Reading PMD pagesize failed\n");
+
+	gup_fd = open("/sys/kernel/debug/gup_test", O_RDWR);
+	if (gup_fd < 0)
+		ksft_exit_skip("/sys/kernel/debug/gup_test requires CONFIG_GUP_TEST and root\n");
+
+	nr_shared_areas = nr_areas_arg > 0 ? nr_areas_arg : DEFAULT_SHARED_AREAS;
+	nr_areas = nr_shared_areas + 1;
+
+	ksft_set_plan(1);
+
+	thp_save_settings();
+	thp_read_settings(&settings);
+	settings.thp_enabled = THP_MADVISE;
+	settings.thp_defrag = THP_DEFRAG_ALWAYS;
+	settings.shmem_enabled = SHMEM_NEVER;
+	settings.khugepaged.defrag = 1;
+	settings.khugepaged.scan_sleep_millisecs =
+		strcmp(mode, "free") ? 1000 : 0;
+	settings.khugepaged.alloc_sleep_millisecs = 10;
+	/*
+	 * Strict occupancy: mTHP collapse only supports 0 or
+	 * HPAGE_PMD_NR - 1 and coerces anything else to 0 anyway, and 0
+	 * also keeps khugepaged from burning the whole step in doomed
+	 * PMD-sized allocations on 512M-PMD configs: under racing
+	 * MADV_DONTNEED a fully populated PMD area is rare.
+	 */
+	settings.khugepaged.max_ptes_none = 0;
+	settings.khugepaged.pages_to_scan =
+		nr_areas * (hpage_pmd_size / page_size) * 8;
+	for (i = 0; i < NR_ORDERS; i++) {
+		if (thp_supported_orders() & (1UL << i))
+			settings.hugepages[i].enabled = THP_INHERIT;
+	}
+	/* Base of the settings stack; the bottom entry is never popped. */
+	thp_push_settings(&settings);
+
+	region = mmap(BASE_ADDR, nr_areas * hpage_pmd_size,
+		      PROT_READ | PROT_WRITE, MAP_ANONYMOUS | MAP_PRIVATE,
+		      -1, 0);
+	if (region != BASE_ADDR)
+		ksft_exit_fail_msg("Failed to allocate VMA at %p\n", BASE_ADDR);
+	mremap_area = region + nr_shared_areas * hpage_pmd_size;
+	mremap_scratch = (char *)BASE_ADDR + 2 * nr_areas * hpage_pmd_size;
+
+	/* Populate so the first pass has something to collapse. */
+	for (i = 0; i < nr_shared_areas * hpage_pmd_size / page_size; i++)
+		*(unsigned int *)(region + i * page_size) = pattern(i);
+	memset(mremap_area, 1, hpage_pmd_size);
+	madvise(region, nr_areas * hpage_pmd_size, MADV_HUGEPAGE);
+
+	for (i = 0; i < nr_threads; i++) {
+		if (!(thread_mask & (1UL << i))) {
+			threads[i] = 0;
+			continue;
+		}
+		if (pthread_create(&threads[i], NULL, thread_fns[i],
+				   (void *)(i + 1)))
+			ksft_exit_fail_perror("pthread_create()");
+	}
+
+	end_ms = now_ms() + duration_s * 1000UL;
+	if (!strcmp(mode, "stepped")) {
+		while (now_ms() < end_ms && !corrupted) {
+			if (!khugepaged_full_pass(600))
+				ksft_exit_fail_msg("khugepaged pass timed out\n");
+			steps++;
+		}
+	} else if (!strcmp(mode, "free")) {
+		while (now_ms() < end_ms && !corrupted)
+			usleep(100 * 1000);
+	} else {	/* madvise */
+		while (now_ms() < end_ms && !corrupted) {
+			for (i = 0; i < nr_shared_areas; i++) {
+				madvise(region + i * hpage_pmd_size,
+					hpage_pmd_size, MADV_COLLAPSE);
+			}
+			madvise(region, nr_shared_areas * hpage_pmd_size,
+				MADV_DONTNEED);
+			steps++;
+		}
+	}
+
+	stop = 1;
+	for (i = 0; i < nr_threads; i++) {
+		if (threads[i])
+			pthread_join(threads[i], NULL);
+	}
+
+	/* Final integrity sweep. */
+	for (i = 0; i < nr_shared_areas * hpage_pmd_size / page_size; i++)
+		check_page(i);
+
+	thp_restore_settings();
+
+	ksft_test_result(!corrupted, "%s: %ds, %d steps, no corruption\n",
+			 mode, duration_s, steps);
+	ksft_finished();
+}
diff --git a/tools/testing/selftests/mm/run_vmtests.sh b/tools/testing/selftests/mm/run_vmtests.sh
index 6f42e35b5227..a8b6b839cb97 100755
--- a/tools/testing/selftests/mm/run_vmtests.sh
+++ b/tools/testing/selftests/mm/run_vmtests.sh
@@ -404,6 +404,13 @@ CATEGORY="cow" run_test ./cow
 
 CATEGORY="thp" run_test ./folio_order_check
 
+
+CATEGORY="thp" run_test ./khugepaged_race -d 5 -m stepped
+
+CATEGORY="thp" run_test ./khugepaged_race -d 5 -m free
+
+CATEGORY="thp" run_test ./khugepaged_race -d 5 -m madvise
+
 CATEGORY="thp" run_test ./khugepaged
 
 CATEGORY="thp" run_test ./khugepaged -s 2
-- 
2.54.0

