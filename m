Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AA5B378D95
	for <linux-kselftest@vger.kernel.org>; Sat, 31 Jan 2026 23:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769900410; cv=none; b=P+d8SDYBGeKf8QwwmgLI0qvP7c3dVxpXzmyGh+kjtcyd1CS0tlX27DA45VmOB8e3QFg7LYHQtt5mR8EV1UZs2tyu4DAvmhk4LoXvTKGoujaTWIhqekWmkv8vkQ6FK2dK3TSFrpWCF9ZyCACkKJP4tPaZRE6uSrntl2ks1PUIr7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769900410; c=relaxed/simple;
	bh=zqFfqRfaiOQhLC9XWHh23Mob6UtnqTRofBiGNrZEtqA=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=uE3edlh4FWm9Tqa5UymwwsbUN0OwU+B6idflY1fsqXElVhN5lq4tzXCvySv8hnVF4KBzK8V6LJVy53bVDTwsVKCm/pw3IIbiuXVjuhWMDlS60wwMhiPg/dbJJ/gg62btFnxTKPyJWz2jfPkhwN6g0ITXhgzlojWGL3msqeK9VCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=X1ntcLEh; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=D/L3ge/s; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="X1ntcLEh";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="D/L3ge/s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769900407;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w7MECkaQfZwsqsjhzRDYSRqCA7UmF7Toyzwg6Umbbs0=;
	b=X1ntcLEhFAUfSn14MMesms2N9pbIIDFgRHSjtqkTY7iZS7eaU7UwUgIMR6O+ThkEkzwKKU
	O8ClRZy7sqOyRwKRJVx0R7WjY0Bx2nLozH1Jl69qDkDgmVHuL3WsfoIrC0IvqU5AFOt4Pn
	9rk++r1OZDY0o/2coveJbQ3nLQyeHOw=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-679-Y6YO56OjOqSAnlCl6GNJkg-1; Sat, 31 Jan 2026 18:00:05 -0500
X-MC-Unique: Y6YO56OjOqSAnlCl6GNJkg-1
X-Mimecast-MFC-AGG-ID: Y6YO56OjOqSAnlCl6GNJkg_1769900405
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-502b155a742so92827171cf.1
        for <linux-kselftest@vger.kernel.org>; Sat, 31 Jan 2026 15:00:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1769900405; x=1770505205; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=w7MECkaQfZwsqsjhzRDYSRqCA7UmF7Toyzwg6Umbbs0=;
        b=D/L3ge/slIusNnd08CPAoRS5FzNnhVXXUopfJZP0y78Zz//BKhkYTae9BLK/voEEMu
         txTryoXoTHMZyHkvGNZ+DnL1im+fwsOPgExtGAG/o/bwH5YxvtQ/PA0pJFjLGE/D+CGl
         2H+BMZNbIDoBRsSKNnfqaXhbArAqTyfNr6+wOWL5arIt80Hm0OgWRjx1Kp5spez+9hZ3
         REcP9enrs6zXcXzdWNOiCKvQtToJjsGbhqbbQc+5B0hj0HakSmvc5cOsHS9l2Knv+xMF
         PnJn8H6rnRrp21Zww6wHHRumFNxB6qdN+exMkb6esnEA5zqavwpwQTCcUNyaOOv2MwiZ
         eiRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769900405; x=1770505205;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w7MECkaQfZwsqsjhzRDYSRqCA7UmF7Toyzwg6Umbbs0=;
        b=hZxawY82XPfrMBa9lu/jfXCeZ1F1P8+1cO40Qlhok7x6Pytb5DAFP6CAIr/71FsLej
         K/BvlJBifnum2F4LEdVHkLaUFEaKe78xGG+pewn++Zb5oWO8g0K3KlTTsKML04hzyJdw
         OSb/LiiXxNK7bxZ3uSUuQ6tGoumHMAl/1tmvZNxOY0GxNun2Reyi9KId4XnViGN84vS5
         HeVeY1tgL1krgJP4lE099oRgd6CrX34/3I9jei6JLiPfUtu+bq8xqDnL4PXn0z6z879C
         qGeR36w4WEirF55y5SjRrlJwtqnChhEXHF21i8qnLlqC18bpi1rE9SQotJGChcUJUfZo
         b9bA==
X-Forwarded-Encrypted: i=1; AJvYcCXlWhAV65T9P4zsf7mekaTGZTSXyIxaZ7uFpIFMSiUv7wpb9/i2RzAXAiPVjz3BeXNiYgx1eul9K2NYHFuedy0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPRkM0lRl/mnrXRTJ4gN9Pl9wwnKJqFJA+aHUj4iX6glqW/VeO
	r2eX4YEKZuWuE/64WTdOsd9miia8J1ZFMnbYKGtx2AfoW1/QhOixiHvuM4XkQ0iD6+fgaPwIuq/
	udUJf0EWghpaGd7rXWMj7gbgVFQLpQovfQW5X9xIDxDF8m8xsht4PHfsZlp1IKwDyKAC77A==
