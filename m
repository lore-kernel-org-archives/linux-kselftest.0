Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09CF949D59E
	for <linux-kselftest@vger.kernel.org>; Fri,  9 Oct 2026 15:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791559944; cv=none; b=nvPyHVB9jL8HOQkkOClQRCXr0TZ42f2waUhAwGlNYULXaAp7MDUi8U3jX1TvcXyOmI7Aq1+R0TZCvHZX3RBK7/XIBtHzZ9rqQY+aUmvNopKkLP+bky7RNV2xOe/EY1RkePp0udZmP/hBkdTklHtytDNoVEJ9dCVj+OJSw7baQSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791559944; c=relaxed/simple;
	bh=bGZy9500F/HAMYfXzdTsw36/u8osXU4QccAwJ2PB1Us=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NVtYvKTOCSw4QIWkgAwbuMlgLNYOSerUch1u7QDOFgIr/eCkkUSQrUz9024utl4gHPYdLbzTj8prmSwFEQVMKf9nrY4a0Ng7EedqRKfcSrfwUMPwV66P0Iby35nlYugqoMGTi1u/0a1nVcStJkQh6o9c0IUVMuQmUHMiYtvtBnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=U567um6c; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=BJ0J72vT; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="U567um6c";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="BJ0J72vT"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 456E81400151
	for <linux-kselftest@vger.kernel.org>; Fri,  9 Oct 2026 11:32:21 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Fri, 09 Oct 2026 11:32:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1791559941; x=
	1791646341; bh=BkZBoPR6JWt4b8GGN1UNGsmdiMa89RlUII6ZMvk2f/Y=; b=U
	567um6cCa+lK6XjhmEw30SwpoE2EpyRiZQdSZNhRpEe0tvxCrm0hJB0ptRaac2vL
	WNHNU/74dSH+IfTUcRT9gqG5ObGPs2lzJPAif/VCmq62ycuHvUhG6xZO//CxWL7a
	RtJdUzAfGFw2yZpKR/KrW4cg2rTchGclp5UcYE9389Bqk/LK/od8uEmLADvySgpi
	UNdOUrG5+J1Dae6Q6L9X68xNa7LUCdoo0VwJ5bQN05IM0aLCiSWhq/PiVbcUhVNC
	BmR/gi8AI5RFVfp+LM8rzb6/gt7LLWL/C+R+WOSD2Jk4X91COm/kkr4NF0FxBDx2
	LUeFl8bU2CqregXtW4xbQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1791559941; x=1791646341; bh=B
	kZBoPR6JWt4b8GGN1UNGsmdiMa89RlUII6ZMvk2f/Y=; b=BJ0J72vTA4rmgCt1X
	XXyjJpMYL8YM/PPWctQsqgqeItR7j6VlytAj8Ie/jTMl0o7/s0ZS55j5HIfrn8cg
	CVYOCCZAwMQoG72Nf7WfoNePdOuHYo4ciz/KW5b4UjWVum/G2xJDQsPR5eUG8UYh
	yAmM06vud3yESnmCi5vU5FWyQkS6FEp7i2Kz1lLG0QK8CT0fxgD/vf5X5Y6L1cpJ
	qSquysSzxZyE7vqOuaftnJ/x2GMOjLBeScYn63DlhuDA87ZEXsMG5JQuYf0YG9Hw
	Q4hWAOj6l/QvybrHK/pmkCuIEh6By6YrbnUuyd7Va+X9i57S95yz6KLYzMzQ5deC
	fom6Q==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=sign d=shutemov.name a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791559941; d=shutemov.name;
	mf=PGtpcmlsbEBzaHV0ZW1vdi5uYW1lPg==;
	rt=PGxpbnV4LWtzZWxmdGVzdEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm3:rsa-sha256:bXLPMStJlZHRft1/tXTlv8NFwvNY4fJt6DXz+EAYNZo4M1F
	7/oAjnKT3xgqqRU5wBHEDp3TzwXeQvAsxIP8KFgRElvcDcE0FJ65M+UwNmqIko4u
	1/FRWl+Jk3CsXRVjM0loTvepezSFhZJyeMQ+TeYop7Cm81S7S0acccqi7YcHnXmb
	33kiZa23ebZyT9+UiqdYGY/2wF8TlgSKehMl+63U+JTUZb9mOiqnO7M8wfTuohzz
	D8SJ1EU9cZ3VXV7P5Tb9svIQnSX7Yujv/bpriHG9LUmudwjtwYSljksY/lmHQe1F
	VOC7cQoCiBihhY21sxajA+Ew8zOFUg2PjeT9mTQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:OO58HBTI9on+e6LCtJ0C3CKTTvCNmVDDBaf/zwqb8Vw=:bGZy9500F/HAMYfXzdTsw36/u8osXU4QccAwJ2PB1Us=;
