Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5C4B3659F1
	for <linux-kselftest@vger.kernel.org>; Tue, 10 Feb 2026 14:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770732098; cv=none; b=YVVfv+FSqj3OFcEFlDx8l1lfb3k5FojPNVrTOYzdhCVzYwqhWlcWWzpzZZWaOJVL6xQiYXLz3nNqsaSM3b9TeOF4PysM5UA2FbbjRv6c/+5C4MLSM+6sG/Kb48TOzx8wopV3vN7fpmwV87bxuONt7M0EGAHx2KjGABZDJdClEfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770732098; c=relaxed/simple;
	bh=8jtpoSXYbybLE/xY+++ZpfTrLk7i+XgUcjmGEmd16hk=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=SYByAGnIMrfDx/oiR390op6GjtVBqCvcv2+RjffCdxbTqYShtEVQ/deOcRuhngf8jZfPH0rO+3Un7O9/AlAwgs5WKlM3xlYEo4Uefi1Wzjw41RHtKLu1oiHa7oVYWs2cCpADmo0RGM+EcnQj2BtSDViiJWYcXxQb/uZYQQn7lgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bQ7zG47c; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=EGAt55st; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bQ7zG47c";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="EGAt55st"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770732096;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z4inRA1URPkZFbtOlGH7PVCQZlyxkjMU1G2/KzimKDM=;
	b=bQ7zG47cxy0sb+oKXIkQYdvrEvbolkq/by+JtbtTZHyqdPhVJUtxHkpSOKMT9lHidom6vM
	wezOvbmfRQ60oke7EsIaKnLVWmTcB+lT2pN7dCjnSawfCSsRCobHNxjITHFTnrdPJMtzmM
	dgDhOGqwJEB3GGZl7N5HetgXV6SqIR4=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-587-LoL1tMf3Pk6IQVHSDkTpgg-1; Tue, 10 Feb 2026 09:01:34 -0500
X-MC-Unique: LoL1tMf3Pk6IQVHSDkTpgg-1
X-Mimecast-MFC-AGG-ID: LoL1tMf3Pk6IQVHSDkTpgg_1770732094
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c6a2ef071dso1694732685a.0
        for <linux-kselftest@vger.kernel.org>; Tue, 10 Feb 2026 06:01:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1770732094; x=1771336894; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Z4inRA1URPkZFbtOlGH7PVCQZlyxkjMU1G2/KzimKDM=;
        b=EGAt55stvuzxJLnWnG9qId/vP4iNR3vbl/fqeJsdJuj8i3qlPfgHC+Kzu1nguqpFd/
         yvEMd2n4um+VTiEyUohWgTaYvjVYid5nYXobEmGV3wrF1+SM0oShbZNGfSJ3OVOd2doa
         zBCyLP6eFblSOhF42PTMNmMTxQ2IyobCgu07OTb+jtUb0A6wXMPNHqpOGAgMNHZGTtr6
         RRXw+3Q5CT7I3oIIGC3CdmULw7g0LdZMDILLn1y1/aJ3jY0LY8WaGe2sOWWN+Co3ZxN/
         LRNonOlZsXt1LAYweb86Ns8Q2Gr79tgTDoLWuqM1dZ1GTXGN41gKSO1u3i5XRJD99eC9
         AS/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770732094; x=1771336894;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z4inRA1URPkZFbtOlGH7PVCQZlyxkjMU1G2/KzimKDM=;
        b=oDDQkn5/8ylIcrh97gPykckeqgsrzY5adGn2qZbAo7dDdXJoe4/A9rwzmDdOeLOfnR
         1n4SqRYIDXOYnpI/CcmJm5LgcKURkdVHv4EGGKVDaznbS9UUgZqT0SOXVCPsd4rLuhid
         ahtYBW9MMNCf1/59ynDqpbIIX9vk+RWuKVfINeg0biYqLUoEJV2bNhYrVGef9cd7hVfo
         3aQMWvZ2Q32VTmcvG1GDPa9SnEDqZv6wg9xIDypGrxPbfvaV7YsvpO5wLgke3tp47sZV
         UlJYXZJL9mmR2DXuBIJ+ncw8mhaMgTAuGsSXe6+suCgML6O7vIEj55GPzhAd3XVBG7vf
         cG1Q==
X-Forwarded-Encrypted: i=1; AJvYcCV21WEVTooO1xJmAJO2PM3z9TEH3UwIJMOMqq1mq8Lwh89sLlbUEjIFuUD+EsaglLs1YtajXBySya1IxYrqDxg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6Vh+9IiFKwsFCzdjrujALqCd62l6X84+xjeg5p8bzyxf2DJmz
	ec5XJTYQPmsQrIZ8I+oMEQ0pPbimotVbbkOo+wKpI62LVNsgrMdNfG5AsQUzBhK/7bmXp22aMcN
	4sgXxNH+cRL/c01D1nFMBh3DVLDh9YgnW7Re9feBDZnolHB9ICj4w89kTDikLg2JTgtGeqg==
X-Gm-Gg: AZuq6aLmtaHXTOjTq+F2+mTBbQIM+qFXH3Krwa/05zNjGJ34babq0pFaqaKDpxeiGU2
	29em69nK6aeZsCcbUj6B2STisj/1XZIUMJl3r2VQbhfnZ9aEsyeNMa08AuXeod8Jijm9Flc0uOB
	eFomTtV5fusp0AzMy38ZQIrbKAN35etxlgkAVZiuf9LFNPbskTxNnPyYtyNSKehVlP6mLXraabC
	XwH3gUdeuj3BdNqRzIJyvreH++qjfHNg8u56IsMeAE029zrDiZx+i1UoeVT9BMMH2LU6mrLz7iU
	oRBNj9c56VonS+emlH5CnWmWP1Av0ej8DNLx8dsRvxZxuokROvqyV92v95BN5Y17wIF/5Yo0Pzv
	WOM18Qz5kFNZmmurxzeH7oouI27ofdpwbUtiGASMUZd/Az85CpddPtrUNnRuZw2yon49u
