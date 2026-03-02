Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7D4F395240
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Mar 2026 10:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772445763; cv=none; b=k2Djx4yzKToi5XmATHjnJ3gJTJZ0nKmHzOXyDPHAmdv4kzJxkoHTMPb4DfHP7g7uQvdJSibI2kBjoU/5r2sHu0tulF11f3JnrIHsBLdxFVg1FJI+dmJnyONm0pto+N2AsnWsayMKa2POo0/+gai0RSAQwoR6BywhK8JzCpkLZkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772445763; c=relaxed/simple;
	bh=NIYHq2fI/Nnd6KvTmjKQB5oLNxpLVvK2ePSTu9K5RsQ=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rFsWOnDnAjsx7emvZV6p3NBbYIqH66oegUKlDV993zeJuMl23TuYW9TikF2/x65Lb/yBZnXeiEUD63ntR4eYlzFCqaKyZuM5SO4AaQQ7zMYeP/r7RKZjwZqZQIn1LJEvuki6pBR+g5CJin07fh6CTzj0NLZ5OD+Vsqg/BhSeiPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aPCtahYx; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aPCtahYx"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48371bb515eso64903695e9.1
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Mar 2026 02:02:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772445759; x=1773050559; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WZyBLvMkGew0ok4xTWt/X8AfGCSa7L5Et7GfpZ7AGBk=;
        b=aPCtahYxPex/NOVZ9oeMaLGMs/Vo6GbaW81Fh/9xBrGhiCCcotI+eWOzqcT5Jluyjz
         ySbPZyBfCKLQNm/KN4IGFnDSHDgKpBIVeeLTY1Cnt0/hJy39LNCtNKy2+3a7DL9O4/jx
         cNbtEGd8BdWdu1H3nb3YNvqCF/xlBbcSCwoIva+aIUbdqYLooDvkA8Hk1ONYJGVLvzfb
         Li/LMGTUacWdvlgu6X9NhG413doLlquQ1jAsDgf1j0xcjiNMjqz+1YLNeh/sqvWTgK+A
         s1gYEMfRxFQD1dH9SlRjRe+aqPiC2+vXe2FmMSeE91Fdc8Eun9aeWFWaZ3m6P5SHQV26
         /rKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772445759; x=1773050559;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WZyBLvMkGew0ok4xTWt/X8AfGCSa7L5Et7GfpZ7AGBk=;
        b=PMpSTC9QCeaTu77AfYl/JB5KNMl5vXpwoZnEcKCUWEYZzmAfiWqgqrKnzwrt4XrbVH
         m/37Rv+2JzBag+NZxrdXBQSfAn1/sEAlNvRa5SUU2bKSzgpAQi9gnb2jYhio4z4r7RYx
         niLENUtA6fma4QmR38DSqbabMbEE/Ef8dUyDIgdtWaC7ccyZafcfbY45W+wqIBHjMnOK
         OTNhGb/C57R06jDQ+Bnv6Z5Gag8PDC+uk5u9dAzQa4APi0aEdWQfqQ0zEjkUuFgE5eQY
         9CP0WGGgPD24Gh7UYrOXqYXclbDoDlNVZXdGsGYOi1f9RIl0N+3xZgmL26T/MXBLmcld
         KFtw==
X-Forwarded-Encrypted: i=1; AJvYcCUQ49RoeUVYQF0TlwTOx/RGD8F6UOKvEQfeQ/73f8hjPJMkC4Qrod7wTaz6LEmRLjT0Uqk+k6djzacdLnqDFXc=@vger.kernel.org
X-Gm-Message-State: AOJu0YweVSdCzgo6XtpxwAL0HnGM5S4cd/VhJtqnYE3PFZrpxID5c8OZ
	q01JNeo3PJJzZlG/Im3caS30HKekN1L/VVe71JkheAyV+SoADeVQ4vKo
