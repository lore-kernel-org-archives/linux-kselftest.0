Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8130B246BC5
	for <linux-kselftest@vger.kernel.org>; Sat, 21 Feb 2026 19:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771701523; cv=none; b=UA48B7AK6+a3akYTQ8J+woNAf14yovWVzeo76Hk0JxYAWW4kXF/hJtWxVdLbWoxHlB9B29px7GnWIMemK75u8HA3hXThdYh/B+7cBhzsGv8NGOV5+eRgA6hb8eTGtfTNxZJFBlkse7YxPQBASVkODxoBxHyu3wlD919anUXoJh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771701523; c=relaxed/simple;
	bh=y5yCMd2oa+DT/yk9AJ3rCQZW9RGjNj8Gsp2vP1DzXQI=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=WaO/n1yN+9y3W+xOmTm5ZejO+hijmKcXffbeCoJJm5vLE9gHAmFwPLgxoxguLAHgnfw/VNGZWqdH92IPD8rsstqVa99rrdeluqket1zkZwPPpSjsgkfgnRwRb4F0rw5aNleGxncx5Hkiod5ljPtI/gBWne76r14h/BTD+112c8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ekYvpL4u; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=HML46KRi; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ekYvpL4u";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="HML46KRi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1771701521;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hx8RfWzWYamghKcrDMA6FiyZYhfTQKUfitsZoNr3bPw=;
	b=ekYvpL4uMxsXQS+xh40tiXOgrtvjFD5Y19z8s++K0WfIfQthVqXWO8kKC5PIhcw6DQLEtB
	0NxmM3emx8B5wh9z1no6jLM+C3/Fv/F8IAKspgKu4Tr5boOens7rx/QTdjQjG3eyh8+l1e
	nny+SM9oTXsu5dJWcXmkldMFBa5WaLY=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-77-MqK1hHrFN-mTvN9lreEN3w-1; Sat, 21 Feb 2026 14:18:39 -0500
X-MC-Unique: MqK1hHrFN-mTvN9lreEN3w-1
X-Mimecast-MFC-AGG-ID: MqK1hHrFN-mTvN9lreEN3w_1771701519
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb4a241582so2658250385a.0
        for <linux-kselftest@vger.kernel.org>; Sat, 21 Feb 2026 11:18:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1771701519; x=1772306319; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hx8RfWzWYamghKcrDMA6FiyZYhfTQKUfitsZoNr3bPw=;
        b=HML46KRiydpyEPTTIzyW96oRcppOA6yWAsGRIoVgPm7b3ZU4+whoXz8SKNqK6Q0LdB
         bm0wFzEFwUfOcLaAWbZsS1sOF/mpQcHItoD7evB/m9FoTiouK6SK8ZU3Ppstz6X6sq9h
         GULvvTcdjlZZQ1LRel+KWJPvhg7J9Rs3AiXpxqHuNOPQHA9JkcTyIgs6kkGO0+BTZy2Y
         0ZYOYpDvq/Tv2RUIn2lvKqy5xM/BXNSDShPVBThpU1JhHANUXSV6X2SsXW1ziXHQjYZR
         qgfip+Jlr4uB2EQFcBexKgxI2MA9rgZT3xDOEyc16GgI0DW1jv2rUHEUiSlq5KdBQw2f
         YRnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771701519; x=1772306319;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hx8RfWzWYamghKcrDMA6FiyZYhfTQKUfitsZoNr3bPw=;
        b=Y3p0KnVhUKRb2xM/n3AAUssUhqhik8fULPrfBhvB0a8NUzK5TOcwkmHIm1cyLaGCon
         Bvl927E+xavty8g2vwmm6WK6ar9Ooc7DsZnTthTDZgctOi6XvJtAkDyzztWL6+KxxL2p
         RJuYV4WcpxIiCO0f5kWhXpZU2mUzqPMVEF65wawzUgBOXkhSN1X7nsdR5UEBZSwuihio
         XTXUGqnlIrWV95zcPWj4WGBMWQhqs2X1xL4mz7kaX3WNevod3Ehc5+JGHZiLVf5egGJb
         qTVXSy1855TmygYO1Rz+mk0mcOleYBXP2qOfJiVuWvdzWWeX63ULnZ+b99Q5x9wpWPsM
         7i8Q==
X-Forwarded-Encrypted: i=1; AJvYcCXdJgxILGb3l58uK8xh3jM8LKU/pYzuMpamw5WCv4wZ5vc4M37c0//yikayfXuG4cxHRkbH3OUX4ys9tIQdhEk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgK/xphd8i+bbiDmbn/pER8S9WSMk27b42vygLysntxKLrIf5N
	OFxGfmP/jRd4TmwG8Yd8kR/MGnI/2kdC6y8M+Fo7pgu3sQrpY19T2Qt6Hnml0KOdXUAIm+bDPGx
	OwMUUBAX9dx98h2spNCHwGaXlskH32dXgl92dbQvlhfDi7IzQ30nmTK4Z2SgPGoN3hBWJm61wKO
	YLkA==
