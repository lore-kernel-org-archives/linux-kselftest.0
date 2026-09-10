Received: from flow-b1-smtp.messagingengine.com (flow-b1-smtp.messagingengine.com [202.12.124.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A8E8472780;
	Thu, 10 Sep 2026 13:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789045484; cv=none; b=eZYbHlUhiMBkh/eNXqSyryastQZHsU4hdolVWM9feul6O/p39WpReq7e3ZRDUiA5T6c3e3m9tcnSWlyWbXvEpNt01SErymGuxLOLay1RK/TuVehdH7MxH2tRdtQldfyq5UAdAQnrNJTi3qkSKfREj8bbYeLsLooHUAZXzedXzVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789045484; c=relaxed/simple;
	bh=6SUrTyrFC4X0SauFaRhaOHmqGLiDynswuu7D7Set+T4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WyWI5eqjxGLMZufsBowJ7f9r1DDCNatfVX+o/TzYmTvHrQG9PtaKVLk7gKN9BxKEuAUKJPNtPb0fHGdwQmk9Y9pXaUFblvQ2FnFIhu8cHbVnG72qualPXtGBBEhP24w6LR9quL+xJantTTiDshIXS3h2cCuUCnsBdgTEyjx125U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=HbElgJRM; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=oVBZsIV/; arc=none smtp.client-ip=202.12.124.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="HbElgJRM";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="oVBZsIV/"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailflow.stl.internal (Postfix) with ESMTP id 311BC1300DC9;
	Thu, 10 Sep 2026 09:04:40 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Thu, 10 Sep 2026 09:04:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1789045480; x=
	1789052680; bh=KV7XC8+HfJo2WCcRdFe2DjTL8zq9dSIHiccyK3AlT4Q=; b=H
	bElgJRMEbERl1+nAd+kW9yaqu2UYYpiIMMfqBOlgxuZCg8RzxiGpYJ3HJLUO1lzO
	LDl0gXvqTEsdY1A/P6dKgL/PlY39t3HlsPhcsQrC9g7ITFQiNILUVZqLE1lFKvSI
	hCYWo8hWgzVUu4/uegICPxVIYjvnm+BKURMtflLpLWaolzZJwSYLIiHCDtWpUTU/
	h1Uot5ZXV5vBIMZycPWrhHBouSonC0RIQn6CLlNKZFa9DrZ2gDkdjQEfn5MoLjzC
	Wl2+kF+G+77XzuHyHeZIaIDSqsxAIaxGxrc3XYvKLiyUJlf2AFwngH+m7IcT+jL0
	Xv0w/x+1LhsDBTd0/wwdA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1789045480; x=1789052680; bh=KV7XC8+HfJo2WCcRdFe2DjTL8zq9dSIHicc
	yK3AlT4Q=; b=oVBZsIV/jGPLkFnHK5fKCRceo2RhqyVWgJrMPfTJzhd3TzQxKIW
	sto0t6rW4VBiR/rPUkK/AdM58b7djr4IS/70B5HeMEQnKLQREe7aU/8gGTCtr5hl
	/3LxYzRh6P72wjkgGiUTcnvOgr9PB8DSpj/3iGi+tKgeWkA7wZuzeEJo7jjLbAUX
	ihYq0hMTk8uLu2m15H/zcD0MvC+oR/azRxVj5X6kz8Q5Ypi2IICQIUxD9sqD/tvq
	N3NE2uwVlXYjb+LpsFPKJwGw7S3JEu3asBHXTSoZS/pzHZTb8gM7EMopILscFFky
	0gfB6VrfHr5TuZ7fz6ZwsWjlwnRxZA7rsoQ==
X-ME-Sender: <xms:5qqianj176YN02lMJxSb4EhgK6XJtpxMm5s_wF8HORrZBsSvFLtVQw>
    <xme:5qqiaktgneoW465jMDoTGJ9mBgF3LIte14lEibp_-xu4Iud84BrOG2uotCs9MMzRu
    Jem2JRdAplIfXhDt53RLPVOh2ZTPO3Hm0JUc66BNJCgPG55Svj0OvSf>
X-ME-Received: <xmr:5qqiaiLJoEc6orBizfd_a84A21rAjlmVVDjrAEtHakmiMH2QSSAXngH_Q3Y>
X-ME-Proxy-Cause: dmFkZTErqcWawBBo4NhlkntMFUoIJIaTUydErcobOOD2qAARaG/wohlBtCRTJcJOM32uP3
    Su2EbwwCyp3i+tYUvxY2bamyQSTy/GKV369qRr9JqOWEPBUJxU7Z3UmtAq5W/iHR2L9J47
    tt2BIFncpu5ZNx+sqC5cXqahs97pcgKZbPSGqXMpO/eInoNtlSNtCmaahg1NAfhhBYNSzG
    mdVcqjwhA4ZOSmHsK3bJ8OZwAmUgnvgizo6JLW2iY+tYJWxkD/JyrUUQkamZ3ACJHeWiut
    e7fio3BHz99JVq2AIaS7fMDOFkOm4z6epfRVHFGZ37qIK1VIWQ8NJXl+eU3AhPq8T5iYmU
    Kh3TN5NnQykKmZ6US7nhNTnmJ891tXgs7BvVN5lWXoG1cSxevyWz07UCYd+fVZ1OTe79PL
    MbYP5qPaBmTkSqT5lzJ0htc4A1Y0PDLTU+jgCIn22Jir/NPJEjDcjtFW1917V6SFWG4qzX
    IFtc0qLFt+t1dExkY8i9RuPI9QCj174skW5QzCXtckImpPHjb/mT5dOm5k3f8v9tZVPT0+
    bpHHEZzPhkRCWbEca5c01lLweMm0oZYg1/+cOpHlCpsfwVDYDZNM37VM2do+gv5D5NYyZh
    7gJVUH9jUCEYaFksK3SHd5B2ovWpO0fZH0AUyFOq2PvNUvlBRdEbHCJz4jyQ
X-ME-Proxy: <xmx:5qqiakQBUz5ibuwpZUvVFWhzF50qkaTG3wibznBs4EVd7YSkM4w2Ig>
    <xmx:5qqiansrfVFGHZBlEpqA73jPCfxbZFDsuj6W4a51WSLlNz670Hu3LQ>
    <xmx:5qqiargQBe4kcB93VgrvSkPR_d15jPamovI07Zy1lehQeVZvpRl5NQ>
    <xmx:5qqiao2S6dERuJZ6cSe5xZiW-MzHNw7oP6W2AzGNuaO954chXvrvPQ>
    <xmx:6KqiapOv4Km96vz_Hzt7vlskbffNMNn6M7FRmyBNRq0yuEjl_J8OndKQ>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 10 Sep 2026 09:04:37 -0400 (EDT)
Date: Thu, 10 Sep 2026 14:04:35 +0100
From: Kiryl Shutsemau <kirill@shutemov.name>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org, 
	rppt@kernel.org, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, usama.anjum@arm.com, usama.arif@linux.dev, nico.pache@linux.dev, 
	ziy@nvidia.com, baohua@kernel.org, dev.jain@arm.com, hughd@google.com, 
	lance.yang@linux.dev, liam@infradead.org, mhocko@suse.com, ryan.roberts@arm.com, 
	shuah@kernel.org, surenb@google.com, vbabka@kernel.org, agordeev@linux.ibm.com, 
	jgg@ziepe.ca, leon@kernel.org, kernel-team@meta.com
Subject: Re: [PATCH v5 08/19] selftests/mm: add folio-order check for address
 ranges
Message-ID: <aqKqr62-718Vw35k@thinkstation>
References: <20260908125105.1510704-1-kirill@shutemov.name>
 <20260908125105.1510704-9-kirill@shutemov.name>
 <feb76c81-db9d-4a36-9a31-0b2b31e3c3fb@linux.alibaba.com>
 <aqKFXlpSELmCtt-z@thinkstation>
 <65bf1722-c1fd-452a-88c1-c030b042cfbc@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <65bf1722-c1fd-452a-88c1-c030b042cfbc@linux.alibaba.com>

On Thu, Sep 10, 2026 at 07:14:42PM +0800, Baolin Wang wrote:
> 
> 
> On 9/10/26 6:45 PM, Kiryl Shutsemau wrote:
> > On Wed, Sep 09, 2026 at 06:01:13PM +0800, Baolin Wang wrote:
> > > 
> > > 
> > > On 9/8/26 8:50 PM, Kiryl Shutsemau wrote:
> > > > From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
> > > > 
> > > > An mTHP collapse test needs to know that a range is backed by folios of the
> > > > target order, and that they sit where a collapse would put them.  Nothing
> > > > answers that today: is_backed_by_folio() classifies the folio behind a
> > > > single page, and check_huge_anon() reads smaps AnonHugePages, which only
> > > > accounts PMD mappings.
> > > 
> > > Have you checked check_large_folios() in vm_util.c? It seems to meet your
> > > requirements, or am I missing something?
> > 
> > The changelog is out of date, sorry: since 6dedaf0d46a9 check_huge_anon()
> > counts mTHP folios through check_large_folios() rather than reading
> > smaps, and it is what check_huge() already uses for mthp_khugepaged.
> > 
> > It could do this job too, called once per window.
> > 
> > What is_range_backed_by_order() adds is alignment check: the folio has
> > to sit at the window start. And check_large_folios() reopens two fds per
> > per call which kinda wasteful.
> 
> OK. But can we extend the check_huge_xxx() functions to meet your
> requirements, for example by adding a check_aligned_huge_xxx() that wraps
> the underlying implementation of check_large_folios()?
> 
> I still find it confusing that khugepaged.c has two separate sets of
> functions for checking large folios.

Agreed that two sets is one too many.  Yeoreum's series rewrites
check_huge_xxx() on top of pagemap and kpageflags, which is what
is_backed_by_folio() already walks, so once that lands the two can meet:
the mTHP branch of check_huge() checks each window for a folio of the
order at its start, and is_range_backed_by_order() goes away or becomes
its internal.  That also makes the generic mTHP cases stricter for free.

I would rather do that as a follow-up than fold it into either series
now, since both touch the same functions.
-- 
  Kiryl Shutsemau / Kirill A. Shutemov
