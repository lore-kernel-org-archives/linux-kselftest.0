Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9E5C47CC67;
	Thu, 13 Aug 2026 15:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786633430; cv=none; b=fEysoph5S8pgaAR93Mhv4Zvc9BbjKW2+Yi7I0si7kYyGveLKrPf6HQkx93koBF7iN8NjTqs8FPCqYSizfH1CshUxRfycsd+Vu+UEXksK0MSqTjYJah16gjfgKa6nN2ALtDFsdNaE6U3hIxX6St6c/dMn1Y1V1mhSGbxPHBWn5aA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786633430; c=relaxed/simple;
	bh=zvGdicn7gsaTykiA+8N+MGW9IiO/F1f37oxqeZFRYpY=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=HjQerlIXR4zY94zZpjdFlXXr+TOXC8qryLOLkiVjmrlYKXZEfrHv/7RsXMZMQ/sTa7CEZcnQMd6cmri80q3Ah8FTwgKfvefovRCkjSQl8/JCaY9BjI00wGa7meo8xN0rYUowGAtBGVOOV3AHEe+VUCdVdBxERJL5+EqBMrnayCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GmCJqe/W; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GmCJqe/W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 097DD1F000E9;
	Thu, 13 Aug 2026 15:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786633429;
	bh=195pJpJg9JhscZJnJd0magMDqpiCbW2vvWLEm7sAFO4=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=GmCJqe/WLP6qsb0jrkR6huKEgxPo+cT/yHXHgYAVzEZb9n1YJcfKTckYuHqQxuGF5
	 fWCKbV9ej1kNlOg0bJe5uoCbOnB3Hvy9Outs3KRIDyY6wtpIjZLDIfxv1mdsxnI8tA
	 z9lBZ2Qr8TLDIbNef9C4kPUymwYXlqxuvIutiUIKeMVOPmij+7gRC2oBxB0SkN8CCq
	 yKrRi2/U1Co42evg927kH9E7+V7KpkdhARxYwAVr3Zqzcq1qcRSlFsz6amOUqM1zYq
	 v5ybn7OOccsIhjUzsk0SW9QVdJostmRsWpZyM2DU8JqKiK55wFYXrErz5ech7+4U37
	 IRbPTRriI09pA==
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 02/18] selftests/mm: skip collapse_compound_extreme
 where the PMD is too large
From: Mike Rapoport <rppt@kernel.org>
To: Kiryl Shutsemau <kirill@shutemov.name>
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org, 
 nico.pache@linux.dev, baolin.wang@linux.alibaba.com, baohua@kernel.org, 
 dev.jain@arm.com, hughd@google.com, lance.yang@linux.dev, 
 liam@infradead.org, mhocko@suse.com, rppt@kernel.org, ryan.roberts@arm.com, 
 shuah@kernel.org, surenb@google.com, usama.arif@linux.dev, 
 vbabka@kernel.org, ziy@nvidia.com, usama.anjum@arm.com, 
 agordeev@linux.ibm.com, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kas@kernel.org
In-Reply-To: <20260812132304.199287-3-kirill@shutemov.name>
References: <20260812132304.199287-1-kirill@shutemov.name>
 <20260812132304.199287-3-kirill@shutemov.name>
Date: Thu, 13 Aug 2026 18:03:34 +0300
Message-Id: <178663341429.2230969.2263069830914903834.b4-review@b4>
X-Mailer: b4 0.17-dev

> collapse_compound_extreme builds a PTE table full of distinct PTE-mapped

Nit: we usually add brakets to function names :)

> compound pages by cycling hpage_pmd_nr fault-time THPs through mremap.  It
> therefore needs hpage_pmd_nr PMD-order allocations in a row.  That is fine
> at a 2M PMD (4K base pages) or a 32M one (16K), but a 512M PMD -- arm64
> with 64K base pages -- makes each of those an order-13 allocation, which
> the allocator cannot reliably hand out even once, let alone 8192 times.
> 
> The failure is not a quiet one: the case calls ksft_exit_fail_msg(), so the
> whole binary stops and every case after it is lost.
> 
> Skip the case where the PMD is larger than 32M.  The MADV_COLLAPSE cases
> still cover PMD-order collapse on those configurations, and 4K and 16K
> PMDs are unaffected.
> 
> Assisted-by: Claude-Code:claude-opus-5
> Tested-by: Muhammad Usama Anjum <usama.anjum@arm.com>
> Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
>
> diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/selftests/mm/khugepaged.c
> index 018b0698229c..48eb74c255f6 100644
> --- a/tools/testing/selftests/mm/khugepaged.c
> +++ b/tools/testing/selftests/mm/khugepaged.c
> @@ -974,6 +974,16 @@ static void collapse_compound_extreme(struct collapse_context *c, struct mem_ops
>  	void *p;
>  	int i;
>  
> +	/*
> +	 * The test needs hpage_pmd_nr PMD-order allocations, which is likely to
> +	 * fail for large PMD sizes.  Skip if the PMD size is over 32M.
> +	 */
> +	if (hpage_pmd_size > (32UL << 20)) {
> +		ksft_test_result_skip("%s: PMD too large for fault-time THP construction\n",
> +				      __func__);
> +		return;
> +	}
> +
>  	p = ops->setup_area(1);
>  	ksft_print_msg("Construct PTE page table full of different PTE-mapped compound pages\n");
>  	for (i = 0; i < hpage_pmd_nr; i++) {

Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

-- 
Sincerely yours,
Mike.

