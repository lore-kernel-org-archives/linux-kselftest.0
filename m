Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17EC2358384
	for <linux-kselftest@vger.kernel.org>; Mon, 30 Mar 2026 09:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774862943; cv=none; b=OX2Y13X9nDMoEwPFBfGjfmyh2k9MJGDsqjxtneYZoisJIca3Z79T+B1dU804fMxB3k1dLWD5ygtqYcAyPc+hxO9POTSxtJLSWBEMVLAXv1jg2fdO3y1htFPZdR70HGYmuaDjTr9aOxALf9Lcz0h6Ib3atpaW0BrRJ6GYVE/NM7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774862943; c=relaxed/simple;
	bh=e+FUhHbA4Jajf2W1lfzpcGpsDudB361fBC00sF1fM98=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ECbc54h2S2oTVkrlmv2NuSs67qzAY0DZ0q57GtKDur8Un9nk9zVrKwvjjjwppVvbBU9V4cUvUHKXcMH33U9V6GTsnhaJ5C/YEkD0VMYNo3f5KidNRc1wJuyp1dcX70X+n47CW71wa0oZW+YRFksqWTDBcvrCEMiSdPb8sYb1dPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jO8HRJI0; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jO8HRJI0"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-486ff201041so41817725e9.1
        for <linux-kselftest@vger.kernel.org>; Mon, 30 Mar 2026 02:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774862940; x=1775467740; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rQABhxo3yPzOnvpgbdKYStGL1AIsTI3bONLS/eN3r+k=;
        b=jO8HRJI0S05izMa8sJ2Rk6P08V/HCiBo4xBdt3UdoTWF/iDdVqVdUZ2u2SYqgkbvto
         64sMPOaYIA4EtyqesWCNClmV8UBp/pm60n60E5ttX28mrG1TWRKj2DTw33pfnWkmdsyx
         vFiAZO/dWtep8+tIcXe5yDMN5psiriwVLko5yqXGfM6RzmFVpTFnvJrL0Mjxf/wQqd4S
         3Dsmhc2YbEk4kFiwYx+BsWQ9GqiKBIj9dF2PbwnCa6vITzcSH2gdGmMjVka5Tr6ERXm5
         dcwytZSt6NzT5aB0b8RpVib+64jjmi2AtQb4qYsOl3CNLAVKXgXHtorGbDz/6lelPEKT
         fugg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774862940; x=1775467740;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rQABhxo3yPzOnvpgbdKYStGL1AIsTI3bONLS/eN3r+k=;
        b=ICXBm/0gZe5SipZGX+wsoITR3I/3zp9K5TEIrU9USdprngnHqOWDX8OvT09aAo6X0q
         WIw5/9pQoBfKcKH56qkK3Zwfx0os+YV3zLt4rE+ZvTNnlw23lu4zlwo1JelmfqoP/SzP
         EW8zt52bqNU9eOsfhQzh1UZO3khWRELgEutqFvgyqbF+FYcxGGwUTQKfYj5AEfwhtr/0
         9E+qyAMpDCQjwTqn4nmiq/21efXgj0xdAltdmXv9H6pQ/fUtC6Bmqx9wURdYPdmQ6aP0
         1oUk5fd68fxD8OeIQElKTbtAM4fgQi9tZSWQWdOi9+a0B9QuWNCkOZvbmujqvtxxMcHf
         iEIw==
X-Forwarded-Encrypted: i=1; AJvYcCU/9M4K9tDzK1Kj3KnnzgNi36SDEGzSLKf50rYrXqBx7eosogTDEeSgHqfE0aBUEZkLI/Nt3485KBAloPNnD/k=@vger.kernel.org
X-Gm-Message-State: AOJu0YyswHL9Z8QZOKkUJw/FnCBVAV3Od/JYQCCzlmoGKMZZYv7pH0Ay
	blNy7Kae2pn2fV/cYag5nj9oDjf20rS01wBBEzuzUX9JZt4wu6nTnBtj
X-Gm-Gg: ATEYQzzOvi/piGjxTtrVjTuHmntwzAPmhg82CpfWuBraDrTGENGmf7sE4ePwybWBZk+
	7JN++5lVdA7CYzUJgl9SYc7OxPOJOkuxElDDKbH3/iqlU6IBkDTGqmjhnp0v0/5ZkuiqyGtLkJd
	bpXAf+hxFiynnXvspBBO2H5nKPwBVihuTQR/xY9sUMJBzfLxA5hvGgP42lMx+DpQPW6XU3ws417
	9ThEQwNUlIfyxeCk2ezgA2D9TEK/zJt5o/JjvVpr+02crfazrRKm44g+Q6VRDOQVCarz2r5YO0g
	SXYMm4kGY7eOkinOlK9c6XDyDS2zwY+URphZ4+b4N9QUPFya2EkgF8VX/yZl7QelUVD3vQjLTgS
	kzArQ1Fgakh0ZgOTxTY9eAgwMKORZytLuDBMGhA4uC0HvOT7ottKdPjjLC6u2610SlMvyWk0vSY
	osxsg6W6H9+RjgXWYNE2UPKFIxX4pZvTCI+zI=
