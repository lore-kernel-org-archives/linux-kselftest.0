Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C39F328638
	for <linux-kselftest@vger.kernel.org>; Mon,  9 Feb 2026 20:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770670084; cv=none; b=PjCCEne8OYbSArX/YOTHJtHiKo4sg6Ir5g/bRrxeCEJBl3/+thQb7TrTZa+zNiXzss1EyB/ErFDJKndkCHl7NxC8aBCiIgZ5sh1BZ7I68oVEVErIQjimVoA+rUc6XvkzEHhtK0rPCEwFyfwvV2Niav9ktWbFMmmh684eyT4mqrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770670084; c=relaxed/simple;
	bh=zB0TgsTqPOUZ6c7fcWiP0FVWOC8g2W9dhEAU3gPWMZw=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Nm/x8+5ji48+uE4E7me2jdlon8rU+s2JeSQxYR8bCOsfST5XvZ/awfDpFT6UO0yi8y70TXxLNIayJQ7Cb8SIaOb8PN5wDj832rc85PHn0U40+VQwAobCm8LTnMEEnkEOx59juSBy/sABsL4jZ8bygW7iqeh97aYq5y3qYMEUOUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XL2PHiLY; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=IPTip7RA; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XL2PHiLY";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="IPTip7RA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770670082;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BFz2HHJO0flQkCT+EP3v58+8Capft4jJvp38xn9xVew=;
	b=XL2PHiLYMlSoygtPJbgAEcpDCMoBR4y5QSx/gn/TArqBJlWFbso53srxlWAsoq2q358jvW
	5hZQSJ34OWR3sRVb8ewwrv8OUI0QeOnqhkSmUpJBmLcC3UtPVMg3zsrd5xD1zo4Da9BKzw
	5gisXEO30HKymCvoLnKx2T+aijQcSqA=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-17-tVCx908_OhyTxrCFRW822w-1; Mon, 09 Feb 2026 15:48:00 -0500
X-MC-Unique: tVCx908_OhyTxrCFRW822w-1
X-Mimecast-MFC-AGG-ID: tVCx908_OhyTxrCFRW822w_1770670080
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8950562d351so206889686d6.3
        for <linux-kselftest@vger.kernel.org>; Mon, 09 Feb 2026 12:48:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1770670080; x=1771274880; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BFz2HHJO0flQkCT+EP3v58+8Capft4jJvp38xn9xVew=;
        b=IPTip7RALhcWS1iOeWM31mDs2IqIGhbfZ1vGqU4dHCijywTpZCSa3jpGiW9cdAKTuv
         1tpIm+FrB5gcUls0SOX1YwtKvWcjTy59CVQVm0cYM1sq98iK9ipVKTrQMuvbMhySppsH
         esXfm4q20Lp9HXvO5QrI1NxZ858z3t+A/lRjEAuaLoxT2q1+Af/pXZ3BGuM73d5RhhZV
         fzZCg/7bCD9ED/YiXt4G2yXGe/jB5VJLyCvC2hVS+j0cTDVBwUAojERZM96nb9EtBiae
         Ui2/vnaHbZYlLBMHjNJrpIrEM57FuX3LDJCjSFr6yIXJnhMOEUbjPAiGleCAUPMZcENy
         1ncw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770670080; x=1771274880;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BFz2HHJO0flQkCT+EP3v58+8Capft4jJvp38xn9xVew=;
        b=KVTH0ZoUfpu2RMQzwWG2YKqISdUD1PoVIValAsIOKyVKo56/bG0ZnF4qddjTPJcO22
         AJacw/z1iCEFtqxZI5TQ4ve90S6KQ/Iuz54eFm0y8ER7wkdhWNsBiGax34kijF50rF3+
         E6rfXdLTmQEib/Env+fXG/sUtjGK+VFNoIjWVNzEXTfQPE13NCMWbdjxVYuqMd5hR5uO
         29fF9vtG/Dv+GOilFmcseCYVOD4M5UgOx3baYmM0j6PPx0brGNslDPbO9CEb8wIsrv9/
         CXFXRIre+S6+plXwOxlXwTFh/tIQJwrDswjJsfjezolexhC7n4vjoWYiADd8T/FX9L4t
         qRYg==
X-Forwarded-Encrypted: i=1; AJvYcCUsHOdUrK7L6CIb0nsLEvPdfbKdWbmbx+O6C4l5dmNx/DUAfZ5DrhZvdn4MNam0yRM5gU5R3QyAhpzJ2jCdMF8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxyXHXTg8G+R0DMyR0n1iVDrwPKrfXDzDv9B6uds/gV4+sEU7yN
	4E0QHNBnI/P5kZmN/c8tbvuv132mMWdzsfoCY590G6h6R6ukQu2HVdBKVuftWgcC/RAewRUtQEI
	+2CU1AeDnHWUCO5tWj2yPmGuTH+KGSEOuYVS1M+OyfalhTPdBpev4Jmz6F9Ibw7zbrR4hCw==
