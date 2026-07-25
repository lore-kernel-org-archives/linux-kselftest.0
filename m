Received: from canpmsgout08.his.huawei.com (canpmsgout08.his.huawei.com [113.46.200.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 254EB175A91;
	Sat, 25 Jul 2026 02:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784945436; cv=none; b=WNZYNmPUwh7E0gUmkv4eN9Tfkx2CGKccLuYSfpmgUWR69pR1tJYHaRRcNt9YdziCQvjLjHhAkoPaJrs/lydZAG/iZEUxITfHMg1l4rJCb2HJ/lcNuifAM9KxJUga3ckM7BJI6UHfJkfZ7fR6yf55aFedoaTUbPyB37Vj+qSpnfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784945436; c=relaxed/simple;
	bh=EtRk58Roa6WKUhv0+bxiRvY121AK+y8hId4caGEMMkg=;
	h=Subject:To:References:CC:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=SeesuY6Z2Bqpbq/VnA+igF1yf4eKTA+AaXVjSmU7IAJ3R+BYiKIwfBzCmCkodreMLhxdJmUBXR+uzPafzXkQOR1FSa6vt37vAP+N2J9X2ZO81pvLePAXjNXLOpmWF8Hm6+aKyS0/VXGV2sEUaEnMDZ7KYlVx/HDyzJk+nkLN4sY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=mJysJzjV; arc=none smtp.client-ip=113.46.200.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="mJysJzjV"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=Ng+ga4AhfBnASMyVoG+hjZ/tTmmyO7vuzpRNh1bTvL8=;
	b=mJysJzjVOqICmd+b38gDsU25j3xRj3lblG6e8H3/tDf8WuocPTWmqVb65HMAyQv7xhT2J1qmB
	CGs5AfD90di/WpGfmy4rLD/ntvLUTiNXSYgJqDRnE7Sv6B+S7hY1USPdLWjYlZPSbRD0IWxA25D
	xL3rxeb/Uqsjy8xmNbLYyoo=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4h6Skn0mZ6zmVWf;
	Sat, 25 Jul 2026 10:01:05 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
	by mail.maildlp.com (Postfix) with ESMTPS id A12B74057A;
	Sat, 25 Jul 2026 10:10:29 +0800 (CST)
Received: from kwepemq500010.china.huawei.com (7.202.194.235) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sat, 25 Jul 2026 10:10:29 +0800
Received: from [10.173.124.160] (10.173.124.160) by
 kwepemq500010.china.huawei.com (7.202.194.235) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sat, 25 Jul 2026 10:10:28 +0800
Subject: Re: [PATCH v2 4/5] selftests/mm: skip hard dirty page-cache test on
 NFS
To: Muhammad Usama Anjum <usama.anjum@arm.com>
References: <20260724102431.1199519-1-usama.anjum@arm.com>
 <20260724102431.1199519-5-usama.anjum@arm.com>
CC: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand
	<david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett"
	<liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport
	<rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko
	<mhocko@suse.com>, Shuah Khan <shuah@kernel.org>, Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <npache@redhat.com>,
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song
	<baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, Usama Arif
	<usama.arif@linux.dev>, Naoya Horiguchi <nao.horiguchi@gmail.com>,
	<linux-mm@kvack.org>, <linux-kselftest@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <sarthak.sharma@arm.com>
From: Miaohe Lin <linmiaohe@huawei.com>
Message-ID: <57c6bec2-3135-35ab-46c7-b1ab041393c9@huawei.com>
Date: Sat, 25 Jul 2026 10:10:27 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260724102431.1199519-5-usama.anjum@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemq500010.china.huawei.com (7.202.194.235)

On 2026/7/24 18:24, Muhammad Usama Anjum wrote:
> The hard dirty_pagecache variant uses MADV_HWPOISON to exercise recovery
> of a dirty file-backed page. The recovery path records -EIO in the
> address_space mapping, which NFS later reports when the test closes the
> file. This makes the test fail after the hwpoison checks have completed.
> 
> Skip this variant when the test file is on NFS. Keep the hard clean-page
> and both soft-offline variants enabled because they use folio removal,
> invalidation, or migration rather than recording a delayed writeback
> error.
> 
> The unsupported-filesystem path in clean_pagecache() also returns
> without closing the opened test file. Close the descriptor before
> skipping there and in dirty_pagecache().
> 
> Signed-off-by: Muhammad Usama Anjum <usama.anjum@arm.com>
> ---
> Changes since v1:
> - Limit the NFS skip to the hard dirty-page variant.
> ---
>  tools/testing/selftests/mm/memory-failure.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/testing/selftests/mm/memory-failure.c b/tools/testing/selftests/mm/memory-failure.c
> index 032ed952057c6..3c72084f57e8b 100644
> --- a/tools/testing/selftests/mm/memory-failure.c
> +++ b/tools/testing/selftests/mm/memory-failure.c
> @@ -283,8 +283,10 @@ TEST_F(memory_failure, clean_pagecache)
>  	if (fd < 0)
>  		SKIP(return, "failed to open test file.\n");
>  	fs_type = get_fs_type(fd);
> -	if (!fs_type || fs_type == TMPFS_MAGIC)
> +	if (!fs_type || fs_type == TMPFS_MAGIC) {
> +		close(fd);
>  		SKIP(return, "unsupported filesystem :%x\n", fs_type);
> +	}
>  
>  	addr = mmap(0, self->page_size, PROT_READ | PROT_WRITE,
>  		    MAP_SHARED, fd, 0);
> @@ -325,8 +327,11 @@ TEST_F(memory_failure, dirty_pagecache)
>  	if (fd < 0)
>  		SKIP(return, "failed to open test file.\n");
>  	fs_type = get_fs_type(fd);
> -	if (!fs_type || fs_type == TMPFS_MAGIC)
> +	if (!fs_type || fs_type == TMPFS_MAGIC ||
> +	    (fs_type == NFS_SUPER_MAGIC && variant->type == MADV_HARD)) {

It would be helpful if we add some comments here.

Reviewed-by: Miaohe Lin <linmiaohe@huawei.com>

Thanks.
.
