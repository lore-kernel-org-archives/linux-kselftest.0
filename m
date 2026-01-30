Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E2E4314B8E
	for <linux-kselftest@vger.kernel.org>; Fri, 30 Jan 2026 01:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769737078; cv=none; b=C1U8VaDjYCb/X64EwcmYoT5uwSB9+Q6mo9L1b/x4Vt8xNrzfbSh59RzDXcqjWtFBdxOUab/OlGzVRhjRFhHNR71DB/eTocp+UkVcgJ8iDjvAO5L5BkTI5fOwzd5wMO2E1iZ+nZoUTicxFxbRB8STitmLM1H0PYvqAJHlNAtWaN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769737078; c=relaxed/simple;
	bh=aQE4TwJTDA2nYHhgmtWv01ctuEAqLPz1WTLL/kBMHx8=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=DgmewZpaF8DwCjFbNqY5vHcDmvn0qwWZBL+7enU4X44B6OBk+D/A+joNuwG5hdhSxbsPH4QoDJRRMfZNM1eN98fVE8AepYiwKyaX7QVjc93z2yeOLIzCpCsC4W60+PvQEYJ5E0MUxOV4t0odLoooItne02uGz3qpp52m8P4KHzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eTCSOxg9; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=FB8BCVDe; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eTCSOxg9";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="FB8BCVDe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769737076;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qmTTtKxkokIeaDGxgICD7yKtOxqpXe+ZdD2B4/W6tUQ=;
	b=eTCSOxg98ownc7PzGxctlJavJA7OEzCuXVK2LoTrLpt212kYcrE0Q3l+UYzAg6byJRTHBL
	XIvKO5N8iE+JHOKMY4XvoNWyG1ZnC53PlzdK8+rbkKd0Hc67BVFMw1K1AQOgTglT5rwKRX
	msN8EIDZuhO54IxyiWrQsrShrf4tZKY=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-621-0CH_M3NdN6uEo_AfkvHlpg-1; Thu, 29 Jan 2026 20:37:54 -0500
X-MC-Unique: 0CH_M3NdN6uEo_AfkvHlpg-1
X-Mimecast-MFC-AGG-ID: 0CH_M3NdN6uEo_AfkvHlpg_1769737074
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c71655aa11so492977585a.3
        for <linux-kselftest@vger.kernel.org>; Thu, 29 Jan 2026 17:37:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1769737074; x=1770341874; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qmTTtKxkokIeaDGxgICD7yKtOxqpXe+ZdD2B4/W6tUQ=;
        b=FB8BCVDeh4fToSCkf/JLnkuRAwsbRhse0X/pJN2rWJ7KW6wpOy/sDDpLs+Y6LWcAsO
         /Yy3uzaqp8uoxwW+Yp+kYaJ4ieOjQEhcCMJ6hH/w30+SN0HfNnP5Ehey+q08T8RsHxeu
         igD098KzlgXII2/IQr1AxLjw4CFRmeEOILCjxvUQydDxYRDydQcW1ghIt566JKWLQiBV
         bGZ6pI/k36KCzKlCyvR/IUeky0ZRa4wK5NUjwxcEBp6/gZyBBXfsU4+ZX/bTmKT31d+6
         hKw2H9H73M0yEKwAwEZbJfqVjFzwF/Qd75WaTQdNlJHdZMYGYxvkLu/Y/xqSMd/2kDSz
         WJ7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769737074; x=1770341874;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qmTTtKxkokIeaDGxgICD7yKtOxqpXe+ZdD2B4/W6tUQ=;
        b=oZF/QIDvJat0ugP1NQbCb4XwMq3NsYHPVtkW9M11Zq9Oqn9jpQMby5ALEavT8d9vOT
         ezaaDxJwu3PJzYHYM1G8RKOHFJnntyHvmTt9qf/CUHZxS7PDmLkvQj0jGhQL4f0ZNKDF
         pCZw+9+pLqXWXk4KVkXWqrHrnqvC1GWJgw/h+kUSzVParu52W1X+d4U3AWybOjj0Fr3Q
         o1OjxWVJQtoeYHxKolSOYWLC0iD3ambncQ74k/Zf6tT1o9+TebAQ+3U46aPwh7dirn8t
         B5YB9IVjoxPjfZz6rUUDQJ8Vrl2Uy7No+A99TfQfBs2Z71a3HtGdytpYiuBeLJTAZnhX
         TJcQ==
