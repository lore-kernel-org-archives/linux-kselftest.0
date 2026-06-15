Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82422409608
	for <linux-kselftest@vger.kernel.org>; Mon, 15 Jun 2026 15:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781538709; cv=none; b=pjdu1RfsPcstPihsmZmL+3sNLkyLn89u4jQmDjkpL6eFWovIWSkejuy5K9TSyblSFHqpaub0RvecMFrSMY3Amg3fBNT8K/LHLXlSvwHaCHdIIOQEto0nx18mDoWr3rli2N6sPhchCLhJgtnz6aTtjR6HsY0uyTm1F9lY0EaS2ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781538709; c=relaxed/simple;
	bh=q9e2NvWanWWTeyoVVHWGTmNx+4ZjhqA8PPerijFqXzg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=LoeLTaz3ePHkgl0GK/6d8640Wrkd7NFrvdsrkM8kHBl0Cri8uHT1GWuyj97jn/f+cz+uR+5DyXAN9c2anxDRnxSwU2vo15F1cnpjRt7rKqWLZQt7hymOXFrdeeaFwnXApE9eOXnKc1LsjiBadvIGLmyF8QEzDfQ+8/n9SyJtMe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vr6+iDBs; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vr6+iDBs"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7e6d37b7098so3727376a34.0
        for <linux-kselftest@vger.kernel.org>; Mon, 15 Jun 2026 08:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781538706; x=1782143506; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mIdch/GXuFS4bjK3LcJavigFgN1lb+ICZqzVniuexrA=;
        b=Vr6+iDBsV/BENVkRqlUxRB6liSH/JeKZqGyNysfp9T5yACZivQNfrpuGPWVAJGUY7s
         q7ToV2vYcIOHqB3MtYGFSde3Q71d0P1T1lHDepx0S4q53r9Y9x21xaF3B1JgQOGi5LVz
         xU/BqAiVwGddWqrP7yWpiGywcAKObgOMLFJHIrFyEDBAtUCkq+BFnmHHNG+7vPPv7+l2
         LW5RoyTwuqQTQkezxkCFerFx01P9fzQsKf3MI63gHtmU+6Vs4pQ383tmw2o9/JMye+L4
         lLaC1P3NqP1o8mh0BbPwUaWtmD7EjX4mPRvBUuToWpi6TptaiGnvf2GLkNgBVL3EgFq4
         vmRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781538706; x=1782143506;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mIdch/GXuFS4bjK3LcJavigFgN1lb+ICZqzVniuexrA=;
        b=NIinNjJwZoDpIwoU6Po9z4H20rwglg2AGU3lTv2K5KIYyAJbxEaqeVXEjISXvi7w+G
         nyP7VrpI4vTmLxnYt+yRFSPIw4/4FuJTawZKoz1HcDaXTKYEHYuGMZd+CK9TTahLIX3U
         71UEWeZ/F6iOjyiopkj2956SHhSptrIEEo4LeFA64ubQtgNVqxXPEyrdidTui6uktzZa
         ubrJsXoYe29ovUQOptKQteNCmyugTOHlfOBYXit/W9GGcEunpvESaJdAxiKuuan0+FCA
         Z2N+d12cWHEWZ97z8dgiWtGra8w4HoFxagAo6N/r9iAyVUTgPqTmKZLQAvuz0dhIydz2
         SIOw==
X-Forwarded-Encrypted: i=1; AFNElJ+ACf+S7dJPSJp3qIQp6dT+Eo08+loW16MGL01U1GkH4Ww06ix+bIYRv/eZDOsKhdeuWXfDUDEefoTManK5CcU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwuE3JVHmYXsUNCwwP2r5i/5zy3VohyJZldMMNSjRW5DP/QD+or
	RsgF0+x+TuUWptg5T2TYo2TrebvekUmwW0BoSSFrLAcJh9SkoePC8EJu
