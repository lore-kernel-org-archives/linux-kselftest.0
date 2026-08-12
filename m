Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 668A44562BA;
	Wed, 12 Aug 2026 13:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786541009; cv=none; b=ZiEo0PfGsEkcdkJsY0wPdsGruYkhlsqgQ6WOAURcb12KlXrcWPXd6UDdpJlEKO/5DGEtwGubBfVHYL+QorBiRD040m+VMoJE/098BxvMT4UA0avp6ZJtDBT5Zy0nClXISof6odpousPM4gU9iiOsmZVKXf43oN+/qdh2qwHuJ8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786541009; c=relaxed/simple;
	bh=JNDbRMrTvWoJBFV0dbie0OAT5FgLL64sP8zbsB7hhgk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l42nDwfbeTYcbZy5cj5fF36QrVBAuB+2BpWzTEVBFWqrB5llLtfTEi5pdjMbPdc78GGbv+yodi0ROB8ur7EE1Wc5CDzNlUXcuLi8uezx9E95NbG8DP+hcEk0OFC2efofytNE+iM/puMKjPBeRJavBUVUNmXk32D3Wqodor+KpoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=QXUbyLny; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=KPaN37AQ; arc=none smtp.client-ip=202.12.124.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="QXUbyLny";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="KPaN37AQ"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 2D21E7A00D8;
	Wed, 12 Aug 2026 09:23:27 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Wed, 12 Aug 2026 09:23:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1786541007; x=
	1786627407; bh=7/1Od9SJ6IhS+FCj32O5qawyk1eH8bdwgb4C18ahL3g=; b=Q
	XUbyLnygX6Hg80MGiM5NtW/Et2v4mgvuNkaN/mXkvIweCC6AMxMMBp4XytNuAXaB
	AqH2R9pIBMg6QfNb/IiphyivuSXTeMRjdrILMEEaQZVYuIom5xT9quL+p6k4eJZD
	YFoiUeTMdijymZ5tiOTn6DaqNEkdPVD9V2Cf/Bu4e4KWmDN9ez25+9lHkr7smv+G
	NAeIN5qrS43z1vKzPgxNUlsXI5/T26Uq2eT7nIzVO1EUb1hQE7Hh5ddN7S7k3jDL
	iNulunUp4VOe9Ha07eDG4eIfoIIopEBWxv/aCTwnIAKgxARe+zzMMm6hV1ZEw+1G
	G0MErmvqgPDPP38qJQkFw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1786541007; x=1786627407; bh=7
	/1Od9SJ6IhS+FCj32O5qawyk1eH8bdwgb4C18ahL3g=; b=KPaN37AQb6Ihsr5EM
	bzfrZySkcG0An+V8801fZGNmWzjnrYcWn8iabQL/U/1tFZdjX6pwuv41yRZWloVP
	WG6INcHEWRF0QZjwpuRrohdIgy+E1yJ1nA0SACltYpI6ThddOcQAKq/0QQctv9s+
	UXAOjycmwB37tcVa+JpC9VMcjd+zuhYwU7u/mytgV3lKWRuAeO7khEEIR0xP5Z3W
	1a1Sf8pecn7bYh7yJSDQDHv5Boagq9i6hs3eW1tn/dqoY18XhK1UyNUAy49HZvRW
	f5a8vVUpcagvoU7uZqVMC00SEfVH4KzzvK65JpIwykEU3fIncuef5DRxpF4mA/xy
	PPDCA==
X-ME-Sender: <xms:znN8amXRwEBfKUAn7PMA8cv55W_D6v-UNbJ2E6EFYCnpQEBn0kY95g>
    <xme:znN8auclE7Z7kOoMQlJBITrqNzt9-aHGJKgAyOwBXAoHZKfA0JE8qCncfhhVwLrqQ
    gg4A9eMc6FVc5rZJ4yGI5t0Mq612uHdmBS07OLGzQLbZG900CjN8BFq>
X-ME-Received: <xmr:znN8ajO-BG8RMqYH-W28s1bQIHtM4XioKur7wQl-bSW0FJp6noBokSJXm_U>
X-ME-Proxy-Cause: dmFkZTEqChZjxU8lqj02ht3p8wYuzmrYEvg5d87zO8AQZiDFbK4iKtuSdYsxN+c2ZoTQsd
    zQCY87aTj+m9TAVwdwmdnHKtWVRXEr5fYrOyK1UHI3A+jsshF0fdPBAQVaID4Wjh7c0VEi
    dMMoETa/m0t33XZQU/UKXL4JlwUkkgq4rn6LMFa3pgr2l0Q8gT02Cw2LTLC9qVW3zH4Meh
    qM5Q9QulYPPXeKlcMtfCTbhFhqEmjDBhZKmzHTdwgvJ4UJe4phkHLyfIFsN1xpYIRuVU2w
    753LB2HCYBO3y/gIk+V2c2W66P34Qvl7+NN+EKfE2PSluCBz1GoS4+OMA2hGu38Uv91MGe
    4sTC5n92K1OBThe1XxwGhr1GgpYY+WoIkK4tbDPzVa+TSQLKZWYQ/zq5apU+YI+o3tVECK
    P+PdOrfvJf3ku5k0iSYdGKAgoT4PHJG1I6KcwVNl2YHf0vo513CyZEEe0x+JfEndboES2a
    9udf7lXx7WK+fRrtAl3v2jY+cP3lSrTFT68GhvpMYPTHYRgt+TTydDiZL6Y8S7oXvastST
    Z1Yt6tB4jTmzKMQ9DjoHIquzS15QUsewYVi/NQgWUjfAZe92uTmiDHYNszwvxNeu/uUbeH
    Ivg6hBCV9ysXNP206u2eN2kMLiEqfSltcj4+UB7B5xMbfeDtHdW3nlbvWbOg
