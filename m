Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA0042459DC;
	Wed,  6 May 2026 16:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778084325; cv=none; b=UzygzflUOmTTZxI0a/4wMfA2h+pk4nZWTOIJUt3yaM1fMLbQO9DR8kA83wKCGhLOPLzhkSITCK/TWV6Vj8u+OLD2ED/iijP/yORVYyQgzyM5fKv2DcPY6RXeIMbuUohXVkkOD2VQD+/GGfZpND/9rm4mMHt00wrymjWm7biq3f4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778084325; c=relaxed/simple;
	bh=/rsMY+Zx/Vh7owY7ShMImN6ucv2Sv4jVuZ+weMvjUwc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q+qPfWZmfLAbV0VMCWy3jfwAzAcgij2221UvBbmf0yUCRB+vcatWB8bvOcDzstl0wEJ2jnEy2BXuDuF9MDoKb2r+A37ibEb4HMOxvZJICa0x00zYAgC2tLF9In+gJKer4EbZA3TsVwdd1hDwrLdBUcV0LuqqFMc1i7DtwL3DNQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=RcaAJx5i; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="RcaAJx5i"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-ID:Content-Description;
	bh=wlhus1pwx5VmyD6fvjLI+ZlJDA72kCWqRJZzTJuDlVs=; b=RcaAJx5iIvZ739Tiu7zXz4RS0e
	x4Pz8iu6KUovclJrPLP8oMBI2gn9wPg1QLLiFUpP/wbTRzeR2uBQJ5SFcvHsHLn4LEY9FtlhWVVWJ
	QdDbO+npzRivvwnkryBi580L4pDrJf8imyXHRNMhS8v51K+GoA3lLl1UEREIUZ4/NXLYB5OOfePY+
	HuhMpwMzKwb7oInmNgILSBMl0ADmlIKOWn7tZ9sSB12v+wt7zCKK7iSN7JsaSN+Io+sgyHm644qtY
	+pTtjk2BHEznKc3IpUcB9gALFtGFQvYWIbXj+90K9LLj+BM8wtF4M2EnKF8+sbV+Yjkuz4+OTSgcz
	5osm1Edg==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wKex0-003iLk-00;
	Wed, 06 May 2026 16:18:18 +0000
Date: Wed, 6 May 2026 09:18:12 -0700
From: Breno Leitao <leitao@debian.org>
To: Lance Yang <lance.yang@linux.dev>
Cc: david@kernel.org, linmiaohe@huawei.com, nao.horiguchi@gmail.com, 
	akpm@linux-foundation.org, corbet@lwn.net, skhan@linuxfoundation.org, ljs@kernel.org, 
	Liam.Howlett@oracle.com, vbabka@kernel.org, rppt@kernel.org, surenb@google.com, 
	mhocko@suse.com, shuah@kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kernel-team@meta.com
Subject: Re: [PATCH v5 2/4] mm/memory-failure: add panic option for
 unrecoverable pages
Message-ID: <aftnSfb15G92JON5@gmail.com>
References: <9d365395-051a-436b-9017-352ebc889770@kernel.org>
 <20260428030721.51274-1-lance.yang@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260428030721.51274-1-lance.yang@linux.dev>
X-Debian-User: leitao

On Tue, Apr 28, 2026 at 11:07:21AM +0800, Lance Yang wrote:
> 
> On Mon, Apr 27, 2026 at 05:49:28PM +0200, David Hildenbrand (Arm) wrote:
> >> +	switch (type) {
> >> +	case MF_MSG_KERNEL:
> >> +	case MF_MSG_UNKNOWN:
> >> +		return true;
> >> +	case MF_MSG_KERNEL_HIGH_ORDER:
> >> +		/*
> >> +		 * Rule out a concurrent buddy allocation: give the
> >> +		 * allocator a moment to finish prep_new_page() and
> >> +		 * re-check. A genuine high-order kernel tail page stays
> >> +		 * unowned; an in-flight allocation will have bumped the
> >> +		 * refcount, attached a mapping, or placed the page on
> >> +		 * an LRU by now.
> >> +		 */
> >> +		p = pfn_to_online_page(pfn);
> >> +		if (!p)
> >> +			return true;
> >> +		/*
> >> +		 * Yield so a concurrent allocator on another CPU can
> >> +		 * finish prep_new_page() and have its writes become
> >> +		 * visible before we resample the page state.
> >> +		 */
> >> +		cpu_relax();
> >> +		return page_count(p) == 0 &&
> >> +		       !PageLRU(p) &&
> >> +		       !page_mapped(p) &&
> >> +		       !page_folio(p)->mapping &&
> >> +		       !is_free_buddy_page(p);
> >
> >I don't get what you are doing here. The right way to check for a tail page is
> >not by checking the refcount.
> >
> >Further, you are not holding a folio reference? If so, calling
> >page_mapped/folio_mapped is shaky. On concurrent folio split you can trigger a
> >VM_WARN_ON_FOLIO().
> >
> >
> >Maybe folio_snapshot() is what you are looking for, if you are in fact not
> >holding a reference?
> 
> Right! Maybe we should not try to make this decision in
> panic_on_unrecoverable_mf().
> 
> By the time we get here, we only know the final MF_MSG_* type. The
> real reason why get_hwpoison_page() failed is already lost.
> 
> Wonder if it would be better to split that earlier, around
> __get_unpoison_page()/get_any_page(). That code still knows why
> grabbing the page failed, either an unsupported kernel page or
> just a temporary race we cannot really trust :)
> 
> Then the later panic logic can be simple: panic for the stable
> unsupported kernel page case, and not for the temporary race case.
> 
> That would also avoid trying to guess MF_MSG_KERNEL_HIGH_ORDER here:)

