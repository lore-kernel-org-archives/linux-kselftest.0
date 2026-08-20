Received: from mta0.migadu.com (out-98.mta0.migadu.com [91.218.175.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E65B637E5D8
	for <linux-kselftest@vger.kernel.org>; Thu, 20 Aug 2026 15:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787239181; cv=none; b=hVYakGtX6r/OELBYB/8rMv4Q4k3H7CpXcJB/FLXxvFZGpR9GZdC6kC95zK/FJBTbFRjRAbWiE3kpwMi+MSMN9IF6P+SWwkGFv7CAeQ2sqWTtqm9hu1YXNOPiMTiMrr+JQxyrIo0n/JrCDfR6/+gVqK7M0LL/vpKvixEIDXnQS4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787239181; c=relaxed/simple;
	bh=WSLjuukuP088A+TfnYgfrcCLirvGwUx+/owRyhgaCZw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fCXTI+CvGxCrSZhqZnyWuNxc05UU3IKFYkARjDHtiWWgYYFevJ3O7ZDAoi+LZ6otw3HP9r9qGFAfxVfXQFTdIropbLVwTxfFinngYPFqYeDZvyvq1AXnLdAhVFvF/rzZwO3sgBMI1wl8NtKr1NGGSqrT893jHwH+VEE/u/YRHxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=bTCs73RA; arc=none smtp.client-ip=91.218.175.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="bTCs73RA"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=WSLjuukuP088A+TfnYgfrcCLirvGwUx+/owRyhgaCZw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787239174; v=1; x=1787843974;
 b=bTCs73RAAMVbMWSDx0j5S1re40fuAqMyN65aqQ9Uitg7OrL7MzwF+5wTCeINQydgqaizzFbZ
 yw/C6jWh8RB+GeaSgvR3H67vwlmmVWk7Pn88yMl0W0t8GYPh9omEhCB6YN/SPrlYN6tadbzR/Ay
 dyw4OES9h90bwxrGGdTYR41w=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: from [IPV6:2a03:83e0:1126:4:9d:a05e:5bd8:c200] (2620:10d:c092:500::4:2d0d)
	by smtp.migadu.com with ESMTPS id a46be800631aa279;
	Thu, 20 Aug 2026 15:19:24 +0000
X-Mizu-Trace-ID: a46be800631aa279
X-Migadu-Flow: FLOW_OUT
Message-ID: <99a4d606-a53e-447e-951d-e356a97d16e9@linux.dev>
Date: Thu, 20 Aug 2026 16:19:18 +0100
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] futex: Avoid hash-bucket locking for mismatched waits
To: Thomas Gleixner <tglx@kernel.org>, Dmitry Ilvokhin <d@ilvokhin.com>
Cc: peterz@infradead.org, andrealmeid@igalia.com, dave@stgolabs.net,
 dvhart@infradead.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, mingo@redhat.com, shuah@kernel.org,
 shakeel.butt@linux.dev, hannes@cmpxchg.org, riel@surriel.com,
 kernel-team@meta.com
References: <20260805132831.2852771-1-usama.arif@linux.dev>
 <87jyq2dji5.ffs@fw13> <f4eaec7c-39f7-4040-b668-946de9c70941@linux.dev>
 <87y0e8lmih.ffs@fw13> <87v79clmfu.ffs@fw13>
Content-Language: en-US
From: Usama Arif <usama.arif@linux.dev>
In-Reply-To: <87v79clmfu.ffs@fw13>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 14/08/2026 17:02, Thomas Gleixner wrote:
> On Fri, Aug 14 2026 at 18:01, Thomas Gleixner wrote:
>> On Mon, Aug 10 2026 at 13:17, Usama Arif wrote:
>>> On 07/08/2026 16:42, Thomas Gleixner wrote:
>>>> On Wed, Aug 05 2026 at 06:28, Usama Arif wrote:
>>>>> On Tue, 4 Aug 2026 17:07:59 +0000 Dmitry Ilvokhin <d@ilvokhin.com> wrote:
>>>>> The above data shows the significance of the patch.
>>>>> It provides a very meaningful improvement (22.4% of time spent in futex_q_lock()
>>>>> will be significantly optimized and will also deliver second-order effects)
>>>>> and has no measurable impact on latency in the matching path.
>>>>> IMHO, this patch is a free lunch.
>>>>
>>>> Not really free. The user space access is not exactly cheap either
>>>> because CLAC/STAC are memory fencing to meet the SMAP guarantees.
>>>
>>> My understanding from 86e6b1547b3d is that STAC/CLAC “end up serializing
>>> execution on older Zen,” while Zen 5’s AC renaming “improves performance
>>> of STAC/CLAC a lot a lot.”  Architecturally, they only change the AC bit.
>>> They are not memory-ordering instructions like LFENCE.
>>
>> It's not a memory ordering instruction, but it has to guarantee that the
>> AC change is effective when the subsequent permission check
>> happens. That's true for both STAC and CLAC.
>>
>> So it _cannot_ be free by definition and the penalty depends on the
>> micro architecture.
>>
>>> I am currently testing on Zen5 which could be why I didn't see any
>>> wall-time regression in futex_wait_timeout.c from [1].
>>
>> It's not relevant whether your ZEN5 works fine or not. We are not
>> optimizing for a particular machine.
>>
>> A trivial futex bouncing test case with two threads degrades on a ZEN3
>> by ~20% and when looking at it with perf top clearly the extra user
>> access stands out very prominently.
>>
>> The below variant does not expose that behavior and actually improves
>> the same test case by ~5% on that machine.
> 
> Bah. Included the broken version. Fixed one is below.
> 
> Thanks,
> 
>         tglx
> ---
>  kernel/futex/waitwake.c |   16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
> 
> --- a/kernel/futex/waitwake.c
> +++ b/kernel/futex/waitwake.c
> @@ -857,7 +857,21 @@ int futex_wait_setup(u32 __user *uaddr,
>  		CLASS(hbr, hbr)(&q->key);
>  		auto hb = hbr.hb;
>  
> -		futex_q_lock(q, hb);
> +		futex_hb_waiters_inc(hb);
> +		q->lock_ptr = &hb->lock;
> +
> +		if (!spin_trylock(&hb->lock)) {
> +			ret = get_user_inline(uval, uaddr);
> +			if (ret) {
> +				futex_hb_waiters_dec(hb);
> +				return ret;
> +			}
> +			if (uval != val) {
> +				futex_hb_waiters_dec(hb);
> +				return -EWOULDBLOCK;
> +			}
> +			spin_lock(&hb->lock);
> +		}
>  
>  		ret = futex_get_value_locked(&uval, uaddr);
>  

Hi Thomas,

Sorry for the late reply.

I like this approach; it makes the trade-off much better than my patch.
When spin_trylock() succeeds, the matching path performs only the existing 
single user access, rather than the two accesses in my version.

Is it alright if I send v2 of the patch with your diff above? Or would you
like to send it?
Please let me know how you would like it attributed if I send it.

Thanks!
Usama
