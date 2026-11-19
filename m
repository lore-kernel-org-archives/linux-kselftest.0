Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.93
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795121758;
	b=svJbeVhIl6bQFjMB/CZhyIKzpQookoYK9CHdjradckDWs2ZN/LuOPXDGrUKZX9HYK5L7
	 Y00UEN8EZYgFSEaBsopYFDSIvW0FZTEjeH6ARvCHXrX4DREcGTLqL4PKtSf1Ib9JhRKcW
	 q/Ae/YHeHaCB8e0rzdoLcCRtxHEp+jq7m3xkDXrbmKYIeR+qFPdIdslqUK4btW74YECOd
	 bQ0qEX+kiM7n90owoVxtc+IMkhhTWEPWQv/ZD1iP46syU8vkA5szSB1zfJPUSEd6jI8Pb
	 ZHouEyIQlnMarkeG2QeQfqNiEmlBV89qT7bF1PCaj/yF5hKrMFJieSbPqQ/l4VhnjhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795121758;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=RAn8N6gSfkVa4V0mSBkwOuD+bKCvbb3xoXf3f4G383I=;
	b=5s5IpA+cREZwa9b44SDUerRn/4rjidivsMWA6+BCGpuviiBJvsiQgb4zDobjJ+IspBHb
	 E6qMdIhC/qXnTYOqvmbAmNW1tGpMDI1ZJlTezXspv1TX5K29M0PJG0NVj1zjEgsOkS8xb
	 FqNpcqQty1tN9lO2CPvvdE/K/ONSAl31Hr/srQ+S40UPdUZWwmXat1IAgdsm+L8cq2aEC
	 m7yjHUR27iF3hicHoXvdCuBNbe/bhHbI1R4tjLt+y/qE3ExVds6G5R5DQ6B80NwWJeQ5S
	 xZwK4tEwAweaLM0IZBEVlXAi+Vt9zdUkDGC4HB1p9LriFrKRJP7cG7pDGeYry59q7sg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=T6SUUJQU;
	arc=none smtp.remote-ip=91.218.175.93
Received: from mta0.migadu.com (out-93.mta0.migadu.com [91.218.175.93])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB356606A903
	for <linux-kselftest@vger.kernel.org>; Thu, 19 Nov 2026 20:55:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB356606A903
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=T6SUUJQU
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=m1boHPeRYAz7gh4uxsNHGhcag9dpvPIeasTIYyTZheM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795121755; v=1; x=1795726555;
 b=T6SUUJQUYYzy8giWeXfZvON5Q+sHb2YS7KwfiaAiaM3ND0+Iv1EPTI8o+jLp+as5xu69MqFp
 kevJwfu82JSIH0TYpS2Nu+0cCVPYtJ4DCvdacibaRB+rbHoRUC5mihquFl07lLdXZH3UtlLOoFR
 WDRQ1++iPOXXItUf8lPfj0b0=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 9cc57f456e8289a7;
	Thu, 19 Nov 2026 20:55:50 +0000
X-Mizu-Trace-ID: 9cc57f456e8289a7
X-Migadu-Flow: FLOW_OUT
Message-ID: <b3270941-35e4-4b30-ae0e-9adff152bf5f@linux.dev>
Date: Thu, 19 Nov 2026 13:55:45 -0700
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
Subject: Re: [PATCH bpf v2] selftests/bpf: Fix bpf-gcc CO-RE relocation in
 verifier_sockmap_mutate
To: Jiayuan Chen <jiayuan.chen@linux.dev>, bpf@vger.kernel.org, ast@kernel.org
Cc: Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>,
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>,
 Emil Tsalapatis <emil@etsalapatis.com>, Shuah Khan <shuah@kernel.org>,
 Sechang Lim <rhkrqnwk98@gmail.com>, Michal Luczaj <mhal@rbox.co>,
 John Fastabend <john.fastabend@gmail.com>, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261117122417.340562-1-jiayuan.chen@linux.dev>
Content-Language: en-US
From: Ihor Solodrai <ihor.solodrai@linux.dev>
In-Reply-To: <20261117122417.340562-1-jiayuan.chen@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/17/26 5:24 AM, Jiayuan Chen wrote:
> bpf-gcc fails to load test_trace_iter_unix:
> 
>   Error: #766/6 verifier_sockmap_mutate/test_trace_iter_unix
>   libbpf: elf: skipping section(3) .data (size 0)
>   libbpf: elf: skipping unrecognized data section(18) .comment
>   run_subtest:PASS:obj_open_mem 0 nsec
>   libbpf: prog 'test_trace_iter_unix': relo #0: insn #0 (LDX/ST/STX) accesses field incorrectly. ...
>   libbpf: prog 'test_trace_iter_unix': BPF program load failed: -EINVAL
>   libbpf: prog 'test_trace_iter_unix': failed to load: -EINVAL
>   libbpf: failed to load object 'verifier_sockmap_mutate'
>   run_subtest:PASS:unexpected_load_success 0 nsec
>   validate_msgs:FAIL:1014 expect_msg
>   VERIFIER LOG:
>   =============
>   0: R1=ctx() R10=fp0
>   ;  @ verifier_sockmap_mutate.c:124
>   0: <invalid CO-RE relocation>
>   failed to resolve CO-RE relocation <byte_off> [4] struct bpf_iter__unix (0:0 @ offset 0)
>   processed 1 insns (limit 1000000) max_states_per_insn 0 total_states 0 peak_states 0 mark_read 0
>   =============
>   EXPECTED   SUBSTR: 'cannot update sockmap in this context'
> 
> GCC only applies preserve_access_index to types that carry the attribute
> themselves. The anonymous union holding the sock pointer doesn't, so the
> CO-RE access stops at the union ("0:0") instead of reaching the pointer
> ("0:0:0"), and libbpf rejects the relocation.
> 
> Fixes: e16c83fa764f ("selftests/bpf: Add negative test for sockmap update from non-sockmap iter")
> Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>

Acked-by: Ihor Solodrai <ihor.solodrai@linux.dev>

CI confirms the patch works:

Failing: https://github.com/kernel-patches/bpf/actions/runs/44576883691/job/135760256786
Passing with the fix: https://github.com/kernel-patches/bpf/actions/runs/44083943280/job/134048457373

Thanks for the fix!

> [...]
