Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C192B3A9616
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Feb 2026 16:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771952271; cv=pass; b=OoOwggY79gkVycHRybYuxW8Ks5hPexN3rHptaAq4loE/HKaRWm7Rthdk4gWjcyO6fEdDigljWmtISlrM2miq10z2LwEvqsdLdOwe4WkhGkHc/ssJ4NQnOhja3YqmoUKIHsVHVcJnkVe44ovtEj730WM2VE7Gpdo475G6YPhJ5q8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771952271; c=relaxed/simple;
	bh=LFeQAmfI2jWzGO6ITz55S3PHrzjDrm/EzGFx3B4VgN8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Tb1P1l8z3rqDL+I7sVSSPirmEKILSvmr8CRJM4PQOOkcKy08nac2hlx8gne2HPWL1D8OiWNE6+KCBoCe/93daM5hkuluNwQu3YHQIOj7OWHxdpWYt18p5ewIPePD9RbUTMLDYLY7jDxG7bs9rhGMnefkuiSC6I+zJwA9c71D9OU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eFWQhHH0; arc=pass smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eFWQhHH0"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4398dd671daso146282f8f.0
        for <linux-kselftest@vger.kernel.org>; Tue, 24 Feb 2026 08:57:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771952268; cv=none;
        d=google.com; s=arc-20240605;
        b=HtPWfOHbxh3BV1cuU1f0Wl466qEJi6xqDiaueCDyyGscT9CcLGexpbvexk2zEdtar1
         bBzNP/6Z/Pj+6P5PgNwRMQeF3R6VlYxeb7+Tv1vvG6J/IdQEyFB9HiAydvzwCr7Nu8A1
         Kkv1SHg9Nj7xiXgS01mBAKM15c8DYKgbxvPqQUiaWG0ENqNYFFrumm7Tl+bmta6wEnhe
         DJ8k29urxrLGoj7iyp96EqRr2Sw34Ptcx9rOOIviIzPlQcVzo+ufNMK3nxz/OAmIoQ22
         iNEC95H3qRt94YpNO2vOFIE85I9GIYPx0iz+s90QZLmhwhgo8r98QO80lnKWBWqczhMR
         iRYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Q/LZ5/ET/z0VwePFl8rmo2+n6v10vbg5EI+OLa8kbxI=;
        fh=stK5+AOtLZq5RrYeJPIj4AB0lI8VftngWZhXKbClfIY=;
        b=aecdh2Ti+/tAnBq1lMJA2QNp7p1BZjc8S+RFXZdsKF+eKoqPwGAOobMOz0iWnhNIYA
         BfvxbPx8SBu38WSv3pWPTJ8j3JGiiS3bFNhxRcrZdhwBHILFcuh7O8JOJZEuw11qPNSB
         bnIR+xhMEWHP90tyCPg0LSHrY/5RXDculywhrexjXvAb+dMpG29kKcBGvNT+bV8+uu+X
         LZcaFzaKvpMpgM13eBV/GkQihCJB9h3ReT0ZqJdZ01JA14Hir1cfcX9ssuPOP78bVn63
         a+vY/jnTHAVF4WRbuwsu4fTN5ibcqPBc0G0ZiK6nfwWcIpL0BJNN198QUllvl9JX7Nrc
         dfkQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771952268; x=1772557068; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q/LZ5/ET/z0VwePFl8rmo2+n6v10vbg5EI+OLa8kbxI=;
        b=eFWQhHH0tXrcLKY/l/h63HjEN4E5cgnjyg/bZkhOlXYfKPyjIZkb78Oh+FyxIfkTFi
         7fCWJ9wUePTGSYEymzuljKO+kK4YZV2/G6TGaCAeribNY/zxMIMsRqnUq2830SDTHe1V
         BVw8721IvYqBpvRvCRyAENNID9X9SECoy2QUBZLvjMt3s802aD6WlAe+RAEjXlyPJyX9
         3sFlpWc177VtO6PEqk+BEXjirVByVhRu55obFAvNPJaZmchRmZ3E2MbLoPHTq5Y9TYg1
         6S8Zp7Jg5AteW2VqXdkcnkJmWLxRuHT3pxOv111WI+15N1T2GvoFUK5XUe/6G5ogzmTI
         Wu/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771952268; x=1772557068;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Q/LZ5/ET/z0VwePFl8rmo2+n6v10vbg5EI+OLa8kbxI=;
        b=FOQGWMOb42cEkU9Hx+0pMqAS5GkuHLtRxAY3F1iGGQnL21pt0X5YdW24nuLJ5MWVk1
         WMaQP0KVBM5cGY1jTd5Zx4sb29mBO2vZ0cr/wKABAjNcorVNIV2o7K4f7P6TbLDQEGQW
         bDm4488SQWaO8FlsSUV+BSSt6tZ4MQTEO1nUksqqeu4A1UrwMYDRw2aL3J3mAZ5QMBtX
         Rp1KCIwgQZZiM5EyV7x30G1prbxj+HS5atuyBRS2uLqF5Nar0mXaS2QyQmKzA+JE4TsP
         3kS0Z9AhwUSR7hUp3h94iTenOaKhJ0HY8LgIzAP/b8f/XmB7HNhJGcLsh3HIBO5Tzgg1
         /XLA==
