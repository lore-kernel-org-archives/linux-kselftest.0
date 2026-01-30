Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A02D928D830
	for <linux-kselftest@vger.kernel.org>; Fri, 30 Jan 2026 03:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769745198; cv=none; b=EHw6bJxLy8/waxX90/yduYorCzuDrJIfVU/binNcbDgOjN9wAnfP6f1w48apXEZuSwpe87vlVP/8ersG3jEwB8w2DiazVdqWiDGwJ6PBaP+phOm/ZIxsC6xhLfsBUmk1+y3jU2InIKhelCT42V/DxCjqs2ZslegMQ6X2FMtn1cI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769745198; c=relaxed/simple;
	bh=YUglP/1o0VFlP49CUtC5odsiRK0KtdguVL0uUKW80B0=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Fq3zuZHjyN0dfYWTf+dpYg1NCz/dc88jAOoR2sao+EwzxugeNXpRvjJ8WC/s3xuYK0gZQ3LoRJ+Q+t3b8aMaG+YRGMWmB5CKNNbS+QHoPb8y/2JRrfO0up97rMyLQJlhC8rSZj7ZlrtHhkZkTH7s0S0qbGJoWKbBpfd0/dCXliU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HiyI291R; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=MwozaLmu; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HiyI291R";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="MwozaLmu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769745195;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/VgU+9mjJcQ6t3VpK1I61TTGyW0HQRG6T8xqgtO3yoQ=;
	b=HiyI291Rvf7i6dgD7bl9DGWNjj28kjK25H824QSil2Iu7T6YXFLccpnqiGFyvsDLGOF9CK
	/EUbMoV2vc+VpO3Dvi2t8/aGTLzPMRcayv9oGga2LjOmdz+WLJ5/GOlUJvj3E700XlsvUa
	fhfWL8fMDrnn22olluMadjjHU0Dy5eE=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-402-2Y60jtFNNOK7-73g2jJT9Q-1; Thu, 29 Jan 2026 22:53:14 -0500
X-MC-Unique: 2Y60jtFNNOK7-73g2jJT9Q-1
X-Mimecast-MFC-AGG-ID: 2Y60jtFNNOK7-73g2jJT9Q_1769745193
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-502a26ccb20so25074081cf.2
        for <linux-kselftest@vger.kernel.org>; Thu, 29 Jan 2026 19:53:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1769745193; x=1770349993; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/VgU+9mjJcQ6t3VpK1I61TTGyW0HQRG6T8xqgtO3yoQ=;
        b=MwozaLmuSUIeBWHes+EVkydppBp9mBXyy4UVSCj/2sJ3qHvw/LYZtkBLMbEPa67/4B
         wOgCoenocYDjbRI5Y5pfS4seXA7f52otShnOVTv8bCKK3A/QSUVUBk0+biJpHhn67W0x
         I861x1lTGRZ5Ntv+EDTWi3eK3V7TNAlcKT/k1UojS61I8DgO8D/h1SZpNtuG8yYoUFjn
         13IH/BRqaVcoDaxyd/DMDcoHDELyCFhik7FzfjaonZPvF0t9Kh8Q5HHFXOCruYr3Rk1L
         knZ0CFF1CDfKQzTFCMCmL4Q8bTwTmmFQPwnFZwpMAHjx2Hny6HNSOqJPL5LnojkgyQu6
         U0Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769745193; x=1770349993;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/VgU+9mjJcQ6t3VpK1I61TTGyW0HQRG6T8xqgtO3yoQ=;
        b=ewuGkrt0uecpGjrOCMBA1ujb14OZlk/5Cj1nkoqIbeoksV4Sp6ZNfVk9cQM+hUbJ6o
         d283uGSH1DohS1yCNNyGdVLAE+ukunHMtWFrQSlF9jIRyUyKc+0GIwJtFAiIpmt45O9m
         qlB8nqtudAdMJ4KZgB0UeF5NBorJ3/AdtxA1DCQueT0dgLV8IF98kSYqajz+ak2o0/8s
         a/a+xqctwjZpaq9CUNyZ+b72pp3XKo66c/P7HY5DV/6gcveKP0M0cNb+st3oma9woeT/
         CoVwT81UU8Y29KyCjycPNsOFhsbullx3xlA6S+MS0Xjr6i3wwyOW4XifQdnJofaqTpeF
         z8sA==