X-Gm-Gg: AZuq6aJtoTEHcPdZsz2EL9zy0mmRENcG/9+xfWabdN4rqzPWuN0t7Tslm683WeZFzZr
	qgNGBlvDAaYF/QCvYT7nKrIlK9ZzyosH1TCwcW+LPWTBDWkyEa3QFhW4jjnoXrgkyZt4BTld9Tm
	dhBiFqzA2y4LVoua5f/sZpaj6xom4zRi4rzYs4hfpLR2r0J51N9/SR9JRyhsO0i/sEzab90xrlI
	Nn75d0Ild1XMtK7ACFR+AyW0YPxkXKhwu6y33gZop6ThTpw30zAdEbMVUKe7U8Dcz0F7NXX0sOV
	tIhhrBasJIE9zf5Vcc8s0jg6KqsOlX0+KG6mLScmEqwCXGZVe9nxFnBshNiPkjVLQqRl98WBirS
	RGVWHJDFOEaGgkOu76OoeyM/G8umoEm9Ohb6Kd7GS72jKcm0Kl21OtJnS
X-Received: by 2002:a05:620a:3723:b0:8c6:d309:8801 with SMTP id af79cd13be357-8caf1bc28e0mr1629154685a.86.1770670080253;
        Mon, 09 Feb 2026 12:48:00 -0800 (PST)
X-Received: by 2002:a05:620a:3723:b0:8c6:d309:8801 with SMTP id af79cd13be357-8caf1bc28e0mr1629150585a.86.1770670079848;
        Mon, 09 Feb 2026 12:47:59 -0800 (PST)
Received: from ?IPV6:2601:188:c102:b180:1f8b:71d0:77b1:1f6e? ([2601:188:c102:b180:1f8b:71d0:77b1:1f6e])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8caf982b811sm952627885a.29.2026.02.09.12.47.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Feb 2026 12:47:59 -0800 (PST)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <8d140b06-4e90-4c58-90dd-61aa5d1cbd5c@redhat.com>
Date: Mon, 9 Feb 2026 15:47:58 -0500
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH/for-next v4 4/4] cgroup/cpuset: Eliminate some duplicated
 rebuild_sched_domains() calls
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
 <20260206203712.1989610-5-longman@redhat.com>
 <da363ddb-c006-4ff8-a327-5ef75045d3fd@huaweicloud.com>
Content-Language: en-US
In-Reply-To: <da363ddb-c006-4ff8-a327-5ef75045d3fd@huaweicloud.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2/9/26 2:53 AM, Chen Ridong wrote:
>
> On 2026/2/7 4:37, Waiman Long wrote:
>> Now that we are going to defer any changes to the HK_TYPE_DOMAIN
>> housekeeping cpumasks to either task_work or workqueue
>> where rebuild_sched_domains() call will be issued. The current
>> rebuild_sched_domains_locked() call near the end of the cpuset critical
>> section can be removed in such cases.
>>
>> Currently, a boolean force_sd_rebuild flag is used to decide if
>> rebuild_sched_domains_locked() call needs to be invoked. To allow
>> deferral that like, we change it to a tri-state sd_rebuild enumaration
>> type.
>>
>> Signed-off-by: Waiman Long <longman@redhat.com>
>> ---
>>   kernel/cgroup/cpuset.c | 20 ++++++++++++++------
>>   1 file changed, 14 insertions(+), 6 deletions(-)
>>
>> diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
>> index d26c77a726b2..e224df321e34 100644
>> --- a/kernel/cgroup/cpuset.c
>> +++ b/kernel/cgroup/cpuset.c
>> @@ -173,7 +173,11 @@ static bool		isolcpus_twork_queued;	/* T */
>>    * Note that update_relax_domain_level() in cpuset-v1.c can still call
>>    * rebuild_sched_domains_locked() directly without using this flag.
>>    */
>> -static bool force_sd_rebuild;			/* RWCS */
>> +static enum {
>> +	SD_NO_REBUILD = 0,
>> +	SD_REBUILD,
>> +	SD_DEFER_REBUILD,
>> +} sd_rebuild;					/* RWCS */
>>   
>>   /*
>>    * Partition root states:
>> @@ -990,7 +994,7 @@ void rebuild_sched_domains_locked(void)
>>   
>>   	lockdep_assert_cpus_held();
>>   	lockdep_assert_cpuset_lock_held();
>> -	force_sd_rebuild = false;
>> +	sd_rebuild = SD_NO_REBUILD;
>>   
>>   	/* Generate domain masks and attrs */
>>   	ndoms = generate_sched_domains(&doms, &attr);
>> @@ -1377,6 +1381,9 @@ static void update_isolation_cpumasks(void)
>>   	else
>>   		isolated_cpus_updating = false;
>>   
> If isolated_hk_cpus is defined, I believe isolated_cpus_updating becomes redundant.
Note that they have different exclusion rules. Other than that, you are 
right that "!cpumask_equal(isolated_hk_cpu, isolated_cpus)" should be 
equivalent to isolated_cpus_updating. But because of the different 
exclusion rules, there are restriction on where you can use one or the 
other.
>
>> +	/* Defer rebuild_sched_domains() to task_work or wq */
>> +	sd_rebuild = SD_DEFER_REBUILD;
>> +
> There is a potential issue: we defer all domain rebuilds here, including those
> triggered by hotplug events which may change the isolation state.
>
> The problem is that functions like cpuset_cpu_active, which rely on the
> scheduler domains being up-to-date—will, also be delayed. Is that okay?

No, we are not deferring all domain rebuilds. We are just deferring 
domain rebuilds that involves changes in the set of isolated CPUs. 
Domains rebuild will still happen if there is no changes in the set of 
isolated CPUs. I need to take a further to investigate if this is a 
problem or not. Anyway s suggested in my reply to Federic, I am 
considering to not changing isolated_cpus due to hotplug events. In that 
case, this problem should be gone.

Cheers,
Longman