X-Forwarded-Encrypted: i=1; AJvYcCWoyrlwojyeHef5GN9T/OF9edb64fcFbI1ucMg3YuxYrZGY6OCqAGDdOUuj0zGqpMc6D8i5n8twS1dFJ+kdI9c=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHj3qsQPsSKhxKduBzpzv9Xzy3r7bvbwzBJpGOxSDdGpWl5aDU
	sWO2gs0yhJVxS7+mOWfhVJPywrANnCi3o6tL4zcM4pbAAAC2Au9fxrILIiGilnJ/HjSWJNNxZ7m
	jD8aOHPixGyC6hLbCeHnS4kUFwk7ArS8=
X-Gm-Gg: ATEYQzwM06yJZI5ikMl3yRM9qy3tNaHlKlijzyOeSIkz5uhYctzGU6eRTIabEniKfbX
	paQ+fpslBwZDJmBZPuRw9z+OIxIPjIOMAEZcK5z+67EiUA7MekuFEG7vInE5fegX0/AO9M0iQTj
	PymZrVtwABuF7PrMER0omfuvcbRZifaTLDveFpyUJGjFoolptDYoG10ITHafCl5R6dikfALBWdZ
	7SW9mJ6nmNSATtxuf6CJCONf7jTa04beEZngm1oHSS3Jl28PtNKkyI/ti0Q2pqghGEpR/JgtxL4
	DyPxnjEno/u1uUNzmunbm415l8E5PngIFNkhlsMipKfX1q7PPUJ1P5bwjrRSmLmdixKpOHT1hl6
	OZae/coHk
X-Received: by 2002:a05:6000:2407:b0:435:bd00:cb4 with SMTP id
 ffacd0b85a97d-4396f15b2a4mr21141471f8f.23.1771952267940; Tue, 24 Feb 2026
 08:57:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260224154024.12504-1-leon.hwang@linux.dev> <20260224154024.12504-3-leon.hwang@linux.dev>
In-Reply-To: <20260224154024.12504-3-leon.hwang@linux.dev>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Tue, 24 Feb 2026 08:57:37 -0800
X-Gm-Features: AaiRm53rqopHuRGSK2_nQdOAXTbOuxaGhPPN68Nah4CqapKdrc7UpjUZrDEx1NA
Message-ID: <CAADnVQ+-V0-1i8_+CYpK7G0CnV-2n8e9Szv43yM3Az197eL_0A@mail.gmail.com>
Subject: Re: [PATCH bpf-next 2/8] bpf: Disallow !kprobe_write_ctx progs
 tail-calling kprobe_write_ctx progs
To: Leon Hwang <leon.hwang@linux.dev>
Cc: bpf <bpf@vger.kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Shuah Khan <shuah@kernel.org>, Feng Yang <yangfeng@kylinos.cn>, 
	Menglong Dong <menglong8.dong@gmail.com>, Puranjay Mohan <puranjay@kernel.org>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	Pu Lehui <pulehui@huawei.com>, LKML <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, 
	Network Development <netdev@vger.kernel.org>, kernel-patches-bot@fb.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 24, 2026 at 7:41=E2=80=AFAM Leon Hwang <leon.hwang@linux.dev> w=
rote:
>
> uprobe programs that can modify pt_regs require different runtime
> assumptions than pt_regs-read-only uprobe programs. Mixing both in
> one prog_array can make owner expectations diverge from callee behavior.
>
> Reject the combination of !kprobe_write_ctx progs with kprobe_write_ctx
> progs in __bpf_prog_map_compatible() to address the issue.
>
> Fixes: 7384893d970e ("bpf: Allow uprobe program to change context registe=
rs")
> Signed-off-by: Leon Hwang <leon.hwang@linux.dev>
> ---
>  include/linux/bpf.h | 7 ++++---
>  kernel/bpf/core.c   | 3 +++
>  2 files changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/include/linux/bpf.h b/include/linux/bpf.h
> index b78b53198a2e..2a2f6448a5fb 100644
> --- a/include/linux/bpf.h
> +++ b/include/linux/bpf.h
> @@ -285,9 +285,10 @@ struct bpf_list_node_kern {
>   */
>  struct bpf_map_owner {
>         enum bpf_prog_type type;
> -       bool jited;
> -       bool xdp_has_frags;
> -       bool sleepable;
> +       u32 jited:1,
> +           xdp_has_frags:1,
> +           sleepable:1,
> +           kprobe_write_ctx:1;

Don't you see how much churn you're adding this way?
Every patch has to touch two lines instead of one.
Use
u32 jited:1;
u32 xdp_has_frags:1;

also the bot is correct on patch 2 and 3.
Don't be fancy. Require strict conformance both ways in *all* patches.

And your codex selftests are garbage. I don't have other words
to describe it. They are not testing the actual bug that
your patches are fixing. Think of what you're doing.
Asking LLM to write a test for your other patch is not what you
should be asking it to do. The selftest should be such that
it proves the unsafety/crash before the fix.

pw-bot: cr
