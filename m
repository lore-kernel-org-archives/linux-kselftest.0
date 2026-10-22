Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792675523;
	b=pDWOd1L+niXgRdVnDXPyNgMNfASU/EfEtddNrMKuu0n4fdfc4aIENZwHV1NVH/QUKn6L
	 34902J5ScvsBWY/Uy3m1X4rPoUPiJ2RJI8EpxsdvGWiZFFRpPsQj7F29r7K24r9O9qSk/
	 gQu7IBomyHnMJEf4DRicf+kjn/z2mpRFbFEcTlBgLWD82kIaD7AYBrBlDw7YwEXjavnsM
	 8cKnPqpfliI1ba/o/N6lQ99teYbFh7bQnM7mzrQD5rsGRPphP4fGXKMlejrtxmeOAzlwc
	 msLquZ8tdEHjpUgqqqYh/oZJCJgc4b42pC6MIOZHLeKfUJVo/uDlllHPbQv07NCK27Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792675523;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=WLw0FxymoDZWDnAnahD4EE413i9SFzx6SNYgZ//FHvM=;
	b=gkFveV9LSeiRF9Gj7q/LFOmMPtk/FBOGvGWMvrgDNwm5JeQsyQEB2/jR9OPaaemVX3vc
	 Bsfjq02vVTxfpMBCFzyRFjAdUdwaYv7BNNsGwiFD4NpTl1RHgYxCaVcWMWMmtX2jeUxHh
	 wyW6dU6wZu6WhOJVztqV7OPt+K1krv2GullAWTN+cYSf5bXfDU0PC6xWq57amdwtSIrAh
	 /tMr5GQjC4plFPqsgfgSsB2b+OU8BbG8AMFZkYIWrkooWX16EjGmEsipEkpGnnMiLRUWv
	 rvQrmi6xUBUOvWiWvjrDgjhe6GWJXO0SOO6Ev+KvkDlq6Rp5d0kzbhjCfpJJiHZmphQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=jdNf1IPV;
	arc=none smtp.remote-ip=91.218.175.7
Received: from mta0.migadu.com (out-7.mta0.migadu.com [91.218.175.7])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AB0E606A319
	for <linux-kselftest@vger.kernel.org>; Thu, 22 Oct 2026 13:25:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1AB0E606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=jdNf1IPV
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=dEUuMsEDkPcNR0+ybxJkBscqRakXtKiVLQf65lFh56o=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792675512; v=1; x=1793280312;
 b=jdNf1IPVQ7Wm0itd5AAkz25Kn6shp0LCWiEGEYJlFYXpwJBcQ2nztbzvoC7285qtui2NT1EN
 eAYedKvcLhACE1E8cVrZFWbwr28ThvJkXaArD8PuRgiCvTaekn/hXwfrSj+vDQ160tOgu28bmU3
 8TZUAH6Y3Or01JbVBzEhx7PU=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id d436972b123e7eba;
	Thu, 22 Oct 2026 13:25:11 +0000
X-Mizu-Trace-ID: d436972b123e7eba
X-Migadu-Flow: FLOW_OUT
Message-ID: <f22f4cdf-eebe-437a-8b3a-5f98aa0df5a8@linux.dev>
Date: Thu, 22 Oct 2026 21:25:06 +0800
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
Subject: Re: [PATCH-next 1/6] cgroup/cpuset: Find furthest isolated ancestor
 for invalidated isolated partition
To: Waiman Long <longman@redhat.com>, Ridong Chen <ridong.chen@linux.dev>,
 Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>,
 =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>,
 Shuah Khan <shuah@kernel.org>
Cc: cgroups@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20261022031643.1351877-1-longman@redhat.com>
 <20261022031643.1351877-2-longman@redhat.com>
Content-Language: en-US
From: Guopeng Zhang <guopeng.zhang@linux.dev>
In-Reply-To: <20261022031643.1351877-2-longman@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



