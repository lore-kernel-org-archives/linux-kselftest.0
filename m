Received: from mta0.migadu.com (out-111.mta0.migadu.com [91.218.175.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F08FD31F99C
	for <linux-kselftest@vger.kernel.org>; Tue, 15 Sep 2026 01:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789434706; cv=none; b=BKsNnt/N3HuoCOce5h7b2qyJjkVosxpQxEG2E+1lYiZmLF7ayqU/nfPXSMtGubZ351lrZsNFOzIEdKaqCjf+mWIj+ocWuCUH3kQ+8+6wA2WFPHYBTDJ4Jwz3y8elwscZMsa5dWVDrbeCYWoM4jSMZ7uSb7JxoVp/Kb8FOKne6L0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789434706; c=relaxed/simple;
	bh=LxUS3t19mBa39JuY24c5F4sFKay/V6WJQxPVSj+OE9A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UAfHf8aOGOuvOE9cVWUMuuPUUfOtQPLF7gge8eVxb2nIRemfEK5+y2id7+Vi/UffZajL/Wd6YOA0uBIT8wmhIggT4Ni+MZr4OZ61FuljTssOjeuh/aAZeYGrsCMD+T5ouM7HMM374lDJMWrtEDY94ZoYph0lbW1rfTzmFmyCF8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=SAF5vEf1; arc=none smtp.client-ip=91.218.175.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="SAF5vEf1"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=LxUS3t19mBa39JuY24c5F4sFKay/V6WJQxPVSj+OE9A=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789434700; v=1; x=1790039500;
 b=SAF5vEf1vhTc0DBWY3OnxQBygmIYilvMurkcHFBNIjChKD1AtudtAcfk+9/cuWFQuerFKyeK
 y6V462fjIUh+ZPhmxi+A7Vfk4c9M2t6Jn1IjlsIcvlj9Uq3SNZz3Q+rOHbiJipxd6HqR6yLRMFz
 UZUoN70fWySuYTXimwKIjMRw=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 2bee87929205f1ee;
	Tue, 15 Sep 2026 01:11:40 +0000
X-Mizu-Trace-ID: 2bee87929205f1ee
X-Migadu-Flow: FLOW_OUT
Message-ID: <f7337efd-c721-4d32-bcda-c8473e1fffc2@linux.dev>
Date: Mon, 14 Sep 2026 18:11:32 -0700
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next v2 02/13] bpf: compare linked-scalar kinds in
 regs_exact()
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>, ast@kernel.org,
 daniel@iogearbox.net, andrii@kernel.org, eddyz87@gmail.com, memxor@gmail.com
Cc: martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev,
 jolsa@kernel.org, emil@etsalapatis.com, ihor.solodrai@linux.dev,
 john.fastabend@gmail.com, shuah@kernel.org, bpf@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
References: <20260910164635.459558-1-vineet.gupta@linux.dev>
 <20260910164635.459558-3-vineet.gupta@linux.dev>
 <DLDKBR3Q9Z7A.23CDO8IOAPZYX@gmail.com>
From: Vineet Gupta <vineet.gupta@linux.dev>
Content-Language: en-US
In-Reply-To: <DLDKBR3Q9Z7A.23CDO8IOAPZYX@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/12/26 11:51 AM, Alexei Starovoitov wrote:
> On Thu Sep 10, 2026 at 9:46 AM PDT, Vineet Gupta wrote:
>> regs_exact() memcmp()s up to offsetof(id), so it does not see ->add_const,
>> which sits past ->frameno. Compare it explicitly.
>>
>> Two cases go from accepted to rejected:
>>
>>    old {r1.id=A, r2.id=A+delta}  vs cur {r1.id=B, r2.id=B}
>>    old {r2.id=A+delta32}         vs cur {r2.id=B+delta64}
>>
>> The first was rejected before this series -- the kind lived in ->id, so
>> A+delta was a distinct idmap key -- and the previous patch lost that. The
>> second was accepted before the series too, which is wrong: alu32 and alu64
>> deltas differ in sync_linked_regs(), so the states are not
>> interchangeable.
>>
>> ->delta is inside the memcmp() window and is cleared together with the
>> kind, so either case needs a kind with delta 0, e.g. "r6 = r5; r6 += 0".
>>
>> Only states_equal(..., EXACT) and env->explore_alu_limits reach
>> regs_exact() for a scalar; regsafe() compares kinds itself on the ordinary
>> path. Neither is easy to drive from a test program, so no selftest.
>>
>> Signed-off-by: Vineet Gupta <vineet.gupta@linux.dev>
>> ---
>> v2: new. Splits out the comparison RFC 3/6 lost when the kind left
>> ->id, which was raised on that patch.
>>
>>   kernel/bpf/states.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/kernel/bpf/states.c b/kernel/bpf/states.c
>> index d974baad37ee..5505d7aaeed0 100644
>> --- a/kernel/bpf/states.c
>> +++ b/kernel/bpf/states.c
>> @@ -475,6 +475,7 @@ static bool regs_exact(const struct bpf_reg_state *rold,
>>   		       struct bpf_idmap *idmap)
>>   {
>>   	return memcmp(rold, rcur, offsetof(struct bpf_reg_state, id)) == 0 &&
>> +	       rold->add_const == rcur->add_const &&
> This change should be in the patch 1 otherwise patch 1 is not correct?

Will do - it was one of the open questions in v2.

Thx,
-Vineet
