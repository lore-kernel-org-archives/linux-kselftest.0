Received: from out30-118.freemail.mail.aliyun.com (out30-118.freemail.mail.aliyun.com [115.124.30.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D1CB388E60;
	Wed, 23 Sep 2026 03:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790134125; cv=none; b=P3Py+sUov0vpSbF72qX6sNW+fCjlaas0w5gq+0sU7zeNYbuutJn6Edp+zjImD/wBRzrnaqx1F0Udkl4mtaoC7D8eTE+LpFyuUKLq5XYusPHc9e41oocOhbbhIU88kIchaFibYMc3JUVv2DwBvdANVCgxOOlTyVDlB8SbVAmXxhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790134125; c=relaxed/simple;
	bh=U1G/gLdvvQ93m/Kb3ldbYuWxRnS+AavdyTIi1dBVIYk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HD9cpwTVo38QKzLqHgYcL1vWb+6zEfh644/QcUchFUMUNxkTdrPik2KlfeNFOK49a6HuHRzzBiMDaves8z3jHE3Ul0xap8WUj5PfUPAmRlijaL7yVjxLwkCl0+KGEQlc+o+PYFd3fF+WG+gqVMexjWPz1zqbo3ZT1hXqa4kZVHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=SigBbLPd; arc=none smtp.client-ip=115.124.30.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="SigBbLPd"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1790134117; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=aXVS+0rNgEPdURT9ROUCnYG2LJzTKNU03S9NURdhya8=;
	b=SigBbLPdQpizEtig/XwEw+XWryByrw8mEHD+Q36r3RhbVJgPUU36VpeF9lO+hlR3sqluPDYeNDu9BFvmmvgeXuJvbdsLO1wwVOYZsviQ6eHrEtprDQveyaHvOgKGmU5YPxX9bYYDGv4vXw6ktc0X7qkZmFThN1EBdd95eHCuV70=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R201e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037009110;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=21;SR=0;TI=SMTPD_---0XBVZ80G_1790134114;
Received: from 30.74.144.107(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XBVZ80G_1790134114 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 23 Sep 2026 11:28:35 +0800
Message-ID: <6cc12fe6-4f2f-47b6-b821-8a507eb80b46@linux.alibaba.com>
Date: Wed, 23 Sep 2026 11:28:33 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] kselftest: mm: fix intermittent failure khugepaged
 test
To: Yeoreum Yun <yeoreum.yun@arm.com>, Zi Yan <ziy@nvidia.com>,
 "Liam R. Howlett" <liam@infradead.org>, Nico Pache <nico.pache@linux.dev>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>,
 Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Shuah Khan <shuah@kernel.org>
References: <20260921-fix_khugepagd_fail-v2-0-3c2877beef61@arm.com>
 <20260921-fix_khugepagd_fail-v2-2-3c2877beef61@arm.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20260921-fix_khugepagd_fail-v2-2-3c2877beef61@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/21/26 6:35 PM, Yeoreum Yun wrote:
> There are intermittent failures in collapse_max_ptes_swap() and
> collapse_max_ptes_shared() when using the khugepaged_context:
> 
>    // while running ./khugepaged -s 2
> 
>    # Run test: collapse_max_ptes_shared (khugepaged:anon)
>    # Allocate huge page... OK
>    # Share huge page over fork()... OK
>    # Trigger CoW on page 1023 of 2048... OK
>    # Maybe collapse with max_ptes_shared exceeded.... OK
>    # Trigger CoW on page 1024 of 2048... Fail
>    Bail out! Unexpected huge page
>    # Planned tests != run tests (26 != 23)
>    # Totals: pass:23 fail:0 xfail:0 xpass:0 skip:0 error:0
> 
>    # Run test: collapse_max_ptes_swap (khugepaged:anon)
>    # Swapout 257 of 2048 pages... OK
>    # Maybe collapse with max_ptes_swap exceeded.... OK
>    # Swapout 256 of 2048 pages... OK
>    Bail out! Unexpected huge page
>    # Planned tests != run tests (26 != 17)
>    # Totals: pass:17 fail:0 xfail:0 xpass:0 skip:0 error:0
> 
> This happens because khugepaged may collapse the pages before wait_for_scan()
> is called, causing a sanity check that expects uncollapsed pages to fail.
> 
> For example, in collapse_max_ptes_swap(), after faulting the pages back in
> and paging out up to max_ptes_swap pages, khugepaged may collapse them again
> before c->collapse() is called.
> 
> To prevent this, mark the VMA with MADV_NOHUGEPAGE after it has been
> collapsed by wait_for_scan() for anon. This prevents khugepaged from
> collapsing it again before c->collapse() is called.
> 
> This failure was observed on NVIDIA Spark with 16KB page.
> 
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> ---
>   tools/testing/selftests/mm/khugepaged.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/selftests/mm/khugepaged.c
> index c32244b565658..1aad4bb427ece 100644
> --- a/tools/testing/selftests/mm/khugepaged.c
> +++ b/tools/testing/selftests/mm/khugepaged.c
> @@ -578,6 +578,9 @@ static bool wait_for_scan(const char *msg, char *p, size_t len,
>   		usleep(TICK);
>   	}
>   
> +	if (!strncmp(ops->name, "anon", 4))

We usually use the 'if (ops == &__anon_ops)' check in this file to 
identify anonymous test cases.

With that, LGTM.
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
Tested-by: Baolin Wang <baolin.wang@linux.alibaba.com>

> +		madvise(p, len, MADV_NOHUGEPAGE);
> +
>   	return timeout == -1;
>   }
>   
> 

