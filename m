Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 581EA2116F6
	for <linux-kselftest@vger.kernel.org>; Sat, 31 Jan 2026 01:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769821600; cv=none; b=XTNR9RJ/SM0TrB/wAgCCd3ca9XS7wtlsomkB0sRQItPunCUOeDy2q6ACMs6v6q3ZuPNtcTR0jQFp4RHLDB4WaKSmf3YbuqAA0v+d50AdGM6roM1gLSnhNeDvIAFBOzeEXDgftbbEJOd5tkg56/s6A9H8ipEcdLb4hmEs7d2Mpn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769821600; c=relaxed/simple;
	bh=hjkJO9AF/LXMyOiJVDONfSzEwUsiDo4mFqbrrwjp2UA=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=OnpHD2+ZeVCUgNnrLS52fVlrxB0/cicN/IXUxNGJxYmU8GiXQBgVnH5H1Hu+8sqXbu1t974A4TOsV51bFv/TvwLeZVR/weLJd1AwxLBDrWbikRwfchuhsD4hyFJoFuK7+kk/E3sOS045RaVVx9IsCzY/f8aAnQumLgbJ6llpbw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MLWIUT1G; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=J+37nhW4; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MLWIUT1G";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="J+37nhW4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769821598;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UfiEsrEnIyZn47cTgetgAoM39/5k7SlYmbXzGHOjknE=;
	b=MLWIUT1Gfmhy7qFCRKlFJLqEAAkdvN+ogeJCOy475MAVzXWo55JqtOF6y5v0Z2hr4XbR8E
	fJP9EJUf2c0xSfF2utpwMkEzRXQpiFArhOR7rRVep8JzTX1Y5dQm+zphPFE6n1ZLhOwLYp
	bJHqaCpzUs/u2HSUhqwRrc14u1VUCoQ=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-141-U2SeNDsjNreh-HyW87FvVw-1; Fri, 30 Jan 2026 20:06:36 -0500
X-MC-Unique: U2SeNDsjNreh-HyW87FvVw-1
X-Mimecast-MFC-AGG-ID: U2SeNDsjNreh-HyW87FvVw_1769821596
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5014c9ee70bso76507931cf.1
        for <linux-kselftest@vger.kernel.org>; Fri, 30 Jan 2026 17:06:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1769821596; x=1770426396; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UfiEsrEnIyZn47cTgetgAoM39/5k7SlYmbXzGHOjknE=;
        b=J+37nhW43kxW5Onq4pBuIq93dKVjMcju5C1H77w7dlTGDdO4sZS+ogdgF+Cool9MY3
         RWq++qLxsLGBvycjEYJsj0SoZI2bzAVaGqZiw7f/9KZPtB/EUjrTHLHWMtuvus25NAA2
         Z3EyouqN9ThspjYHrLQfYVph1OIkXjW68udlz2cm0r3112b+lZY1uAuayO3BpE1JwET1
         TcHYEHOd4qfYYqHOqa+zgvld2z1qBklvrmzCNYqxnmXj3pg2b4y0PD1GlSTZThkSWZBz
         WZKCV+DwmnzUAGv/ZuHztLyJRDyQRjpFLaFjmikfuwNGJDUdSIy5JiQZ13QNN339eBSk
         ROKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769821596; x=1770426396;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UfiEsrEnIyZn47cTgetgAoM39/5k7SlYmbXzGHOjknE=;
        b=oeU6Ga5+IU1bBTwo/l3OPGhTJN95RUDOaJF6nUlk2AzG0lMsnDidsO7vIGFwyw5hkL
         zXB06mmlI192MKxH8xxn19ro0RvqC88Z5Obh6ZUB4C524xE5vQGsH8Yyb/ZjbY/Ek1Kl
         DtrFdmPIhsDzQaPyXxTfRf1709ry6e3EXU8Z9NQrVPc2MNg9QBIDdl5ipyH2E3CGmB9F
         CNZqZqqN4ry5NtRhjHtF3RDIN5F7YfNIfPQNs+jDHgeW44LerYOtYoEDenRIclpAMYSM
         ixs0l/ZkjO5p5YKjWB5CkHNb3DYeqTmK6kaXmQOgeyUAL3+0Fwwz8aDGE+m0gLFC2I63
         Wd7w==