X-Received: by 2002:a05:620a:bc5:b0:8bb:26db:e22f with SMTP id af79cd13be357-8caef7e1ca2mr1823855485a.30.1770732093698;
        Tue, 10 Feb 2026 06:01:33 -0800 (PST)
X-Received: by 2002:a05:620a:bc5:b0:8bb:26db:e22f with SMTP id af79cd13be357-8caef7e1ca2mr1823851485a.30.1770732093249;
        Tue, 10 Feb 2026 06:01:33 -0800 (PST)
Received: from ?IPV6:2601:188:c102:b180:1f8b:71d0:77b1:1f6e? ([2601:188:c102:b180:1f8b:71d0:77b1:1f6e])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8caf9a15a4dsm1023079185a.25.2026.02.10.06.01.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Feb 2026 06:01:32 -0800 (PST)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <6552b863-6d2b-4537-8155-d87985e77628@redhat.com>
Date: Tue, 10 Feb 2026 09:01:30 -0500
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH/for-next v4 3/4] cgroup/cpuset: Call housekeeping_update()
 without holding cpus_read_lock
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
References: <20260206203712.1989610-1-longman@redhat.com>
 <20260206203712.1989610-4-longman@redhat.com>
 <e9c4aae2-44ed-42f5-9b4b-b63d59915143@huaweicloud.com>
 <eee7862c-45ac-4acc-b8a7-a560fc21d9b4@redhat.com>
 <f1c47301-58a6-425b-b248-913a2a7dbaf9@huaweicloud.com>
Content-Language: en-US
In-Reply-To: <f1c47301-58a6-425b-b248-913a2a7dbaf9@huaweicloud.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2/9/26 8:29 PM, Chen Ridong wrote:
>
> On 2026/2/10 4:29, Waiman Long wrote:
>> On 2/9/26 2:12 AM, Chen Ridong wrote:
>>>>            return;
>>>>        }
>>>>    -    WARN_ON_ONCE(housekeeping_update(isolated_cpus) < 0);
>>>> -    isolated_cpus_updating = false;
>>>> +    /*
>>>> +     * update_isolation_cpumasks() may be called more than once in the
>>>> +     * same cpuset_mutex critical section.
>>>> +     */
>>>> +    lockdep_assert_held(&cpuset_top_mutex);
>>>> +    if (isolcpus_twork_queued)
>>>> +        return;
>>>> +
>>>> +    init_task_work(&twork_cb, isolcpus_tworkfn);
>>>> +    if (!task_work_add(current, &twork_cb, TWA_RESUME))
>>>> +        isolcpus_twork_queued = true;
>>>> +    else
>>>> +        WARN_ON_ONCE(1);    /* Current task shouldn't be exiting */
>>>>    }
>>>>    
>>> Timeline:
>>>
>>> user A            user B
>>> write isolated cpus    write isolated cpus
>>> isolated_cpus_update
>>> update_isolation_cpumasks
>>> task_work_add
>>> isolcpus_twork_queued =true
>>>
>>> // before returning userspace
>>> // waiting for worker
>>>              isolated_cpus_update
>>>              if (isolcpus_twork_queued)
>>>                  return // Early exit
>>>              // return to userspace
>>>
>>> // workqueue finishes
>>> // return to userspace
>>>
>>> For User B, the isolated_cpus value appears to be set and the syscall returns
>>> successfully to userspace. However, because isolcpus_twork_queued was already
>>> true (set by User A), User B's call skipped the actual mask update
>>> (update_isolation_cpumasks).
>>> Thus, the new isolated_cpus value is not yet effective in the kernel, even
>>> though User B's write operation returned without error.
>>>
>>> Is this a valid issue? Should User B's write be blocked?
>> It is perfectly possible that isolated_cpus can be modified more than one time
>> from different tasks before a work or task_work function is executed. When that
>> function is invoked, isolated_cpus should contain changes for both. It will copy
>> isolated_cpus to isolated_hk_cpus and pass it to housekeeping_update(). When the
> It is clear about isolated_hk_cpus and isolated_cpus.
>
>> 2nd work or task_work function is invoked, it will see that isolated_cpus match
>> isolated_hk_cpus and skip the housekeeping_update() action. There is no need to
>> block user B's write as only one task can update isolated_cpus at any time.
>>
> The main question remains: user B receives a success return even though
> isolated_hk_cpus has not yet taken effect (i.e.,
> /sys/devices/system/cpu/isolated does not reflect the change). In that case, how
> can user B confirm whether their configuration is actually applied?

task_work function is synchronous. IOW, if a user writes to a cpuset 
control file to modify an isolated partition, when control is passed 
back to userspace, it is guaranteed that the task_work function, if 
queued, would have been executed.

wq work function, OTOH, is asynchronous. So if a user brings down an 
isolated CPU to make an isolated partition invalid, the supposed changes 
to the sched domains may not be completed by the time the offline 
operation returns. However this is an operation that normal users 
shouldn't do in a production system anyway and they are taking their own 
risk if they try to do it.

Cheers,
Longman

