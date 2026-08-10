Received: from out-176.mta1.migadu.com (out-176.mta1.migadu.com [95.215.58.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA36D3D8100
	for <linux-kselftest@vger.kernel.org>; Mon, 10 Aug 2026 12:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786364273; cv=none; b=QqGeZWFcAbbpX0sPU4CsflMshemeUmpI7qIu8lD8eCrwQPZNJpcwB2hObLgVNgcjI82NgEbbsK/VEDyRKvn5GHYufc0EzWCW26tNcah4im5U45Gt7QfZMXcAzgebkfdDEYLC10wrnDHMJ3LL7gbawSWYWRE9680sugbBZpVCFd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786364273; c=relaxed/simple;
	bh=awv3oV7yUQ4LJXIH2Gofzso9selzE5PKs1RIoigkubU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VPnPp9A9kCGGqwcaGWg+RSRFuYOQNyLf0sCqv8Vxy9q+mjPHKvhCwOfKm4Zt1/QEYo+7n20Cbg+eDEU1V4xH0Kr1/UemHXJybZdn3iR00K054hno+3G/rcbD/kAVnPFEWjpJAPfKtMFTDv9LiqdVTJZAK3YJxDyaEt0lgY/xQEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=jH1TFn+b; arc=none smtp.client-ip=95.215.58.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="jH1TFn+b"
Message-ID: <f4eaec7c-39f7-4040-b668-946de9c70941@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1786364267;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=myOS/Suk/S8d/D6q/UKWk7Iyn9hdQ/Bgx5h97KsNG+E=;
	b=jH1TFn+bQtPl0ZYT0Dkev01FBTVcMQl7re4NnkcvyxyeHEaE3C7xG0q7vOrt3YJfyf7sTQ
	y17lLbLWHtRyYKEvY8nOOMqcBR6TGPwHdf5ZKVG+8R8PpSvt2EGPionKQw5S+RthNbnA8k
	8Vi34sGjsYt3hZmxs/OjUKg6YXtXlRU=
Date: Mon, 10 Aug 2026 13:17:34 +0100
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] futex: Avoid hash-bucket locking for mismatched waits
To: Thomas Gleixner <tglx@kernel.org>, Dmitry Ilvokhin <d@ilvokhin.com>
Cc: peterz@infradead.org, andrealmeid@igalia.com, dave@stgolabs.net,
 dvhart@infradead.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, mingo@redhat.com, shuah@kernel.org,
 shakeel.butt@linux.dev, hannes@cmpxchg.org, riel@surriel.com,
 kernel-team@meta.com
References: <20260805132831.2852771-1-usama.arif@linux.dev>
 <87jyq2dji5.ffs@fw13>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Usama Arif <usama.arif@linux.dev>
In-Reply-To: <87jyq2dji5.ffs@fw13>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT



On 07/08/2026 16:42, Thomas Gleixner wrote:
> On Wed, Aug 05 2026 at 06:28, Usama Arif wrote:
>> On Tue, 4 Aug 2026 17:07:59 +0000 Dmitry Ilvokhin <d@ilvokhin.com> wrote:
>> The above data shows the significance of the patch.
>> It provides a very meaningful improvement (22.4% of time spent in futex_q_lock()
>> will be significantly optimized and will also deliver second-order effects)
>> and has no measurable impact on latency in the matching path.
>> IMHO, this patch is a free lunch.
> 
> Not really free. The user space access is not exactly cheap either
> because CLAC/STAC are memory fencing to meet the SMAP guarantees.
> 


My understanding from 86e6b1547b3d is that STAC/CLAC “end up serializing
execution on older Zen,” while Zen 5’s AC renaming “improves performance
of STAC/CLAC a lot a lot.”  Architecturally, they only change the AC bit.
They are not memory-ordering instructions like LFENCE. I am currently
testing on Zen5 which could be why I didn't see any wall-time regression
in futex_wait_timeout.c from [1].

> I've tried that lockless read/test before and gave up when a
> multi-waiter real world test case degraded by 5-10% depending on micro
> architecture.
> 


futex_wait_timeout.c [1] deliberately makes every call take the two-read path
and doesnt show any wall-time regression. The extra userspace read ofcourse
introduces additional instructions, but it is not showing up in any metric what
I thought would be the worst case in real world metrics.

The precheck adds no work while hb->lock is held, so it won't cause any more
contention.

I have been trying to coming up with some example userspace program that
would be negatively impacted by this patch and can't. I am not sure how
multi-waiter case that you described can result in 5-10% degradation
as the extra read is not showing up in wall clock time and we are not
adding more work under lock. I am currently testing on a Zen5 system.
Could you share the reproducer, thread topology, measured metric, and CPU
model on which you saw the 5–10% regression?

[1] https://lore.kernel.org/all/20260805132831.2852771-1-usama.arif@linux.dev/
