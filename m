Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 473A73CC9FE
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Mar 2026 12:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774443090; cv=none; b=UfAxrUlt6+6ycf+zcoXGTdonIFx5x6ItXZTUN+uERgsLfKYDwiNeTpKSMvRONiaAkdmQxdmytXJUJxfBIhBaUeSQO9UQVeE//TpqpG5sjAsgdCkawzjSHoSGy1u/tUqj6AV3JexiAqJWEEbx0BQz70e/7BFQY5hQzLE7uJ5VZ9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774443090; c=relaxed/simple;
	bh=GPBTp+1O4+roFKFHMU9nfDulOedOh68Qri2l6aoSPhc=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LqkYpKSPJBT6IlW8uAdTg83ViuIihPNG8kCdPsnjt++2+vRHUto0ZZWNE/ZfkGCwCwWRRyh8KzObxXx1MH3J+0F2ersjhaNEHT7LE+TKQ+CNRXq9YtNZ3nNUyuGmgY9dJKgeWcGgkjyWwjEYYXKpSnfSPkH+4vvuHLd9+VFtgZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uw/UpztU; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uw/UpztU"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-486fd3a577eso44953745e9.1
        for <linux-kselftest@vger.kernel.org>; Wed, 25 Mar 2026 05:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774443088; x=1775047888; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RZG+AxjObasS6xwUegN7FbbmRxqAFvfcWHCDJeVu0lU=;
        b=Uw/UpztUI/fwK/0kWmaICCJCsgBuI7s8r37hRp0B7mNVy69q7vWu4z5CkKIzzJ8nTa
         6KcI66TElgzmXbJyBwjJSdXdPmQ3b0ntBEQavyWOAX3V94aBR3KmUtguB3Q+MXY3RpKn
         KIWTLZIqr/jy2pvYBXs21o/6oCBXESOU2ToR/5N2EyI9OO0TFhUnxSXgQWTHJbLNABmF
         BZgVfP1wK38qZsN/eI7x11EvPVJI5Z92aLCGQu+LwOqw/6CVftuDG2oldc0qIOUYtvSB
         NRVjm9h3O+YsXje2m+o8wgfrWX0Zn0wbXVFv1H7azG2ztwltcGMBojfknS49LYY2LS8a
         wE+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774443088; x=1775047888;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RZG+AxjObasS6xwUegN7FbbmRxqAFvfcWHCDJeVu0lU=;
        b=oIPhR7yTfrL7bcB6/YCBuIXRFi1LQ2/QUyJXJ+cBWxECfhZzofVBi+0k5E+ONqQKxf
         8KT5nI9XIR8E5CQ/5tP78H7136iRR7MheFi9Y797+Z98Hekz3gKPGQd5aNmUx3cyD5wy
         rthAy0GDQ44oLfoLb4c14ezIA/JP5ZBFtz/itxy8MrSpxmx1BKZ5MAN7Z4arPyWUJ7Py
         bmprdhqYgcTPzWre1ykVW4xIz+pi5VQ8uGaKasVyvHZssiDS29QrWziGMue2E6z9APCn
         1bAgHz+kxm4O4e1IYj1SjpGueQmkv4e02hDGYsAi/V0j/5D7bNs0J6Yz6cm+YVOs7/Eh
         07BQ==
X-Forwarded-Encrypted: i=1; AJvYcCXM/EJEFgNMUSfrumC6ycnWmrln1SPr47DRGUOjgd/7IJ1T0nSSF0tOUzdi7UVGiYv2WQB6yZyr+z0jPvP5ItE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWWbRYe/P3O0ODuVM2+oa+EVejrqgXRgzb57oZjcwNieq6zLH2
	y/iVfwO0W7daXIqtYqk9YLmjyFn3dN9yWC6Lyp2ybeQ+hfE2s/CnE1Zn
