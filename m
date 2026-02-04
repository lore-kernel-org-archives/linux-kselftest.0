Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EF8133B6CC
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Feb 2026 20:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770238363; cv=none; b=IpT7KQOPFjOoFVgkIebpMGZnZaHufgZlhYkabsRM0WtG5K36Q4olWtLIYtW2tSUrVos2KJS0jfPRpDag7dYlcZFeq4ChV/dAea9QvQ46kpPuX3ORzcDbfQI5nyKUoUEhC9p1SJ2EBSbmfGHSwsWJ2KxN9lJWBa0Mwg7cHsP1sTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770238363; c=relaxed/simple;
	bh=ssjpbHI6cmL89OobZPvwmulDP1yFOlYxVlbl3xV+dX4=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=H3QK1SLyRpBWbGhMHf4W5KhVxjtjVDbpEXoJ2jANuYzY9M4cItcyOrfjMAf3749p7Nj0B0tFXCW6JlgBebPucYjYVfJw+YNichiuK4FLNfyzridr2IK+PbIFcJtq98Wgx0scVORY7sFBtWwEEIGWa5hT8TOmltqmxH7TUR6b0o8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DLEKcfh7; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=KXAoHYt3; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DLEKcfh7";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="KXAoHYt3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770238362;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Kj81cXJqBPfu+ZIYdvgIP8qNzuLUngM2uUz9tsRLLUQ=;
	b=DLEKcfh7Jr8wIQpKlJtNbWkoqNvSg01Lt5sW23oGV2+bspk0c7MgjheSoQZYMlMdoA2G92
	IPGcK7VIU18Ydb4vu81MxR3IP5LbKc21wOql2q+8Gryay9SXgxPurYOrwXxq2LxgzsEEOy
	Ag2af05LzgwTfr4AhlA5KB6dBcQIoOo=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-324-Zn5dOUGnPSyry3bZVxDN0Q-1; Wed, 04 Feb 2026 15:52:41 -0500
X-MC-Unique: Zn5dOUGnPSyry3bZVxDN0Q-1
X-Mimecast-MFC-AGG-ID: Zn5dOUGnPSyry3bZVxDN0Q_1770238360
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5033b62efa7so8859521cf.1
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Feb 2026 12:52:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1770238360; x=1770843160; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Kj81cXJqBPfu+ZIYdvgIP8qNzuLUngM2uUz9tsRLLUQ=;
        b=KXAoHYt38b3vxp3H5iNMstzG2+/+oUFKxy2ZWaDBkIyrPxoWwGZ6VtWkRPABa5U47f
         6ePF16iLvLManSFlEMeiCkyONTnrmBUR6Ei0RvFhLyHJpVaavw0YYtn7ieZTHLDMxb32
         +8rCKm2vGazGoPUMPYnTmsYAMDRSehZy9O6nCeJsj3TO8T05DPvXAZu3xleFdGjRAeDg
         8iT5M7fxaZam08Z7yIbC16cDs0rjqBNif7islZ5mca/MGqXCUzq2HbEJszJG2defrzFm
         umwV+WUjr0lN3JygecYQxkVngjRJBY107oqUQP3rCPfz/tEJs6a+oDenE/srpovQT2HC
         8YDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770238360; x=1770843160;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Kj81cXJqBPfu+ZIYdvgIP8qNzuLUngM2uUz9tsRLLUQ=;
        b=T223M79ch2DLUiy53H1ANyXUx3JNRWF4wxYjzUm0YjsFVANsqoXzke5tZmtRyMrJKA
         94rJO68Zb53rdw0qBrls/JlVaFCnr6w3amCPKxwrh72H7IRr4aP1pG5mhL8YVroBMzJ2
         4AZ0evSFkVoPcAD6MHFSxLksBpkVSFDR9D/8oGbByrAF/3c7+NIR8Z/26/Kxt3JOzZR+
         tV51wNtP17FK49pNxHBFY7dtajuuf8auok43cSrmnh8P4Pr+SV/iarqekqY9p/+CTpzu
         IE+2KG3L7WNj9DKQCbNWspsCD8tVKB30rAfyi4mv6oWnjZTLXj/RHVInXBHAIQawmIXs
         EBsw==
X-Forwarded-Encrypted: i=1; AJvYcCVpmqDUu0+ARs8yrKkVZ3zOHrIrtdG6KZn+9gFoCTEj9auv6YiIrA72Y4npIbTY3abKVRtUi1p6jC+olF27onc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSzuPoVr/kfPz/Zk9l8Qs+SBe3tQlFeoYWVN49iQvseS/d+bz5
	rP6bE7y5tNQuLcgR9bRUsuIx2y95LbpqM40AC5Z0t9x6VUi1UDANV3Ch1VB4Lp9gzcsoRt03uSX
	uaj6fTI0w63TnHt9L2fApdmoPdj91CeNQn1vXkJMs+DqujWCp7/hUNNMCBOIT4Behw4Fc+w==