X-Forwarded-Encrypted: i=1; AJvYcCUJI1i7bq4JEmEbtuiGIamEZjetSN+agKqKdJ4eE1eGv1zebjsVzzoG0KcJedxOVCXK525BnokdtKzKx9bl69w=@vger.kernel.org
X-Gm-Message-State: AOJu0YyystiTxuULKxLS8NuaDwCpNTqLDsRSXVCsLL4dBrlw3zDn2d0S
	o04UjLzsUcPJa+x3WgG3DZQN7rqqL1RdhFtmnPBQjWTPXTUNIt+awgcmJ9nVi13+zowaWTwHV9+
	3A+LsvY9wsLO5n+esPV/XiAfvwnSbWzlnUyjlqxFInIx2lQl0sXRTWRl9DMcNabc35AQ+hQ==
X-Gm-Gg: AZuq6aJ6UQ1Md1E/Qr14gkGbG5dxLkTkKYk08a2uCnlQf04pAl5GQmqrJ7jEzDWW8iy
	BjmT3JzsXTEu9yPdpiRD20gbajxHyLWCDwxYRnUwxMyK63fRDlYICdGYoca/vdkX5Oq5R1BY1tY
	0r9JMn1LIFa1b08WKorQlp2BPjFcxZF4zTjed5FU37qDG6u55d0EZQ1MQ6IGWJZZycGk2N1EXLz
	joRh9xIBmt7AoPT5w3ikEs80an7fUIMqPdmVJ07qnPADChj8w018AqMbJ5XxkQf9uNaqKZ80PRS
	d5LH40YJCj1etqULnIKFUovDk7KeLuc+MQTse0YvUBbGNAEOJrxHINvAnRfzqkVrxa6FBNQCLao
	4xpdHNL/IZtkaP0Pbj2xpfigfy72KRA72RaqplHb8YcmbWVn1KZaI0qwm
X-Received: by 2002:a05:622a:1aa4:b0:4ee:1563:2837 with SMTP id d75a77b69052e-505d22b37edmr55615541cf.67.1769821595988;
        Fri, 30 Jan 2026 17:06:35 -0800 (PST)
X-Received: by 2002:a05:622a:1aa4:b0:4ee:1563:2837 with SMTP id d75a77b69052e-505d22b37edmr55615151cf.67.1769821595544;
        Fri, 30 Jan 2026 17:06:35 -0800 (PST)
Received: from ?IPV6:2601:188:c102:b180:1f8b:71d0:77b1:1f6e? ([2601:188:c102:b180:1f8b:71d0:77b1:1f6e])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-894d3740d73sm69079846d6.27.2026.01.30.17.06.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jan 2026 17:06:35 -0800 (PST)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <fb95620d-1178-4452-a837-297e71f68599@redhat.com>
Date: Fri, 30 Jan 2026 20:06:33 -0500
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH/for-next v2 1/2] cgroup/cpuset: Defer
 housekeeping_update() call from CPU hotplug to workqueue
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
References: <20260130154254.1422113-1-longman@redhat.com>
 <20260130154254.1422113-2-longman@redhat.com>
 <647ad3d2-364c-4e83-b46d-49a2a30b8f94@huaweicloud.com>
