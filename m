Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com [95.215.58.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9E63364E85
	for <linux-kselftest@vger.kernel.org>; Tue,  2 Jun 2026 15:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780413315; cv=none; b=HnT+Hw+CBX6dRQmihqBzqIZNxTXcMrQRcIWlI/7LtXVIFPCFHqBZuW65LlBh5bHpyGnTokz5VtWsbi9iwqfgpjGo7J5PE8X+X/23AyFa2LdT0u4FaJz+Rae5IEAiHggW1vYv5d6Xzx5GcBvphpanY2gSQRfAqgpWioToIVDJzD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780413315; c=relaxed/simple;
	bh=bpIG0DviQzocBMgRg42jS5U+ruDAK6mwOZOQQBeRaU8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jjWtKm6Eu12xOKc6Rj48P3X1Aura/+N8HfFt9N5nZEW3vEP/osKFedPHfsxkBG5VSLenHdnObJQRNNez0coA6T/ZdvvOSoq7j15H8JWFrAF/fxHlkM016zMY4w5Y+418TfsaectRCzotRzC9FmR3PyzcDOh0AIg0CLPAtIMN3jQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=JgpbOM2j; arc=none smtp.client-ip=95.215.58.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="JgpbOM2j"
Message-ID: <31927f33-9db0-4a39-b38a-72b33487979e@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1780413310;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2rcXbFWZh1YISDu4YKt/p/Fc46FTcRHnUU3a2LRMUBY=;
	b=JgpbOM2j1wvWzKR2GnvnAbT2ahufzSwYysuT7mqPtWaCYS9WfR0+WEabGL2tcVM0AXGOuH
	WQ8ihJhhmKlrMo44Gyb9T17HXVwsgx4UalmznGpGSr/r2X0G8UE0ROGycmLjq/DJvObJSz
	e5Vk/W9N1W9w9gMwXEBS0OkXpTXP3q0=
Date: Tue, 2 Jun 2026 08:14:58 -0700
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 1/2] bpf: Tighten cgroup storage cookie checks for prog
 arrays
Content-Language: en-GB
To: bot+bpf-ci@kernel.org, malin89@huawei.com, ast@kernel.org,
 daniel@iogearbox.net, bpf@vger.kernel.org
Cc: andrii@kernel.org, john.fastabend@gmail.com, martin.lau@linux.dev,
 eddyz87@gmail.com, memxor@gmail.com, song@kernel.org, jolsa@kernel.org,
 zhuyifei@google.com, shuah@kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, ameryhung@gmail.com, cuirongzhen@huawei.com,
 tanjingguo@huawei.com, cenxianlong@huawei.com, chenzhe@huawei.com,
 martin.lau@kernel.org, clm@meta.com, ihor.solodrai@linux.dev
References: <20260602073539.1567846-1-malin89@huawei.com>
 <4f4661e6d1d9eaa6b05b0e6499562ad10ff8fa3b7bc6d44ec4019119fb547bd9@mail.kernel.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yonghong Song <yonghong.song@linux.dev>
In-Reply-To: <4f4661e6d1d9eaa6b05b0e6499562ad10ff8fa3b7bc6d44ec4019119fb547bd9@mail.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT



On 6/2/26 1:15 AM, bot+bpf-ci@kernel.org wrote:
>> bpf: Tighten cgroup storage cookie checks for prog arrays
>>
>> The recent KCTF-reported cgroup local storage issue assigned
>> CVE-2025-38502 was fixed by commit abad3d0bad72 ("bpf: Fix oob access
>> in cgroup local storage").
>>
>> However, the previous fixes are still incomplete. The current prog-array
>> compatibility check treats a program with no cgroup storage as
>> compatible with any stored storage cookie. This allows a storage-less
>> program to bridge a tail-call chain between an entry program and a
>> storage-using callee even though runtime cgroup local storage still
>> follows the caller context.
>>
>> Require exact per-type storage_cookie equality when checking prog-array
>> compatibility. This blocks zero-storage bridge programs from joining a
>> prog-array owned by a storage-using program and closes the residual
>> A -> B(no storage) -> C(storage) path.
>>
>> This also aligns with Amery Hung's earlier NULL-storage tail-call fix by
>> requiring storage use to match consistently across prog-array users.
>>
>> Cc: stable@vger.kernel.org
>> Fixes: 7d9c3427894f ("bpf: Make cgroup storages shared between programs on the same cgroup")
>> Tested-by: Amery Hung <ameryhung@gmail.com>
>> Signed-off-by: Lin Ma <malin89@huawei.com>
>> Signed-off-by: Rongzhen Cui <cuirongzhen@huawei.com>
>> Signed-off-by: Jingguo Tan <tanjingguo@huawei.com>
> Should the Fixes: tag point to abad3d0bad72 instead of 7d9c3427894f?
>
> The code this patch removes is the '|| !cookie' clause in
> __bpf_prog_map_compatible():
>
>    ret = map->owner->storage_cookie[i] == cookie ||
>          !cookie;
>
> That permissive '|| !cookie' clause, which treats a storage-less program
> as compatible with any stored cookie, was introduced by abad3d0bad72
> ("bpf: Fix oob access in cgroup local storage").
>
> The commit referenced by the current tag, 7d9c3427894f ("bpf: Make
> cgroup storages shared between programs on the same cgroup"), only added
> the shared cgroup-storage feature and does not touch
> __bpf_prog_map_compatible() or add the storage_cookie[] check.
>
> Would this be more accurate?
>
>    Fixes: abad3d0bad72 ("bpf: Fix oob access in cgroup local storage")

Agree. The above fix tag seems better.

>
> This same question was raised on the v1 thread by the bpf-ci review bot
> (https://lore.kernel.org/bpf/20260601095158.1186318-1-malin89@huawei.com/),
> noting that the patch removes the '|| !cookie' logic introduced in
> abad3d0bad72 rather than the original shared storage feature.  The reply
> disagreed and kept the tag pointing at 7d9c3427894f in v2, but the
> reviewer did not acknowledge that explanation, so it may be worth
> settling before this is applied.
>
> ---
> AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
> See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md
>
> CI run summary: https://github.com/kernel-patches/bpf/actions/runs/26806034423

