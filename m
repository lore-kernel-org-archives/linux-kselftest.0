Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A95E32BE7AC
	for <linux-kselftest@vger.kernel.org>; Wed,  8 Jul 2026 13:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783516418; cv=none; b=Ew9wsn/3ZyGbt9d6HnHlTp3NLhUmQhGKwKcXaFoYb35PhGPG7f7t0R0U0eK2pTemkUiYkB8XVWGlF64Lhfxsb/OzWkcOzqAAdtkjaYFr9W44+U6h0Nlpsv+DNAdwepIJJLdAMbbDBoZOi6CCOcOLOYMUymtVRtKtx+b17vgSOSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783516418; c=relaxed/simple;
	bh=JmX7s0EIPqd9t8N5KHt8I/muMfShONzCYy2F/a/pPug=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V0J+4mdswivT/0iNT/lXoQMgk8XjIBSMPYr6DEJzDIJ5sphEIXvN7Ezs15CEXipHrX4GqQ7OLVD+jtKds9esCgrmoXj5r4hUuvY5cUjg21eiQ6ITa25N3z+kzB3TF+QJ1Km4Cl1XEyKA1KJVF2OB7TC5Trdq9Mv9VL5hczpwGFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=RGTseQPc; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="RGTseQPc"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4938d5f86f3so4397315e9.1
        for <linux-kselftest@vger.kernel.org>; Wed, 08 Jul 2026 06:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1783516415; x=1784121215; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=N1JyDujhG3Sgv6jNuFackk7ytJpNfqoiBKPjDFE83CQ=;
        b=RGTseQPcZtZCy+GKu8slT+uU23KKVJi0Hg6QKpofzMUFoqzr4nv/1+x3VgIee0StBM
         rsgFTb/h6nbReydwTcouZ0k5aHSVBN3mq7fYTft6TCkcuTr4Tc3kLt7ayVjOSF+TcOXy
         4EId9V14dif9/4WkwECtqq2L3+sWBN9ie+giCOcsMSPk+La6iwfuaP51+kxYYmvB1L8Z
         /XyXkQZU2/2YQqeZR7XEX2caF51nFeSz2cNNq2q6ECsv2IsQ4Pcskh11oW/rFrJd9uv6
         WESFMca7xn+71R9nAut/6oWrrevN3zdFE8+rF57s7YZpw8ofQHDJKiwIVpn0r0Vga5+N
         EgzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783516415; x=1784121215;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N1JyDujhG3Sgv6jNuFackk7ytJpNfqoiBKPjDFE83CQ=;
        b=dzFVJKaZY/82vIiErwR0hTCeKNnp9yuTbXRybx5X/1reyMjpOv5X/PTxSZi6+bCym9
         iHywY+wFkxIAOKm+hq2WdYUKE3mh0BhzG10t16oHHWRHL3Z9unaf9e55g32/WaZeRZcR
         QwVAmWgp/KEJCs13I9Jdjw5rOOumcBqr1waIqcuXEJENnT5qJcys88wFR4OotYdOJkAV
         +KgDYC85anrCynx6oLcazUWNX4WXh2ABBgIFzSlkXDnzvrwLwMUy6xveS97q9RdEh9C/
         cQ2RQ000rNtOE034F54qd1MrwMHtznQHfFQKu8/OFEzOczPOsnVZaP3UTAh7S51pEx31
         2bFA==
X-Forwarded-Encrypted: i=1; AHgh+Rplny0JbHMYIPzR8/X3cekNpJZrA9bnFLFMsuO/kUpSs7DT0F+DP8n/TeXSFC1Ij9lEgcmLevcYuMMLuQtOSUA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7Bva7U69XYryCwtWMN9bMu8Rji08AVBSc9I8Yt31ZnN6OOoR6
	Ud61okeoHNvPvhQ26DV/OdDu3jTz9MdT3l/fn4vTWB3JoD715/fo4tY6sKpZmCuseY8=
X-Gm-Gg: AfdE7cmhr3Vj9xoobs5uB1jSHB2oa2MUGbIipN7KZmMzeD7mkymz2Wc7AkQvn5oamdT
	wwrMVhE5gmkxryPv5yDd5pJDI7bGPFH7K7TjY1Auv17YOfTW6TzAKZH2DoNc9gqTHZ0kPIrg1Ey
	f3futFeLmItRL4GPDaUBaf6tt3OaTA8EA0ikdhU4e1IsDKk5ZPcoCfE2YHWWr1MKihIyOMu05bg
	MOFUy4jIK90FB99fA7qdPiQrcSzmvZROxS8RjM1JjejBkZ6hAmC9PGG7s6uYax334nNbMDfdnzV
	swQUpaCvcuJxNHmm8MtiVKJBBxiOUn+KttNcd8gQXK2yOV2/VrR+fa6pCTM7zA+yXemqe+qO9UB
	j9fVV8nkglv0+EtBAIRZd3VSnvDAuVrphw9H770dmbfCD2EdDfLT1wMyNDRxrY9+P0f9/HQc3XD
	94MfkW+oU2csNZP2lqe8aD5R1xXxiLIfCqNF5Y+dg=
