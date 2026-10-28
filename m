Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793204765;
	b=XV5Jk2OpymBcPlWhsflPFso1JsAWIV0Opgpm1niQWsi/8QMJyYVRBwhsQweZCLLkwLwY
	 9Yugn/cs8p2KQU+lmPsFO/M/gu+ATJJcF6ipe6zqpqJkQy0Ri7Q5uXrdC6HR11jVleb2L
	 ESb/Cy6qv9cRAzRvg5hvY+goW7hFNqmWivdpeSHW8eyptMMO9tlzMpeXwMZ73djc70ETn
	 QFFFoeFDC1IX3Onmr60+gj7eYmMC8ocMc1xvImCNtbYrc3ngmYnsE75PF3sHWVRIgOupL
	 NN0qnOe3JRWCinU3W9FzCyUE5UyJrDCKbGe6dhW7TI2mMkjdWk/4Xbz7k/ez6ZHkxsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793204765;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=h+HIOOxJx9hUe+jm2hepdbTigAroXYRQmP3amdTNLAk=;
	b=EzbkUQ0fb8/W4eCKzeX6d7bOFKyWE53eyY2G2fKrEvwWCBZvFIQ0MHP76QUbFmZZx/54
	 L0YJ3HjFDmsAgDPlKvkRXJVBr4SBY4P1mPqTcCuZmo5nL4V3weuJoYYzMT5NJVTnbVgCl
	 PdD+o3/M7ZwLJLk8X0lnAjt9Sb8YtHZcPmjRqVVvyYaSi+s5yCR35QpQ7LnV+pOVWZ/XZ
	 JOkVoDlToYUWdYJmIvjVXOFw/Za8bqbBeZFZ4/IdXxP9qqiJsopdIu7LJhRCYDoP05laP
	 nLHD/IE1hl0q5U10VTnjJD/SVZ8Tt8Yxs0dFXFM8TVlFNaimi2InBKRfyL1lzyVF4wQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=pl7yDW9Z;
	arc=none smtp.remote-ip=91.218.175.99