X-ME-Sender: <xms:BQnJageltqoGlh-7tgKqkHk99aiJG49yps2pqfMbuMybyfrz7PWCrw>
    <xme:BQnJaj2VRRKJz1BQxmnnybL1f-qEgd-SH6_ws28DAm-jvLt9LoWnukRgrwkbBOECe
    91z31KkHrYCUUVQAtgnoMCrXJoQwsIQmoo7vQDb7-m6CH2fGYWOtQz3>
X-ME-Received: <xmr:BQnJalk-syxWIxTrFD8hYiiVmTgN4MaA3aDzrxXd5_qYvrIAHru8J83v58w>
X-ME-Proxy-Cause: dmFkZTGIoGBLZMaAhgcaayk5wgp7rW9vayQkfonvs0TKGSEuuYzL1U5eWR8oX+vcbxv0ak
    vZ6V5Fk2n6N+IaumklX1qzBk7r0hEpcbcO59DsZzPQwz0SNLq5ubZVbwk/A0B0ImP1q9S/
    wvMCjtg/pGCexbzTYCAAsFMX+sI9bOrGKjIjV+CjlMDzV5ttTW2+3V5NxcPyUYh3hDVmY6
    5SaA7LVa7G47KypkYvo+NaxjJdB6S0C6Hb2KUpv2JaxJ1DNuAn/rjb2TmQMM/Oo0fomkKJ
    59473bNh2ppMgxEJkQDpXpn3GMfvTNgjovDF8A3Cgd0ETDAPdqWfdTSt6z83qaSG77WHWd
    +xq0hQ3DfsJdRZCyGLp1lY7va+1lbiQn++SE1BnyBi8H3WTymaNgHS1ZQ9XtxibWTv8IYA
    1HGOmL9y4uwmq3PLHKj6IDMEb3hciI4kqnsoJadMbTItTe+dIIosY3c5etKj0bik16I5Nf
    JUtQQnAwbqaOvQSHou7XfnCSp5EISu8t7YoAeThux9lf5/IXBkiQ3RbsvD+hIGpAVTb7fW
    Cm1JOULyNN3TJYDdUKTpo+kelhXlKfoP4wxSsBueENBswcnYaCrytyimM8XHk8S7PvV9H/
    P2obBG6Jn64pW67AK39rCu2BCCo8MbNb3Ujl64uNAlwmptwij5TpEFydHZLQ
X-ME-Proxy: <xmx:BQnJasYoc4BolOQpDHK2pOOidYRtbfTghBbxDG-zyK4e2HnretLZxQ>
    <xmx:BQnJarrcLEBY76gg8PdOn3mxC00zLTLFFikDRzDU4DrtL1ftYdnuGg>
    <xmx:BQnJaqgKMmvtTSx0LKPSWL0vDFxyV4mKebRKx7rvg4zUC3O5nZ-WsQ>
    <xmx:BQnJalyK7XTOqtJgdZNMwGxqqFHBRRvIrLBvE4iFL60w_73Yw5wHwg>
    <xmx:BQnJap_MoP4LDviNe0CLbSSpJlQhr1_VPskCRK-EWesx5-5WOphGEAMf>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 9 Oct 2026 11:32:20 -0400 (EDT)
From: Kiryl Shutsemau <kirill@shutemov.name>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Shuah Khan <shuah@kernel.org>
Cc: "Kiryl Shutsemau (Meta)" <kas@kernel.org>,
	Barry Song <baohua@kernel.org>,
	Dev Jain <dev.jain@arm.com>,
	Lance Yang <lance.yang@linux.dev>,
	"Liam R . Howlett" <liam@infradead.org>,
	Michal Hocko <mhocko@suse.com>,
	Nico Pache <nico.pache@linux.dev>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Usama Arif <usama.arif@linux.dev>,
	Vlastimil Babka <vbabka@kernel.org>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: [PATCH v2 3/4] selftests/mm: check collapse results through check_huge() only
