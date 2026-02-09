Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A41335093
	for <linux-kselftest@vger.kernel.org>; Mon,  9 Feb 2026 20:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770668998; cv=none; b=gTNYAk6DaR7PA+rSfk//nFdqfCrCczosGKvCGXo87A/9FvluidG/eB1+PvEcZphyrFiTtE03ermngVH4OpX8OI+X9DPtkHMINtlqBQhWIiG7Z5xDqJQS89cXb5jIX0QEO353pX0p4NS5o96zGyWlU1bOS3BEb7mMglJSiW1aOMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770668998; c=relaxed/simple;
	bh=uOQ1iJTNh4itbyivBrcSFJsOviveJLlP91rw+cfXPjM=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=uUPgvJG7Z3nuYuCRsy5VaOcXWMufWcg34QeADhLqmNpOZUAxT+BkmAT34rO3g6HSaENh3fVej7NsDRFoZ4hkkZlcIvg4zz8VbflfeyF3kluTM+4UlP8qpeice/HUc4nNye4WmhM2J19FsZVNYvLNlTY93VQSLttjqNPKNjK22eE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SSciABx+; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=QI8TQC4T; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SSciABx+";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="QI8TQC4T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770668996;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m144+Nm1FYBPJelch2Iyvg4dZfxN/Ng3uIUGNUMGQXE=;
	b=SSciABx+jV2wt8PsE3+MvWM3GZhQg9y0yY6CKaahnBd6z9u13cFeuVjH1XdUYR9FrUygFs
	kVOnBjuMwtX45ulX1tfZ1D6y3M1YqnUDqWZkSvDOlP2bBq9Ip3LtvE4q0uvK5qzBqVEUbZ
	x3HOjqF7eEkCJ3SqRJHQnzdpShxJxOo=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-657-JfOcmZXGMvyjYGwev3vxbw-1; Mon, 09 Feb 2026 15:29:55 -0500
X-MC-Unique: JfOcmZXGMvyjYGwev3vxbw-1
X-Mimecast-MFC-AGG-ID: JfOcmZXGMvyjYGwev3vxbw_1770668995
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5033b62efa7so155901811cf.1
        for <linux-kselftest@vger.kernel.org>; Mon, 09 Feb 2026 12:29:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1770668995; x=1771273795; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=m144+Nm1FYBPJelch2Iyvg4dZfxN/Ng3uIUGNUMGQXE=;
        b=QI8TQC4TVYrV90pymXpkkxoy3IwZsxk9suraAcznvtipFy6O/Vp0+smZU/R2KeY8iQ
         SgkHhxeknaV0XP3awEerg4n9nbQPYeIPPePZEcA7ODzvqjJ34uGlI9UbvyPMhKkmZmSS
         NtqNVEYG3hq4Mm2Q4NyIuFgY59+HAAt6uokD+ux/MdikkwRDYVooEQPSYp2P/iXJ7pGA
         M0G8+fOZvza0NM80jYAvuoi0D4880CnQ0SCx+YgCFNAj8pBV7RQ23Qhg+ovZb1ZXtxBc
         4vEFS3bIYtdxXdi7cnEPTHSND6k6PGvwh55OlwFq1gce3jLbeUlCFk0IKRILdlFJ0jYl
         yOmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770668995; x=1771273795;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m144+Nm1FYBPJelch2Iyvg4dZfxN/Ng3uIUGNUMGQXE=;
        b=nd4+rlnOMEU8I4Ob5tsgt3bLCj3Aj3nzaIsDA0wpEZFupBT7kJErGB/zfBzmmBXqMF
         SVw5R7DON8Fq6HRbQSjQvovnwemnp2b4pjHJLRpNhUyTeFwgCe4V1UtYlZ1Z03+9XIP+
         9UjFYeHYq8c1pRb8AG/JLFKoX7CV8hXf2ROZ9kBaroOrdPwRt9NzBIOzrgpmnrirgzBb
         dwpXw+mOu1uiNNLpjlPvzLkJJL9d2wIbjSbI2BKkzQS5MKfkuiK6UPCfDt85Xw085e9g
         ZTJo+lhj7gTXeB+7EZbP12jNtHM+pvspqhW5aS5ooF+wB2FjnYDPp0PZdrR0s6Gx6fie
         2NmA==
X-Forwarded-Encrypted: i=1; AJvYcCVgr5odUz3ssh9PpZhMx9PClEEUZWqf/IVQqGYTW00IrRTH6l71AgSw/vtNFBSD2Mst5K1L+urANstMA0ENfEs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1DiMY//94Vqme5m0E89hBaeGZFkLmmhPtdusWBiSuf94sm1Lt
	3YMHk7ZJXSOTTNu9weTWBwwyDTMcJM3x7vZbZSBtQJqJZnovPQMnjAH4x55zuhnfuPJ4R8kxzCp
	LCjRO2wEV1+UTsUCY2E8SoVRKvgHm3qTyUFqAMQ8oibPRIEJ2ojQpLk+vu9RgnAb2wBbLbQ==