X-Gm-Gg: ATEYQzyDNDckWgQQQhZMEV8gm++H6c1PGTIep4FDd6Fy3T7darEQnur2oZL2XuM8rqt
	BXUNgHvi5NnGVyvsPophb7Zy84QzFKSfYFuBsPKYPwNGnEzVokeywVn+Ph8llR/ZFmeQvmXbLKP
	bcfIwS4b9Hpb4TMBjfo/xF+wyUlSZC4mmOKH4FWKKuNKal+PoF+LMNmj+3OaoQGJKIYz4VVUWtJ
	wi/3XwG/TVzXrgtTpa6GGYmCztoM38wIV/x/3LwkPZBupENXjoMGmBdv3UfYJzlB5qEOOHrt3EX
	GXhagtOB8Yy/s0Kv0UA/nyIkxrtaB2uSHHwf/5n1CcEztwi6PPGLacI/8Mev3MUe2M/5pVWxmqC
	xLB8YgzP8BxkBLBiwme/uQJycOe0R2pyx4R53KbP7No8BfQ+5iyyknYEX6W+QRodujja3XCgyzJ
	UyMTfLeTisFbk=
X-Received: by 2002:a05:600c:6287:b0:486:fc94:d8f2 with SMTP id 5b1f17b1804b1-48715fe2ad3mr45978195e9.14.1774443087426;
        Wed, 25 Mar 2026 05:51:27 -0700 (PDT)
Received: from krava ([176.74.159.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487116c0c13sm271961125e9.7.2026.03.25.05.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 05:51:27 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Wed, 25 Mar 2026 13:51:25 +0100
To: Leon Hwang <leon.hwang@linux.dev>
Cc: bpf@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	John Fastabend <john.fastabend@gmail.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>,
	Hao Luo <haoluo@google.com>, Shuah Khan <shuah@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	Toke Hoiland-Jorgensen <toke@redhat.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, netdev@vger.kernel.org,
	kernel-patches-bot@fb.com
Subject: Re: [PATCH bpf-next 2/3] bpf: Disallow freplace on kprobe with
 mismatched kprobe_write_ctx values
Message-ID: <acPaTdLd70YI_uNW@krava>
References: <20260324150444.68166-1-leon.hwang@linux.dev>
 <20260324150444.68166-3-leon.hwang@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260324150444.68166-3-leon.hwang@linux.dev>

On Tue, Mar 24, 2026 at 11:04:43PM +0800, Leon Hwang wrote:
> uprobe programs are allowed to modify struct pt_regs.
> 
> Since the actual program type of uprobe is KPROBE, it can be abused to
> modify struct pt_regs via kprobe+freplace when the kprobe attaches to
> kernel functions.
> 
> For example,
> 
> SEC("?kprobe")
> int kprobe(struct pt_regs *regs)
> {
> 	return 0;
> }
> 
> SEC("?freplace")
> int freplace_kprobe(struct pt_regs *regs)
> {
> 	regs->di = 0;
> 	return 0;
> }
> 
> freplace_kprobe prog will attach to kprobe prog.
> kprobe prog will attach to a kernel function.
> 
> Without this patch, when the kernel function runs, its first arg will
> always be set as 0 via the freplace_kprobe prog.
> 
> To avoid the abuse of kprobe_write_ctx=true via kprobe+freplace, disallow
> freplace on kprobe programs with mismatched kprobe_write_ctx values.
> 
> Fixes: 7384893d970e ("bpf: Allow uprobe program to change context registers")
> Signed-off-by: Leon Hwang <leon.hwang@linux.dev>

hi,
so it's another issue in addition to that on with tail-calls [1]
do you plan to resend this fix as well?

thanks,
jirka


[1] https://lore.kernel.org/bpf/20260303150639.85007-4-leon.hwang@linux.dev/

> ---
>  kernel/bpf/verifier.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> index 12330466d58b..f8257bae6081 100644
> --- a/kernel/bpf/verifier.c
> +++ b/kernel/bpf/verifier.c
> @@ -6404,6 +6404,14 @@ static int check_ctx_access(struct bpf_verifier_env *env, int insn_idx, int off,
>  		/* remember the offset of last byte accessed in ctx */
>  		if (env->prog->aux->max_ctx_offset < off + size)
>  			env->prog->aux->max_ctx_offset = off + size;
> +		if (env->prog->type == BPF_PROG_TYPE_EXT) {
> +			struct bpf_prog *dst_prog = env->prog->aux->dst_prog;
> +
> +			if (env->prog->aux->kprobe_write_ctx != dst_prog->aux->kprobe_write_ctx) {
> +				verbose(env, "Extension program cannot have different kprobe_write_ctx value with target prog\n");
> +				return -EINVAL;
> +			}
> +		}
>  		return 0;
>  	}
>  
> -- 
> 2.53.0
> 
