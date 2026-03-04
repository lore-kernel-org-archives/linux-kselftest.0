Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 523CE33688B
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Mar 2026 11:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772623465; cv=none; b=Ci0QZ+zMZlpw+/slgcGAR31+kTvYh1CrzzwI7CoEeCZ/04K0WyT+avPbpWdK3N9URkw5g/TmTHI2ZkgP0gBmLol6LeyjT1KLSJx0MG2p/eTWaToYLGCifook0WQKTuWyEfebdJdNk/kpONDwDfSRmW1xhdwl8F7IAqCxApLr6Yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772623465; c=relaxed/simple;
	bh=4BP01x/Nn5kraMGXyig7U8DEbw5IZxrqUhyGpRTxi+c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bIIQh9q9V0P0HGSH4FEur49kZzZsPX4l3Y3puPVHQZAWkTQiGLhGatPX4LPjyIphRJBOiKkI4Ubpe0AwZrCrZkxSXMq/nAwAEYI7LpQuwYvhEvsSIAv7+eXzCxqWsOeaMxk2GsptDUxYf2DzHGOlGjr9+9Al8kfH5RsxFZzJBaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GemdBqVB; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GemdBqVB"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48378136adcso40187775e9.1
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Mar 2026 03:24:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772623463; x=1773228263; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/yNT5n5DhF68AeSX9KVEwEFmbIkkUqzIjuiTWXrjq2U=;
        b=GemdBqVBTraj+go9pnYtEThEdr9sKaOzUNCwS/1gYIFd7mG3N8HuxwHXk4DC55A7sB
         5J5eTuIJvtsycu7frxCmu0rWjBie40FlkNBWKToL6ifGlpGrINvo2gCSm106E4Sc8Tmt
         +oRZUjejsezXLNISPTQ0O1o3UuM5URI86X3vEK4OU3ZzjVUFmL8ii7Wws10oZ+RKJYA5
         2wUNiDdZ5PYMU6GvUb9GXTQfP14y7HtQtkEC3qzQDiP5n90ywmW1sexBFRE3bAWsMaYi
         WXWr5IIyDgAbMXaNA+mdr3N0oKx198L3hEImRhd3cIExvgJPjPR048XlKcb0oXwa9a1W
         gNEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772623463; x=1773228263;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/yNT5n5DhF68AeSX9KVEwEFmbIkkUqzIjuiTWXrjq2U=;
        b=YSlo27yPKyqw2ofNbFMe588WoJmXGocuqP43iU8QzsEMGaiFaN8JM1+YvuLvGkYpdg
         aGfR9UNVeV/BRSP/BD7SWluH9YJSQWsh/KMDlBbyp9dZd6grojncBW5prOkuZEZi6vye
         I+oIkVj2Lbcz6H+VVlWgAlcA6Mkv6/IzKmAzVqkVW4cjiCvn7yUFvT3tVe5lD09rBfEa
         dXZEWKSBOOjybSFDDzn+fr3+TRmwdsmh0Lud44LkfVt9qU188GCgub6iIaJnco40MJbg
         3o+lHkuzr+9VpavxMdzWh3yCnZpEBtnjJS5BWoq8ZXmwAcrvQlgzCl/iSL01OXrnDnfF
         JGJA==
X-Forwarded-Encrypted: i=1; AJvYcCXh6Tpz1o8uvTNrE/bfVXjhhi9UCWPeQPnMK85Wkbj7aunnpuKJJTG/wKQEnIQZnXck/wJzOqcxhuIdoMLMqCk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwB2bM5Rmp30p1qIS/ESIr9N5djaO4bTorI+aS0M+JZVtRQ+YVI
	dlFh990dGrKACSEuLanibQ8ujn7xa5X8jBv/mx8ryR9Ir2eqnHihJPvG
X-Gm-Gg: ATEYQzzfg8lpZ9LoRoduUwgnq3vdlFW4pcD6VLzrjciXNsvkdSJXD32P03q0IiQnaAT
	yNgC8fjN8Of5IsHmGghVmVO9B2ECd3GsUikr9IgF8ZnwnoaIYbGrOzrMhRgVhdkf6eOcN1d1/Jw
	LQl77BnsUcRurWwm0cJmOtWZH+o/duaq9qXyoOuhPK1lz9/U+rf05FvQ/rCY/KtdszaZ1FnuErH
	TjlK1LQFb1TDTgCJP1tZkKQKYuh7XjG62HyrKoOTm/3XBrBlCjdr1QAtYWtaaQHHqUe4RkUqGOX
	v6XNhX23aWltZKNYz8vMsoy3Grk0qvFw6pedADGZ6ZLKqZlzYLL16ISqOBPpWFo91lrV8Yg2ahg
	iyZ49MyT73/yoqfrVrMtKL9gy5igB6/OZYMPxUamm84vkzHl5/2ILMeK3vC+GJuX7Bb77WRtyVm
	txqpSmG7F5px2DN5RZd7Xgfv8+IvQrXHu0CoRlY0BwrZcKKWEnXb4Kdq3ZVkI0HLbEwYsAbt5tt
	QlpuSx+qhNCBm/hb++RB8KcXbxg4paruryZgXFbpFDEuN24P8+vFHmY0Yf4kZs5DWtoeBeDKKRG
	D9vkkSrL5Q==
