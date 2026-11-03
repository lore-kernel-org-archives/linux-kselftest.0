Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793664969;
	b=4TjxV+DVhobf4I6u0+NaYUz5KB79GdWHlz6tFGZQ893ctYf5Oin8/mYmdE0enZFgMnsl
	 YNbrq+EpS5GOIX09JMEJ8uwtjGLK5ZNyfAYc8HFHRKc/gkKyx16xh1OMEmV9niPgsJeXq
	 Axj5bhPAsB20a+rhpi95Qo+DFN/1Sb7TlJ4JDBxJ59tQtX/+XZHDKTsIb3CS2j06NDv6n
	 cVLh4bTfOwaArjUpxdbrfW6A+HqOrRLSfA3gQVeQ1CvC3wfT0ALHSZhXaTODctckz5xJN
	 DBxSF17rllIwZLJYJluZYcxiVu7zg1Hm/j2scwN8sQpXNmCH6/1CpvrHjTwEheSGfiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793664969;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=/uPT4vdHUQZrtGUWIDhvkzHSaxat7xD3UNSEdtv7bHA=;
	b=RLmVGYZ+tB4VAQuaAs+991Jzs2LhF1PyjoAkWlbxgahRUOJeHHItANIe6+axlV6m4nzi
	 umXyZcMgl31R9yY29/hHMBsjo6lmrLLcOyvKEWq9vCX3K///LlkZxX2jLqrnkKDVfluM+
	 dCuoMDwEDcW76Tb8J/Iwb/cU2B/e2ecgyFT1GWtweKsGxnHnUITOsHiHardxkbf+vl0F6
	 2mK5dWTvcr6fik9DX3ZAxgkKOtlPQqfQDD72CYdML3/SuTNmIJIM8TJVOhdYNHZJXxmM3
	 Ak7Q63YtFku6hDaO0vi36GzoR7fY+AKa4oF0CDHhkcABt8uws1gRzV+HrjwhdAyQwtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=HNf0zk5b;
	arc=none smtp.remote-ip=91.218.175.179
Received: from mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B250606A327
	for <linux-kselftest@vger.kernel.org>; Tue,  3 Nov 2026 00:16:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B250606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=HNf0zk5b
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=0XIP2nwc6eaTMkjHzyVrBh3ylA4dDdfFpXWL7zb1+wc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793664965; v=1; x=1794269765;
 b=HNf0zk5b7JsjzBN040M2Q4qRLual1HyMagKRSCTOiXIVNdyUcptondMSoT65ys2Jq6H2mLgY
 OvU8PZyXkLzYRrKNMtmw5TN4pLHpIseYXiMIhO2IPrgsgi5v4v48dSQ9KS3nvM+RzpKzfmzjcfW
 7npEsvXbD7EKdYEn0wclsWrA=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id ca924cd7e3058c18;
	Tue, 03 Nov 2026 00:16:04 +0000
X-Mizu-Trace-ID: ca924cd7e3058c18
X-Migadu-Flow: FLOW_OUT
Message-ID: <7c603b2b-6fcc-41d7-84e3-31e8af005776@linux.dev>
Date: Mon, 2 Nov 2026 16:15:55 -0800
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
Subject: Re: [PATCH bpf-next v3 4/8] selftests/bpf: make arena_base() opaque
 to GCC's -Warray-bounds
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>, bpf@vger.kernel.org
Cc: daniel@iogearbox.net, andrii@kernel.org, eddyz87@gmail.com,
 memxor@gmail.com, martin.lau@linux.dev, song@kernel.org,
 yonghong.song@linux.dev, jolsa@kernel.org, emil@etsalapatis.com,
 ihor.solodrai@linux.dev, john.fastabend@gmail.com, shuah@kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 jose.marchesi@oracle.com, david.faust@oss.qualcomm.com
References: <20261102220717.4079739-1-vineet.gupta@linux.dev>
 <20261102220717.4079739-5-vineet.gupta@linux.dev>
 <DML32WAB5JZD.1LR3JA1OYY6A5@gmail.com>
From: Vineet Gupta <vineet.gupta@linux.dev>
Content-Language: en-US
In-Reply-To: <DML32WAB5JZD.1LR3JA1OYY6A5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/2/26 2:38 PM, Alexei Starovoitov wrote:
> On Mon, Nov 02, 2026 at 02:07 PM Vineet Gupta <vineet.gupta@linux.dev> wrote:
>> The barrier is behind #ifdef __clang__ so clang keeps the plain macro.
>> It does not need it, and the barrier is not free: it blocks reuse of
>> the map address, so each call site reloads it.  Across the five progs
>> and 20 call sites that is +35 instructions under GCC
>> (2528 -> 2563), about 1.4% on those objects and nothing elsewhere.
>> Clang output is unchanged, bit for bit.
> stream.c already has barrier_var() for both compilers.
>
> How about this one instead:

Yeah definitely much better. Just to be clear the intent of series is to 
not make current compiler look better o anything. As I mentioned in the 
cover, this was during in my in-works arena compiler testing, ....

Thx for the quick feedback.
-Vineet


