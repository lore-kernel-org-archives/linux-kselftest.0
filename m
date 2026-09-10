Received: from flow-a4-smtp.messagingengine.com (flow-a4-smtp.messagingengine.com [103.168.172.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E217F3FC5A5;
	Thu, 10 Sep 2026 10:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789037590; cv=none; b=RvFKro9zsLkWoRqahBYFUDnTni4q5A3hM0ejCTOFNMTEh6ivtyfL0dxgChXS38PZWyRTUexwzZb0cEo7f7SPW7CiUFTP8MK7L9fVoV4Zr3iHTqm6s0+pXk3mF4AGfe5lf4MSUWZnGlHgz4c/t+sNcNaly7y1PX6PUG/3u0Z6SEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789037590; c=relaxed/simple;
	bh=RanAhuVgfYGKMVwe6+jPNBKJGsY9fz/kNrV2Z7HXthI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZSRXrPT53+zSBi2BegDQjm8jZvzwCP1iDKYXvGn/PSCLfl4sTN1A+af8D8WUpCqmVzXhru2DVt+0sEORudJ5GQvFvohI9srtR7UAkyygggfkVfPvrPb4+wElQVUkB3FLwl96StCWHbbGn/e+RUB0pRbZcmK/LFk1jPC0rhMQYxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=ULGwQTGo; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=EurtyFPE; arc=none smtp.client-ip=103.168.172.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="ULGwQTGo";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="EurtyFPE"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailflow.phl.internal (Postfix) with ESMTP id 9A3D6138008B;
	Thu, 10 Sep 2026 06:53:07 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Thu, 10 Sep 2026 06:53:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1789037587; x=
	1789044787; bh=k+8rtwSHSrI9CyOt3ir8SRov9uZb8NBx1Vr6rpUk4gs=; b=U
	LGwQTGozNl/IPGGjCXuDMOsntcCez3zg/Ha2dGz9tYT3G61pxwfRKRs0EByPsE3i
	gmDe4gHet0V520BJCZa4WZApFYAmztGqny8uYeuH6MSgfe71z/damSS4VimZiisx
	uQSSH7IbN5TwStxojrOoiha0msT0YF4RjZIFsxoonJEnCjSAEyDb4aYaI0mKniQB
	16NEF0NKnM8/CnlF3TIGi5f06y7rNjk4iR9PENFxKXmIoDuoR2XdN/wkii4qp7A9
	9Ev1sZ5MhM/tCDitZ0+KS21/T7KXKCg8+l+QctESd2ks4PVqbOI9BJiBlWk2hqBK
	83qJ3kQf7MKsUueNTyVfA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1789037587; x=1789044787; bh=k+8rtwSHSrI9CyOt3ir8SRov9uZb8NBx1Vr
	6rpUk4gs=; b=EurtyFPEo2JWSwfUd3esJ0OVwAFP3GtEbaey2gzLSLaSkJcZYpF
	im3hyvwRNti5b56UUztde85TylbNRDdBMb/14oIRnvQEmBTx/KfUovjS6k5HaIIA
	cAXSxeyZjzUqrKxy4bxfqFS81PpXgWqaU4SVn0Ea6NSIHenhzf7v2uClGPgd0Uyl
	YINnbhB432+Rr445boRrAJ117LZMN+nNnxaDMrdMimuJZCVwLUMpfMGiflTuOxx7
	R58WlvuFyl6Tw6diqkp1dybjQvAGKH/2MRk6uvelvEGMzLHjybMbdZigNl1ycEAJ
	86McL9Ltfi2sRcwQRGvLl99xm8Y2Y1p34JQ==
X-ME-Sender: <xms:E4yianSmG3oq4oWvK7XVEmK26ttXq1bXEEykZOHtIyRiCczvXPIJhw>
    <xme:E4yiapcjisVyAccKNATpuSjubLw9r1WC5PlgqSPXSvLw5M8fkj-lZELgGQDmrWGEZ
    G25KUplbXORG1TpgwvN8OrwLbxgLV-0jpc3AdAz48q9xo1Hi7KO7FQDNQ>
X-ME-Received: <xmr:E4yian449icMacN0l0Ek_WlvkH6qEiVI4LT9Gnv0ocDewhm3SIkeEwcZWYk>
X-ME-Proxy-Cause: dmFkZTGm5Ju+9RBw0LciogPg7Z02SsGVTwF8bQ54/MSBlaYiHGVbwMnPgwR4nFm7A5aN1G
    ab90Zq85LRgdUM/dlmRESEm7z20IlJXdxeC6kX5GhjGqwvlB68/Nv0mgLB37gddPMzpnPQ
    vp9rSZz7wN3LWzRxF0mP7S6VPxGBqvdpzzlswY0dXVqVuVn2Z+rEw/6GeA6qrvATGKiYIv
    Qy0DlhDB5aF38ZdmPHO0pPN3BhKBOXVShFmZniW8ukI3HgOl/hVw0fF02ROKLxbp64XEwY
    9Kca43nVc9tLTqn5zCuPcIXBRozBqbzB/gDlgSu6QP3tPP6rKHXjE+bjvXYwMnOtQmWRjj
    pa6OjPgx7sQ5JfXBq2VE3A4gkJiDRh3y77Ml8S03QUzozR5Xqkypwa9U83xSQK3612BPtL
    iAghnJJWMO8Lz+ZPfvgXWY68Dx5JKFsApypDKirsgwOV1X/pVYy4IH2SZNUtT0PtacMv7n
    jPihBak+XGcUxCduNS6qmUnf/qrf55FDJCCKseOBjlNEoEGxdRsf6FZvfOjoGmF7H+izJB
    06oKvbqm5CPP6basFX6LLqpZ4kCLBCqhSCuYbO3o5rNcBxMawrXGBxKfv93FRJk3ndLNYd
    HHCf8INfIhEhclCzHJVDroPuiahek7lEArIWASnZIZVfzSQBQWww/6EUQFjg
X-ME-Proxy: <xmx:E4yianATkPXaSjhj-I8Nr-ewS3NuNvy86-98fHFDzar2UrtxpKe_HA>
    <xmx:E4yiajdwYR0tCmPfEjFxfRUOJkdfAeDr_z0DkKzrTZ1-gIS0W2j5YA>
    <xmx:E4yiasQ8RzkNXaR3ONt44CbC5AfsN8zG6YVBl4iMYBJc78bZwkRq1Q>
    <xmx:E4yiaqkbuVPu5g8_DAWCP1vKZydRQsVRYdbMBsPY9ZBsr4ePvyO63A>
    <xmx:E4yiagwItsHBApP43P-SOVJ5ikHPgxGZ7aiXTyMBNVEWoPwhK669wPhy>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 10 Sep 2026 06:53:06 -0400 (EDT)
Date: Thu, 10 Sep 2026 11:53:04 +0100
From: Kiryl Shutsemau <kirill@shutemov.name>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org, 
	rppt@kernel.org, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, usama.anjum@arm.com, usama.arif@linux.dev, nico.pache@linux.dev, 
	ziy@nvidia.com, baohua@kernel.org, dev.jain@arm.com, hughd@google.com, 
	lance.yang@linux.dev, liam@infradead.org, mhocko@suse.com, ryan.roberts@arm.com, 
	shuah@kernel.org, surenb@google.com, vbabka@kernel.org, agordeev@linux.ibm.com, 
	jgg@ziepe.ca, leon@kernel.org, kernel-team@meta.com
Subject: Re: [PATCH v5 11/19] selftests/mm: add order-parameterized
 khugepaged collapse cases
Message-ID: <aqKKXuNWf7lUuXps@thinkstation>
References: <20260908125105.1510704-1-kirill@shutemov.name>
 <20260908125105.1510704-12-kirill@shutemov.name>
 <162af233-ae81-40e6-8c71-d13a41b5d892@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <162af233-ae81-40e6-8c71-d13a41b5d892@linux.alibaba.com>

On Thu, Sep 10, 2026 at 12:59:14PM +0800, Baolin Wang wrote:
> > +static bool all_windows_at_order(void *p, size_t len)
> > +{
> > +	return is_range_backed_by_order(p, len, collapse_order,
> > +					pagemap_fd, kpageflags_fd);
> 
> Like I mentioned in patch 8, you can implement these helpers using
> check_large_folios() in vm_util.c. Then you do not need to add new
> 'pagemap_fd' and 'kpageflags_fd' variables.

As I mentioned in reply to patch 8, I don't like that
check_large_folios() keeps re-opening file descriptors per call.

> > @@ -1375,6 +1569,20 @@ int main(int argc, char **argv)
> >   	parse_test_type(argc, argv);
> > +	if (mthp_khugepaged_context &&
> > +	    !(thp_supported_orders() & (1UL << collapse_order)))
> > +		ksft_exit_skip("Order %d is not a supported anon THP order\n",
> > +			       collapse_order);
> 
> This check can be moved into parse_test_type(), where the 'mthp_khugepaged'
> parameter is parsed.

Patch 14 makes -c optional and turns this into the code that builds the
list of orders to run, next to the "-c has to be above -s" check.  That
list wants thp_supported_orders() and belongs after parsing rather than in
it, so I left parse_test_type() to the range check.

> > @@ -1425,6 +1633,10 @@ int main(int argc, char **argv)
> >   	TEST(collapse_empty, madvise_context, anon_ops);
> >   	TEST(collapse_single_mthp, mthp_khugepaged_context, anon_ops);
> > +	TEST(collapse_order_single_window, mthp_khugepaged_context, anon_ops);
> > +	TEST(collapse_order_partial_window, mthp_khugepaged_context, anon_ops);
> > +	TEST(collapse_order_max_ptes_none, mthp_khugepaged_context, anon_ops);
> > +	TEST(collapse_order_mixed_sources, mthp_khugepaged_context, anon_ops);
> 
> These test cases look good to me. Thanks.

Thanks for going through them!

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
