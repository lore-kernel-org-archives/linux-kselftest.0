Received: from out30-111.freemail.mail.aliyun.com (out30-111.freemail.mail.aliyun.com [115.124.30.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE98488205;
	Wed,  9 Sep 2026 10:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788948087; cv=none; b=NmsDHSQH8CnBr2oKSHIPgG28ZU69XG5JNEIF73K897i/TfiLMqZjrFDf2lcBqBXfvM7Qbq6jZAO/JaM24ktmhJWnGmqcoiaXjJZJ6g+thFN/2xUI4VN/UUArlDDSQRi0vOfnIWgY3R6yOdAs0pR6uZhrKBetkTYh8hM7JxTFr8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788948087; c=relaxed/simple;
	bh=CA2yHOHqwfjCQGComYCkoGwgkhF02XDf0NC0iDnQsag=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AGzoDw0oLKvrBzEYAfMfQnWTz9svjcK+XKM88bKGEYxitL2/zOK+UdJmHt5R/5kk0VHQY2ZkFvcIyNV4/qWlHhWoffUzSVE/0b4r1lG/A5KMOI8ex85hhQ2mK/SDAZPawS+7hEmfOwq7orP+EupufEJ+MQVzSvmQuRwa8/FfH8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=SO4PymNR; arc=none smtp.client-ip=115.124.30.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="SO4PymNR"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1788948077; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=rAhR1QM/zeuhEomiumpssWgA9rCCG1Ag1irSYP33RaY=;
	b=SO4PymNR4ShaycYfQs1qRey9t9uHNQ6AUyGjYCtzxubeOXDqGaxZBRFJtHN5v1Z8okI7XFD1yf25N23+LvvrVxoEUxFxfia8jf0cZJXnhvM/NAdMRYNGLrArrhcaRVl1ZtW7SRVXICNN4fl7VOrPhIMwTgEK64vW2PYeVzqK6W0=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R141e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=27;SR=0;TI=SMTPD_---0XAefrqA_1788948073;
Received: from 30.74.144.119(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XAefrqA_1788948073 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 09 Sep 2026 18:01:15 +0800
Message-ID: <feb76c81-db9d-4a36-9a31-0b2b31e3c3fb@linux.alibaba.com>
Date: Wed, 9 Sep 2026 18:01:13 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/19] selftests/mm: add folio-order check for address
 ranges
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
 <20260908125105.1510704-9-kirill@shutemov.name>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20260908125105.1510704-9-kirill@shutemov.name>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/8/26 8:50 PM, Kiryl Shutsemau wrote:
> From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
> 
> An mTHP collapse test needs to know that a range is backed by folios of the
> target order, and that they sit where a collapse would put them.  Nothing
> answers that today: is_backed_by_folio() classifies the folio behind a
> single page, and check_huge_anon() reads smaps AnonHugePages, which only
> accounts PMD mappings.

Have you checked check_large_folios() in vm_util.c? It seems to meet 
your requirements, or am I missing something?

> Add is_range_backed_by_order().  It requires every folio-sized, folio-
> aligned part of the range to map one folio of that order, head to tail,
> with the head at the start of the part.
> 
> A part backed by two smaller folios fails, and so does a folio mapped off
> its natural alignment.  The mTHP cases need both to tell a collapsed range
> from the one beside it.
> 
> Assisted-by: LLM
> Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> Tested-by: Muhammad Usama Anjum <usama.anjum@arm.com>
> Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> ---
>   tools/testing/selftests/mm/vm_util.c | 47 ++++++++++++++++++++++++++++
>   tools/testing/selftests/mm/vm_util.h |  2 ++
>   2 files changed, 49 insertions(+)
> 
> diff --git a/tools/testing/selftests/mm/vm_util.c b/tools/testing/selftests/mm/vm_util.c
> index 3ea42a7a2a3e..4947612e8b3d 100644
> --- a/tools/testing/selftests/mm/vm_util.c
> +++ b/tools/testing/selftests/mm/vm_util.c
> @@ -552,6 +552,53 @@ bool is_backed_by_folio(char *vaddr, int order, int pagemap_fd,
>   	return false;
>   }
>   
> +/**
> + * is_range_backed_by_order() - check that a range is backed by @order folios
> + * @start: start of the range, a multiple of the folio size
> + * @len: length of the range in bytes, a multiple of the folio size
> + * @order: the folio order to check for
> + * @pagemap_fd: open /proc/<pid>/pagemap of the range's owner
> + * @kpageflags_fd: open /proc/kpageflags
> + *
> + * Every folio-sized, folio-aligned part of the range must map one folio of
> + * @order, head to tail, with the head at the start of the part.  A part
> + * backed by several smaller folios fails, and so does a folio mapped off
> + * its natural alignment.
> + *
> + * Returns: true if the whole range is backed that way, false otherwise.
> + */
> +bool is_range_backed_by_order(char *start, size_t len, int order,
> +			      int pagemap_fd, int kpageflags_fd)
> +{
> +	const unsigned long nr_pages = 1UL << order;
> +	const size_t folio_size = nr_pages * psize();
> +	char *vaddr;
> +
> +	if ((uintptr_t)start % folio_size || len % folio_size)
> +		return false;
> +
> +	for (vaddr = start; vaddr < start + len; vaddr += folio_size) {
> +		const unsigned long pfn = pagemap_get_pfn(pagemap_fd, vaddr);
> +		unsigned long i;
> +
> +		/* Not present, or a tail page */
> +		if (pfn == -1UL || pfn % nr_pages)
> +			return false;
> +
> +		for (i = 1; i < nr_pages; i++) {
> +			char *page = vaddr + i * psize();
> +
> +			if (pagemap_get_pfn(pagemap_fd, page) != pfn + i)
> +				return false;
> +		}
> +
> +		if (!is_backed_by_folio(vaddr, order, pagemap_fd, kpageflags_fd))
> +			return false;
> +	}
> +
> +	return true;
> +}
> +
>   /* If `ioctls' non-NULL, the allowed ioctls will be returned into the var */
>   int uffd_register_with_ioctls(int uffd, void *addr, uint64_t len,
>   			      bool miss, bool wp, bool minor, uint64_t *ioctls)
> diff --git a/tools/testing/selftests/mm/vm_util.h b/tools/testing/selftests/mm/vm_util.h
> index 56a28ce7d029..e509fc4012a5 100644
> --- a/tools/testing/selftests/mm/vm_util.h
> +++ b/tools/testing/selftests/mm/vm_util.h
> @@ -99,6 +99,8 @@ int gather_folio_orders(char *vaddr_start, size_t len,
>   		int pagemap_fd, int kpageflags_fd, int orders[], int nr_orders);
>   bool is_backed_by_folio(char *vaddr, int order, int pagemap_fd,
>   			int kpageflags_fd);
> +bool is_range_backed_by_order(char *start, size_t len, int order,
> +			      int pagemap_fd, int kpageflags_fd);
>   
>   int uffd_register(int uffd, void *addr, uint64_t len,
>   		  bool miss, bool wp, bool minor);

