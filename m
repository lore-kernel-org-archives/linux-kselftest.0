Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.38
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793182250;
	b=2JstdBlLlgVT904jaeb+bo6XXYsPAhnXZ2B6/nEDZwEG4vLyiGIm/x1Qgzyh46auPcNb
	 2QnQ6um+ABcpXpMocv/6hElA+vOnLaDCXynfRvmrX5+QlKNa7pp56Qtc81aq1kPr/Vy0j
	 Ar0hKpq47z2N24QsdZQfOsfEjYiob5s0wJ0zoLgFl6wZraUOEFP8DEig/WdmPo+PKi5lN
	 HAiDl4KoJXdNEaQhDzfKFxSoSnsna1/24sJV3eFNf5GHp5t4heV1DoifTJ7SUP5101YfT
	 gs5o1d0T50zBvuionUH0dtpqRanC2as8H8FYPNE+MRKP+wWOdIDdVmYUJBSmEvLbyxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793182250;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=19TPKFjxLxxJXmQTxvpO9mlfiQegSPOYzBZe/idkCsk=;
	b=CE2jvlkb/iGFN5HsnAf8TVDijAJNuyviMd4OnECwHaj6YJ8bgYqSj4rt+J6SKOkRYhDk
	 fUgoh0Pc2XRK7D3TOUKcSzZRSByrmIdyV/MOvRdDRvaDvO+ieL/TnRIg7yxpRu8bbBYLg
	 2F672K4He+UVVy4xLONdRWt5N+ciynHlBr9kyVovyBuLwV/JEMU24s2685N3kpUo0zSv2
	 vUtXCvWot4rx1kz7MuCEWffgAntQgOhK9XljX8FLTiEfh+sSYZaWGF3zLRrMyoKUbz6SM
	 08bhMvOi1hif1+57LAbE3otyE6GK7YeNUdrPY28SxAAKZsc0MKqthUP/rAe4kBiY9XA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="lwtT/Voa";
	arc=none smtp.remote-ip=95.215.58.38
Received: from mta1.migadu.com (out-38.mta1.migadu.com [95.215.58.38])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FE2C606A321
	for <linux-kselftest@vger.kernel.org>; Wed, 28 Oct 2026 10:10:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FE2C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=lwtT/Voa
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=JldTN/ya2t8xpYirdSsWzyVdXdbqZ8hQSNVyw7aaEbs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793182247; v=1; x=1793787047;
 b=lwtT/Voa3tn0zXEU/PzhEq0Pv8X8RXgswAH8eyPNFDU0mVUoYTJcJVehDdEEREy+Iz54fENy
 biPGeo1lUF3FCPNyK43SlXfZFKlPiQCPNH6Um7LLz0rjHXCDULctY3z4vy29SE1tGrEP0slcIV+
 3C1eREjAnp0IWO8qCENK3LKw=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 3eac00e914e20d2a;
	Wed, 28 Oct 2026 10:10:19 +0000
X-Mizu-Trace-ID: 3eac00e914e20d2a
X-Migadu-Flow: FLOW_OUT
Message-ID: <76f1df75-09cb-45ad-bb08-e34acf93518e@linux.dev>
Date: Wed, 28 Oct 2026 18:10:03 +0800
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 02/19] selftests/mm: skip collapse_compound_extreme()
 where the PMD is too large
To: Kiryl Shutsemau <kirill@shutemov.name>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 "David Hildenbrand (Arm)" <david@kernel.org>,
 "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 Muhammad Usama Anjum <usama.anjum@arm.com>, Usama Arif
 <usama.arif@linux.dev>, "Nico Pache (Red Hat)" <nico.pache@linux.dev>,
 Zi Yan <ziy@nvidia.com>, Barry Song <baohua@kernel.org>,
 Dev Jain <dev.jain@arm.com>, Hugh Dickins <hughd@google.com>,
 Lance Yang <lance.yang@linux.dev>, "Liam R. Howlett" <liam@infradead.org>,
 Michal Hocko <mhocko@suse.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Shuah Khan <shuah@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 "Vlastimil Babka (SUSE)" <vbabka@kernel.org>,
 Alexander Gordeev <agordeev@linux.ibm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Leon Romanovsky <leon@kernel.org>, kernel-team@meta.com
References: <20260919002451.496763-1-kirill@shutemov.name>
 <20260919002451.496763-3-kirill@shutemov.name>
 <5862cddb-a78f-419f-a5a1-15e16a422bf5@linux.dev>
 <atiQmWnz8zx2AKI7@thinkstation>
Content-Language: en-US
From: Zenghui Yu <zenghui.yu@linux.dev>
In-Reply-To: <atiQmWnz8zx2AKI7@thinkstation>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Kiryl,

On 10/21/26 6:32 PM, Kiryl Shutsemau wrote:
> On Thu, Oct 08, 2026 at 07:52:18PM +0800, Zenghui Yu wrote:
> > Hi Kiryl,
> >
> > On 9/19/26 8:24 AM, Kiryl Shutsemau wrote:
> > > From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
> > >
> > > collapse_compound_extreme() builds a PTE table full of distinct PTE-mapped
> > > compound pages by cycling hpage_pmd_nr fault-time THPs through mremap.  It
> > > therefore needs hpage_pmd_nr PMD-order allocations in a row.  That is fine
> > > at a 2M PMD (4K base pages) or a 32M one (16K).  A 512M PMD -- arm64 with
> > > 64K base pages -- makes each of those an order-13 allocation, which the
> > > allocator cannot reliably hand out even once, let alone 8192 times.
> > >
> > > The failure is not a quiet one: the case calls ksft_exit_fail_msg(), so the
> > > whole binary stops and every case after it is lost.
> > >
> > > Skip the case where the PMD is larger than 32M.  The MADV_COLLAPSE cases
> > > still cover PMD-order collapse on those configurations, and 4K and 16K
> > > PMDs are unaffected.
> >
> > collapse_compound_extreme() failed on an arm64 virtual machines with 16k
> > pages.  The VM has 8GB of memory.  Not sure if this is the same issue that
> > this patch attempts to address.
> 
> It is the same issue.
> 
> Memory usage for the test case, assuming 64-bit page table entries:
> 
>          4K pages:  512 x   2M =  1G
>         16K pages: 2048 x  32M = 64G
>         64K pages: 8192 x 512M =  4T
> 
> 64G is a lot, but I don't think we want to give up on this test case
> on 16k machines completely.

Agreed. This test case passed on other arm64 servers with sufficient
memory.

> Maybe we should treat a failure to allocate a huge page here as a skip,
> not a fail? And remove the PMD-size gating.
> 
> Zenghui, do you want to experiment with this?

I've just sent a patch for that. Thanks for your suggestion.

https://lore.kernel.org/20261028100119.11340-1-zenghui.yu@linux.dev

Thanks,
Zenghui
