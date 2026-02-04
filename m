Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF60129C325
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Feb 2026 04:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770180426; cv=none; b=DHe0uhAK+hoGGHfCOEFQKSDXtb2MGWm+xMEEmVjbXzKd9XhTIwD9u28is1bt9NJ5ygYzLDVsvEelFqgf77Lt0BPYFayP64X2gexH+YEAI+X3rlyY8mvP03mGEUTDOW2N+TsvVy2Oh+NxuYvLZZ3Q+AHhVNUuH7WDlLjkPILqcZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770180426; c=relaxed/simple;
	bh=rLaRsKu7CREx5s6WYnmkbwSOEU+GT9F+qtG079ipLls=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=PaIqSjt1bhAs7Qh4hj5drAf0jwzhaNjreuy/0lum6SeCVaNOfNmcWmPrjEc7YqoDls4lSL1UqEYUxN3ONga7CJdcGWlvsJY6kmDtzI+/YHjrIu6tDiQsJT8WSjoIT4T75bDJHFNYmLFbQFYp7UGvZ25MhJwATcWaDBdyTYSVH60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=U4sXaOyV; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=q7TMnUtl; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="U4sXaOyV";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="q7TMnUtl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770180424;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3Y69ODIoURgASqSeV5hS5rWlgMMnpQL1tFExn4zKMhQ=;
	b=U4sXaOyViNSG89fS1tPa8XQLQX59JLbi3xTkKbGmvmtTxSnAkXUjOgwKSqqA+JZjReq18o
	wqIbZp9b4to0b/4V8kxa4QNE4L946bY8CWkzU456etcWFAJLEfriVRv+wWcgigPD5Xfv+e
	eOstd03M6i6/UGb/DOt2tcXd4jAup5c=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-6-f78cCP7UM9K34O4Liz53fA-1; Tue, 03 Feb 2026 23:47:03 -0500
X-MC-Unique: f78cCP7UM9K34O4Liz53fA-1
X-Mimecast-MFC-AGG-ID: f78cCP7UM9K34O4Liz53fA_1770180423
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-88a39993e5fso16652196d6.3
        for <linux-kselftest@vger.kernel.org>; Tue, 03 Feb 2026 20:47:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1770180423; x=1770785223; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3Y69ODIoURgASqSeV5hS5rWlgMMnpQL1tFExn4zKMhQ=;
        b=q7TMnUtlLpR71OVK5RBkXvhVFslYIer3Xjk6uD94PVju8pZsHHDJK3aZR17nir5LfF
         cL0vI6BZK0giaecQla+3OcyXvy+lAQJg0ngGa1EtaAG5w+42Ia30CKZPltc4DqhGYs5a
         /plzFsLGqbSdsCTcGqK4DquF9NQv0HPErfUCSIuOjWA9ZslXetgjxALYykIt/Zc9RhoH
         ne2MDXncSiNInnHq3OQAumAaDxEVmOLTCeFjSqdqWER6U8MQTqApO0u1rSoUt1poV4Vb
         UhM0rwKQvGRfVLtzopFcht1ho1lS9hgVJgj7x1Er6UbkDN3USsX3BzTgFMupHOUxZ5lL
         GNfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770180423; x=1770785223;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3Y69ODIoURgASqSeV5hS5rWlgMMnpQL1tFExn4zKMhQ=;
        b=giYgi0rj5smdv3FrYj8OuUCWuVuH+cMgxJFQiNRihHrYcY5lQij3b9UUk+ssbbn1Fz
         iVHFDpeccA3TbhlH2/eBF5VOnYygcsuRMzM4Ptvmbk42/yBUqhHJNfBwnYS82HO3OgsC
         Hs3xp3nc1y+GAOHOrV1C85y795mzwUOO6/YpdltGK1tLk4RvAj6Sjx2ChR5Pkx2GyBE6
         EMHvlrKIblJqcKoInOjcSUlRauIWlTlqUEXPEsTjtNRWCZG2DGJ2m6tks4hItuEG9KK5
         RaJxVs82bKE0gDB/Q4uz+Ga+rglpoS5jify6ZvCvWaxao3lwsp2Hkj4qQ09gGwYQy7Cv
         Etaw==