X-Gm-Gg: AZuq6aJK/rIMCuw/xHd4KHxqrDlFiC426n2i5a8+sT6OXgbovZ2SoePDTsDZlSBXUEf
	hrWCwMzlR853yveTL215iiZ6DbvrK8xmDW/jUodYObaWEw74Hhzb0pZs1CK+92VaSyiBk52x+PF
	CL6Ek8ayUrcdQvR5XhWI05tQiLM6oO4/TBl11QbL5I1lI3zI47qhBYSIZSPaI7gKmQj5poR3sBR
	iMKJvq4WuCfM10Akj6uCQ+jLgyoWEY2PDb90OxvIFOnYtiRNBgqLQCYUIMoMVr+hKJdiLb4ClAP
	fyBiBZGoErdcXOcAIUUzroSO7nhWLtukPchcvDTBJBKF0vpSQ4pC5VaQgSJMJwynpKMZi2m3CTw
	gyWnDdTarimSH9iYoN5tThGm8DCAnrSipfo0iCzKkzIbpJR/b/fEEwkVq
X-Received: by 2002:ac8:5a82:0:b0:4f4:c104:9519 with SMTP id d75a77b69052e-505d223ead5mr100366841cf.42.1769900404728;
        Sat, 31 Jan 2026 15:00:04 -0800 (PST)
X-Received: by 2002:ac8:5a82:0:b0:4f4:c104:9519 with SMTP id d75a77b69052e-505d223ead5mr100366511cf.42.1769900404214;
        Sat, 31 Jan 2026 15:00:04 -0800 (PST)
Received: from ?IPV6:2601:188:c102:b180:1f8b:71d0:77b1:1f6e? ([2601:188:c102:b180:1f8b:71d0:77b1:1f6e])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50337cc19d7sm81065561cf.35.2026.01.31.15.00.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Jan 2026 15:00:03 -0800 (PST)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <2bd82e80-564b-4ec7-a97a-4722248a1a4a@redhat.com>
Date: Sat, 31 Jan 2026 18:00:02 -0500
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH/for-next v2 1/2] cgroup/cpuset: Defer
 housekeeping_update() call from CPU hotplug to workqueue
To: Chen Ridong <chenridong@huaweicloud.com>, Waiman Long <llong@redhat.com>,
 Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>,
 =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>,
 Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 Anna-Maria Behnsen <anna-maria@linutronix.de>,
 Frederic Weisbecker <frederic@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Shuah Khan <shuah@kernel.org>
Cc: cgroups@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20260130154254.1422113-1-longman@redhat.com>
 <20260130154254.1422113-2-longman@redhat.com>
 <7c7fddf5-9d32-415b-a1c4-3b9402e78d72@huaweicloud.com>
 <781c0d8e-7cb6-4f3e-913a-b2a6b0bfed5e@redhat.com>
 <444c73fd-bd24-41d9-8642-597a546de781@huaweicloud.com>
