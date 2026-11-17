Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794916195;
	b=0vHdpRV5s/sFopPRgFwcCvxdHAkuJWHvPMk6vO0C8w7oF0527RjIjxTMPLsCLuRB4mZU
	 XZkKVP2tj/74RsEzlKRy4/O0q/9J4RZe46dU9TAaom+H3YSx0lt9MdPC2pJ+s+E6E0b9H
	 wj/iDpFOHz/y/EVQPs+jmHbU+bibVcIfig5twbxn6YEW0yB5xv+2BZ22IqJXlLOXzAZsG
	 2MLjf+I2lapkByGNp8oYxd5Oqu3BxefrAo8sOr3UKf2wgtwcanrdpbwR4oQHXLXSJ+ijx
	 XolKlT4u9+Sw8Q0FzYDpdT31KkpjMsRSsGZYcrPvutIyMUqmcIGdO/wKrYvW2DD7wRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794916195;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=18ZHHDBDT2iiqQ6vinpecoUhNdWbTNjIuab4R2JSkRw=;
	b=aVWywS3S1qCKxyWhVVvI9jvcEynHdswuE14n+X+qKjYsoV6FU/fp2Pi1EldaS19RI1ZL
	 34rHxY9UGxC0XJ01QaHHMtSc0T3MASZl2tC/VTGL+MQKdddaq0ITf6ldKGrDBAhMblP+f
	 GkZGk63g2u30+qXu9v1Djqmf4rqbxnKolFcvWMV0rdbRGoD+r0sBd7k94cMJVmcP7s4tO
	 1rQs156aPpmOZykEXQIxrGlhQWAyZTJIda6tGrMcE7XS3mQD8nwyuD8H054R5Mm13gSyb
	 +o4LvTv2ARlRwCGfRWAKaz4jVNpmReNhX3EjxiGL7e/DgM9IBh2d2I3JAmyH1PBLSaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=k194TiNJ;
	arc=none smtp.remote-ip=91.218.175.184
Received: from mta0.migadu.com (out-184.mta0.migadu.com [91.218.175.184])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F615606A33F
	for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 11:49:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F615606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=k194TiNJ
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=AiYQuQkup3uVDt+BqI8T8e63CilYInTtTsRGRSVebRM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794916192; v=1; x=1795520992;
 b=k194TiNJciQ9zfSjJr2C7HMEZ4rPmX3eliMeO0gINyXW7ICPYnFO7E/FjK4UVXSF025/k9vA
 5pGRGp5pXqhBusaeb/Lp2Bp6L3E0qKnuA9ZxGNj+Nrol3ZEA0uvOCR485ac8NvmJTcGGdKMEC92
 EPJOsIcllTvjmYaeYT7Etywo=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 68b5ba9fa6b5c9ee;
	Tue, 17 Nov 2026 11:49:51 +0000
X-Mizu-Trace-ID: 68b5ba9fa6b5c9ee
X-Migadu-Flow: FLOW_OUT
Message-ID: <dde3f6de-06bd-4e36-ad03-1c36eb3be645@linux.dev>
Date: Tue, 17 Nov 2026 19:49:45 +0800
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
Subject: Re: [PATCH bpf v1] selftests/bpf: Fix CO-RE relocation of anonymous
 unions for bpf-gcc
To: Michal Luczaj <mhal@rbox.co>, bpf@vger.kernel.org, ast@kernel.org
Cc: Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>,
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>,
 Emil Tsalapatis <emil@etsalapatis.com>,
 Ihor Solodrai <ihor.solodrai@linux.dev>, Shuah Khan <shuah@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, Sechang Lim
 <rhkrqnwk98@gmail.com>, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261117094544.148437-1-jiayuan.chen@linux.dev>
 <5efc22be-a517-4587-8e43-609bc876b54f@rbox.co>
From: Jiayuan Chen <jiayuan.chen@linux.dev>
In-Reply-To: <5efc22be-a517-4587-8e43-609bc876b54f@rbox.co>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 11/17/26 7:19 PM, Michal Luczaj wrote:
> On 11/17/26 10:45, Jiayuan Chen wrote:
>> bpf-gcc fails to load test_trace_iter_unix:
>>
>>   Error: #766/6 verifier_sockmap_mutate/test_trace_iter_unix
>>   libbpf: elf: skipping section(3) .data (size 0)
>>   libbpf: elf: skipping unrecognized data section(18) .comment
>>   run_subtest:PASS:obj_open_mem 0 nsec
>>   libbpf: prog 'test_trace_iter_unix': relo #0: insn #0 (LDX/ST/STX) accesses field incorrectly. ...
>>   libbpf: prog 'test_trace_iter_unix': BPF program load failed: -EINVAL
>>   libbpf: prog 'test_trace_iter_unix': failed to load: -EINVAL
>>   libbpf: failed to load object 'verifier_sockmap_mutate'
>>   run_subtest:PASS:unexpected_load_success 0 nsec
>>   validate_msgs:FAIL:1014 expect_msg
>>   VERIFIER LOG:
>>   =============
>>   0: R1=ctx() R10=fp0
>>   ;  @ verifier_sockmap_mutate.c:124
>>   0: <invalid CO-RE relocation>
>>   failed to resolve CO-RE relocation <byte_off> [4] struct bpf_iter__unix (0:0 @ offset 0)
>>   processed 1 insns (limit 1000000) max_states_per_insn 0 total_states 0 peak_states 0 mark_read 0
>>   =============
>>   EXPECTED   SUBSTR: 'cannot update sockmap in this context'
>>
>> GCC only applies preserve_access_index to types that carry the attribute
>> themselves. The anonymous union holding the sock pointer doesn't, so the
>> CO-RE access stops at the union ("0:0") instead of reaching the pointer
>> ("0:0:0"), and libbpf rejects the relocation. Mark the unions too.
>>
>> Fixes: e16c83fa764f ("selftests/bpf: Add negative test for sockmap update from non-sockmap iter")
>> Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>
>> ---
>>  tools/testing/selftests/bpf/progs/verifier_sockmap_mutate.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/tools/testing/selftests/bpf/progs/verifier_sockmap_mutate.c b/tools/testing/selftests/bpf/progs/verifier_sockmap_mutate.c
>> index 1516fe1524bb..68b1a5323470 100644
>> --- a/tools/testing/selftests/bpf/progs/verifier_sockmap_mutate.c
>> +++ b/tools/testing/selftests/bpf/progs/verifier_sockmap_mutate.c
>> @@ -16,13 +16,13 @@ struct sock {
>>  struct bpf_iter__sockmap {
>>  	union {
>>  		struct sock *sk;
>> -	};
>> +	} __attribute__((preserve_access_index));
>>  } __attribute__((preserve_access_index));
>>  
>>  struct bpf_iter__unix {
>>  	union {
>>  		struct sock *unix_sk;
>> -	};
>> +	} __attribute__((preserve_access_index));
>>  } __attribute__((preserve_access_index));
>>  
>>  struct {
> What about dropping the unions?
>
> -struct sock {
> -} __attribute__((preserve_access_index));
> -
>  struct bpf_iter__sockmap {
> -       union {
> -               struct sock *sk;
> -       };
> +       struct sock *sk;
>  } __attribute__((preserve_access_index));
>
>  struct bpf_iter__unix {
> -       union {
> -               struct sock *unix_sk;
> -       };
> +       struct sock *unix_sk;
>  } __attribute__((preserve_access_index));
>
> Works under clang.



Right. I grepped the tree and verifier_sockmap_mutate.c is the only place
that puts an anonymous union inside a hand-written preserve_access_index
struct, so the test doesn't need it.


