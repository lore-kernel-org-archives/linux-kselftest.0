Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793203706;
	b=B8xzEsDVcmQ2YhFwXF4MR+GO1Ox8+bFF8HyGAFctE5vwAZfh4pyew9fbPMc3qmukQ8Dq
	 O7FEdyVsWlH4clrNNNK/DMl7O0Z9j1tEFJPGFhmyniO5sHoP42CjZhG9/RwccjMnbFqUP
	 1WGIjghYLutrWCIpv3NP1U4d/di2iQMXizs+25R8PCoRIkH/SOrumufwMCRgt8XhZ1e8c
	 1StkuwY+HauJdSlKt2wNEOTwUCbgSTjDRDiFc6knEDN4sSuOsjmVIbBUBgUNcTcWDtheu
	 UE4RV3Qgrm5xU3Cptlllz+rZ4cW8Q+eNnKcEUMYJQfrITBhc1Q1gg5TWJ4wWqidoxZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793203706;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=MxROFele/7xmUBoLLTNHElbT4fiioQcRUV0YBjVBRTI=;
	b=W3yHofMLSpOlF25on9jtTmq8f7ADPfRUDjYo/fTVNUcH+caiF+tHlnTjAK0Dqy/+CQ1i
	 D6iEABK+/IYBeBcd2mGXiTyxkjmk9H7/LF9zRxJF8D+cZucfCBAv0rPRQfBMgAKmzchUe
	 mgc5E7ufE3qrpb7L8YLmnMlO0C/ufrOfF8Fq8dFE31N9WVMJa+qArXjB/ow0cM8iD8z7V
	 KOz4kQulNtjJriBlWfFmRJAB3eDZfkzhuvLMurMsMbdy61Wy2dCCAcNZVUNjqqLEfHXk3
	 YLzW/hWeloZL1lciMDCSvqOTDNEzx0T7cam4xaxYVuxbILLMkZtJ/SA2SbZqwA5cWrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=w5OyxGnn;
	arc=none smtp.remote-ip=95.215.58.228
Received: from mta1.migadu.com (out-228.mta1.migadu.com [95.215.58.228])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D89606A320
	for <linux-kselftest@vger.kernel.org>; Wed, 28 Oct 2026 16:08:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0D89606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=w5OyxGnn
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ed1QhX/EeBnT+m6d5f/VEjVqb0pcdtMA5QIcEBWm57k=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793203701; v=1; x=1793808501;
 b=w5OyxGnnRiBQzqMvIN/WPsUfZ6dezQYzsS7Ur4iBQg1G8A/x4tFToSBEV7jtEO+O+ZYdp1HJ
 aVDOEZeXyrrDVItPG9hGDEvwEVRluUdtRkHXdlxSPvZOljGnhjy8yOTlK6Tgxu3j3cTZ7vrLSEN
 aKnB+m1E/upH7BAgMHgKpbWM=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 693a6adefefd24b0;
	Wed, 28 Oct 2026 16:08:21 +0000
X-Mizu-Trace-ID: 693a6adefefd24b0
X-Migadu-Flow: FLOW_OUT
Message-ID: <346c3e4f-9244-47c9-927f-8e866b478fe2@linux.dev>
Date: Wed, 28 Oct 2026 09:08:13 -0700
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
Subject: Re: [PATCH bpf-next v1 1/7] selftests/bpf: Build callx tests with GCC
 that defines __BPF_FEATURE_CALLX
To: bot+bpf-ci@kernel.org, bpf@vger.kernel.org
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
 eddyz87@gmail.com, memxor@gmail.com, martin.lau@linux.dev, song@kernel.org,
 yonghong.song@linux.dev, jolsa@kernel.org, emil@etsalapatis.com,
 ihor.solodrai@linux.dev, john.fastabend@gmail.com, shuah@kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 jose.marchesi@oracle.com, david.faust@oss.qualcomm.com,
 martin.lau@kernel.org, mason@kernel.org
References: <20261028000411.4010967-2-vineet.gupta@linux.dev>
 <804b7fd3c3bf40a5edf65903d90514263e61fc6fa2ef513d35913fe8ed9acad8@mail.kernel.org>
From: Vineet Gupta <vineet.gupta@linux.dev>
Content-Language: en-US
In-Reply-To: <804b7fd3c3bf40a5edf65903d90514263e61fc6fa2ef513d35913fe8ed9acad8@mail.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/27/26 5:46 PM, bot+bpf-ci@kernel.org wrote:
>> selftests/bpf: Build callx tests with GCC that defines __BPF_FEATURE_CALLX
> TL;DR: Nit only: the new __skip() reason in the callx selftests omits riscv64,
> though riscv64 is supported, so a riscv64 build with a GCC lacking callx
> prints a misleading skip message.
>
>>
>> +/* clang always emits callx, gcc only when it defines __BPF_FEATURE_CALLX */
>> +#if (defined(__TARGET_ARCH_arm64) || defined(__TARGET_ARCH_x86) ||	\
>> +     (defined(__TARGET_ARCH_riscv) && __riscv_xlen == 64)) &&		\
>> +	(defined(__clang__) || defined(__BPF_FEATURE_CALLX))
>> +#define CAN_USE_CALLX
>> +#endif
>> +
>> @@ -1075,6 +1073,7 @@ int callx_c_ops_on_stack(void *ctx)
>>   #else
>>
>>   SEC("socket")
>> +__skip("callx needs x86/arm64 JIT and compiler support")
>>   __success
>>   int dummy(void *ctx)
>>   {
> this isn't a bug, but the skip reason leaves out riscv64, even though the
> CAN_USE_CALLX macro above accepts it.
>
> The same string is added to the dummy() program in
> verifier_callx_rodata.c.  The riscv64 JIT implements bpf_jit_supports_callx(),
> and commit 530dfafc6107 ("selftests/bpf: Enable callx related testcases for
> RV64") turned these tests on for RV64.
>
> On a riscv64 build with a bpf-gcc that does not define __BPF_FEATURE_CALLX,
> the arch supports callx and only the compiler lacks it, yet run_subtest()
> prints:
>
>    run_subtest:SKIP: callx needs x86/arm64 JIT and compiler support
>
> That reads as though riscv64 itself were unsupported.
>
> Could the reason say x86/arm64/riscv64, or leave the arch list out (for
> example "toolchain or JIT can't do callx", as the new comment in
> callx_rodata_lskel.c does)?

I'll just leave out the arch list and refer to just toolchain or JIT.

Thx,
-Vineet

>
>
> ---
> AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
> See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md
>
> CI run summary: https://github.com/kernel-patches/bpf/actions/runs/40608355234

