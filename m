Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 778774B7149
	for <linux-kselftest@vger.kernel.org>; Thu,  3 Sep 2026 14:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788446887; cv=none; b=TUamyKSe4wpFehXp+eyBz9m5Wr+Ll21agk4tcXT5WMw0jTZvuka16x0ByfQB29WuUSilKKooo3CQAg0DlS6XKcXITKRxPwBgEXMxZGbORslirH+m07a4yb032xMjj/tawDnC8fdVTZht/oPBTn6luZ61GMg+AMCFouk1n/zFY+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788446887; c=relaxed/simple;
	bh=IWQPcIT6A/Eu0vw2c/Bwq1t49rfGteX/SOA++k5Rks0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qKUgomHJcbW95Bst90VZlJntRUFCw1GaymwcDOsqbHW7ctAi3nLJy48PSxJKJl3MQN6JxZmf025ViEoRRID/sUnS8a+4aQ9fxUp/8AdoOcK+/RdF4J7xOopWBDiSehr8aHw5uEd7J/owsJmv65EtMA9fmyChrEMxqo8aEQJ8SEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T9zILBjJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T9zILBjJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44C5C1F000E9;
	Thu,  3 Sep 2026 14:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788446886;
	bh=ISrEx0BSVBWyWukW0eR4OzeJE1oiiH266P39phBJYW4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=T9zILBjJvlXqgZnbl+t/5TzLTNPaRoMdSRwbPPU3Y3krCQy9j8Sz+O0SAna9P4k+1
	 0HTyvWd33XIJ0VYCXB/sBt0bJ1aoWcQ5vyDIegD9H1fRbGSK5bJkgqWli3lJ7ztNsI
	 diGsGwWTrIVseGFQcsUAabfpyxdEaFZudgcPxU8nvZYanuWQxVYnfUrikSl5nI8kP1
	 hYppWhY0fdZR0k7bqZaaAGzTZ6fWy3CbjShYGD1belX5Bj+kVhg9xCFNDFwA7dQgxE
	 6S1IRTSPPpmw7mfzQk+X9WlotxluioJw0Eli48tlYpuM3Tx9dBxyanbguNB3cMjlFR
	 8vesLPeAq5G+A==
Date: Thu, 3 Sep 2026 15:47:58 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	akpm@linux-foundation.org, david@kernel.org, liam@infradead.org, vbabka@kernel.org, 
	rppt@kernel.org, surenb@google.com, mhocko@suse.com, shuah@kernel.org, 
	ziy@nvidia.com, baolin.wang@linux.alibaba.com, nico.pache@linux.dev, 
	ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org, lance.yang@linux.dev, 
	usama.arif@linux.dev, kas@kernel.org
Subject: Re: [PATCH] kselftest: mm: remove HPAGE_SIZE and HPAGE_SHIFT macro
Message-ID: <apmIlI3Ooe8b95Ro@gremlin>
References: <20260902175611.1241118-1-yeoreum.yun@arm.com>
 <apk1WVEDYtQhRxWR@gremlin>
 <aplcf7sDnfKQTYo0@e129823.arm.com>
 <apmIPJKj7JGwF7nz@e129823.arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apmIPJKj7JGwF7nz@e129823.arm.com>

On Thu, Sep 03, 2026 at 03:46:20PM +0100, Yeoreum Yun wrote:
> > > On Wed, Sep 02, 2026 at 06:56:11PM +0100, Yeoreum Yun wrote:
> > > > HPAGE_SIZE and HPAGE_SHIFT macro is written based on the 4KB PAGE_SIZE.
> > > > When this macro is used in some test, test result would be strange in
> > > > the system where PAGE_SIZE is more than 4KB.
> > > >
> > > > Here is example with transhuge-stress test with 16KB PAGE_SIZE:
> > > >
> > > >   transhuge-stress: allocate 61073 transhuge pages, using 122146 MiB virtual memory and 1908 MiB of ram
> > > >     3.292 s/loop, 0.054 ms/page,  37106.002 MiB/s	2566 succeed, 58507 failed, 2566 different pages
> > > >     0.591 s/loop, 0.010 ms/page, 206850.792 MiB/s	   0 succeed, 61073 failed,    0 different pages
> > > >     0.527 s/loop, 0.009 ms/page, 231895.107 MiB/s	   0 succeed, 61073 failed,    0 different pages
> > > >     0.527 s/loop, 0.009 ms/page, 231839.704 MiB/s	   0 succeed, 61073 failed,    0 different pages
> > > >     0.528 s/loop, 0.009 ms/page, 231544.782 MiB/s	   0 succeed, 61073 failed,    0 different pages
> > > >     0.528 s/loop, 0.009 ms/page, 231462.074 MiB/s	   0 succeed, 61073 failed,    0 different pages
> > > >     0.527 s/loop, 0.009 ms/page, 231770.300 MiB/s	   0 succeed, 61073 failed,    0 different pages
> > > >     ...
> > > >   ok 1 Completed
> > > >
> > > > Remove the HPAGE_SIZE and HPAGE_SHIFT macro. and introduce hpshift()
> > > > helper to get the HPAGE_SHIFT properly. For HPAGE_SIZE, use pre-exist
> > > > helper, read_pmd_pagesize().
> > > >
> > > > Also, do KSM_MERGE_TIME_HUGE_PAGES test with size of 512 MiB which
> > > > is the LCD pmd_size among 4KB, 16KB and 64KB page_size.
> > >
> > > Probably worth spelling out Least Common Denominator for those who might
> > > mistaken this for a kind of display panel :P
> >
> > Bad typo :( LCM (least common multiple) :(
> >
> > >
> > > I also wonder if it's worth pulling that out as a separate patch in a series for
> > > better bisectability?
> >
> > Okay. I'll separate it.
>
> Hmm, I think it would be better to keep the change as is, including the
> updated ksm_tests parameter. Although allocate_transhuge() correctly
> allocates mappings aligned to the PMD page size, `ksm_tests -H -s 100`
> would otherwise fail because 100 MiB is not a multiple of the PMD page
> size.

OK, just add a note about it in the commit msg :)

>
> [...]
>
> --
> Sincerely,
> Yeoreum Yun

--
Cheers, Lorenzo
