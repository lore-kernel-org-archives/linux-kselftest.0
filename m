Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32AC1343888;
	Sun,  2 Aug 2026 19:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785700395; cv=none; b=YZTfkBwlla7USa5tvlQYN/K5Bm3xrEn1HEgPbGdZWH0/SXrWc5cC4UsZSCsMAlY+uHjGeXTkLwv3XH231EBb9/I4w7uPKG9n7PuyXx5EfMrGuUrGneHw/1uuJYGVsUDVA87tzOWf3FAQnf9b8rnmSmSTX+Hhi0sD3Sgrg0kKRuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785700395; c=relaxed/simple;
	bh=HXgd0WDA3vQs38YRJ7329P0AWyTwtPeBxS195QpZQAs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nUq0uUPMS+vg+YKj97vkNyjbpUZq6gwiEWIwZTz3HYlKYk6bcT7D1NEvobMMXemGl20yOb5jBtfdbLDwEbHLkrT6cvOj+kXuFW4Vo/9aaUfrCdIkFuxA65ixElpR9ewkRmldfQ4EbuY1DmtbEEKyxwNwfXT3WpixOsrchvxmRXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=C6nAz0He; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=mq6bfxHo; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="C6nAz0He";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="mq6bfxHo"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id 472C9EC009A;
	Sun,  2 Aug 2026 15:53:13 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Sun, 02 Aug 2026 15:53:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1785700393; x=
	1785786793; bh=/GalfQyREKxG2C3FQIdFi+JAjsDFcuy0z1FP7FGhoa0=; b=C
	6nAz0Hegkhoqy/l4n6NMVUHb5XKpoUhF6jsII7z8lVkOIi8Fm8fRPmgN815q05qd
	/D7nbBInNNMae6GhET1Od88zeMBG/C+XsVssIt3zrq/UKMEaAW8Plna4lgHpoA8R
	/z5EbgL7AEVkc130Hks85wMKj1a0nkZtBa9Rkp/d4aMuEFBcMpsd4QLWUTGGZ9ZM
	XIjxPCCvklNfoUHGLtHFVZDZmviMNBpAYvYVLq8JaAb9hIZrFBOq8hYCWTKTsatn
	wu8IcegD5quLBx6zPhIV/elCEeQWDY1L1EtUS/yYKjzy4JI1HJgO4l2PKeisssoV
	XpksLbajYSFKc/7oce7Nw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1785700393; x=1785786793; bh=/
	GalfQyREKxG2C3FQIdFi+JAjsDFcuy0z1FP7FGhoa0=; b=mq6bfxHonPq8Benoc
	6tRjC91Qwl+i8dM2qyAL31SGbN9L3XxePb8tbua+ueWOf2UH460LXW5nYqgVp1zg
	DAuz24V4VRKKujqoQk8Iq6oL+gqXKSvJTfd2zqPnBKDAXLUwKDCD3iv4FQxBh5Wb
	ZUz5S2aCuefi1VkI3jXXxMeuSvv9WzYkSojirnQyJkMhr/2IQI3Y/B1dU0htROpO
	vT9Uh27K+OnD3S1FCZG3gbWI4cfdVaYq5ShWTHvPOMpCQfZ3ukNyMB3usbeAEexE
	kAdhJPFog0TsZeRgikS22iXkaXuTZHvGMqCcv9pcha7mtqfWPDmt3gJX5Yj/OBsZ
	sybcg==
X-ME-Sender: <xms:KaBvaqS30jjklCgWg6CVTIYrA62shSxzseXhj5nQFkUURoOwiEwhiQ>
    <xme:KaBvaqQwobAprdIO7Ph3yavdhOE7Ep9ietD-I8cmMUgpVUIgbh7qC5i-Dbu49J_GN
    WDluF-hogELudzETQ0C6TLrxM6O4ZNZbPbruAKNIEG0Tc0Q3wQ7OGs>
X-ME-Received: <xmr:KaBvakyrqlv6JBQcj4S45MDmuE0XFsOIm_40RquTR8oiuKbwhO44L9mAuNY>
X-ME-Proxy-Cause: dmFkZTGeN1xI4bt1iclSzDFip0Bk/XaIhvbS/8i3JSTXfor37WXDF+RcNWPPd9pfiJK8Zw
    2BrRRh4rnHFGERiD1jpqkpu4TBSJEj+dkjcrMZ9PB457VyyAOaPr9tioF0eAgQ73LLdMGf
    ZnUc9d7R5xpl56ih9w8zQdF1AdPa5yFqJeaq79y1FNmaYwVg1fW3ZavvRb02VDPCTYSs5n
    EKi2mK0TcmJbPEDbjm1vybeof8AWtEC76nwVjuGNoLmfYq44vTWlCkOqLjX+gcHHM4Q7iT
    SPI3JBSpkIfgjo/e1nwt56byN8xWT3gnCcQMRcCsWQ2AE9kBILBwP01Qmf1NZFO2elKCXI
    XkLOto1aBOC0cyJ0aBcRedijAUCRu75ag49n4uds8B5vtLBgS8ErmJEmXjo7fYAYYWI7JS
    cu5tkEvFEJ2qbFcGnDKS6Lfnlp24okWHwGDHmIFrcJC3eAC0jJSvsTj1cJklnskvScRcrH
    qkaYHCr9eu/VM244yipyyQCQWmD8wcY+Qev1RTM2TJ0RYIocSEvBgjdN9BfMrMoNi0UKgc
    57FC67cUXuny0o2J+9N6RkBtbtoLuv0BiPrIduS2c6ZfeaMaMAbmEMgvSelijkkEWQ86RA
    f0cFQ15eugH72v4Gm9qiXX2WIKLaYmb3RSpi75yCd8wTPoMezrbBSqcTOQDQ