X-ME-Proxy: <xmx:znN8amIgs-eq_Ej0lJcXPYKbOOBCXJcAERJNr3vWmEXX4NWIH1NsQw>
    <xmx:znN8apnn_WsmEpBf8hPQ2Lz4FIBzL6uVzWai0OAy1TqcoBpk3ddrRw>
    <xmx:znN8alY4LJhHNa_UQQCaAD1TXsSdm5KO2XyhzvXh4r5QcnjRTkz9Ug>
    <xmx:znN8aohvW2F9GuoqCa0-QxMYdXBT3sIhx0wD1AHTV2nFwc9SGk_ogw>
    <xmx:z3N8aveq971dOhAM_UVsOg8lIzWWaScVHA4349O07bM1gAvlCnDNEyg0>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 12 Aug 2026 09:23:26 -0400 (EDT)
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
Subject: [PATCH v3 07/18] selftests/mm: add folio-order check for address ranges
Date: Wed, 12 Aug 2026 14:22:53 +0100
Message-ID: <20260812132304.199287-8-kirill@shutemov.name>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260812132304.199287-1-kirill@shutemov.name>
References: <20260812132304.199287-1-kirill@shutemov.name>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>

An mTHP collapse test has to ask whether a range came out as folios of one
particular order, placed where a collapse would place them.  Nothing
answers that today: is_backed_by_folio() classifies the folio behind a
single page, and check_huge_anon() reads smaps AnonHugePages, which only
accounts PMD mappings.

Add is_range_backed_by_folio_orders().  For every order-aligned window of
the range it requires a present head PFN at its natural alignment and a
contiguous PFN run across the window.  A window stitched together from
several folios, or one holding a folio shifted off its natural position,
fails -- which is what makes the helper usable for "this window collapsed
and that one did not".

Assisted-by: Claude-Code:claude-opus-5
Tested-by: Muhammad Usama Anjum <usama.anjum@arm.com>
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 tools/testing/selftests/mm/vm_util.c | 42 ++++++++++++++++++++++++++++
 tools/testing/selftests/mm/vm_util.h |  2 ++
 2 files changed, 44 insertions(+)

diff --git a/tools/testing/selftests/mm/vm_util.c b/tools/testing/selftests/mm/vm_util.c
index 5db1a7774f49..c9bd6c92fa41 100644
--- a/tools/testing/selftests/mm/vm_util.c
+++ b/tools/testing/selftests/mm/vm_util.c
@@ -556,6 +556,48 @@ bool is_backed_by_folio(char *vaddr, int order, int pagemap_fd,
 	return false;
 }
 
+/*
+ * Check whether every order-@order window of [start, len) maps exactly one
+ * folio of that order, head to tail.  The address range must be naturally
+ * aligned, each window's PFN run must be contiguous, and a window's first
+ * PFN must be the folio head.
+ *
+ * This is the check "did this range collapse into order-@order folios": a
+ * window assembled from parts of several folios, or mapping a folio shifted
+ * from its natural position, fails.
+ */
+bool is_range_backed_by_folio_orders(char *start, size_t len, int order,
+				     int pagemap_fd, int kpageflags_fd)
+{
+	const unsigned long nr_pages = 1UL << order;
+	const size_t window = nr_pages * psize();
+	char *vaddr;
+
+	if ((uintptr_t)start % window || len % window)
+		return false;
+
+	for (vaddr = start; vaddr < start + len; vaddr += window) {
+		unsigned long pfn = pagemap_get_pfn(pagemap_fd, vaddr);
+		unsigned long i;
+
+		/* Not present, or not mapping the folio head. */
+		if (pfn == -1UL || pfn % nr_pages)
+			return false;
+
+		for (i = 1; i < nr_pages; i++) {
+			if (pagemap_get_pfn(pagemap_fd, vaddr + i * psize()) !=
+			    pfn + i)
+				return false;
+		}
+
+		if (!is_backed_by_folio(vaddr, order, pagemap_fd,
+					kpageflags_fd))
+			return false;
+	}
+
+	return true;
+}
+
 /* If `ioctls' non-NULL, the allowed ioctls will be returned into the var */
 int uffd_register_with_ioctls(int uffd, void *addr, uint64_t len,
 			      bool miss, bool wp, bool minor, uint64_t *ioctls)
diff --git a/tools/testing/selftests/mm/vm_util.h b/tools/testing/selftests/mm/vm_util.h
index 56a28ce7d029..39dfb18dc10c 100644
--- a/tools/testing/selftests/mm/vm_util.h
+++ b/tools/testing/selftests/mm/vm_util.h
@@ -99,6 +99,8 @@ int gather_folio_orders(char *vaddr_start, size_t len,
 		int pagemap_fd, int kpageflags_fd, int orders[], int nr_orders);
 bool is_backed_by_folio(char *vaddr, int order, int pagemap_fd,
 			int kpageflags_fd);
+bool is_range_backed_by_folio_orders(char *start, size_t len, int order,
+				     int pagemap_fd, int kpageflags_fd);
 
 int uffd_register(int uffd, void *addr, uint64_t len,
 		  bool miss, bool wp, bool minor);
-- 
2.54.0