X-Received: by 2002:a05:600c:49a7:b0:493:b240:6a8b with SMTP id 5b1f17b1804b1-493e10358a8mr44551725e9.14.1783516414979;
        Wed, 08 Jul 2026 06:13:34 -0700 (PDT)
Received: from u94a (61-227-80-86.dynamic-ip.hinet.net. [61.227.80.86])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5b3a2bf6bsm2461568a12.27.2026.07.08.06.13.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 06:13:33 -0700 (PDT)
Date: Wed, 8 Jul 2026 21:13:18 +0800
From: Shung-Hsi Yu <shung-hsi.yu@suse.com>
To: Sun Jian <sun.jian.kdev@gmail.com>
Cc: bpf@vger.kernel.org, ast@kernel.org, daniel@iogearbox.net, 
	john.fastabend@gmail.com, andrii@kernel.org, eddyz87@gmail.com, memxor@gmail.com, 
	martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev, jolsa@kernel.org, 
	emil@etsalapatis.com, shuah@kernel.org, mmullins@fb.com, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH bpf v4 1/2] bpf: Reject negative const offsets for buffer
 pointers
Message-ID: <ak5HLLrYK3R_g2y_@u94a>
References: <20260708090151.151729-1-sun.jian.kdev@gmail.com>
 <20260708090151.151729-2-sun.jian.kdev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260708090151.151729-2-sun.jian.kdev@gmail.com>

On Wed, Jul 08, 2026 at 02:01:50AM -0700, Sun Jian wrote:
[...]
> Fixes: 022ac0750883 ("bpf: use reg->var_off instead of reg->off for pointers")

Agree that above is the commit that introduced the issue.

More comments below.

[...]
> @@ -5326,14 +5326,18 @@ static int check_max_stack_depth(struct bpf_verifier_env *env)
>  static int __check_buffer_access(struct bpf_verifier_env *env,
>  				 const char *buf_info,
>  				 const struct bpf_reg_state *reg,
> -				 argno_t argno, int off, int size)
> +				 argno_t argno, int off, int size,
> +				 u32 *access_end)
>  {
> +	s64 start, var_off;
> +
>  	if (off < 0) {
>  		verbose(env,
>  			"%s invalid %s buffer access: off=%d, size=%d\n",
>  			reg_arg_name(env, argno), buf_info, off, size);
>  		return -EACCES;
>  	}
> +
>  	if (!tnum_is_const(reg->var_off)) {
>  		char tn_buf[48];
>  
> @@ -5344,6 +5348,29 @@ static int __check_buffer_access(struct bpf_verifier_env *env,
>  		return -EACCES;
>  	}
>  
> +	var_off = (s64)reg->var_off.value;
> +	if (var_off >= BPF_MAX_VAR_OFF || var_off <= -BPF_MAX_VAR_OFF) {
> +		verbose(env, "%s %s buffer offset %lld is not allowed\n",
> +			reg_arg_name(env, argno), buf_info, var_off);
> +		return -EACCES;
> +	}
> +
> +	start = var_off + off;
> +	if (start < 0) {
> +		verbose(env,
> +			"%s invalid negative %s buffer offset: off=%d, var_off=%lld\n",
> +			reg_arg_name(env, argno), buf_info, off, var_off);
> +		return -EACCES;
> +	}

I was thinking of suggest to just do a single unsigned check

  var_off = reg->var_off.value;
  if (var_off >= BPF_MAX_VAR_OFF) {
    ...

But looking at the code before 022ac0750883, what you have is closer
aligned to the previous behavior, let's stick to this.

> +
> +	if (size < 0) {
> +		verbose(env, "%s invalid %s buffer access: off=%lld, size=%d\n",
> +			reg_arg_name(env, argno), buf_info, start, size);
> +		return -EACCES;
> +	}

`size` comes from bpf_size_to_bytes(bpf_size) in check_mem_access(), and
is already checked to be not negative; plus other check_* helpers does
not check for this, so I think it can be dropped.

Otherwise, LGTM:

Acked-by: Shung-Hsi Yu <shung-hsi.yu@suse.com>

> +
> +	*access_end = (u32)start + (u32)size;

If you want, this could use a quick one-line comments regarding the fact
that it won't overflow, or even verifier_bug_if().

> +
>  	return 0;
>  }
>  
[...]
