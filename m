Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.77
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792997870;
	b=YCNi5jYKrHNUXIfM6J7VEdYk6kWMZyVKDWlNR5c4tlJrWEpE0O+XMKvZ7UNjbXcmoMhM
	 XNv/cugxj4meL8xySo9mwb2IOPbZVunFyEuwsnb+Jd/7K2ZcdYY2WqeFS0V1eoD8U7MRZ
	 DIGALXcQfvW85MCvZo1q2X2lCNtKfxMvj6kOWLkWHmeAGkzqPDdovIt9PChyCjAtfgNcF
	 /ZAsGhyGFuuCtjI4M3fxYNOEebotbsBvtxYqPXGRlv2q8cYaTeXlGFRuFNaR0cRp9JQhZ
	 CKNv982pW+aHemkFa+A2tiSXBDDHr2qUFrJH3D1k98sOn9vJHfbq/esmkwMwvPAeYKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792997870;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=6MYmiyMNNxmPZVSn7NxOuJvdYE95KXrKDGSAkln0XZw=;
	b=y/fmm+ln53zlCW+7KXLEyRapXop4BOB/41w0jJgtc3Ewp1nSymlroaiCjRt4vJ5md8zg
	 efmPdxQ1bvdjRydhRntNpeJLVgoJeKVgesfcS45r5zC6S3NDUfeLLRBgT//Cfj0USjg/K
	 Mi5jl5OpZ4c7ZFUp/u4Mal0yywglcr9H9yNzqHyVVBEDjBvnViYyZcfsfw8mWLvRpwBN4
	 Og5i4PxafCbIwwkfFVP06h/zajIS+OxY+ug7cuckoa7pOFd5v33yoSCFc23AMgQQW2our
	 lq1tstwTzRx/j4/G4jl/2XjcxKgrdkaczggIWXq+1oSb0phM8BOuc2kuDCYDjxgkLqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=WA5qsQVF;
	arc=none smtp.remote-ip=91.218.175.77
Received: from mta0.migadu.com (out-77.mta0.migadu.com [91.218.175.77])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04C01606A31D
	for <linux-kselftest@vger.kernel.org>; Mon, 26 Oct 2026 06:57:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04C01606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=WA5qsQVF
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Omdv+WOtscuCJgDtzN1JU1Cup2BWNZGGk5v6wAlPMyM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792997867; v=1; x=1793602667;
 b=WA5qsQVF1vTp7ouS68Ajm6Oh/THN0pBPx1LzAod9AERXiIDkO9XXLjahCFTGRe3OwdxAWhyT
 e5BkDpk1QLyKJvCAjlLv31fPiBiCG/L0mbAvsCaj6TrGPGnzZzTlz1Ut/fygmpyA+QO5yWdyO+9
 6uiI+h+Nlk6dtmtk7Vblo+Tk=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 7f2be5f8bc58c681;
	Mon, 26 Oct 2026 06:57:46 +0000
X-Mizu-Trace-ID: 7f2be5f8bc58c681
X-Migadu-Flow: FLOW_OUT
Message-ID: <1961a890-0917-416c-9733-272d92a59d35@linux.dev>
Date: Mon, 26 Oct 2026 14:57:36 +0800
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
Subject: Re: [PATCH-next v3 04/11] cgroup/cpuset: Minor fixes to
 prstate_housekeeping_conflict()
To: Waiman Long <longman@redhat.com>, Ridong Chen <ridong.chen@linux.dev>,
 Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>,
 =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>,
 Shuah Khan <shuah@kernel.org>
Cc: cgroups@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20261025214449.310715-1-longman@redhat.com>
 <20261025214449.310715-5-longman@redhat.com>
Content-Language: en-US
From: Guopeng Zhang <guopeng.zhang@linux.dev>
In-Reply-To: <20261025214449.310715-5-longman@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