This is a very good feedback, and definitely what I wanted to do, but,
failed. Once we have the reason, we don't need this dance to guess the
reason.

I've hacked a patch based on this approach. How does it sound?

commit ae7a09c989afe7aaed7ac4b5090d993ef1de0b38
Author: Breno Leitao <leitao@debian.org>
Date:   Wed May 6 07:41:30 2026 -0700

    mm/memory-failure: classify get_any_page() failures by reason
    
    When get_any_page() fails to grab a page reference, the *reason* it
    failed is known at the call site but is not surfaced to callers: the
    HWPoisonHandlable() rejection path (a stable kernel page hwpoison cannot
    handle — slab, vmalloc, page tables, kernel stacks, ...) and the
    page_count() / put_page race paths (a transient page-allocator lifecycle
    race) all collapse to a single negative errno by the time
    memory_failure() sees them. memory_failure() can only observe the
    conflated result and reports both as MF_MSG_GET_HWPOISON.
    
    Surface the diagnosis explicitly. Add an mf_get_page_status enum,
    plumbed out through get_any_page() and get_hwpoison_page() (NULL is
    accepted by callers that do not care — unpoison_memory() and
    soft_offline_page() pass NULL). get_any_page() sets the status at the
    moment it gives up:
    
      MF_GET_PAGE_UNHANDLABLE — HWPoisonHandlable() rejected the page
                                after retries.
      MF_GET_PAGE_RACE        — exhausted retries on a refcount /
                                lifecycle race with the allocator.
    
    memory_failure() then promotes the unhandlable case to MF_MSG_KERNEL
    alongside the existing PageReserved branch, and leaves the
    transient-race case as MF_MSG_GET_HWPOISON. The user-visible report
    now distinguishes the two; this also forms the foundation a later
    patch will rely on to decide whether an unrecoverable failure should
    panic.
    
    Suggested-by: Lance Yang <lance.yang@linux.dev>
    Signed-off-by: Breno Leitao <leitao@debian.org>

diff --git a/mm/memory-failure.c b/mm/memory-failure.c
index f112fb27a8ff6..a83fabadbce99 100644
--- a/mm/memory-failure.c
+++ b/mm/memory-failure.c
@@ -1389,7 +1389,32 @@ static int __get_hwpoison_page(struct page *page, unsigned long flags)
 
 #define GET_PAGE_MAX_RETRY_NUM 3
 
-static int get_any_page(struct page *p, unsigned long flags)
+/*
+ * Diagnosis of why get_any_page() failed to grab a page reference.
+ *
+ * Set when ret < 0 so callers (notably memory_failure()) can tell apart
+ * a stable kernel page type that hwpoison cannot handle — slab, vmalloc,
+ * page tables, kernel stacks, etc. — from a transient race with the page
+ * allocator lifecycle (allocation/free in flight). The distinction
+ * matters for panic_on_unrecoverable_mf(): the former is a real
+ * unrecoverable kernel-owned poisoning, the latter must not panic since
+ * the page may be destined for userspace where SIGBUS recovery would
+ * otherwise apply.
+ */
+enum mf_get_page_status {
+	MF_GET_PAGE_OK = 0,
+	/*
+	 * Transient lifecycle race with the page allocator. Recorded for
+	 * symmetry and for future callers that may want to distinguish a
+	 * race from an unhandlable kernel page; no in-tree caller acts on
+	 * this value yet.
+	 */
+	MF_GET_PAGE_RACE,
+	MF_GET_PAGE_UNHANDLABLE,	/* stable kernel page hwpoison cannot handle */
+};
+
+static int get_any_page(struct page *p, unsigned long flags,
+			enum mf_get_page_status *status)
 {
 	int ret = 0, pass = 0;
 	bool count_increased = false;
@@ -1406,11 +1431,15 @@ static int get_any_page(struct page *p, unsigned long flags)
 				if (pass++ < GET_PAGE_MAX_RETRY_NUM)
 					goto try_again;
 				ret = -EBUSY;
+				if (status)
+					*status = MF_GET_PAGE_RACE;
 			} else if (!PageHuge(p) && !is_free_buddy_page(p)) {
 				/* We raced with put_page, retry. */
 				if (pass++ < GET_PAGE_MAX_RETRY_NUM)
 					goto try_again;
 				ret = -EIO;
+				if (status)
+					*status = MF_GET_PAGE_RACE;
 			}
 			goto out;
 		} else if (ret == -EBUSY) {
@@ -1423,6 +1452,8 @@ static int get_any_page(struct page *p, unsigned long flags)
 				goto try_again;
 			}
 			ret = -EIO;
