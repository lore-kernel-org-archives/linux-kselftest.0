Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D704D3E51E9
	for <linux-kselftest@vger.kernel.org>; Wed,  1 Apr 2026 10:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775038716; cv=none; b=CIfkX6KOc+6V8pCgXPpZBF+Xu63M7LaTHpPniwBTWVQivJY7ScIzuY36mS2i+/LPivzFjKG7FVRDOp4bI4ODW56h+YW0S3L+r1QhaIeRxR3jzQau6/eIePDkXfR07EsD9h1bapnavstAndWveqD6hl3amet2wx9sRO3Rk+9QibI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775038716; c=relaxed/simple;
	bh=Wz+rTxMXFXCcsbcqYERrHHqU3UlCN8/24cOvHBXTsX0=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VQueP1HoQIIg+7nWyuBdcH2Bm7ymPuiNBmwiRIz/OPqFJ9cESVIOwlX2EfQBQVLAu2Rr6lOAsRg2QDt1lzVAkaRfO59n/+C3QHhBtiLYL1Po8ksIahQSEh0GHEqZylYYbpItImyldbfDLIQsJiwiLI69n5hrapZzfLSC+NxrVag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r7RgJ0lK; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r7RgJ0lK"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-48704db565eso82643955e9.1
        for <linux-kselftest@vger.kernel.org>; Wed, 01 Apr 2026 03:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775038706; x=1775643506; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=anYzjF7hGyuvz8IMGvRz0rbiAkEEPyOMLi1vC2Btujg=;
        b=r7RgJ0lK9peugos1A1ObMup3WsgNM1guHw208SoGiYJcGcfjsM0lNSlgYF4BRD+t/7
         fNF91wMvZhyZVDgxXTzeIMhZTbr9PIw5C75w8E9Zh6DjC8zP4zc6NKUNJyFixAhjjcD/
         fcOFmqMj9fjkHoDWN4XzJ7s8EofmHLgNEPUpiVoO+2P+iuTOWix9hbbJCf1Xxw86Avyl
         OavWJ3dA9VL8HcgfLD4320n1tKm7rouQtzgd2K4rdQjN9niAGpOnIIMqfXmHdG1xC/FN
         /pLopLzXc9eeYyr1YrtkSODujes8HFACGwCuK8P2QkD3mv+enQbsYhJvnQZHCB4Mx2cl
         +tvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775038706; x=1775643506;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=anYzjF7hGyuvz8IMGvRz0rbiAkEEPyOMLi1vC2Btujg=;
        b=qg/spuWGeOXX/qhodvez3hNm50tFmor6JaQoynRp9C+xYusL7z0kf+IvnfnLhlk9We
         7mz7Qf5IYzceTqb1umUKhVptSb1T+QKrDstt9GD0547cE5FrZ/DdgwXoorsHR3g7MP5c
         f0li6K1Ek230nbcGZ3IYr+EQfaWqrMbztq4/Bw+F0KJS4MYErMzMHofgBd7U+3wmlRTh
         Rh68QMbILduXcVZ/RKt42B2rS48zihZtqW84Dp8Lnu/0CqkOTxtc8I3dmrX7W0pfYZjQ
         xpCBTmqieDm0YAKi0pcKkYbTVbD+dRrQ5n6TxJtMgTKWVnvmZgCzJRlnqKbaUwY+L+Iw
         e0Kw==
X-Forwarded-Encrypted: i=1; AJvYcCXXAu4HT27po+aDy3AUuMxMb+mBMqYsR3u8VrmciwdET8mwuZ5mXumZmAaxuCfxrMAbVJg9Y1JFXhPUU+hmqRw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3NLs31+SS6K7QANmXAEB7RbydbKdJvjej7EMjNC+zA0uw7rMz
	5ReiKnX3o5Axxn4935jZRUfrnVfUbjwfgYOct7IfuR0erj2JGkdM+VFX
