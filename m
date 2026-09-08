Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3B915476DF;
	Tue,  8 Sep 2026 12:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788871904; cv=none; b=nvA1ByVH5NIEcIQ7Oaqq8dm2P/6Fa6OWE6t15VnTsdUGTTqZtAcKo6ZJOKi8WhLdgbr0FYI0TfBlKerCJNQ0KquPFLEf4N+YA+o39FNBkM6TbgruDtC8k746QqxqmnPF2bxpl9POr+wCBCr+XCNChpxjWy3a8fW3BFBkXYhQ3rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788871904; c=relaxed/simple;
	bh=V42j0iX5pAWRXUMVVjzxfFEweY9WC13kbOlvn11gMYM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xb2DO9X67LljduibUQfQEozKVnDT8KwJD1XDLcRo+OIV74PyCSEg+DApp+PdxbJTpJj77thOoS4CNVtZ6lKPVX5WdjrBcV99MJ1mfkiKnbT+yFvWRtTdiML8kQJkuOLMHNJDdqGFJfxCKGWFQY/Es/BQHIjRcZgsJi1aIMbcKjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=YcoMIY5j; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=fqFNXSfR; arc=none smtp.client-ip=103.168.172.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="YcoMIY5j";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="fqFNXSfR"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.phl.internal (Postfix) with ESMTP id E44D11400067;
	Tue,  8 Sep 2026 08:51:40 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Tue, 08 Sep 2026 08:51:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1788871900; x=
	1788958300; bh=CZILZvAOGMjI41LtAL9Wja/r36L/47O7Yom6FYG5W74=; b=Y
	coMIY5jDzpE+KozJjskv28NmyDqqWiuYlVmDid/8n5cqvaLGv170vm8yXGEeFQH7
	rj4NhyH+344fnqST65AmGAHJ7XMVmMyni8rTtY9Hs3yWG//iUxeYPpH+zuGYP2RS
	ls5GQVLnP/xMXm0RmpF1uHCtpMHXM2s8kM7nDbeXSDcmHVEyNYvUabWZKsYNMlVW
	a3/gDJ0wIslM39j8+ub+Bf791DjaxhCNZbjV5GvYrZ3FupuRb/vXb7FQuY5/vEeM
	CtqbFC6RZzkC9nM0RjJj1GpDsl5JaLAW7VwtvmT9Ei3e0oqqMUvgpPgZ4cERMK+9
	GDlHvylMtiagzmuKZyh4g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1788871900; x=1788958300; bh=C
	ZILZvAOGMjI41LtAL9Wja/r36L/47O7Yom6FYG5W74=; b=fqFNXSfRvbyByfW+0
	TBviz3SLNeyttmM5UidxN627rG+HUtl4TAuM/NZEAExGehxhybdtjwjCadZtVz0D
	C3sxB7JMST/u8j2jsVxGIR7Bs94p1TZeKfa8MKm82o5zqaXSAyiCBNpM221QxHVy
	NY+bdxcRWbfqvdenSmxnCthdp40UTK8h594rIColX3VO1sxcp6iysNdzQ/6w58/a
	fztkrhrTS3TYDA5KDIWlq3ZPYzyIzIIEYJ1z4lkqMJxfyrEuGZopb6K+qLY5kAlj
	Jur2DCK81+bxVlJZpUBScTR5T+XrPuz/z0UY8FAXO4MWAw2Sf6gB+1TNI1HGMMKY
	iDxDw==
X-ME-Sender: <xms:3ASgalt54a6a51s9elOhAwQkUVzM0mabESoG_GNscMOm8-Cb24VnMg>
    <xme:3ASgam0GMT3VTQGv59yIwO3HTNj98OED608oajNEH5ZcMsODSBpjQh-owBN48KtYw
    jBtsh3l70X8q4gGono29LxAuPcuZIl-x0e7z87tryJWC9e05t5iYEE>
