Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C34F45C6ED
	for <linux-kselftest@vger.kernel.org>; Fri,  9 Oct 2026 15:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791559942; cv=none; b=GbUJ0um8NsHwM8IeaszTqQqzBw62H5pmeFl9o8Ox1VQ0AqcqyTpOiJC16zMS5sUM3Npb7zauxG2ZVWzlDBX8CUGweKhCvrLiMHoKf9MWRRMYwRAe66G287nmcRTqgNBK81+TC32DEkSx2YsVK4EYVC4c0NAgIHcIatLq3nSlREQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791559942; c=relaxed/simple;
	bh=Ws3RmIUfEAqHSqXsPdaDPy7aKV/9/KiXyk2W6GocU7M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nm8vn5dlABZ86CW5H+Avktjysv7fM9tE+23eEbAhiOY7FWCOTjy9mNSlwlMvwgz2OYJq49T1ZWdMzkA+U7+8+7M4VJkZ08DFWO3cCW11JeWdK84EVhfy50wLmiecyRup4WOg8/Phju+RdTsabHB5lu5L1cXJkWuevmlNvxoAVPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=qyFb2HCj; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=arIWwP2C; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="qyFb2HCj";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="arIWwP2C"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.phl.internal (Postfix) with ESMTP id 73F5EEC09F1
	for <linux-kselftest@vger.kernel.org>; Fri,  9 Oct 2026 11:32:19 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Fri, 09 Oct 2026 11:32:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1791559939; x=
	1791646339; bh=Cn3XXFhc6e6bkomv46Z/zGM80flPNc5i5pMDr8LwJxw=; b=q
	yFb2HCjnAXQelO/oGqxnNE22TWroXPk49cN+/yz3/DeHGyRmSCBftqa7/K6D162c
	efYKbVImmLRe6Vx1EdVxY6WRcrmMbgKUtc8B/Ik2Ec4SSnx0ZQwX7XnXmEO6KlnU
	TPoeSbMdFgwSOoTta2nvOVJQpGX5NRjLtZvf0+kfxPgjer8bHqtiJRrW6NPet5ck
	31T64toaIRy3guMRZOqo97pDHD3QLSN2W0zniMKx8v4tTojKH1teVliYwXBNhBhT
	7JzyO7jRylxSgJsG/lHcN0++a5QLYbtxS0vk/3PaFIYhd1vF/sI9AHUVmtbCXmjl
	Vlnyjs4xn1/TX4EncN+6Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1791559939; x=1791646339; bh=C
	n3XXFhc6e6bkomv46Z/zGM80flPNc5i5pMDr8LwJxw=; b=arIWwP2CxGLwH6P/g
	5HX28Fz04DZeRipw+YhubyZKvjRA79sO7GVHjqF3Mxpkztc/GzHI8GJcEN0pYejI
	glsZ1T5idM8ABxROmFhq6aXFNfNuXgUYlV1L5RM/69qW9tER/aR6Ai3rtaY2GeaH
	2IuVgVwN0OOGUXaPAnzBonso5nUN8e9uegLhV5vqo+Nsy03KkK6JrPoNbW/d0QMr
	jiZQGzroyzFtvq4pVBzVhjrYfAP66K1sHOShIcYhoy3eSrms4IlIMtV/X6MJx4Fj
	rz+w0mcliZHH9hTwwezuOEwUnSGp+oNMa6+sulpTyz0ShEjd/X2h8b6BI+FPNXyN
	jTa6w==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=sign d=shutemov.name a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791559939; d=shutemov.name;
	mf=PGtpcmlsbEBzaHV0ZW1vdi5uYW1lPg==;
	rt=PGxpbnV4LWtzZWxmdGVzdEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm3:rsa-sha256:B17CvIOaP1uWMkQ3TIlf9JFQreyVUHqMg+euB67hxlVQeem
	8T3IWfwBPSWVtW41oV2rTUzWS9ls9t5UQeUmWCVesY2WsAT71yVuL1Mz18IQt9j2
	3o9WBJwLeBZzqHPTw60xq3XtoJnvVzYDxqtF5qTJMs1ULbXmIAN+UHeHGru8ER82
	m9fkw2/iw4riDkf3Vty1dibR6JElSxzxcdDdP4Z4BXNhX+B7IK7umm8racYtXz+a
	ZQMfMgowVTf4vvW0AEx4/NK6fjzJzvVNwSW504ZlKeqlZIitrDc5uHfHPKC2/NDA
	1E4f5EIyWIhkl5pZc4C3hpj+uMPewylfPRpmeGQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:mk2CckYtfpRXfCPmFEc0d+B1b3ndA3l7PpMT9XahU9M=:Ws3RmIUfEAqHSqXsPdaDPy7aKV/9/KiXyk2W6GocU7M=;