Date: Fri,  9 Oct 2026 16:32:07 +0100
Message-ID: <20261009153210.236517-4-kirill@shutemov.name>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261009153210.236517-1-kirill@shutemov.name>
References: <20261009153210.236517-1-kirill@shutemov.name>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>

khugepaged.c checks collapse results in two ways.  Generic cases go
through the mem_ops check_huge() callback.  collapse_order_* cases call
is_range_backed_by_order() on descriptors of their own.  Baolin Wang
found that confusing.  The split only existed because check_huge()
counted folios instead of windows.

Now that check_huge() checks windows, the two give the same answer.
Use the callback for the collapse_order_* cases and drop the private
descriptors.

Convert khugepaged_sync_check and folio_order_check the same way.  The
latter still checks that each order is detected as that order, not as
the one below and not as order 0, only now through check_huge_anon().
At the PMD order that means the PMD-mapping check rather than the
page-flag walk.

is_range_backed_by_order() has no users outside vm_util.c left.  Make it
static and let it use the cached descriptors.

Assisted-by: LLM
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 .../testing/selftests/mm/folio_order_check.c  | 29 ++++--------
 tools/testing/selftests/mm/khugepaged.c       | 47 ++++++++-----------
 .../selftests/mm/khugepaged_sync_check.c      |  7 +--
 tools/testing/selftests/mm/vm_util.c          | 19 +++-----
 tools/testing/selftests/mm/vm_util.h          |  2 -
 5 files changed, 36 insertions(+), 68 deletions(-)

diff --git a/tools/testing/selftests/mm/folio_order_check.c b/tools/testing/selftests/mm/folio_order_check.c
index 5eafbcc1b4f3..29ec6a0b546a 100644
--- a/tools/testing/selftests/mm/folio_order_check.c
+++ b/tools/testing/selftests/mm/folio_order_check.c
@@ -1,13 +1,11 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Self-check for the vm_util folio-order helpers, is_backed_by_folio() and
- * is_range_backed_by_order(), which the khugepaged mTHP cases use to detect
- * collapse results.  For every anon THP order the kernel supports, fault
- * memory in with only that order enabled and require the helpers to report
- * exactly that order.
+ * Self-check for check_huge_anon(), which the khugepaged mTHP cases use to
+ * tell collapse results.  For every anon THP order the kernel supports,
+ * fault memory in with only that order enabled and require the check to
+ * report exactly that order: not the order below it, and not order 0.
  */
 #define _GNU_SOURCE
-#include <fcntl.h>
 #include <stdio.h>
 #include <stdlib.h>
 #include <sys/mman.h>
@@ -17,9 +15,6 @@
 #include "vm_util.h"
 #include <mm/hugepage_settings.h>
 