在 2026/10/26 05:44, Waiman Long 写道:
> Commit 9527ff78a413 ("cgroup/cpuset: Consider all the exclusive CPUs when
> doing housekeeping check") changes the way prstate_housekeeping_conflict()
> is being used by considering all the exclusive xcpus to be owned by the
> partition when doing housekeeping check. However there are two minor
> issues reported by sashiko with that patch:
> 
>  1) In partition_cpus_change(), prstate_housekeeping_conflict() can
>  be called with an invalid partition root. In that case, there are
>  no isolated CPUs that are going to be returned back to the system to
>  become housekeeping CPUs, so the calculation of the del_cpus cpumask
>  is meaningless.
> 
>  2) The checking of del_cpus in prstate_housekeeping_conflict() to see
>  if it can contain an active housekeeping CPU that can be returned to the
>  system ignores the fact that an active CPU not in HK_TYPE_DOMAIN_BOOT HK
>  cpumask will not become an active housekeeping CPU when it is released
>  by an isolated partition.
> 
> Update the existing code to handle these two issues properly to make
> prstate_housekeeping_conflict() produce more accurate result.
> 
> Fixes: 9527ff78a413 ("cgroup/cpuset: Consider all the exclusive CPUs when doing housekeeping check")
> Signed-off-by: Waiman Long <longman@redhat.com>
> ---
>  kernel/cgroup/cpuset.c | 45 +++++++++++++++++++++++++++++-------------
>  1 file changed, 31 insertions(+), 14 deletions(-)
> 
> diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
> index 37bc79d0c647..57e5334eb919 100644
> --- a/kernel/cgroup/cpuset.c
> +++ b/kernel/cgroup/cpuset.c
> @@ -1446,6 +1446,9 @@ static bool prstate_housekeeping_conflict(int new_prs, int parent_prs,
>  	    !cpumask_subset(new_cpus, housekeeping_cpumask(HK_TYPE_DOMAIN_BOOT)))
>  		return true;
>  
> +	if (del_cpus && cpumask_empty(del_cpus))
> +		del_cpus = NULL;
> +
>  	/*
>  	 * Exit 2nd check early and return false if
>  	 * 1) there is no boot time isolated nohz_full CPU
> @@ -1454,8 +1457,7 @@ static bool prstate_housekeeping_conflict(int new_prs, int parent_prs,
>  	 *    be returned back to the parent.
>  	 */
>  	if (!housekeeping_enabled(HK_TYPE_KERNEL_NOISE) ||
> -	    (new_prs == parent_prs) ||
> -	    ((new_prs == PRS_ROOT) && (!del_cpus || cpumask_empty(del_cpus))))
> +	    (new_prs == parent_prs) || (!del_cpus && (new_prs == PRS_ROOT)))
>  		return false;
>  
>  	/*
> @@ -1466,20 +1468,29 @@ static bool prstate_housekeeping_conflict(int new_prs, int parent_prs,
>  	if (parent_prs == PRS_ISOLATED)
>  		swap(new_cpus, del_cpus);
>  
> -	if (del_cpus &&
> -	   (cpumask_first_and_and(del_cpus, housekeeping_cpumask(HK_TYPE_KERNEL_NOISE),
> -				   cpu_active_mask) < nr_cpu_ids))
> -		return false;
> -
>  	if (!alloc_cpumask_var(&full_hk_cpus, GFP_KERNEL))
>  		return true;
>  
> +	/*
> +	 * Check if del_cpus may contain a CPU that can become an active
> +	 * housekeeping CPU again.
> +	 */
> +	if (del_cpus) {
> +		cpumask_and(full_hk_cpus, housekeeping_cpumask(HK_TYPE_KERNEL_NOISE),
> +			    housekeeping_cpumask(HK_TYPE_DOMAIN_BOOT));
> +		if (cpumask_first_and_and(del_cpus, full_hk_cpus,
> +					  cpu_active_mask) < nr_cpu_ids) {
> +			res = false;
> +			goto out;
> +		}
> +	}
> +
>  	cpumask_and(full_hk_cpus, housekeeping_cpumask(HK_TYPE_KERNEL_NOISE),
>  		    housekeeping_cpumask(HK_TYPE_DOMAIN));
>  	cpumask_andnot(full_hk_cpus, full_hk_cpus, isolated_cpus);
>  	cpumask_and(full_hk_cpus, full_hk_cpus, cpu_active_mask);
>  	res = !cpumask_weight_andnot(full_hk_cpus, new_cpus);
> -
> +out:
>  	free_cpumask_var(full_hk_cpus);
>  	return res;
>  }
> @@ -2486,23 +2497,29 @@ static void partition_cpus_change(struct cpuset *cs, struct cpuset *trialcs,
>  				  struct tmpmasks *tmp)
>  {
>  	enum prs_errcode prs_err;
> +	int parent_prs = is_remote_partition(cs)
> +		       ? PRS_ROOT : parent_cs(cs)->partition_root_state;
>  
>  	if (cs_is_member(cs))
>  		return;
>  
>  	prs_err = validate_partition(cs, trialcs);
> -	if (!prs_err && !cpumask_empty(trialcs->effective_xcpus)) {
> +	if (!prs_err && (parent_prs > 0) &&
> +	    !cpumask_empty(trialcs->effective_xcpus)) {
>  		int prs = cs->partition_root_state;
> -		int parent_prs = is_remote_partition(cs)
> -			       ? PRS_ROOT : parent_cs(cs)->partition_root_state;
> +
>  		/*
>  		 * Check for housekeeping conflict by passing the whole
>  		 * effective_xcpus as well as those CPUs that are to be
>  		 * removed from cs as delmask.
>  		 */
> -		cpumask_andnot(tmp->delmask, cs->effective_xcpus, trialcs->effective_xcpus);
> -		if (parent_prs > 0 &&
> -		    prstate_housekeeping_conflict(prs, parent_prs,
> +		if (prs > 0)
> +			cpumask_andnot(tmp->delmask, cs->effective_xcpus,
> +				       trialcs->effective_xcpus);
> +		else
> +			cpumask_clear(tmp->delmask);
> +
> +		if (prstate_housekeeping_conflict(prs, parent_prs,
>  						  trialcs->effective_xcpus, tmp->delmask))
>  			prs_err = PERR_HKEEPING;
>  	}

Reviewed-by: Guopeng Zhang <zhangguopeng@kylinos.cn>

Thanks,
Guopeng