X-Forwarded-Encrypted: i=1; AJvYcCUQ05NN7x8vNX+uQ4JfA/wzFzr6kWU3/Gj6IeayQUzfOkGx2WmD/eP0WhPZZ3ZxUSeYRQwT97wN+GEtqOtzOAk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyatoViY+rY/SY15a+9x6RI35lxYwJhV1T2zkXHhvoO8tt7xfm0
	VzkPHebLkQ2/iJd7pRefmzer3rLqNYIWgWrm/hB2mcWTuXC+C/0veQz4YsfHVHk2dPJGKY84WNR
	mutU3/17F3frAwjLawVvUM9mi0CjtPNZ3X3SRRZXJNAVRxzElhYE7GfrpRbR92LZkfr/T6g==
X-Gm-Gg: AZuq6aIeTq7tBKDuJHoj9PN3XedvCY63XparKIhXuX4tsyLd4rqXt8a49ZUE/uwVpg/
	4Mrajwmx6xz08eYaZp6P3XRo1iYD10MJPSUTkHqb9f17mtAj4oQhI3EekPSvobGvfh6oHzIdOoG
	JGhIhjNf79UG8mGZVP9kQsMGe80nznHexojlW3GeqtIu6EDy+Xvsnf++ZdK/gQeRAGJqx7yyoA+
	TxE3aLUqEWxaMZepxyXt6aOaOhYCxt9rSZyFC4Cef6jfEzp+w64RGTXOthZZBTjbDlh6zR6tCDe
	dQyvNxNm9ZEVynn6Q70lbSNeCQuV9I43bmPV2AvwTKQMWB7Sj+VFJ7KrsLWoHb78/hSTri9KkeI
	QRcBCu4ThdA064IK4HKTmJOgxJgp8TJ8m1QhEnqr6C1ojYtw23vn5GgJH
X-Received: by 2002:a05:620a:4805:b0:8c5:38ee:2fad with SMTP id af79cd13be357-8ca2fa5ea0amr230627085a.84.1770180423170;
        Tue, 03 Feb 2026 20:47:03 -0800 (PST)
X-Received: by 2002:a05:620a:4805:b0:8c5:38ee:2fad with SMTP id af79cd13be357-8ca2fa5ea0amr230625685a.84.1770180422748;
        Tue, 03 Feb 2026 20:47:02 -0800 (PST)
Received: from ?IPV6:2601:188:c102:b180:1f8b:71d0:77b1:1f6e? ([2601:188:c102:b180:1f8b:71d0:77b1:1f6e])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89521d2788asm11831606d6.47.2026.02.03.20.47.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Feb 2026 20:47:02 -0800 (PST)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <83d0426d-92ea-4e2b-83bc-62998218b212@redhat.com>
Date: Tue, 3 Feb 2026 23:47:00 -0500
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH/for-next v3 3/3] cgroup/cpuset: Call housekeeping_update()
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
References: <20260202201144.1669260-1-longman@redhat.com>
 <20260202201144.1669260-4-longman@redhat.com>
 <1fff6bd2-b62a-48d9-9408-af3b5552815e@huaweicloud.com>
Content-Language: en-US
In-Reply-To: <1fff6bd2-b62a-48d9-9408-af3b5552815e@huaweicloud.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/3/26 9:51 PM, Chen Ridong wrote:
>
> On 2026/2/3 4:11, Waiman Long wrote:
>> --- a/kernel/time/timer_migration.c
>> +++ b/kernel/time/timer_migration.c
>> @@ -1559,8 +1559,6 @@ int tmigr_isolated_exclude_cpumask(struct cpumask *exclude_cpumask)
>>   	cpumask_var_t cpumask __free(free_cpumask_var) = CPUMASK_VAR_NULL;
>>   	int cpu;
>>   
>> -	lockdep_assert_cpus_held();
>> -
>>   	if (!works)
>>   		return -ENOMEM;
>>   	if (!alloc_cpumask_var(&cpumask, GFP_KERNEL))
>> @@ -1570,6 +1568,7 @@ int tmigr_isolated_exclude_cpumask(struct cpumask *exclude_cpumask)
>>   	 * First set previously isolated CPUs as available (unisolate).
>>   	 * This cpumask contains only CPUs that switched to available now.
>>   	 */
>> +	guard(cpus_read_lock)();
>>   	cpumask_andnot(cpumask, cpu_online_mask, exclude_cpumask);
>>   	cpumask_andnot(cpumask, cpumask, tmigr_available_cpumask);
>>   
> It may lead to lockdep issue.
>
> tmigr_init_isolation
> 	guard(cpus_read_lock)()
> 	tmigr_isolated_exclude_cpumask(cpumask)
> 		guard(cpus_read_lock)()
>
Good catch. I haven't set up "isolcpus" in my test environment. That is 
why this lockdep splat didn't get triggered. I will fix that in the next 
version.

Cheers,
Longman

