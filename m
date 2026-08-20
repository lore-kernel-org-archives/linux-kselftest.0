Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36B3B47CA9D;
	Thu, 20 Aug 2026 16:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787242989; cv=none; b=rvttNhusJBk3QxJIDN1K2fufwJgZPrEMsC/ISqZQofOQHCxTosGln0tAGkKGaE1MTm0JZwIh/rpzyVMl9RFGUli446Lxoh50NFcmO+XMJmw0Mvypg1K7igQ3jO4o4d1kVoalzjZwhrOaqZviauXE4Lv77M/UM0vRUUZZUsMXR2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787242989; c=relaxed/simple;
	bh=D6cfcPHLXXXSlTNqSAg3JYV9wUq48i+PQgtNmzpSlc8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Cuf84degjcekDF34Yk5cwoenqFm8c+GC7EMEjZLDwehhQe5ILjzkZuTYY9z9nCIJKVGDeWsaqBdU7JigsGrl/1vDIePiitZWRZmlU8/XY+gzKRg4wzWULVeyIbagTBdcnEUgLUa7g7x2mHiOaZ95cxC5pm9wdDL8855JRnRcmFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nxv859dk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nxv859dk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA1A11F00A3A;
	Thu, 20 Aug 2026 16:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787242987;
	bh=nX4sx1FRpEMa84CGdbrmoCP6H7q2WWN23nS2L2nrCZA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=Nxv859dkEHKPyVCse5t5aF4DPWyclCc04OXKHp3uViOGEFKqLG9kVJr2tPeAscjs3
	 GLfdFgSCPBrK0aGm4D4mh/vDavtfpYE1IiKivPnxF7ZVXaXt0gLokKj7N1nM6nbkcj
	 FmL+jCXwKaeGbti6zDe09i6HOMIOXiXWVriqkcSACzS+54z9vjntOZeYgn4Yo5dkhv
	 7gUADHGBgIXKn+d6ETOn7RCSbIq6R7pvtRKO3DDvOacERm5p1XiOHaztsc3dZ/jiK8
	 FyEkNjun2icRaVxuPhXlhpFSra2ylqchTh7vaCjKH84S8xlFXbz1Zy4tZaHGb2kvY6
	 vJAVY9q5j9ZgA==
From: Thomas Gleixner <tglx@kernel.org>
To: Usama Arif <usama.arif@linux.dev>, Dmitry Ilvokhin <d@ilvokhin.com>
Cc: peterz@infradead.org, andrealmeid@igalia.com, dave@stgolabs.net,
 dvhart@infradead.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, mingo@redhat.com, shuah@kernel.org,
 shakeel.butt@linux.dev, hannes@cmpxchg.org, riel@surriel.com,
 kernel-team@meta.com
Subject: Re: [PATCH] futex: Avoid hash-bucket locking for mismatched waits
In-Reply-To: <99a4d606-a53e-447e-951d-e356a97d16e9@linux.dev>
References: <20260805132831.2852771-1-usama.arif@linux.dev>
 <87jyq2dji5.ffs@fw13> <f4eaec7c-39f7-4040-b668-946de9c70941@linux.dev>
 <87y0e8lmih.ffs@fw13> <87v79clmfu.ffs@fw13>
 <99a4d606-a53e-447e-951d-e356a97d16e9@linux.dev>
Date: Thu, 20 Aug 2026 18:23:04 +0200
Message-ID: <87lda0iwwn.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Usama!

On Thu, Aug 20 2026 at 16:19, Usama Arif wrote:
> On 14/08/2026 17:02, Thomas Gleixner wrote:
>> --- a/kernel/futex/waitwake.c
>> +++ b/kernel/futex/waitwake.c
>> @@ -857,7 +857,21 @@ int futex_wait_setup(u32 __user *uaddr,
>>  		CLASS(hbr, hbr)(&q->key);
>>  		auto hb = hbr.hb;
>>  
>> -		futex_q_lock(q, hb);
>> +		futex_hb_waiters_inc(hb);
>> +		q->lock_ptr = &hb->lock;
>> +
>> +		if (!spin_trylock(&hb->lock)) {
>> +			ret = get_user_inline(uval, uaddr);
>> +			if (ret) {
>> +				futex_hb_waiters_dec(hb);
>> +				return ret;
>> +			}
>> +			if (uval != val) {
>> +				futex_hb_waiters_dec(hb);
>> +				return -EWOULDBLOCK;
>> +			}
>> +			spin_lock(&hb->lock);
>> +		}
>>  
>>  		ret = futex_get_value_locked(&uval, uaddr);
>>
> I like this approach; it makes the trade-off much better than my patch.
> When spin_trylock() succeeds, the matching path performs only the existing 
> single user access, rather than the two accesses in my version.

Correct.

> Is it alright if I send v2 of the patch with your diff above? Or would you
> like to send it?

Go wild.

It lacks an __acquire(q->lock_ptr) annotation and a comment for this
trylock muck and the open coded hb_waiter_inc(). The latter can just
refer to futex_q_lock().

Also the exit condition should be simplified into one "if (ret || uval !=
val)", which removes four lines of code.

> Please let me know how you would like it attributed if I send it.

Suggested-by is fine.

Thanks,

        tglx
