Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.220
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795403219;
	b=3DV4f+eQDEdjZKONqLA2GOzYdVTrIt+Z+KU/pijVyqEPF4P5LVSni/klQkEZUEnUIY2w
	 eMNIQwOKmiWb1zO78EG+orzNFd67DOlBRP6VkHWUx57ChE4/OIGytTymFgn9nwGmSI4HO
	 AjI1mfLRdO/pYd6c7Eg8xu4DHAQOnRiqw2Hs/ndUqTrUU5HhE8ER5lNQR4gszjahitQeA
	 pM2XuxRXnJcZIo7TWzvmHcjuUP+wP5VOWSZhovcKIheTPTUci+cZDQPzgMnAcu+eAH1w/
	 rya4C+BvZwMGWe3hkA/Hvt3/FxSPhZxGGbZptv2FRMl33rv74h0+6gwalyAzpBVh2WQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795403219;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Subject:To:CC:
	 References:From:Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
	 Content-Type:Content-Language:Content-Transfer-Encoding:
	 X-Originating-IP:X-ClientProxiedBy;
	bh=NXAyZ0hsJbhvQY501e19qPPambdBmSK7h3/bB0F7/ZI=;
	b=vSeHfcOt2ZlGdqgzkFcZbLWvM8sBKHf8lbpow/DVLMDcRo/sieQKD4CYyKNkrWot68hU
	 YsaucISb9/jeFGgA7spl0V8wuVn6VAHo5zb/TzBLPVZBIzoctZZrumIAX6AGGwTukAPce
	 bJK1a5MKXap2gW9B2HDwrUmOhf/bV4x752E8PvTG5jEiLJrZvp9Ci2K/Xz0KmOWFzAMb0
	 5RZy8lDP3Cv0c9eZdxJmtAK/PLZmU9K4QbWwhFvmVWNXIkQI/UZojYAfe7OqoE9Jn8N+7
	 2xHPLbTQsHKmzXrvu8WDUn115Zy9etvRQwkQGFGCmlKkMwYCSJmiC+ZifMyx4Bc01QQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=EhVlDbiJ;
	arc=none smtp.remote-ip=113.46.200.220
Received: from canpmsgout05.his.huawei.com (canpmsgout05.his.huawei.com [113.46.200.220])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA05D60A2613
	for <linux-kselftest@vger.kernel.org>; Mon, 23 Nov 2026 03:06:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA05D60A2613
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=EhVlDbiJ
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=NXAyZ0hsJbhvQY501e19qPPambdBmSK7h3/bB0F7/ZI=;
	b=EhVlDbiJ9arsbzJbWLHXae9h9HA0VIwcidIZHWyFTsC6bKPjBBXxyMciPpKLIIQ0/KoWErFuV
	QoA7uDDyldSsdn8N6w5Fv4IibDYNmilbpc27tANruBX/OfPZEd96U2i+2pn27Ne+rVsxIMwugAy
	XNn2IC4ous5PP8/h76RlWRc=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4jXrRp2nQQz12LDW;
	Mon, 23 Nov 2026 11:05:58 +0800 (CST)
Received: from whupemk100004.china.huawei.com (unknown [7.152.185.74])
	by mail.maildlp.com (Postfix) with ESMTPS id D72774056E;
	Mon, 23 Nov 2026 11:06:47 +0800 (CST)
Received: from [10.173.98.163] (10.173.98.163) by
 whupemk100004.china.huawei.com (7.152.185.74) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 23 Nov 2026 11:06:46 +0800
Subject: Re: [PATCH] selftests/mm: skip hard dirty page-cache test on FUSE
To: Kurt Lin <lylin1023@gmail.com>
CC: <linux-mm@kvack.org>, <linux-kselftest@vger.kernel.org>, Muhammad Usama
 Anjum <usama.anjum@arm.com>, Naoya Horiguchi <nao.horiguchi@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand
	<david@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka
	<vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, Michal Hocko
	<mhocko@suse.com>, Shuah Khan <shuah@kernel.org>
References: <20261123-memory-failure-fuse-skip-v1-1-19dcbda6e2e8@gmail.com>
From: Miaohe Lin <linmiaohe@huawei.com>
Message-ID: <25ecd9ad-7c5c-16ff-5197-5703622a88b1@huawei.com>
Date: Mon, 23 Nov 2026 11:06:45 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261123-memory-failure-fuse-skip-v1-1-19dcbda6e2e8@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 whupemk100004.china.huawei.com (7.152.185.74)

On 2026/11/23 1:58, Kurt Lin wrote:
> Like NFS, FUSE reports on close() the -EIO that MADV_HWPOISON records
> in the mapping of a dirty page-cache page, as fuse_flush() calls
> filemap_check_errors(). Run from a virtiofs directory, e.g. in a
> virtme-ng guest, the hard dirty_pagecache variant fails on its final
> close():
> 
>   memory-failure.c:389:dirty_pagecache:Expected close(fd) (-1) == 0 (0)
> 
> Skip it on FUSE, as commit e14e52a7ce02 ("selftests/mm: skip hard dirty
> page-cache test on NFS") does for NFS.
> 
> An AI coding assistant (Claude) was used to find the failure, write the
> fix and draft this changelog.
> 
> Fixes: d51b5076c746 ("selftests/mm: add memory failure dirty pagecache test")
> Signed-off-by: Kurt Lin <lylin1023@gmail.com>
> ---
> Tested in a virtme-ng guest, memory-failure built from mm-new with and
> without this patch, hwpoison_inject loaded:
> 
>   cwd on       before                  after
>   virtiofs     9 pass, 1 fail          9 pass, 1 skip
>   ext4 (loop)  10 pass                 10 pass
> 
> run_vmtests.sh -t memory-failure from the virtiofs directory passes
> with the patch. The soft dirty_pagecache variant keeps running on
> FUSE and passes.
> 
> FUSE servers that open files with FOPEN_NOFLUSH do not report the error
> on close(), so the variant could run there; it is skipped with the rest.
> ---
>  tools/testing/selftests/mm/memory-failure.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/testing/selftests/mm/memory-failure.c b/tools/testing/selftests/mm/memory-failure.c
> index 135a2e8069ba..72a29ec19692 100644
> --- a/tools/testing/selftests/mm/memory-failure.c
> +++ b/tools/testing/selftests/mm/memory-failure.c
> @@ -355,11 +355,12 @@ TEST_F(memory_failure, dirty_pagecache)
>  	fs_type = get_fs_type(fd);
>  	/*
>  	 * MADV_HARD poisoning of dirty page-cache data records an expected
> -	 * -EIO in the file mapping. NFS reports this error on close(), so
> -	 * skip this variant.
> +	 * -EIO in the file mapping. NFS and FUSE report this error on
> +	 * close(), so skip this variant.
>  	 */
>  	if (!fs_type || fs_type == TMPFS_MAGIC ||
> -	    (fs_type == NFS_SUPER_MAGIC && variant->type == MADV_HARD)) {
> +	    ((fs_type == NFS_SUPER_MAGIC || fs_type == FUSE_SUPER_MAGIC) &&
> +	     variant->type == MADV_HARD)) {

Would it be better to add a helper? I doubt there might be more unsupported filesystem.

Acked-by: Miaohe Lin <linmiaohe@huawei.com>

Thanks.
.