Content-Language: en-US
In-Reply-To: <444c73fd-bd24-41d9-8642-597a546de781@huaweicloud.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 1/30/26 9:05 PM, Chen Ridong wrote:
>
> On 2026/1/31 9:45, Waiman Long wrote:
>> On 1/30/26 7:58 PM, Chen Ridong wrote:
>>> On 2026/1/30 23:42, Waiman Long wrote:
>>>> The update_isolation_cpumasks() function can be called either directly
>>>> from regular cpuset control file write with cpuset_full_lock() called
>>>> or via the CPU hotplug path with cpus_write_lock and cpuset_mutex held.
>>>>
>>>> As we are going to enable dynamic update to the nozh_full housekeeping
>>>> cpumask (HK_TYPE_KERNEL_NOISE) soon with the help of CPU hotplug,
>>>> allowing the CPU hotplug path to call into housekeeping_update() directly
>>>> from update_isolation_cpumasks() will likely cause deadlock. So we
>>>> have to defer any call to housekeeping_update() after the CPU hotplug
>>>> operation has finished. This is now done via the workqueue where
>>>> the actual housekeeping_update() call, if needed, will happen after
>>>> cpus_write_lock is released.
>>>>
>>>> We can't use the synchronous task_work API as call from CPU hotplug
>>>> path happen in the per-cpu kthread of the CPU that is being shut down
>>>> or brought up. Because of the asynchronous nature of workqueue, the
>>>> HK_TYPE_DOMAIN housekeeping cpumask will be updated a bit later than the
>>>> "cpuset.cpus.isolated" control file in this case.
>>>>
>>>> Also add a check in test_cpuset_prs.sh and modify some existing
>>>> test cases to confirm that "cpuset.cpus.isolated" and HK_TYPE_DOMAIN
>>>> housekeeping cpumask will both be updated.
>>>>
>>>> Signed-off-by: Waiman Long <longman@redhat.com>
>>>> ---
>>>>    kernel/cgroup/cpuset.c                        | 37 +++++++++++++++++--
>>>>    .../selftests/cgroup/test_cpuset_prs.sh       | 13 +++++--
>>>>    2 files changed, 44 insertions(+), 6 deletions(-)
>>>>
>>>> diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
>>>> index 7b7d12ab1006..0b0eb1df09d5 100644
>>>> --- a/kernel/cgroup/cpuset.c
>>>> +++ b/kernel/cgroup/cpuset.c
>>>> @@ -84,6 +84,9 @@ static cpumask_var_t    isolated_cpus;
>>>>     */
>>>>    static bool isolated_cpus_updating;
>>>>    +/* Both cpuset_mutex and cpus_read_locked acquired */
>>>> +static bool cpuset_locked;
>>>> +
>>>>    /*
>>>>     * A flag to force sched domain rebuild at the end of an operation.
>>>>     * It can be set in
>>>> @@ -285,10 +288,12 @@ void cpuset_full_lock(void)
>>>>    {
>>>>        cpus_read_lock();
>>>>        mutex_lock(&cpuset_mutex);
>>>> +    cpuset_locked = true;
>>>>    }
>>>>      void cpuset_full_unlock(void)
>>>>    {
>>>> +    cpuset_locked = false;
>>>>        mutex_unlock(&cpuset_mutex);
>>>>        cpus_read_unlock();
>>>>    }
>>>> @@ -1285,6 +1290,16 @@ static bool prstate_housekeeping_conflict(int prstate,
>>>> struct cpumask *new_cpus)
>>>>        return false;
>>>>    }
>>>>    +static void isolcpus_workfn(struct work_struct *work)
>>>> +{
>>>> +    cpuset_full_lock();
>>>> +    if (isolated_cpus_updating) {
>>>> +        WARN_ON_ONCE(housekeeping_update(isolated_cpus) < 0);
>>>> +        isolated_cpus_updating = false;
>>>> +    }
>>>> +    cpuset_full_unlock();
>>>> +}
>>>> +
>>>>    /*
>>>>     * update_isolation_cpumasks - Update external isolation related CPU masks
>>>>     *
>>>> @@ -1293,14 +1308,30 @@ static bool prstate_housekeeping_conflict(int
>>>> prstate, struct cpumask *new_cpus)
>>>>     */
>>>>    static void update_isolation_cpumasks(void)
>>>>    {
>>>> -    int ret;
>>>> +    static DECLARE_WORK(isolcpus_work, isolcpus_workfn);
>>>>          if (!isolated_cpus_updating)
>>>>            return;
>>>>    -    ret = housekeeping_update(isolated_cpus);
>>>> -    WARN_ON_ONCE(ret < 0);
>>>> +    /*
>>>> +     * This function can be reached either directly from regular cpuset
>>>> +     * control file write (cpuset_locked) or via hotplug (cpus_write_lock
>>>> +     * && cpuset_mutex held). In the later case, we defer the
>>>> +     * housekeeping_update() call to the system_unbound_wq to avoid the
>>>> +     * possibility of deadlock. This also means that there will be a short
>>>> +     * period of time where HK_TYPE_DOMAIN housekeeping cpumask will lag
>>>> +     * behind isolated_cpus.
>>>> +     */
>>>> +    if (!cpuset_locked) {
>>> Adding a global variable makes this difficult to handle, especially in
>>> concurrent scenarios, since we could read it outside of a critical region.
>> No, cpuset_locked is always read from or written into inside a critical section.
>> It is under cpuset_mutex up to this point and then with the cpuset_top_mutex
>> with the next patch.
> This is somewhat confusing. cpuset_locked is only set to true when the "full
> lock" has been acquired. If cpuset_locked is false, that should mean we are
> outside of any critical region. Conversely, if we are inside a critical region,
> cpuset_locked should be true.
>
> The situation is a bit messy, it’s not clearly which lock protects which global
> variable.

There is a comment above "cpuset_locked" which state which lock protect 
it. The locking situation is becoming more complicated. I think I will 
add a new patch to more clearly document what each global variable is 
being protected by.

Cheers,
Longman

>
>>> I suggest removing cpuset_locked and adding async_update_isolation_cpumasks
>>> instead, which can indicate to the caller it should call without holding the
>>> full lock.
>> The point of this global variable is to distinguish between calling from CPU
>> hotplug and the other regular cpuset code paths. The only difference between
>> these two are having cpus_read_lock or cpus_write_lock held. That is why I think
>> adding a global variable in cpuset_full_lock() is the easy way. Otherwise, we
>> will to add extra argument to some of the functions to distinguish these two cases.
>>
>> Cheers,
>> Longman
>>

