Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C3E73B38B9;
	Tue, 29 Sep 2026 13:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790687731; cv=none; b=fora7LaCxBy283RRQKfg5POMKDQ5PD0JreL3Iz8gfoZi/Uyo1E7SjwoYXN93gCHUi76P/97Jh+xUSz/A3vGGr9UDd2HEOq89/MME+TJOnC6BWucETJooSRvGY7Y3NVtaGEul10Ewz2CPCuDBx/AWdJYWxUjtSUiJ2DFTOn4j0kI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790687731; c=relaxed/simple;
	bh=RN4IKlMYfNGgGS2U+XWBy+qveK5P8iFOzLeWNOncUB4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fUVDiQ7Lv30BAiSpkWs8FQDVyGHV8raUSCWnVV6h84W0acbtGy9Yn1ZmPQeqMZlSNhrfpajDckonNbOPAGVCo0MwaPj/pr7c1XlCrtpaLl9qfwrvMh/fkrcq6EYfc9SXDa+cDjOqlhsdRIpr3b02fMnUN3d2oAxw6lXn41GtNX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=jAn/3+Ke; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=eBAiXbB6; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="jAn/3+Ke";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="eBAiXbB6"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id EFFB9EC0D18;
	Tue, 29 Sep 2026 09:15:27 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Tue, 29 Sep 2026 09:15:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1790687727; x=
	1790774127; bh=GU/GEika9AgtPqkhOeR2xfVt/VRGijJWCE2f39JUMhA=; b=j
	An/3+Ken8mfNGlA/cpIUluQ6poFpV+zVCIzC5NnmxL2Y2hw2oyD9hUKGt7UN64Ae
	Fa+rBBBl6zuBEB9nFEoYvDV4GoIY6UtfJ6f47zDJm2zWcXxsqBNXz19j3nFa58SQ
	SV0toohclpUsGprTgfVq0WxvnGjbZSI+ArrSiOtLlBog6jh9LkRctiyytvSQTV62
	4LciVfc5OfrVQRULS1fuGDo3VatbUvdOydxbzo2yKLQCceyxDaKBr8COfp4mcgo5
	ZvDEZzObbaPn5g0qJgNZU5pO1cMhQNgJwIp6Xz9lWxBUTj2EvTQnhW0+WpQvOLsj
	aHnHldwjsCyBQ80+/m5QA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1790687727; x=1790774127; bh=G
	U/GEika9AgtPqkhOeR2xfVt/VRGijJWCE2f39JUMhA=; b=eBAiXbB6rSEHZX6oE
	RQlG5+4JYN66xe8rwBdku4sezNImkkU3PE0GNGVNp/lDGjLkzZ0mUY3pTOxYkYUv
	9X0m9sfK/+ffqC8E9SC9AFO99y/CpO3Rl3KtDIeTj5HyrEN/sraDNL4J3jldasm3
	ZmqjGTYLumHZGu7LUUY+SsC5a0xr3b2qpevW5DzBmghY1cSLWUCqa4ttq9aXFVsp
	6R/RcnFEgreZY0F5NpjM+nwlBbwl0mIlwmmP4rN8fEktLBUrWiaDUidtOaDThclv
	9LUdK7pSYQnYrPjxUgLYQJE/yasTYOaHKaz7cQuoJyU/5KyqFAPE1A9ZFaYz+KtA
	4s5wg==
X-ME-Sender: <xms:77m7aqjOiKrBbJfZL9IJypuX3YX1gdJpYjnWdmRYZE6UYqBeDN_9mw>
    <xme:77m7aujSjB9zyr_uhBy-6xwhTebWRg2da8Cs2_hi_GwJrk_WmY0L3VORO3yLdfVY1
    yfthUTkr_vIze_1OZOWr6cI37a-IKdVMywThzi8r5-07jiFE8dt_T2Q2g>
