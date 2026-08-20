Received: from mta1.migadu.com (out-162.mta1.migadu.com [95.215.58.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B218C38D3F4
	for <linux-kselftest@vger.kernel.org>; Thu, 20 Aug 2026 18:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.162
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787249173; cv=none; b=WBRtW/xZdC5pmNCx7RINEekvaySb/T/DVUsyFqCFV74SdqQw1NcMBkoAh7giLHf3+e+NmozCtBLletXVTrMgVtMEEg4vO+TN/T2asreaUxbJxpDUTizCv5JJl18Y1NF9hQlT44LLBkVH7lTfbE7Q2fBAm5DJp6nYekyZNwmmgpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787249173; c=relaxed/simple;
	bh=qpQn2DKpEypoHbPCJ9fkZp66nPQSWcn/GrlxWGBrtpo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BWTXLB4hFtfHjTay7edIHierNryDYE2zOqOqcw81MGOdIkILwyNlobA5InnScsxbSz1oqJValS7xaZoYNH2fofuvy5++jz9s26/M1Sr/zaBEj1wg1D7+gvYrv+jOyiPpi+gogGueVCclXswZjqjuBPbvOZlKFY/0LxqS7/VnSsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=VoVJ+Jsn; arc=none smtp.client-ip=95.215.58.162
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="VoVJ+Jsn"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=qpQn2DKpEypoHbPCJ9fkZp66nPQSWcn/GrlxWGBrtpo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787249168; v=1; x=1787853968;
 b=VoVJ+JsnlGnEyoNz+PRB71caDVHBiKWl37I+aAV9FNhTJFxdlHKejieAbesGOKUFQK1q3+KT
 XjrKHPjsmPhtSWKEy+IxvL4ghRVPUA8tmKEai9zt6JZGRZWW/PIA6o2Y3LSCmZMMFgTX8o/MfMt
 NhQGnVu+ZX3m3N83GGDPUUcw=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: from [IPV6:2a02:6b6f:e75b:1900:855:edd6:ce7b:4965] (2a02:6b6f:e75b:1900:855:edd6:ce7b:4965)
	by smtp.migadu.com with ESMTPS id e4bcbc55a2887387;
	Thu, 20 Aug 2026 18:05:33 +0000
X-Mizu-Trace-ID: e4bcbc55a2887387
X-Migadu-Flow: FLOW_OUT
Message-ID: <0de32be8-7e19-4e8c-b9b9-0ed9a14b9eff@linux.dev>
Date: Thu, 20 Aug 2026 19:05:31 +0100
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
 <99a4d606-a53e-447e-951d-e356a97d16e9@linux.dev> <87lda0iwwn.ffs@fw13>
Content-Language: en-US
From: Usama Arif <usama.arif@linux.dev>
In-Reply-To: <87lda0iwwn.ffs@fw13>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 20/08/2026 17:23, Thomas Gleixner wrote:
> Usama!
> 
> On Thu, Aug 20 2026 at 16:19, Usama Arif wrote:
>> On 14/08/2026 17:02, Thomas Gleixner wrote:
>>> --- a/kernel/futex/waitwake.c
>>> +++ b/kernel/futex/waitwake.c
>>> @@ -857,7 +857,21 @@ int futex_wait_setup(u32 __user *uaddr,
>>>  		CLASS(hbr, hbr)(&q->key);
>>>  		auto hb = hbr.hb;
>>>  
>>> -		futex_q_lock(q, hb);
>>> +		futex_hb_waiters_inc(hb);
>>> +		q->lock_ptr = &hb->lock;
>>> +
>>> +		if (!spin_trylock(&hb->lock)) {
>>> +			ret = get_user_inline(uval, uaddr);
>>> +			if (ret) {
>>> +				futex_hb_waiters_dec(hb);
>>> +				return ret;
>>> +			}
>>> +			if (uval != val) {
>>> +				futex_hb_waiters_dec(hb);
>>> +				return -EWOULDBLOCK;
>>> +			}
>>> +			spin_lock(&hb->lock);
>>> +		}
>>>  
>>>  		ret = futex_get_value_locked(&uval, uaddr);
>>>
>> I like this approach; it makes the trade-off much better than my patch.
>> When spin_trylock() succeeds, the matching path performs only the existing 
>> single user access, rather than the two accesses in my version.
> 
> Correct.
> 
>> Is it alright if I send v2 of the patch with your diff above? Or would you
>> like to send it?
> 
> Go wild.
> 

Thanks! I am going to try and run this in production workloads to gather data.
Should be done in the next few days and send it early next week.

> It lacks an __acquire(q->lock_ptr) annotation and a comment for this
> trylock muck and the open coded hb_waiter_inc(). The latter can just
> refer to futex_q_lock().
> 
> Also the exit condition should be simplified into one "if (ret || uval !=
> val)", which removes four lines of code.
> 
>> Please let me know how you would like it attributed if I send it.
> 
> Suggested-by is fine.
> 
> Thanks,
> 
>         tglx

