Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.38
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792736678;
	b=gsSn27G6EwaJwzi3VuLBhiH3ewuN3njB/CIntQ2DHokc+d3ik7EVGvOlcCE8CIy1YKPd
	 V9cjCatP2HY8NeJ9yaW0QCnVTaSg4NhIcfZ9tDobhte7F6Zwu6Gk0r6pDRoLFmA5vIiZH
	 H9ffNX1ZlmlTc8AGtzjX++ntDArBVNkKANm4/J3Bl7NTvIkAirCIS5aEWqixTfm1tUi+k
	 JFfDDb1ko17lehXSf9fHus7Dk+4uQe5YTs8en2jNuctyIwe3bgbViO5gqa3VJi/fyusbM
	 Kh8aaYA0xJxsNmnzjYK9+PJnowqn518+qzwMs8j/T3OcXzB/olo5Fl1ohnap70IiHMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792736678;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=y0NcD85P4YuQlHetNwNJI+QSXD/4mVy6NLxkpgdSMcU=;
	b=GV78AlmdlnXKg1xy9+hHOjg3oQes56waQKI7kG/n0gkRbGAiJIZmaOx1lzDM+S24B90m
	 E7N4jN1PikrGWayvKqX+V5vK29UMdYxHzFVR/YFTIrJiGu618IqcCrW77ik+Znr3Kxf8v
	 vpmkS8b97F3gfvK4a6etWj9nngV24+HhOS29F1qWp2tdfpivuk8KMwAHvnAS4CisOk86J
	 xT/KScWV6lHXphQNMQ+5XA11ScKnDB5cugoR3GAIXnrumqvMqWtj6PigkzlY8IQNW1ky6
	 2NtelY8J49BPYZ6WTPORg7G8ykx6OC1n/Q84c7Dgb148U9jgbmiX0LfA+PVs3Rvc+zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=MbX5RvbZ;
	arc=none smtp.remote-ip=95.215.58.38
Received: from mta1.migadu.com (out-38.mta1.migadu.com [95.215.58.38])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0801606A31A
	for <linux-kselftest@vger.kernel.org>; Fri, 23 Oct 2026 06:24:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0801606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=MbX5RvbZ
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=DuMewOc/Oc4cYh9XSaYEomynuxuFlTvkkFfrgqfljXE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792736674; v=1; x=1793341474;
 b=MbX5RvbZvj7SqIl9hlCrW9lmY2C1kM1yiYB8EkrRhVo1VGkT+z7ln9V3nqqGKwH1ZAlo62j8
 my3w1E5yDmdXC7CXznyzBXUbn7L12BylFUWGd/1OttAjDJsTfrlj7Rc15HuVsEboukTi50P4XXT
 +Mqpt3Bn7W2xeSSVLQ2dNJbU=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id bd516687889a695d;
	Fri, 23 Oct 2026 06:24:34 +0000
X-Mizu-Trace-ID: bd516687889a695d
X-Migadu-Flow: FLOW_OUT
Message-ID: <c0a4470f-ef81-47a2-9d4b-a28a7fe1a529@linux.dev>
Date: Fri, 23 Oct 2026 14:24:28 +0800
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
To: Waiman Long <longman@redhat.com>, Tejun Heo <tj@kernel.org>,
 Johannes Weiner <hannes@cmpxchg.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?=
 <mkoutny@suse.com>, Shuah Khan <shuah@kernel.org>
Cc: cgroups@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, Guopeng Zhang <guopeng.zhang@linux.dev>
References: <20261022031643.1351877-1-longman@redhat.com>
 <20261022031643.1351877-2-longman@redhat.com>
From: Ridong Chen <ridong.chen@linux.dev>
In-Reply-To: <20261022031643.1351877-2-longman@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/22/2026 11:16 AM, Waiman Long wrote:
> Commit 46b885416c27 ("cgroup/cpuset: Fix a missing isolated_cpus
> update in update_cpumasks_hier()") searches for the closet partition
> root ancestor to determine if the isolated CPUs in a to be invalidated
> isolation partition should be removed from isolated_cpus or not.
> 
> As reported by sashiko, this method may not work when there is a deeply
> nested isolated partition hierarchy. For instance, Consider a nested
> hierarchy A0 -> A1 -> A2 -> A3 where all four are PRS_ISOLATED:
> 
>    A0: effective_xcpus = 0-4
>    A1: effective_xcpus = 1-4
>    A2: effective_xcpus = 2-4
>    A3: effective_xcpus = 3-4
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
> Fixes: 46b885416c27 ("cgroup/cpuset: Fix a missing isolated_cpus update in update_cpumasks_hier()")
> Signed-off-by: Waiman Long <longman@redhat.com>
> ---
>   kernel/cgroup/cpuset.c | 36 +++++++++++++++++-------------------
>   1 file changed, 17 insertions(+), 19 deletions(-)
> 
> diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
> index 585a982249ad..7ead8c3b7974 100644
> --- a/kernel/cgroup/cpuset.c
> +++ b/kernel/cgroup/cpuset.c
> @@ -2156,22 +2156,20 @@ static void compute_partition_effective_cpumask(struct cpuset *cs,
>   }
>   
>   /*
> - * ancestor_partition - Find and return the closest valid partition root ancestor
> + * iancestor_partition - Return furthest isolated partition root ancestor available
>    * @cs: the current cpuset
> - *
> - * Return: The closet partition root ancestor cpuset
> + * Return: The furthest isolated partition root ancestor available or NULL if
> + *	   not found.
>    */
> -static struct cpuset *ancestor_partition(struct cpuset *cs)
> +static struct cpuset *iancestor_partition(struct cpuset *cs)

Nit.

iancestor is confusing.
Can we renmae it furthest_isolated_ancestor?

>   {
>   	struct cpuset *ancestor = parent_cs(cs);
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
>   }
>   
>   /*
> @@ -2283,23 +2281,23 @@ static void update_cpumasks_hier(struct cpuset *cs, struct tmpmasks *tmp,
>   				 * For a to be invalidated isolated partition,
>   				 * its isolated CPUs may or may not need to be
>   				 * removed from isolated_cpus depending on if
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
>   				 */
>   				if (is_partition_valid(cp))
>   					new_prs = -old_prs;
>   
>   				if (old_prs == PRS_ISOLATED) {
> -					struct cpuset *ancestor = ancestor_partition(cp);
> +					struct cpuset *iancestor = iancestor_partition(cp);
>   
> -					if (ancestor->partition_root_state == PRS_ROOT)
> +					if (!iancestor)
>   						del_cpus = cp->effective_xcpus;
>   					else if (cpumask_andnot(tmp->delmask,
>   								cp->effective_xcpus,
> -								ancestor->effective_xcpus))
> +								iancestor->effective_xcpus))
>   						del_cpus = tmp->delmask;
>   
>   					if (del_cpus) {

Reviewed-by: Ridong Chen <ridong.chen@linux.dev>
Thanks.

-- 
Best regards
Ridong