X-ME-Received: <xmr:77m7aqnjY1g9XETLiPKZItR1jTm1cSXK8rL19BhBREdhH3aSTuoU112QfgY>
X-ME-Proxy-Cause: dmFkZTGYccH7Ntb7J02Xj6JuS6MvJY1gl/a+neyh0zdr6nO/D8luWVmgZr3vVncFfxaOyz
    sDayM6uE9Hs1eK+ME/un6msYT/H9GLEGqCUuaUC0DyOMSfCWuXDxjPjsdGPyoevruFuRE+
    g2yJgkk5PdFa3SMVKZ6gjwNZL3TlLTTB/zh71tz7d1GIGv71iHICfh77uMSsSdxCueqjsF
    W9a0jjllcDDBY3d85i1vta2YOFpbdbcbcx15YCW3q0go4uhoLMlvpNUCT8+kMmJ22Ad1HO
    uVgBzj94RdAq0amic7bSBxVqTdtP3Nc9GZu2B+9nbtIeSv2ligKQDG9XD/qLIwJ7GU89bm
    p8N2XHjAnkP18qIAtkgBI3Now4GKQg7mhdViYW8+mFb8S7jPN6pTLd49ipYnlZqnF7zeWx
    IvHz5bn7KXXZgMw/1yTaXoXk48eRLo+5dWn5VRHINowBvomuNt9vKPGSmA1/752zGJkK/C
    AxoYH7YonktaZqqC+XUZ63FMC25P8rWZ3BFz4PFd5z+C6umuHkmYGfUBhj49yuTow/nCP7
    akJy1w5WG4XwstYmTiiHwrOU1SZSrK+OBym26CtV2DPssWXYKePYJ2OGO+Ohbbwe+eIzCP
    58lg8diuJvi8JWzrythenmQIn/p5lMMVZVOX5noxDjBkqqdxGgtP48zhyBFw
X-ME-Proxy: <xmx:77m7amFh2Jzk1wwFnUyJvSZiuSbcGGwnNXhsgW3jbJT1LtVpiz5pQQ>
    <xmx:77m7asOPWxVOvC-h1Cs0Kkdy8d5e8CpyiumFKM3DfVBcuTqF4re_Hg>
    <xmx:77m7att4FVXbnns5F-_IMa75aJq3Rt8dpWE7rMiuAMsS6H6yLpLtYQ>
    <xmx:77m7aiIHQOUTE0iBV84IM6c7Vl18ZKBgebK7n84Y2E4Q4i913GC4Rw>
    <xmx:77m7as5Jzyfmc3Up91MgSYz3tjEayRixkfss1obiW2sEcfaIp1wdeXaj>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 29 Sep 2026 09:15:26 -0400 (EDT)
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
Subject: [PATCH 1/4] selftests/mm: open pagemap and kpageflags once for check_huge()
Date: Tue, 29 Sep 2026 14:15:16 +0100
Message-ID: <20260929131521.153079-2-kirill@shutemov.name>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929131521.153079-1-kirill@shutemov.name>
References: <20260929131521.153079-1-kirill@shutemov.name>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>

check_huge_anon() and check_huge_file() open /proc/self/pagemap and
/proc/kpageflags on every call and read the PMD size from sysfs on top.
The khugepaged test calls them hundreds of times.

Open both once and keep the descriptors.  A pagemap descriptor is tied
to the mm of the process that opened it, and the khugepaged fork() cases
call check_huge() from the child, so reopen it when getpid() changes.

Cache the PMD size in read_pmd_pagesize() as well.

Assisted-by: LLM
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 tools/testing/selftests/mm/vm_util.c | 68 ++++++++++++++++++++--------
 1 file changed, 50 insertions(+), 18 deletions(-)

diff --git a/tools/testing/selftests/mm/vm_util.c b/tools/testing/selftests/mm/vm_util.c
index 762c31f7dfab..e284e378d806 100644
--- a/tools/testing/selftests/mm/vm_util.c
+++ b/tools/testing/selftests/mm/vm_util.c
@@ -22,6 +22,43 @@
 unsigned int __page_size;
 unsigned int __page_shift;
 
