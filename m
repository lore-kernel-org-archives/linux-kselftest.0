Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3187342B746;
	Fri, 24 Jul 2026 10:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784888715; cv=none; b=A/1dSjorjGQHVJJXPEFTfHT50ehLOzx1YYwbLTKJUgsAZ/7hzmpJpUT6nVGwpj7MjXTmSXj0wmZt784vHZIi2b18mzbzXeUQGkrhzGSKWoeR8/dojr3/SnppSpzZpHyJk4VQw1yDeihfnTfs0lJ+MlLw776uhKSqeBvTF3PiSB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784888715; c=relaxed/simple;
	bh=MakI4ukXwu0PoXIFZ3JJzT172oQaQ64yT7zlKhSuUTw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I6qQDfT2rA+JEOVKewo8abG3bAt3U/SXKtJ/07rXpfYpfc0HgDQU4xQzIRQgFC+3B7qB4psithlPtMn/v3FJWrI/1J9K1y5zQRBmEXQ5UtXp4nfej0Jw5KbFki3+vIiI1gqh+YjcxhyOBlPzk6aba1DHzbkDOJzIZTJRM3NJRZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=RyUi2Q98; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="RyUi2Q98"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 854BA1595;
	Fri, 24 Jul 2026 03:25:08 -0700 (PDT)
Received: from e142334-100.cambridge.arm.com (e142334-100.cambridge.arm.com [10.2.198.93])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 99B2B3F66F;
	Fri, 24 Jul 2026 03:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784888712; bh=MakI4ukXwu0PoXIFZ3JJzT172oQaQ64yT7zlKhSuUTw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RyUi2Q981HswYqVpjbuDTwj78A3tH8i5UuXyjlM507jXF24nM0iAqloacy8W8SZGq
	 Dvyh7DsZXMH6UZa5BzH/h9DKlmHQ75aJzUG5l/zDDHBJHo9mI1AUhOBZZX0jOspoiM
	 1qqdagny8325f26PjfsJ2imrsIsB9FyvfRnyIzsI=
From: Muhammad Usama Anjum <usama.anjum@arm.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Shuah Khan <shuah@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Nico Pache <npache@redhat.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>,
	Lance Yang <lance.yang@linux.dev>,
	Usama Arif <usama.arif@linux.dev>,
	Miaohe Lin <linmiaohe@huawei.com>,
	Naoya Horiguchi <nao.horiguchi@gmail.com>,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sarthak.sharma@arm.com
Cc: Muhammad Usama Anjum <usama.anjum@arm.com>
Subject: [PATCH v2 3/5] selftests/mm: skip khugepaged swap tests without swap
Date: Fri, 24 Jul 2026 11:24:26 +0100
Message-ID: <20260724102431.1199519-4-usama.anjum@arm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260724102431.1199519-1-usama.anjum@arm.com>
References: <20260724102431.1199519-1-usama.anjum@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

collapse_swapin_single_pte and collapse_max_ptes_swap require
MADV_PAGEOUT to replace anonymous pages with swap entries. On swapless
systems there is no backing store with which to create those entries,
so check_swap() reports missing setup rather than broken khugepaged
behavior.

Swapless configurations are common on Android and other constrained
test devices. Failing these cases obscures actionable results from the
rest of the khugepaged suite.

Check /proc/swaps before either swap-dependent case and skip when no
active swap area exists. With swap present, retain the existing
MADV_PAGEOUT and swap-entry assertions unchanged.

Print each existing swapout diagnostic before the prerequisite check
so skip() completes a KTAP diagnostic line instead of emitting an
unprefixed message.

Signed-off-by: Muhammad Usama Anjum <usama.anjum@arm.com>
---
Changes since v1:
- Print swapout diagnostics before reporting no-swap skips.
---
 tools/testing/selftests/mm/khugepaged.c | 38 +++++++++++++++++++++++--
 1 file changed, 36 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/selftests/mm/khugepaged.c
index 10e8dedcb087d..54e888eb48bbc 100644
--- a/tools/testing/selftests/mm/khugepaged.c
+++ b/tools/testing/selftests/mm/khugepaged.c
@@ -100,6 +100,28 @@ static void skip(const char *msg)
 	exit_status = KSFT_SKIP;
 }
 
+static bool is_swap_enabled(void)
+{
+	char buf[MAX_LINE_LENGTH];
+	FILE *file;
+	bool enabled = false;
+
+	file = fopen("/proc/swaps", "r");
+	if (!file)
+		return false;
+
+	if (!fgets(buf, sizeof(buf), file))
+		goto out;
+
+	/* Check for first active swap entry. */
+	if (fgets(buf, sizeof(buf), file))
+		enabled = true;
+
+out:
+	fclose(file);
+	return enabled;
+}
+
 static void save_settings(void)
 {
 	ksft_print_msg("Save THP and khugepaged settings...");
@@ -734,10 +756,16 @@ static void collapse_swapin_single_pte(struct collapse_context *c, struct mem_op
 {
 	void *p;
 
+	ksft_print_msg("Swapout one page...");
+	if (!is_swap_enabled()) {
+		skip("No active swap");
+		ksft_test_result_report(exit_status, "%s\n", __func__);
+		return;
+	}
+
 	p = ops->setup_area(1);
 	ops->fault(p, 0, hpage_pmd_size);
 
-	ksft_print_msg("Swapout one page...");
 	if (madvise(p, page_size, MADV_PAGEOUT))
 		ksft_exit_fail_perror("madvise(MADV_PAGEOUT)");
 	if (check_swap(p, page_size)) {
@@ -760,10 +788,16 @@ static void collapse_max_ptes_swap(struct collapse_context *c, struct mem_ops *o
 	int max_ptes_swap = thp_read_num("khugepaged/max_ptes_swap");
 	void *p;
 
+	ksft_print_msg("Swapout %d of %d pages...", max_ptes_swap + 1, hpage_pmd_nr);
+	if (!is_swap_enabled()) {
+		skip("No active swap");
+		ksft_test_result_report(exit_status, "%s\n", __func__);
+		return;
+	}
+
 	p = ops->setup_area(1);
 	ops->fault(p, 0, hpage_pmd_size);
 
-	ksft_print_msg("Swapout %d of %d pages...", max_ptes_swap + 1, hpage_pmd_nr);
 	if (madvise(p, (max_ptes_swap + 1) * page_size, MADV_PAGEOUT))
 		ksft_exit_fail_perror("madvise(MADV_PAGEOUT)");
 	if (check_swap(p, (max_ptes_swap + 1) * page_size)) {
-- 
2.47.3

