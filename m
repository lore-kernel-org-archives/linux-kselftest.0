Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 523352E03E4
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Feb 2026 18:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770056509; cv=none; b=bm5E1nZAIkyKyb6RfHZfQqV+n8Ou6XRkooh03QSZZZVDjeuqV7uJ8L2lFbfaaFBKrh0+FvZ9QK1+iLN0BwqyQ8p6PNMuqD1irqu1j15nYfZcmqETbrxN/zp8/zE5hcpivQaDrTrC7I+S6yGNclGql8nDHvi0147sSLd1cBE/vbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770056509; c=relaxed/simple;
	bh=ZgFPpzWS2e4pSmnR8N9TBShnHKYDmbpBdWZEJxThLWI=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=YvW9Ylfewjc4QS8+Sro50Oi9/LQBgxx4P+y82I2IUqqPO1SvmZezeRVNHFHiVNGevXKTTogBvi9v9D2TMU7JpTP9KQMtlBV0UVbr3PmknvIR1i2jscNj1c3TH6LwF4CY0AlBKHH4ieQHTuPo5XcqTIg3OHbTeRBcj+zyzHUp3GE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Gw+Ln7ht; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=MW4uBhmr; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Gw+Ln7ht";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="MW4uBhmr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770056507;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mJfpaXz7AFF7IJW/W7RDCIALtDcgndOMABwDoErkBSU=;
	b=Gw+Ln7htsdEGetNh+JUpA4stq+Y3jt4Q5xhlAzlox1bhKVX2M5q5fJ5Oh4tQ5TokhvcwHV
	uOResSQYqt06OgB402pRGyl7Rrxhnm3KjefQrydCc1liQjqQyOnccrlVACn0X0xrQnGCfi
	pUwt2Bbki8bFohxuscZtLuaSyQMkddQ=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-367-cDUmZ07PPou9HFj_P7XBNQ-1; Mon, 02 Feb 2026 13:21:46 -0500
X-MC-Unique: cDUmZ07PPou9HFj_P7XBNQ-1
X-Mimecast-MFC-AGG-ID: cDUmZ07PPou9HFj_P7XBNQ_1770056505
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50333a8184aso155053451cf.1
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Feb 2026 10:21:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1770056505; x=1770661305; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mJfpaXz7AFF7IJW/W7RDCIALtDcgndOMABwDoErkBSU=;
        b=MW4uBhmrw3fZt/ZtudRo2Tx0kAoKg1OuZ3O/19wOzfXpsf4pVpHZ1LoztO7PxgzXTt
         vlUM+qIEH3yMvErA8/b+KVrHCh6ZJD9cTeCMJtspQ72DUZR9p3b1EDB6LKG4GZboC8fS
         O/h6wUAOptPxNaGdCEcIglnM3psWbI2bM0M/BqbRmSPWwtMA8PMc2QkOxFJwOsX9Tx0q
         FMty19Hx7jwOlBKRVxA9RULCNa7vF0GoTW6jIHxG1ys/uq2b9SNuewl9PiaxT4k/6ayn
         T2RrReGzHf85mVxOr4bqbzen2gHEerBAx5r0HrynZniVB7ryOj3KhpIxd2LQFv8VdADz
         WBqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770056505; x=1770661305;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mJfpaXz7AFF7IJW/W7RDCIALtDcgndOMABwDoErkBSU=;
        b=lQSLpOjGFGN/adUnlsfiFNxg4gKGsx80O420520X5dAi/ALIExImr9AVyBIOykgEDd
         JRiJgGdGhIJxM5vNL9xep9kWMsTbu2apc2L2w7mSmklvLL/YOP68Af2DHx2dZvoI3yGz
         GcFixhHktYXOpivIJLzfUSKqbl3akqBvVEjoGFGcsf2zlMGMEwVL7MBenq00oXw0Tf+U
         abXzEeRM22iU7EPiqOq0GzkrDD3kels09KX4ypxQUJ0H0L3Fe+ZbUDTK6vZpMSOkd6bV
         jhvpP1YNPsjl6afa4Mht5CFtM0tDmrb5zB2NwsaLjyvW/OBtoKageK7wnKAHBxBs8vP+
         SHfA==
X-Forwarded-Encrypted: i=1; AJvYcCXLMC+KhpqvHrWLpyq1YxK5E3Lo2P0TUshQsksC3g5wsSqTTabf4zFjk4Zhzl70XUUKvIDY6NWu6nL0Dw2TdEg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqVgL36PFIUW5eHxj1J1rfL/h9tJPlhqYBsXtdfCdXH3/QIPP8
	1eGzXgiiK4XEiD2fAmdMRaabLoOdFaLWmkyZw+72O2XS2v/WGvY0jfWT4+Vhr14PFkDphir7nDe
	s1zygBT66DWySQvszYAn5urRAJSd8xkaSvq5/UTqhfmeYbStY5/lFPthRZ1ab2TvOfio5ZQ==
