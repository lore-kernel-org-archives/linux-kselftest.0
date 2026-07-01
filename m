Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D23DA125AA
	for <linux-kselftest@vger.kernel.org>; Wed,  1 Jul 2026 01:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782868782; cv=none; b=Jf31VdT9C87+qwGBvhiTJedoqx9QMCk997xvqXJbFrJA+bpnMQy3bviUdMX3qzgv+qM4l4u1qROLX7JJFccGEDmXbNHQNg64R1GS4os/dy4loc2lL7fEsIDR0Hv8f2Ffs0GzWKm1xc6VUrLjukl5xircz3FpaPG1lZsm61mXdmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782868782; c=relaxed/simple;
	bh=W1bWpj+RMbOGf+7d4x1OMI6JvzMSGe7yfBpPQdoXE8Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=afpSL8oOK+2PMjFMGKYexIVtDoZk2W5bK410tRz3IQiI9HTym2EfJ0cTb6byhznFDMMV8P6fabo/SzAbN0UtcCL99yCNVqNJ5AEWxoThNrZsdphtoaPOAm2Hitr9Z3ji6IVY6UYkKG4XyDys4qI3+gm2Nf6xX7F+QwmmAmqDOr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=SP2i7GV3; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="SP2i7GV3"
Message-ID: <12864df2-f907-4971-8c8a-dde55723ef84@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782868776;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fc4QRqqQl58r08u5WVjzg9H56/Sf/FkhuFOyq+QQcmk=;
	b=SP2i7GV3nntPnW15PeJcdyxvfIxIhc49hYulxGqR8uALsjlXgPLsTL9tqi27/A95ZyMCH+
	9/WUERGOR4c+bLMOsi4RW8jivtUENR+pQlys8Fc1FLfx47vgzdPQZlUnO+TL67Nab7p9ms
	41GqMutHScsGZxd+YVoRigWN5slkF0o=
Date: Wed, 1 Jul 2026 09:19:29 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH-next v9 01/11] cgroup/cpuset: Make nr_deadline_tasks an
 atomic_t
To: Waiman Long <longman@redhat.com>, Tejun Heo <tj@kernel.org>,
 Johannes Weiner <hannes@cmpxchg.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?=
 <mkoutny@suse.com>, Shuah Khan <shuah@kernel.org>,
 Juri Lelli <juri.lelli@redhat.com>
Cc: cgroups@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, Aaron Tomlin <atomlin@atomlin.com>,
 Guopeng Zhang <guopeng.zhang@linux.dev>
References: <20260630033344.352702-1-longman@redhat.com>
 <20260630033344.352702-2-longman@redhat.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ridong Chen <ridong.chen@linux.dev>
In-Reply-To: <20260630033344.352702-2-longman@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT



On 6/30/2026 11:33 AM, Waiman Long wrote:
> The nr_deadline_tasks variable in the cpuset structure was introduced by
> commit 6c24849f5515 ("sched/cpuset: Keep track of SCHED_DEADLINE task
> in cpusets"). It is reported by sashiko [1] that nr_deadline_tasks
> can currently be modified by inc_dl_tasks_cs() under rq->lock and
> by cpuset_attach() under cpuset_mutex. So if both updates happen
> simultaneously, the nr_deadline_tasks variable can be corrupted leading
> to incorrect operations down the road.
> 
> Fix that by changing its type to atomic_t so that nr_deadline_tasks are
> always atomically updated.
> 
> [1] https://sashiko.dev/#/patchset/20260626181923.133658-1-longman%40redhat.comk
> 

Nit.

The link you provided has an extra 'k' at the end. Please remove it.

https://sashiko.dev/#/patchset/20260626181923.133658-1-longman%40redhat.com

> Fixes: 6c24849f5515 ("sched/cpuset: Keep track of SCHED_DEADLINE task in cpusets")
> Signed-off-by: Waiman Long <longman@redhat.com>
> ---
>   kernel/cgroup/cpuset-internal.h |  2 +-
>   kernel/cgroup/cpuset.c          | 10 +++++-----
>   2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/kernel/cgroup/cpuset-internal.h b/kernel/cgroup/cpuset-internal.h
> index f7aaf01f7cd5..140700e5e236 100644
> --- a/kernel/cgroup/cpuset-internal.h
> +++ b/kernel/cgroup/cpuset-internal.h
> @@ -165,7 +165,7 @@ struct cpuset {
>   	 * number of SCHED_DEADLINE tasks attached to this cpuset, so that we
>   	 * know when to rebuild associated root domain bandwidth information.
>   	 */
> -	int nr_deadline_tasks;
> +	atomic_t nr_deadline_tasks;
>   	int nr_migrate_dl_tasks;
>   	/* DL bandwidth that needs destination reservation for this attach. */
>   	u64 sum_migrate_dl_bw;
> diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
> index 49d8564d1a48..c22e55d798cf 100644
> --- a/kernel/cgroup/cpuset.c
> +++ b/kernel/cgroup/cpuset.c
> @@ -222,14 +222,14 @@ void inc_dl_tasks_cs(struct task_struct *p)
>   {
>   	struct cpuset *cs = task_cs(p);
>   
> -	cs->nr_deadline_tasks++;
> +	atomic_inc(&cs->nr_deadline_tasks);
>   }
>   
>   void dec_dl_tasks_cs(struct task_struct *p)
>   {
>   	struct cpuset *cs = task_cs(p);
>   
> -	cs->nr_deadline_tasks--;
> +	atomic_dec(&cs->nr_deadline_tasks);
>   }
>   
>   static inline bool is_partition_valid(const struct cpuset *cs)
> @@ -918,7 +918,7 @@ static void dl_update_tasks_root_domain(struct cpuset *cs)
>   	struct css_task_iter it;
>   	struct task_struct *task;
>   
> -	if (cs->nr_deadline_tasks == 0)
> +	if (atomic_read(&cs->nr_deadline_tasks) == 0)
>   		return;
>   
>   	css_task_iter_start(&cs->css, 0, &it);
> @@ -3215,8 +3215,8 @@ static void cpuset_attach(struct cgroup_taskset *tset)
>   	cs->old_mems_allowed = cpuset_attach_nodemask_to;
>   
>   	if (cs->nr_migrate_dl_tasks) {
> -		cs->nr_deadline_tasks += cs->nr_migrate_dl_tasks;
> -		oldcs->nr_deadline_tasks -= cs->nr_migrate_dl_tasks;
> +		atomic_add(cs->nr_migrate_dl_tasks, &cs->nr_deadline_tasks);
> +		atomic_sub(cs->nr_migrate_dl_tasks, &oldcs->nr_deadline_tasks);
>   		reset_migrate_dl_data(cs);
>   	}
>   

Reviewed-by: Ridong Chen <ridong.chen@linux.dev>

-- 
Best regards
Ridong