+/*
+ * A pagemap file reads the mm of the process that opened it, so a child
+ * inherits a descriptor that describes its parent.  Open a new one whenever
+ * the pid changed since the last open.
+ */
+static int pagemap_fd_get(void)
+{
+	static int fd = -1;
+	static pid_t pid;
+
+	if (fd >= 0 && pid == getpid())
+		return fd;
+
+	if (fd >= 0)
+		close(fd);
+
+	fd = open(PAGEMAP_PATH, O_RDONLY);
+	if (fd < 0)
+		ksft_exit_fail_msg("open pagemap fail\n");
+	pid = getpid();
+
+	return fd;
+}
+
+static int kpageflags_fd_get(void)
+{
+	static int fd = -1;
+
+	if (fd < 0) {
+		fd = open(KPAGEFLAGS_PATH, O_RDONLY);
+		if (fd < 0)
+			ksft_exit_fail_msg("open kpageflags fail\n");
+	}
+
+	return fd;
+}
+
 uint64_t pagemap_get_entry(int fd, char *start)
 {
 	const unsigned long pfn = (unsigned long)start / getpagesize();
@@ -161,10 +198,14 @@ bool check_for_pattern(FILE *fp, const char *pattern, char *buf, size_t len)
 
 uint64_t read_pmd_pagesize(void)
 {
+	static uint64_t pmd_pagesize;
 	int fd;
 	char buf[20];
 	ssize_t num_read;
 
+	if (pmd_pagesize)
+		return pmd_pagesize;
+
 	fd = open(PMD_SIZE_FILE_PATH, O_RDONLY);
 	if (fd == -1)
 		return 0;
@@ -177,7 +218,8 @@ uint64_t read_pmd_pagesize(void)
 	buf[num_read] = '\0';
 	close(fd);
 
-	return strtoul(buf, NULL, 10);
+	pmd_pagesize = strtoul(buf, NULL, 10);
+	return pmd_pagesize;
 }
 
 unsigned long rss_anon(void)
@@ -407,7 +449,6 @@ static bool check_huge_type(uint64_t categories, enum check_huge_type type)
 static bool __check_huge(void *addr, size_t len, int nr_hpages,
 		uint64_t hpage_size, enum check_huge_type type)
 {
-	bool ret = false;
 	int pagemap_fd, kpageflags_fd;
 	int nr_pmd_mappings = 0;
 	uint64_t pmd_pagesize, scan_mapping_size;
@@ -426,42 +467,33 @@ static bool __check_huge(void *addr, size_t len, int nr_hpages,
 	/* Some mTHP tests check a partially populated PMD-sized range. */
 	allow_nonpresent = (uint64_t)nr_hpages * hpage_size < len;
 
-	pagemap_fd = open(PAGEMAP_PATH, O_RDONLY);
-	if (pagemap_fd < 0)
-		ksft_exit_fail_msg("open pagemap fail\n");
-
-	kpageflags_fd = open(KPAGEFLAGS_PATH, O_RDONLY);
-	if (kpageflags_fd < 0)
-		ksft_exit_fail_msg("open kpageflags fail\n");
+	pagemap_fd = pagemap_fd_get();
+	kpageflags_fd = kpageflags_fd_get();
 
 	if (!check_pmd_mapping &&
 	    !check_large_folios(pagemap_fd, kpageflags_fd,
 				addr, len, nr_hpages, hpage_size))
-		goto out;
+		return false;
 
 	for (; start < end; start += scan_mapping_size) {
 		categories = pagemap_scan_get_categories(pagemap_fd, start);
 		pfn = pagemap_get_pfn(pagemap_fd, start);
 		if (pfn == -1UL) {
 			if (!allow_nonpresent)
-				goto out;
+				return false;
 			else
 				continue;
 		}
 		if (check_pmd_mapping && (categories & PAGE_IS_HUGE))
 			nr_pmd_mappings++;
 		if (!check_huge_type(categories, type))
-			goto out;
+			return false;
 	}
 
 	if (check_pmd_mapping && (nr_pmd_mappings != nr_hpages))
-		goto out;
-	ret = true;
+		return false;
 
-out:
-	close(pagemap_fd);
-	close(kpageflags_fd);
-	return ret;
+	return true;
 }
 
 bool check_huge_anon(void *addr, size_t len, int nr_hpages, uint64_t hpage_size)
-- 
2.54.0

