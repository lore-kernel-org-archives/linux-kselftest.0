Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA8444C652
	for <linux-kselftest@vger.kernel.org>; Mon, 24 Aug 2026 15:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787586721; cv=none; b=Al++sPgaOVSRvimzscSmS0HDpgDLCdQWC2lQorCubYHJADVeP75oPq9lWArO0n9W1bNI+EZ06bEaVinLWl73e0D+fEvER68KJ86eUO9vAvsVJDTlZp3j8KSGYcrS4/Z96nlVjVXVxxKrmVLbjKPRloDgysku74KOXTVkS01hozg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787586721; c=relaxed/simple;
	bh=3gyly+c+I2AEmux0bh4xOmSULeV7900s63hgtTRKHAs=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=G+aGJCgcfetJye9SM2bFKQrV4DTZnScMIfLaARV5WON3bTcn3CZEnKx699jm+/x68LtRWCXBTEv+DEjevTzeCKHwAiSVWef9ZgaJIZFb+ypmZhqjVwYQfGUEZfN/L9PVXAFXwyoldQX7vT+mdvW0u/BckHvj+0HUkALdLWudWnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I82sp2gD; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I82sp2gD"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-47f7027ca11so1860114f8f.3
        for <linux-kselftest@vger.kernel.org>; Mon, 24 Aug 2026 08:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787586717; x=1788191517; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+Osj2yu2HHklc9zv5t/cOnCjTCe59WvSvWzhaH4fUPc=;
        b=I82sp2gDi6MaJIAcokniZVd0b6HluPfTrn5Sf8r9LNsrANrl0PkPgO9qjAAsGPm5n4
         XIHZ2owuQUPSB4QBhgTXZuGp3xgiKyAL0TuIC5LQCyHNBXkQlszVr1vyqfuu4vFSaWkI
         MdvUBf5EGJaEt7zn+TFUIAOex/NjUkvawZdunq+WKu4gTxRb5NogniTAzd6VSq6lh0W7
         /7D68xZ9HRddlAUXqFjIqTwWZRG3DgdDtocdCe14AbRd5pq12/Za7/IZU++KZ6xuQehh
         68lTEtxbFA10/TBmzU/nx+ppvgCGnOoObxmsGlFyns13f5sTDEnbnZJQn/Olz+7a7/n6
         2gSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787586717; x=1788191517;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+Osj2yu2HHklc9zv5t/cOnCjTCe59WvSvWzhaH4fUPc=;
        b=OvRaLLvgLdcRtbgfZQOxDdcphZ1UpX80vuijL+icrcG8ONCLXeggvF4m0GQBEoAFuk
         AQuOmgNY16pfoOkNQE9fC/PG/n3BNmnDGRBPfAXsQCssTFDmPwxp9ilbsX6QMFU2sLXd
         bZj1GpCu6LkIKp5ovX4RKcdGFI9VUCGa8fjbP+7FabJag9wCkJ28h7E7hxJw17WB2diy
         eyVs011ukUDz4zl8IsrqzcjYx/7JpyNYKJTlFnNLKjFOrZqcg2vhdZ85AtSYL0KsVuR/
         Bxm+bHfZ9CGPLMsRj6VBDbQWvtSiKPv+QB+acljALazXSI9PwW19spibfqdq/UypxIDW
         fZDA==
X-Forwarded-Encrypted: i=1; AHgh+RrPyb2+ycePBHWRCiQCjarphWcU+fdtKdcs6R17Kfpdmd7CpYb/0u+zf0N++PWO/Z85eaMQJQqiCx6fOZvzlwM=@vger.kernel.org
X-Gm-Message-State: AFuF++lXvCtH1MvJxQzF/SufH83nXdFaSo2KSPmK+ljaSxv4vajo4UUP
	EiB+SkcmUH5PTuIXc15/8zGvDYP1Sgo9xl8ZRU0vPzSKEoRHIeczMevc