X-Gm-Gg: Acq92OGMJNewV5ZkDlZ6lQ73mHrH9nhQ5wleAk/a1hTmfsODqF+9sVthLtPdVpUYrXW
	SbeM3+ARybjl7BLKYBfaul+1yo057j/my+YF6RWDX0McrGVbwfcWEe73WZYLcWEDp8FEBV6phq5
	WDYbnWUqEqTu4oKb2+0kwPk6ddtMRUDLpVcuRWPbMKMUPRqlA9utOP3SVH4NkljSc2TQnXsYdqp
	PSgnqjA/Q5wB/RIogokd8Gp2wqepLPnX5jXiLF9PxsmxkvPNnQuPbAwaOLbNMPqzfaQ1m+bj1Fs
	IK8Kfxa1QRAaFv10QMAL1zXKSc2LS2ojhKpSAh6SxJ8DR67nnaZKqXPe8a2kLcyQGFP7GUCP/bo
	D+dmqyQ2Ur4wyMe7nld/F+YWj7XimTw5CRc+NA83OZah/KWYdCkkGtX8TkOdK4v0XfOnWGjfZ+m
	Jz39pxuSJ7hoktrcITpXZnP8KjJYAgkirlA+eF2ZyCrGGQRo6jJLYhmeNmyyH5o2f73n8obDWzn
	vFr5qUyaNeuzYhOqDsV9nitwPT6
X-Received: by 2002:a05:6830:380d:b0:7e6:f4a3:1dfc with SMTP id 46e09a7af769-7e784895f7emr9886125a34.23.1781538706341;
        Mon, 15 Jun 2026 08:51:46 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:5a::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e79f6dfaf4sm4498667a34.21.2026.06.15.08.51.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 08:51:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 15 Jun 2026 08:51:44 -0700
Message-Id: <DJ9QRIE49Y0M.EWR1O285AIVR@gmail.com>
Cc: "Alexei Starovoitov" <ast@kernel.org>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "Andrii Nakryiko" <andrii@kernel.org>, "Eduard
 Zingerman" <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>, "Martin KaFai Lau" <martin.lau@linux.dev>, "Song Liu"
 <song@kernel.org>, "Yonghong Song" <yonghong.song@linux.dev>, "Jiri Olsa"
 <jolsa@kernel.org>, "Emil Tsalapatis" <emil@etsalapatis.com>, "John
 Fastabend" <john.fastabend@gmail.com>, "Shuah Khan" <shuah@kernel.org>,
 <linux-kselftest@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH bpf 1/2] bpf: Fix packet pointer invalidation for skb
 dynptr writes
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Yiyang Chen" <chenyy23@mails.tsinghua.edu.cn>, <bpf@vger.kernel.org>
X-Mailer: aerc
References: <20260615120752.155006-1-chenyy23@mails.tsinghua.edu.cn>
In-Reply-To: <20260615120752.155006-1-chenyy23@mails.tsinghua.edu.cn>

