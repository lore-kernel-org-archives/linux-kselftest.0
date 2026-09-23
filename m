Received: from out30-113.freemail.mail.aliyun.com (out30-113.freemail.mail.aliyun.com [115.124.30.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39EDF3101A5;
	Wed, 23 Sep 2026 06:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.113
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790146551; cv=none; b=hRQfM3Bbu0kPyUYhNZc3uwtQiqSHwGfSxoCVPdjPpvs2qBg/u7FKlBeo4oy8bSJVXq3wE8/PUmdIIsoHTteKtzD23+mnr1IqMkCtlSl51lmgNHilPLzZ0ZACoO3VOdaDYLcX86bqg4DQLxKUMtixQ8cLHSRoFEHKIVjeeNls0lQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790146551; c=relaxed/simple;
	bh=Rln868J2mdYBx7nxT+SrCO2JAPRVb5QNzuX+gN/f59E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E8uZMjLeV4hfd6K0Vgz2KMHhJeTYWB5lcQL9BHASLSRrg40EoaffYgbjRJtbqXVmdcsC/d/XNTB8GmZ3AGRCvzj8+s9Mt1LFzaTodF2gDDT3t6r0Pw8fvoOWXx9yxJd9iWm42j9RZBOeP6Bim11oQMnl5NLnp9UjV8jsrO2e6cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=kP1FoJGt; arc=none smtp.client-ip=115.124.30.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="kP1FoJGt"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1790146542; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=MSHfleQDJgNVV/fzOPiv6iN0a6sYi73P6TvrUGvr60g=;
	b=kP1FoJGtq1gRQ9ahc6sviTygKlCeZdp1zN254Wxz0QLB9nEkPR9K1mPfDga7lg1B1kSS79xKIZyPBTwLUp7Ea1McsfMzmRZCnhK68u8X6YXCl2ZQ7GwbPwtOvaWlib/9ypaizklpUiFbprAb4DtHl2K/vCyPs0bzlDI5UayGn3c=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R171e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=27;SR=0;TI=SMTPD_---0XBWAyqu_1790146539;
Received: from 30.74.144.107(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XBWAyqu_1790146539 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 23 Sep 2026 14:55:40 +0800
Message-ID: <ea81ccb2-d316-47fe-93ae-ef32af2a7330@linux.alibaba.com>
Date: Wed, 23 Sep 2026 14:55:39 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 12/19] selftests/mm: parameterize the mixed-source
 collapse case by source order
To: Kiryl Shutsemau <kirill@shutemov.name>,
 Andrew Morton <akpm@linux-foundation.org>,
 "David Hildenbrand (Arm)" <david@kernel.org>,
 "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, Mike Rapoport <rppt@kernel.org>
Cc: "Kiryl Shutsemau (Meta)" <kas@kernel.org>, linux-mm@kvack.org,
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
 <20260919002451.496763-13-kirill@shutemov.name>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20260919002451.496763-13-kirill@shutemov.name>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/19/26 8:24 AM, Kiryl Shutsemau wrote:
> From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
> 
> collapse_order_mixed_sources() faults its region as order-2 folios and
> collapses them to the -c target.  Order 2 is below the contpte size on
> every arm64 page size, so nothing in this suite collapses a contpte-mapped
> source on purpose.
> 
> Let -s name the source order alongside -c.  The case then faults at that
> order, keeping order 2 when -s is absent, and the source order has to be a
> supported mTHP order below the target.  The other mTHP cases are
> unaffected: mthp_push_target_order() enables only the target order.
> 
> A -c at or below -s is refused before any case runs: the sources would
> already be the size being asked for.  Without the check the generic cases
> fail on that one by one instead of saying why.
> 
> "-s 5 -c 7" on arm64/64K then collapses contpte-mapped sources into a
> larger mTHP.
> 
> Assisted-by: LLM
> Acked-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> Tested-by: Muhammad Usama Anjum <usama.anjum@arm.com>
> Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> ---

LGTM.
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
Tested-by: Baolin Wang <baolin.wang@linux.alibaba.com>
