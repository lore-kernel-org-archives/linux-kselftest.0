Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.78
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793799974;
	b=KWxm+24WNHc5YVkscTSYJqXI1vR5vAQxGvFdd/S3KADorZOU8dEQrCJ3sFmKnqF67ewX
	 FJ0vIus0TgJia8d4zGg1rdMaXeSw+5g0EqYRFJ3D+zvieEBKrKvNv3jQF4KezPq9OF6cU
	 h01Sr1vI2zIs3zOwZ6gaqA3Nb3/J1oXbUpW7HxxnMXPB6k7WpbOrMfoKy7xhvWR1L+71/
	 FIEQPPjxQcCDtK3L40nTFpu346XGyIMfBOmvKa4osRxQMvBflSNrgfgdRvjlm9NZLu/vk
	 p1B0sgnBbXXM14QlIfu+9k1q0fPcb4aaQP/sy3MOLrNzmA6pQQesjXtgF2T2g4EOq8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793799974;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=Q4tWgwLTiI8SPma50NL+69gW2A8l1tsl3NgQNJG9OZI=;
	b=XUDgQJEtcSdDFrNG6TAmAs0IuNUrJ81ZMK7GumUo7xxbISHfgB/ltIqIm5wjE7rCaHEV
	 CoZCgsCemsjPZ8/wGMvtEruYZ/9P0W09DoN16ykwyk6kg6OqosWf2o2ABEgzqRvVky1QC
	 aOdJYFWyq+kKXHF2JS6YEz1VAjNIG3uedI+Ifkn6/jNUlWKo78kuaNN510lb77wybq6cV
	 /bKTziukFnufwinpNG7nH51N12EVFw8umFkbcIwQE7oAPNcm6D/h/wqhuffflR0bOKGoQ
	 uIJik9ab5hWyodQW/qPguXqNzMeXSvGUp8ipmw9VzP1D9AUIF+NgtyLGBjFcLIwYxvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=D7zAy89x;
	arc=none smtp.remote-ip=95.215.58.78
Received: from mta1.migadu.com (out-78.mta1.migadu.com [95.215.58.78])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44895606A31B
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Nov 2026 13:46:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44895606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=D7zAy89x
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=r1v3gaHbye2LaSteE/Y0pgAbJSvJ3a9oWoFvgk1atq8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793799969; v=1; x=1794404769;
 b=D7zAy89xQ+cQiauu/mlV4T0WBr50R4C4ILX9ymomytcDXFkiBS4UVvNG7y1R25caNGhAhmeR
 nqvK3Uq9pIWOKykMLxCpvdOgF2uyeMAfZAdlhprcdqnxbcIxeS9Msnjh0oTCFSIyitXGmzaQjhx
 aOVNqreRnnYm4RYROF6+qGPI=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 9497cdf413eb9ab1;
	Wed, 04 Nov 2026 13:46:09 +0000
X-Mizu-Trace-ID: 9497cdf413eb9ab1
X-Migadu-Flow: FLOW_OUT
Message-ID: <a8be8f5f-fb9c-46da-a1b6-eea68ae07006@linux.dev>
Date: Wed, 4 Nov 2026 21:46:03 +0800
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
Subject: Re: [PATCH] cgroup/cpuset: Fail if isolated CPUs don't leave any boot
 domain housekeeping CPU
To: Ridong Chen <ridong.chen@linux.dev>, longman@redhat.com
Cc: tj@kernel.org, hannes@cmpxchg.org, mkoutny@suse.com, shuah@kernel.org,
 cgroups@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, Guopeng Zhang <zhangguopeng@kylinos.cn>
References: <20261104071600.474587-1-guopeng.zhang@linux.dev>
 <cbe741a9-fd0c-4c8f-8591-55ecc70f222a@linux.dev>
Content-Language: en-US
From: Guopeng Zhang <guopeng.zhang@linux.dev>
In-Reply-To: <cbe741a9-fd0c-4c8f-8591-55ecc70f222a@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



