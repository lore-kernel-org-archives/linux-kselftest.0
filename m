Received: from fhigh-b6-smtp.messagingengine.com (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C37DE472F6C;
	Fri,  7 Aug 2026 11:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786102652; cv=none; b=D3OD464sTnqbeRwXj/uZxgrFgWKWjc+VT4gvtYUHPsKEeIGZCQNKiHR/3AC/d93Pu4A3n2qg8vyhWgYS/VNFeBC1/N0ymVHTUbzHeWRpykA8PX92DIUnIXszmdhLf9dwgumf6c0oBBCThg9PjzCONEh0QxRTjcwoW8ABqLsgiOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786102652; c=relaxed/simple;
	bh=yUZcBoiVopGsKNkpsCC5OH4xXwc0qA8AOnln8opJ+8s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u7TLtvBeXlaN0EikZJaWWoSgvyG8OoYdfRCTAbzSHLy/FVngFa2wAw7vxJByZ0y+bXZzi558JGbPHqKzLRmdbec4HtiLwHSQwPSln2TPQ/InOilY/jkLuMmOiANbvisZr5+KtRKxgH1WWp0pslWYcPvGjOelvpt20KVKlWLvPc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=zSX7pb7X; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=YWAKNyIS; arc=none smtp.client-ip=202.12.124.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="zSX7pb7X";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="YWAKNyIS"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id BB7F77A004F;
	Fri,  7 Aug 2026 07:37:23 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Fri, 07 Aug 2026 07:37:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1786102643; x=
	1786189043; bh=O73xqgElWTRjAuAEasIQOV2g23H+aaWw3pIMG8sIcFk=; b=z
	SX7pb7X/Hd4cG6bFGLFdaLKUtrR76UhlUeLI8oFHBcIlRvg7RYT7Y3Zv1fQJmyUk
	FTAjLBvfO8zlrVcm4sSiblWC6d087F0ShHwkXSpmvT22i1RTw36MLfhaMoc47Dot
	Cffz5JpQbzZ4IHOagsAbcdJdyGcNH5/iYbgB0lHER88a03SfbeoN9USxMPqEr/1X
	KntEONQl6/2t6k77AkLTIWchMWn49/s920jZjazrnWrU7n8BUYFPcWk36QmjnwRD
	ngTsT9FRaMflUBMFw4+Hwbsxwl/B67he0HknP/N3s0tG2hXbfy4D+Oadc/BdIyuU
	oZuXngyo+83RYtJubcrHw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1786102643; x=1786189043; bh=O
	73xqgElWTRjAuAEasIQOV2g23H+aaWw3pIMG8sIcFk=; b=YWAKNyISaDOTeGIM4
	z1wrdYyoArya8DnZ2ka2gv/zNmyligxfIdWKS4iZ2HzWGifKmHA+rU+m88d8jWI8
	fatHGGn29FRFyOX33oyrheN2pNubJZayrF+9pTI4TuS3yoybgIg5YPMuZ67Yu/Aq
	6gzZXx2nTveHMpxVIhS+R9sQXPpbcvBnZhATHRlubpt3RdYph5F2Se0wWF8a0hNO
	VvjiRVR5jhtUBj5XxLmFd5bQtJZVZ6tEx5tjU42GjZQAltENOWHJ946feeEAb7Zt
	WcRiR9f0GI9LRgN7foWlhC4G61bXSmUfBTHpv0jmRf8zU//0bMU4tmOAdSJPmY6Q
	MI+3w==
X-ME-Sender: <xms:c8N1ag_v2FQCd39m7VfqSidFNIdfBzZqoQgQvu5DNeTidZ_Lxvb8xw>
    <xme:c8N1asqKIznh3i1HWHFEXzaY97JHcUEAZa2R7kL0SvpinfRgICmrau0QGJUG6FI2t
    BJuS3O5MGFkUlwOaw2zAosYOL47sQADXL2ImwrO5snDvFeQFt7RSREs>
X-ME-Received: <xmr:c8N1aujTyKmyo4m9hvyWod5nanirBpfUau7HU_tmTUOXWxw53ofNDA-plYo>
X-ME-Proxy-Cause: dmFkZTGUERIwmKnJzNqrmH6VlEmVcWeiClBef7dL76l3JFxgCJIE1wbu/wgjcLR687OyMh
    BQrMCOBv45wH7h3ooBeneK7mWIj7iIytnpxBlgzGmz5SHufCsdgROAqJKtMeokx5eB2AAp
    cXT5mMO8imvID7jHzWhqIClk07P/42mlBI32M882inm3UlyT/GsY3qxbman5/VlsuJS9+T
    F+1+aXRxbMzBOR7RkHQ9dyf5K4OhFzw16ipJCuGwyYR0rlnsi17XpZoH3bdrAT++N0O7xU
    IF8fSnfJTEWFFODGe4CSmBZThmf/6wAYTC6d1nWOkM6O/FhjItWthf5fql0LkcaRcJIWRy
    JL+hFZ/gRMyTy77bn7guBmdAZvK76PZDbgYkLybrKwaNUAwJZRgpJcW4Y1Ta6Bs1FhHCfC
    WNK4ldNl+Sl5ROCrlffbw2Nwk4eNzkvn/GYmoatOXdM5AGssgPqrX4ZRtjnEAJsbpSncI7
    3X5mXHHf239KzDMdwhTKRTejE5fnzoDYmOV1h9bjUTiZMVsuOskqqIDZEe21A1CieBok8o
    pT6kONFMBQYTtNk5qo6dcOQFnVTiSwHUseu1hDWjq9Byeq9hbUTR9dH+XCVi0LEyk41xAU
    YHzV3i7wUi+HL2QmKm60uJy2rOtcdb4TxqNFJBUYVFvJYoO2rPLNr9pSN9YA
X-ME-Proxy: <xmx:c8N1aqC6oLSQhrzef1zlrK3fl4_hrsRmNGg_GztrKalXm73OFkPi5A>
    <xmx:c8N1asuIY-p2081MXt4g3E1DELHwZRPuFSraDtUt5ujEsoaRIro91w>
    <xmx:c8N1ak6ytF1xLjONgwjErD1OAjcanku_GYWztPR9pzTka71WzEdt1g>
    <xmx:c8N1amcl-5GbuoF9tv2N3OZ0wh7lDmWHXB8tRJnrmtqWry-INJtXdA>
    <xmx:c8N1aqwsbKb2rVJ4vqLXOMj-_6q2yubKXoB0q3LJE9qiYZnj4FDpOmHn>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 7 Aug 2026 07:37:23 -0400 (EDT)
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
Subject: [PATCH v2 13/17] selftests/mm: verify synchronous khugepaged driving is attributable
Date: Fri,  7 Aug 2026 12:36:43 +0100
Message-ID: <20260807113647.3744609-14-kirill@shutemov.name>
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

The khugepaged tests attribute outcomes through the huge_memory
tracepoints.  The anon-path events carry no virtual address, but
mm_collapse_huge_page_isolate() reports a source folio PFN and order, and
the test matches those against the PFNs it read from pagemap before the
pass.  An attempt counts from whichever signal fires, so the check does
not depend on which anon tracepoint a kernel emits.

Add small tracefs helpers to vm_util and khugepaged_sync_check: per step,
prepare one aligned window, record its source PFNs, run one
khugepaged_full_pass() barrier, and require the window collapsed with
exactly one attributed attempt.  scan_sleep_millisecs is set high, so the
test only finishes in time if the sysfs store really wakes the daemon.

Passes 5/5 on x86-64 4K and arm64 64K.

Assisted-by: Claude-Code:claude-opus-5
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 tools/testing/selftests/mm/Makefile           |   1 +
 .../selftests/mm/khugepaged_sync_check.c      | 217 ++++++++++++++++++
 tools/testing/selftests/mm/run_vmtests.sh     |   2 +
 tools/testing/selftests/mm/vm_util.c          |  41 ++++
 tools/testing/selftests/mm/vm_util.h          |   4 +
 5 files changed, 265 insertions(+)
 create mode 100644 tools/testing/selftests/mm/khugepaged_sync_check.c

diff --git a/tools/testing/selftests/mm/Makefile b/tools/testing/selftests/mm/Makefile
index 2093fcf6e915..b2d6e5c12934 100644
--- a/tools/testing/selftests/mm/Makefile
+++ b/tools/testing/selftests/mm/Makefile
@@ -105,6 +105,7 @@ TEST_GEN_FILES += merge
 TEST_GEN_FILES += rmap
 TEST_GEN_FILES += folio_split_race_test
 TEST_GEN_FILES += folio_order_check
+TEST_GEN_FILES += khugepaged_sync_check
 
 ifneq ($(ARCH),arm64)
 TEST_GEN_FILES += soft-dirty
diff --git a/tools/testing/selftests/mm/khugepaged_sync_check.c b/tools/testing/selftests/mm/khugepaged_sync_check.c
new file mode 100644
index 000000000000..30d3fb519fb2
--- /dev/null
+++ b/tools/testing/selftests/mm/khugepaged_sync_check.c
@@ -0,0 +1,217 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Synchronous khugepaged driving check.
+ *
+ * Race tests drive khugepaged through the existing sysfs controls: a
+ * store to scan_sleep_millisecs wakes the daemon, and full_scans
+ * advancing by two is a completion barrier for one full pass that
+ * started after setup (khugepaged_full_pass()). Verify the pair gives
+ * deterministic, attributable results: one barrier step over one
+ * prepared window produces exactly one collapse attempt on that
+ * window's source pages (mm_collapse_huge_page_isolate events filtered
+ * by source PFN and order) and the window is collapsed
+ * afterwards, repeatably.
+ *
+ * scan_sleep_millisecs is set to 60s to prove the wake path: without
+ * the wake, one barrier step would sleep multiples of that and blow
+ * the timeout. It also keeps the daemon from free-running between
+ * steps, per the khugepaged_full_pass() discipline.
+ */
+#define _GNU_SOURCE
+#include <fcntl.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/mman.h>
+#include <unistd.h>
+
+#include "kselftest.h"
+#include "vm_util.h"
+#include "hugepage_settings.h"
+
+#define BASE_ADDR ((void *)(1UL << 30))
+#define TARGET_ORDER 2	/* smallest order khugepaged considers */
+#define NR_ITERATIONS 5
+
+static int pagemap_fd;
+static int kpageflags_fd;
+static int trace_events_fd = -1;
+static unsigned long hpage_pmd_size;
+
+/*
+ * Each step switches the events off again, but a helper can still give up
+ * on us in between (a failing sysfs write ends the test from inside
+ * thp_write_num()), and huge_memory events left on are the whole machine's
+ * problem, not this test's.
+ */
+static void trace_events_off(void)
+{
+	if (trace_events_fd >= 0)
+		tracing_events_enable(trace_events_fd, false);
+}
+
+/*
+ * Count collapse attempts attributable to our window: legacy-engine
+ * isolate events whose scan_pfn is one of the window's source PFNs,
+ * plus batch-engine per-candidate install events at the window's
+ * address. Either engine reports exactly once per attempt.
+ */
+static int count_attributed(unsigned long *pfns, int nr_pfns,
+			    unsigned long addr, unsigned int order)
+{
+	char line[1024];
+	int count = 0;
+	FILE *fp;
+
+	fp = tracing_open_trace();
+	if (!fp)
+		ksft_exit_fail_msg("Cannot open trace buffer\n");
+
+	while (fgets(line, sizeof(line), fp)) {
+		char *s;
+		unsigned long val;
+		unsigned int ord;
+		char *o;
+		int i;
+
+		s = strstr(line, "mm_collapse_huge_page_isolate:");
+		if (s) {
+			if (sscanf(s, "mm_collapse_huge_page_isolate: scan_pfn=0x%lx",
+				   &val) != 1)
+				continue;
+			o = strstr(s, "order=");
+			if (!o || sscanf(o, "order=%u", &ord) != 1 ||
+			    ord != order)
+				continue;
+			for (i = 0; i < nr_pfns; i++) {
+				if (val == pfns[i]) {
+					count++;
+					break;
+				}
+			}
+			continue;
+		}
+
+		s = strstr(line, "mm_collapse_candidate:");
+		if (s) {
+			if (!strstr(s, "pass=install") ||
+			    !strstr(s, "result=succeeded"))
+				continue;
+			o = strstr(s, "addr=");
+			if (!o || sscanf(o, "addr=0x%lx", &val) != 1 ||
+			    val != addr)
+				continue;
+			o = strstr(s, "order=");
+			if (!o || sscanf(o, "order=%u", &ord) != 1 ||
+			    ord != order)
+				continue;
+			count++;
+		}
+	}
+	fclose(fp);
+	return count;
+}
+
+static void one_step(int iteration)
+{
+	const size_t window = getpagesize() << TARGET_ORDER;
+	const int nr_pages = 1 << TARGET_ORDER;
+	unsigned long pfns[1 << TARGET_ORDER];
+	bool collapsed, passed;
+	int attributed;
+	char *p;
+	int i;
+
+	p = mmap(BASE_ADDR, hpage_pmd_size, PROT_READ | PROT_WRITE,
+		 MAP_ANONYMOUS | MAP_PRIVATE | MAP_FIXED_NOREPLACE, -1, 0);
+	if (p != BASE_ADDR)
+		ksft_exit_fail_perror("mmap() window");
+
+	/* Prepare one window; record its source PFNs. */
+	for (i = 0; i < nr_pages; i++) {
+		p[i * getpagesize()] = i + 1;
+		pfns[i] = pagemap_get_pfn(pagemap_fd, p + i * getpagesize());
+		if (pfns[i] == -1UL)
+			ksft_exit_fail_msg("Source page not present\n");
+	}
+
+	/* Clear first: with the events still off there is nothing to undo. */
+	if (tracing_clear_trace())
+		ksft_exit_fail_msg("Cannot clear the trace buffer\n");
+	if (tracing_events_enable(trace_events_fd, true))
+		ksft_exit_fail_msg("Cannot enable huge_memory events\n");
+
+	madvise(p, hpage_pmd_size, MADV_HUGEPAGE);
+	/* Wait up to 120 seconds for the pass to complete. */
+	passed = khugepaged_full_pass(120);
+
+	/* Off before anything that can give up: the events are system-wide. */
+	if (tracing_events_enable(trace_events_fd, false))
+		ksft_exit_fail_msg("Cannot disable huge_memory events\n");
+	if (!passed)
+		ksft_exit_fail_msg("khugepaged did not complete a full pass\n");
+
+	collapsed = is_range_backed_by_folio_orders(p, window, TARGET_ORDER,
+						    pagemap_fd, kpageflags_fd);
+	attributed = count_attributed(pfns, nr_pages, (unsigned long)p,
+				      TARGET_ORDER);
+
+	ksft_test_result(collapsed && attributed == 1,
+			 "step %d: window collapsed, %d attributed result(s)\n",
+			 iteration, attributed);
+
+	munmap(p, hpage_pmd_size);
+}
+
+int main(void)
+{
+	struct thp_settings settings;
+	int i;
+
+	ksft_print_header();
+
+	if (!thp_available())
+		ksft_exit_skip("Transparent Hugepages not available\n");
+	if (!(thp_supported_orders() & (1UL << TARGET_ORDER)))
+		ksft_exit_skip("Order %d is not a supported anon THP order\n",
+			       TARGET_ORDER);
+
+	hpage_pmd_size = read_pmd_pagesize();
+	if (!hpage_pmd_size)
+		ksft_exit_fail_msg("Reading PMD pagesize failed\n");
+	pagemap_fd = open("/proc/self/pagemap", O_RDONLY);
+	if (pagemap_fd < 0)
+		ksft_exit_fail_perror("open(/proc/self/pagemap)");
+	kpageflags_fd = open("/proc/kpageflags", O_RDONLY);
+	if (kpageflags_fd < 0)
+		ksft_exit_skip("open(\"/proc/kpageflags\") requires root\n");
+	trace_events_fd = tracing_events_open("huge_memory");
+	if (trace_events_fd < 0)
+		ksft_exit_skip("huge_memory events require tracefs and root\n");
+	atexit(trace_events_off);
+
+	ksft_set_plan(NR_ITERATIONS);
+
+	thp_save_settings();
+	thp_read_settings(&settings);
+	settings.thp_enabled = THP_MADVISE;
+	settings.thp_defrag = THP_DEFRAG_ALWAYS;
+	settings.khugepaged.defrag = 1;
+	settings.khugepaged.scan_sleep_millisecs = 60000;
+	settings.khugepaged.alloc_sleep_millisecs = 60000;
+	settings.khugepaged.max_ptes_none = (hpage_pmd_size / getpagesize()) - 1;
+	/* One wake must complete one full pass; see khugepaged_full_pass(). */
+	settings.khugepaged.pages_to_scan = 1UL << 24;
+	for (i = 0; i < NR_ORDERS; i++)
+		settings.hugepages[i].enabled = THP_NEVER;
+	settings.hugepages[TARGET_ORDER].enabled = THP_INHERIT;
+	/* Base of the settings stack; the bottom entry is never popped. */
+	thp_push_settings(&settings);
+
+	for (i = 0; i < NR_ITERATIONS; i++)
+		one_step(i);
+
+	thp_restore_settings();
+
+	ksft_finished();
+}
diff --git a/tools/testing/selftests/mm/run_vmtests.sh b/tools/testing/selftests/mm/run_vmtests.sh
index 8bf898b71350..c0f69da3fd3b 100755
--- a/tools/testing/selftests/mm/run_vmtests.sh
+++ b/tools/testing/selftests/mm/run_vmtests.sh
@@ -404,6 +404,8 @@ CATEGORY="cow" run_test ./cow
 
 CATEGORY="thp" run_test ./folio_order_check
 
