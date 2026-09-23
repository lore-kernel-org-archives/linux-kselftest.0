Received: from out30-101.freemail.mail.aliyun.com (out30-101.freemail.mail.aliyun.com [115.124.30.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E186B2580F3;
	Wed, 23 Sep 2026 06:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790144733; cv=none; b=YU7tcIOj3OcJlnOir+MeEnRAyendbwzr0zupsTedeDqVyV6i2GOeiiF+o7hjUiDRtTHWRIWq2z6XX59JlPbSt8zk7OVT5sRDK5eG+R75mSDzuiiqaySJS8cVhKBtx50IEBIZP2m54Uov5itRmy8ubm26tEu2fWuAGNqtMwnRirc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790144733; c=relaxed/simple;
	bh=xRIPxHX3ccHfbkvawKMpytxGlBaDv+XN5nWcaIIJMLE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ah43TlnjOenZEDWxl5rW/DSfhoFSH2Eucjq5e8FaPmbfn4YdhPqsYLBEYY2Me5Od22yoOoR6arB8rKBeEy1d7qqe9vKfuFSFzdtNn6fB3uGpzyfI6Bsj21kSBb9M0jnr7+52fYRtDThVtDLEugAloqSweOEiL7GF/euXYeXZNdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=HVkc+PZP; arc=none smtp.client-ip=115.124.30.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="HVkc+PZP"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1790144727; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=D9NFy7AB+YED6sFXcPgfcOz13XtdS9fxqd/Xeu4Y7fo=;
	b=HVkc+PZPu59+mYYXlMuY5tKY9ldsfWN2T55xVYFYRdWr7TJAuXtLXcz8+7bZ5kxPSrWriZnUYqSuAI724NAxbJT6QnbGobNtIX3NdMhbofhalWvCcmci2KtUvgTf1k6KEi6gdKH8UwI2t3x79KlTx2ARZy3+BbejucAeMEkmFcU=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R101e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045133197;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=27;SR=0;TI=SMTPD_---0XBW5CM0_1790144724;
Received: from 30.74.144.107(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XBW5CM0_1790144724 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 23 Sep 2026 14:25:25 +0800
Message-ID: <c551f404-f3db-442d-b101-f21c78c502bc@linux.alibaba.com>
Date: Wed, 23 Sep 2026 14:25:24 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 06/19] selftests/mm: stop khugepaged during the
 MADV_COLLAPSE cases
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
 <20260919002451.496763-7-kirill@shutemov.name>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20260919002451.496763-7-kirill@shutemov.name>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/19/26 8:24 AM, Kiryl Shutsemau wrote:
> From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
> 
> __madvise_collapse() turns THP off before each MADV_COLLAPSE, both to keep
> khugepaged out of the range and to prove MADV_COLLAPSE ignores the setting.
> It clears the global controls only, which is no longer enough.  A per-order
> control overrides them, and -s, which makes the cases fault in folios of
> one order, leaves that order's control at "always".  khugepaged then
> collapses the very range the case is working on, and the case fails on a
> collapse that was interfered with rather than refused.
> 
> Clear the per-order controls too.  MADV_COLLAPSE does not consult them:
> anon never did, and shmem stopped with "mm: shmem: ignore sysfs configs
> for shmem forced collapse".
> 
> Fixes: b7f16963efe7 ("mm/khugepaged: run khugepaged for all orders")
> Assisted-by: LLM
> Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> ---

LGTM.
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
