Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C80330BBAE;
	Thu, 12 Mar 2026 10:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773312206; cv=none; b=Qj7dxrE2AP1BFvUz7l39OYGnzRqcLRvdfuHWoEHh0TqD/6t2VtKEyVBWqK0K82efj2QJxJviM/8pg8bbEBrlYrZWRnFbu8kgKfbL84R4HHaYCRRftXr4qJ968Gg+eujXbH/rwMQFrCbXlewRinIYUNrAIwL2nrBmB63ZgRnTCIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773312206; c=relaxed/simple;
	bh=YCBlqxxnOAMGf2Xexw6U+LSklYYemB/E1HrhyJk0Kes=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Fo1kjD0w9sV/N4UQlJ/oAgt7mMx07ndcmLIJXe0vj6+rBU0Jo/GdWbDDrh+0SOashy7dkQY/s12Au6ME69ZlIb6irpCfWzmfPEulAmznyI7e8jrZn9dfGNDnBSd/Jn4AQBHII+Rw44LJ0Ii0EY9Xn2QtQnoT3mhvtFNgbvvQdlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 25A87165C;
	Thu, 12 Mar 2026 03:43:17 -0700 (PDT)
Received: from [10.1.32.88] (e127648.arm.com [10.1.32.88])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5D2DA3F694;
	Thu, 12 Mar 2026 03:43:20 -0700 (PDT)
Message-ID: <6e2ac024-04d1-43e9-b209-939e622724d8@arm.com>
Date: Thu, 12 Mar 2026 10:43:18 +0000
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 5/7] selftests/sched: Add SCHED_DEADLINE bandwidth
 tests to kselftest
From: Christian Loehle <christian.loehle@arm.com>
To: Juri Lelli <juri.lelli@redhat.com>
Cc: Shuah Khan <shuah@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Vincent Guittot
 <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Valentin Schneider <vschneid@redhat.com>,
 Clark Williams <williams@redhat.com>, Gabriele Monaco <gmonaco@redhat.com>,
 Tommaso Cucinotta <tommaso.cucinotta@santannapisa.it>,
 Luca Abeni <luca.abeni@santannapisa.it>, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20260306-upstream-deadline-kselftests-v1-0-2b23ef74c46a@redhat.com>
 <20260306-upstream-deadline-kselftests-v1-5-2b23ef74c46a@redhat.com>
 <129bb66c-74fa-4795-8d79-6c8e10a66e17@arm.com>
 <abFsuvsmEdoypYs4@jlelli-thinkpadt14gen4.remote.csb>
 <da6b6b85-25f1-4b22-9638-d68b161331a4@arm.com>
 <1d09f674-0c0b-47fc-abaf-6db6b01c775c@arm.com>
Content-Language: en-US
In-Reply-To: <1d09f674-0c0b-47fc-abaf-6db6b01c775c@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/11/26 14:26, Christian Loehle wrote:
> On 3/11/26 13:44, Christian Loehle wrote:
>> On 3/11/26 13:23, Juri Lelli wrote:
>>> On 11/03/26 09:31, Christian Loehle wrote:
>>>> On 3/6/26 16:10, Juri Lelli wrote:
>>>
>>> ...
>>>
>>>>> +	/* Start one cpuhog per CPU at max bandwidth */
>>>>> +	printf("  Starting %d cpuhog tasks at max bandwidth...\n", num_cpus);
>>>>> +
>>>>> +	for (i = 0; i < num_cpus; i++) {
>>>>> +		pids[i] = dl_create_cpuhog(runtime_ns, deadline_ns, period_ns, 0);
>>>>> +		if (pids[i] < 0) {
>>>>> +			printf("  Task %d failed to start: %s\n",
>>>>> +			       i + 1, strerror(errno));
>>>>> +			goto cleanup;
>>>>> +		}
>>>>> +		started++;
>>>>> +	}
>>>>
>>>> Would it be okay to just have one task per max-cap CPU to make this pass on HMP?
>>>> Or something more sophisticated?
>>>>
>>>
>>> On HMP we should probably have max bandwidth hogs on big CPUs and then
>>> scale runtime (bandwidth) considering smaller CPUs capacities. Cannot
>>> quickly check atm, but that info (max cap per-CPU) is available
>>> somewhere in sys or proc, is it?
>>
>> Yes it's here:
>> /sys/devices/system/cpu/cpu0/cpu_capacity
>>
>> FWIW I've attached the two patches to get a pass out of arm64 HMP.
> 
> Wait nevermind, this isn't right, this would expect a 10 CPU system with
> [1024, 128, 128, 128, 128, 128, 128, 128, 128, 128]
> = 2176
> would allow for 2 1024-equivalent hogs, but that is obviously wrong as
> the capacity -> bandwidth calculation must be capped in practice by
> only summing the k-highest-cap-CPUs if there's only k deadline-tasks.
> 
> Let me go and read how this is actually supposed to work.

Nevermind the nevermind, it's a bit counterintuitive because we specifically
test this edgecase here but my original proposal is fine...

if you're still taking suggestions, I think a test with hotplugging and
bandwidth would be nice, too:

-Fill to max, verify extra admission fails.
-Kill one task, offline one CPU, verify offline succeeds.
-Try respawn while CPU is offline, verify admission fails.
-Online CPU again, verify respawn succeeds.