Received: from mta0.migadu.com (out-99.mta0.migadu.com [91.218.175.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB541606A31D
	for <linux-kselftest@vger.kernel.org>; Wed, 28 Oct 2026 16:26:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB541606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=pl7yDW9Z
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=XuPbLLiPtXAl47QACJO9Vzp6Txe/hdhVtczq1D4shLo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793204762; v=1; x=1793809562;
 b=pl7yDW9Zu05cYxMtG5YbemlYrBNeT01NjUaBLXzRYnTwzOGE/m/iETnqdne93AEcqAF0Z/Fz
 DNULADKI9msNuRRLJ6Fa0ruG1XzWdfhG9U9IiWrX/jAmv8kqLRfxJc9h4DzksgBnfDxu80hbJcG
 p+JoZ088qXh6Ps17vuLM9EMw=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 40b3dfbd2361a10e;
	Wed, 28 Oct 2026 16:26:01 +0000
X-Mizu-Trace-ID: 40b3dfbd2361a10e
X-Migadu-Flow: FLOW_OUT
Message-ID: <56eff81f-c7d4-4c81-b087-93cf63f42e35@linux.dev>
Date: Wed, 28 Oct 2026 09:25:52 -0700
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
Subject: Re: [PATCH bpf-next v1 5/7] selftests/bpf: don't report arena tests
 as passing with an empty body
To: bot+bpf-ci@kernel.org, bpf@vger.kernel.org
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
 eddyz87@gmail.com, memxor@gmail.com, martin.lau@linux.dev, song@kernel.org,
 yonghong.song@linux.dev, jolsa@kernel.org, emil@etsalapatis.com,
 ihor.solodrai@linux.dev, john.fastabend@gmail.com, shuah@kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 jose.marchesi@oracle.com, david.faust@oss.qualcomm.com,
 martin.lau@kernel.org, mason@kernel.org
References: <20261028000411.4010967-6-vineet.gupta@linux.dev>
 <bd70230bf88b570044957ec4866a4c0ad3870121a7e6c609e4d60043a13be905@mail.kernel.org>
From: Vineet Gupta <vineet.gupta@linux.dev>
Content-Language: en-US
In-Reply-To: <bd70230bf88b570044957ec4866a4c0ad3870121a7e6c609e4d60043a13be905@mail.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/27/26 5:46 PM, bot+bpf-ci@kernel.org wrote:
>> selftests/bpf: don't report arena tests as passing with an empty body
> TL;DR: Commit message only: it cites arena_types to justify running arena
> kfunc tests without a cast, but the address args are __ign (ARG_IGNORE) and
> never checked against it. Conclusion looks right; the explanation may need
> rewording.
>
>> selftests/bpf: don't report arena tests as passing with an empty body
>>
>> Some arena tests put the __BPF_FEATURE_ADDR_SPACE_CAST guard inside the
>> function rather than around it, so without arena support the program
>> still exists, its body is empty, and __success __retval(0) is met by
>> doing nothing.  A reader sees
>>
>>    #584/1	 verifier_arena/basic_alloc1_nosleep:OK
>>
>> and concludes arena works.  That is worse than the tests which vanish
>> entirely, since nothing hints anything is missing.
>>
>> The guard was never needed to compile those bodies: without the
>> feature __arena is still btf_type_tag("arena"), which every compiler
>> accepts.  What it avoided was the load failure that follows from no
>> addr_space_cast being emitted — but only for a body that dereferences
>> an arena pointer.  The arena kfuncs take one as a plain scalar:
>>
>>    static const struct bpf_reg_types arena_types = {
>> 	  .types = { PTR_TO_ARENA, SCALAR_VALUE }
>>
>> so a test that only passes pointers to bpf_arena_{alloc,free,reserve}_pages()
>> needs no cast and runs fine.
>>
>> test_loader checks skip_reason before it opens anything, so the body no
>> longer has to be empty to stay loadable: drop all 19 in-body guards.
>> They do not all need a tag in their place, which is why 19 guards go
>> and 7 tags arrive:
>>
>>    6   dereference, so they get __skip_without_arena and report SKIP:
>>        basic_alloc1{,_nosleep}, basic_alloc2{,_nosleep}, big_alloc1,
>>        access_reserved
>>    11  never dereference, so they get no tag and run for real instead
>>        of reporting a vacuous OK
>>    2   big_alloc3 and big_alloc4, already inside the file's outer
>>        whole-program guard, so the in-body one was redundant
>>
>> The 7th tag goes on check_arena_arg_ret(), which has no guard at all
>> and is the one verifier_arena subtest that really fails under a stock
>> GCC.
>>
>> Measured on bpf-next with a stock bpf-gcc, test_progs before and after:
>>
>>    verifier_arena/basic_alloc1            OK   -> SKIP
>>    verifier_arena/basic_alloc1_nosleep    OK   -> SKIP
>>    verifier_arena/basic_alloc2            OK   -> SKIP
>>    verifier_arena/basic_alloc2_nosleep    OK   -> SKIP
>>    verifier_arena_large/big_alloc1        OK   -> SKIP
>>    verifier_arena_large/access_reserved   OK   -> SKIP
>>    verifier_arena/check_arena_arg_ret     FAIL -> SKIP
>>
>> the six that dereference stop claiming to pass, and check_arena_arg_ret
>> stops failing.  The eleven that do not dereference stay OK, having gone
>> from an empty body to actually running.
>>
>> Removing the guards exposes the arena_base() calls they were hiding.
>> The previous patch made that macro opaque to GCC's -Warray-bounds, so
>> nothing is needed here beyond the guards going away.
>>
>> Signed-off-by: Vineet Gupta <vineet.gupta@linux.dev>
> The paragraph that says "The arena kfuncs take one as a plain scalar" and
> quotes arena_types: is that the check that actually lets these tests run
> without an addr_space_cast?
>
> bpf_arena_alloc_pages(), bpf_arena_free_pages() and
> bpf_arena_reserve_pages() declare their address argument with the __ign
> suffix in kernel/bpf/arena.c:
>
>    __bpf_kfunc void *bpf_arena_alloc_pages(void *p__map, void *addr__ign, ...)
>    __bpf_kfunc void bpf_arena_free_pages(void *p__map, void *ptr__ign, ...)
>    __bpf_kfunc int bpf_arena_reserve_pages(void *p__map, void *ptr__ign, ...)
>
> get_kfunc_arg_type() tests the __ign suffix first and returns ARG_IGNORE:
>
>    if (is_kfunc_arg_ignore(meta->btf, &args[arg]) || is_kfunc_arg_implicit(meta, arg))
>            return ARG_IGNORE;
>
> and check_func_arg() returns for that type before any register type check:
>
>    if (arg_type == ARG_IGNORE)
>            return 0;
>
> arena_types is only reached through compatible_reg_types[ARG_PTR_TO_ARENA],
> which applies to kfunc parameters named with __arena or __arena__nullable and
> to arena-tagged global subprog arguments.  resolve_btfids adds the arena type
> tag for KF_ARENA_ARG2 but keeps the parameter name, so the __ign rule still
> applies.
>
> So the conclusion that no cast is needed looks right, but the address
> argument is not checked against { PTR_TO_ARENA, SCALAR_VALUE } at all.  The
> same reasoning applies to the tests that no longer have a guard or a tag:
> basic_reserve1, basic_reserve2, reserve_twice, reserve_invalid_region and
> arena_kfuncs_under_bpf_lock in verifier_arena.c, and
> request_partially_reserved and free_reserved in verifier_arena_large.c.
>
> Could the paragraph cite the addr__ign/ptr__ign parameters
> (is_kfunc_arg_ignore() -> ARG_IGNORE) instead of arena_types?

Yes this will be fixed in v2.

Thx,
-Vineet

> ---
> AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
> See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md
>
> CI run summary: https://github.com/kernel-patches/bpf/actions/runs/40608355234

