Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 086FD37FF5B;
	Tue, 17 Mar 2026 08:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773735789; cv=none; b=msU/1xIgxcNNA3UXq672zl0WDKvZQqEUmwp1mqSUp6HuT3R0uguchL+GrzR8/2Wb+GLL0EOU3L3s4BykiYKcej5pRBZyXHLuMviJRmYOWPvLF1DTs8qW3BIWceFLWpSIqzg+8mERHl1lHZ8tiwDLEtnk1i/vW7FqRykOC0qe7Mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773735789; c=relaxed/simple;
	bh=+F76O8aBvA0EcbPwPKP5h7Vtzr+YIb11ETrRnddDRv4=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=PgRfVzoOSFd1gWxuw0dqpEzJ3n/6HrlzVwYBs4e79sQP6Mh5jYQ7gCQ1KDki5pKT39vERpq33jTkAF7pb+/9V1h4UfmFPz2CpvEEscsdBN7Lri8CUriUYI8LEy4xFgFyaZzZYcwEUgP1+NAco4gH279K62O3CMgGuCf1NuOlKjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1DC611476;
	Tue, 17 Mar 2026 01:23:00 -0700 (PDT)
Received: from [10.1.36.21] (e127648.arm.com [10.1.36.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2559A3F7BD;
	Tue, 17 Mar 2026 01:23:02 -0700 (PDT)
Message-ID: <31280e71-3924-43dd-8dbb-494cb7a3e988@arm.com>
Date: Tue, 17 Mar 2026 08:23:00 +0000
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] sched_ext: Prevent SCX_KICK_WAIT deadlock by
 serialization
From: Christian Loehle <christian.loehle@arm.com>
To: Tejun Heo <tj@kernel.org>
Cc: sched-ext@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, void@manifault.com, arighi@nvidia.com,
 changwoo@igalia.com, mingo@redhat.com, peterz@infradead.org,
 shuah@kernel.org, dietmar.eggemann@arm.com
References: <20260316100249.1651641-1-christian.loehle@arm.com>
 <20260316100249.1651641-2-christian.loehle@arm.com>
 <abhB4bCsvd9WDxid@slm.duckdns.org>
 <d0d1d1fa-7ba3-456d-b2a9-cc3f550e2cf1@arm.com>
Content-Language: en-US
In-Reply-To: <d0d1d1fa-7ba3-456d-b2a9-cc3f550e2cf1@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/16/26 22:26, Christian Loehle wrote:
> On 3/16/26 17:46, Tejun Heo wrote:
>> Hello,
>>
>> On Mon, Mar 16, 2026 at 10:02:48AM +0000, Christian Loehle wrote:
>>> @@ -5686,11 +5718,20 @@ static void kick_cpus_irq_workfn(struct irq_work *irq_work)
>>>  		 * task is picked subsequently. The latter is necessary to break
>>>  		 * the wait when $cpu is taken by a higher sched class.
>>>  		 */
>>> -		if (cpu != cpu_of(this_rq))
>>> +		if (cpu != this_cpu)
>>>  			smp_cond_load_acquire(wait_kick_sync, VAL != ksyncs[cpu]);
>>
>> Given that irq_work is executed at the end of IRQ handling, we can just
>> reschedule the irq work when the condition is not met (or separate that out
>> into its own irq_work). That way, I think we can avoid the global lock.
>>
> I'll go poke at it some more, but I think it's not guaranteed that B actually
> advances kick_sync if A keeps kicking. At least not if the handling is in HARD irqwork?
> Or what would the separated out irq work do differently?

So in my particular example I do the SCX_KICK_WAIT in ops.enqueue(), which is fair, but
I don't think we can delay calling that until we've advanced our local kick_sync and if we
don't we end up in the deadlock, even if e.g. we separate out the retry (and make that lazy),
because then the local CPU is able to continuously issue new kicks (which will have to
be handled by the non-retry path) without advancing it's own kick_sync.
The closest thing to that I can get working is separating out the SCX_KICK_WAIT entirely and
make that lazy. In practice though that would realistically make the SCX_KICK_WAIT latency
most likely a lot higher than with the global lock, is that what you had in mind?
Or am I missing something here?
