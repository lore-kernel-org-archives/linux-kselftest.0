Received: from out30-132.freemail.mail.aliyun.com (out30-132.freemail.mail.aliyun.com [115.124.30.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FBD344C64E;
	Wed,  9 Sep 2026 07:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788940294; cv=none; b=EHTtAtIOmmwixE/45lbjOWW82OqvrpksP39bV3IeQUEd9QZE1fdM4pbRARcoFGMA/0eQ5Hje8BzReqqA2FN5OEeStJy5sK7LoVHIMkztnGJmEYCJga3H7kgCKoR8Z0ex1Vdfjtpob9Fh2Lj97dRXElxj2XWL2ws7vUF2xzWw5DE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788940294; c=relaxed/simple;
	bh=BhUH49c8bG2IjriFLZYJf6TJg3uwRdQo30UNDFGyqFQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fL4nOURJFFOISbmOK0G4pMhG9gP3bseyAeV3Un6IodOobe6DaJjMs8PTqSwJEO+WjTqMlIzZ8pGYWRwopp50YcFev7YsoNNbs67T3CMynsyuF4JycqiCGKtdfUaK7XpsCPZtZVv3Wu3r9kL9cffDTwGwcxVtT+jw4GA+r46BqR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=E4zGX4Fh; arc=none smtp.client-ip=115.124.30.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="E4zGX4Fh"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1788940280; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=HgcVAsu0rPX72TNTb7TtYB2tqY78GbkTnwUYgQz1Gq8=;
	b=E4zGX4Fh8/pzMYvHDvIpYb2E3U/D2JvmcuxDnnTbKNIje4Q3MUcWC5wfOnU3twfzp16advmiT4yx0CFh1v8kwfdMQ2r4tBxQHuQT/BHkyn8IakOHQl31SWTq0DQRNFkPBHp7V3fH18+t8n4dzpe2uqqEJpA21gW35ellthx5I88=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R191e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam011083073210;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=27;SR=0;TI=SMTPD_---0XAeEI2m_1788940276;
Received: from 30.74.144.119(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XAeEI2m_1788940276 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 09 Sep 2026 15:51:18 +0800
Message-ID: <238965b3-c512-48f8-8dbb-08a76cdbcc48@linux.alibaba.com>
Date: Wed, 9 Sep 2026 15:51:16 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 02/19] selftests/mm: skip collapse_compound_extreme()
 where the PMD is too large
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
 <20260908125105.1510704-3-kirill@shutemov.name>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20260908125105.1510704-3-kirill@shutemov.name>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/8/26 8:50 PM, Kiryl Shutsemau wrote:
> From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
> 
> collapse_compound_extreme() builds a PTE table full of distinct PTE-mapped
> compound pages by cycling hpage_pmd_nr fault-time THPs through mremap.  It
> therefore needs hpage_pmd_nr PMD-order allocations in a row.  That is fine
> at a 2M PMD (4K base pages) or a 32M one (16K).  A 512M PMD -- arm64 with
> 64K base pages -- makes each of those an order-13 allocation, which the
> allocator cannot reliably hand out even once, let alone 8192 times.
> 
> The failure is not a quiet one: the case calls ksft_exit_fail_msg(), so the
> whole binary stops and every case after it is lost.
> 
> Skip the case where the PMD is larger than 32M.  The MADV_COLLAPSE cases
> still cover PMD-order collapse on those configurations, and 4K and 16K
> PMDs are unaffected.
> 
> Assisted-by: LLM
> Acked-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> Tested-by: Muhammad Usama Anjum <usama.anjum@arm.com>
> Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> ---

LGTM.
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