X-Gm-Gg: AZuq6aL5n1BUFkxTQAesQ0DxHKlzmKXuQ2c3t5Mx93jTSftdUkb/S0c2oQUn1ilJkex
	bNWxXjvPFpnZAnlmPRtNNFhxN1PiCIgZpb0WKsJGw8Cb0lHX8fPVhYIp59Cr2Zya9zZY1XdbTmU
	nvEAwAoqNb0zRLa1IvzvWxG5NC6Bf23EQsR2d5pvkMmEn2G94q6qv4ZyTNVGHF/7S6ubEus1T6u
	NK17ZFWp7s9dTHGQk0oX4ckkdfk7zPT47sJ0hCTWRhLtY/i/GaiT9fdVtK4FFc3zZ61n5rgjxOS
	UK1Lkrn9s2dxghIyV6obNWaNmKZOfV/Dp4kzuKJONI6jiC64NXKa+lG7cI2lEriWwV4mu/1C0go
	mj8h8IyIxmDAn6rHNo07uaXZ7+xhYFZ5CQa1kO6yhyGb7lmtIl8RjWyq8
X-Received: by 2002:ac8:758c:0:b0:4f1:aa2d:81cd with SMTP id d75a77b69052e-5064340d6d3mr99568191cf.65.1770668994905;
        Mon, 09 Feb 2026 12:29:54 -0800 (PST)
X-Received: by 2002:ac8:758c:0:b0:4f1:aa2d:81cd with SMTP id d75a77b69052e-5064340d6d3mr99568121cf.65.1770668994443;
        Mon, 09 Feb 2026 12:29:54 -0800 (PST)
Received: from ?IPV6:2601:188:c102:b180:1f8b:71d0:77b1:1f6e? ([2601:188:c102:b180:1f8b:71d0:77b1:1f6e])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-506392c3f5esm82410191cf.26.2026.02.09.12.29.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Feb 2026 12:29:53 -0800 (PST)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <eee7862c-45ac-4acc-b8a7-a560fc21d9b4@redhat.com>
Date: Mon, 9 Feb 2026 15:29:52 -0500
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH/for-next v4 3/4] cgroup/cpuset: Call housekeeping_update()
 without holding cpus_read_lock
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
References: <20260206203712.1989610-1-longman@redhat.com>
 <20260206203712.1989610-4-longman@redhat.com>
 <e9c4aae2-44ed-42f5-9b4b-b63d59915143@huaweicloud.com>
Content-Language: en-US
In-Reply-To: <e9c4aae2-44ed-42f5-9b4b-b63d59915143@huaweicloud.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/9/26 2:12 AM, Chen Ridong wrote:
>>   		return;
>>   	}
>>   
>> -	WARN_ON_ONCE(housekeeping_update(isolated_cpus) < 0);
>> -	isolated_cpus_updating = false;
>> +	/*
>> +	 * update_isolation_cpumasks() may be called more than once in the
>> +	 * same cpuset_mutex critical section.
>> +	 */
>> +	lockdep_assert_held(&cpuset_top_mutex);
>> +	if (isolcpus_twork_queued)
>> +		return;
>> +
>> +	init_task_work(&twork_cb, isolcpus_tworkfn);
>> +	if (!task_work_add(current, &twork_cb, TWA_RESUME))
>> +		isolcpus_twork_queued = true;
>> +	else
>> +		WARN_ON_ONCE(1);	/* Current task shouldn't be exiting */
>>   }
>>   
> Timeline:
>
> user A			user B
> write isolated cpus	write isolated cpus
> isolated_cpus_update
> update_isolation_cpumasks
> task_work_add
> isolcpus_twork_queued =true
>
> // before returning userspace
> // waiting for worker
> 			isolated_cpus_update
> 			if (isolcpus_twork_queued)
> 				return // Early exit
> 			// return to userspace
>
> // workqueue finishes
> // return to userspace
>
> For User B, the isolated_cpus value appears to be set and the syscall returns
> successfully to userspace. However, because isolcpus_twork_queued was already
> true (set by User A), User B's call skipped the actual mask update
> (update_isolation_cpumasks).
> Thus, the new isolated_cpus value is not yet effective in the kernel, even
> though User B's write operation returned without error.
>
> Is this a valid issue? Should User B's write be blocked?

It is perfectly possible that isolated_cpus can be modified more than 
one time from different tasks before a work or task_work function is 
executed. When that function is invoked, isolated_cpus should contain 
changes for both. It will copy isolated_cpus to isolated_hk_cpus and 
pass it to housekeeping_update(). When the 2nd work or task_work 
function is invoked, it will see that isolated_cpus match 
isolated_hk_cpus and skip the housekeeping_update() action. There is no 
need to block user B's write as only one task can update isolated_cpus 
at any time.

Cheers,
Longman