+CATEGORY="thp" run_test ./khugepaged_sync_check
+
 CATEGORY="thp" run_test ./khugepaged
 
 CATEGORY="thp" run_test ./khugepaged -s 2
diff --git a/tools/testing/selftests/mm/vm_util.c b/tools/testing/selftests/mm/vm_util.c
index 3f586f2c3d33..3b2835279d37 100644
--- a/tools/testing/selftests/mm/vm_util.c
+++ b/tools/testing/selftests/mm/vm_util.c
@@ -598,6 +598,47 @@ bool is_range_backed_by_folio_orders(char *start, size_t len, int order,
 	return true;
 }
 
+#define TRACEFS_ROOT "/sys/kernel/tracing"
+
+/*
+ * Open the enable file of one ftrace event subsystem (e.g. "huge_memory").
+ * Returns a descriptor for tracing_events_enable(), or -1 if tracefs or the
+ * subsystem is not there.  The events are system-wide state: whoever
+ * switches them on owns them until it switches them off, including on the
+ * paths where the test gives up.
+ */
+int tracing_events_open(const char *subsys)
+{
+	char path[256];
+
+	snprintf(path, sizeof(path), TRACEFS_ROOT "/events/%s/enable",
+		 subsys);
+	return open(path, O_WRONLY);
+}
+
+int tracing_events_enable(int fd, bool enable)
+{
+	if (pwrite(fd, enable ? "1" : "0", 1, 0) != 1)
+		return -1;
+	return 0;
+}
+
+/* Drop what the trace buffer holds so far. */
+int tracing_clear_trace(void)
+{
+	int fd = open(TRACEFS_ROOT "/trace", O_WRONLY | O_TRUNC);
+
+	if (fd < 0)
+		return -1;
+	close(fd);
+	return 0;
+}
+
+FILE *tracing_open_trace(void)
+{
+	return fopen(TRACEFS_ROOT "/trace", "r");
+}
+
 /* If `ioctls' non-NULL, the allowed ioctls will be returned into the var */
 int uffd_register_with_ioctls(int uffd, void *addr, uint64_t len,
 			      bool miss, bool wp, bool minor, uint64_t *ioctls)
diff --git a/tools/testing/selftests/mm/vm_util.h b/tools/testing/selftests/mm/vm_util.h
index ce05bce4670d..10c7be46e44c 100644
--- a/tools/testing/selftests/mm/vm_util.h
+++ b/tools/testing/selftests/mm/vm_util.h
@@ -119,6 +119,10 @@ int close_procmap(struct procmap_fd *procmap);
 int write_sysfs(const char *file_path, unsigned long val);
 int read_sysfs(const char *file_path, unsigned long *val);
 bool softdirty_supported(void);
+int tracing_events_open(const char *subsys);
+int tracing_events_enable(int fd, bool enable);
+int tracing_clear_trace(void);
+FILE *tracing_open_trace(void);
 
 static inline int open_self_procmap(struct procmap_fd *procmap_out)
 {
-- 
2.54.0