X-Forwarded-Encrypted: i=1; AJvYcCUvmTBOMLsGFQnYAM5h+osGr4H5+AUr4k0t6+KmIcIlXTk4Rb6H7v0Xsi8WQU/mqCgW+1uy3jpy+iNp2Yqw+wc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwephO0UXNVxNivxxEL5AL2KGFXh4pqTywc6xgjVor2Qr7pNfG/
	Pst+9X1o42HGIhwoJKCldzC+sr/JfycHx1uVgNDfFI9KbH2J7/fAydtwQPAkYjyNKHXxwf970I9
	Z8ykBejKDospLI2fGYxc4ocoke0YPsAZqi5Qi3RsTN3g1nIY+NuHwVsQg70h7YfdM9Y2h5Q==
X-Gm-Gg: AZuq6aLL8NKx7xwmuJg+l77G4Y9ZprKzn2K0vC5MVqQW9Uq/1yVjFOwwczaaQxGvTH2
	mdMt971AzumqPOi1Z3+OAfDH1vnxfiUM9CO6BTv2OhO6Vaq3yhUcPLzTyP/AxG0cdszi6a1cwRY
	9CkH14e7Ybyeec1XKYpE6MRB4cj3ceN96SD23pV/SKrEn4o9BlnacbmdRHgqcG9dUwXSw7bmrQe
	PRU1gHxU/gxD6BHIxkktRAIGw1SUjWAk04nMv9FFfy6tNE+a2AaZ0ksio297dYjzXYa8JPLsCCB
	0nTTzbLqUu4mq9jx/YjCg9y5kMkifcsfJaJITJxlQjpNj+eI9MkuBTovTlnMZYdu9O6OUt175Mk
	bJ+zTS2GFEvVKj/ocjOVhbd3qan3FSEEGr/fLFJi1OUuZg/fyQ82pN9CQ
X-Received: by 2002:ac8:7dc4:0:b0:4ec:f477:60e9 with SMTP id d75a77b69052e-505d22c8c79mr22427441cf.76.1769745193512;
        Thu, 29 Jan 2026 19:53:13 -0800 (PST)
X-Received: by 2002:ac8:7dc4:0:b0:4ec:f477:60e9 with SMTP id d75a77b69052e-505d22c8c79mr22427251cf.76.1769745193054;
        Thu, 29 Jan 2026 19:53:13 -0800 (PST)
Received: from ?IPV6:2601:188:c102:b180:1f8b:71d0:77b1:1f6e? ([2601:188:c102:b180:1f8b:71d0:77b1:1f6e])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-894d375debasm51663666d6.42.2026.01.29.19.53.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jan 2026 19:53:12 -0800 (PST)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <f5adfdc9-4972-4437-8cc9-843b28e7414c@redhat.com>
Date: Thu, 29 Jan 2026 22:53:10 -0500
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH/for-next 2/2] cgroup/cpuset: Introduce a new top level
 isolcpus_update_mutex
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
References: <20260128044251.1229702-1-longman@redhat.com>
 <20260128044251.1229702-3-longman@redhat.com>
 <08c3fad6-b881-4089-b081-bde6efbafbd2@huaweicloud.com>
 <a6f6a5f6-ca71-424d-a56f-96a896a151ae@redhat.com>
 <11d8ff97-74e5-440e-b56a-af590da5a3f6@huaweicloud.com>
 <80842353-e054-4c70-a560-f67401c5b4a2@redhat.com>
 <7a67b419-1f94-441d-9d15-66dce03f9268@huaweicloud.com>