+			if (status)
+				*status = MF_GET_PAGE_UNHANDLABLE;
 			goto out;
 		}
 	}
@@ -1442,6 +1473,8 @@ static int get_any_page(struct page *p, unsigned long flags)
 		}
 		put_page(p);
 		ret = -EIO;
+		if (status)
+			*status = MF_GET_PAGE_UNHANDLABLE;
 	}
 out:
 	if (ret == -EIO)
@@ -1503,7 +1536,8 @@ static int __get_unpoison_page(struct page *page)
  *         operations like allocation and free,
  *         -EHWPOISON when the page is hwpoisoned and taken off from buddy.
  */
-static int get_hwpoison_page(struct page *p, unsigned long flags)
+static int get_hwpoison_page(struct page *p, unsigned long flags,
+			     enum mf_get_page_status *status)
 {
 	int ret;
 
@@ -1511,7 +1545,7 @@ static int get_hwpoison_page(struct page *p, unsigned long flags)
 	if (flags & MF_UNPOISON)
 		ret = __get_unpoison_page(p);
 	else
-		ret = get_any_page(p, flags);
+		ret = get_any_page(p, flags, status);
 	zone_pcp_enable(page_zone(p));
 
 	return ret;
@@ -2349,6 +2383,7 @@ int memory_failure(unsigned long pfn, int flags)
 	bool retry = true;
 	int hugetlb = 0;
 	bool is_reserved;
+	enum mf_get_page_status gp_status = MF_GET_PAGE_OK;
 
 	if (!sysctl_memory_failure_recovery)
 		panic("Memory failure on page %lx", pfn);
@@ -2424,7 +2459,7 @@ int memory_failure(unsigned long pfn, int flags)
 	 */
 	is_reserved = PageReserved(p);
 
-	res = get_hwpoison_page(p, flags);
+	res = get_hwpoison_page(p, flags, &gp_status);
 	if (!res) {
 		if (is_free_buddy_page(p)) {
 			if (take_page_off_buddy(p)) {
@@ -2445,7 +2480,12 @@ int memory_failure(unsigned long pfn, int flags)
 		}
 		goto unlock_mutex;
 	} else if (res < 0) {
-		if (is_reserved)
+		/*
+		 * Promote a stable unhandlable kernel page diagnosed by
+		 * get_hwpoison_page() to MF_MSG_KERNEL alongside reserved
+		 * pages; transient lifecycle races stay as MF_MSG_GET_HWPOISON.
+		 */
+		if (is_reserved || gp_status == MF_GET_PAGE_UNHANDLABLE)
 			res = action_result(pfn, MF_MSG_KERNEL, MF_IGNORED);
 		else
 			res = action_result(pfn, MF_MSG_GET_HWPOISON,
@@ -2750,7 +2790,7 @@ int unpoison_memory(unsigned long pfn)
 		goto unlock_mutex;
 	}
 
-	ghp = get_hwpoison_page(p, MF_UNPOISON);
+	ghp = get_hwpoison_page(p, MF_UNPOISON, NULL);
 	if (!ghp) {
 		if (folio_test_hugetlb(folio)) {
 			huge = true;
@@ -2957,7 +2997,7 @@ int soft_offline_page(unsigned long pfn, int flags)
 
 retry:
 	get_online_mems();
-	ret = get_hwpoison_page(page, flags | MF_SOFT_OFFLINE);
+	ret = get_hwpoison_page(page, flags | MF_SOFT_OFFLINE, NULL);
 	put_online_mems();
 
 	if (hwpoison_filter(page)) {

