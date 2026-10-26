Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792998890;
	b=wWJ+TE4xaGtllOC5NjQfe6+goPDu3DLL/DPsufXF7vCxN8TwdmmGQYlP4LZAcpcuVli3
	 y89ehw0Zb+gkQXoWLy+mvu/vJ/UZ85I97dQLDv9qMpOvAXURwY8ZGiJoMjLhy0mzm6mbw
	 5VnTY+rQmxeTsdJalYu/i+c85qZc3YIFP9obt2DdtOAWCgmd3upMi/L4nuxHR5nJgLw3h
	 4FgmDvSHl0NnRpcdiBCEj55Anm0WLLENxSclRyb2mb3/pvIgzy/XKfhKWfGKpIGiMh+XB
	 tA/1iydJrZQ68Urf6yZdPhmIfEwatCEBJX0af9rDocIU077/Uxx3B9009ra8yd5hQ5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792998890;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=7IxDyJbZWxHDoC0bblBTQ5bGPqjyYBabUNc5tcD1R8U=;
	b=Sgh3Tb+glDSWQO8VesPOYCJ2l0VuENAxBfZoaiqvmxVYEsj8/ZG4Nif8/0yWUvC9EY/M
	 CkYhvivxYlaxUyWRWcEVJnH7hLzlCJbWgRcgjmKBzFxlrZ3Hii/tNV1KrGfWVvdJ5gxV4
	 FBkX2CIwohgmPsb64AJCEGbJR6AceZ86bT2tiJQ3Ew26LQ8pg3VknYEOnrAnKXAlwvOm+
	 WrDYO/Mo5lgpSoUL2VBgJQy0qvQz1+Snj1eAPEc8Zr+5c0nToxxNYoEMgJgd8TW/zxDaO
	 G+QaVwRbYHzGwMDpzU4ftD578ubqc9xPE8wGIKD/j2H6lkYR8ShlPYiDlgP+nA+unjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=mNAArU6x;
	arc=none smtp.remote-ip=95.215.58.124
Received: from mta1.migadu.com (out-124.mta1.migadu.com [95.215.58.124])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46C53606A31B
	for <linux-kselftest@vger.kernel.org>; Mon, 26 Oct 2026 07:14:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46C53606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=mNAArU6x
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=D8qdKfD8isdpKK2ega5gE9qpSwZ5A7vpI6b2/K44K1s=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792998887; v=1; x=1793603687;
 b=mNAArU6xoIj0CeMQMULX7cbNnqfpjEhFCPvzut9uYgUF0aMSu2rCtVRBwUvyX4oR9gfLFOY8
 uhbX3fe+w55ljHYSh7J7ky/OssUk0tp0/UsGuo6hViR4StZySIyti2zAhPOR7faf0RErq46ea6+
 jztbZeph9CHcR8pkX/GLO9Aw=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 3f613b975126340a;
	Mon, 26 Oct 2026 07:14:47 +0000
X-Mizu-Trace-ID: 3f613b975126340a
X-Migadu-Flow: FLOW_OUT
Message-ID: <8f654d81-570a-440c-83c3-04502eecf7f6@linux.dev>
Date: Mon, 26 Oct 2026 15:14:38 +0800
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-next v3 07/11] cgroup/cpuset: Make sure
 compute_partition_effective_cpumask() is only called for valid partition
To: Waiman Long <longman@redhat.com>, Ridong Chen <ridong.chen@linux.dev>,
 Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>,
 =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>,
 Shuah Khan <shuah@kernel.org>
Cc: cgroups@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20261025214449.310715-1-longman@redhat.com>
 <20261025214449.310715-8-longman@redhat.com>
Content-Language: en-US
From: Guopeng Zhang <guopeng.zhang@linux.dev>
In-Reply-To: <20261025214449.310715-8-longman@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



在 2026/10/26 05:44, Waiman Long 写道:
> With visual inspection to make sure that
> compute_partition_effective_cpumask() is only called for valid partition
> root, it was found that the function can be called for an invalidated
> partition near the end of cpuset_hotplug_update_tasks(). When partcmd is
> set, update_parent_effective_cpumask() is called to either invalidate a
> valid partition or with partcmd_update to check if an invalid partition
> can be switched back to valid. In both cases, cpuset_force_rebuild()
> should be invoked. However, compute_partition_effective_cpumask()
> should only be called when an invalid partition is switched back to
> valid. When a partition is invalidated, compute_effective_cpumask()
> should be called instead.
> 
> Also add a WARN_ON_ONCE() in compute_partition_effective_cpumask() to
> ensure that a valid partition root is passed in.
> 
> Fixes: 72c6303acfa1 ("cgroup/cpuset: Take isolated CPUs out of workqueue unbound cpumask")
> Signed-off-by: Waiman Long <longman@redhat.com>
> ---
>  kernel/cgroup/cpuset.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
> index 8903e441ecc1..53fa3970946e 100644
> --- a/kernel/cgroup/cpuset.c
> +++ b/kernel/cgroup/cpuset.c
> @@ -2163,6 +2163,8 @@ static void compute_partition_effective_cpumask(struct cpuset *cs,
>  	struct cpuset *child;
>  	bool populated = partition_is_populated(cs, NULL);
>  
> +	WARN_ON_ONCE(!is_partition_valid(cs));
> +
>  	/*
>  	 * Check child partition roots to see if they should be
>  	 * invalidated when
> @@ -4035,9 +4037,12 @@ static void cpuset_hotplug_update_tasks(struct cpuset *cs, struct tmpmasks *tmp)
>  
>  	if (partcmd >= 0) {
>  		update_parent_effective_cpumask(cs, partcmd, NULL, tmp);
> -		if ((partcmd == partcmd_invalidate) || is_partition_valid(cs)) {
> +		if (is_partition_valid(cs)) {
>  			compute_partition_effective_cpumask(cs, &new_cpus);
>  			cpuset_force_rebuild();
> +		} else if (partcmd == partcmd_invalidate) {
> +			compute_effective_cpumask(&new_cpus, cs, parent);
> +			cpuset_force_rebuild();
>  		}
>  	}
>  

Acked-by: Guopeng Zhang <zhangguopeng@kylinos.cn>

Thanks,
Guopeng
