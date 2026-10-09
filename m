Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 267AC3CC32D
	for <linux-kselftest@vger.kernel.org>; Fri,  9 Oct 2026 15:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791559938; cv=none; b=qR+8RHreuIvtWYaEyINm8OnZbmbI8758Wjt3Xll+TS3tcAUbGYd8cwyXwdezvTqsTSH1X56KWFl0kvZmVMeFZ/8pHWiDmfImmy2ufNsNgVZsx3g6ALPZTRSIWFs8gAW2Hgm7UtZTlpJXtZJxQcxL/obcBZ739+tEvtlYnaLWVmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791559938; c=relaxed/simple;
	bh=iMZ/uX+ag5jz3/Kyi5t22CgDOcI9bb/p6hm7+/PLmns=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UyWP0+VzjMinc1BH94DE44Nc5leLqDFFCPucINnnOji1h3WpUlbOn0qsKV71MfrBnGUZ68tWCDXhsBL+COTwsaYY9H9Oy8M7tPyoBzw9/5slwz7youiH7/VjDUHw7CUC/oUGFJN2WD9SQ0wbzCG00fJq5vyAk0hYRKWJqH+t5h0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=uaYh3Jj+; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=MTHoNhnL; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="uaYh3Jj+";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="MTHoNhnL"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 41F6CEC09EC
	for <linux-kselftest@vger.kernel.org>; Fri,  9 Oct 2026 11:32:15 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Fri, 09 Oct 2026 11:32:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm3; t=1791559935; x=1791646335; bh=eNkAHrZeuC
	rzAtS02DcDIkhItOapaZSzqCl0GxmQ6J4=; b=uaYh3Jj+1H/rESeiWW1g2HnnwB
	a78moyoAs//QmyVF7U2GFE6Ty0kYZP8/WBPEjBZP7He5+dvpGFiuN3sdzKFp9Kpu
	eOQeR8kvvRSRp+BbUlBoeOf8qbOOz96kbjvAK9w8jPGQ+Or75k8UmJIZGkjOPuUb
	BuvGW6AkufavVCcUXIvAJDX58sCOMNM0DtBX6qHK+ASK+6I75zAEsbEbgHH9QRIw
	TcEcCfJQEiz8OaKkRaK4z0NTOCzTtDKyrH+Cn0Est4FqVbvxVqvwCeLtwA1qOYAQ
	FoEtCCIEU/knZtHa56yVruP3gI1eLyP62oOeUrjrxKlNrbNa5agxJRlGqKfQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1791559935; x=1791646335; bh=eNkAHrZeuCrzAtS02DcDIkhItOapaZSzqCl
	0GxmQ6J4=; b=MTHoNhnLRwi6L76aQvrXl9e34Zpf4FZTIe/4Z51Y+vMT/peNwts
	HCK3YhcilOPbj2XHcKOztw5Qip0JoHa4WUl+diaCKLLZn3CNCilXJxFSXQ+AE7yn
	rqYE1kSDBbqrWEahh/L2Dkn5InObtvj+mbTD9O3kTwj7BK8DPb+Dl2RJR9pEN6G2
	p2uFWuBARjnAHyqXD4/CuATYsBppiqgfysuZN9ZyMAkJwq119ByXzi9C85zNI7eb
	gbUKEC5EWkSfeqDfsKU6mnnC9NB9iquHw71Xr6kPqSlwdt3mu9UTQ4hoTrtxIWKu
	4qqPSQwfGg/GxQ6eo+sxaUbaCuyQZdhbEwg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=sign d=shutemov.name a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791559935; d=shutemov.name;
	mf=PGtpcmlsbEBzaHV0ZW1vdi5uYW1lPg==;
	rt=PGxpbnV4LWtzZWxmdGVzdEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm3:rsa-sha256:IIHRa34obzBiGDqqmiWQd2PptSd2VHbFcrRWAy8PyZvpgvE
	nPkH+fbFGwj2q6pzCmmJeKm7oDVyusuYSMljZ1i5z2z0CTTTlM+vD55vCn8GWWS9
	2W6EGMGvPyaAWOLlL6Fo9b2+0vqVcpxIBSIQEagg7ESlNKMwA4M+98mFHaBC0Vgl
	s92hGe0Eb6uUvA2DrQ+ULfLv+9rxZaWV5HX3rlsjx/C9ibM/YO8Hptp4Q+z/DyR8
	YRTZ9lzhax7Y7dh4Oc2FSEbN7pk+R6yeeG0rSCJC1wRQ4I3a9X5mkLSl61Z29wqw
	IPQCkGMDqulSxRdLXvM3V3ck02OZXh0BcssoXrA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=mi-m=1; hc=9;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:3hpCA8iQi0r3kgj2aOfNu2B6wplYVejEYLENCZAaw8M=:iMZ/uX+ag5jz3/Kyi5t22CgDOcI9bb/p6hm7+/PLmns=;