在 2026/11/4 20:58, Ridong Chen 写道:
> 
> 
> On 11/4/2026 3:16 PM, Guopeng Zhang wrote:
>> From: Guopeng Zhang<zhangguopeng@kylinos.cn>
>>
>> With the "domain" flag of the isolcpus= boot option, the CPUs isolated
>> at boot are excluded from the sched domains and the remaining CPUs
>> become the boot domain housekeeping CPUs. An isolated partition is
>> allowed to use the boot isolated CPUs, but it must not take over all
>> the boot domain housekeeping CPUs.
>>
>> prstate_housekeeping_conflict() checks that rule for root partitions
>> only. The 2nd check covers the nohz_full case as it is gated by
>> housekeeping_enabled(HK_TYPE_KERNEL_NOISE) which is not enabled by
>> isolcpus=domain. So on an isolcpus=domain,<cpus> boot, an isolated
>> partition can claim all the remaining boot domain housekeeping CPUs.
>> The state is committed, but the sched domain rebuild at the end of
>> the write finds no housekeeping CPU left for the boot domain and
>> hits WARNs and an OOPS in partition_sched_domains().
>> housekeeping_update() cannot accept the configuration either as it
>> cannot empty the boot domain housekeeping mask.
>> With an "isolcpus=domain,10-31" boot where CPUs 0-9 are the boot
>> domain housekeeping CPUs, for example:
>>
>>    # echo 0-9 > A/cpuset.cpus
>>    # echo isolated > A/cpuset.cpus.partition
>>    WARNING: kernel/sched/topology.c:3089 at build_sched_domains+...
>>    WARNING: kernel/cgroup/cpuset.c:1478 at cpuset_update_sd_hk_unlock+...
>>    RIP: 0010:partition_sched_domains+0x3b8
>>
>> Fix that by extending prstate_housekeeping_conflict() to reject an
>> isolated partition update that would leave no active boot domain
>> housekeeping CPU outside the isolated CPUs. The CPUs released back
>> to the boot domain by the same update are taken into account, so
>> replacing one of the last housekeeping CPUs with another one in a
>> single update remains allowed. The new check is only performed when
>> housekeeping_enabled(HK_TYPE_KERNEL_NOISE) is disabled so that the
>> existing nohz_full behavior is unchanged.
>>
>> Add test cases in test_cpuset_prs.sh to verify that taking over all
>> the boot domain housekeeping CPUs is rejected while swapping one of
>> them with another one is allowed.
> 
> Hi Guopeng,
> 

Hi Ridong,

Thanks a lot for the analysis and the patch. 

