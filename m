Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BEFB3446AD
	for <linux-kselftest@vger.kernel.org>; Fri,  9 Oct 2026 14:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791555815; cv=none; b=oOLtxE765uITPEgv85pT8LxRcqug63T6Sm6CaK7UuSL3aRGdwj97gbjLpt7+csetMjjFSv+KYXwETUQbY5APSqFO+bwsvE7efI1qyK9xzBImOpPxTN+7DL97MVRmL/rA0NCFSuZSVT1iQ3g2kNumGv+jx34CVplguNJdSsEboOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791555815; c=relaxed/simple;
	bh=/1UEOuZ+Ll6lf+9/1SsGFJnZKpP/B6Tg0ZL9vkY0f+k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N4YWSc6/tA8+usEhrfFrdG7bDX8krwivCtD+4K9zXhuWGsYLZ2W7qjdWdKR6veJFRwfbxKWiHzCWGHuZr5qDYh6cl6qkPkw/gDGXnpRNe/YMSwoOnSTfVr73uJIiTR0DMAxLvcuML1hwwJ2txsnwPGqNMuduLorJGA3oGaVqKho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RTMGPW6R; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RTMGPW6R"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2CC31F00898;
	Fri,  9 Oct 2026 14:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791555814;
	bh=zPximgPYOjlnCBCEig1+vZE6bEGZG5a82BOf6YtVY4o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RTMGPW6Rf6jdy8aKKQGd83rIgqGX9ybuYlrgS+P/krAulZaM/2lpkjFFP2wToYlIe
	 dGerEFluEqbmRf6AT4D8AzffOq/ct5j7B5d8a8Rsz1SNrdGIyccEfyxVa4bVwaQXC9
	 F6QpnOYnz9rNWD537Xt+jKrNzaBnqtG+/Iqpf8WuyI515i9qLpWKCBbFpMLeDImyZu
	 RuO4UQWVA7rwVykMRdxArVjt4GCilkbKpU7HWGRqUPoHsX4oDSjyP2S/tUIRFbNyuG
	 IjAr9yvfN5QeubvXCvPfBkmNtqjEsIIkvgnogJnXIYfUpMD2y2DZ8TWzEq4huTpPR7
	 rZI/KCsULASew==
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfauth.ams.internal (Postfix) with ESMTP id E84CB198003A;
	Fri,  9 Oct 2026 10:23:26 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Fri, 09 Oct 2026 10:23:31 -0400
X-ME-Sender: <xms:3vjIak5OfMatuMjarmix0UGXN9ymKCh7KNBSxpIeGyRvRDbxPYUFaQ>
    <xme:3vjIajlLi65LZnGk3miWEo-WjVfhYvQPK5SxsxT1FTkhW6pZHoYYtuHKhgoTQYG24
    Eqcm9vDXImwPiVjahIUJQjDleP4Ph8Hhdy0-Qog36u-4kLdnxACrRg>
X-ME-Received: <xmr:3vjIargk_6s28Rg8sHa_MatlAM745MGgF8lHvjBk9D429RWzwS2XtQEEJXk>
X-ME-Proxy-Cause: dmFkZTGO+g2zX1FiOhy8heZwWXTAz6Uw5TzxGJTmOuPIKGRaFAZhdrZAa5U7NDL1Brz9IB
    qzfwrM+86at4iyZba1Y1MmLORr8YwJmYmkQg/zLXkc0jHlVc8E9gxrnVvqLlQ7pOzrtq07
    Q18eInU1fNpsV0pno0Nn2WfvNFjpIc0H/FmNRVToRXNau5ypP/DrC04ygf07Al3LlsNzqP
    rYUg4t+AJ14euEZAud0Eqbty+KzUsFTLCCYsBe19xXI3axeQGkFauh20UKs0+0DYBXXfvc
    UUc0Ld2G8pWFta2rG3CBnvSHOxJwb7DC5URbyyyAQgUPdjnon9NEu31HqU4S0/g4U1sBh7
    4b6fAmlbDW0OF2ApsFt7nmRBK4DudgGVCTYx8WCa9Qthu0WDZGlcRb0PFp/pjGnlpEVddG
    3hS2xcsa+RSzRvaGsths2eiHzNr/ULe2y5+CQVGRC9RJamEJ448EE8TKOvMJRL9mGbjyLd
    XiV/u3Ha10+NkI0m+PxmCutsZ2tjzAsCxOlUQ3VKAd6aBbM2lJz/7UF6TZlAX8pLOO3vgd
    10jgXY0epXeynoieydnUPC6PtH7FV3/b9mL/2IE6HHHTlqSILETiYoJYQC9kD/8EWV9FZb
    xtOEnu1G+eMtCGPu161eqRouSKMyyb04lmLLuybaDHmEjl0hShtDiIDWIkNg
X-ME-Proxy: <xmx:3vjIahjVsBtyc936QCJzoCo7GG3N8WYZea2VQim_Bq9sfVojVVwqgw>
    <xmx:3vjIavV3kR7ZYZBaFT6UKjVJq1KDzi7goKo7pmS0iRFcMqMIKCpLqg>
    <xmx:3vjIav17DzBbrYPRTwErbq6gHDEkMjcvQqQtENqeQacN8CwVB8LcOA>
    <xmx:3vjIahRpFhGjxziaVH8O-4n2ZWNYv_9RcNNWpINFxGPRjAL-C-KWGA>
    <xmx:3vjIasDRvBq0p7trqMof6sH5LYJwF8dj_zIxSyPSo6cqmtjjcIDHHsM2>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 9 Oct 2026 10:23:25 -0400 (EDT)
Date: Fri, 9 Oct 2026 15:23:24 +0100
From: Kiryl Shutsemau <kas@kernel.org>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <nico.pache@linux.dev>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, Peter Xu <peterx@redhat.com>, 
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Leon Romanovsky <leon@kernel.org>, Sarthak Sharma <sarthak.sharma@arm.com>
Subject: Re: [PATCH v5 2/3] kselftest: mm: remove HPAGE_SIZE and HPAGE_SHIFT
 macro
Message-ID: <asj4dT2Q__SlKhgr@thinkstation>
References: <20261009-fix_hpage_macro-v5-0-54378ae45add@arm.com>
 <20261009-fix_hpage_macro-v5-2-54378ae45add@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261009-fix_hpage_macro-v5-2-54378ae45add@arm.com>

On Fri, Oct 09, 2026 at 02:27:33AM +0100, Yeoreum Yun wrote:
> +uint64_t pmd_pshift(void)
> +{
> +	if (__pmd_pshift != -1ull)
> +		return __pmd_pshift;
> +
> +	if (__pmd_psize != -1ull)
> +		__pmd_psize = pmd_psize();

Sashiko pointed that this check is inverted.

> +
> +	__pmd_pshift = (__pmd_psize > 0) ? ffsl(__pmd_psize) - 1 : 0;
> +
> +	return __pmd_pshift;
>  }

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