X-ME-Sender: <xms:AwnJat0XQpjVHf7ouwuqLPmkST9q8gFalhlRW-FqS-sDhrF2pNadKA>
    <xme:AwnJanmcEkLyr6qFCQ75sDfaqndVEalFfWKPZH0DT7HvdsiCfRlMxY6cAXEWE1kJN
    f9IMYLvUG3kRZ9C5tgRIpnhRziPw4KaaslV4851xG8tunY_n2MTeO96>
X-ME-Received: <xmr:AwnJamb8Hs7MWNfX1Akp2OzF7QXDKEQbaKncf0eCqW1zYoRFG3G3Gy4rj78>
X-ME-Proxy-Cause: dmFkZTGIoGBLZMaAhgcaayk5wgp7rW9vayQkfonvs0TKGSEuuYzL1U5eWR8oX+vcbxv0ak
    vZ6V5Fk2n6N+IaumklX1qzBk7r0hEpcbcO59DsZzPQwz0SNLq5ubZVbwk/A0B0ImP1q9S/
    wvMCjtg/pGCexbzTYCAAsFMX+sI9bOrGKjIjV+CjlMDzV5ttTW2+3V5NxcPyUYh3hDVmY6
    5SaA7LVa7G47KypkYvo+NaxjJdB6S0C6Hb2KUpv2JaxJ1DNuAn/rjb2TmQMM/Oo0fomkKJ
    59473bNh2ppMgxEJkQDpXpn3GMfvTNgjovDF8A3Cgd0ETDAPdqWfdTSt6z83qaSG77WHU7
    ffUaamUPGS1b+7K+3QNQF+FTd9zCjHX64SKWGRQL/oVZG6mUrtPNt4VWOGgJ1TYv05fRdy
    3eqf5x4OrWsVhPaitdRbeifihZjArRlDw6yB4Tq80GLUtp5AD8OOpLqzdyF3CFXRwKt9dA
    2U8fro9vwPSVAP1hGvhHIRUDGgOCoxTh4ruWw7K1N4EdAvS+neuj5Q4+yxMuZ7aYdmGCPy
    s/gdBugVlSp+Sqb6YFN84EWVrU1X7+bviOvI3O+QE3yWk23k1iV8sRnHcdsyheCgIyjE32
    9KOnziinkYBgPADR0T9PJTiVIMYzXRi+wNRLoipze5oakUZbuNzMriHZWyQQ
X-ME-Proxy: <xmx:AwnJatq394ky-IG4GFVHsQt8bIW5haXhyHJSdd3ZdWoL7LW6GTYsHw>
    <xmx:AwnJakgX8Ni9oR5n90YVFEYovSInqt4kV-h9jnQdayBRtq7VOI19Xg>
    <xmx:AwnJanyqsFFFGwxCBpxM0IF16aXZSBeG3DJgh6IQpmXvCMVJ9FUsDA>
    <xmx:AwnJaq_OVkAlry0h3OaNY9_ih7HT6AzuEyps3C3gFF7DKZtcGTvwvg>
    <xmx:AwnJaofTLwOTWc4nimwJA-8uW_lRzloXODVuMYfs2niNCXPKYcpkvZkJ>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 9 Oct 2026 11:32:18 -0400 (EDT)
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
Subject: [PATCH v2 2/4] selftests/mm: check sub-PMD ranges window by window in check_huge()
Date: Fri,  9 Oct 2026 16:32:06 +0100
Message-ID: <20261009153210.236517-3-kirill@shutemov.name>
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

