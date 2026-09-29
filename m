Received: from out30-131.freemail.mail.aliyun.com (out30-131.freemail.mail.aliyun.com [115.124.30.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BEC137B02A;
	Tue, 29 Sep 2026 06:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790664343; cv=none; b=iEgqx+OgSI0ghJBrJ5vCAIVKNlUDL6lurg9E8TkkWjOrmcFLrpdgSnlYAx6eWVni84+QQsPVbY4MZF+xd4VoY5PFwbwfGGXTvxtaN70R3SsJG6Ot2RX618zY2NkY2d8/hPxLFZ6etZX4C9lvUz6vyAZiNjbwgwyAGW7jEAQXVB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790664343; c=relaxed/simple;
	bh=VF8d+U2wiYQ+1X6jc3qJpV8gnJ8ocQiQ21uPgsx84JM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WNe2/GhMkb9ojoYxEjGZe5aS05EG+FZ+tYVCWsylMN3dgc7myJCm1HQVsW9I+bIfdlErGzOAdt/w0VMWJm1I4er+MFOePFIbqBKKjFiPgj9ZcqS8YWgnfhhRDjFsGGEm+zUSaow+zuuGOLvekPfTdkdo8HCZpmjT9mHYMm0Bh6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=vqQtGsLt; arc=none smtp.client-ip=115.124.30.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="vqQtGsLt"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1790664332; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=2hovsts/EP2rMWjzeBEfd5QEScwbOvRyI+VdMh5XzkE=;
	b=vqQtGsLtDRqEsDbP+XNhImvjchcmqIbDtwSZcELQ8lbw6FrQPDOu5siF6GcFJja8CcOzXkGX4wW7sIwjxjnwjUOtb6pwMUne+avRYwBNT1AR/gyQIc6eECApHBONAFYph+1MTj9/P7uBRv6KltgRT7Nnp4Ae6+yUfXPfQPKbiW0=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R121e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045133197;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=21;SR=0;TI=SMTPD_---0XBsIIbV_1790664329;
Received: from 30.74.144.142(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XBsIIbV_1790664329 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 29 Sep 2026 14:45:30 +0800
Message-ID: <3c14bfb1-1c0c-42c7-b202-7647e71252f5@linux.alibaba.com>
Date: Tue, 29 Sep 2026 14:45:28 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/4] kselftest: mm: integrate huge page checks
To: Yeoreum Yun <yeoreum.yun@arm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 Zi Yan <ziy@nvidia.com>, "Liam R. Howlett" <liam@infradead.org>,
 Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>,
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Shuah Khan <shuah@kernel.org>, Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260924-fix_split-v8-0-cba7359d882a@arm.com>
 <20260924-fix_split-v8-3-cba7359d882a@arm.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20260924-fix_split-v8-3-cba7359d882a@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/25/26 3:11 AM, Yeoreum Yun wrote:
> check_large_folios() only checks for large folios without distinguishing
> between anonymous and file-backed huge pages.
> 
> To add huge page type checking, integrate the huge page checks into
> __check_huge():
> 
>    1. If hpage_size == pmd_pagesize, check PAGE_IS_HUGE instead of using
>       check_large_folios(), since only the mapping type matters. This
>       identifies PMD-mapped huge pages.
> 
>    2. Otherwise, use check_large_folios() to detect large folios. This
>       covers mTHP cases.
> 
>    3. Check the folio flags according to the huge page type.
> 
> Suggested-by: David Hildenbrand (Arm) <david@kernel.org>
> Suggested-by: Zi Yan <ziy@nvidia.com>
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> ---

LGTM, with nits from Sarthak addressed,
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
Tested-by: Baolin Wang <baolin.wang@linux.alibaba.com>