On Mon Jun 15, 2026 at 5:07 AM PDT, Yiyang Chen wrote:
> skb-backed dynptr writer kfuncs can mutate skb packet storage.
> The verifier currently treats kfunc calls as packet-changing only for
> bpf_xdp_pull_data().
>
> That leaves direct packet pointers usable after skb dynptr writer kfuncs.
> The helper path already clears packet pointers for bpf_dynptr_write().
>
> Mark kfunc calls packet-changing when argument 0 is a writable skb or
> skb-meta dynptr destination.  This covers bpf_dynptr_copy(),
> bpf_dynptr_memset(), and probe/copy-from-user dynptr writers.
> Source-only dynptr arguments are left unchanged.
>
> Fixes: daec295a70941 ("bpf/helpers: Introduce bpf_dynptr_copy kfunc")
> Fixes: a498ee7576de ("bpf: Implement dynptr copy kfuncs")
> Fixes: 5fc5d8fded57 ("bpf: Add bpf_dynptr_memset() kfunc")
> Signed-off-by: Yiyang Chen <chenyy23@mails.tsinghua.edu.cn>
> ---
>  include/linux/bpf_verifier.h |  1 +
>  kernel/bpf/verifier.c        | 62 +++++++++++++++++++++++++++++++++++-
>  2 files changed, 62 insertions(+), 1 deletion(-)
>
> diff --git a/include/linux/bpf_verifier.h b/include/linux/bpf_verifier.h
> index 39a851e690ec4..c7d0c20a4961b 100644
> --- a/include/linux/bpf_verifier.h
> +++ b/include/linux/bpf_verifier.h
> @@ -1448,6 +1448,7 @@ struct bpf_kfunc_call_arg_meta {
>  	/* Out parameters */
>  	u8 release_regno;
>  	bool r0_rdonly;
> +	bool pkt_dynptr_write;
>  	u32 ret_btf_id;
>  	u64 r0_size;
>  	u32 subprogno;
> diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> index 2abc79dbf281c..5ea51bd284f84 100644
> --- a/kernel/bpf/verifier.c
> +++ b/kernel/bpf/verifier.c
> @@ -11016,6 +11016,16 @@ enum special_kfunc_type {
>  	KF_bpf_xdp_pull_data,
>  	KF_bpf_dynptr_slice,
>  	KF_bpf_dynptr_slice_rdwr,
> +	KF_bpf_dynptr_copy,
> +	KF_bpf_dynptr_memset,
> +	KF_bpf_probe_read_user_dynptr,
> +	KF_bpf_probe_read_kernel_dynptr,
> +	KF_bpf_probe_read_user_str_dynptr,
> +	KF_bpf_probe_read_kernel_str_dynptr,
> +	KF_bpf_copy_from_user_dynptr,
> +	KF_bpf_copy_from_user_str_dynptr,
> +	KF_bpf_copy_from_user_task_dynptr,
> +	KF_bpf_copy_from_user_task_str_dynptr,
>  	KF_bpf_dynptr_clone,
>  	KF_bpf_percpu_obj_new_impl,
>  	KF_bpf_percpu_obj_new,
> @@ -11096,6 +11106,27 @@ BTF_ID_UNUSED
>  #endif
>  BTF_ID(func, bpf_dynptr_slice)
>  BTF_ID(func, bpf_dynptr_slice_rdwr)
> +BTF_ID(func, bpf_dynptr_copy)
> +BTF_ID(func, bpf_dynptr_memset)
> +#ifdef CONFIG_BPF_EVENTS
> +BTF_ID(func, bpf_probe_read_user_dynptr)
> +BTF_ID(func, bpf_probe_read_kernel_dynptr)
> +BTF_ID(func, bpf_probe_read_user_str_dynptr)
> +BTF_ID(func, bpf_probe_read_kernel_str_dynptr)
> +BTF_ID(func, bpf_copy_from_user_dynptr)
> +BTF_ID(func, bpf_copy_from_user_str_dynptr)
> +BTF_ID(func, bpf_copy_from_user_task_dynptr)
> +BTF_ID(func, bpf_copy_from_user_task_str_dynptr)
> +#else
> +BTF_ID_UNUSED
> +BTF_ID_UNUSED
> +BTF_ID_UNUSED
> +BTF_ID_UNUSED
> +BTF_ID_UNUSED
> +BTF_ID_UNUSED
> +BTF_ID_UNUSED
> +BTF_ID_UNUSED
> +#endif
>  BTF_ID(func, bpf_dynptr_clone)
>  BTF_ID(func, bpf_percpu_obj_new_impl)
>  BTF_ID(func, bpf_percpu_obj_new)
> @@ -11229,7 +11260,33 @@ static bool is_kfunc_bpf_preempt_enable(struct b=
pf_kfunc_call_arg_meta *meta)
> =20
>  bool bpf_is_kfunc_pkt_changing(struct bpf_kfunc_call_arg_meta *meta)
>  {
> -	return meta->func_id =3D=3D special_kfunc_list[KF_bpf_xdp_pull_data];
> +	return meta->func_id =3D=3D special_kfunc_list[KF_bpf_xdp_pull_data] ||
> +	       meta->pkt_dynptr_write;
> +}

Nack. You misunderstand what bpf_is_kfunc_pkt_changing() is doing.

pw-bot: cr