X-ME-Sender: <xms:_gjJapTr9Ar-ep6OuTri01E5Xfh2aFOKO4Q0ZCLQiD9kpZK4bMYL8w>
    <xme:_gjJakZNKFAuVPltOzDrmjJQzpl-5ZpUd9Hf_XeTRhvy6Jlky9jYBuDQEy5WZzYAd
    OHZs7_YYrXI1TVRBEs3x0k_1GW3ucL-FyBgd4WaQM2WdQYWxF6V1I0>
X-ME-Received: <xmr:_gjJai6w363qHX6zj48lr3uzlYTpVXLPSlUOvbf-GyqyAquXzCupRFpExSU>
X-ME-Proxy-Cause: dmFkZTEojCcQdCbQEnvG4GzFM0Gtq7SC6ZQGly27ZWNX9GO6WKU3jEBqxz5bk4ea1AP4V9
    TPIVGx/CiMf6Y3h10lSARpqgrsgYLVoWyL+3qaFGEN8UIxZ5UNN0Zcn/AwPUJGGNYkOwsQ
    /bXGq2esfoF2gPIa6ugHY37ND38FhjECueWLOExQaT66s1t5oGhQAo9RBdO1zLZ6svlUdv
    ZEEo/XaVdASxtbSclv98wGLIBUYpN5cbotRrAYvLY2fR7lKVfWMYBWP//sfN6G3mMS29Oc
    psTb54J5ZmXaENSaUsW9rb/rD1rDiProhVZFk4BmRjH5QFTp+YdwmKGW1Y6hQQ46k8CGr6
    cjYKoIhZ1L9XHkTQOdDoIZx1aEcx5n3Z8QmNZ08lG7MtWO0m9Lzz7vEnjTwd/ZaAikTg+h
    jyk4MDT0NCbjkZThKc9vonsuD5uIIkbQPLtiFrQzFxG+SKg9L/gvfV9xPo8iGq5DUWteIo
    k+9w5mtlvgXg8Z5Xt3goOQ47tzb3+HEwIDc/xONBE1pW/XfCF0V2wv2k45X89aoPIZg5+5
    qXx+vG+9qJkAFulsFHZD4bM5EGr83QuJGlTuudoRf0B4i82WMHEjfYzZz59GFsl8j8qSwI
    OIS+f7KqgRAgBcsV+0UO/TwIvgfGr/s07roOLKiVU1/5gI8jZf/EAbyTCxPA
X-ME-Proxy: <xmx:_gjJanf-ABUDb2WppoU4T1XMTLDMMKpnTBHDQtyW5kzSrabv4qwcwQ>
    <xmx:_gjJahffuWsilLrBqDkdE6Aod4d_XlzV1nMiV2fKFLac7uhThBJhQw>
    <xmx:_gjJakGaF3r6AkTzh9n0dI0768OpXteKmxP5w1g3XT8pw6-IBA2WEA>
    <xmx:_gjJaoEkuxpxdJSG4XS_OjHi0vNULJEmBW6uKttlE9ZiM8_EVuBLPA>
    <xmx:_wjJapD7GbOvm4B-L2klnmY89l2i-Xf0p1TAvAX9o7JmG7x2I3EqguJD>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 9 Oct 2026 11:32:13 -0400 (EDT)
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
Subject: [PATCH v2 0/4] selftests/mm: check large folio results through check_huge() only
Date: Fri,  9 Oct 2026 16:32:04 +0100
Message-ID: <20261009153210.236517-1-kirill@shutemov.name>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>

The mm selftests had two ways to check that a range came out as folios
of a given order.  check_huge_anon() and check_huge_file() counted
folios of the order in the range.  is_range_backed_by_order() checked
each window for a folio with its head at the window start.  Baolin found
the two sets in khugepaged.c confusing [1], and the answer at the time
was to merge them once Yeoreum's rewrite of check_huge_*() on top of
pagemap and kpageflags landed.  It is in mm-new now.

Make check_huge() check windows below the PMD size, route every caller
through it, and make is_range_backed_by_order() an internal of vm_util.c.
The split test's count-based check goes the same way, which also makes
it notice a split at the wrong offset.  On the way check_huge() stops
reopening pagemap and kpageflags on every call, which was the other
reason the separate helper existed.

Yeoreum's HPAGE_SIZE series [2] renames read_pmd_pagesize() to
pmd_psize(); the only overlap is the one call in __check_huge().

Tested on mm-new 2589c5593c20 with KASAN, in 16G guests, x86-64/4K under
KVM and arm64/64K under TCG: the khugepaged matrix at every order,
split_huge_page_test, pagemap_ioctl and khugepaged all:all on tmpfs pass
with the same counts as before.

v2:
 - Drop the PMD size caching from patch 1; Yeoreum's series caches it in
   pmd_psize() (Zi)
 - folio_order_check: skip again when /proc/kpageflags is not readable
   (Sashiko)
 - kpageflags_fd_get(): return early instead of nesting the open

v1: https://lore.kernel.org/all/20260929131521.153079-1-kirill@shutemov.name/

[1] https://lore.kernel.org/all/65bf1722-c1fd-452a-88c1-c030b042cfbc@linux.alibaba.com/
[2] https://lore.kernel.org/all/20261009-fix_hpage_macro-v5-0-54378ae45add@arm.com/

