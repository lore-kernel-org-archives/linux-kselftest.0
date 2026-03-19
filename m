Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3166E3D5675
	for <linux-kselftest@vger.kernel.org>; Thu, 19 Mar 2026 19:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773949109; cv=none; b=IAbtEj1Mr24C/1L1j1Z+mgi3xjzUvDXJ2tuWg2+WlmaRdjaU7B/hQ5dRZhXu1fSWqMfdVeueFOf0lkw3eYsUU3rL/gf6pvbaitArNJ+KBm+Oxe0VnDUb4dx584k0c+H19Hbo1syJgV8QaxvujaJwfiOI3ECmjTh/P+DmCFl/WLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773949109; c=relaxed/simple;
	bh=h/nkfzWaI7oxjVKQ0k2UJDEUKrZaC/qHa+dbLpbNP8A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jgR44kkbR4oMu5U2/bF4iAjQv6xeGK8YJGyQvgDcwOpCd4MSf4+YFoz3W6xSOAsUx5wPHDvH6BUNLwDm6yJPkFLxjY2ifwn7LOdm8MgUTqUUauZGyXv1bN0lYJGpRrJIIL0jb1XRgJ0qtldojvA8VXg8wLWg13HCaq5ygm+xGGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iuoZBT/K; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iuoZBT/K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773949107;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Xr7Sef4dOYVWMxrytNcFLG5K39eBIEXx42YPvaz4/vw=;
	b=iuoZBT/KaFSxqhNfOhnwPJuVVouwOH2CxMB6AbEAdZzSbOdWTe/AXkMYJsz5dTmVabgwfK
	VZ51zlOySu82iC48S+rCbZ580bajaUpsxTcuqhVbJMrkhEsOAMKy+Q0Up/Bff2l+i3jHoK
	m3NfgTR6H+7fVllx4rncGBXE/y8a+lU=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-76-ACc0-ktWOgqa-DeO68-SzA-1; Thu,
 19 Mar 2026 15:38:23 -0400
X-MC-Unique: ACc0-ktWOgqa-DeO68-SzA-1
X-Mimecast-MFC-AGG-ID: ACc0-ktWOgqa-DeO68-SzA_1773949102
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 336F8195604F;
	Thu, 19 Mar 2026 19:38:22 +0000 (UTC)
Received: from [10.22.80.194] (unknown [10.22.80.194])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 8037030001A1;
	Thu, 19 Mar 2026 19:38:20 +0000 (UTC)
Message-ID: <5cf1d4fc-cab1-45f7-954f-ecebef2994bf@redhat.com>
Date: Thu, 19 Mar 2026 15:38:19 -0400
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] selftests/cgroup: include slab in test_percpu_basic
 memory check
To: Li Wang <liwang@redhat.com>, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, akpm@linux-foundation.org
Cc: Christoph Lameter <cl@linux.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Michal Hocko <mhocko@kernel.org>, Shakeel Butt <shakeelb@google.com>,
 Tejun Heo <tj@kernel.org>, Vlastimil Babka <vbabka@suse.cz>
References: <20260306071843.149147-1-liwang@redhat.com>
 <20260306071843.149147-2-liwang@redhat.com>
Content-Language: en-US
From: Waiman Long <longman@redhat.com>
In-Reply-To: <20260306071843.149147-2-liwang@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

On 3/6/26 2:18 AM, Li Wang wrote:
> test_percpu_basic() currently compares memory.current against only
> memory.stat:percpu after creating 1000 child cgroups.
>
> Observed failure:
>    #./test_kmem
>    ok 1 test_kmem_basic
>    ok 2 test_kmem_memcg_deletion
>    ok 3 test_kmem_proc_kpagecgroup
>    ok 4 test_kmem_kernel_stacks
>    ok 5 test_kmem_dead_cgroups
>    memory.current 11530240
>    percpu 8440000
>    not ok 6 test_percpu_basic
>
> That assumption is too strict: child cgroup creation also allocates
> slab-backed metadata, so memory.current is expected to be larger than
> percpu alone. One visible path is:
>
>    cgroup_mkdir()
>      cgroup_create()
>        cgroup_addrm_file()
>          cgroup_add_file()
>            __kernfs_create_file()
>              __kernfs_new_node()
>                kmem_cache_zalloc()
>
> These kernfs allocations are charged as slab and show up in
> memory.stat:slab.
>
> Update the check to compare memory.current against (percpu + slab)
> within MAX_VMSTAT_ERROR, and print slab/delta in the failure message to
> improve diagnostics.
>
> Signed-off-by: Li Wang <liwang@redhat.com>
> Cc: Waiman Long <longman@redhat.com>
> Cc: Christoph Lameter <cl@linux.com>
> Cc: Johannes Weiner <hannes@cmpxchg.org>
> Cc: Michal Hocko <mhocko@kernel.org>
> Cc: Shakeel Butt <shakeelb@google.com>
> Cc: Tejun Heo <tj@kernel.org>
> Cc: Vlastimil Babka <vbabka@suse.cz>
> ---
>   tools/testing/selftests/cgroup/test_kmem.c | 11 ++++++-----
>   1 file changed, 6 insertions(+), 5 deletions(-)
>
> diff --git a/tools/testing/selftests/cgroup/test_kmem.c b/tools/testing/selftests/cgroup/test_kmem.c
> index 249d79113067..4b5799698893 100644
> --- a/tools/testing/selftests/cgroup/test_kmem.c
> +++ b/tools/testing/selftests/cgroup/test_kmem.c
> @@ -353,7 +353,7 @@ static int test_percpu_basic(const char *root)
>   {
>   	int ret = KSFT_FAIL;
>   	char *parent, *child;
> -	long current, percpu;
> +	long current, percpu, slab;
>   	int i;
>   
>   	parent = cg_name(root, "percpu_basic_test");
> @@ -379,13 +379,14 @@ static int test_percpu_basic(const char *root)
>   
>   	current = cg_read_long(parent, "memory.current");
>   	percpu = cg_read_key_long(parent, "memory.stat", "percpu ");
> +	slab = cg_read_key_long(parent, "memory.stat", "slab ");
>   
> -	if (current > 0 && percpu > 0 && labs(current - percpu) <
> -	    MAX_VMSTAT_ERROR)
> +	if (current > 0 && percpu > 0 && slab >= 0 &&
> +			labs(current - (percpu + slab)) < MAX_VMSTAT_ERROR)
>   		ret = KSFT_PASS;
>   	else
> -		printf("memory.current %ld\npercpu %ld\n",
> -		       current, percpu);
> +		printf("memory.current %ld\npercpu %ld\nslab %ld\ndelta %ld\n",
> +			current, percpu, slab, current - (percpu + slab));
>   
>   cleanup_children:
>   	for (i = 0; i < 1000; i++) {
Reviewed-by: Waiman Long <longman@redhat.com>