在 2026/10/22 11:16, Waiman Long 写道:
> Commit 46b885416c27 ("cgroup/cpuset: Fix a missing isolated_cpus
> update in update_cpumasks_hier()") searches for the closet partition
> root ancestor to determine if the isolated CPUs in a to be invalidated
> isolation partition should be removed from isolated_cpus or not.
> 
> As reported by sashiko, this method may not work when there is a deeply
> nested isolated partition hierarchy. For instance, Consider a nested
> hierarchy A0 -> A1 -> A2 -> A3 where all four are PRS_ISOLATED:
> 
>   A0: effective_xcpus = 0-4
>   A1: effective_xcpus = 1-4
>   A2: effective_xcpus = 2-4
>   A3: effective_xcpus = 3-4
> 
> When A1 shrinks its exclusive_cpus from 1-4 to 1-2, A2 will update it
> effective_xcpus to 2. A3 will find its closet partition root ancestor
> A2 and decides that its effective_xcpus 3-4 should be removed from
> isolated_cpus which is incorrect.
> 
> Address this corner case by searching for the furthest isolated partition
> root ancestor instead to decide if its isolated CPUs should be returned
> to isolated_cpus.
> 

This looks good to me. Would it be worth adding a test case for the
scenario described above, something like:

    # A middle isolated parent shrunk below coverage: the released
    # CPUs of the invalidated child stay isolated as a higher
    # ancestor still covers them.
    " CX0-4:P2 CX2-4:P2 CX3-4:P2 .      .      X2     .      .     0 A1:0-1,3-4|A2:2|A3:2 A1:P2|A2:P2|A3:P-2 0-4"

Reviewed-by: Guopeng Zhang <zhangguopeng@kylinos.cn>
Tested-by: Guopeng Zhang <zhangguopeng@kylinos.cn>

Thanks,
Guopeng

> Fixes: 46b885416c27 ("cgroup/cpuset: Fix a missing isolated_cpus update in update_cpumasks_hier()")
> Signed-off-by: Waiman Long <longman@redhat.com>
> ---
>  kernel/cgroup/cpuset.c | 36 +++++++++++++++++-------------------
>  1 file changed, 17 insertions(+), 19 deletions(-)
> 
> diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
> index 585a982249ad..7ead8c3b7974 100644
> --- a/kernel/cgroup/cpuset.c
> +++ b/kernel/cgroup/cpuset.c
> @@ -2156,22 +2156,20 @@ static void compute_partition_effective_cpumask(struct cpuset *cs,
>  }
>  
>  /*
> - * ancestor_partition - Find and return the closest valid partition root ancestor
> + * iancestor_partition - Return furthest isolated partition root ancestor available
>   * @cs: the current cpuset
> - *
> - * Return: The closet partition root ancestor cpuset
> + * Return: The furthest isolated partition root ancestor available or NULL if
> + *	   not found.
>   */
> -static struct cpuset *ancestor_partition(struct cpuset *cs)
> +static struct cpuset *iancestor_partition(struct cpuset *cs)
>  {
>  	struct cpuset *ancestor = parent_cs(cs);
> +	struct cpuset *iancestor = NULL;
>  
> -	/*
> -	 * The top_cpuset is always a valid partition root which will stop
> -	 * the loop if it is reached.
> -	 */
> -	while (!is_partition_valid(ancestor))
> -		ancestor = parent_cs(ancestor);
> -	return ancestor;
> +	for (; ancestor; ancestor = parent_cs(ancestor))
> +		if (ancestor->partition_root_state == PRS_ISOLATED)
> +			iancestor = ancestor;
> +	return iancestor;
>  }
>  
>  /*
> @@ -2283,23 +2281,23 @@ static void update_cpumasks_hier(struct cpuset *cs, struct tmpmasks *tmp,
>  				 * For a to be invalidated isolated partition,
>  				 * its isolated CPUs may or may not need to be
>  				 * removed from isolated_cpus depending on if
> -				 * its closest partition root ancestor is a root
> -				 * or isolated partition. With a PRS_ISOLATED
> -				 * ancestor, the CPUs are checked against its
> -				 * effective xcpus to see if any of them needed
> -				 * to be removed.
> +				 * there is a furthest isolated partition root
> +				 * ancestor available. When such a PRS_ISOLATED
> +				 * ancestor is available, the CPUs are checked
> +				 * against its effective xcpus to see if any of
> +				 * them needed to be removed.
>  				 */
>  				if (is_partition_valid(cp))
>  					new_prs = -old_prs;
>  
>  				if (old_prs == PRS_ISOLATED) {
> -					struct cpuset *ancestor = ancestor_partition(cp);
> +					struct cpuset *iancestor = iancestor_partition(cp);
>  
> -					if (ancestor->partition_root_state == PRS_ROOT)
> +					if (!iancestor)
>  						del_cpus = cp->effective_xcpus;
>  					else if (cpumask_andnot(tmp->delmask,
>  								cp->effective_xcpus,
> -								ancestor->effective_xcpus))
> +								iancestor->effective_xcpus))
>  						del_cpus = tmp->delmask;
>  
>  					if (del_cpus) {