X-Forwarded-Encrypted: i=1; AJvYcCUAXa+WMNaTW01VtAGbDp5kWv+YpKCXNsTgCFHE/eXP/g5MVadIe+oIjwtLD4pi+g9OzU0q7CJOd4CYpmftGpc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZO7/u4nPRa2KZW88cAUXuVB+Z0IcuIOMML0OlkpFMaLrG8Ish
	O7kEs6B4o5rqRb04NHYbGmwFppx2yo+kEtOAFv10m653sy7K12bNxLryJXT+k7+uP3nxAT6edz2
	LjgCZTo9fmierzomGyxdwTLyJtk7iLMHF8THC3J/xaHwwaDB/VIVoVUBGhojNDFpgw50mJg==
X-Gm-Gg: AZuq6aKl/lcWNDctr/sIJach5L/SXsYPgdfrpLnrOGpzpiA5hvVMwM1iBkdJhIjctll
	piE1pofEuluCguTktSt6+4wQbJjE+3jSa/fPUIyuYMvHDElI8vxs1tCB5Jy34NMkQGY18NdbO1R
	B2SD75Gg/T953iYWE/8xa4cd2NVXwCuFi8Q6IDJdA8YfOvO0FX2/+Bexek7/HQUBvayMvPXKu4s
	tGs4aW9tQRmRiQCAsA+75SqInlNQuBFTiqPIJ0QnzKt+1rf06nkR2MfPATp38iHl9cV9f7AzAI2
	9Njeic9rV2Ku4Djm9W0qjsy8xNksCnfuCjDZbrT64baZKSQflWn3g3TbW7ZcHfdGQj2azALLbgS
	2K5W7nrOxl/hkpm4BqvcJA4F6WaH30baqiUqy/e6gD7N01jExdJZYxiC6
X-Received: by 2002:a05:620a:bd5:b0:8c7:177f:cc1c with SMTP id af79cd13be357-8c9eb258c20mr232682085a.16.1769737073914;
        Thu, 29 Jan 2026 17:37:53 -0800 (PST)
X-Received: by 2002:a05:620a:bd5:b0:8c7:177f:cc1c with SMTP id af79cd13be357-8c9eb258c20mr232680985a.16.1769737073556;
        Thu, 29 Jan 2026 17:37:53 -0800 (PST)
Received: from ?IPV6:2601:188:c102:b180:1f8b:71d0:77b1:1f6e? ([2601:188:c102:b180:1f8b:71d0:77b1:1f6e])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c711d63200sm505110985a.54.2026.01.29.17.37.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jan 2026 17:37:53 -0800 (PST)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <2ac13ef1-1fb1-44a9-9bb1-a82338bc27f0@redhat.com>
Date: Thu, 29 Jan 2026 20:37:51 -0500
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH/for-next 1/2] cgroup/cpuset: Defer housekeeping_update()
 call from CPU hotplug to task_work
To: Chen Ridong <chenridong@huaweicloud.com>, Tejun Heo <tj@kernel.org>,
 Johannes Weiner <hannes@cmpxchg.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?=
 <mkoutny@suse.com>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 Anna-Maria Behnsen <anna-maria@linutronix.de>,
 Frederic Weisbecker <frederic@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Shuah Khan <shuah@kernel.org>
Cc: cgroups@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20260128044251.1229702-1-longman@redhat.com>
 <20260128044251.1229702-2-longman@redhat.com>
 <ccca8790-2bf9-46db-b355-ce8695ea7093@huaweicloud.com>
 <4d192246-d795-4f65-825f-5e4a413cae32@huaweicloud.com>
