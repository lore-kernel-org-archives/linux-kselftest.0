Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C363E485954;
	Fri, 11 Sep 2026 13:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789133684; cv=none; b=e4bWLy1rKpu1czwJ0J30y7NX/rXqAebiSaErAPdx0o+KwgP2V3aPYnRrBPF/p9vyg2p+XL7aw2HURJJpGktK0Dgss05jSheaROJjNYTcfWbDenDN1/uTnjdHCn5+gHrce5M7jMXI2o8F436ODi16k8lp0CZ+FGU1Hx2CwbVU6Jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789133684; c=relaxed/simple;
	bh=bnRhlOG7uJfn0zTtgUAfL8VaHyebIVtCjGBipOdWK2E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FFziGgWS1atN39bym0tEm5fMUG/0FDQrsi0eM3HZG92oKzwnVAfp/21PVhQBn7aIJDj5SrLjeHfx2Ke/eiWKK+e8Qxhis+6IvkdF6CYP1wHRMTDWb8L0aNuzuOxSoDzbkyzibht8UdqN491Uw20eK6wua9R68ykyP1HQcC0+7Hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=ot8PSeur; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="ot8PSeur"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6DFB31655;
	Fri, 11 Sep 2026 06:34:38 -0700 (PDT)
Received: from e129823.arm.com (unknown [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 697173F59E;
	Fri, 11 Sep 2026 06:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789133682; bh=bnRhlOG7uJfn0zTtgUAfL8VaHyebIVtCjGBipOdWK2E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ot8PSeurmDv/PG8wha2jcV1v/KJF74wyupEmOPFe8OdNtu3gb5v4ntaEBt6xBJLuH
	 xR/962+EVrO4e5oEMFLRz2qi5PH2MCjsPg5Xjk+jEOgDFpkI3XTF5dUlAIS2h5ttHQ
	 mnMpNoXQ1eoStXY4igAfLMZoyfUTiAoASspo2jsQ=
Date: Fri, 11 Sep 2026 14:34:37 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org, david@kernel.org, liam@infradead.org,
	vbabka@kernel.org, rppt@kernel.org, surenb@google.com,
	mhocko@suse.com
Subject: Re: [PATCH] kselftest: mm: fix potential failure for merged VMA in
 guard-regions
Message-ID: <aqQDbfMOVasuejA3@e129823.arm.com>
References: <20260911123534.1181501-1-yeoreum.yun@arm.com>
 <aqP29-H0iKl-2CVH@gremlin>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqP29-H0iKl-2CVH@gremlin>

On Fri, Sep 11, 2026 at 01:59:31PM +0100, Lorenzo Stoakes (ARM) wrote:
> On Fri, Sep 11, 2026 at 01:35:34PM +0100, Yeoreum Yun wrote:
> > check_vmflag_guard() uses /proc/self/smaps to retrieve the VMA flags,
> > but this can fail if the mapping is merged with an adjacent VMA.
> >
> > To avoid this potential failure, first allocate a temporary region with
> > extra pages at both ends, unmap it, and then map the test region within
> > the temporary address range, leaving an unmapped page on each side to
> > prevent VMA merging.
> >
> > Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> > ---
> >  tools/testing/selftests/mm/guard-regions.c | 14 ++++++++++++--
> >  1 file changed, 12 insertions(+), 2 deletions(-)
> >
> > diff --git a/tools/testing/selftests/mm/guard-regions.c b/tools/testing/selftests/mm/guard-regions.c
> > index 5c8ec3ca75d7..a28a57d34e97 100644
> > --- a/tools/testing/selftests/mm/guard-regions.c
> > +++ b/tools/testing/selftests/mm/guard-regions.c
> > @@ -2257,8 +2257,18 @@ TEST_F(guard_regions, smaps)
> >  	char *ptr, *ptr2;
> >  	int i;
> >
> > -	/* Map a region. */
> > -	ptr = mmap_(self, variant, NULL, 10 * page_size, PROT_READ | PROT_WRITE, 0, 0);
> > +	/* Try to Map a region. */
> 
> Map -> map
> 
> > +	ptr = mmap_(self, variant, NULL, 12 * page_size, PROT_READ | PROT_WRITE, 0, 0);
> 
> Should be PROT_NONE otherwise it'll merge with the below.

It doesn't matter. since this memory is unmapped and then second map
at ptr + page_size.

IOW, though the first one is merged, it unammped and then 
the second is allocated at ptr + page_size, it wouldn't be merged:

  after unmap:
   [existing VMA][ 12 pages ][existing VMA]

  second:
   [exiting VMA] [hole (page)] [ 10 pages (for test)] [hole (page)] [existing VMA]

Am I missing something?

-- 
Sincerely,
Yeoreum Yun