X-Received: by 2002:a05:600c:4f53:b0:485:3692:e8f7 with SMTP id 5b1f17b1804b1-48727ede47amr193606995e9.25.1774862940141;
        Mon, 30 Mar 2026 02:29:00 -0700 (PDT)
Received: from krava (37-188-160-213.red.o2.cz. [37.188.160.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf2463dc2sm17668983f8f.23.2026.03.30.02.28.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 02:28:59 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Mon, 30 Mar 2026 11:28:57 +0200
To: Leon Hwang <leon.hwang@linux.dev>
Cc: bpf@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	John Fastabend <john.fastabend@gmail.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>,
	Shuah Khan <shuah@kernel.org>, Feng Yang <yangfeng@kylinos.cn>,
	Toke Hoiland-Jorgensen <toke@redhat.com>,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	kernel-patches-bot@fb.com
Subject: Re: [PATCH bpf-next v2 2/2] selftests/bpf: Add test to verify the
 fix of kprobe_write_ctx abuse
Message-ID: <acpCWX6h-1IJtorN@krava>
References: <20260326141718.17731-1-leon.hwang@linux.dev>
 <20260326141718.17731-3-leon.hwang@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260326141718.17731-3-leon.hwang@linux.dev>

On Thu, Mar 26, 2026 at 10:17:18PM +0800, Leon Hwang wrote:

SNIP

> +	prog_fd = bpf_program__fd(skel_kprobe->progs.kprobe_write_ctx);
> +	bpf_program__set_attach_target(prog_ext, prog_fd, "kprobe_write_ctx");
> +
> +	err = kprobe_write_ctx__load(skel_ext);
> +	if (!ASSERT_OK(err, "kprobe_write_ctx__load ext"))
> +		goto out;
> +
> +	prog_fd = bpf_program__fd(prog_kprobe);
> +	link_ext = bpf_program__attach_freplace(prog_ext, prog_fd, "kprobe_dummy");
> +	ASSERT_ERR_PTR(link_ext, "bpf_program__attach_freplace link");
> +	ASSERT_EQ(errno, EINVAL, "bpf_program__attach_freplace errno");

nit, I prefer libbpf_get_error call instead, because it's not obvious
that ASSERT_ERR_PTR sets errno, smth like:

        if (!ASSERT_EQ(libbpf_get_error(link_ext), -EINVAL, ..

anyway lgtm

Acked-by: Jiri Olsa <jolsa@kernel.org>

thanks,
jirka


> +
> +	link_kprobe = bpf_program__attach_kprobe_opts(prog_kprobe, "bpf_fentry_test1",
> +						      &kprobe_opts);
> +	if (!ASSERT_OK_PTR(link_kprobe, "bpf_program__attach_kprobe_opts"))
> +		goto out;
> +
> +	err = bpf_prog_test_run_opts(bpf_program__fd(prog_fentry), &topts);
> +	ASSERT_OK(err, "bpf_prog_test_run_opts");
> +
> +out:
> +	bpf_link__destroy(link_ext);
> +	bpf_link__destroy(link_kprobe);
> +	kprobe_write_ctx__destroy(skel_ext);
> +	kprobe_write_ctx__destroy(skel_kprobe);
> +}
>  #else
>  static void test_attach_kprobe_write_ctx(void)
>  {
>  	test__skip();
>  }
> +
> +static void test_freplace_kprobe_write_ctx(void)
> +{
> +	test__skip();
> +}
>  #endif
>  
>  static void test_attach_probe_auto(struct test_attach_probe *skel)
> @@ -434,6 +496,8 @@ void test_attach_probe(void)
>  		test_attach_kprobe_long_event_name();
>  	if (test__start_subtest("kprobe-write-ctx"))
>  		test_attach_kprobe_write_ctx();
> +	if (test__start_subtest("freplace-kprobe-write-ctx"))
> +		test_freplace_kprobe_write_ctx();
>  
>  cleanup:
>  	test_attach_probe__destroy(skel);
> diff --git a/tools/testing/selftests/bpf/progs/kprobe_write_ctx.c b/tools/testing/selftests/bpf/progs/kprobe_write_ctx.c
> index f77aef0474d3..adbf52afe490 100644
> --- a/tools/testing/selftests/bpf/progs/kprobe_write_ctx.c
> +++ b/tools/testing/selftests/bpf/progs/kprobe_write_ctx.c
> @@ -19,4 +19,23 @@ int kprobe_multi_write_ctx(struct pt_regs *ctx)
>  	ctx->ax = 0;
>  	return 0;
>  }
> +
> +SEC("?kprobe")
> +int kprobe_dummy(struct pt_regs *regs)
> +{
> +	return 0;
> +}
> +
> +SEC("?freplace")
> +int freplace_kprobe(struct pt_regs *regs)
> +{
> +	regs->di = 0;
> +	return 0;
> +}
> +
> +SEC("?fentry/bpf_fentry_test1")
> +int BPF_PROG(fentry)
> +{
> +	return 0;
> +}
>  #endif
> -- 
> 2.53.0
> 
