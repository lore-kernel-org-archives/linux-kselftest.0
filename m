Received: from out30-101.freemail.mail.aliyun.com (out30-101.freemail.mail.aliyun.com [115.124.30.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EA5A496906;
	Wed,  9 Sep 2026 09:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788947719; cv=none; b=ZKoT582g/h12JCd/+w6lG7913WKL9C+Usds4au+9CQ0v0Qd9hLOxKiUa6g95lx6CS+Aq6IFKGua3Nms6c4lu6R1Fss81yZvPEkt2lktbEH66nZzOQQF6yDRixraQsu/Tr9IJ5zonfZUyLQSHXKupuKPOazea1N/FTA81Yf4qhTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788947719; c=relaxed/simple;
	bh=V6FHdhUWrIEL3GO8EPY321wFuOQCAemUWAucw3gXr10=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b42ZKjffINs0Jd1zRR55oV3mZqkPFH/2cwWn/fApvGlx3sV58/cB+5j8mn1Xb1iSrYN+WoPOkTaLG+Z4GD+4SgkZSTCKNlEG5Pyu8RlaJwfAJjpohlkEUc4DiF5sqDrqqt+RKOJDR/Rob4fMNYsZ+9FymmYRhs1dcym6WD1zaA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=rJ0azai2; arc=none smtp.client-ip=115.124.30.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="rJ0azai2"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1788947705; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=DpTZv98TBCym8APZzjiS1eCA+OF2OQMSUEHKxCalkBI=;
	b=rJ0azai2gqRBInbl30R5EMya3fcOTo01AKaR2D4sBokSNt+s1dqp30jZLTmXN/ap6K+dI6hIa7xXRiC40tkUtO+1LOzr18WROqFj8y9k8HbrVflrmz97VU6GOvzZAUY15cKzA2HcsVKzESYf00IRR7fMzNgxbw5SbyoukXZ/Tqo=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R121e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam011083073210;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=27;SR=0;TI=SMTPD_---0XAeWyTK_1788947701;
Received: from 30.74.144.119(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XAeWyTK_1788947701 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 09 Sep 2026 17:55:03 +0800
Message-ID: <4e064b9d-aea9-485a-8547-3830999cff01@linux.alibaba.com>
Date: Wed, 9 Sep 2026 17:55:01 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 06/19] selftests/mm: stop khugepaged during the
 MADV_COLLAPSE cases
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
 <20260908125105.1510704-7-kirill@shutemov.name>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20260908125105.1510704-7-kirill@shutemov.name>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/8/26 8:50 PM, Kiryl Shutsemau wrote:
> From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
> 
> __madvise_collapse() turns THP off before each MADV_COLLAPSE, both to keep
> khugepaged out of the range and to prove MADV_COLLAPSE ignores the setting.
> It clears the global controls only, which is no longer enough.  A per-order
> control overrides them, and -s, which makes the cases fault in folios of
> one order, leaves that order's control at "always".  khugepaged then
> collapses the very range the case is working on, and the case fails on a
> collapse that was interfered with rather than refused.

Right. So I think the correct fix tag is b7f16963efe7 ("mm/khugepaged: 
run khugepaged for all orders"), because before this commit, khugepaged 
would not try to collapse this range since it only checked whether the 
PMD order was suitable for collapse.

> Clear the per-order controls too, setting them to "inherit" rather than
> "never": khugepaged honours the global never and stays out, while
> MADV_COLLAPSE on shmem still finds an order to build.
> 
> Fixes: 9f0704eae8a4 ("selftests/mm/khugepaged: enlighten for multi-size THP")
> Assisted-by: LLM
> Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> ---
>   tools/testing/selftests/mm/khugepaged.c | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/selftests/mm/khugepaged.c
> index 398430c33872..e9bc8fe8a1f8 100644
> --- a/tools/testing/selftests/mm/khugepaged.c
> +++ b/tools/testing/selftests/mm/khugepaged.c
> @@ -533,8 +533,8 @@ static bool is_anon(struct mem_ops *ops)
>   static void __madvise_collapse(const char *msg, char *p, int nr_hpages,
>   			       struct mem_ops *ops, bool expect)
>   {
> -	int ret;
>   	struct thp_settings settings = *thp_current_settings();
> +	int ret, i;
>   
>   	ksft_print_msg("%s...", msg);
>   
> @@ -547,9 +547,16 @@ static void __madvise_collapse(const char *msg, char *p, int nr_hpages,
>   	/*
>   	 * Prevent khugepaged interference and tests that MADV_COLLAPSE
>   	 * ignores /sys/kernel/mm/transparent_hugepage/enabled
> +	 *
> +	 * "inherit" rather than "never" so that MADV_COLLAPSE on shmem still
> +	 * finds an order to build.
>   	 */
>   	settings.thp_enabled = THP_NEVER;
>   	settings.shmem_enabled = SHMEM_NEVER;
> +	for (i = 0; i < NR_ORDERS; i++) {
> +		settings.hugepages[i].enabled = THP_INHERIT;
> +		settings.shmem_hugepages[i].enabled = SHMEM_INHERIT;
> +	}

This looks like a workaround to me. Shouldn't we fix this in shmem 
instead? Since MADV_COLLAPSE is supposed to ignore the THP setting, the 
fix should be something like this?

diff --git a/mm/shmem.c b/mm/shmem.c
index c92ed17dbc4a..e0c0901c34a4 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -2050,7 +2050,7 @@ unsigned long shmem_allowable_huge_orders(struct 
inode *inode,
         global_orders = shmem_huge_global_enabled(inode, index, write_end,
                                                   shmem_huge_force, 
vma, vm_flags);
         /* Tmpfs huge pages allocation */
-       if (!vma || !vma_is_anon_shmem(vma))
+       if (!vma || !vma_is_anon_shmem(vma) || shmem_huge_force)
                 return global_orders;

         /*