X-Gm-Gg: ATEYQzyFb4a9zH99DLfx1ZFx+k7cKxQTaZfltR61BOJffNhBrE+NGPayLqfvU176RWP
	2n7EKsISopJ8uVMswU06bGiPrwN2iC9ycJaXUh/8mAuPDzkvDLa02qKj4AlQ/1dG/sHjrkGS3Dg
	lqTwqbmO5znHx07++YBDX1dyGnmV9ebZD6rFXSko6k3uRYqmjelws/WzWh068B5XVOuqMOw3NdV
	BT7EOXPe1hu9HBxvhAVyOzFMNfGzDzC0RCfGrDIik6Ss6Zz2LudAp5kS9+LOAdFBxnQkSrXF4Zy
	8bOF7iXCrPsYj4ZbHDBBymm4BQ3WjEqx+bsjx5k96X/KNctmwRtMvX5EuyVAy+i8TGKVtwAnLOx
	PGzIgY9xUdjl/epQ2AYA/uGMp4buBRRCf517pKDjRUm7iWA/pyjt664EHW/zk8jQj21K17Lm4Kp
	D63ZDsH7o=
X-Received: by 2002:a05:600c:1f95:b0:477:6374:6347 with SMTP id 5b1f17b1804b1-483c9c0bb23mr194470505e9.22.1772445758827;
        Mon, 02 Mar 2026 02:02:38 -0800 (PST)
Received: from krava ([2a02:8308:a00c:e200::d99c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd750701sm418417725e9.11.2026.03.02.02.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 02:02:38 -0800 (PST)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Mon, 2 Mar 2026 11:02:36 +0100
To: Sun Jian <sun.jian.kdev@gmail.com>
Cc: Andrii Nakryiko <andrii@kernel.org>, Shuah Khan <shuah@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>, bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] selftests/bpf: bpf_cookie: skip kprobe_multi
 tests without bpf_testmod
Message-ID: <aaVgPM5quBz-H3Yb@krava>
References: <20260228074555.122950-1-sun.jian.kdev@gmail.com>
 <20260228074555.122950-2-sun.jian.kdev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260228074555.122950-2-sun.jian.kdev@gmail.com>

On Sat, Feb 28, 2026 at 03:45:54PM +0800, Sun Jian wrote:
> The kprobe_multi subtests rely on bpf_testmod fentry ksyms.
> 
> When bpf_testmod isn't available, libbpf fails to resolve
> bpf_testmod_fentry_test* and skeleton load fails with -ESRCH, causing
> false failures.
> 
> Skip these subtests when env.has_testmod is false.
> 
> Signed-off-by: Sun Jian <sun.jian.kdev@gmail.com>

please include bpf-next in the subject, other than that:

Acked-by: Jiri Olsa <jolsa@kernel.org>

thanks,
jirka

> 
> ---
> Changes in v2:
> 
> No functional change.
> 
> Drop the unrelated perf_event_open() argument change from this patch
> (moved to patch 2/2).
> 
> v1: <https://lore.kernel.org/lkml/20260227164037.84110-1-sun.jian.kdev@gmail.com/>
> ---
>  tools/testing/selftests/bpf/prog_tests/bpf_cookie.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/tools/testing/selftests/bpf/prog_tests/bpf_cookie.c b/tools/testing/selftests/bpf/prog_tests/bpf_cookie.c
> index 75f4dff7d042..b7643a5bf7ad 100644
> --- a/tools/testing/selftests/bpf/prog_tests/bpf_cookie.c
> +++ b/tools/testing/selftests/bpf/prog_tests/bpf_cookie.c
> @@ -105,6 +105,11 @@ static void kprobe_multi_link_api_subtest(void)
>  	unsigned long long addrs[8];
>  	__u64 cookies[8];
>  
> +	if (!env.has_testmod) {
> +		test__skip();
> +		return;
> +	}
> +
>  	if (!ASSERT_OK(load_kallsyms(), "load_kallsyms"))
>  		goto cleanup;
>  
> @@ -192,6 +197,11 @@ static void kprobe_multi_attach_api_subtest(void)
>  	};
>  	__u64 cookies[8];
>  
> +	if (!env.has_testmod) {
> +		test__skip();
> +		return;
> +	}
> +
>  	skel = kprobe_multi__open_and_load();
>  	if (!ASSERT_OK_PTR(skel, "fentry_raw_skel_load"))
>  		goto cleanup;
> -- 
> 2.43.0
> 
> 