Content-Language: en-US
In-Reply-To: <7a67b419-1f94-441d-9d15-66dce03f9268@huaweicloud.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 1/29/26 8:42 PM, Chen Ridong wrote:
>
> On 2026/1/30 9:35, Waiman Long wrote:
>> On 1/29/26 7:56 PM, Chen Ridong wrote:
>>> On 2026/1/30 5:16, Waiman Long wrote:
>>>> On 1/29/26 3:01 AM, Chen Ridong wrote:
>>>>> On 2026/1/28 12:42, Waiman Long wrote:
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
>>>>>> call housekeeping_update() without holding the cpus_read_lock()
>>>>>> and cpuset_mutex. One way to do that is to introduce a new top level
>>>>>> isolcpus_update_mutex which will be acquired first if the set of isolated
>>>>>> CPUs may have to be updated. This new isolcpus_update_mutex will provide
>>>>>> the need mutual exclusion without the need to hold cpus_read_lock().
>>>>>>
>>>>>> As cpus_read_lock() is now no longer held when
>>>>>> tmigr_isolated_exclude_cpumask() is called, it needs to acquire it
>>>>>> directly.
>>>>>>
>>>>>> The lockdep_is_cpuset_held() is also updated to check the new
>>>>>> isolcpus_update_mutex.
>>>>>>
>>>>> I worry about the issue:
>>>>>
>>>>> CPU1                CPU2
>>>>> rmdir
>>>>> css->ss->css_killed(css);
>>>>> cpuset_css_killed
>>>>>                   __update_isolation_cpumasks
>>>>>                   cpuset_full_unlock
>>>>> css->flags |= CSS_DYING;
>>>>> css_clear_dir(css);
>>>>> ...
>>>>> // offline and free do not
>>>>> // get isolcpus_update_mutex
>>>>> cpuset_css_offline
>>>>> cpuset_css_free
>>>>>                   cpuset_full_lock
>>>>>                   ...
>>>>>                   // UAF?
>>>>>
>>> Hi, Longman,
>>>
>>> In this patch, I noticed that cpuset_css_offline and cpuset_css_free do not
>>> acquire the isolcpus_update_mutex. This could potentially lead to a UAF issue.
>>>
>>>> That is the reason why I add a new top-level isolcpus_update_mutex.
>>>> cpuset_css_killed() and the update_isolation_cpumasks()'s unlock/lock sequence
>>>> will have to acquire this isolcpus_update_mutex first.
>>>>
>>> However, simply adding isolcpus_update_mutex to cpuset_css_killed and
>>> update_isolation_cpumasks may not be sufficient.
>>>
>>> As I mentioned, the path that calls __update_isolation_cpumasks may first
>>> acquire isolcpus_update_mutex and cpuset_full_lock, but once cpuset_css_killed
>>> is completed, it will release the “full” lock and then attempt to reacquire it
>>> later. During this intermediate period, the cpuset may have already been freed,
>>> because cpuset_css_offline and cpuset_css_free do not currently acquire the
>>> isolcpus_update_mutex.
>> You are right that acquisition of the new isolcpus_update_mutex should be in all
>> the places where cpuset_full_lock() is acquired. Will update the patch to do
>> that. That should eliminate the risk.
>>
> I suggest that putting isolcpus_update_mutex into cpuset_full_lock, since this
> function means that all the locks needed have been acquired.
>
> void cpuset_full_lock(void)
> {
> 	mutex_lock(&isolcpus_update_mutex);
> 	cpus_read_lock();
> 	mutex_lock(&cpuset_mutex);
> }
>
> void cpuset_full_unlock(void)
> {
> 	mutex_unlock(&cpuset_mutex);
> 	cpus_read_unlock();
> 	mutex_unlock(&isolcpus_update_mutex);
> }

That is what I had done.

Cheers,
Longman

>
> In the __update_isolation_cpumasks function, we can pair:
>
> ```
> 	...
> 	mutex_unlock(&cpuset_mutex);
> 	cpus_read_unlock();
> 	... Actions
> 	cpus_read_lock();
> 	mutex_lock(&cpuset_mutex);
> 	...
> ```
>

