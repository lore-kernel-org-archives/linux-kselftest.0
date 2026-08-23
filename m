Received: from flow-b2-smtp.messagingengine.com (flow-b2-smtp.messagingengine.com [202.12.124.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B8E53537FE;
	Sun, 23 Aug 2026 19:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787514302; cv=none; b=NmnzyDTPNtEVUmAruW581RCjhDQGpT0EeVTbGojNgp/Y46WS1hHLqHMTMjS1WkvRfur9nSY6w0GOXNrwoSiVkD3YUrEEgNrGeEMzzXjyvyapN1VfNtxwy89HSNBG5UFm5oQNmVdkIdWCMFQZ1XdC8MSb1UTeOS+UkVWnvA/sNPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787514302; c=relaxed/simple;
	bh=GES204Iv+HxKIGR2UEDxYOdowdL4g+5vONVl9roPYpw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KIBK8kEJ/FXIC9nB2GRsJLG5iHnkYyINRu6elOgYqzHlPe0IrMKDgTPjPunlS8y8GHWXFDrBJ2duySGr6JYnB5IaJNFYrQinKcz4TW0OwFut4a95lwUhwdgogMIdzRTPAO8KAt9xIXYLC+phiMgK9InmoJY/LLhY020LEX647pY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=iBG4CWTA; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=gqFPsMeW; arc=none smtp.client-ip=202.12.124.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="iBG4CWTA";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="gqFPsMeW"
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailflow.stl.internal (Postfix) with ESMTP id 6F6111300087;
	Sun, 23 Aug 2026 15:44:58 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Sun, 23 Aug 2026 15:44:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1787514298; x=
	1787521498; bh=B84SOBpXfchnbFJACUkoJj9mcWI8juB/tA+PVTwP76c=; b=i
	BG4CWTAP7+gUYMgy9z5g4eejHoYHqYLzpMEXMvwc8rEEcV65F2hT1DyQ58OF8l8R
	WgZY5XnxgvH/HxEs0uw2gvpsHM4SCToVZVU91zpFUmrwDlXU4ZWHBRoY2OqDbHQD
	eRbIIkEmJp2qUYwwDw3DgMODVKW/xDi7pu/Tni5AQnASVWblTYLIRCFbIA79zrUf
	0sSjsG9mcfoW5SQX0n068Nh7idswA0izC0oeJ0vcQtLPDlZQTuB0Om40UxQD+kVW
	Y4cFRWFSPSV8OWCYX4/KsHWJFeqIYdGJmg/iCLX26Ex+70g/fKaMV3r51FTLY3aq
	MIYyZCKlzZSu5f+bK8XPA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1787514298; x=1787521498; bh=B84SOBpXfchnbFJACUkoJj9mcWI8juB/tA+
	PVTwP76c=; b=gqFPsMeW+Z9xupKErzuF9zglO8p5tDXIu1unCaMFm/mG3ChAcdg
	QUv+NbVH1O5bayIwEw3wwy/EzZCYVIn2mrtK+ca66ks8vL2/30T6Z1foiwaE5t0I
	vXWWDOeHRDJPGmrDfJha2NbPyXUGz3a7eKHN/RbQJ2iTvAAorLYyBTNIySY2kUGy
	URRFbGBupkdvw3E87RUrHLylS4ktDl9LHqYJqXVtFYuCjUhHGFB6qukmIi3CYGFk
	k7g96DLhIDYj+ziRC7AfnTdpFoSB31oO2y7J2OK+5F/TMnpR0o2OVum4K+wg/7J1
	sTHEUzLao5kLp0XDuLveg3ZRREr4TTV4l0A==
X-ME-Sender: <xms:uU2Lat0wwgOYyNH0K9VuC1lRAv689_RmKhkIqm4CqaCq147FfNhjqQ>
    <xme:uU2LatEhyBrFCKxS4JhVXdR0aHUlmuf1MOInhugHgEWxaixPjGAJv_UP7YRRt_9on
    lrNtqcNeJOKSzWv2s0XJdPDnUnEslohFaF79Jm2lLG9Ag0LPuKodBc>
X-ME-Received: <xmr:uU2Lank_IVdvePPLo4gh0sd42cewsq1AWTLujf7Km2MIdfc_XJiBJpzsErs>
X-ME-Proxy-Cause: dmFkZTEF7/FO4zwyXX9a2VYUo7USSjPaeOP+cnpDM+WG0kKCq3cXs8+WFpXJLKiQaM6AFB
    9Jti1uPrb10pgcdMGQXlIi3HP2Xg0MT2tStA7MuH7LdjIKrsMlonkxDg7jHKTi6a1zBPyy
    gO0cPC/y5rpJbbvFWttg6jBkX7OJkcZGzLR/50kzal4cv+JmXzi3e+TymywizE9AYOviSN
    IWms+Rhycc4UkGhTZKJTm/xBReiFWIGw27IETfSNdWlcewX8droIaCy5QGmUYxVn6kD1qu
    LiobeL4lQDfnZGe2uscBDnio72jOq+cmJmGjj+aRP9+C4oAnw85Aug9+KQB2/HFi4pWzKD
    4g4mXewx2n7bApMhnOofVrvj3xCgxDEVO5MVTiYYK4narHoKgK/KdKYbz96jrf01MZA4jS
    cYp75MXnPj02AGJQkR359A0gixsHp7BzZIqP9OoYzY0PikQSY3NORG6m2qGqtsQJvHCvJe
    OIGMYyi1ivJRawkUzaAWyFgnhP2tJmATDXhLa0EwKmPQ7Gkk1JaIoeASbQp7LZEaSFpc17
    Rv/qMMi5Bj/OR8qCIyRBwa5Zh6y9xYxEoHDuhJ2XFE81usGGzlHC4Liq8u5y8fQ/Rc6gch
    +eAg3S6bawkpoEetyA5akZ3epiU/rK3dzHeUEbuTAZzafH55pvfnIdDHC+fQ
X-ME-Proxy: <xmx:uU2LahwMB45LiF7mqN6T3AUsJtdvv-ZIWd7ZXOZz3uMmqZZBXgyu7A>
    <xmx:uU2LaixseAHrYKsZEVxpe4ktK9xHMA0LIUv-kGZ0hcwmHMau5sZ4Lw>
    <xmx:uU2Laj8lHmf9-wuI84TQo9o7OR3A8Hi0ISCkIYwjqU7UQr242DGPLA>
    <xmx:uU2LaliIuTrmZf3sz4Vgby9rdhlSXXamo96Cw9BbkHnPSVTsqs6rNQ>
    <xmx:uk2LauR-8uC652xrjTvHDb96PrqUVHOAVMwQbuXXofXp7KTmMPlJPl54>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 23 Aug 2026 15:44:56 -0400 (EDT)
Date: Sun, 23 Aug 2026 20:44:55 +0100
From: Kiryl Shutsemau <kirill@shutemov.name>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: akpm@linux-foundation.org, david@kernel.org, nico.pache@linux.dev, 
	baolin.wang@linux.alibaba.com, baohua@kernel.org, dev.jain@arm.com, hughd@google.com, 
	lance.yang@linux.dev, liam@infradead.org, mhocko@suse.com, rppt@kernel.org, 
	ryan.roberts@arm.com, shuah@kernel.org, surenb@google.com, usama.arif@linux.dev, 
	vbabka@kernel.org, ziy@nvidia.com, usama.anjum@arm.com, agordeev@linux.ibm.com, 
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 04/19] selftests/mm: skip khugepaged page cache cases
 without a PMD folio
Message-ID: <aotHcV0a4bTMdX7Y@thinkstation>
References: <20260815015901.1236937-1-kirill@shutemov.name>
 <20260815015901.1236937-5-kirill@shutemov.name>
 <aoQuhSq-2Bd3Kz67@lucifer>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aoQuhSq-2Bd3Kz67@lucifer>

On Tue, Aug 18, 2026 at 11:07:55AM +0100, Lorenzo Stoakes (ARM) wrote:
> > diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/selftests/mm/khugepaged.c
> > index c499804a0ec4..ec5c36a19d92 100644
> > --- a/tools/testing/selftests/mm/khugepaged.c
> > +++ b/tools/testing/selftests/mm/khugepaged.c
> > @@ -1357,6 +1357,30 @@ int main(int argc, char **argv)
> >
> >  	setbuf(stdout, NULL);
> >
> > +	/*
> > +	 * The page cache caps folio order at MAX_PAGECACHE_ORDER, which is
> > +	 * below the PMD order on arm64 with 64K pages.  A PMD-sized page cache
> > +	 * folio is impossible there, so the kernel refuses these collapses by
> > +	 * design and there is nothing to test.  The cap is not shmem-specific:
> > +	 * it rules out regular files too, and the per-order shmem_enabled
> > +	 * controls exist for exactly the orders it allows, which is what makes
> > +	 * them readable here.
> > +	 */
> 
> This is a very schloppy comment. Can you trim it please?

Will do.

> > +	if (!(thp_shmem_supported_orders() & (1UL << hpage_pmd_order))) {
> 
> Is this inferring file-backed khugepaged behaviour from shmem? That seems iffy.

The helper is named after shmem but the sysfs set is the page cache one.
`thpsize_create()` creates the per-order `shmem_enabled` attribute under one
condition:

	if (BIT(order) & THP_ORDERS_ALL_FILE_DEFAULT) {

and that mask is orders 1 to `MAX_PAGECACHE_ORDER`.

So hugepages-<N>kB/shmem_enabled exists means "the page cache can hold an
order-N folio", for regular files as much as for shmem.

thp_shmem_supported_orders() name is confusing. I think, I will add
`thp_file_supported_orders()` over the same sysfs walk and use that
here.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