X-Gm-Gg: AR+sD13RejV8wOaSuo45+/TwrExVmTbgJvB2Vu5aKMwH1pg1GbFZ5C5GO6XxoO/tKA3
	SbuIDt02PzLprd8xlVHdq/uDcG/J2xmlapdrvblsPzGJdb0P5TETRCqgMeEf5lRT+HpfA2DwSJ4
	UeiFIk8sdstr9cmHLXmyFrdDS9LS92qvo4KgIcr5mbAllyJt9Eh5JjlkopimuVleSTZP4C5DzgK
	lhzsPM1P4l6tg02A5YLUmF5F8iXXPhPhh2nRCyS7OTgCQM+d1vt2TS50I5acnInryP4n9QqIZUf
	ne6kPw+eI3KQ0phOr36lgnelITe92jJMWu5Tj0gAIlHhSHbmfVEt/pLAwH7S1SVNiXZXFnbE9D5
	DGjwgTwyg5rxjB514Q+Py7uOQ8N7UNWriEwQ8l+Rc+omSrAUZw/UlWJrAivbZDcuTKRG4HD3Eie
	00gdsZ6r/vpAKz5xeL3I3DCO1rFWFNGf1TaQvB/NTI93myUd6AjtW6mujGokTW2/JHnTOImoE9k
	TxtpRnC/LPBh1nJ88VzL51BFQ==
X-Received: by 2002:adf:e010:0:10b0:482:d7db:9e1c with SMTP id ffacd0b85a97d-482d7db9e38mr4090164f8f.19.1787586716481;
        Mon, 24 Aug 2026 08:51:56 -0700 (PDT)
Received: from ?IPV6:2a03:83e0:1126:4:5c63:74d0:c7a3:a419? ([2620:10d:c092:500::4:7337])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482c9c14749sm8612076f8f.36.2026.08.24.08.51.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 08:51:55 -0700 (PDT)
Message-ID: <0285c6bf-43d9-4664-b4a4-38f6fd2dc500@gmail.com>
Date: Mon, 24 Aug 2026 16:51:54 +0100
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] bpf: Cancel special fields on rhashtab value recycle
 instead of freeing
To: Muhammad Falak R Wani <falakreyaz@gmail.com>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>,
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>,
 Emil Tsalapatis <emil@etsalapatis.com>,
 Ihor Solodrai <ihor.solodrai@linux.dev>, Shuah Khan <shuah@kernel.org>,
 Mykyta Yatsenko <yatsenko@meta.com>, bpf@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
References: <20260824103502.3154292-1-falakreyaz@gmail.com>
Content-Language: en-US
From: Mykyta Yatsenko <mykyta.yatsenko5@gmail.com>
In-Reply-To: <20260824103502.3154292-1-falakreyaz@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/24/26 11:35 AM, Muhammad Falak R Wani wrote:
> Commit a3a81d2476512 ("bpf: Cancel special fields on map value recycle")
> changed array and hashtab update/delete paths to avoid full special-field
> destruction while recycling a map value. Such paths can run in NMI
> context for tracing programs, where referenced kptr destructors are not
> generally safe. Instead, bpf_obj_cancel_fields() cancels the NMI-safe
> timer, workqueue, and task_work fields and leaves referenced kptr cleanup
> to a later safe destruction path.
> 
> Resizable hashtable special-field support was added four days earlier by
> commit 6905f8601298e ("bpf: Allow special fields in resizable hashtab"),
> but its equivalent paths were not converted. BPF_MAP_TYPE_RHASH permits
> referenced kptr fields and can be used by perf-event programs, which may
> run in NMI context. rhtab_map_update_existing() and rhtab_delete_elem()
> therefore still call bpf_obj_free_fields() directly and may invoke a
> referenced kptr destructor from NMI context.
> 
> bpf_disable_instrumentation() around the rhashtable operations only
> prevents a nested instrumentation program from reentering a bucket lock.
> It does not change the execution context of the current program and
> therefore does not make a subsequent destructor call NMI-safe.
> 
> Use bpf_obj_cancel_fields() in both paths, matching array and hashtab.
> On delete, the allocator destructor performs full cleanup after the RCU
> grace periods. On an in-place update, the kptr remains attached to the
> map value until a BPF program explicitly removes it or the element is
> later freed, matching the array-map semantics promised when rhashtable
> special-field support was introduced.
> 
> Extend the map kptr lifetime test with an rhashtable variant. It stashes
> a referenced kptr, updates the ordinary fields of the existing value,
> and verifies that the update does not release the reference.
> 
> Fixes: 6905f8601298e ("bpf: Allow special fields in resizable hashtab")
> Signed-off-by: Muhammad Falak R Wani <falakreyaz@gmail.com>
> ---

It looks like Yuan is already on v2 of the same bug:
https://lore.kernel.org/all/20260824143621.2098856-1-chenyuan_fl@163.com/

I suggest we review those patches, instead of creating new.