X-ME-Proxy: <xmx:KaBvaov-DUuCnv8AXxrALMZMKyCcx7VtDEbgPoAL0k_DGSgBBdbxAA>
    <xmx:KaBvaryGiI4giROC5_Sl-AyVQtoRItwlZqJOQIOOS5c8CexEBwdEAw>
    <xmx:KaBvagedtqxFWzYUXYapkyfxOpvIrw5caaRZVJrXRyAqA3i3WKtBlQ>
    <xmx:KaBvap2eAGc_kvopij-uepQhgyz2UMynPM2pi9SD_paY-OYaE-W8jQ>
    <xmx:KaBvaoOONH7FR7YmN-ziScF9kJf_xGOd5iLSdm8cHG0gJfpVfsslXZe8>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 2 Aug 2026 15:53:12 -0400 (EDT)
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
Subject: [PATCH 07/16] selftests/mm: cover a shared-source collapse write race
Date: Sun,  2 Aug 2026 20:52:39 +0100
Message-ID: <20260802195254.1937477-8-kirill@shutemov.name>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260802195254.1937477-1-kirill@shutemov.name>
References: <20260802195254.1937477-1-kirill@shutemov.name>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>

collapse_fork already checks that a fork-shared range collapses in the
process that asks while a co-sharer keeps its own page, but with the
co-sharer quiescent. Add a case that keeps a co-sharer writing to the
shared range throughout the collapse: CoW must keep the two sides'
content independent -- the collapsing child sees the pre-fork content,
the writing parent sees only its own writes. This exercises the
requirement that CoW keeps a shared source isolated from the collapsing
side throughout the collapse, even under an actively writing co-sharer.

Passes on the unmodified kernel, pinning down the CoW-isolation contract
that khugepaged collapse already provides.

Assisted-by: Claude-Code:claude-opus-5
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 tools/testing/selftests/mm/khugepaged.c | 58 +++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/selftests/mm/khugepaged.c
index 65fafab06410..81001e15765c 100644
--- a/tools/testing/selftests/mm/khugepaged.c
+++ b/tools/testing/selftests/mm/khugepaged.c
@@ -1047,6 +1047,61 @@ static void collapse_max_ptes_shared(struct collapse_context *c, struct mem_ops
 	ksft_test_result_report(exit_status, "%s\n", __func__);
 }
 
+/*
+ * Content stays isolated while a co-sharer writes concurrently. A shared
+ * source is copied live (not frozen), relying on it being CoW - immutable
+ * for the duration of the copy; a co-sharer's write goes to a CoW copy. The
+ * collapsing child must see the pre-fork content, the writing parent only
+ * its own writes.
+ */
+static void collapse_fork_cow_race(struct collapse_context *c, struct mem_ops *ops)
+{
+	const unsigned long shared = 64 * page_size;
+	const int stride = page_size / sizeof(int);
+	int wstatus, i, n = shared / page_size;
+	int *ip;
+	void *p;
+
+	p = ops->setup_area(1);
+	ip = p;
+	ops->fault(p, 0, shared);		/* shared prefix, pre-fork pattern */
+
+	ksft_print_msg("Fork, collapse in the child while the parent rewrites...");
+	if (!fork()) {
+		ops->fault(p, shared, hpage_pmd_size);	/* private remainder */
+		c->collapse("Collapse a range shared with a writing co-sharer",
+			    p, 1, ops, true);
+		for (i = 0; i < n; i++)
+			if (ip[i * stride] != i + 0xdead0000) {
+				fail("Fail: child content");
+				ops->cleanup_area(p, hpage_pmd_size);
+				_exit(exit_status);
+			}
+		success("OK");
+		ops->cleanup_area(p, hpage_pmd_size);
+		_exit(exit_status);
+	}
+
+	/* Hammer the parent's own writes over the shared prefix. */
+	for (int it = 0; it < 200000; it++)
+		for (i = 0; i < n; i++)
+			ip[i * stride] = i + 0xbeef0000;
+
+	wait(&wstatus);
+	exit_status = WEXITSTATUS(wstatus);
+
+	ksft_print_msg("Check the parent sees only its own writes...");
+	for (i = 0; i < n; i++)
+		if (ip[i * stride] != i + 0xbeef0000)
+			break;
+	if (i == n)
+		success("OK");
+	else
+		fail("Fail: parent content");
+	ops->cleanup_area(p, hpage_pmd_size);
+	ksft_test_result_report(exit_status, "%s\n", __func__);
+}
+
 static void madvise_collapse_existing_thps(struct collapse_context *c,
 					   struct mem_ops *ops)
 {
@@ -1595,6 +1650,9 @@ int main(int argc, char **argv)
 	TEST(collapse_max_ptes_shared, khugepaged_context, anon_ops);
 	TEST(collapse_max_ptes_shared, madvise_context, anon_ops);
 
+	TEST(collapse_fork_cow_race, khugepaged_context, anon_ops);
+	TEST(collapse_fork_cow_race, madvise_context, anon_ops);
+
 	TEST(madvise_collapse_existing_thps, madvise_context, anon_ops);
 	TEST(madvise_collapse_existing_thps, madvise_context, read_only_file_ops);
 	TEST(madvise_collapse_existing_thps, madvise_context, read_write_file_read_ops);
-- 
2.54.0