For orders below PMD, check_huge() counts folios of the requested order
in the range and compares the count with nr_hpages.  The count does not
say where the folios are.  A folio mapped at the wrong alignment, or
split across two windows, counts the same as one placed where khugepaged
would put it.

Count aligned windows backed by a single folio of that order instead.
is_range_backed_by_order() already does it for one window.  Move it up
and use it.  All callers pass PMD-aligned ranges, so the windows line
up.  The PMD case is unchanged.

This is preparation for using check_huge() for the collapse_order cases
in khugepaged.c.

Assisted-by: LLM
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 tools/testing/selftests/mm/vm_util.c | 131 +++++++++++++--------------
 1 file changed, 61 insertions(+), 70 deletions(-)

diff --git a/tools/testing/selftests/mm/vm_util.c b/tools/testing/selftests/mm/vm_util.c
index 09d9135f0ca8..b62e33ad1201 100644
--- a/tools/testing/selftests/mm/vm_util.c
+++ b/tools/testing/selftests/mm/vm_util.c
@@ -17,7 +17,6 @@
 #define MAX_LINE_LENGTH 500
 #define PAGEMAP_PATH "/proc/self/pagemap"
 #define KPAGEFLAGS_PATH "/proc/kpageflags"
-#define MAX_NR_ORDERS 20
 
 unsigned int __page_size;
 unsigned int __page_shift;
@@ -393,34 +392,72 @@ char *__get_smap_entry(void *addr, const char *pattern, char *buf, size_t len)
 	return entry;
 }
 