X-Gm-Gg: AZuq6aLPjAkF7ZkRrNHF+5pdMBG9HcStUWA1Yzh/3BTpmfYHmlmJKyJm4smJ5CAfRLF
	Huk4RcNDWEuTHXoKmcyzNEYAbP5Fo9v5Lbyd6KpXPQSwBFdo6afM/V0M2kbw8Jf0yTdzFYJVl+u
	48LHddcSR3nogrvWHaQPgoxI05s/xAvfAQtYVgRo5T3kygLZh87w22gTwFInz/+TsWOzG7pynFq
	Atq0pEsDK2n3LBHKASHibTV5wgMPKYxRmHe0YpJpjroOZFGllKUIOSlro7UZERJOcwnplEk1tsN
	waW73pjm0GHEZ8pCwsA6Jlza31nGIo92ZP2sy5kljU09eRNSZqwic07P4Wkc3OYaMVju2Hc30Lj
	hg6XneX0jpmmWKX2H8d6156V5GKm+95rp6KaZ+y/9sQ2Mi07YEHmxtS9w
X-Received: by 2002:ac8:580d:0:b0:501:40af:96cb with SMTP id d75a77b69052e-505d229cca2mr164744191cf.58.1770056505582;
        Mon, 02 Feb 2026 10:21:45 -0800 (PST)
X-Received: by 2002:ac8:580d:0:b0:501:40af:96cb with SMTP id d75a77b69052e-505d229cca2mr164743941cf.58.1770056505216;
        Mon, 02 Feb 2026 10:21:45 -0800 (PST)
Received: from ?IPV6:2601:188:c102:b180:1f8b:71d0:77b1:1f6e? ([2601:188:c102:b180:1f8b:71d0:77b1:1f6e])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50337cbdc24sm114980071cf.32.2026.02.02.10.21.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 10:21:44 -0800 (PST)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <ca4e6c43-2bf3-42b9-91eb-dfce4777b5da@redhat.com>
Date: Mon, 2 Feb 2026 13:21:43 -0500
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH/for-next v2 1/2] cgroup/cpuset: Defer
 housekeeping_update() call from CPU hotplug to workqueue
To: Peter Zijlstra <peterz@infradead.org>
Cc: Chen Ridong <chenridong@huaweicloud.com>, Tejun Heo <tj@kernel.org>,
 Johannes Weiner <hannes@cmpxchg.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?=
 <mkoutny@suse.com>, Ingo Molnar <mingo@redhat.com>,
 Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 Anna-Maria Behnsen <anna-maria@linutronix.de>,
 Frederic Weisbecker <frederic@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Shuah Khan <shuah@kernel.org>,
 cgroups@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20260130154254.1422113-1-longman@redhat.com>
 <20260130154254.1422113-2-longman@redhat.com>
 <20260202130526.GE1395266@noisy.programming.kicks-ass.net>
Content-Language: en-US
In-Reply-To: <20260202130526.GE1395266@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/2/26 8:05 AM, Peter Zijlstra wrote:
> On Fri, Jan 30, 2026 at 10:42:53AM -0500, Waiman Long wrote:
>
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
>> -	ret = housekeeping_update(isolated_cpus);
>> -	WARN_ON_ONCE(ret < 0);
>> +	/*
>> +	 * This function can be reached either directly from regular cpuset
>> +	 * control file write (cpuset_locked) or via hotplug (cpus_write_lock
>> +	 * && cpuset_mutex held). In the later case, we defer the
>> +	 * housekeeping_update() call to the system_unbound_wq to avoid the
>> +	 * possibility of deadlock. This also means that there will be a short
>> +	 * period of time where HK_TYPE_DOMAIN housekeeping cpumask will lag
>> +	 * behind isolated_cpus.
>> +	 */
>> +	if (!cpuset_locked) {
> I agree with Chen that this is bloody terrible.
>
> At the very least this should have:
>
> 	lockdep_assert_held(&cpuset_mutex);
>
> But ideally you'd do patches against this and tip/locking/core that add
> proper __guarded_by() annotations to this.

Yes, I am going to remove cpuset_locked in the next version. As for 
__guarded_by() annotation, I need to set up a clang environment that I 
can use to test it before I will work on that. I usually just use gcc 
for my compilation need.

Cheers,
Longman

