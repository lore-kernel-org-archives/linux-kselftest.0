Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.77
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793181710;
	b=EzZzpOq59Uz6tqMMNewLjRNIxtWoEfi7w4y/UvAEMpYdwYXdQdFAwttnB3E3/jAiSRKJ
	 Nhz9J1hzxPjxB37otg7tDas3snMncJWKX6Shpi9E46AFFwFwk9AljrwL8/pNuG1b1uz0f
	 WXy9ymA9cEZeiskO8hfpttrXP8ZIzKTfs7a8fjial5HK7crgOioh4q5WTBx5Ie//7mOCZ
	 mj9incoQH1O/Dai5h3BycijNvjdxODZ7+DlMUofX79siLM+XUjs1tyEQz56zEiOzVEry3
	 KrxyC8f8/vGq/UdolMV8RWP1/Hg1sSJa3n+3T13iJxP14Wrii00hBNRWkf4x3F5uu4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793181710;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=SN+4KpKU4pO0w+hnkVBnVZtVPIWPahdjf4GIcjr94dc=;
	b=R7OGbPA/aOcuIJGSpAuDeK906TBeUunoTnVT7AxG6UqVEoKE5wJ6OUTw6cGXL2103TW+
	 JRuLKbXpt+fFUHF/d53EkPhTHRkqaFiOp2VJMVMmZUV9qRBN/V3RMq/v9f+rj9SR1kpkV
	 l2tYiy+G5ODSTKmx/9Jx1Kwo8oGPlV+7RhhWUfQW+SYLcpBB/qNVJZuuljQ3sKODDxAB6
	 7G3x/VS765HeWaQQyqhii1isW2Vvif9SZVvI+D+BnCMtl5eyWIESzCwY85uSRV1VEbi2Z
	 0rND/src2aZuhqXzZ3WhiFppS5wnF9Lk9vpkGw9RzLJ0AvyWDCYgyh7ntfPh0rUV3Cg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=omwUzGSy;
	arc=none smtp.remote-ip=91.218.175.77
Received: from mta0.migadu.com (out-77.mta0.migadu.com [91.218.175.77])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C890606A31D
	for <linux-kselftest@vger.kernel.org>; Wed, 28 Oct 2026 10:01:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C890606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=omwUzGSy
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=/dUQ3gxRWfPKKEHri1OjskVqUHdSvq6M0Wda3oynvuk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793181707; v=1; x=1793786507;
 b=omwUzGSy9w6/mFbekyH2CeZjT7h+OgL1CqRyiwElJhUiifK7sFD9Fy4p0XR/w8PVj/OQNs/8
 D2/uCPyIFpoEwsGGqQSpOqpk9vwh1XrEr8xLpGaTJn7tNlFiG/TPHs0iMGF9dJuyMPKD4+zOTuJ
 vHSHfcYcDcsNtcI4Ka7+Ui8U=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id c473c188e45cfd80;
	Wed, 28 Oct 2026 10:01:47 +0000
X-Mizu-Trace-ID: c473c188e45cfd80
X-Migadu-Flow: FLOW_OUT
From: Zenghui Yu <zenghui.yu@linux.dev>
To: linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: akpm@linux-foundation.org,
	david@kernel.org,
	ziy@nvidia.com,
	baolin.wang@linux.alibaba.com,
	liam@infradead.org,
	nico.pache@linux.dev,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	baohua@kernel.org,
	lance.yang@linux.dev,
	usama.arif@linux.dev,
	kas@kernel.org,
	ljs@kernel.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	"Zenghui Yu (Huawei)" <zenghui.yu@linux.dev>,
	Kiryl Shutsemau <kirill@shutemov.name>
Subject: [PATCH] selftests/mm: skip collapse_compound_extreme() on THP allocation failure
Date: Wed, 28 Oct 2026 18:01:19 +0800
Message-ID: <20261028100119.11340-1-zenghui.yu@linux.dev>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Zenghui Yu (Huawei)" <zenghui.yu@linux.dev>

collapse_compound_extreme() needs hpage_pmd_nr PMD-order allocations in a
row, and it kills the whole test binary via ksft_exit_fail_msg() as soon as
one of them fails.

Gating the case by PMD size (commit b36bec6a01b1) -- the current workaround
for arm64 with 64K base pages, where a 512M PMD makes every construction
step an order-13 allocation -- is not enough: the case still dies below the
cutoff, e.g. on an arm64 VM with 16K base pages and 8G of RAM, where the
construction would need ~64G worth of PMD-order allocations.

Remove the PMD-size gating and treat a failure to allocate a huge page
during the construction as a skip: whether the allocator can hand out
that many PMD-order folios in a row depends on the memory available on
the machine, not on the kernel.

Suggested-by: Kiryl Shutsemau <kirill@shutemov.name>
Link: https://lore.kernel.org/all/atiQmWnz8zx2AKI7@thinkstation
Signed-off-by: Zenghui Yu (Huawei) <zenghui.yu@linux.dev>
---
 tools/testing/selftests/mm/khugepaged.c | 26 +++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/selftests/mm/khugepaged.c
index 1bc7acc66a46..e6151732b17c 100644
--- a/tools/testing/selftests/mm/khugepaged.c
+++ b/tools/testing/selftests/mm/khugepaged.c
@@ -953,23 +953,25 @@ static void collapse_compound_extreme(struct collapse_context *c, struct mem_ops
 	void *p;
 	int i;
 
-	/*
-	 * This needs hpage_pmd_nr PMD-order allocations in a row, which the
-	 * allocator will not supply if the PMD is very large.
-	 */
-	if (hpage_pmd_size > (32UL << 20)) {
-		ksft_test_result_skip("%s: PMD too large for fault-time THP construction\n",
-				      __func__);
-		return;
-	}
-
 	p = ops->setup_area(1);
 	ksft_print_msg("Construct PTE page table full of different PTE-mapped compound pages\n");
 	for (i = 0; i < hpage_pmd_nr; i++) {
 		madvise(BASE_ADDR, hpage_pmd_size, MADV_HUGEPAGE);
 		ops->fault(BASE_ADDR, 0, hpage_pmd_size);
-		if (!ops->check_huge(BASE_ADDR, hpage_pmd_size, 1, hpage_pmd_size))
-			ksft_exit_fail_msg("Failed to allocate huge page\n");
+		if (!ops->check_huge(BASE_ADDR, hpage_pmd_size, 1, hpage_pmd_size)) {
+			/*
+			 * Constructing the PTE table requires hpage_pmd_nr
+			 * PMD-order allocations in a row.  Whether the
+			 * allocator can supply them depends on the memory
+			 * available on the machine, not on the kernel: skip
+			 * instead of failing the test run.
+			 */
+			ops->cleanup_area(BASE_ADDR - i * page_size,
+					  i * page_size + hpage_pmd_size);
+			ksft_test_result_skip("%s: Failed to allocate huge page\n",
+					      __func__);
+			return;
+		}
 		madvise(BASE_ADDR, hpage_pmd_size, MADV_NOHUGEPAGE);
 
 		p = mremap(BASE_ADDR - i * page_size,
-- 
2.56.0

