Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C78EC3E0C61
	for <linux-kselftest@vger.kernel.org>; Thu, 19 Mar 2026 19:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773949044; cv=none; b=VqlJXTJxvL5gtJ/oCbEpeIolvfpEn9IHxC5zZS2PZ5vrOS57DedIQU/KZaj9LDnxUkM3gC2XJs6ftkXemidnsNCdGaIa5fC4VC0pmFdcsoByJjdGk4moid4zzt4huKXLicsgBPvExU5oX6pr0e/FI83qi961BllXlN/s7F6mePI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773949044; c=relaxed/simple;
	bh=xVfNqnUGTBJHDyDjhOuCxVdWqVCVVkUzCHHqsU4io7Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lgSeBWu5b6NBUuFYT3IynOSql1oCzFwV40FGj/D1Zun1MA1FL+Q/vQiJjgSlWzD8wlbA0NxpC8faT3BtvG9tlkUg7K9AtL797XP4146TbHY6u4COCRgbX6WOnvetGXsIlcftFs+uD3PXkkwZ77ssjvYqap1L5/fCLpuTO2txsXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TpKGxGUt; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TpKGxGUt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773949041;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wP7goAphGwHbZGLJbOVS8N5+TtNDC+nhk/5Hwt/EhgY=;
	b=TpKGxGUt3q2juhcjazNJf5BQcSMgmlkGGd/Tg9Jfh9HqrO5EWTTQmub6MNToHoHYs/RMi/
	yaiC74mFd6tHkHC+nM9fL/dvgU8/Gik9lNe1yZllFTwHjs4v+Rc86boFhRJoGqpPyk27u+
	Ar1or1GJQYMpVBcGGta5tAIYNQg2vtI=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-556-rbH_YTJ9PsOsHEX5_TTW6w-1; Thu,
 19 Mar 2026 15:37:17 -0400
X-MC-Unique: rbH_YTJ9PsOsHEX5_TTW6w-1
X-Mimecast-MFC-AGG-ID: rbH_YTJ9PsOsHEX5_TTW6w_1773949036
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B49FB1944F05;
	Thu, 19 Mar 2026 19:37:15 +0000 (UTC)
Received: from [10.22.80.194] (unknown [10.22.80.194])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id E43EF1955D84;
	Thu, 19 Mar 2026 19:37:13 +0000 (UTC)
Message-ID: <a2e9ca15-f51f-4613-9894-dd1301d3ce98@redhat.com>
Date: Thu, 19 Mar 2026 15:37:12 -0400
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] selftests/cgroup: Fix hardcoded page size in
 test_percpu_basic
To: Li Wang <liwang@redhat.com>, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, akpm@linux-foundation.org
Cc: Christoph Lameter <cl@linux.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Michal Hocko <mhocko@kernel.org>, Shakeel Butt <shakeelb@google.com>,
 Tejun Heo <tj@kernel.org>, Vlastimil Babka <vbabka@suse.cz>
References: <20260306071843.149147-1-liwang@redhat.com>
Content-Language: en-US
From: Waiman Long <longman@redhat.com>
In-Reply-To: <20260306071843.149147-1-liwang@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

On 3/6/26 2:18 AM, Li Wang wrote:
> MAX_VMSTAT_ERROR uses a hardcoded page size of 4096, which assumes
> 4K pages. This causes test_percpu_basic to fail on systems where
> the kernel is configured with a larger page size, such as aarch64
> systems using 16K or 64K pages, where the maximum permissible
> discrepancy between memory.current and percpu charges is
> proportionally larger.
>
> Replace the hardcoded 4096 with sysconf(_SC_PAGESIZE) to correctly
> derive the page size at runtime regardless of the underlying
> architecture or kernel configuration.
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
>   tools/testing/selftests/cgroup/test_kmem.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/testing/selftests/cgroup/test_kmem.c b/tools/testing/selftests/cgroup/test_kmem.c
> index eeabd34bf083..249d79113067 100644
> --- a/tools/testing/selftests/cgroup/test_kmem.c
> +++ b/tools/testing/selftests/cgroup/test_kmem.c
> @@ -24,7 +24,7 @@
>    * the maximum discrepancy between charge and vmstat entries is number
>    * of cpus multiplied by 64 pages.
>    */
> -#define MAX_VMSTAT_ERROR (4096 * 64 * get_nprocs())
> +#define MAX_VMSTAT_ERROR (sysconf(_SC_PAGESIZE) * 64 * get_nprocs())
>   
>   #define KMEM_DEAD_WAIT_RETRIES        80
>   

That is the right change for now. However, I have sent out patches that 
change the way vmstats flush threshold is being computed, so it may need 
to be changed again in the future if the threshold is indeed updated. 
Anyway,

Acked-by: Waiman Long <longman@redhat.com>