X-Gm-Gg: AZuq6aJouV2qZQ0xr/MBF5uQFb5rcsvF5jWKW5v1daxXK7GvldGMnB870ZXV2NgNigi
	wH+tX/40TZ35FtBTFfC5ydgwsWa5OwuhPjrpkBhmcYPGFsDj9g2C5jEMQaoZzVyTs785OjQ6OOk
	KAqgNCzPQGo6qPlF6LbeG3idck5q8VOQomn7lwDey2SOW81CdR00Y4tHTdUplmUOLH0RJh265I5
	K0+zp1KX2Sx6R5yB2RoTZGm7E1Xehcs4TOGWsS7vLUWQgg5id6eogLqCKSAYrP7wDcDAW74uGOx
	+6XadFcLOHjNRbiiwVd9AIXqkiTPVkLhK1M6F4HEjYdrmnqfbr6x+lLr+9pVtYuRjy/KvgOATHN
	b/nkhtQFqto/5A1fumJnIecO4YpEcNAWxcB9o9RymUwHGb9j/GHB4h02Q
X-Received: by 2002:ac8:57c8:0:b0:4ee:1aab:fd6 with SMTP id d75a77b69052e-5061c0c6ea3mr56224641cf.3.1770238360449;
        Wed, 04 Feb 2026 12:52:40 -0800 (PST)
X-Received: by 2002:ac8:57c8:0:b0:4ee:1aab:fd6 with SMTP id d75a77b69052e-5061c0c6ea3mr56224391cf.3.1770238359987;
        Wed, 04 Feb 2026 12:52:39 -0800 (PST)
Received: from ?IPV6:2601:188:c102:b180:1f8b:71d0:77b1:1f6e? ([2601:188:c102:b180:1f8b:71d0:77b1:1f6e])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89521d3e54bsm27050946d6.56.2026.02.04.12.52.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Feb 2026 12:52:39 -0800 (PST)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <e9d49c28-dbfe-4145-9030-5b6c8168475d@redhat.com>
Date: Wed, 4 Feb 2026 15:52:38 -0500
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH/for-next v2 2/2] cgroup/cpuset: Introduce a new top level
 cpuset_top_mutex
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
 <20260130154254.1422113-3-longman@redhat.com>
 <62022397-287c-4046-94de-058ff87ad728@huaweicloud.com>
 <a2fc3448-dd5c-42fe-ac21-c8e1c10e94b4@redhat.com>
 <0c26006b-fe0f-4743-88d0-29b21fa82ee7@huaweicloud.com>
 <c8a56031-023d-4bbe-b7af-53e91c6d1dfc@redhat.com>
 <1264cf4a-0acd-475b-9f0a-57b816cdd504@huaweicloud.com>
