Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.24
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794407954;
	b=17K9MOTe4tOVDZ5kKFmprsacQ30/1h6Zn2m/Y0lU9lcISjdDSPxqkK/J4jKIdbNm6bqx
	 xzstPmKARtD5E7bPu6rJEMLOpORTqEebiOD/4hmgXgA3xxwbPQOoOoM4F1W6mKJUz93Kp
	 2oy/jdt3MsimoBAw16Wge80NWkpCYabuT7LBvy8bafw5e7ZxOqnGVKlRHU+uFx7c4cYgr
	 n1iG3EfR8AZldE9KbwTrh2K4cFQMBBUyrKL+0PfL8no2puchfh7a8tFvYaKujcYgP4bzO
	 8DwQrESudRaXuPUIEriWFkqJ9WBkErNX7bylRWXWTdIKzClDsIW9yRFMAFrS12FSMRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794407954;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=C3oPuDPO0VYHqtguIXd8xVh7hOh8gbzHRPbwL03ijNk=;
	b=bmnrzXTPQgiNscHywRxBbrs4X6JAMp0SJukOQpjppI/r7LOHbrQShpBkzf42icolmAn3
	 ZkaljNwUPtMdX7ypR6jvBOAg88JVkG9kWlLybJ+6cOsBzkWgfxAiHdAyxjtIM+A8EJZIn
	 sblntq/N9g4pbSBcFZOAj5RiblN32CiBQ68Pl3QBItt6BnDHhQlayg4QjV7YA/CUaqpCi
	 4SZWdzGo5iXzGzLN81/lMi0fBpLBfXCo5yCGSZXuVHb4Q9VO4bNLnY4dv15Z47/llseEc
	 KMsim9TZiMriO2HGeXObcPO8Mn8calF1ddlTj+APLLt5G9xY9UltueBBJwFPk83O4oQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=IBMO2sTM;
	arc=none smtp.remote-ip=95.215.58.24
Received: from mta1.migadu.com (out-24.mta1.migadu.com [95.215.58.24])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 296E7606A32E
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 14:39:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 296E7606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=IBMO2sTM
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Gwi1hqZgtwb2ABl6IdwfrO0Yqa6B/15LvCky+iBgjsw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794407951; v=1; x=1795012751;
 b=IBMO2sTMfo5qMYr8CtYl7y+IZ0uEpWVmEjM2FxMnerRpGv0aTshSn2IzYbSXzqyvHaeQo9vH
 /y+tZAjVH3qup1ekj4T6ivDAH588oMPasTihtN1Gqs9tLkN0/P7lVS8IUMj3nMHqFwzeqACrkQW
 1BM84f0DWpSoQAEOF+iXfhLk=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id ee14b68a753824d2;
	Wed, 11 Nov 2026 14:39:10 +0000
X-Mizu-Trace-ID: ee14b68a753824d2
X-Migadu-Flow: FLOW_OUT
Message-ID: <271d016b-4597-4b6f-9331-5d53d9a9f3a2@linux.dev>
Date: Wed, 11 Nov 2026 22:39:01 +0800
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
Subject: Re: [PATCH-next v3 1/3] cgroup/cpuset: Correctly set cpus_updated in
 cpuset_hotplug_update_tasks()
To: Waiman Long <longman@redhat.com>, Ridong Chen <ridong.chen@linux.dev>,
 Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>,
 =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>,
 Shuah Khan <shuah@kernel.org>
Cc: cgroups@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
References: <20261111020204.1660055-1-longman@redhat.com>
 <20261111020204.1660055-2-longman@redhat.com>
Content-Language: en-US
From: Guopeng Zhang <guopeng.zhang@linux.dev>
In-Reply-To: <20261111020204.1660055-2-longman@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



在 2026/11/11 10:02, Waiman Long 写道:
> When cpuset_hotplug_update_tasks() is called with the conditions that
> remote_partition_disable() has to be called, the cs->effective_cpus will
> be updated such that it matches what is computed in new_cpus. In such
> case, cpus_updated can be incorrectly set to false leading to stale CPU
> afinity remained in the tasks not matching the new cpuset value. Fix that
> by forcing cpus_updated to true after calling remote_partition_disable().
> 
> Fixes: 181c8e091aae ("cgroup/cpuset: Introduce remote partition")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Link: https://sashiko.dev/#/bug/linux-ab90f7e8-0d60-40ca-83e9-e405075b24d2
> Signed-off-by: Waiman Long <longman@redhat.com>
> ---
>  kernel/cgroup/cpuset.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
> index 8a8a424a389f..862864b44960 100644
> --- a/kernel/cgroup/cpuset.c
> +++ b/kernel/cgroup/cpuset.c
> @@ -4031,7 +4031,7 @@ static void cpuset_hotplug_update_tasks(struct cpuset *cs, struct tmpmasks *tmp)
>  {
>  	static cpumask_t new_cpus;
>  	static nodemask_t new_mems;
> -	bool cpus_updated;
> +	bool cpus_updated = false;
>  	bool mems_updated;
>  	int partcmd = -1;
>  	struct cpuset *parent;
> @@ -4044,12 +4044,17 @@ static void cpuset_hotplug_update_tasks(struct cpuset *cs, struct tmpmasks *tmp)
>  	if (!tmp || !cs->partition_root_state)
>  		goto update_tasks;
>  
> +	/*
> +	 * cpus_updated should be set to true when remote_partition_disable()
> +	 * is called as cs->effective_cpus will be modified.
> +	 */
>  	if (is_remote_partition(cs) && (cpumask_empty(subpartitions_cpus) ||
>  				       (cpumask_empty(&new_cpus) &&
>  					partition_is_populated(cs, NULL)))) {
>  		WRITE_ONCE(cs->prs_err, PERR_HOTPLUG);
>  		remote_partition_disable(cs, tmp);
>  		compute_effective_cpumask(&new_cpus, cs, parent);
> +		cpus_updated = true;
>  	}
>  
>  	/*
> @@ -4082,7 +4087,7 @@ static void cpuset_hotplug_update_tasks(struct cpuset *cs, struct tmpmasks *tmp)
>  	}
>  
>  update_tasks:
> -	cpus_updated = !cpumask_equal(&new_cpus, cs->effective_cpus);
> +	cpus_updated |= !cpumask_equal(&new_cpus, cs->effective_cpus);
>  	mems_updated = !nodes_equal(new_mems, cs->effective_mems);
>  	if (!cpus_updated && !mems_updated)
>  		goto unlock;	/* Hotplug doesn't affect this cpuset */

Reviewed-by: Guopeng Zhang <zhangguopeng@kylinos.cn>
Tested-by: Guopeng Zhang <zhangguopeng@kylinos.cn>

Thanks,
Guopeng
