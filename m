Received: from out30-113.freemail.mail.aliyun.com (out30-113.freemail.mail.aliyun.com [115.124.30.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C123B71A2;
	Wed, 16 Sep 2026 02:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.113
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789527405; cv=none; b=DcpzXA9f4+XkJbCebt94CTXPTPJkQYSJ3gOeCgpA8O/4fg1QAqS7OtJPHaz96UNr9RJxwBcs4quaKp0YBC9il8nVzbwqPzkDrrEJV/zQVH9BYTbLEnsyHiNiGhUTh6q3HdEOTknGLCUFsKFrdpQPk2MMew9U4LpSacrk6jOFMu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789527405; c=relaxed/simple;
	bh=J3qFvdLzZ394L9jRCrceXYYUiShywQS8LAyOf+npOb4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hhJYhzeXMTn+1tSOK6/KvEZGKJ6P035UsyaHbVzMBVcAZZoLg/rZTFnB76bBv/aEXGdK8Kuq7Q3LflL9e4KdvGBiimGsFijuRHUcHURWl1X5QZNqUh+IhjqrdmdsdmWxjn7t2YC9CYAUYaRMxtZExKa7X+Z1LzglbrGLL7rZtJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=WL01MGvS; arc=none smtp.client-ip=115.124.30.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="WL01MGvS"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1789527401; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=ltwHG9lHNDsQHaMaee1Lnu6kVGSGJpl1ybgHT6WGVmg=;
	b=WL01MGvSeI7oaUh7Vt5BEq3MOTAUOantCIhBvcTmuLIpI6xDcsp7mQwXRMu5u1xhHa6sJn9D/VZmW6ClOB2HumwXG1QgfipnnikKNcgb9HpN9Xt56oi36YfoONx0IHRkgD/HzpKindXTZ3tQs5Mnn92MR/oWVkyUn23Vvt1QrOA=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R171e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam011083073210;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=21;SR=0;TI=SMTPD_---0XB3ZciG_1789527399;
Received: from 30.74.144.115(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XB3ZciG_1789527399 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 16 Sep 2026 10:56:39 +0800
Message-ID: <24690e82-3aab-4f2d-95a7-3bba332ca5bc@linux.alibaba.com>
Date: Wed, 16 Sep 2026 10:56:38 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] kselftest: mm: fix intermittent failure khugepaged
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
References: <20260915-fix_khugepagd_fail-v1-0-bb6f04c8759f@arm.com>
 <20260915-fix_khugepagd_fail-v1-2-bb6f04c8759f@arm.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20260915-fix_khugepagd_fail-v1-2-bb6f04c8759f@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/15/26 5:21 PM, Yeoreum Yun wrote:
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
> To prevent this, change the khugepaged setting from ALWAYS to MADVICE for
> the affected tests, and mark the VMA with MADV_NOHUGEPAGE after it has been
> collapsed by wait_for_scan(). This prevents khugepaged from collapsing it
> again before c->collapse() is called.
> 
> This failure was observed on NVIDIA Spark with 16KB page.
> 
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> ---
>   tools/testing/selftests/mm/khugepaged.c | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
> 
> diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/selftests/mm/khugepaged.c
> index c32244b565658..83e9386bbc842 100644
> --- a/tools/testing/selftests/mm/khugepaged.c
> +++ b/tools/testing/selftests/mm/khugepaged.c
> @@ -578,6 +578,8 @@ static bool wait_for_scan(const char *msg, char *p, size_t len,
>   		usleep(TICK);
>   	}
>   
> +	madvise(p, len, MADV_NOHUGEPAGE);

This looks incorrect to me and would reintroduce the previous problem. 
Please see commit 7962e05a835f ("selftests: khugepaged: fix the shmem 
collapse failure").

> +
>   	return timeout == -1;
>   }
>   
> @@ -839,6 +841,7 @@ static void collapse_swapin_single_pte(struct collapse_context *c, struct mem_op
>   
>   static void collapse_max_ptes_swap(struct collapse_context *c, struct mem_ops *ops)
>   {
> +	struct thp_settings settings = *thp_current_settings();
>   	int max_ptes_swap = thp_read_num("khugepaged/max_ptes_swap");
>   	void *p;
>   
> @@ -860,6 +863,9 @@ static void collapse_max_ptes_swap(struct collapse_context *c, struct mem_ops *o
>   	validate_memory(p, 0, hpage_pmd_size);
>   
>   	if (c->enforce_pte_scan_limits) {
> +		settings.hugepages[collapse_order].enabled = THP_MADVISE;
> +		thp_push_settings(&settings);

I'm not sure why the collapse_order setting needs to be changed here. In 
your test case, you did not use the '-c' parameter to specify the 
collapse order.

> +
>   		ops->fault(p, 0, hpage_pmd_size);
>   		ksft_print_msg("Swapout %d of %d pages...", max_ptes_swap,
>   		       hpage_pmd_nr);
> @@ -869,12 +875,15 @@ static void collapse_max_ptes_swap(struct collapse_context *c, struct mem_ops *o
>   			success("OK");
>   		} else {
>   			fail("Fail");
> +			thp_pop_settings();
>   			goto out;
>   		}
>   
>   		c->collapse("Collapse with max_ptes_swap pages swapped out", p,
>   			    1, ops, true);
>   		validate_memory(p, 0, hpage_pmd_size);
> +
> +		thp_pop_settings();
>   	}
>   out:
>   	ops->cleanup_area(p, hpage_pmd_size);
> @@ -1075,6 +1084,7 @@ static void collapse_fork_compound(struct collapse_context *c, struct mem_ops *o
>   
>   static void collapse_max_ptes_shared(struct collapse_context *c, struct mem_ops *ops)
>   {
> +	struct thp_settings settings = *thp_current_settings();
>   	int max_ptes_shared = thp_read_num("khugepaged/max_ptes_shared");
>   	int wstatus;
>   	void *p;
> @@ -1100,6 +1110,9 @@ static void collapse_max_ptes_shared(struct collapse_context *c, struct mem_ops
>   			    1, ops, !c->enforce_pte_scan_limits);
>   
>   		if (c->enforce_pte_scan_limits) {
> +			settings.hugepages[collapse_order].enabled = THP_MADVISE;
> +			thp_push_settings(&settings);

Ditto.

> +
>   			ksft_print_msg("Trigger CoW on page %d of %d...",
>   			       hpage_pmd_nr - max_ptes_shared, hpage_pmd_nr);
>   			ops->fault(p, 0, (hpage_pmd_nr - max_ptes_shared) *
> @@ -1111,6 +1124,8 @@ static void collapse_max_ptes_shared(struct collapse_context *c, struct mem_ops
>   
>   			c->collapse("Collapse with max_ptes_shared PTEs shared",
>   				    p, 1, ops, true);
> +
> +			thp_pop_settings();
>   		}
>   
>   		validate_memory(p, 0, hpage_pmd_size);
> 