> diff --git a/tools/testing/selftests/bpf/libarena/include/bpf_arena_common.h b/tools/testing/selftests/bpf/libarena/include/bpf_arena_common.h
> index 82aafe8..0eba529 100644
> --- a/tools/testing/selftests/bpf/libarena/include/bpf_arena_common.h
> +++ b/tools/testing/selftests/bpf/libarena/include/bpf_arena_common.h
> @@ -49,7 +49,16 @@ void __arena* bpf_arena_alloc_pages(void *map, void __arena *addr, __u32 page_cn
>   int bpf_arena_reserve_pages(void *map, void __arena *addr, __u32 page_cnt) __ksym __weak;
>   void bpf_arena_free_pages(void *map, void __arena *ptr, __u32 page_cnt) __ksym __weak;
>
> -#define arena_base(map) ((void __arena *)((struct bpf_arena *)(map))->user_vm_start)
> +/*
> + * The map definition is smaller than struct bpf_arena.
> + * barrier_var() hides that from -Warray-bounds of GCC.
> + */
> +#define arena_base(map)							\
> +	({								\
> +		struct bpf_arena *___arena = (void *)(map);		\
> +		barrier_var(___arena);					\
> +		(void __arena *)___arena->user_vm_start;		\
> +	})
>
>   #else /* when compiled as user space code */
>
> diff --git a/tools/testing/selftests/bpf/progs/stream.c b/tools/testing/selftests/bpf/progs/stream.c
> index 1ae015c..b4d88d0 100644
> --- a/tools/testing/selftests/bpf/progs/stream.c
> +++ b/tools/testing/selftests/bpf/progs/stream.c
> @@ -178,16 +178,8 @@ __stderr("Call trace:\n"
>   "|[ \t]+[^\n]+\n)*}}")
>   int stream_arena_write_fault(void *ctx)
>   {
> -	struct bpf_arena *ptr = (void *)&arena;
> -	u64 user_vm_start;
> +	u64 user_vm_start = (u64)arena_base(&arena);
>
> -	/* Prevent GCC bounds warning: casting &arena to struct bpf_arena *
> -	 * triggers bounds checking since the map definition is smaller than struct
> -	 * bpf_arena. barrier_var() makes the pointer opaque to GCC, preventing the
> -	 * bounds analysis
> -	 */
> -	barrier_var(ptr);
> -	user_vm_start = ptr->user_vm_start;
>   	fault_addr = user_vm_start + 0x7fff;
>   	bpf_addr_space_cast(user_vm_start, 0, 1);
>   	asm volatile (
> @@ -212,16 +204,8 @@ __stderr("Call trace:\n"
>   "|[ \t]+[^\n]+\n)*}}")
>   int stream_arena_read_fault(void *ctx)
>   {
> -	struct bpf_arena *ptr = (void *)&arena;
> -	u64 user_vm_start;
> +	u64 user_vm_start = (u64)arena_base(&arena);
>
> -	/* Prevent GCC bounds warning: casting &arena to struct bpf_arena *
> -	 * triggers bounds checking since the map definition is smaller than struct
> -	 * bpf_arena. barrier_var() makes the pointer opaque to GCC, preventing the
> -	 * bounds analysis
> -	 */
> -	barrier_var(ptr);
> -	user_vm_start = ptr->user_vm_start;
>   	fault_addr = user_vm_start + 0x7fff;
>   	bpf_addr_space_cast(user_vm_start, 0, 1);
>   	asm volatile (
> @@ -252,17 +236,9 @@ int stream_arena_load_acquire_fault(void *ctx)
>   		.off	 = 0x7fff,
>   		.imm	 = 0x100,	/* BPF_LOAD_ACQ */
>   	};
> -	struct bpf_arena *ptr = (void *)&arena;
> -	u64 user_vm_start, val;
> +	u64 user_vm_start = (u64)arena_base(&arena);
> +	u64 val;
>
> -	/*
> -	 * Prevent GCC bounds warning: casting &arena to struct bpf_arena *
> -	 * triggers bounds checking since the map definition is smaller than
> -	 * struct bpf_arena. barrier_var() makes the pointer opaque to GCC,
> -	 * preventing the bounds analysis.
> -	 */
> -	barrier_var(ptr);
> -	user_vm_start = ptr->user_vm_start;
>   	fault_addr = user_vm_start + 0x7fff;
>   	bpf_addr_space_cast(user_vm_start, 0, 1);
>   	asm volatile (
> @@ -296,17 +272,9 @@ int stream_arena_xchg_fault(void *ctx)
>   		.off	 = 0x7fff,
>   		.imm	 = 0xe1,	/* BPF_XCHG */
>   	};
> -	struct bpf_arena *ptr = (void *)&arena;
> -	u64 user_vm_start, val;
> +	u64 user_vm_start = (u64)arena_base(&arena);
> +	u64 val;
>
> -	/*
> -	 * Prevent GCC bounds warning: casting &arena to struct bpf_arena *
> -	 * triggers bounds checking since the map definition is smaller than
> -	 * struct bpf_arena. barrier_var() makes the pointer opaque to GCC,
> -	 * preventing the bounds analysis.
> -	 */
> -	barrier_var(ptr);
> -	user_vm_start = ptr->user_vm_start;
>   	fault_addr = user_vm_start + 0x7fff;
>   	bpf_addr_space_cast(user_vm_start, 0, 1);
>   	/*
> @@ -346,17 +314,9 @@ int stream_arena_cmpxchg_fault(void *ctx)
>   		.off	 = 0x7fff,
>   		.imm	 = 0xf1,	/* BPF_CMPXCHG */
>   	};
> -	struct bpf_arena *ptr = (void *)&arena;
> -	u64 user_vm_start, val;
> +	u64 user_vm_start = (u64)arena_base(&arena);
> +	u64 val;
>
> -	/*
> -	 * Prevent GCC bounds warning: casting &arena to struct bpf_arena *
> -	 * triggers bounds checking since the map definition is smaller than
> -	 * struct bpf_arena. barrier_var() makes the pointer opaque to GCC,
> -	 * preventing the bounds analysis.
> -	 */
> -	barrier_var(ptr);
> -	user_vm_start = ptr->user_vm_start;
>   	fault_addr = user_vm_start + 0x7fff;
>   	bpf_addr_space_cast(user_vm_start, 0, 1);
>   	/*