Content-Language: en-US
In-Reply-To: <1264cf4a-0acd-475b-9f0a-57b816cdd504@huaweicloud.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2/3/26 8:55 PM, Chen Ridong wrote:
>
> On 2026/2/3 2:29, Waiman Long wrote:
>> On 2/1/26 8:11 PM, Chen Ridong wrote:
>>> On 2026/2/1 7:13, Waiman Long wrote:
>>>> On 1/30/26 9:53 PM, Chen Ridong wrote:
>>>>> On 2026/1/30 23:42, Waiman Long wrote:
>>>>>> The current cpuset partition code is able to dynamically update
>>>>>> the sched domains of a running system and the corresponding
>>>>>> HK_TYPE_DOMAIN housekeeping cpumask to perform what is essentally the
>>>>>> "isolcpus=domain,..." boot command line feature at run time.
>>>>>>
>>>>>> The housekeeping cpumask update requires flushing a number of different
>>>>>> workqueues which may not be safe with cpus_read_lock() held as the
>>>>>> workqueue flushing code may acquire cpus_read_lock() or acquiring locks
>>>>>> which have locking dependency with cpus_read_lock() down the chain. Below
>>>>>> is an example of such circular locking problem.
>>>>>>
>>>>>>      ======================================================
>>>>>>      WARNING: possible circular locking dependency detected
>>>>>>      6.18.0-test+ #2 Tainted: G S
>>>>>>      ------------------------------------------------------
>>>>>>      test_cpuset_prs/10971 is trying to acquire lock:
>>>>>>      ffff888112ba4958 ((wq_completion)sync_wq){+.+.}-{0:0}, at:
>>>>>> touch_wq_lockdep_map+0x7a/0x180
>>>>>>
>>>>>>      but task is already holding lock:
>>>>>>      ffffffffae47f450 (cpuset_mutex){+.+.}-{4:4}, at:
>>>>>> cpuset_partition_write+0x85/0x130
>>>>>>
>>>>>>      which lock already depends on the new lock.
>>>>>>
>>>>>>      the existing dependency chain (in reverse order) is:
>>>>>>      -> #4 (cpuset_mutex){+.+.}-{4:4}:
>>>>>>      -> #3 (cpu_hotplug_lock){++++}-{0:0}:
>>>>>>      -> #2 (rtnl_mutex){+.+.}-{4:4}:
>>>>>>      -> #1 ((work_completion)(&arg.work)){+.+.}-{0:0}:
>>>>>>      -> #0 ((wq_completion)sync_wq){+.+.}-{0:0}:
>>>>>>
>>>>>>      Chain exists of:
>>>>>>        (wq_completion)sync_wq --> cpu_hotplug_lock --> cpuset_mutex
>>>>>>
>>>>>>      5 locks held by test_cpuset_prs/10971:
>>>>>>       #0: ffff88816810e440 (sb_writers#7){.+.+}-{0:0}, at:
>>>>>> ksys_write+0xf9/0x1d0
>>>>>>       #1: ffff8891ab620890 (&of->mutex#2){+.+.}-{4:4}, at:
>>>>>> kernfs_fop_write_iter+0x260/0x5f0
>>>>>>       #2: ffff8890a78b83e8 (kn->active#187){.+.+}-{0:0}, at:
>>>>>> kernfs_fop_write_iter+0x2b6/0x5f0
>>>>>>       #3: ffffffffadf32900 (cpu_hotplug_lock){++++}-{0:0}, at:
>>>>>> cpuset_partition_write+0x77/0x130
>>>>>>       #4: ffffffffae47f450 (cpuset_mutex){+.+.}-{4:4}, at:
>>>>>> cpuset_partition_write+0x85/0x130
>>>>>>
>>>>>>      Call Trace:
>>>>>>       <TASK>
>>>>>>         :
>>>>>>       touch_wq_lockdep_map+0x93/0x180
>>>>>>       __flush_workqueue+0x111/0x10b0
>>>>>>       housekeeping_update+0x12d/0x2d0
>>>>>>       update_parent_effective_cpumask+0x595/0x2440
>>>>>>       update_prstate+0x89d/0xce0
>>>>>>       cpuset_partition_write+0xc5/0x130
>>>>>>       cgroup_file_write+0x1a5/0x680
>>>>>>       kernfs_fop_write_iter+0x3df/0x5f0
>>>>>>       vfs_write+0x525/0xfd0
>>>>>>       ksys_write+0xf9/0x1d0
>>>>>>       do_syscall_64+0x95/0x520
>>>>>>       entry_SYSCALL_64_after_hwframe+0x76/0x7e
>>>>>>
>>>>>> To avoid such a circular locking dependency problem, we have to
>>>>>> call housekeeping_update() without holding the cpus_read_lock() and
>>>>>> cpuset_mutex. The current set of wq's flushed by housekeeping_update()
>>>>>> may not have work functions that call cpus_read_lock() directly,
>>>>>> but we are likely to extend the list of wq's that are flushed in the
>>>>>> future. Moreover, the current set of work functions may hold locks that
>>>>>> may have cpu_hotplug_lock down the dependency chain.
>>>>>>
>>>>>> One way to do that is to introduce a new top level cpuset_top_mutex
>>>>>> which will be acquired first.  This new cpuset_top_mutex will provide
>>>>>> the need mutual exclusion without the need to hold cpus_read_lock().
>>>>>>
>>>>> Introducing a new global lock warrants careful consideration. I wonder if we
>>>>> could make all updates to isolated_cpus asynchronous. If that is feasible, we
>>>>> could avoid adding a global lock altogether. If not, we need to clarify which
>>>>> updates must remain synchronous and which ones can be handled asynchronously.
>>>> Almost all the cpuset code are run with cpuset_mutex held with either
>>>> cpus_read_lock or cpus_write_lock. So there is no concurrent access/update to
>>>> any of the cpuset internal data. The new cpuset_top_mutex is aded to resolve the
>>>> possible deadlock scenarios with the new housekeeping_update() call without
>>>> breaking this model. Allow parallel concurrent access/update to cpuset data will
>>>> greatly complicate the code and we will likely missed some corner cases that we
>>> I agree with that point. However, we already have paths where isolated_cpus is
>>> updated asynchronously, meaning parallel concurrent access/update is already
>>> happening. Therefore, we cannot entirely avoid such scenarios, so why not keep
>>> the locking simple(make all updates to isolated_cpus asynchronous)?
>> isolated_cpus should only be updated in isolated_cpus_update() where both
>> cpuset_mutex and callback_lock are held. It can be read asynchronously if either
>> cpuset_mutex or callback_lock is held. Can you show me the  places where this
>> rule isn't followed?
>>
> I was considering that since the hotplug path calls update_isolation_cpumasks
> asynchronously, could other cpuset paths (such as setting CPUs or partitions)
> also call update_isolation_cpumasks asynchronously? If so, the global
> cpuset_top_mutex lock might be unnecessary. Note that isolated_cpus is updated
> synchronously, while housekeeping_update is invoked asynchronously.

update_isolation_cpumasks() is always called synchronously as 
cpuset_mutex will always be held. With the current patchset, the only 
asynchronous piece is CPU hotplug vs the the housekeeping_update() call 
as it is being called without holding cpus_read_lock(). AFASICS, it 
should not be a problem. Please let me if you are aware of some 
potential hazard with the current setup.

Cheers,
Longman

