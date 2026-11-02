Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.68
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793582952;
	b=dVGBpib5CrPwreujt01vrVwdejRtYfZdWVyVB1p1PoJwvQSs7qzcrHewc26tsdMG42sU
	 R7pJH7ssInBmHoSEDEu7dBYhZ7TH+L2Irh9ze02NruRuueK8zYzRsJFdXAyqZF+FcXnzh
	 bK9HpTwomJXhTPxwqXG2uwKNl5Hd23IhiU2YTvvRXGkDbfT8ary/MKcIfIegTYzxKwbKP
	 46leqLPs+88sInqUy//q/iyO35YeX888wMNJKvMDIGzYSj41hP7O/rK+tFQa4vxcf1gEm
	 hM1S+33q2xpygvXa4XwngV0rrqrLkRYzAz90aHbvOHlpuTPVwWYIZ/+lbSPxgL1DvkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793582952;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=RfRd34hbQ3fNwbe9mZRyC1FUgyB8k24TDialm2Z8OBI=;
	b=XS6s42mSSMXTQd4sNQF8w/JtTGAOYtmG8V773vMvRgQdZMCqDw8IMQWsNejATEJPyxSg
	 gORyLtzGExcYVmCITgDJnvjtOp8sffVCrP4OX4UD75bXwuvToqAZsNntiXnLx6U4emIiO
	 ozC+5OFq1gAsFnrEayIIeNWpdUjzp/nswvcP/xln+C43XWKQYQVRWvZX7eqcIOe7Y8nrj
	 SESFr2k+MN1MHfqlkdO40UWHw18zz5EDmGwAE+wGhuOz4qmi+DFjZbaXaWZg+eKHF4/Ud
	 JxCNflLxwvf3V5h3hG/ozO5PU02OJ7Vmy5dOWtlZHwKRpw01dfP3qZl10iG9PdcMzvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=pocw8uga;
	arc=none smtp.remote-ip=91.218.175.68
Received: from mta0.migadu.com (out-68.mta0.migadu.com [91.218.175.68])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA1EA606A32E
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Nov 2026 01:29:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA1EA606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=pocw8uga
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=sX0hSFxSFmqYm4dEqA48I5gNAB/p57bOI6zGz5tQowQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793582949; v=1; x=1794187749;
 b=pocw8uga+BoaKmXcYnAVF2DaTlOUwclIuH84FHW0mcbDxiXKpehOt5AILeo8pavwiilb69aj
 XTkyZP2gCkQ7EL0k9fEa7k374PxANu+r77v/D3Fv5ivruVl2/V/bVIYGj79CMbI8NQ3aDKGwPiG
 CqO/lkFkhVaxWNY69BovGYP4=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id f967bc48abe79d33;
	Mon, 02 Nov 2026 01:29:07 +0000
X-Mizu-Trace-ID: f967bc48abe79d33
X-Migadu-Flow: FLOW_OUT
Message-ID: <c4b63601-ab06-4ee0-8d15-4c4acfa35f81@linux.dev>
Date: Mon, 2 Nov 2026 09:28:53 +0800
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
Subject: Re: [PATCH v2 2/3] cgroup/cpuset: Recompute effective cpumask in
 update_cpumasks_hier() after calling update_parent_effective_cpumask()
To: Waiman Long <longman@redhat.com>, Ridong Chen <ridong.chen@linux.dev>,
 Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>,
 =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>,
 Shuah Khan <shuah@kernel.org>
Cc: cgroups@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20261030190701.78308-1-longman@redhat.com>
 <20261030190701.78308-3-longman@redhat.com>
Content-Language: en-US
From: Guopeng Zhang <guopeng.zhang@linux.dev>
In-Reply-To: <20261030190701.78308-3-longman@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



在 2026/10/31 03:07, Waiman Long 写道:
> It is reported by sashiko that calling update_parent_effective_cpumask()
> may clobber tmp->new_cpus when update_sibling_cpumasks() needs to be
> called due to possible change in the parent's effective_cpus value.
> Therefore the new effective cpumask has to be recomputed after calling
> update_parent_effective_cpumask() to get a correct value back into
> tmp->new_cpus.
> 
> Fixes: f0af1bfc27b5 ("cgroup/cpuset: Relax constraints to partition & cpus changes")
> Signed-off-by: Waiman Long <longman@redhat.com>
> ---
>  kernel/cgroup/cpuset.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
> index 39c81a0a8ab9..ed014ecb770c 100644
> --- a/kernel/cgroup/cpuset.c
> +++ b/kernel/cgroup/cpuset.c
> @@ -2359,12 +2359,12 @@ static void update_cpumasks_hier(struct cpuset *cs, struct tmpmasks *tmp,
>  			update_parent_effective_cpumask(cp, partcmd_update, NULL, tmp);
>  			/*
>  			 * Capture current partition_root_state as it may have
> -			 * changed. Recompute effective cpumask if changed.
> +			 * changed. Always recompute effective cpumask as tmp->new_cpus
> +			 * may be clobbered when update_sibling_cpumasks() is called
> +			 * within update_parent_effective_cpumask().
>  			 */
>  			new_prs = cp->partition_root_state;
> -			if (new_prs != old_prs) {
> -				compute_effective_cpumask(tmp->new_cpus, cp, parent);
> -			}
> +			compute_effective_cpumask(tmp->new_cpus, cp, parent);
>  		}
>  
>  		spin_lock_irq(&callback_lock);

Reviewed-by: Guopeng Zhang <zhangguopeng@kylinos.cn>
Tested-by: Guopeng Zhang <zhangguopeng@kylinos.cn>

Thanks,
Guopeng