-static int pagemap_fd;
-static int kpageflags_fd;
-
 static char *alloc_aligned(size_t size)
 {
 	size_t len = size * 2;
@@ -56,22 +51,20 @@ static void check_order(int order)
 	p = alloc_aligned(size);
 	*p = 1;
 
-	if (!is_range_backed_by_order(p, size, order, pagemap_fd, kpageflags_fd)) {
+	if (!check_huge_anon(p, size, 1, size)) {
 		ksft_print_msg("order %d not detected after fault\n", order);
 		ok = false;
 	}
 
 	/* A lower order must be rejected: the folio is larger */
-	if (order && is_range_backed_by_order(p, size, order - 1,
-					      pagemap_fd, kpageflags_fd)) {
+	if (order && check_huge_anon(p, size, 2, size / 2)) {
 		ksft_print_msg("order %d also reported as order %d\n",
 			       order, order - 1);
 		ok = false;
 	}
 
 	/* A large folio must not pass as order 0 */
-	if (order && is_range_backed_by_order(p, size, 0,
-					      pagemap_fd, kpageflags_fd)) {
+	if (order && check_huge_anon(p, size, 1 << order, psize())) {
 		ksft_print_msg("order %d also reported as order 0\n", order);
 		ok = false;
 	}
@@ -93,12 +86,8 @@ int main(void)
 	if (!thp_available())
 		ksft_exit_skip("Transparent Hugepages not available\n");
 
-	pagemap_fd = open("/proc/self/pagemap", O_RDONLY);
-	if (pagemap_fd < 0)
-		ksft_exit_fail_perror("open(/proc/self/pagemap)");
-	kpageflags_fd = open("/proc/kpageflags", O_RDONLY);
-	if (kpageflags_fd < 0)
-		ksft_exit_skip("open(/proc/kpageflags) requires root\n");
+	if (access("/proc/kpageflags", R_OK))
+		ksft_exit_skip("/proc/kpageflags requires root\n");
 
 	orders = thp_supported_orders();
 	if (!orders)
diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/selftests/mm/khugepaged.c
index 61bd69d604d2..a5b682eca888 100644
--- a/tools/testing/selftests/mm/khugepaged.c
+++ b/tools/testing/selftests/mm/khugepaged.c
@@ -33,8 +33,6 @@ static int collapse_order;
 static bool collapse_order_set;
 static int collapse_orders[NR_ORDERS];
 static int nr_collapse_orders;
-static int pagemap_fd = -1;
-static int kpageflags_fd = -1;
 
 #define PID_SMAPS "/proc/self/smaps"
 #define TEST_FILE "collapse_test_file"
@@ -1330,19 +1328,20 @@ static void mthp_push_target_order(void)
 	thp_push_settings(&settings);
 }
 
-static bool all_windows_at_order(void *p, size_t len)
+static bool all_windows_at_order(struct mem_ops *ops, void *p, size_t len)
 {
-	return is_range_backed_by_order(p, len, collapse_order,
-					pagemap_fd, kpageflags_fd);
+	size_t window = mthp_window_size();
+
+	return ops->check_huge(p, len, len / window, window);
 }
 
-static bool any_window_at_order(void *p, size_t len)
+static bool any_window_at_order(struct mem_ops *ops, void *p, size_t len)
 {
 	size_t window = mthp_window_size();
 	char *addr = p;
 
 	for (; len >= window; addr += window, len -= window) {
-		if (all_windows_at_order(addr, window))
+		if (ops->check_huge(addr, window, 1, window))
 			return true;
 	}
 	return false;
@@ -1358,7 +1357,7 @@ static void collapse_order_single_window(struct collapse_context *c,
 
 	p = ops->setup_area(1);
 	ops->fault(p, window, 2 * window);
-	if (any_window_at_order(p, hpage_pmd_size))
+	if (any_window_at_order(ops, p, hpage_pmd_size))
 		ksft_exit_fail_msg("Unexpected large folio after fault\n");
 
 	if (madvise(p, hpage_pmd_size, MADV_HUGEPAGE))
@@ -1366,9 +1365,9 @@ static void collapse_order_single_window(struct collapse_context *c,
 	ksft_print_msg("Collapse one fully populated window...");
 	if (!khugepaged_full_pass(MTHP_PASS_TIMEOUT_S))
 		fail("Timeout");
-	else if (all_windows_at_order(p + window, window) &&
-		 !any_window_at_order(p, window) &&
-		 !any_window_at_order(p + 2 * window,
+	else if (all_windows_at_order(ops, p + window, window) &&
+		 !any_window_at_order(ops, p, window) &&
+		 !any_window_at_order(ops, p + 2 * window,
 				      hpage_pmd_size - 2 * window))
 		success("OK");
 	else
@@ -1389,7 +1388,7 @@ static void collapse_order_partial_window(struct collapse_context *c,
 
 	p = ops->setup_area(1);
 	ops->fault(p, 0, page_size);
-	if (any_window_at_order(p, hpage_pmd_size))
+	if (any_window_at_order(ops, p, hpage_pmd_size))
 		ksft_exit_fail_msg("Unexpected large folio after fault\n");
 
 	if (madvise(p, hpage_pmd_size, MADV_HUGEPAGE))
@@ -1397,7 +1396,7 @@ static void collapse_order_partial_window(struct collapse_context *c,
 	ksft_print_msg("Collapse window with single PTE entry present...");
 	if (!khugepaged_full_pass(MTHP_PASS_TIMEOUT_S))
 		fail("Timeout");
-	else if (all_windows_at_order(p, mthp_window_size()))
+	else if (all_windows_at_order(ops, p, mthp_window_size()))
 		success("OK");
 	else
 		fail("Fail");
@@ -1422,7 +1421,7 @@ static void collapse_order_max_ptes_none(struct collapse_context *c,
 
 	p = ops->setup_area(1);
 	ops->fault(p, 0, 2 * window - page_size);
-	if (any_window_at_order(p, hpage_pmd_size))
+	if (any_window_at_order(ops, p, hpage_pmd_size))
 		ksft_exit_fail_msg("Unexpected large folio after fault\n");
 
 	if (madvise(p, hpage_pmd_size, MADV_HUGEPAGE))
@@ -1430,8 +1429,8 @@ static void collapse_order_max_ptes_none(struct collapse_context *c,
 	ksft_print_msg("Collapse full window, not the one missing a page...");
 	if (!khugepaged_full_pass(MTHP_PASS_TIMEOUT_S))
 		fail("Timeout");
-	else if (all_windows_at_order(p, window) &&
-		 !any_window_at_order(p + window, window))
+	else if (all_windows_at_order(ops, p, window) &&
+		 !any_window_at_order(ops, p + window, window))
 		success("OK");
 	else
 		fail("Fail");
@@ -1447,6 +1446,7 @@ static void collapse_order_mixed_sources(struct collapse_context *c,
 					 struct mem_ops *ops)
 {
 	int source_order = anon_order ? anon_order : MIN_MTHP_ORDER;
+	size_t source_size = page_size << source_order;
 	struct thp_settings settings;
 	void *p;
 
@@ -1470,8 +1470,8 @@ static void collapse_order_mixed_sources(struct collapse_context *c,
 	 * The allocator can fall back to smaller folios under fragmentation;
 	 * having nothing to collapse from is not a failure.
 	 */
-	if (!is_range_backed_by_order(p, hpage_pmd_size, source_order,
-				      pagemap_fd, kpageflags_fd)) {
+	if (!ops->check_huge(p, hpage_pmd_size, hpage_pmd_size / source_size,
+			     source_size)) {
 		ksft_print_msg("No order-%d sources to collapse...", source_order);
 		skip("Skip");
 		ops->cleanup_area(p, hpage_pmd_size);
@@ -1486,7 +1486,7 @@ static void collapse_order_mixed_sources(struct collapse_context *c,
 		       source_order);
 	if (!khugepaged_full_pass(MTHP_PASS_TIMEOUT_S))
 		fail("Timeout");
-	else if (all_windows_at_order(p, hpage_pmd_size))
+	else if (all_windows_at_order(ops, p, hpage_pmd_size))
 		success("OK");
 	else
 		fail("Fail");
@@ -1715,15 +1715,6 @@ int main(int argc, char **argv)
 		}
 	}
 
-	if (mthp_khugepaged_context) {
-		pagemap_fd = open("/proc/self/pagemap", O_RDONLY);
-		if (pagemap_fd < 0)
-			ksft_exit_fail_perror("open(/proc/self/pagemap)");
-		kpageflags_fd = open("/proc/kpageflags", O_RDONLY);
-		if (kpageflags_fd < 0)
-			ksft_exit_fail_perror("open(/proc/kpageflags)");
-	}
-
 	setbuf(stdout, NULL);
 
 	/*
diff --git a/tools/testing/selftests/mm/khugepaged_sync_check.c b/tools/testing/selftests/mm/khugepaged_sync_check.c
index 28a9b1ff5d44..40cba121a987 100644
--- a/tools/testing/selftests/mm/khugepaged_sync_check.c
+++ b/tools/testing/selftests/mm/khugepaged_sync_check.c
@@ -26,7 +26,6 @@
 #define PASS_TIMEOUT_S 30
 
 static int pagemap_fd;
-static int kpageflags_fd;
 static int trace_events_fd = -1;
 static unsigned long hpage_pmd_size;
 
@@ -116,8 +115,7 @@ static void one_step(int iteration)
 	if (!passed)
 		ksft_exit_fail_msg("khugepaged did not complete a full pass\n");
 
-	collapsed = is_range_backed_by_order(p, window, TARGET_ORDER,
-					     pagemap_fd, kpageflags_fd);
+	collapsed = check_huge_anon(p, window, 1, window);
 	attributed = count_attributed(pfns, nr_pages, TARGET_ORDER);
 
 	ksft_test_result(collapsed && attributed == 1,
@@ -146,9 +144,6 @@ int main(void)
 	pagemap_fd = open("/proc/self/pagemap", O_RDONLY);
 	if (pagemap_fd < 0)
 		ksft_exit_fail_perror("open(/proc/self/pagemap)");
-	kpageflags_fd = open("/proc/kpageflags", O_RDONLY);
-	if (kpageflags_fd < 0)
-		ksft_exit_skip("open(/proc/kpageflags) requires root\n");
 	trace_events_fd = tracing_events_open("huge_memory");
 	if (trace_events_fd < 0)
 		ksft_exit_skip("huge_memory events require tracefs and root\n");
diff --git a/tools/testing/selftests/mm/vm_util.c b/tools/testing/selftests/mm/vm_util.c
index b62e33ad1201..e72bafe63277 100644
--- a/tools/testing/selftests/mm/vm_util.c
+++ b/tools/testing/selftests/mm/vm_util.c
@@ -397,8 +397,6 @@ char *__get_smap_entry(void *addr, const char *pattern, char *buf, size_t len)
  * @start: start of the range, a multiple of the folio size
  * @len: length of the range in bytes, a multiple of the folio size
  * @order: the folio order to check for
- * @pagemap_fd: open /proc/<pid>/pagemap of the range's owner
- * @kpageflags_fd: open /proc/kpageflags
  *
  * Every folio-sized, folio-aligned part of the range must map one folio of
  * @order, head to tail, with the head at the start of the part.  A part
@@ -407,11 +405,12 @@ char *__get_smap_entry(void *addr, const char *pattern, char *buf, size_t len)
  *
  * Returns: true if the whole range is backed that way, false otherwise.
  */
-bool is_range_backed_by_order(char *start, size_t len, int order,
-			      int pagemap_fd, int kpageflags_fd)
+static bool is_range_backed_by_order(char *start, size_t len, int order)
 {
 	const unsigned long nr_pages = 1UL << order;
 	const size_t folio_size = nr_pages * psize();
+	const int pagemap_fd = pagemap_fd_get();
+	const int kpageflags_fd = kpageflags_fd_get();
 	char *vaddr;
 
 	if ((uintptr_t)start % folio_size || len % folio_size)
@@ -444,16 +443,14 @@ bool is_range_backed_by_order(char *start, size_t len, int order,
  * size each, with the folio's head at the window start.  A folio mapped off
  * its alignment or split across two windows counts for neither.
  */
-static int count_windows_at_order(char *start, size_t len, uint64_t hpage_size,
-				  int pagemap_fd, int kpageflags_fd)
+static int count_windows_at_order(char *start, size_t len, uint64_t hpage_size)
 {
 	const int order = sz2ord(hpage_size, psize());
 	int nr_windows = 0;
 	char *addr;
 
 	for (addr = start; addr + hpage_size <= start + len; addr += hpage_size) {
-		if (is_range_backed_by_order(addr, hpage_size, order,
-					     pagemap_fd, kpageflags_fd))
+		if (is_range_backed_by_order(addr, hpage_size, order))
 			nr_windows++;
 	}
 
@@ -482,7 +479,7 @@ static bool check_huge_type(uint64_t categories, enum check_huge_type type)
 static bool __check_huge(void *addr, size_t len, int nr_hpages,
 		uint64_t hpage_size, enum check_huge_type type)
 {
-	int pagemap_fd, kpageflags_fd;
+	int pagemap_fd;
 	int nr_pmd_mappings = 0;
 	uint64_t pmd_pagesize, scan_mapping_size;
 	uint64_t categories;
@@ -501,11 +498,9 @@ static bool __check_huge(void *addr, size_t len, int nr_hpages,
 	allow_nonpresent = (uint64_t)nr_hpages * hpage_size < len;
 
 	pagemap_fd = pagemap_fd_get();
-	kpageflags_fd = kpageflags_fd_get();
 
 	if (!check_pmd_mapping &&
-	    nr_hpages != count_windows_at_order(start, len, hpage_size,
-						pagemap_fd, kpageflags_fd))
+	    nr_hpages != count_windows_at_order(start, len, hpage_size))
 		return false;
 
 	for (; start < end; start += scan_mapping_size) {
diff --git a/tools/testing/selftests/mm/vm_util.h b/tools/testing/selftests/mm/vm_util.h
index b5d59729d432..2bf64d5b42aa 100644
--- a/tools/testing/selftests/mm/vm_util.h
+++ b/tools/testing/selftests/mm/vm_util.h
@@ -102,8 +102,6 @@ int gather_folio_orders(char *vaddr_start, size_t len,
 		int pagemap_fd, int kpageflags_fd, int orders[], int nr_orders);
 bool is_backed_by_folio(char *vaddr, int order, int pagemap_fd,
 			int kpageflags_fd);
-bool is_range_backed_by_order(char *start, size_t len, int order,
-			      int pagemap_fd, int kpageflags_fd);
 
 int uffd_register(int uffd, void *addr, uint64_t len,
 		  bool miss, bool wp, bool minor);
-- 
2.54.0