-static bool check_large_folios(int pagemap_fd, int kpageflags_fd,
-		void *addr, size_t len, int nr_hpages,
-		uint64_t hpage_size)
+/**
+ * is_range_backed_by_order() - check that a range is backed by @order folios
+ * @start: start of the range, a multiple of the folio size
+ * @len: length of the range in bytes, a multiple of the folio size
+ * @order: the folio order to check for
+ * @pagemap_fd: open /proc/<pid>/pagemap of the range's owner
+ * @kpageflags_fd: open /proc/kpageflags
+ *
+ * Every folio-sized, folio-aligned part of the range must map one folio of
+ * @order, head to tail, with the head at the start of the part.  A part
+ * backed by several smaller folios fails, and so does a folio mapped off
+ * its natural alignment.
+ *
+ * Returns: true if the whole range is backed that way, false otherwise.
+ */
+bool is_range_backed_by_order(char *start, size_t len, int order,
+			      int pagemap_fd, int kpageflags_fd)
 {
-	int order = 0, pagesize = getpagesize();
-	unsigned int nr_pages = hpage_size / pagesize;
-	int orders[MAX_NR_ORDERS], status;
-	bool ret = false;
+	const unsigned long nr_pages = 1UL << order;
+	const size_t folio_size = nr_pages * psize();
+	char *vaddr;
 
-	if (!nr_pages)
-		ksft_exit_fail_msg("invalid hugepage size\n");
+	if ((uintptr_t)start % folio_size || len % folio_size)
+		return false;
 
-	order = 31 - __builtin_clz(nr_pages);
-	if (!order || order >= MAX_NR_ORDERS)
-		ksft_exit_fail_msg("invalid order\n");
+	for (vaddr = start; vaddr < start + len; vaddr += folio_size) {
+		const unsigned long pfn = pagemap_get_pfn(pagemap_fd, vaddr);
+		unsigned long i;
 
-	memset(orders, 0, sizeof(int) * MAX_NR_ORDERS);
+		/* Not present, or a tail page */
+		if (pfn == -1UL || pfn % nr_pages)
+			return false;
 
-	status = gather_folio_orders(addr, len, pagemap_fd,
-			kpageflags_fd, orders, MAX_NR_ORDERS);
-	if (status)
-		goto out;
+		for (i = 1; i < nr_pages; i++) {
+			char *page = vaddr + i * psize();
 
-	if (orders[order] == nr_hpages)
-		ret = true;
+			if (pagemap_get_pfn(pagemap_fd, page) != pfn + i)
+				return false;
+		}
 
-out:
-	return ret;
+		if (!is_backed_by_folio(vaddr, order, pagemap_fd, kpageflags_fd))
+			return false;
+	}
+
+	return true;
+}
+
+/*
+ * How many hpage_size-aligned windows of the range are one folio of that
+ * size each, with the folio's head at the window start.  A folio mapped off
+ * its alignment or split across two windows counts for neither.
+ */
+static int count_windows_at_order(char *start, size_t len, uint64_t hpage_size,
+				  int pagemap_fd, int kpageflags_fd)
+{
+	const int order = sz2ord(hpage_size, psize());
+	int nr_windows = 0;
+	char *addr;
+
+	for (addr = start; addr + hpage_size <= start + len; addr += hpage_size) {
+		if (is_range_backed_by_order(addr, hpage_size, order,
+					     pagemap_fd, kpageflags_fd))
+			nr_windows++;
+	}
+
+	return nr_windows;
 }
 
 enum check_huge_type {
@@ -467,8 +504,8 @@ static bool __check_huge(void *addr, size_t len, int nr_hpages,
 	kpageflags_fd = kpageflags_fd_get();
 
 	if (!check_pmd_mapping &&
-	    !check_large_folios(pagemap_fd, kpageflags_fd,
-				addr, len, nr_hpages, hpage_size))
+	    nr_hpages != count_windows_at_order(start, len, hpage_size,
+						pagemap_fd, kpageflags_fd))
 		return false;
 
 	for (; start < end; start += scan_mapping_size) {
@@ -604,52 +641,6 @@ bool is_backed_by_folio(char *vaddr, int order, int pagemap_fd,
 	ksft_exit_fail_msg("Failed to get folio info\n");
 }
 
-/**
- * is_range_backed_by_order() - check that a range is backed by @order folios
- * @start: start of the range, a multiple of the folio size
- * @len: length of the range in bytes, a multiple of the folio size
- * @order: the folio order to check for
- * @pagemap_fd: open /proc/<pid>/pagemap of the range's owner
- * @kpageflags_fd: open /proc/kpageflags
- *
- * Every folio-sized, folio-aligned part of the range must map one folio of
- * @order, head to tail, with the head at the start of the part.  A part
- * backed by several smaller folios fails, and so does a folio mapped off
- * its natural alignment.
- *
- * Returns: true if the whole range is backed that way, false otherwise.
- */
-bool is_range_backed_by_order(char *start, size_t len, int order,
-			      int pagemap_fd, int kpageflags_fd)
-{
-	const unsigned long nr_pages = 1UL << order;
-	const size_t folio_size = nr_pages * psize();
-	char *vaddr;
-
-	if ((uintptr_t)start % folio_size || len % folio_size)
-		return false;
-
-	for (vaddr = start; vaddr < start + len; vaddr += folio_size) {
-		const unsigned long pfn = pagemap_get_pfn(pagemap_fd, vaddr);
-		unsigned long i;
-
-		/* Not present, or a tail page */
-		if (pfn == -1UL || pfn % nr_pages)
-			return false;
-
-		for (i = 1; i < nr_pages; i++) {
-			char *page = vaddr + i * psize();
-
-			if (pagemap_get_pfn(pagemap_fd, page) != pfn + i)
-				return false;
-		}
-
-		if (!is_backed_by_folio(vaddr, order, pagemap_fd, kpageflags_fd))
-			return false;
-	}
-
-	return true;
-}
 
 #define TRACEFS_ROOT "/sys/kernel/tracing"
 
-- 
2.54.0