Content-Language: en-US
In-Reply-To: <4d192246-d795-4f65-825f-5e4a413cae32@huaweicloud.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/29/26 2:15 AM, Chen Ridong wrote:
>
> On 2026/1/29 12:03, Chen Ridong wrote:
>>
>> On 2026/1/28 12:42, Waiman Long wrote:
>>> The update_isolation_cpumasks() function can be called either directly
>>> from regular cpuset control file write with cpuset_full_lock() called
>>> or via the CPU hotplug path with cpus_write_lock and cpuset_mutex held.
>>>
>>> As we are going to enable dynamic update to the nozh_full housekeeping
>>> cpumask (HK_TYPE_KERNEL_NOISE) soon with the help of CPU hotplug,
>>> allowing the CPU hotplug path to call into housekeeping_update()
>>> directly from update_isolation_cpumasks() will cause deadlock. So we
>>> have to defer any call to housekeeping_update() after the CPU hotplug
>>> operation has finished. This can be done via the task_work_add(...,
>>> TWA_RESUME) API where the actual housekeeping_update() call, if needed,
>>> will happen right before existing back to userspace.
>>>
>>> Since the HK_TYPE_DOMAIN housekeeping cpumask should now track the
>>> changes in "cpuset.cpus.isolated", add a check in test_cpuset_prs.sh to
>>> confirm that the CPU hotplug deferral, if needed, is working as expected.
>>>
>>> Signed-off-by: Waiman Long <longman@redhat.com>
>>> ---
>>>   kernel/cgroup/cpuset.c                        | 49 ++++++++++++++++++-
>>>   .../selftests/cgroup/test_cpuset_prs.sh       |  9 ++++
>>>   2 files changed, 56 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
>>> index 7b7d12ab1006..98c7cb732206 100644
>>> --- a/kernel/cgroup/cpuset.c
>>> +++ b/kernel/cgroup/cpuset.c
>>> @@ -84,6 +84,10 @@ static cpumask_var_t	isolated_cpus;
>>>    */
>>>   static bool isolated_cpus_updating;
>>>   
>>> +/* Both cpuset_mutex and cpus_read_locked acquired */
>>> +static bool cpuset_full_locked;
>>> +static bool isolation_task_work_queued;
>>> +
>>>   /*
>>>    * A flag to force sched domain rebuild at the end of an operation.
>>>    * It can be set in
>>> @@ -285,10 +289,12 @@ void cpuset_full_lock(void)
>>>   {
>>>   	cpus_read_lock();
>>>   	mutex_lock(&cpuset_mutex);
>>> +	cpuset_full_locked = true;
>>>   }
>>>   
>>>   void cpuset_full_unlock(void)
>>>   {
>>> +	cpuset_full_locked = false;
>>>   	mutex_unlock(&cpuset_mutex);
>>>   	cpus_read_unlock();
>>>   }
>>> @@ -1285,25 +1291,64 @@ static bool prstate_housekeeping_conflict(int prstate, struct cpumask *new_cpus)
>>>   	return false;
>>>   }
>>>   
>>> +static void __update_isolation_cpumasks(bool twork);
>>> +static void isolation_task_work_fn(struct callback_head *cb)
>>> +{
>>> +	cpuset_full_lock();
>>> +	__update_isolation_cpumasks(true);
>>> +	cpuset_full_lock();
>>> +}
>>> +
>>>   /*
>>> - * update_isolation_cpumasks - Update external isolation related CPU masks
>>> + * __update_isolation_cpumasks - Update external isolation related CPU masks
>>> + * @twork - set if call from isolation_task_work_fn()
>>>    *
>>>    * The following external CPU masks will be updated if necessary:
>>>    * - workqueue unbound cpumask
>>>    */
>>> -static void update_isolation_cpumasks(void)
>>> +static void __update_isolation_cpumasks(bool twork)
>>>   {
>>>   	int ret;
>>>   
>>> +	if (twork)
>>> +		isolation_task_work_queued = false;
>>> +
>>>   	if (!isolated_cpus_updating)
>>>   		return;
>>>   
>>> +	/*
>>> +	 * This function can be reached either directly from regular cpuset
>>> +	 * control file write (cpuset_full_locked) or via hotplug
>>> +	 * (cpus_write_lock && cpuset_mutex held). In the later case, we
>>> +	 * defer the housekeeping_update() call to a task_work to avoid
>>> +	 * the possibility of deadlock. The task_work will be run right
>>> +	 * before exiting back to userspace.
>>> +	 */
>>> +	if (!cpuset_full_locked) {
>>> +		static struct callback_head twork_cb;
>>> +
>>> +		if (!isolation_task_work_queued) {
>>> +			init_task_work(&twork_cb, isolation_task_work_fn);
>>> +			if (!task_work_add(current, &twork_cb, TWA_RESUME))
>>> +				isolation_task_work_queued = true;
>>> +			else
>>> +				/* Current task shouldn't be exiting */
>>> +				WARN_ON_ONCE(1);
>>> +		}
>>> +		return;
>>> +	}
>>> +
>>>   	ret = housekeeping_update(isolated_cpus);
>>>   	WARN_ON_ONCE(ret < 0);
>>>   
>>>   	isolated_cpus_updating = false;
>>>   }
>>>   
>> The logic is not straightforward; perhaps we can simplify it as follows,
>> maybe I missed something, just correct me.
>>
>> static void isolation_task_work_fn(struct callback_head *cb)
>> {
>> 	guard(mutex)(&isolcpus_update_mutex);
>> 	WARN_ON_ONCE(housekeeping_update(isolated_cpus) < 0);
>> }
>>
>> /*
>>   * __update_isolation_cpumasks - Update external isolation related CPU masks
>>   * @twork - set if call from isolation_task_work_fn()
>>   *
>>   * The following external CPU masks will be updated if necessary:
>>   * - workqueue unbound cpumask
>>   */
>> static void __update_isolation_cpumasks(bool twork)
>> {
>> 	if (!isolated_cpus_updating)
>> 		return;
>>
>> 	/*
>> 	 * This function can be reached either directly from regular cpuset
>> 	 * control file write (cpuset_full_locked) or via hotplug
>> 	 * (cpus_write_lock && cpuset_mutex held). In the later case, we
>> 	 * defer the housekeeping_update() call to a task_work to avoid
>> 	 * the possibility of deadlock. The task_work will be run right
>> 	 * before exiting back to userspace.
>> 	 */
>> 	if (twork) {
>> 		static struct callback_head twork_cb;
>>
>> 		init_task_work(&twork_cb, isolation_task_work_fn);
>> 		if (task_work_add(current, &twork_cb, TWA_RESUME))
>> 			/* Current task shouldn't be exiting */
>> 			WARN_ON_ONCE(1);
>>
>> 		return;
>> 	}
>>
>> 	lockdep_assert_held(&isolcpus_update_mutex);
>> 	/*
>> 	 * Release cpus_read_lock & cpuset_mutex before calling
>> 	 * housekeeping_update() and re-acquiring them afterward if not
>> 	 * calling from task_work.
>> 	 */
>>
>> 	cpuset_full_unlock();
>> 	WARN_ON_ONCE(housekeeping_update(isolated_cpus) < 0);
>> 	cpuset_full_lock();
>>
>> 	isolated_cpus_updating = false;
>> }
>>
>> static inline void update_isolation_cpumasks(void)
>> {
>> 	__update_isolation_cpumasks(false);
>> }
>>
> It can be much clearer:
>
> static void isolation_task_work_fn(struct callback_head *cb)
> {
> 	guard(mutex)(&isolcpus_update_mutex);
> 	WARN_ON_ONCE(housekeeping_update(isolated_cpus) < 0);
> }
>
> /*
>   * __update_isolation_cpumasks - Update external isolation related CPU masks
>   * @defer
>   *
>   * The following external CPU masks will be updated if necessary:
>   * - workqueue unbound cpumask
>   */
> static void __update_isolation_cpumasks(bool defer)
> {
> 	if (!isolated_cpus_updating)
> 		return;
>
> 	/*
> 	 * This function can be reached either directly from regular cpuset
> 	 * control file write (cpuset_full_locked) or via hotplug
> 	 * (cpus_write_lock && cpuset_mutex held). In the later case, we
> 	 * defer the housekeeping_update() call to a task_work to avoid
> 	 * the possibility of deadlock. The task_work will be run right
> 	 * before exiting back to userspace.
> 	 */
> 	if (defer) {
> 		static struct callback_head twork_cb;
>
> 		init_task_work(&twork_cb, isolation_task_work_fn);
> 		if (task_work_add(current, &twork_cb, TWA_RESUME))
> 			/* Current task shouldn't be exiting */
> 			WARN_ON_ONCE(1);
>
> 		return;
> 	}
>
> 	lockdep_assert_held(&isolcpus_update_mutex);
> 	lockdep_assert_cpus_held();
> 	lockdep_assert_cpuset_lock_held();
>
> 	/*
> 	 * Release cpus_read_lock & cpuset_mutex before calling
> 	 * housekeeping_update() and re-acquiring them afterward if not
> 	 * calling from task_work.
> 	 */
>
> 	cpuset_full_unlock();
> 	WARN_ON_ONCE(housekeeping_update(isolated_cpus) < 0);
> 	cpuset_full_lock();
>
> 	isolated_cpus_updating = false;
> }
>
> static inline void update_isolation_cpumasks(void)
> {
> 	__update_isolation_cpumasks(false);
> }
>
> static inline void asyn_update_isolation_cpumasks(void)
> {
> 	__update_isolation_cpumasks(true);
> }
>
> The hotplug path just calls asyn_update_isolation_cpumasks(), cpuset_full_locked
> and isolation_task_work_queued can be removed.
>
Thanks for the suggestions. I will adopt some of them. BTW, I am 
switching to use workqueue instead of the task_work as the latter is 
suitable in this use case.

Cheers,
Longman