X-Gm-Gg: AZuq6aKwJ5pES6uitZ0Bh/G2Yi52fkLrthgtRJTbBWrMN4hZqND7ksgaVzhGmJvimtF
	12yr/JTvaUzyg7evqF1vonrPYARsUJmBmNCMLgtbEgFLUwWP6La8Z4uzmPtHjCDtGQS65RRwz73
	hvdNMlxFZ0qw93r345ALm83wBM0vtRoPUm4r22mH4Wg3cPsjRbozvzqpAivmnJL7u3tVwleZBo0
	LIv3xZJom/KVQVuiBTPMeoOfhmRoVayv1Gim44TFHWQmAv2dTNOrcNVklveW60Fk4Dk/p7j38Xz
	4sxgQ3FcVLsy4PhePjcbs4h4lUvlvZx8Ns9i1CK4LgcRlG3ENO7LJ7XAsx7B2g/FaB5VWbYMAse
	bGRyDffUz0ciIARTqDLjZ2FMQneykSUwOW3ee5VanK5zzcu1zdckIo0+KKWO7uJIU3uyL
X-Received: by 2002:a05:620a:708b:b0:8c3:7f27:a65d with SMTP id af79cd13be357-8cb8c9fd136mr483933485a.28.1771701518686;
        Sat, 21 Feb 2026 11:18:38 -0800 (PST)
X-Received: by 2002:a05:620a:708b:b0:8c3:7f27:a65d with SMTP id af79cd13be357-8cb8c9fd136mr483929285a.28.1771701518176;
        Sat, 21 Feb 2026 11:18:38 -0800 (PST)
Received: from ?IPV6:2601:600:947f:f020:85dc:d2b2:c5ee:e3c4? ([2601:600:947f:f020:85dc:d2b2:c5ee:e3c4])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cb8d0460c9sm287647285a.5.2026.02.21.11.18.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Feb 2026 11:18:37 -0800 (PST)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <359310f9-216a-4f0b-8de5-02d9b0829b3e@redhat.com>
Date: Sat, 21 Feb 2026 14:18:34 -0500
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/6] cgroup/cpuset: Don't update isolated_cpus from CPU
 hotplug
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
References: <20260212164640.2408295-1-longman@redhat.com>
 <20260212164640.2408295-5-longman@redhat.com>
 <d77ef443-d816-4565-a9bc-e7e46c0a92c4@huaweicloud.com>
Content-Language: en-US
In-Reply-To: <d77ef443-d816-4565-a9bc-e7e46c0a92c4@huaweicloud.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/13/26 1:56 AM, Chen Ridong wrote:
>
> On 2026/2/13 0:46, Waiman Long wrote:
>> As any change to isolated_cpus is going to be propagated to the
>> HK_TYPE_DOMAIN housekeeping cpumask, it can be problematic if
>> housekeeping cpumasks are directly being modified from the CPU hotplug
>> code path. This is especially the case if we are going to enable dynamic
>> update to the nohz_full housekeeping cpumask (HK_TYPE_KERNEL_NOISE)
>> in the near future with the help of CPU hotplug.
>>
>> Avoid these potential problems by changing the cpuset code to not
>> updating isolated_cpus when calling from CPU hotplug. A new special
>> PRS_INVALID_ISOLCPUS is added to indicate the current cpuset is an
>> invalid partition but its effective_xcpus are still in isolated_cpus.
>> This special state will be set if an isolated partition becomes invalid
>> due to the shutdown of the last active CPU in that partition. We also
>> need to keep the effective_xcpus even if exclusive_cpus isn't set.
>>
>> When changes are made to "cpuset.cpus", "cpuset.cpus.exclusive" or
>> "cpuset.cpus.partition" of a PRS_INVALID_ISOLCPUS cpuset, its state
>> will be reset back to PRS_INVALID_ISOLATED and its effective_xcpus will
>> be removed from isolated_cpus before proceeding.
>>
>> As CPU hotplug will no longer update isolated_cpus, some of the test
>> cases in test_cpuset_prs.h will have to be updated to match the new
>> expected results. Some new test cases are also added to confirm that
>> "cpuset.cpus.isolated" and HK_TYPE_DOMAIN housekeeping cpumask will
>> both be updated.
>>
>> Signed-off-by: Waiman Long <longman@redhat.com>
>> ---
>>   kernel/cgroup/cpuset.c                        | 85 ++++++++++++++++---
>>   .../selftests/cgroup/test_cpuset_prs.sh       | 21 +++--
>>   2 files changed, 87 insertions(+), 19 deletions(-)
>>
>> diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
>> index c792380f9b60..48b7f275085b 100644
>> --- a/kernel/cgroup/cpuset.c
>> +++ b/kernel/cgroup/cpuset.c
>> @@ -159,6 +159,8 @@ static bool force_sd_rebuild;			/* RWCS */
>>    *   2 - partition root without load balancing (isolated)
>>    *  -1 - invalid partition root
>>    *  -2 - invalid isolated partition root
>> + *  -3 - invalid isolated partition root but with effective xcpus still
>> + *	 in isolated_cpus (set from CPU hotplug side)
>>    *
>>    *  There are 2 types of partitions - local or remote. Local partitions are
>>    *  those whose parents are partition root themselves. Setting of
>> @@ -187,6 +189,7 @@ static bool force_sd_rebuild;			/* RWCS */
>>   #define PRS_ISOLATED		2
>>   #define PRS_INVALID_ROOT	-1
>>   #define PRS_INVALID_ISOLATED	-2
>> +#define PRS_INVALID_ISOLCPUS	-3 /* Effective xcpus still in isolated_cpus */
>>   
> How about adding a helper?
>
> bool hotplug_invalidate_isolate(struct cpuset *cs)
> {
> 	if (current->flags & PF_KTHREAD) &&
>      		(cs->partition_root_state == PRS_INVALID_ISOLATED);
> }
>
I decided to revert back to the v4 way of deferring 
housekeeping_update() call to a workqueue to make it simple, but do it 
in a simple and straight forward way.

Thanks,
Longman