X-ME-Received: <xmr:3ASgaq8C5rYKrmNGyAkH_2TMebXWh2nyO8l6mN6ALuAO_GxT9u5D1IEeSFQ>
X-ME-Proxy-Cause: dmFkZTG2QNbEXtfY0NUH9lclFg4+7JIhiWYHukGkvnVSObSRwNQg1Sx7FYcKV3VpQKoNMX
    4WQF58dhUXXs244+umMEX9jrGkMDwRzzMVgLkyqRYe3luiAtSdPaAslf0s6HAW42eLUNv6
    Yph1/7mYlVaPCfn2xuWU60bwW6XHYPjfiiyNarJsdoAUaCUYZV71ky6dHMPGvGVuM8xvW4
    m6EUOqtp7REAN37ZPBvE9zNKgCyv7ortpG0xd0B3rAc4044T4WY38XKdTr44RA10FWmQd5
    JtVQe6/NLKa8+LTeK9YofjDIdR1CHuwVtlVlxJps7ZJJl3uGOhbQDTam1VDoGFqiJQ2gBw
    3q0E4E8u/jFr3S2c7E8fpFGFLDLMP3UAVobp3kB7y+xUXlgv7Z+2RqgABE8sredu+CQLcX
    XkiT66AHNKtEqpidCF9nsBxMHPCBST8FEqrwWcSZc9FQmMoVi6ETcSbc4IcLSJMQ82xat9
    3YxaeeRohVrx9KRjilfhhEaMQgyrDOaVXfOqdvzufo9JXFYYpO+2meAnW/G56EO2tMqHrh
    lLlK3gnVYRIvLDcHQqtdIXOa2qrkh4AwIaDT56h7SVI+NkHXPlOtVrpr4C2/d1hWgqCj9M
    liknTVqmIy9s8xPcKprZNA9EpzGNArecNC+dd5MqMB9OZYPjzwp5fVIbmRbw
X-ME-Proxy: <xmx:3ASgakCQCrPgAoHh8mAbSuVVqLsXiMR-AmiMbNXUudAvybOzdNyrUg>
    <xmx:3ASgaoBU6n1qrbN7cJ8vckNzNgN_Kztw6SVF4alWVzHvLXduceOiOA>
    <xmx:3ASgasJZwE4LjIdXFnVfDlx77KJspOgqidnGk978sEN6Y-OU6-d9wg>
    <xmx:3ASgaqQtVPcCudybD9yrOrpaEAIE1Q2XeRPIt3kXsiCWztQNo9OWxA>
    <xmx:3ASgamgo-ssYphzH1bzkHwu7MQt7Bmy__kHNdQguMIsUdI2Ym16pKst2>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 8 Sep 2026 08:51:40 -0400 (EDT)
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
Subject: [PATCH v5 15/19] selftests/mm: check that one khugepaged pass collapses one window
Date: Tue,  8 Sep 2026 13:51:01 +0100
Message-ID: <20260908125105.1510704-16-kirill@shutemov.name>
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

khugepaged_full_pass() drives the daemon through sysfs: a store to
scan_sleep_millisecs wakes it, and full_scans advancing by two marks one
pass that started after setup.  Every mTHP collapse result in the suite
rests on that pair, and nothing checks it.

Add khugepaged_sync_check.  Each step:

  - prepare one aligned window
  - record its source PFNs from pagemap
  - run one khugepaged_full_pass() barrier
  - require the window came out collapsed, with exactly one collapse
    attempt attributed to it

The anon events carry no virtual address, so an attempt is matched by the
source folio PFN and order that the mm_collapse_huge_page_isolate
tracepoint reports.

Reading the trace buffer takes four small helpers in vm_util: open an
event subsystem's enable file, flip it, clear the buffer, and open it for
reading.

scan_sleep_millisecs is set to a minute, so a step that took a sleep
instead of a wake would blow the budget.

Passes 5/5 on x86-64 4K and arm64 64K.

