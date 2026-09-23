Received: from out30-110.freemail.mail.aliyun.com (out30-110.freemail.mail.aliyun.com [115.124.30.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB1213CFF65;
	Wed, 23 Sep 2026 06:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.110
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790146226; cv=none; b=CpEX+pocry+EM/WtiQ3GeOU4hMLZHnMppzWUUHKn7b3MxocBj2hf2emAW0T2dkxRDQeqfBYJx8yqMWFbH4N4S+2rSZ4VtbuKaZ4/BVfO1ozp1GafNw46zEQf8WOHGdxf3WoumP+yTWvlzRhPykiab55e5y4IzclaC/3XTO0K4Ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790146226; c=relaxed/simple;
	bh=8ZXlNCpbmHAA7EJhzJldIBTjEx+RMUFhl9SHYsfTP2Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WphKdoydzUVe+I1OhLH19acg8g9eeeGtTg7Cokr9GQhPakF5k6fu+9fOe0Il2FFgTCtUPLUuAtDLCl0lkra4wYE2HQ8k/pTZzmWbOPWyJ4IlCKthLHi8eIU+nJoZW+64KhnWvqBnK0VatBgt15KfkTO9Jy5Y1cZVapi7uc8b1Hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=uufwNR1A; arc=none smtp.client-ip=115.124.30.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="uufwNR1A"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1790146215; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=BueAFwiasv7ZjHBQeHqUfMN2LS9C/icsSJFoWptiCf8=;
	b=uufwNR1AXXBv8LZXtbZmNg4K2AFzqxUKBCTZMGXzpHPVdBxQAdADXo02OdSho9aLvfXFtuEDBXoC4ND4XfNtmfD903ZW/c0ya7ad39yyEj9gyEH9jwH4+qgk62vxvC4MW+SrF9CiH7wPG2Gjp6AGP2Xc1xtBenRFT750Ol+2baI=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R331e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037026112;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=27;SR=0;TI=SMTPD_---0XBW5L8u_1790146212;
Received: from 30.74.144.107(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XBW5L8u_1790146212 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 23 Sep 2026 14:50:13 +0800
Message-ID: <68bd860f-ec8c-4d8d-89a8-d7abcfd2f8dd@linux.alibaba.com>
Date: Wed, 23 Sep 2026 14:50:12 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 11/19] selftests/mm: add order-parameterized khugepaged
 collapse cases
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
 <20260919002451.496763-12-kirill@shutemov.name>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20260919002451.496763-12-kirill@shutemov.name>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/19/26 8:24 AM, Kiryl Shutsemau wrote:
> From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
> 
> The mthp_khugepaged context runs the generic cases at a sub-PMD order,
> which answers how many folios of that order a range ends up with.  It
> cannot say which order-sized window they landed in, so "the populated
> window collapsed" and "the empty window next to it collapsed instead" look
> alike.
> 
> Add four cases that check each window on its own, with the folio-order
> helpers in vm_util:
> 
> - collapse_order_single_window(): only the populated window collapses;
> - collapse_order_partial_window(): the default max_ptes_none lets a window
>    with one present PTE collapse;
> - collapse_order_max_ptes_none(): with max_ptes_none=0 a full window
>    collapses and one missing a page does not;
> - collapse_order_mixed_sources(): sources that are already large folios of
>    a smaller order collapse to the target.
> 
> Each case faults its region before MADV_HUGEPAGE with only the target
> order enabled, so the sources are order 0 and the result can only come
> from khugepaged.  They wait for a full pass rather than for the result to
> appear: without a completed pass, "not collapsed" and "not scanned yet"
> are the same thing.
> 
> Assisted-by: LLM
> Tested-by: Muhammad Usama Anjum <usama.anjum@arm.com>
> Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> ---

Tested-by: Baolin Wang <baolin.wang@linux.alibaba.com>
