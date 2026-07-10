Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com [95.215.58.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B220E28CF5F
	for <linux-kselftest@vger.kernel.org>; Fri, 10 Jul 2026 04:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783657312; cv=none; b=PPyyHZ/WQL/Pkd39agmNeGgChkVC6wQFteR8X2VwnZLxPZq0KfnsbYP3Q0Bcfzu1Zozog+paYstEDs+E958hcyyNfm5EkSJO034li2WacwGFxdS+HIQIA5GidwabTiJOSaurp6C6z9fDEx0Tdd+xbuD8UGkABqiQyHB2Xj9jOtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783657312; c=relaxed/simple;
	bh=LZcMK+XoldP7yradNDcuGxhwCXeeM+TMPel+b3TPJVk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PIHjuNMDLfZF9NVfJU2QXdb1mYBkqv2rCTH5UNEy6xVuysbkT0YblqZXsEsrf/5JE/OJmGDVPu0xmmAFC6feOrn/r+T4VNqCzrgR4WJ7S4c9Kuc9nV46f5x0jvCcJ99Ol4FKg9hVRBwvPvRnXDknEh/hF3eHCNvUKfDXIfncyUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=qoMWIDHG; arc=none smtp.client-ip=95.215.58.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="qoMWIDHG"
Message-ID: <2277444e-111e-405b-b031-57efa5fcb8ef@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1783657307;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1lpSCBPT1MfvQVMMK5lCzHUYPGixov0SxOx6zazzW9Y=;
	b=qoMWIDHGpox1VZZnudIb+Te9ql2jRejnUkB2P0kdJZvXuhTx3Oq8pUTu2RBISo9KvvEOn+
	WMJf0T2gewvNq0cB9IR8RNRxcYTH4Eps0uD7HKaresot8LSlALraucQ31yCJiZyoPTt8YA
	WXd/gfHAXNwwIbg+/6h/tHnpAlgHtKw=
Date: Thu, 9 Jul 2026 21:21:10 -0700
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH rdma-next 12/13] RDMA/rxe: Implement disassociate_ucontext
 callback
To: Jiri Pirko <jiri@resnulli.us>, linux-rdma@vger.kernel.org,
 "yanjun.zhu@linux.dev" <yanjun.zhu@linux.dev>
Cc: cgroups@vger.kernel.org, netdev@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-kselftest@vger.kernel.org, jgg@ziepe.ca,
 leon@kernel.org, parav@nvidia.com, mbloch@nvidia.com, cmeiohas@nvidia.com,
 roman.gushchin@linux.dev, bvanassche@acm.org, zyjzyj2000@gmail.com,
 shuah@kernel.org, tj@kernel.org, mkoutny@suse.com, hannes@cmpxchg.org,
 alibuda@linux.alibaba.com, dust.li@linux.alibaba.com, sidraya@linux.ibm.com,
 wenjia@linux.ibm.com
References: <20260709095532.855647-1-jiri@resnulli.us>
 <20260709095532.855647-13-jiri@resnulli.us>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Zhu Yanjun <yanjun.zhu@linux.dev>
In-Reply-To: <20260709095532.855647-13-jiri@resnulli.us>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


在 2026/7/9 2:55, Jiri Pirko 写道:
> From: Jiri Pirko <jiri@nvidia.com>
>
> Implement an empty disassociate_ucontext() callback so the RDMA core
> can move rxe devices between net namespaces. The core requires this
> callback to reset user contexts without waiting for userspace.
>
> rxe needs no teardown here: its user-mapped queues live in
> reference-counted vmalloc memory (see rxe_mmap.c) that stays valid
> while userspace holds the mappings.

The logic here is correct for enabling netns migration. Since RXE's 
user-mapped

queues rely on reference-counted vmalloc memory, this empty stub is safe 
enough

to prevent kernel panics or Use-After-Free (UAF) during device movement.


However, as a note for future improvement: keeping this callback 
entirely empty

means userspace won't be immediately notified (via SIGBUS or page table 
zapping)

when the underlying device is moved out of its netns. For now, this 
serves well as

a functional enabler, but we might want to introduce proper PTE 
tearing/zap_vma_ptes()

down the road if applications require strict, immediate disconnection 
semantics.


Thanks Jiri.

Reviewed-by: Yanjun Zhu <yanjun.zhu@linux.dev>

Zhu Yanjun

> Signed-off-by: Jiri Pirko <jiri@nvidia.com>
> ---
>   drivers/infiniband/sw/rxe/rxe_verbs.c | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/drivers/infiniband/sw/rxe/rxe_verbs.c b/drivers/infiniband/sw/rxe/rxe_verbs.c
> index 1ec130fee8ea..6eb10d2f0653 100644
> --- a/drivers/infiniband/sw/rxe/rxe_verbs.c
> +++ b/drivers/infiniband/sw/rxe/rxe_verbs.c
> @@ -240,6 +240,10 @@ static void rxe_dealloc_ucontext(struct ib_ucontext *ibuc)
>   		rxe_err_uc(uc, "cleanup failed, err = %d\n", err);
>   }
>   
> +static void rxe_disassociate_ucontext(struct ib_ucontext *ibuc)
> +{
> +}
> +
>   /* pd */
>   static int rxe_alloc_pd(struct ib_pd *ibpd, struct ib_udata *udata)
>   {
> @@ -1478,6 +1482,7 @@ static const struct ib_device_ops rxe_dev_ops = {
>   	.destroy_srq = rxe_destroy_srq,
>   	.detach_mcast = rxe_detach_mcast,
>   	.device_group = &rxe_attr_group,
> +	.disassociate_ucontext = rxe_disassociate_ucontext,
>   	.enable_driver = rxe_enable_driver,
>   	.get_dma_mr = rxe_get_dma_mr,
>   	.get_hw_stats = rxe_ib_get_hw_stats,

-- 
Best Regards,
Yanjun.Zhu

