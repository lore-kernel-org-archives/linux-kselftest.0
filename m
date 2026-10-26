Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.126
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793046652;
	b=A7ZqPE0tmuiBocZk4AWba2GN5L670Czp9SSC2UaNqm56Ve8vzAI3R6SBKzBkBvR2UA03
	 Z/YblRmDBVIs9mpMM/RWvTCYAwCWxj6WFmTSkk0fUhC6pTss4KP4rQN1eWPkJlH/mkO/v
	 0CtjONOiCV/T7ZaYpi0sB30OeYdgbllG1KDwY/Xs7eJ++We+c5pW4YaFz5/nmdES80bkQ
	 iA2jZa0d89b0nESDPwcFlhDDFgk2APsXo4+xIW8xz28oHbvcLDLM6mO9+bWBkin9D7eAc
	 s9MFqKRDcmvjwIQjplDNnbotjEmJtGJGyGUuybG+p7+A8IgO7L2M4Q5Xs8w/zzEQspQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793046652;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=q91/ZqBRSWos1rOGl7FRZkFKpbVqDazHpwLRukKvSaw=;
	b=dbbWk01xvoOj2besi37LQ2JJK+fWZ1pDTuACRnm7Uo+bLD38JyLZGvwQR1/PfJf6ZJfN
	 rqt1Bp58KGZ2Saiazg8M+I+BNos0XIW5x8mcSApw6/HH+7IVSm36e9fD1K18ECAiD90WB
	 D9Tvn7HiQXeW26dN1qx1GdLNOy3gSygxCkpf21tw0Wz22vn9eJJSn24O7wFsZcpAxsf5F
	 ssdtSOM4BHGuCL6I91bZ/TwTxhYjhyroZoxaTEHM5ex7UntVGgb6q2CCCYVEuLlaloKGL
	 p4rQALJR6WqOMjuJpIVcz4Iu6uY1iHnFPlfMAqbOFH7vPu/UzltvnRM2FuTUZOtcxhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=jtpKN8BH;
	arc=none smtp.remote-ip=95.215.58.126
Received: from mta1.migadu.com (out-126.mta1.migadu.com [95.215.58.126])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C9F606A31D
	for <linux-kselftest@vger.kernel.org>; Mon, 26 Oct 2026 20:30:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71C9F606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=jtpKN8BH
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=cIhC+X2D9PeHbpAlmTyQ0l0MeQ/nAc9SVi2AYlpNJD0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793046649; v=1; x=1793651449;
 b=jtpKN8BHuVUBXWCVsWrTSBs+B1RxpFdrgm/3o82kT/UMumKUl13IPxPS0OcFcNWAZVAsv8Tf
 hkWSCJjCCztFDvX00D8wlHd8Mutyw3oK2eaPTnw/CuznmEf4NB/mnkNS+QtmguR/cNM/jhJj/J3
 Jyd3QPU5tTt9KTlDc12O7I5g=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 40420f710c1f9aa8;
	Mon, 26 Oct 2026 20:30:49 +0000
X-Mizu-Trace-ID: 40420f710c1f9aa8
X-Migadu-Flow: FLOW_OUT
Message-ID: <b9fb702d-9782-44b7-803a-26a00fc4206e@linux.dev>
Date: Mon, 26 Oct 2026 13:30:42 -0700
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next v3 04/12] bpf: Track low-32 scalar equality
 across zero-extending movs
To: bot+bpf-ci@kernel.org, ast@kernel.org, daniel@iogearbox.net,
 andrii@kernel.org, eddyz87@gmail.com, memxor@gmail.com
Cc: martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev,
 jolsa@kernel.org, emil@etsalapatis.com, ihor.solodrai@linux.dev,
 john.fastabend@gmail.com, shuah@kernel.org, bpf@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 martin.lau@kernel.org, mason@kernel.org
References: <20261020161907.2115379-5-vineet.gupta@linux.dev>
 <d6b900be6e27a2ab0ff198e30d28c0d35410daa23bf03ead13a359569f9bfdd9@mail.kernel.org>
