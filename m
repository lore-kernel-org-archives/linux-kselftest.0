Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 555BB40DFA4
	for <linux-kselftest@vger.kernel.org>; Thu, 19 Mar 2026 08:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773907762; cv=none; b=oXzDF5ON+FFYEVn0jZ/06nxRArjTlltqjJvn/fA0mg2WoKTzP1wjWj+YpczdYdGif5n/vQFV3EVgfrmy75HgJc8u3fBgQjz2lj7XfBPAt/cvMsBueYq1QVO1AHywAE2j/UBKhvbhS99xqOK8ro/ptaPIUyO1eQpnfhK/V2+TjaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773907762; c=relaxed/simple;
	bh=9HCjcz1ZaBKpGqOlxhy2gEzigHWfwfIbgjPAOTBjU40=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gv7oF5XxJ+sBGJbQzSqL+fabSCkiOIPFnIdxQT1BJGVnuymV4d/KSd2bFA+iPGn0NvX9jelXiOqrpxrZnvh0UmieLj85nIiHa0Styl/cxVonEt0b4F9NbK/fEQW3kVEsVj/Zf7D+c4jgi4l7gWxzB7vHdJbHvUumOHzC3kKI9sQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BmicJZwQ; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BmicJZwQ"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4852fdb36a8so3343315e9.2
        for <linux-kselftest@vger.kernel.org>; Thu, 19 Mar 2026 01:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773907760; x=1774512560; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i5/KWZ2KC3mOSlZnSNWNvP91BfBBZR4N9DqaTZXz5O0=;
        b=BmicJZwQWGQ37KgDjl7YkM2JNwUt43L/QNeKoY2bXWRxZtVb91qX0wVmcJSE2G/F++
         aXfkOeXceusVE0PR+rHoFpVkUo4+hKzb7URLrVzQ3zLutyDenM79c0iDu0mW4ZqsFzT+
         Dj6qSYkNeieHBkVetEVjkNaMcKlLlP8W410/MKd09OFLqkCEY/YZ8K5uc6FJAKSxJfoy
         fqbI6dyJSKNInPKjqU5axbxwjmhNrhHQ6P20QqGkw+q0VdEsCaN7fsvvYqVeNnLv87J8
         vrN/8+mYt9c2U5+y8EFQU/Ns5gRQUedeoWh8o46jf0a8xJzgG/w7UMJ2p4E1W5lLtUkQ
         v/LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773907760; x=1774512560;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i5/KWZ2KC3mOSlZnSNWNvP91BfBBZR4N9DqaTZXz5O0=;
        b=aN9XIdBwMO2NCc+TPzefv8/wvytBuo2h+acCvdd/DK0R5eIrSwxM0m9bS3OZCQD+8O
         /DinLDZC2ILQGuGYL2D+5K1zuzOL+RC3qTBQXUNj0vSAy3Xoey7jDjiqOPzGtW3XjmrV
         yRJHuk7aXnksUrTak/4yhB/Yp54U5jF1zJyNEex5FJRCbzbfekJjOzHgndBgn6CZ7wyx
         Waka7+Xjts+1dfNSvjs/sgw3OKYntJaZAJgNWTaXmvd8xZmBKX8IEE9YXRLyVCHopGZs
         iQC2gib6RuVxUn0Wkk55cvkT1UOIl7na73895g6m7T+PeqUc7HlLH0DxpkhBnHwDTBJE
         fGLQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4MXOIoumc0+QNUSN8QyV1Eoc6SgtxRTCB/AwMi+Na6PCO4K0WsC5WBHrDV90VHHp5MNk0jOa0UCONZlejY2o=@vger.kernel.org
X-Gm-Message-State: AOJu0YwidQllBnbp5m85mykHrYP3eKxgZ07uDkPHTKdSQXrVD3LXrflH
	2f4XW8juIU98t8SvEBmGyHPed4SSHxXp3NlnbVaf/uAssKI0ZiIR5pat
X-Gm-Gg: ATEYQzysrANYLnyy+zbKS6qXS5yCzNNPpwXWOn5BTRwNeM75dBr/bDLcMtojpvr2khD
	To2vfoN1cG7DRrCQijkA4sGT7Kv9pqeHFTmZlsiBsOwSo6c/19YVUQEFbgUxkOuqwVb4BBBjEJi
	nVX07jw113NwxgSfPil8oczOubi0V/pptZ31IcK7z9jaPzMQA0BBLWxsOy6l0om7njl8GmH9Ljd
	dbCubhk6CdfNmf0H5YAoaaKBgW0uC50No9kY6mS9eGXGU3Ho/LbEm02ZfsM9hRxni60ix73xNIQ
	6iJbDaMOEpH33/s/DynkkMOOSiq02u7gvK0nQHRJ4q2m3Blg0C36ldYOiB7/Vgns6wzYOfYqZ0L
	MMCjXb7xi4Qf9SGKMQc+i/4i3le4Mo0n389T+kC5288m8t/kiLJz4u1Imrd5rO6Nzr9vBk05+