> Thanks for the report and the reproducer. I can reproduce the WARN and
> the OOPS in partition_sched_domains() here.
> 
> However, I don't think prstate_housekeeping_conflict() is the right
> place to fix it, and the fix doesn't seem complete. The same problem
> can be triggered with a root partition, which this patch doesn't cover.
> With an "isolcpus=domain,4-7" boot on an 8-CPU VM:
> 
>   # echo 0-3 > A/cpuset.cpus
>   # echo root > A/cpuset.cpus.partition
>   WARNING: kernel/sched/topology.c:3111 at build_sched_domains+0x2b96/0x5500
>   Oops: general protection fault, ... [#1] SMP KASAN NOPTI
>   RIP: 0010:partition_sched_domains+0x10a3/0x1a10
> 

You are right. The sashiko review also reported this issue. I can
reproduce the WARN and the OOPS here as well.

> The faulting address is in build_perf_domains(), where cpumask_first()
> on the empty cpu_map returns nr_cpu_ids and cpu_rq() goes out of
> bounds.
> 
> The root cause looks like it isn't a housekeeping conflict. Boot time
> isolated CPUs stay in top_cpuset.effective_cpus by design, and they are
> only filtered out of the top_cpuset sched domain in
> generate_sched_domains(). But the checks that make sure the parent
> still has CPUs left, i.e. tasks_nocpu_error() for local partitions and
> the cpumask_subset(top_cpuset.effective_cpus, ...) checks in
> remote_partition_enable()/remote_cpus_update(), only look at
> top_cpuset.effective_cpus. So any partition, root or isolated, local
> or remote, can take away all the boot domain housekeeping CPUs as long
> as some boot isolated CPUs are still left in top_cpuset, which leaves
> the top_cpuset sched domain empty.
> 
> So I think the check should be done at the "parent has no CPU left"
> level instead. Something like the diff below. It is not tested yet;
> could you give it a try with your reproducer and the test cases?
> Note that the root partition and remote partition cases should be
> added to the selftest as well.
> 

That's a great idea, thanks for your guidance. I will test it and add
the relevant test cases.

Best regards,
Guopeng

> Without isolcpus=domain, HK_TYPE_DOMAIN_BOOT is cpu_possible_mask and
> the new check is equivalent to the existing one, so no extra
> housekeeping_enabled() gating is needed.
> 
> ---
> diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
> index 3219f927c35e..fb3e81405f5b 100644
> --- a/kernel/cgroup/cpuset.c
> +++ b/kernel/cgroup/cpuset.c
> @@ -1180,12 +1180,51 @@ static void update_partition_sd_lb(struct cpuset *cs, int old_prs)
>                 cpuset_force_rebuild();
>  }
> 
> +/*
> + * top_cpuset_sd_nocpu - Check if top_cpuset will have no sched domain CPU
> + * @add_cpus: CPUs to be taken away from top_cpuset
> + * @del_cpus: CPUs to be given back to top_cpuset, can be NULL
> + * Return: true if no active CPU will be left in the top_cpuset sched domain
> + *
> + * Boot time isolated CPUs stay in top_cpuset.effective_cpus, but they are
> + * excluded from the sched domain of top_cpuset in generate_sched_domains().
> + * So checking top_cpuset.effective_cpus alone is not enough to ensure that
> + * the top_cpuset sched domain won't become empty after @add_cpus are taken
> + * away from it. The sched domain of top_cpuset must keep at least one
> + * active boot domain housekeeping CPU.
> + */
> +static bool top_cpuset_sd_nocpu(const struct cpumask *add_cpus,
> +                               const struct cpumask *del_cpus)
> +{
> +       const struct cpumask *hk_mask = housekeeping_cpumask(HK_TYPE_DOMAIN_BOOT);
> +       int cpu;
> +
> +       for_each_cpu_and(cpu, hk_mask, cpu_active_mask) {
> +               if (cpumask_test_cpu(cpu, add_cpus))
> +                       continue;
> +               if (cpumask_test_cpu(cpu, top_cpuset.effective_cpus) ||
> +                   (del_cpus && cpumask_test_cpu(cpu, del_cpus)))
> +                       return false;
> +       }
> +       return true;
> +}
> +
>  /*
>   * tasks_nocpu_error - Return true if tasks will have no effective_cpus
>   */
>  static bool tasks_nocpu_error(struct cpuset *parent, struct cpuset *cs,
>                               struct cpumask *xcpus)
>  {
> +       /*
> +        * The top_cpuset always has tasks (kthreads at least), so its sched
> +        * domain can't be empty. The current effective_xcpus of a valid
> +        * partition will be given back to top_cpuset if not in @xcpus.
> +        */
> +       if ((parent == &top_cpuset) &&
> +           top_cpuset_sd_nocpu(xcpus, is_partition_valid(cs)
> +                                      ? cs->effective_xcpus : NULL))
> +               return true;
> +
>         /*
>          * A populated partition (cs or parent) can't have empty effective_cpus
>          */
> @@ -1724,7 +1763,7 @@ static int remote_partition_enable(struct cpuset *cs, int new_prs,
>          */
>         compute_excpus(cs, tmp->new_cpus);
>         if (!cpumask_intersects(tmp->new_cpus, cpu_active_mask) ||
> -           cpumask_subset(top_cpuset.effective_cpus, tmp->new_cpus))
> +           top_cpuset_sd_nocpu(tmp->new_cpus, NULL))
>                 return PERR_INVCPUS;
>         if (cpumask_intersects(tmp->new_cpus, subpartitions_cpus))
>                 return PERR_NOCPUS;
> @@ -1828,7 +1867,7 @@ static void remote_cpus_update(struct cpuset *cs, struct cpumask *xcpus,
>                 if (!capable(CAP_SYS_ADMIN))
>                         WRITE_ONCE(cs->prs_err, PERR_ACCESS);
>                 else if (cpumask_intersects(tmp->addmask, subpartitions_cpus) ||
> -                        cpumask_subset(top_cpuset.effective_cpus, tmp->addmask))
> +                        top_cpuset_sd_nocpu(tmp->addmask, tmp->delmask))
>                         WRITE_ONCE(cs->prs_err, PERR_NOCPUS);
>                 else if (prstate_housekeeping_conflict(prs, PRS_ROOT,
>                                                        excpus, tmp->delmask))
> 

