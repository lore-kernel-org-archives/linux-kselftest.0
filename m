Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794798428;
	b=5tLv7CDEoNFj+kZXfoFPU+l55G3hvRZEepHxYs0naY0nglPlDFFEmwUPCQceL+eixckt
	 xzkfu+kbMOBfYY+1jH6+12SDENajA6WGyowUisdGBfi3Dypt4QeY/914I8fCCA1jKXAlA
	 eRjN05r0PY6ZjKqZjC9PTVXInLAPzyfop7219ey5OE/tVMEVE+ctzm1zGrwtQnXKuP9RN
	 vx8FXd5SxnTTdekMDipux9nexxRRCjAVLANPSjA6+6jHTBa8pU5DmGe94AIcx5lYHz/pr
	 e0PS7ZbHLDTYZVVACP/qG3VO2tmBC4a8+zSkiPQ9yPS0BBmrEOHMl7aMsyR7Ft1UPIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794798428;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Y9wzxTwuaBlsxv0M8Fe9dZNWrfzANIugrMSpINJ6qSc=;
	b=uw9/qRag9Tb+72XpV/2U0a9Kn0TwgSVP/41nLdgtqItVrZ70NCzs3Gnwt/xWvJF6s4cm
	 oPXNtN+IiEVe2qqLCxtlb3LiVS+yYPgbPFluYpOElCduMQJ6r+u65SFQwVOuLEB85ba2x
	 R0Ac8SlFxlmyT/kEKHA1urs6cC0tVCLs596Rg2OUAktFSX4dQk2l3QoRHMduzmLUTRI/o
	 u1gDO3klTb4R0ym7VttAC9zcdI9gckAD5elqq44oIULxjn1os83ImAdxEddsJouHpnS7J
	 /LyfIj5VDD8IaXNuyh7bW6g5K/7gNTL0K3KWt9TDTUsxwflNKjDkg3jNBG61nURPA2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=GEDaf60d;
	arc=none smtp.remote-ip=95.215.58.131
Received: from mta1.migadu.com (out-131.mta1.migadu.com [95.215.58.131])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92B7B606A32C
	for <linux-kselftest@vger.kernel.org>; Mon, 16 Nov 2026 03:07:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92B7B606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=GEDaf60d
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=/rjgHBG/W0eYGQT3V27ww5iUxmmbAK9UEcQ5HkwVUaQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794798425; v=1; x=1795403225;
 b=GEDaf60dzd36dysT+qpIuQhesLyQCW7NpzqxgH9ZkJNYKllqojHVtY7eK+UOC0Avauf/DAyQ
 5G1buQ7P4zutPN7oCbMPGkcBkD7FOisVNuss7SxT7edDCmOYxLHpWwVa9XBnzkZOwZay1hwovSr
 88xEf3OkycrYBGyM1hpU7mPg=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id a32aaf1645e8d52f;
	Mon, 16 Nov 2026 03:07:05 +0000
X-Mizu-Trace-ID: a32aaf1645e8d52f
X-Migadu-Flow: FLOW_OUT
Message-ID: <e437ac79-7999-43da-9fe8-6cfd475a5196@linux.dev>
Date: Mon, 16 Nov 2026 11:07:00 +0800
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
Subject: Re: [PATCH-next v4 2/6] cgroup/cpuset: excpus parameter of
 remote_cpus_update() must have at least 1 active CPU
To: Waiman Long <longman@redhat.com>, Tejun Heo <tj@kernel.org>,
 Johannes Weiner <hannes@cmpxchg.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?=
 <mkoutny@suse.com>, Shuah Khan <shuah@kernel.org>
Cc: cgroups@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, Guopeng Zhang <guopeng.zhang@linux.dev>,
 Sashiko <sashiko-bot@kernel.org>
References: <20261116012330.2271010-1-longman@redhat.com>
 <20261116012330.2271010-3-longman@redhat.com>
From: Ridong Chen <ridong.chen@linux.dev>
In-Reply-To: <20261116012330.2271010-3-longman@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/16/2026 9:23 AM, Waiman Long wrote:
> It is reported that remote_cpus_update() fails to invalidate a
> populated remote partition when an ancestor cgroup update reduces its
> effective_xcpus mask to only offline CPUs.
> 
> When update_cpumasks_hier() updates a descendant remote partition, it
> passes the new effective_xcpus mask (excpus) to remote_cpus_update().
> Because excpus still contains offline CPUs, cpumask_empty(excpus) is false
> and remote_cpus_update() only checks tasks_nocpu_error() when adding CPUs.
> 
> With the partition left valid, update_cpumasks_hier() computes an empty
> effective_cpus mask and jumps to get_css. The populated partition stays
> valid with no effective CPUs instead of inheriting its parent's CPUs,
> and its tasks remain affine to the online CPUs returned to top_cpuset.
> 
> Fix it by invalidating the remote partition if there is no active CPU
> available in the given excpus parameter.
> 
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Link: https://sashiko.dev/#/bug/linux-936b7155-f652-4146-a4ab-ec48fd392a1d
> Signed-off-by: Waiman Long <longman@redhat.com>
> ---
>   kernel/cgroup/cpuset.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
> index 631fb449cef8..195d4e3a283c 100644
> --- a/kernel/cgroup/cpuset.c
> +++ b/kernel/cgroup/cpuset.c
> @@ -1810,7 +1810,8 @@ static void remote_cpus_update(struct cpuset *cs, struct cpumask *xcpus,
>   
>   	WARN_ON_ONCE(!cpumask_subset(cs->effective_xcpus, subpartitions_cpus));
>   
> -	if (cpumask_empty(excpus)) {
> +	/* New effective_xcpus must have at least one active CPU */
> +	if (!cpumask_intersects(excpus, cpu_active_mask)) {
>   		WRITE_ONCE(cs->prs_err, PERR_CPUSEMPTY);
>   		goto invalidate;
>   	}

This also invalidates a remote partition with no task whose excpus
only has offline CPUs. According to cgroup-v2.rst, such a partition
is valid: cpuset.cpus.exclusive.effective may contain offline CPUs,
and cpuset.cpus.effective can be empty if there is no task in the
partition. The hotplug path and tasks_nocpu_error() follow the same
rule. How about only invalidating it when it is populated?

	  if (cpumask_empty(excpus) ||
		  (!cpumask_intersects(excpus, cpu_active_mask) &&
		   partition_is_populated(cs, NULL))) {
		
Also, it probably needs a Fixes tag, maybe:

Fixes: f62a5d39368e ("cgroup/cpuset: Remove remote_partition_check() & make 
update_cpumasks_hier() handle remote partition")
-- 
Best regards
Ridong

