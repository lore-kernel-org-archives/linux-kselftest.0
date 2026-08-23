Received: from flow-b2-smtp.messagingengine.com (flow-b2-smtp.messagingengine.com [202.12.124.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FFE0332ED6;
	Sun, 23 Aug 2026 19:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787514589; cv=none; b=ml6MdoV0lgU543lsef1h5poR0YLOowR6qWVqEmkPTzQG3PijDxtxa1Y2bJvtE7qP9RHPK8Zwy1npTYJTv6TJI/rZZXMBfz1LERBqWEbu/7y2Yp8Ir62d4ukgtsvX/1hvGseZT39R5Hl7Ex/O698KR0DCvNikK6eibfEA2Pglph4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787514589; c=relaxed/simple;
	bh=RJnhOGvUhbehdAuMvXzkg/aM/H9NaGfp8I8VPQFUkUI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GofxcwYuGvi94Lij0jtrLhWlJYwXuhPM2GgWENFheAInwKfWBAzlF4IWxH6QravNVekWX9sM45ziXpDBKxnHwfed/9PBufEp2plVFzPqj9L56lAfkoCfAT/YXkR1xI8RcN4u2OoswAvzEUnktTqIyVm2D5VG06WRejCjF4jtsTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=L5xrzInG; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=P6dU7JeG; arc=none smtp.client-ip=202.12.124.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="L5xrzInG";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="P6dU7JeG"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailflow.stl.internal (Postfix) with ESMTP id 1B22813000DA;
	Sun, 23 Aug 2026 15:49:45 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Sun, 23 Aug 2026 15:49:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1787514584; x=
	1787521784; bh=i+PEmVTxFVbO+G6COCTpau9qWfIWMrb/rGYLGbdWQbM=; b=L
	5xrzInGO2VnLLP+kVJT7DZP/ivx0Ssj4v8hOScufJqibAcwzWwOB+vTyxWDJyKDn
	lArMZlyIGXQes3ORBC93AiLNfzZPIuUMYVV12S2eD2YK9t5UwaVhVGF6V1+MVf1+
	KnXr/jclQ/69T3IEdUupadR3QKWHU4jkXUFXrsL47omMP/clYPuJhGQGQ0fGfrgS
	IxID1ObLWVhGjyyGYGATA2Dq+abxwFIWD3LLkJfCjAKzkeXef1b0YJFXSjJW4Hf/
	EaK5huZGlVOiUmZJ4AU81GC4+qsAmYRlRvyinubNoo7Cl17vbh1FIKsQ1uocmBT5
	/F8aQEiW7bO0AsfsXEpOw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1787514584; x=1787521784; bh=i+PEmVTxFVbO+G6COCTpau9qWfIWMrb/rGY
	LGbdWQbM=; b=P6dU7JeGgXFt1i02vsq9XaXx7u5SUds61qKOVxQ5PZRBSj67I+8
	3nQuYPqcKm7sH9wftWk607NqclDOdERI3ArpeZdbrlYbo0NtSMRAcfQPr5z4CjAR
	T3vVaShP6qp99QZTNCkHPglTYI/F7Pq65oA3I5T+kqlz45T9Qfx84lGmK8RFnSr1
	rFxBQBGmBPxj3RiXt1ntXVpzuF4ACtjy2lgIEHmeriFTOKGYOWoY/s1vOzPmbG3Y
	PRzmHO4xYNV6hNzEfLnyOUsskXOZFBNa+3DtanPB5iwFkaz1PBuwdrqQTYT+q7Dz
	ZdbkJHQT4MFh5x5rlLPS2cAHtR8EdFvPPFA==
X-ME-Sender: <xms:106LalEg9r0RTs3mwls47QXnEu6A7KxEG2NwN5H5G9W1Pr8zUxVnwg>
    <xme:106LajVO92JzZldxwHl9wjXN60dX0R1Cvq2AqMeIFetapqVvc49O_OvOVuwlPa17X
    rj7sMyhYDheNqdsixjiDD6x3NJyPIwXpsZt_jEYiJDuW_oGaEDSvj4>
X-ME-Received: <xmr:106Lag3-SBnj780sHq34ebQ8HIf2hzW9fmiQP30HgOig874lAR92xIt3BOU>
X-ME-Proxy-Cause: dmFkZTEnq2IcyVMu+h7DjTUHabZYY7hv+NX1QZIFs2I3G53FDoijQmaMTNOrpiXT9n8h+/
    6zWv2EHJ4QvOWg1bjrm5dlNVp49+1KtLAJncHOSEP8pZVia+BIMq9r91fhBAQg4waWt0dX
    5xpeZFTVTyP7xRHyt4gH8zYlHICa5dTwq9SPUMJtTUgg2ntiRnC62kadst1O30BNUeXXfZ
    ADTffG+O+9rYvXbSqWiLBk4oZX6X94jrhohuCjkteJ/hESx3rAzpx1CxMlduqo3xGBluvd
    arc3SuEXhWbFjC0J5ZDsb/qZ9V0eYI1QOwymv3OgOvNOf1Iwj0ljcgWUiGmVMqg5cQ45fu
    ZitEpkmrkvspZ4rUKSqMtTF2YBzziSZIfqDoQ0Qlz4mNM/Bb9Eh4FBEm1DvA5/ZH6VjGRp
    4LuJMrVSNpWFX/PSF6R0GriglTfhVxIqvJFjLbuKOlgEdNV6n6fFJ88CMTerblB8JF7O82
    WW2haMggx9TayWkCdbpOUut6+n8X1G40XDiMOANXFWU2wDR51viKl419A/7DvnItTyZphW
    rfkBlDfSh/8XuZ2sayzxssG8XECnCnp+xhMjsnxvuc57t4pPlwe3HzL/jA6jAozvMcqfS0
    /gQ2dBrBwKIZSvAkdLh9+oqowQV5bx9SHJ76noicK2Q3EOwct3ynE8kXSSRg
X-ME-Proxy: <xmx:106LaiApnPZLQIgXQ9cRavtRtJQUXnLJ_VnCea5_MZ9hzGBSGRmN3g>
    <xmx:106LauBet7ipy3-oU8Jcdnh7Uy7eH8VwZhLkI41rGqLVMfXyAA_CoQ>
    <xmx:106LauMz6dBgkuhTXcAR_5BBHJ9OeY7VyVCSgZavyYr7Y1o3b979nw>
    <xmx:106Laiwchmwz3cgJf1WS0n60pllN6rb-6W32iBfr51UIIx4YHm44pQ>
    <xmx:2E6LatgJSk5wvoSDyF-aOLTWelbU52QivjD0KlRgSVzMR_yfELO3WHfW>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 23 Aug 2026 15:49:43 -0400 (EDT)
Date: Sun, 23 Aug 2026 20:49:42 +0100
From: Kiryl Shutsemau <kirill@shutemov.name>
To: Mike Rapoport <rppt@kernel.org>
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org, 
	nico.pache@linux.dev, baolin.wang@linux.alibaba.com, baohua@kernel.org, 
	dev.jain@arm.com, hughd@google.com, lance.yang@linux.dev, liam@infradead.org, 
	mhocko@suse.com, ryan.roberts@arm.com, shuah@kernel.org, surenb@google.com, 
	usama.arif@linux.dev, vbabka@kernel.org, ziy@nvidia.com, usama.anjum@arm.com, 
	agordeev@linux.ibm.com, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 05/19] selftests/mm: make the swap cases' swapout
 reliable
Message-ID: <aotOf7s43-oD84r-@thinkstation>
References: <20260815015901.1236937-1-kirill@shutemov.name>
 <20260815015901.1236937-6-kirill@shutemov.name>
 <178721523516.2799959.17614116166980239496.b4-review@b4>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178721523516.2799959.17614116166980239496.b4-review@b4>

On Thu, Aug 20, 2026 at 11:40:35AM +0300, Mike Rapoport wrote:
> > Ask again for up to two seconds, with the range held out of the daemon's
> > reach while asking.  The collapse each case runs next puts MADV_HUGEPAGE
> > back, so only the setup is affected.
> 
> "Retry several times for up to two seconds meanwhile holding the range
> out of the khugepaged reach. The collapse each case runs next restores
> MADV_NOHUGEPAGE, so only setup is affected"

Small correction: it restores `MADV_HUGEPAGE` -- `wait_for_scan()` sets
that before it waits. `MADV_NOHUGEPAGE` is what the setup puts down.

Ack, for other input.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
