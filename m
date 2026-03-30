Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03CC81F78E6
	for <linux-kselftest@vger.kernel.org>; Mon, 30 Mar 2026 09:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774862933; cv=none; b=eiR+CTicWaZZcyTc1qBsFDcylaSiyHeXCweSc24PNAwT6jdZMyBTd7BU0c0UO4wHUMSE9Po5oXbLslLRn0v4XjULNLVeXLtp9Ss5j/fH0SkXFI53uvadUY/vDnh0iJ4p5eyn1ElkM1YyavoKvQrMnFPuA3v8w8dkg/+NozHCSEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774862933; c=relaxed/simple;
	bh=6WUninn0ytXvxP+3t3zVwNpYHfoam31QwNu1dwEiaR0=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YzGY9XsNtjoetBA6W2KH3IRxUxcoXlWyK/A1tzJMbrIfmMOgh7BZ95WL61BhBINq7GJX5nV27rCteqeoB08wugfMyACbciKknsqRoXJHNWRK4kwE44scVuv6OT+Iqtn3DfIsslUcCJlCX5MdY+Qz/35bug0kv0Hd9QvnabJ6OP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LNMKktzB; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LNMKktzB"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-482f454be5bso49225285e9.0
        for <linux-kselftest@vger.kernel.org>; Mon, 30 Mar 2026 02:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774862930; x=1775467730; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e7XG/0PLX+YrM0watH6gpQSpsf3CdV74ZRdMj6DIh48=;
        b=LNMKktzB+JmVSC8JFIpABm5tFSVvpJV849NXHW4OozBmQ+Em0PxYuEbNwq92oBLG0v
         D0y6C+s1zLOcYoQUrpqUeKXIrOGmYZKQrA2443LKKXeeDiRSNJKbukd8kNHG05aeJ+wg
         So/Wcpoq4VA33LRUpU2HyEW2lfmK3DUswmxHUx9ABbzT8BhTybcfkyBWxmlZIq+raknw
         YRcZ2Brl8dmyQ56kiCdjRvsEnsVV7y3fM9g9xRsB7ghIxHzi8ryF4jm0MwqOYQZ0kQI0
         hSCcpNpCx3ZV3tWr4gIy5ukGgPl4r1NMYHmC4nYxI+skCtQ3+xch5opVr9MYmAHMGFdM
         1/dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774862930; x=1775467730;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e7XG/0PLX+YrM0watH6gpQSpsf3CdV74ZRdMj6DIh48=;
        b=Uzwi5yZYWwFksmgK7hVEe16PKXjb+b4jrsmf4GaulO9I+0rtLVYHs28jsDMtD8U2y+
         Qmm/8FqxLop1HYnWsJaIu6VIvIUHgiSM5zsXKrgOcybKcpi8ibJqp0YZSzpxhWOSAaWC
         7MjZJyfBfPo3MULJcOS5Si8XmqoM5KIOKAjHi1YNgfPo2OdaQDxiuiZ6l669nutIax8o
         L8DnOitZQoTFsSuq7UW2G33qCFQA/castXMSC5eBJsVelabxrk8VDp44VM+51wRamzBZ
         gJvZ9G5v7h6hWU7Sbg7GDYfgtfuh6kjrRjPvLfxowUls9QONcL7/MOi+b8ChzFlfAqXS
         +4jQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3TUMQuf7qVibIQlZ6GrMPfWCthLQBJD9rpNMt3A7VJBw+NkACXGQECxZiMoWui/vXDQEiRB/oMzcIrjVhrW0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzcjodyNroYEBPSfeTmCWBYzVtQuQLRzfjZN3GZ6sJuURBJo07w
	CQABBw8rZ0dc6m8l+2w41bWaz5HweCzPJHgGWtSd5IyI76vCNbwQbZgG
X-Gm-Gg: ATEYQzzpvZWbOafdHdKEq7EcCCxoaIHUAF3bxBSbUX2oIT95s1eKPVj6ybJJytB4epC
	5u2tBAfaawIjEGUtmesPvouaUmycSWbO/G5aRXhr8SVbolUOx5n5I+iFWIZk1AAq3zm2dB8V+Co
	n1vYuqwK5kVpwMHUxpP8F7sVnUwVXqcTTVl9py1Z2/wSMKpaGTDybSmODG5MC0lpCyh0ybJho1o
	kSqwRLYzqiA0eY76iRDLsuoU/FCOwu03epaGk3kXAhBGVLjOtPjC6e4Ml7dQqa4xZhYQ/C192YE
	uSRajulXLf18u9hqqT31iB2+McjZZEHvFsYWvGjSre3IVTScaccaumt/VaHvVGTbZrN/1bkEtk1
	mhybGAhxCM2EbM+gqQ24ZMoqTXe/jx15llinPWG6HBi3Rh+z4FrSvXJcwMR/WT9LXTW4/FmTZs4
	fmEqnDhQdj7WWflSztCtV1dJx/yFKJi2s6GhE=
X-Received: by 2002:a05:600c:c0cb:b0:486:fdb9:c065 with SMTP id 5b1f17b1804b1-48722b813cfmr155423875e9.2.1774862930199;
        Mon, 30 Mar 2026 02:28:50 -0700 (PDT)
Received: from krava (37-188-160-213.red.o2.cz. [37.188.160.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf245f8a3sm18972239f8f.24.2026.03.30.02.28.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 02:28:49 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Mon, 30 Mar 2026 11:28:46 +0200
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
Subject: Re: [PATCH bpf-next v2 1/2] bpf: Fix abuse of kprobe_write_ctx via
 freplace
Message-ID: <acpCTrpd-hak9S0y@krava>
References: <20260326141718.17731-1-leon.hwang@linux.dev>
 <20260326141718.17731-2-leon.hwang@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260326141718.17731-2-leon.hwang@linux.dev>

On Thu, Mar 26, 2026 at 10:17:17PM +0800, Leon Hwang wrote:
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
> To fix the abuse of kprobe_write_ctx=true via kprobe+freplace, disallow
> attaching freplace programs on kprobe programs with different
> kprobe_write_ctx values.
> 
> Fixes: 7384893d970e ("bpf: Allow uprobe program to change context registers")
> Signed-off-by: Leon Hwang <leon.hwang@linux.dev>
> ---
>  kernel/bpf/syscall.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/kernel/bpf/syscall.c b/kernel/bpf/syscall.c
> index 51ade3cde8bb..1dd2ea076d8b 100644
> --- a/kernel/bpf/syscall.c
> +++ b/kernel/bpf/syscall.c
> @@ -3733,6 +3733,11 @@ static int bpf_tracing_prog_attach(struct bpf_prog *prog,
>  		tr = prog->aux->dst_trampoline;
>  		tgt_prog = prog->aux->dst_prog;
>  	}

could you please put some comment in here explaining the check, with that

Acked-by: Jiri Olsa <jolsa@kernel.org>

thanks,
jirka


> +	if (prog->type == BPF_PROG_TYPE_EXT &&
> +	    prog->aux->kprobe_write_ctx != tgt_prog->aux->kprobe_write_ctx) {
> +		err = -EINVAL;
> +		goto out_unlock;
> +	}
>  
>  	err = bpf_link_prime(&link->link.link, &link_primer);
>  	if (err)
> -- 
> 2.53.0
> 
