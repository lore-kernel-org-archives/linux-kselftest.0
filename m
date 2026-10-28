Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.224
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793229281;
	b=TPDfsao46eOF3zsHSGuhv3XZGKFORq/YoKW316naLavZYC5vOz7t3eFal3dbOJlCtfLw
	 yxAMY7FHCdlInWkrVW6u9tyhnvWjNLg6BJxln4Vt0gRMqk1+JEezahut0DfvX07KUK0WO
	 akEK8xW2upl/1ZM9BLo7dZUj0Ek2Q/Zj1qd+LdDEh940FIJdgKBpACOBUhrryDM+NmCWY
	 jbU7S27H2yu3aFl4XqZzelRi1QKTrWUAzcEXSCeekS5DkEdY6/Z7JpwgddvhcoyYzVT/j
	 T4eUT5lM9Zk7iUtOAMb+Wt5zLf/Kot9xCwZ0pQ+I2fAEdxxprl3lw9D4XAnSqek9g+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793229281;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=3MEr9fLZD0azSi0DOKE0xNOrGIBfvLaVqc1C2QcbR/I=;
	b=bDNIHRl/Jep9P3I9EKqPGveB/PyN1Xok/FPpVWsiy3jYwhlqtAg41NFz7iYbuKa08O4u
	 PDpqqdgmnA98J9y8tkx0gzMeheDdNNnPFxmCjoyIobeqBMXxlBugHmMU5O25q4G5KClXx
	 tQD1foCgYF2BNaNlXkuTBtw21aKHLiVyIiSeMi2+yYIsSDIRz5goAjX0OwXXxHfDMuLlF
	 c9KOoQjjxju0mXggWOwu3kOFd7I6vZmd0SJPrHC2rrTIrjdZKmSotrPEF8R01et+bNExo
	 UgxjjyEP5/q75HBt4EYyukg/eio/uCPQ67Cz8JW49N9dSis4AuTKbs6Zm6wvFuBXckg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=qWp54Q7g;
	arc=none smtp.remote-ip=95.215.58.224
Received: from mta1.migadu.com (out-224.mta1.migadu.com [95.215.58.224])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D21B606A31A
	for <linux-kselftest@vger.kernel.org>; Wed, 28 Oct 2026 23:14:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D21B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=qWp54Q7g
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=LnJuu7B/S4VYS5oG0PP7FkWoFrFo1uRdb6upZLPKPHQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793229278; v=1; x=1793834078;
 b=qWp54Q7gPuRsP3lt9+9G+AAFpTUgKF61bBCTcxBL1IHcjH4O+kGNorEbpvcySqhkkICXY/YA
 fJ+UpMZL7JDzW1ADpIqJuAOgZK0NdPDkz5uq1m6nMs/LKUlg3SCO2SASgZcloPM1WRiWy2tN2VU
 QK5uZ6RCtvcuUid8JJLYdm9E=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 5eb06f2ffba058c2;
	Wed, 28 Oct 2026 23:14:37 +0000
X-Mizu-Trace-ID: 5eb06f2ffba058c2
X-Migadu-Flow: FLOW_OUT
Message-ID: <f7bd7c62-7762-4fe9-8aef-d84e92f2bc31@linux.dev>
Date: Wed, 28 Oct 2026 16:14:28 -0700
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
Subject: Re: [PATCH bpf-next v2 7/8] selftests/bpf: write the mixed
 arena/scalar ALU tests in asm
To: bot+bpf-ci@kernel.org, bpf@vger.kernel.org
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
 eddyz87@gmail.com, memxor@gmail.com, martin.lau@linux.dev, song@kernel.org,
 yonghong.song@linux.dev, jolsa@kernel.org, emil@etsalapatis.com,
 ihor.solodrai@linux.dev, john.fastabend@gmail.com, shuah@kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 jose.marchesi@oracle.com, david.faust@oss.qualcomm.com,
 martin.lau@kernel.org, mason@kernel.org
References: <20261028204158.1021284-8-vineet.gupta@linux.dev>
 <e08eb87415801027d75170c930dc709beaea5f20f4afc92ff0affd434faaa9a0@mail.kernel.org>
From: Vineet Gupta <vineet.gupta@linux.dev>
Content-Language: en-US
In-Reply-To: <e08eb87415801027d75170c930dc709beaea5f20f4afc92ff0affd434faaa9a0@mail.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/28/26 2:22 PM, bot+bpf-ci@kernel.org wrote:
>> selftests/bpf: write the mixed arena/scalar ALU tests in asm
> TL;DR: Test comment only: the new verifier_arena.c comment claiming the r9
> arena load is needed for addr_space_cast looks stale, since libbpf now binds
> the arena via fd_array. Suggest dropping or rewording it.
>
>> diff --git a/tools/testing/selftests/bpf/progs/verifier_arena.c b/tools/testing/selftests/bpf/progs/verifier_arena.c
>> index 21b66d51c61e..b84d8f1e0b39 100644
>> --- a/tools/testing/selftests/bpf/progs/verifier_arena.c
>> +++ b/tools/testing/selftests/bpf/progs/verifier_arena.c
>> @@ -539,53 +539,58 @@ int arena_ptr_add_arena_ptr(void *ctx)
>>   	return 0;
>>   }
>>
>> +/*
>> + * The r9 load is never read; it is there so libbpf records the arena map
>> + * as used, which is what lets the verifier accept addr_space_cast at all.
>> + */
>>   SEC("syscall")
>>   __failure __msg("same insn cannot be used with and without arena pointer")
> Is this comment still accurate?  Commit cd7a395838cb ("libbpf: Bind the arena
> of an object to every program in it") is already in the base of this series.
> With it, bpf_object_load_prog() calls bpf_object__bind_arena(), which puts
> the object's arena into a continuous fd_array when the kernel supports
> fd_array_cnt:
>
>      obj->fd_array[0] = map->fd;
>      load_attr->fd_array = obj->fd_array;
>      load_attr->fd_array_cnt = obj->fd_array_used;
>
> The kernel binds that array before it looks at any insn:
>
>      process_fd_array_continuous()
>        add_fd_from_fd_array()
>          __add_used_map()
>            check_map_prog_compatibility()
>              env->prog->aux->arena = (void *)map;
>
> This happens for every program in verifier_arena.o, including these two,
> whether or not an insn refers to the map.  The addr_space_cast check in
> check_alu_op() (if (!env->prog->aux->arena)) and the prevent_zext/needs_zext
> logic in adjust_reg_min_max_vals() only look at prog->aux->arena, so
> removing the r9 load would not change what either test does with a kernel and
> libbpf from this tree.
>
> The comment also describes the mechanism differently from what happens.
> libbpf only relocates the ld_imm64 to the map fd, and the verifier records
> the map as used in add_used_map() during resolve_pseudo_ldimm64().
>
> The log of the libbpf commit describes referring to the arena artificially,
> as in asm volatile("" :: "r"(&arena)), as something that change makes
> unnecessary.  The r9 load would only matter on a kernel that rejects
> fd_array_cnt, or with the light skeleton loader, which test_loader does not
> use.
>
> The same four comment lines are repeated word for word above
> mixed_arena_scalar_alu64_arena_first().

Will remove the duplication.

> Could the comment be dropped
> together with the r9 load, or be reworded to say the load is a fallback for
> kernels where libbpf cannot bind the arena through fd_array_cnt?

Yeah the comment mentioned r9 is totally weird, will simplify it.

Thx,
-Vineet

> ---
> AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
> See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md
>
> CI run summary: https://github.com/kernel-patches/bpf/actions/runs/40768193895