X-Received: by 2002:a05:600c:1c22:b0:483:b2a8:33ff with SMTP id 5b1f17b1804b1-48519837facmr28999105e9.4.1772623462344;
        Wed, 04 Mar 2026 03:24:22 -0800 (PST)
Received: from mail.gmail.com (2a01cb0889497e00a157f2ce043226e6.ipv6.abo.wanadoo.fr. [2a01:cb08:8949:7e00:a157:f2ce:432:26e6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485187c2ef2sm46719035e9.5.2026.03.04.03.24.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 03:24:21 -0800 (PST)
Date: Wed, 4 Mar 2026 12:24:19 +0100
From: Paul Chaignon <paul.chaignon@gmail.com>
To: Sun Jian <sun.jian.kdev@gmail.com>
Cc: andrii@kernel.org, eddyz87@gmail.com, ast@kernel.org,
	daniel@iogearbox.net, martin.lau@linux.dev, song@kernel.org,
	yonghong.song@linux.dev, john.fastabend@gmail.com,
	kpsingh@kernel.org, sdf@fomichev.me, haoluo@google.com,
	jolsa@kernel.org, shuah@kernel.org, bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH] selftests/bpf: skip verif_scale_pyperf600 on -E2BIG jump
 complexity limit
Message-ID: <aagWYyrrwUt-poL1@mail.gmail.com>
References: <20260302071434.311395-1-sun.jian.kdev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260302071434.311395-1-sun.jian.kdev@gmail.com>

On Mon, Mar 02, 2026 at 03:14:34PM +0800, Sun Jian wrote:
> verif_scale_pyperf600 loads pyperf600.bpf.o, a large scale case produced
> by partial LLVM unrolling.
> 
> On some kernel/toolchain combinations, the verifier rejects it with -E2BIG:
> 
>   The sequence of 8193 jumps is too complex.
> 
> This hits the verifier jump sequence complexity limit (8192).
> 
> Treat -E2BIG for this test as SKIP rather than FAIL. Other pyperf600
> variants are unaffected.

This is a known issue with LLVM 19+ [1] and this test is already
skipped in CI [2, 3]. I don't think ignoring the error is the proper
fix here.

1 - https://lore.kernel.org/all/c8c590b2-40b2-4cc0-9eb7-410dbd080a49@linux.dev/
2 - https://github.com/kernel-patches/vmtest/commit/da142df34750386cac2ba10283d15216d5c8d033
3 - https://github.com/libbpf/libbpf/commit/02b3ec9ffc1b7000afa2a9ccc3dfd37de3bad8cb

Paul

> 
> Signed-off-by: Sun Jian <sun.jian.kdev@gmail.com>
> ---
>  .../bpf/prog_tests/bpf_verif_scale.c          | 22 ++++++++++++++++++-
>  1 file changed, 21 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/bpf/prog_tests/bpf_verif_scale.c b/tools/testing/selftests/bpf/prog_tests/bpf_verif_scale.c
> index 73f669014b69..181acdddea1c 100644
> --- a/tools/testing/selftests/bpf/prog_tests/bpf_verif_scale.c
> +++ b/tools/testing/selftests/bpf/prog_tests/bpf_verif_scale.c
> @@ -112,13 +112,33 @@ void test_verif_scale_pyperf180()
>  
>  void test_verif_scale_pyperf600()
>  {
> +	libbpf_print_fn_t old_print_fn = NULL;
> +	int err;
> +
>  	/* partial unroll. llvm will unroll loop ~150 times.
>  	 * C loop count -> 600.
>  	 * Asm loop count -> 4.
>  	 * 16k insns in loop body.
>  	 * Total of 5 such loops. Total program size ~82k insns.
>  	 */
> -	scale_test("pyperf600.bpf.o", BPF_PROG_TYPE_RAW_TRACEPOINT, false);
> +
> +	if (env.verifier_stats) {
> +		test__force_log();
> +		old_print_fn = libbpf_set_print(libbpf_debug_print);
> +	}
> +
> +	err = check_load("pyperf600.bpf.o", BPF_PROG_TYPE_RAW_TRACEPOINT);
> +
> +	if (env.verifier_stats)
> +		libbpf_set_print(old_print_fn);
> +
> +	if (err == -E2BIG) {
> +		test__skip();
> +		return;
> +	}
> +
> +	ASSERT_OK(err, "expect_success");
> +
>  }
>  
>  void test_verif_scale_pyperf600_bpf_loop(void)
> 
> base-commit: 11439c4635edd669ae435eec308f4ab8a0804808
> -- 
> 2.43.0
> 
> 