From: Vineet Gupta <vineet.gupta@linux.dev>
Content-Language: en-US
In-Reply-To: <d6b900be6e27a2ab0ff198e30d28c0d35410daa23bf03ead13a359569f9bfdd9@mail.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/20/26 10:09 AM, bot+bpf-ci@kernel.org wrote:
>> bpf: Track low-32 scalar equality across zero-extending movs
> TL;DR: The comment and changelog claim a zero delta from an add is refused
> composition, but a 32-bit add of known zero records the same link as the mov
> and composes. Behaviour is sound; the explanation looks inaccurate.
>> @@ -17594,11 +17584,28 @@ static int adjust_reg_min_max_vals(struct bpf_verifier_env *env,
>>
>>   		if (dst_reg->link_kind) {
>>   			/*
>> -			 * If the register already went through rX += val
>> -			 * we cannot accumulate another val into rx->off.
>> +			 * Only the zero-extending link the mov above records,
>> +			 * BPF_REG_LINK_ZEXT with delta 0, can take a delta:
>> +			 * (u32)((u32)(base + 0) + off) is (u32)(base + off).
>> +			 * The add has to be 32-bit as well, since a 64-bit one
>> +			 * parts company with the link once the low half wraps.
>> +			 *
>> +			 * Everything else still drops the link. A zero delta
>> +			 * reached by an add rather than by the mov, say "r1 +=
>> +			 * r3" with r3 known to be 0, has already spent its
>> +			 * delta; composing onto it keeps a link alive across a
>> +			 * loop's increments, and since the delta is compared
>> +			 * for equality, every value the loop reaches becomes a
>> +			 * state of its own and stops pruning.
>>   			 */
>> +			if (dst_reg->link_kind != BPF_REG_LINK_ZEXT || !alu32 ||
>> +			    dst_reg->delta) {
>> +				/* also the target of the two gotos above */
>>   clear_id:
>> -			bpf_clear_scalar_id(dst_reg);
>> +				bpf_clear_scalar_id(dst_reg);
>> +			} else {
>> +				dst_reg->delta = off;
>> +			}
>>   		} else {
>>   			if (alu32)
>>   				dst_reg->link_kind = BPF_REG_LINK_ZEXT;
> The comment says a zero delta "reached by an add rather than by the mov"
> has already spent its delta, and the commit message says allowing
> composition onto "a zero delta that an add produced rather than the mov
> still costs 1176 -> 1196".  Can this test actually tell the two apart?

Comment is wrong, fixed in v4.

Walking it through to confirm your reading: a 32-bit add on a register 
that has an id but no kind takes the else arm,

     } else {
         if (alu32)
             dst_reg->link_kind = BPF_REG_LINK_ZEXT;
         else
             dst_reg->link_kind = BPF_REG_LINK_FULL;
         dst_reg->delta = off;
     }

so "w1 += 0" records exactly what the mov records, ZEXT with delta 0, 
and a following "w1 += 1" composes onto it.

The example the comment gives, "r1 += r3", is 64-bit, records 
BPF_REG_LINK_FULL, and is refused for being full link rather than for 
having spent a delta.

The behaviour is sound: (u32)((u32)(base + 0) + off) is (u32)(base + 
off) whichever instruction produced the zero. What is actually refused 
is a *second* delta, and that is what the comment now says.


> A 32-bit add or sub of a known zero ("w1 += 0", "w1 -= 0", or "w1 += w3"
> with w3 known to be 0) on a register that has an id but no link_kind goes
> through the else arm quoted above and records:
>
>      dst_reg->link_kind = BPF_REG_LINK_ZEXT;
>      dst_reg->delta = off;    /* off == 0 */
>
> That is the same state the mov records, so a following "w1 += 1" passes the
> "dst_reg->link_kind != BPF_REG_LINK_ZEXT || !alu32 || dst_reg->delta" test
> and composes.
>
> Only the 64-bit example from the comment ("r1 += r3", which records
> BPF_REG_LINK_FULL) is actually refused.
>
> The result is still sound, since (u32)((u32)(base + 0) + off) is
> (u32)(base + off).  Should the comment and the changelog limit the claim to
> 64-bit adds, or does the mov-produced link need to be made distinguishable
> from the add-produced one?

Former. Composing is already capped at one so comment says second delta 
is refused.

Thx,
-Vineet

>
>
> ---
> AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
> See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md
>
> CI run summary: https://github.com/kernel-patches/bpf/actions/runs/39458500836