Content-Language: en-US
In-Reply-To: <647ad3d2-364c-4e83-b46d-49a2a30b8f94@huaweicloud.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 1/30/26 7:47 PM, Chen Ridong wrote:
>
> On 2026/1/30 23:42, Waiman Long wrote:
>> The update_isolation_cpumasks() function can be called either directly
>> from regular cpuset control file write with cpuset_full_lock() called
>> or via the CPU hotplug path with cpus_write_lock and cpuset_mutex held.
Note this statement.
>>
>> As we are going to enable dynamic update to the nozh_full housekeeping
>> cpumask (HK_TYPE_KERNEL_NOISE) soon with the help of CPU hotplug,
>> allowing the CPU hotplug path to call into housekeeping_update() directly
>> from update_isolation_cpumasks() will likely cause deadlock. So we
>> have to defer any call to housekeeping_update() after the CPU hotplug
>> operation has finished. This is now done via the workqueue where
>> the actual housekeeping_update() call, if needed, will happen after
>> cpus_write_lock is released.
>>
>> We can't use the synchronous task_work API as call from CPU hotplug
>> path happen in the per-cpu kthread of the CPU that is being shut down
>> or brought up. Because of the asynchronous nature of workqueue, the
>> HK_TYPE_DOMAIN housekeeping cpumask will be updated a bit later than the
>> "cpuset.cpus.isolated" control file in this case.
>>
>> Also add a check in test_cpuset_prs.sh and modify some existing
>> test cases to confirm that "cpuset.cpus.isolated" and HK_TYPE_DOMAIN
>> housekeeping cpumask will both be updated.
>>
>> Signed-off-by: Waiman Long <longman@redhat.com>
>> ---
>>   kernel/cgroup/cpuset.c                        | 37 +++++++++++++++++--
>>   .../selftests/cgroup/test_cpuset_prs.sh       | 13 +++++--
>>   2 files changed, 44 insertions(+), 6 deletions(-)
>>
>> diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
>> index 7b7d12ab1006..0b0eb1df09d5 100644
>> --- a/kernel/cgroup/cpuset.c
>> +++ b/kernel/cgroup/cpuset.c
>> @@ -84,6 +84,9 @@ static cpumask_var_t	isolated_cpus;
>>    */
>>   static bool isolated_cpus_updating;
>>   
>> +/* Both cpuset_mutex and cpus_read_locked acquired */
>> +static bool cpuset_locked;
>> +
>>   /*
>>    * A flag to force sched domain rebuild at the end of an operation.
>>    * It can be set in
>> @@ -285,10 +288,12 @@ void cpuset_full_lock(void)
>>   {
>>   	cpus_read_lock();
>>   	mutex_lock(&cpuset_mutex);
>> +	cpuset_locked = true;
>>   }
>>   
>>   void cpuset_full_unlock(void)
>>   {
>> +	cpuset_locked = false;
>>   	mutex_unlock(&cpuset_mutex);
>>   	cpus_read_unlock();
>>   }
>> @@ -1285,6 +1290,16 @@ static bool prstate_housekeeping_conflict(int prstate, struct cpumask *new_cpus)
>>   	return false;
>>   }
>>   
>> +static void isolcpus_workfn(struct work_struct *work)
>> +{
>> +	cpuset_full_lock();
>> +	if (isolated_cpus_updating) {
>> +		WARN_ON_ONCE(housekeeping_update(isolated_cpus) < 0);
>> +		isolated_cpus_updating = false;
>> +	}
>> +	cpuset_full_unlock();
>> +}
>> +
>>   /*
>>    * update_isolation_cpumasks - Update external isolation related CPU masks
>>    *
>> @@ -1293,14 +1308,30 @@ static bool prstate_housekeeping_conflict(int prstate, struct cpumask *new_cpus)
>>    */
>>   static void update_isolation_cpumasks(void)
>>   {
>> -	int ret;
>> +	static DECLARE_WORK(isolcpus_work, isolcpus_workfn);
>>   
>>   	if (!isolated_cpus_updating)
>>   		return;
>>   
> Can this happen?
>
> cpu0					cpu1
> [...]
>
> isolated_cpus_updating = true;
> ...
> // 'full_lock' is not acquired
> update_isolation_cpumasks
That is not true. Either cpus_read_lock or cpus_write_lock and 
cpuset_mutex are held when update_isolation_cpumasks() is called. So 
there is mutual exclusion.
> 					// exec worker concurrently
> 					isolcpus_workfn
> 					cpuset_full_lock
> 					isolated_cpus_updating = false;
> 					cpuset_full_unlock();
> // This returns uncorrectly
> if (!isolated_cpus_updating)
> 	return;
>
Cheers,
Longman