>  kernel/bpf/hashtab.c                          | 26 ++++++++-----------
>  .../selftests/bpf/prog_tests/map_kptr.c       | 11 ++++++++
>  tools/testing/selftests/bpf/progs/map_kptr.c  | 12 +++++++++
>  3 files changed, 34 insertions(+), 15 deletions(-)
> 
> diff --git a/kernel/bpf/hashtab.c b/kernel/bpf/hashtab.c
> index d40cb5dd446ca..a395928a3cf20 100644
> --- a/kernel/bpf/hashtab.c
> +++ b/kernel/bpf/hashtab.c
> @@ -2864,16 +2864,6 @@ static int rhtab_map_alloc_check(union bpf_attr *attr)
>  	return htab_map_alloc_check(attr);
>  }
>  
> -static void rhtab_check_and_free_fields(struct bpf_rhtab *rhtab,
> -					struct rhtab_elem *elem)
> -{
> -	if (IS_ERR_OR_NULL(rhtab->map.record))
> -		return;
> -
> -	bpf_obj_free_fields(rhtab->map.record,
> -			    rhtab_elem_value(elem, rhtab->map.key_size));
> -}
> -
>  static void rhtab_mem_dtor(void *obj, void *ctx)
>  {
>  	struct htab_btf_record *hrec = ctx;
> @@ -2963,8 +2953,12 @@ static int rhtab_delete_elem(struct bpf_rhtab *rhtab, struct rhtab_elem *elem, v
>  		rhtab_read_elem_value(&rhtab->map, copy, elem, flags);
>  		check_and_init_map_value(&rhtab->map, copy);
>  	}
> -	/* Release internal structs: kptr, bpf_timer, task_work, wq */
> -	rhtab_check_and_free_fields(rhtab, elem);
> +	/*
> +	 * Cancel timer, workqueue, and task_work fields before deferring the
> +	 * element free. Referenced kptr destruction is not NMI-safe, so leave
> +	 * it for rhtab_mem_dtor() after the RCU grace periods.
> +	 */
> +	bpf_obj_cancel_fields(&rhtab->map, rhtab_elem_value(elem, rhtab->map.key_size));
>  	bpf_mem_cache_free_rcu(&rhtab->ma, elem);
>  	return 0;
>  }
> @@ -3022,10 +3016,12 @@ static long rhtab_map_update_existing(struct bpf_map *map, struct rhtab_elem *el
>  	 * BPF_F_LOCK, matching arraymap semantics.
>  	 *
>  	 * copy_map_value() skips special-field offsets, so old timers/
> -	 * kptrs/etc. still sit in the slot. Cancel them after the copy
> -	 * to match arraymap's update semantics.
> +	 * kptrs/etc. still sit in the slot. This path may run in NMI context,
> +	 * so only cancel timer/workqueue/task_work here. Keep kptr fields
> +	 * attached to the value, matching arraymap semantics; referenced
> +	 * kptrs are destroyed when the element is eventually freed.
>  	 */
> -	rhtab_check_and_free_fields(rhtab, elem);
> +	bpf_obj_cancel_fields(&rhtab->map, old_val);
>  	return 0;
>  }
>  
> diff --git a/tools/testing/selftests/bpf/prog_tests/map_kptr.c b/tools/testing/selftests/bpf/prog_tests/map_kptr.c
> index 17e707dddda8d..9fddf03387bb8 100644
> --- a/tools/testing/selftests/bpf/prog_tests/map_kptr.c
> +++ b/tools/testing/selftests/bpf/prog_tests/map_kptr.c
> @@ -98,6 +98,12 @@ static void test_map_kptr_success(bool test_run)
>  	ASSERT_OK(ret, "test_map_kptr_ref3 refcount");
>  	ASSERT_OK(opts.retval, "test_map_kptr_ref3 retval");
>  
> +	ret = bpf_map__delete_elem(skel->maps.rhash_map, &key, sizeof(key), 0);
> +	ASSERT_OK(ret, "rhash_map delete");
> +	ret = bpf_prog_test_run_opts(bpf_program__fd(skel->progs.test_map_kptr_ref3), &opts);
> +	ASSERT_OK(ret, "test_map_kptr_ref3 refcount");
> +	ASSERT_OK(opts.retval, "test_map_kptr_ref3 retval");
> +
>  	ret = bpf_prog_test_run_opts(bpf_program__fd(skel->progs.test_ls_map_kptr_ref_del), &lopts);
>  	ASSERT_OK(ret, "test_ls_map_kptr_ref_del delete");
>  	skel->data->ref--;
> @@ -147,6 +153,7 @@ enum map_update_kptr_case {
>  	MAP_UPDATE_KPTR_ARRAY,
>  	MAP_UPDATE_KPTR_HASH,
>  	MAP_UPDATE_KPTR_HASH_MALLOC,
> +	MAP_UPDATE_KPTR_RHASH,
>  };
>  
>  static struct bpf_program *map_update_kptr_prog(struct map_kptr *skel,
> @@ -159,6 +166,8 @@ static struct bpf_program *map_update_kptr_prog(struct map_kptr *skel,
>  		return skel->progs.test_hash_map_update_kptr;
>  	case MAP_UPDATE_KPTR_HASH_MALLOC:
>  		return skel->progs.test_hash_malloc_map_update_kptr;
> +	case MAP_UPDATE_KPTR_RHASH:
> +		return skel->progs.test_rhash_map_update_kptr;
>  	}
>  
>  	return NULL;
> @@ -204,6 +213,8 @@ void serial_test_map_kptr(void)
>  		test_map_update_kptr(MAP_UPDATE_KPTR_HASH);
>  	if (test__start_subtest("update_hash_malloc_map_kptr"))
>  		test_map_update_kptr(MAP_UPDATE_KPTR_HASH_MALLOC);
> +	if (test__start_subtest("update_rhash_map_kptr"))
> +		test_map_update_kptr(MAP_UPDATE_KPTR_RHASH);
>  
>  	skel = rcu_tasks_trace_gp__open_and_load();
>  	if (!ASSERT_OK_PTR(skel, "rcu_tasks_trace_gp__open_and_load"))
> diff --git a/tools/testing/selftests/bpf/progs/map_kptr.c b/tools/testing/selftests/bpf/progs/map_kptr.c
> index 0d87c97dac991..44210dd3c0ec9 100644
> --- a/tools/testing/selftests/bpf/progs/map_kptr.c
> +++ b/tools/testing/selftests/bpf/progs/map_kptr.c
> @@ -57,6 +57,14 @@ struct hash_malloc_map {
>  	__uint(map_flags, BPF_F_NO_PREALLOC);
>  } hash_malloc_map SEC(".maps");
>  
> +struct {
> +	__uint(type, BPF_MAP_TYPE_RHASH);
> +	__type(key, int);
> +	__type(value, struct map_value);
> +	__uint(max_entries, 1);
> +	__uint(map_flags, BPF_F_NO_PREALLOC);
> +} rhash_map SEC(".maps");
> +
>  struct pcpu_hash_malloc_map {
>  	__uint(type, BPF_MAP_TYPE_PERCPU_HASH);
>  	__type(key, int);
> @@ -421,6 +429,7 @@ int test_map_kptr_ref1(struct __sk_buff *ctx)
>  	bpf_map_update_elem(&hash_map, &key, &val, 0);
>  	bpf_map_update_elem(&hash_malloc_map, &key, &val, 0);
>  	bpf_map_update_elem(&lru_hash_map, &key, &val, 0);
> +	bpf_map_update_elem(&rhash_map, &key, &val, 0);
>  
>  	bpf_map_update_elem(&pcpu_hash_map, &key, &val, 0);
>  	bpf_map_update_elem(&pcpu_hash_malloc_map, &key, &val, 0);
> @@ -430,6 +439,7 @@ int test_map_kptr_ref1(struct __sk_buff *ctx)
>  	TEST(hash_map);
>  	TEST(hash_malloc_map);
>  	TEST(lru_hash_map);
> +	TEST(rhash_map);
>  
>  	TEST_PCPU(pcpu_array_map);
>  	TEST_PCPU(pcpu_hash_map);
> @@ -468,6 +478,7 @@ int test_map_kptr_ref2(struct __sk_buff *ctx)
>  	TEST(hash_map);
>  	TEST(hash_malloc_map);
>  	TEST(lru_hash_map);
> +	TEST(rhash_map);
>  
>  	TEST_PCPU(pcpu_array_map);
>  	TEST_PCPU(pcpu_hash_map);
> @@ -599,6 +610,7 @@ int name(void *ctx)						\
>  
>  DEFINE_HASH_UPDATE_KPTR_TEST(test_hash_map_update_kptr, hash_map)
>  DEFINE_HASH_UPDATE_KPTR_TEST(test_hash_malloc_map_update_kptr, hash_malloc_map)
> +DEFINE_HASH_UPDATE_KPTR_TEST(test_rhash_map_update_kptr, rhash_map)
>  
>  SEC("syscall")
>  int test_ls_map_kptr_ref1(void *ctx)

