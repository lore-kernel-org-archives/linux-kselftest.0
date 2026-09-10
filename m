Received: from out30-113.freemail.mail.aliyun.com (out30-113.freemail.mail.aliyun.com [115.124.30.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83365346A04;
	Thu, 10 Sep 2026 06:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.113
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789020490; cv=none; b=SHvtJJJSHOIaR0u6A8jGDl3OEAIR8hwXDhbZovll8OVahh5fhucuaGgsFQozp8KtdH4Byn4b69ZW+lSbwqj8R//BzB0utWpRGxjN+A2JIVwHsr4rMuFe3zMQYWmd384UB2H4jDVMSO84LxatMW/5UXMAuzQ7pKZj70RyQiyL8f0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789020490; c=relaxed/simple;
	bh=yDkiHVuqmetPgWslkQi/TK6nQokzqI1UhF4na163Eho=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OSGULGPPnq4pX0dV0O3TtrkEOGzv6a37AE+jtdIsnzK90B+UUDxrMDInTTiydhMbnhc+/zx7a+umNU+3IHodwM5R/hWR+shyplH1jOBx0xisnH+ojFTl6trAnR4CACggoRQ/OJyV/T33wlBqml3YWRgmBwcdmBBtCIaOHwGEhP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=eLuWTS4g; arc=none smtp.client-ip=115.124.30.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="eLuWTS4g"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1789020483; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=jePTnUgwFYrx1QtqJ0i+l+Bh+bnpi4s/zBah6ITg4fg=;
	b=eLuWTS4gPvXQH2O8d63Z+phJwbXPzy5HQtnKUfPyjkIjEHuK0rDcx6ZMOPSI99i9o3MRHh4kn/TMl1JELFwzTYQa/UpqrbI7e6BLojQ/3WZyB7pHLfRzxEkiLg8YGcaG23sV+UlAnMlQT6ukJvN4K9+d4T1iTj3gGDpTWOhMDI8=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R711e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=27;SR=0;TI=SMTPD_---0XAgdFcD_1789020480;
Received: from 30.74.144.116(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XAgdFcD_1789020480 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 10 Sep 2026 14:08:01 +0800
Message-ID: <e611ca08-1952-457d-ba45-8c8854020a74@linux.alibaba.com>
Date: Thu, 10 Sep 2026 14:07:59 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 14/19] selftests/mm: run every supported collapse order
 by default
To: Kiryl Shutsemau <kirill@shutemov.name>, akpm@linux-foundation.org,
 david@kernel.org, ljs@kernel.org, rppt@kernel.org
Cc: linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, usama.anjum@arm.com, usama.arif@linux.dev,
 nico.pache@linux.dev, ziy@nvidia.com, baohua@kernel.org, dev.jain@arm.com,
 hughd@google.com, lance.yang@linux.dev, liam@infradead.org, mhocko@suse.com,
 ryan.roberts@arm.com, shuah@kernel.org, surenb@google.com,
 vbabka@kernel.org, agordeev@linux.ibm.com, jgg@ziepe.ca, leon@kernel.org,
 kernel-team@meta.com, "Kiryl Shutsemau (Meta)" <kas@kernel.org>
References: <20260908125105.1510704-1-kirill@shutemov.name>
 <20260908125105.1510704-15-kirill@shutemov.name>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20260908125105.1510704-15-kirill@shutemov.name>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/8/26 8:51 PM, Kiryl Shutsemau wrote:
> From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
> 
> The mTHP collapse cases only run when the caller names both the context
> and an order, so a plain ./khugepaged covers the PMD contexts on anon and
> nothing else.  run_vmtests.sh pinned order 4 and covered no other.
> 
> Run the mTHP cases once per supported anon THP order below the PMD when
> -c is absent, and pull that context into both the no-argument invocation
> and "all".  Also:
> 
>    - -c still pins one order, and now says what is wrong instead of
>      printing the usage text.  An order at or below the -s source order is
>      skipped: the sources would already be the size being asked for.
> 
>    - Both orders end up as array indices and shift counts, so -s and -c
>      are range-checked before they get there.
> 
>    - The mTHP context has only anon cases, so a run that names a different
>      mem_type -- "all:shmem", say -- drops it again rather than refusing
>      to start.  Naming both explicitly still refuses.
> 
>    - A case carries the order it was registered at, so a result names it:
> 
>        # Run test: collapse_single_mthp (mthp_khugepaged:anon, order 6)
> 
> On x86-64 with 4K pages that is orders 2 through 8, and ./khugepaged goes
> from 29 results in 17 seconds to 77 in 29, so run_vmtests.sh can drop its
> pinned order-4 line.
> 
> Assisted-by: LLM
> Tested-by: Muhammad Usama Anjum <usama.anjum@arm.com>
> Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> ---

LGTM.
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
Tested-by: Baolin Wang <baolin.wang@linux.alibaba.com>