Kiryl Shutsemau (Meta) (4):
  selftests/mm: open pagemap and kpageflags once for check_huge()
  selftests/mm: check sub-PMD ranges window by window in check_huge()
  selftests/mm: check collapse results through check_huge() only
  selftests/mm: check split results by position, drop
    gather_folio_orders()

 .../testing/selftests/mm/folio_order_check.c  |  29 +-
 tools/testing/selftests/mm/khugepaged.c       |  47 ++-
 .../selftests/mm/khugepaged_sync_check.c      |   7 +-
 .../selftests/mm/split_huge_page_test.c       | 104 +++---
 tools/testing/selftests/mm/vm_util.c          | 314 ++++++------------
 tools/testing/selftests/mm/vm_util.h          |   7 +-
 6 files changed, 173 insertions(+), 335 deletions(-)

Range-diff against v1:
1:  887d475288bf ! 1:  058de2172bde selftests/mm: open pagemap and kpageflags once for check_huge()
    @@ Commit message
         selftests/mm: open pagemap and kpageflags once for check_huge()
     
         check_huge_anon() and check_huge_file() open /proc/self/pagemap and
    -    /proc/kpageflags on every call and read the PMD size from sysfs on top.
    -    The khugepaged test calls them hundreds of times.
    +    /proc/kpageflags on every call.  The khugepaged test calls them hundreds
    +    of times.
     
         Open both once and keep the descriptors.  A pagemap descriptor is tied
         to the mm of the process that opened it, and the khugepaged fork() cases
         call check_huge() from the child, so reopen it when getpid() changes.
     
    -    Cache the PMD size in read_pmd_pagesize() as well.
    -
         Assisted-by: LLM
         Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
     
    @@ tools/testing/selftests/mm/vm_util.c
     +{
     +	static int fd = -1;
     +
    -+	if (fd < 0) {
    -+		fd = open(KPAGEFLAGS_PATH, O_RDONLY);
    -+		if (fd < 0)
    -+			ksft_exit_fail_msg("open kpageflags fail\n");
    -+	}
    ++	if (fd >= 0)
    ++		return fd;
    ++
    ++	fd = open(KPAGEFLAGS_PATH, O_RDONLY);
    ++	if (fd < 0)
    ++		ksft_exit_fail_msg("open kpageflags fail\n");
     +
     +	return fd;
     +}
    @@ tools/testing/selftests/mm/vm_util.c
      uint64_t pagemap_get_entry(int fd, char *start)
      {
      	const unsigned long pfn = (unsigned long)start / getpagesize();
    -@@ tools/testing/selftests/mm/vm_util.c: bool check_for_pattern(FILE *fp, const char *pattern, char *buf, size_t len)
    - 
    - uint64_t read_pmd_pagesize(void)
    - {
    -+	static uint64_t pmd_pagesize;
    - 	int fd;
    - 	char buf[20];
    - 	ssize_t num_read;
    - 
    -+	if (pmd_pagesize)
    -+		return pmd_pagesize;
    -+
    - 	fd = open(PMD_SIZE_FILE_PATH, O_RDONLY);
    - 	if (fd == -1)
    - 		return 0;
    -@@ tools/testing/selftests/mm/vm_util.c: uint64_t read_pmd_pagesize(void)
    - 	buf[num_read] = '\0';
    - 	close(fd);
    - 
    --	return strtoul(buf, NULL, 10);
    -+	pmd_pagesize = strtoul(buf, NULL, 10);
    -+	return pmd_pagesize;
    - }
    - 
    - unsigned long rss_anon(void)
     @@ tools/testing/selftests/mm/vm_util.c: static bool check_huge_type(uint64_t categories, enum check_huge_type type)
      static bool __check_huge(void *addr, size_t len, int nr_hpages,
      		uint64_t hpage_size, enum check_huge_type type)
2:  e89550a21307 = 2:  a95eb5e9e2c8 selftests/mm: check sub-PMD ranges window by window in check_huge()
3:  3988e8ff5c3b ! 3:  40aa2e377b65 selftests/mm: check collapse results through check_huge() only
    @@ tools/testing/selftests/mm/folio_order_check.c: int main(void)
     -	kpageflags_fd = open("/proc/kpageflags", O_RDONLY);
     -	if (kpageflags_fd < 0)
     -		ksft_exit_skip("open(/proc/kpageflags) requires root\n");
    --
    ++	if (access("/proc/kpageflags", R_OK))
    ++		ksft_exit_skip("/proc/kpageflags requires root\n");
    + 
      	orders = thp_supported_orders();
      	if (!orders)
    - 		ksft_exit_skip("No supported THP orders\n");
     
      ## tools/testing/selftests/mm/khugepaged.c ##
     @@ tools/testing/selftests/mm/khugepaged.c: static int collapse_order;
4:  898256c09252 = 4:  405414814409 selftests/mm: check split results by position, drop gather_folio_orders()

base-commit: 2589c5593c200e5146db848730baa1d7dd0c9f4e
-- 
2.54.0