Assisted-by: LLM
Tested-by: Muhammad Usama Anjum <usama.anjum@arm.com>
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 tools/testing/selftests/mm/Makefile           |   1 +
 .../selftests/mm/khugepaged_sync_check.c      | 179 ++++++++++++++++++
 tools/testing/selftests/mm/run_vmtests.sh     |   2 +
 tools/testing/selftests/mm/vm_util.c          |  38 ++++
 tools/testing/selftests/mm/vm_util.h          |   4 +
 5 files changed, 224 insertions(+)
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
index 000000000000..1c1b942ac325
--- /dev/null
+++ b/tools/testing/selftests/mm/khugepaged_sync_check.c
@@ -0,0 +1,179 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Check that khugepaged_full_pass() drives khugepaged in step: one barrier
+ * over one prepared window must collapse it with exactly one collapse
+ * attempt attributed to its source pages, step after step.
+ *
+ * scan_sleep_millisecs is a minute so that a step which slept instead of
+ * being woken blows the budget.
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
+/* Smallest order khugepaged considers */
+#define TARGET_ORDER 2
+#define NR_ITERATIONS 5
+#define PASS_TIMEOUT_S 30
+
+static int pagemap_fd;
+static int kpageflags_fd;
+static int trace_events_fd = -1;
+static unsigned long hpage_pmd_size;
+
+/*
+ * The events are system-wide: switch them off however the test ends,
+ * including from inside a helper that gives up.
+ */
+static void trace_events_off(void)
+{
+	if (trace_events_fd >= 0)
+		tracing_events_enable(trace_events_fd, false);
+}
+
+/* Count the isolate events whose scan_pfn is one of the window's source PFNs */
+static int count_attributed(unsigned long *pfns, int nr_pfns,
+			    unsigned int order)
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
+		unsigned long val;
+		unsigned int ord;
+		char *s, *o;
+		int i;
+
+		s = strstr(line, "mm_collapse_huge_page_isolate:");
+		if (!s)
+			continue;
+		if (sscanf(s, "mm_collapse_huge_page_isolate: scan_pfn=0x%lx",
+			   &val) != 1)
+			continue;
+		o = strstr(s, "order=");
+		if (!o || sscanf(o, "order=%u", &ord) != 1 || ord != order)
+			continue;
+		for (i = 0; i < nr_pfns; i++) {
+			if (val == pfns[i]) {
+				count++;
+				break;
+			}
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
+	for (i = 0; i < nr_pages; i++) {
+		p[i * getpagesize()] = i + 1;
+		pfns[i] = pagemap_get_pfn(pagemap_fd, p + i * getpagesize());
+		if (pfns[i] == -1UL)
+			ksft_exit_fail_msg("Source page not present\n");
+	}
+
+	/* Clear before enabling so the buffer holds only this step's events */
+	if (tracing_clear_trace())
+		ksft_exit_fail_msg("Cannot clear the trace buffer\n");
+	if (tracing_events_enable(trace_events_fd, true))
+		ksft_exit_fail_msg("Cannot enable huge_memory events\n");
+
+	if (madvise(p, hpage_pmd_size, MADV_HUGEPAGE))
+		ksft_exit_fail_perror("madvise(MADV_HUGEPAGE)");
+	passed = khugepaged_full_pass(PASS_TIMEOUT_S);
+
+	/* Off before anything that can give up: the events are system-wide */
+	if (tracing_events_enable(trace_events_fd, false))
+		ksft_exit_fail_msg("Cannot disable huge_memory events\n");
+	if (!passed)
+		ksft_exit_fail_msg("khugepaged did not complete a full pass\n");
+
+	collapsed = is_range_backed_by_order(p, window, TARGET_ORDER,
+					     pagemap_fd, kpageflags_fd);
+	attributed = count_attributed(pfns, nr_pages, TARGET_ORDER);
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
+		ksft_exit_skip("open(/proc/kpageflags) requires root\n");
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
+	settings.khugepaged.scan_sleep_millisecs = 60 * 1000;
+	settings.khugepaged.alloc_sleep_millisecs = 60 * 1000;
+	settings.khugepaged.max_ptes_none = (hpage_pmd_size / getpagesize()) - 1;
+	/* One wake must complete one full pass; see khugepaged_full_pass() */
+	settings.khugepaged.pages_to_scan = 1UL << 24;
+	for (i = 0; i < NR_ORDERS; i++)
+		settings.hugepages[i].enabled = THP_NEVER;
+	settings.hugepages[TARGET_ORDER].enabled = THP_INHERIT;
+	/* Base of the settings stack; the bottom entry is never popped */
+	thp_push_settings(&settings);
+
+	for (i = 0; i < NR_ITERATIONS; i++)
+		one_step(i);
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
index 4947612e8b3d..af8324e1e8f2 100644
--- a/tools/testing/selftests/mm/vm_util.c
+++ b/tools/testing/selftests/mm/vm_util.c
@@ -599,6 +599,44 @@ bool is_range_backed_by_order(char *start, size_t len, int order,
 	return true;
 }
 
+#define TRACEFS_ROOT "/sys/kernel/tracing"
+
+/*
+ * Returns -1 without tracefs or the subsystem.  The events are system-wide:
+ * whoever switches them on has to switch them off again, on every exit path.
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
+/* Drop what the trace buffer holds so far */
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
index 3be430e01901..5a91b9676ec5 100644
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