X-Received: by 2002:a05:600c:4585:b0:483:709e:f238 with SMTP id 5b1f17b1804b1-486f4479926mr106286935e9.29.1773907759363;
        Thu, 19 Mar 2026 01:09:19 -0700 (PDT)
Received: from krava ([2a02:8308:a00c:e200::d99c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f462caf0sm56441725e9.2.2026.03.19.01.09.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 01:09:18 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Thu, 19 Mar 2026 09:09:16 +0100
To: Sun Jian <sun.jian.kdev@gmail.com>
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
	shuah@kernel.org, martin.lau@linux.dev, eddyz87@gmail.com,
	song@kernel.org, yonghong.song@linux.dev, john.fastabend@gmail.com,
	kpsingh@kernel.org, sdf@fomichev.me, haoluo@google.com,
	paul.chaignon@gmail.com, bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] selftests/bpf: move trampoline_count to dedicated
 bpf_testmod target
Message-ID: <abuvLDBz2GJ6cx_X@krava>
References: <20260319031227.330505-1-sun.jian.kdev@gmail.com>
 <20260319040337.366375-1-sun.jian.kdev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260319040337.366375-1-sun.jian.kdev@gmail.com>

On Thu, Mar 19, 2026 at 12:03:37PM +0800, Sun Jian wrote:
> trampoline_count fills all trampoline attachment slots for a single
> target function and verifies that one extra attach fails with -E2BIG.
> 
> It currently targets bpf_modify_return_test, which is also used by
> other selftests such as modify_return, get_func_ip_test, and
> get_func_args_test. When such tests run in parallel, they can contend
> for the same per-function trampoline quota and cause unexpected attach
> failures. This issue is currently masked by harness serialization.
> 
> Move trampoline_count to a dedicated bpf_testmod target and register it
> for fmod_ret attachment. This keeps the test semantics unchanged while
> isolating it from other selftests, so it no longer needs to run in
> serial mode. Remove the TODO comment as well.
> 
> Tested:
>   ./test_progs -t trampoline_count -vv
>   ./test_progs -t modify_return -vv
>   ./test_progs -t get_func_ip_test -vv
>   ./test_progs -t get_func_args_test -vv
>   ./test_progs -j$(nproc) -t trampoline_count -vv
>   ./test_progs -j$(nproc) -t
>     trampoline_count,modify_return,get_func_ip_test,get_func_args_test,\
> kprobe_multi_test -vv
>   20 runs of:
>     ./test_progs -j$(nproc) -t
>     trampoline_count,modify_return,get_func_ip_test,get_func_args_test,\
> kprobe_multi_test
> 
> Signed-off-by: Sun Jian <sun.jian.kdev@gmail.com>
> ---
> 
> v2:
> - rewrite the subject to describe the change
> - resend with the correct patch content
> - resend as a reply to v1
> 
>  .../selftests/bpf/prog_tests/trampoline_count.c |  3 +--
>  .../selftests/bpf/progs/test_trampoline_count.c |  6 +++---
>  .../selftests/bpf/test_kmods/bpf_testmod.c      | 17 +++++++++++++++++
>  3 files changed, 21 insertions(+), 5 deletions(-)
> 
> diff --git a/tools/testing/selftests/bpf/prog_tests/trampoline_count.c b/tools/testing/selftests/bpf/prog_tests/trampoline_count.c
> index 6cd7349d4a2b..b19358aed126 100644
> --- a/tools/testing/selftests/bpf/prog_tests/trampoline_count.c
> +++ b/tools/testing/selftests/bpf/prog_tests/trampoline_count.c
> @@ -30,8 +30,7 @@ static struct bpf_program *load_prog(char *file, char *name, struct inst *inst)
>  	return prog;
>  }
>  
> -/* TODO: use different target function to run in concurrent mode */
> -void serial_test_trampoline_count(void)
> +void test_trampoline_count(void)
>  {
>  	char *file = "test_trampoline_count.bpf.o";
>  	char *const progs[] = { "fentry_test", "fmod_ret_test", "fexit_test" };
> diff --git a/tools/testing/selftests/bpf/progs/test_trampoline_count.c b/tools/testing/selftests/bpf/progs/test_trampoline_count.c
> index 7765720da7d5..14ad2f53cf33 100644
> --- a/tools/testing/selftests/bpf/progs/test_trampoline_count.c
> +++ b/tools/testing/selftests/bpf/progs/test_trampoline_count.c
> @@ -3,19 +3,19 @@
>  #include <bpf/bpf_helpers.h>
>  #include <bpf/bpf_tracing.h>
>  
> -SEC("fentry/bpf_modify_return_test")
> +SEC("fentry/bpf_testmod_trampoline_count_test")
>  int BPF_PROG(fentry_test, int a, int *b)
>  {
>  	return 0;
>  }
>  
> -SEC("fmod_ret/bpf_modify_return_test")
> +SEC("fmod_ret/bpf_testmod_trampoline_count_test")
>  int BPF_PROG(fmod_ret_test, int a, int *b, int ret)
>  {
>  	return 0;
>  }
>  
> -SEC("fexit/bpf_modify_return_test")
> +SEC("fexit/bpf_testmod_trampoline_count_test")
>  int BPF_PROG(fexit_test, int a, int *b, int ret)

last part of the trampoline_count test executes the probe through the
kernel's test_run which executes bpf_modify_return_test

I don't think it changes much because the programs are doing nothing
I guess it's there just to make sure the link failure did not screw
up anything

we could call bpf_testmod_trampoline_count_test from
bpf_testmod_test_read and have the test to call
trigger_module_test_read

jirka


>  {
>  	return 0;
> diff --git a/tools/testing/selftests/bpf/test_kmods/bpf_testmod.c b/tools/testing/selftests/bpf/test_kmods/bpf_testmod.c
> index e62c6b78657f..6eaceb4dfbec 100644
> --- a/tools/testing/selftests/bpf/test_kmods/bpf_testmod.c
> +++ b/tools/testing/selftests/bpf/test_kmods/bpf_testmod.c
> @@ -581,6 +581,12 @@ noinline int bpf_fentry_shadow_test(int a)
>  }
>  EXPORT_SYMBOL_GPL(bpf_fentry_shadow_test);
>  
> +noinline int bpf_testmod_trampoline_count_test(int a, int *b)
> +{
> +	*b += 1;
> +	return a + *b;
> +}
> +
>  __bpf_hook_end();
>  
>  static struct bin_attribute bin_attr_bpf_testmod_file __ro_after_init = {
> @@ -1843,6 +1849,16 @@ struct bpf_struct_ops testmod_multi_st_ops = {
>  
>  extern int bpf_fentry_test1(int a);
>  
> +BTF_KFUNCS_START(bpf_testmod_trampoline_count_ids)
> +BTF_ID_FLAGS(func, bpf_testmod_trampoline_count_test)
> +BTF_KFUNCS_END(bpf_testmod_trampoline_count_ids)
> +
> +static const struct
> +btf_kfunc_id_set bpf_testmod_trampoline_count_fmodret_set = {
> +	.owner = THIS_MODULE,
> +	.set = &bpf_testmod_trampoline_count_ids,
> +};
> +
>  static int bpf_testmod_init(void)
>  {
>  	const struct btf_id_dtor_kfunc bpf_testmod_dtors[] = {
> @@ -1859,6 +1875,7 @@ static int bpf_testmod_init(void)
>  	ret = ret ?: register_btf_kfunc_id_set(BPF_PROG_TYPE_TRACING, &bpf_testmod_kfunc_set);
>  	ret = ret ?: register_btf_kfunc_id_set(BPF_PROG_TYPE_SYSCALL, &bpf_testmod_kfunc_set);
>  	ret = ret ?: register_btf_kfunc_id_set(BPF_PROG_TYPE_STRUCT_OPS, &bpf_testmod_kfunc_set);
> +	ret = ret ?: register_btf_fmodret_id_set(&bpf_testmod_trampoline_count_fmodret_set);
>  	ret = ret ?: register_bpf_struct_ops(&bpf_bpf_testmod_ops, bpf_testmod_ops);
>  	ret = ret ?: register_bpf_struct_ops(&bpf_testmod_ops2, bpf_testmod_ops2);
>  	ret = ret ?: register_bpf_struct_ops(&bpf_testmod_ops3, bpf_testmod_ops3);
> 
> base-commit: 8a30aeb0d1b4e4aaf7f7bae72f20f2ae75385ccb
> -- 
> 2.43.0
> 