X-Gm-Gg: ATEYQzx3DlDtuPX80lUy5wAUj1roG3h144IJYW1P4GRxWapBKLxXWWCYuJfetm4VjiZ
	0I/w7pypFzuh3BjeY2uFEs3v2gDG8/ST1iOV9yI5a1BFCGFZbA+Zl+j2JwIP08WmA6LfAkwOPKW
	9cyMouBrVdgOE0nUXYFLgUQqcULZpV9oFrzCGQoO4ANuylsilvaHC57IPKbOPYogJFouDMIA+mO
	Zy4SSQmOU8Om5pBTnfzwdph7PQL2NatJgyIw8saWP+/tCq0YaMzxqZ5FfAPkxyORou0KfSm0eUF
	FpoVGdvnUrO/zDfmf80seUnnbySNz7/JC01VeAWfqb5zQGHU5Jg1OQF/wy8Zq8vm7gE/1fUj/lo
	1MtSJT185/0CAvkwQk+OGWizrUKaeafMpFakgP8Jk1cJXmlEm4WOmgWl1nxvJY3bPicmXEnHy
X-Received: by 2002:a05:600c:3f19:b0:485:35a4:939f with SMTP id 5b1f17b1804b1-48883599371mr44116175e9.28.1775038705666;
        Wed, 01 Apr 2026 03:18:25 -0700 (PDT)
Received: from krava ([2a02:8308:a00c:e200::d99c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf21e9e18sm32503913f8f.9.2026.04.01.03.18.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 03:18:25 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Wed, 1 Apr 2026 12:18:23 +0200
To: Hoyeon Lee <hoyeon.lee@suse.com>
Cc: bpf@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>,
	Shuah Khan <shuah@kernel.org>, Feng Yang <yangfeng@kylinos.cn>,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH bpf-next v6 1/3] libbpf: use direct error codes for
 kprobe/uprobe attach
Message-ID: <aczw7xAP9egtKgG5@krava>
References: <20260401070738.122709-1-hoyeon.lee@suse.com>
 <20260401070738.122709-2-hoyeon.lee@suse.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260401070738.122709-2-hoyeon.lee@suse.com>

On Wed, Apr 01, 2026 at 04:05:02PM +0900, Hoyeon Lee wrote:
> perf_event_open_probe() and perf_event_{k,u}probe_open_legacy() helpers
> are returning negative error codes directly on failure. This commit
> changes bpf_program__attach_{k,u}probe_opts() to use those return
> values directly instead of reading -errno again.

because the errno might be changed by the error path cleanup code, right?

Acked-by: Jiri Olsa <jolsa@kernel.org>

jirka

> 
> Signed-off-by: Hoyeon Lee <hoyeon.lee@suse.com>
> ---
>  tools/lib/bpf/libbpf.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/lib/bpf/libbpf.c b/tools/lib/bpf/libbpf.c
> index 9ea41f40dc82..536c19c14d21 100644
> --- a/tools/lib/bpf/libbpf.c
> +++ b/tools/lib/bpf/libbpf.c
> @@ -11835,7 +11835,7 @@ bpf_program__attach_kprobe_opts(const struct bpf_program *prog,
>  						    offset, -1 /* pid */);
>  	}
>  	if (pfd < 0) {
> -		err = -errno;
> +		err = pfd;
>  		pr_warn("prog '%s': failed to create %s '%s+0x%zx' perf event: %s\n",
>  			prog->name, retprobe ? "kretprobe" : "kprobe",
>  			func_name, offset,
> @@ -12825,7 +12825,7 @@ bpf_program__attach_uprobe_opts(const struct bpf_program *prog, pid_t pid,
>  						    binary_path, func_offset, pid);
>  	}
>  	if (pfd < 0) {
> -		err = -errno;
> +		err = pfd;
>  		pr_warn("prog '%s': failed to create %s '%s:0x%zx' perf event: %s\n",
>  			prog->name, retprobe ? "uretprobe" : "uprobe",
>  			binary_path, func_offset,
> -- 
> 2.52.0
> 
