Received: from mail-oi2-f43.google.com (mail-oi2-f43.google.com [74.125.231.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C3351DAE9
	for <linux-kselftest@vger.kernel.org>; Fri, 18 Sep 2026 18:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789755895; cv=none; b=NyhgvmUfgaFidftBAi88cd1ReWUODSNm2U4mRZ/TjjztY7roHdgUUa46tkLRPsaCZl/aS2ch2iI5LWGPBLUjTTm5pVpL3qzPu1yDliUxBC/+BeaZhDlqduaove9trgD8/eNQa+EhFlnRO13cnjM5U5MDZSibBy2z9paCSlokZF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789755895; c=relaxed/simple;
	bh=2G+wNfPfX0tOCPC9BIXhQ/wd70fF2Gx2wjWcNbn3Nac=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Iy7NLLYeHmi+ybgDpjBaltGWzENWRgZVVhDEByHgNU7JwtW6V9xvpFCGZlYsD3pgHtbaQ3LuXrWQlofqZBAg7xMfssCOIjCsmB7+Z8PZUiAF1LecS9LS6irmeCaChyOO4rd800dDQ7Y2rezzmdrY4Aw4YBhoy0Sbm0xcIl+2uBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=LMkPV4Zh; arc=none smtp.client-ip=74.125.231.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="LMkPV4Zh"
Received: by mail-oi2-f43.google.com with SMTP id 46e09a7af769-7fcb425fc2bso605588a34.3
        for <linux-kselftest@vger.kernel.org>; Fri, 18 Sep 2026 11:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1789755892; x=1790360692; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gbWKvFVIkXlSXOT1i6aOVZll0TkdEFpVUehGk8IWAZ8=;
        b=LMkPV4ZhCozt5mNHnNyJTYVsvUWMUZdhU38nM0VuFBXue72MaKL9mgGzojlYxliHuD
         aHYMuQm3s4TU1pd3F70EaJrPOXgUX7qD1HCAoYu07vXnSnY9fZ2VZcwWwjO04ZO0KT04
         xLI5V5J+RWhQHx2d/vx/NoJxY/kkobWbQ+OOr/Kx22rZvq0fdjERnR+Ja59FsJjnVVdK
         CKU+RBwFmExaCF/6FZUhnH9bWslQLhdjB5auK3fLITiuXhbg0PVHW/mN228YVJP6lj5c
         LbI8uu34Wm2Xz+TGmt77XyjFcVuZ+aNvWcTvUyGLhm7Cokw7kmRn1kEmnCFGyT1r+dcy
         XSqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789755892; x=1790360692;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gbWKvFVIkXlSXOT1i6aOVZll0TkdEFpVUehGk8IWAZ8=;
        b=BTbKf5nrWOe9kDOqQWwrMQfP1ogZSdoJ7AwHAC6+aUnMvxY24bidfCcMKT07rFDDH/
         q0Ees2WjEZkGHB7C9lReBO7D7WwlpeZi1GecPeQrBIbZBSih57VPbz89GEzcLuZoTFp+
         5K/7ZJaxg6kpSHnEPU2mNeo/m4Fvx5HAyLBSbj+wfuLjx7EXRAxBnQBgXcP+MoA1aNMu
         c50TWJ7cYxmEAINtI84VF/FFbSBjI19LBr8Wya1E3XS47SEJ491WReE93wdQh4ADBsbW
         ueSOPwC78g1P5l0npxlzB3O9XXouM0pGlU75d75dQSZf9IiZ1X9vuzuC3cIojifuId2r
         Z7eg==
X-Forwarded-Encrypted: i=1; AKwUvBwXCjTEA9NPzs8+JvYCYtn4nai4wUErmgLSKBmSPY4XRqYMjDvSdfOjj6BO7e0VwTyYbZY4F9sUeRgj+PN7NvU=@vger.kernel.org
X-Gm-Message-State: AFuF++lgK91kwOZ28oeRrTj48TyVM/eeBBQqBUhmQYDPpPMlrCgqBjrZ
	pukkbFQ8JNwysn6qgUWSHnxluVv7gRfxyAXQRpztHMAMIHm5lYBzmbey4tC9G4feAmU=
X-Gm-Gg: AYBFou2vkzqHhYv9tJ2TRkP6LLSLsbLPX2uyJlBscb9yRIGGwJvWgRTmhnCjdAAJc8L
	TKK5fofhl+/9WmzQUc/KVa33ybcpr545rWrY82WNYSNnnxv45JpUezQnzSddyouI1X71GTQho2+
	On8IdlvxbruBlxotsgeG+T0BHXeZ/9U5FKMC3uqrB35NjPI91qyPEG/tmf6Em8vTbfyykizMpBK
	Ck3hhhifQPmdVN+Bd0JTK/F1DQJotJ8m+LyZ/fsm22Jz1eirU0tDt2aA+bLBRIl5fEcAw5nCxtJ
	mbeP8OJcVaVbEcA2v51pzXCQM7aaK5MduI+8Erb55yPJs5Hv1f8KmA7Xx9wPQWuw2Zn/Kfv+vwW
	o93+ZhPGX3hsxCOuoI3jvs4u7meu9imZ/JkTz+GJPhkKZ1OlZKpReW8Ih4najN3xxVeBBu6lCT4
	NW/d2rN/FLs32WzkHBi/ypfD5B4snrao+asW+xfIf7Wn62qc/lEV0+9Q==
X-Received: by 2002:a05:6830:4708:b0:7e9:cf6f:aef8 with SMTP id 46e09a7af769-80de115f4f6mr3987783a34.11.1789755892590;
        Fri, 18 Sep 2026 11:24:52 -0700 (PDT)
Received: from 20HS2G4 ([2a09:bac6:bf21:1923::281:62])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8107881f9f5sm268946a34.0.2026.09.18.11.24.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 11:24:51 -0700 (PDT)
Date: Fri, 18 Sep 2026 13:24:48 -0500
From: Chris Arges <carges@cloudflare.com>
To: Kuniyuki Iwashima <kuniyu@google.com>
Cc: davem@davemloft.net, dsahern@kernel.org, edumazet@google.com,
	horms@kernel.org, idosch@nvidia.com, kernel-team@cloudflare.com,
	kuba@kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, netdev@vger.kernel.org,
	pabeni@redhat.com, shuah@kernel.org
Subject: Re: [PATCH net-next v3 0/3] net: hash uncached route lists by device
Message-ID: <aq2B8PSfjn-xau4V@20HS2G4>
References: <aqyIEE5bRoxRyrFZ@20HS2G4>
 <20260918042110.2581679-1-kuniyu@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918042110.2581679-1-kuniyu@google.com>

On 2026-09-18 04:19:34, Kuniyuki Iwashima wrote:
> From: Chris Arges <carges@cloudflare.com>
> Date: Thu, 17 Sep 2026 19:38:40 -0500
> > On 2026-09-17 22:10:22, Kuniyuki Iwashima wrote:
> > > From: Chris J Arges <carges@cloudflare.com>
> > > Date: Thu, 17 Sep 2026 14:38:21 -0500
> > > > We have observed hung tasks blocked on rtnl_mutex while network namespaces
> > > > were being removed. The namespaces contained many network devices, and the
> > > > host had accumulated a large population of entries on the global per-CPU
> > > > uncached route lists. A perf profile collected during one incident
> > > > attributed most of the cleanup worker's samples to rt_flush_dev():
> > > > 
> > > > ```
> > > > 99.92% kworker/u384:3-  worker_thread
> > > >   `-88.71% process_one_work
> > > >       `-81.02% cleanup_net
> > > >           `-81.00% unregister_netdevice_many_notify
> > > >               `-79.42% notifier_call_chain
> > > >                   `-78.05% fib_netdev_event
> > > >                       `-77.92% rt_flush_dev
> > > > ```
> > > > 
> > > > For each device, rt_flush_dev() visits every possible CPU and scans the
> > > > global uncached route population while its caller holds rtnl_mutex. If N is
> > > > the number of devices, C the number of possible CPUs, and R the number of
> > > > uncached routes, the cost is O(N * (C + R)).
> > > > 
> > > > During namespace cleanup, other processes that issue RTNETLINK operations
> > > > requiring the RTNL lock can stall until cleanup releases the lock.
> > > > 
> > > > A minimal reproducer is available here:
> > > > https://github.com/arges/linux-reproducers/tree/main/rtnl-flush-storm
> > > > 
> > > > This series replaces each per-CPU uncached route list with a hash table
> > > > using the network device as its key. Each table uses 64 buckets.
> > > 
> > > This sounds a bit overkill.  Also, this series still leaves
> > > O(N * C) loops.
> > > 
> > > Given unregistering a single device is less common than
> > > destroying netns, I think the right approach should be to
> > > make the route flush once in cleanup_net() + outside RTNL.
> > > 
> > > Could you try this change ? (only compile-tested)
> > > 
> > Excellent, I'll test this and report back.
> 
> I found a pre-existing issue, which affects the previous
> diff, so on top of it, please apply this patch
> 
>   https://lore.kernel.org/netdev/20260918041439.2575935-1-kuniyu@google.com/T/#u
> 
> and this diff :
> 
> ---8<---
> diff --git a/net/ipv4/route.c b/net/ipv4/route.c
> index d35b66b33bbc..c12e20e07749 100644
> --- a/net/ipv4/route.c
> +++ b/net/ipv4/route.c
> @@ -1567,12 +1567,13 @@ void rt_add_uncached_list(struct rtable *rt)
>  {
>  	struct uncached_list *ul = raw_cpu_ptr(&rt_uncached_list);
>  
> +	rt->dst.rt_uncached_list = ul;
> +
>  	spin_lock_bh(&ul->lock);
>  
>  	if (!check_net(dst_dev_net_rcu(&rt->dst))) {
>  		rt_replace_uncached_list(rt);
>  	} else {
> -		rt->dst.rt_uncached_list = ul;
>  		list_add_tail(&rt->dst.rt_uncached, &ul->head);
>  	}
>  
> diff --git a/net/ipv6/route.c b/net/ipv6/route.c
> index 6cffe8440b44..f22793abbbb8 100644
> --- a/net/ipv6/route.c
> +++ b/net/ipv6/route.c
> @@ -155,12 +155,13 @@ void rt6_uncached_list_add(struct rt6_info *rt)
>  {
>  	struct uncached_list *ul = raw_cpu_ptr(&rt6_uncached_list);
>  
> +	rt->dst.rt_uncached_list = ul;
> +
>  	spin_lock_bh(&ul->lock);
>  
>  	if (!check_net(dst_dev_net_rcu(&rt->dst))) {
>  		rt6_uncached_list_replace(rt);
>  	} else {
> -		rt->dst.rt_uncached_list = ul;
>  		list_add_tail(&rt->dst.rt_uncached, &ul->head);
>  	}
>  
> ---8<---

Kuniyuki,

I was able to test this diff, the previous diff you sent plus the fixup
mentioned above. I was able to confirm even greater reduction in contention
as measured by how much latency an unrelated process takes when waiting for
cleanup_net to complete. This makes sense since we don't even need to hold the
lock when processing those routing entries with your patch.

Some rough average latency numbers with 36 devices, 160k routes, 8 vCPUs:
- main: 137ms
- my hashing proposal: 13ms
- your patchset: 1.8ms

I'd be happy to retest any proposed patches.

Thanks,
--chris
