Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E8554734D9
	for <linux-kselftest@vger.kernel.org>; Thu, 23 Jul 2026 17:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784828130; cv=none; b=qIFEy1hkzhWoOdfRm5bQuDkv5N/NGaolsgDmqHpH/2510ZJ/EH9RFIxMnBickT4UYnJdbZ/VSpPdjw2gBskOCsxNUn1ZhOOBmQXMZpOkvs9VGwZKDloB5FK1bAC7o5owNfgGwEmyex6cPO9NRlN+RCRmcyjjx7tAx6c7sT5XVkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784828130; c=relaxed/simple;
	bh=SQ7DJ0PfgPG+lfGBSOJGXKcBKPHLY+ziIZ5lLkxF/RM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ns0NR67UdvR/z6wIUC0jURPYthNahVgqkICrJXaGDyV7tR7fnR37Ewf4uZmwr0ax1NSr0W21tXMMJC0rAFNlGZNKT7N+xRguGHz4SRqah9cIN+ErxnparctcyiocML4UdXfQqo6RluNGmqa5hYSmO8MWNb2DPU0soAMmC2y+lF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H7GhoN32; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H7GhoN32"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2ce98cb8165so8813885ad.1
        for <linux-kselftest@vger.kernel.org>; Thu, 23 Jul 2026 10:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784828129; x=1785432929; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=3+C2/eQx85hIDTRoY5V0ZRlv5zniHV47faqIMelZ0cg=;
        b=H7GhoN32KR/vp95vgwYtVkssJ7SlB3JRz3Zot3Hc/5hOmQ+9cIUQGfLhhqw6GCV8o7
         UkvKSLG5a576ThIKc187pvJIkMsMwsKDQz7cCFBcTb9EuO1tG+/TIgBlC8KncTSVdQC+
         O/vIECUTCYhVH0nmI8ZypbHImZpGCNEXKy2fVfSkzWK4BU29qYElgzH1bT+DT70B7WdZ
         1n+zjZnIJsaP0I8InwKNbKWdXISV7w08vLbkWnZb3vcRhXsDD7nt66JSZNMtb+2fVp6F
         2XTCNnt82SeOjft2Ef78yYr1VoNIwHBF1oZXzDUtSFVUObLo0dzBFOIPzZkjHMCzz+my
         01zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784828129; x=1785432929;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3+C2/eQx85hIDTRoY5V0ZRlv5zniHV47faqIMelZ0cg=;
        b=hx8jviaDtaLYs3zXVE1w4MjYsQbr/ZoOdbvBksVO6jmZsrRNOEolMcZd7esYUSv8Cu
         6/UefJW5xJAdABTCELedaUtE+g9uahrCBlo664a+FQbFDklP4gDwCJWtMNL4tcoGGLkT
         URbA/GacxXUr5/w5B0HYjFE/hfE+X7VS9Z8Vlfy0tCllrMe0LWypqi41ircUbasBdGT/
         wIyyDmk1Ngrk4qxRVFGS1p5hq0qU74/5uVJcy4KqXzPJTalJJc3yD6WNqCGR++RiNGzp
         YVeIBsHR/yyY7SShwRhp+AUB7zZlbjWVMNjK3H0xWt6IRFEFczHnSg1W7wCGgYl3g1/s
         /Syw==
X-Forwarded-Encrypted: i=1; AHgh+RrEEPvJG7bOxbDiu9nb6AiieXm4lUEMMZe5YNxizK1+HHIU1+fbJvVk1ka5W/Ik74AFz600aP7e7zgaKV4Mmws=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6uuKReajAWbYQwRobmxUf3CLjdyDL8tydLXWUtyuBUuSr6FSM
	PlSPnx6QnYP11By1Mcdtzjz1UpquLrUUP64On+tZuiGzQAdWi8BOFcO2
X-Gm-Gg: AR+sD11MPvTiEOK3w7R2Sy93N3pKb2JMUoa3C0uMILsWIj1GLxQFpSg2LKQEiNLwLtz
	le063gVKAfqPGtGTwWDrMhV84KqpfL8/58bPjkhDZ/p3b6ZEWwRENsU0N6uGv2afR9YPwIQN3G5
	ogBYp80mHU8eSVBwr5c0MrUXyOpbu+yJRK4nj7vNUph1w+ESyWKAwY6UJrVPeMkhCzI2t7QH8cJ
	3QAUQtyBArO520oRsST0/HCbxlrJy9iRxa8uJtLOuLx2J5kk7iYSnopy7pHE3qucmu3z8qFA1wd
	NbEUmUpO6tlypLuBwzj+FAXStH+fBsn/Z4h9n5OtjUOQbneQLo0I3gZBzOU11rZGVuYBME+h3Xd
	y0+1W9pyUq7b/TXBI2D+e1L1sEl6bin/H2+RBpsvsBcl4DSZFrVPjw8a/+rmSU/Skm0XHUlhhKE
	h2X7LwgkFs58Yt/gyhYsLNs8rbz3WdXO2sfW4alLFM7bQKYOzjKWZNzJmW9qc=
X-Received: by 2002:a17:903:1c1:b0:2cf:18e5:1d18 with SMTP id d9443c01a7336-2cfa958568amr41353275ad.29.1784828128485;
        Thu, 23 Jul 2026 10:35:28 -0700 (PDT)
Received: from ?IPv6:2a03:83e0:115c:1:c221:d012:6e37:77f9? ([2620:10d:c090:500::2:8dac])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e1bc886sm21822514eec.26.2026.07.23.10.35.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 10:35:27 -0700 (PDT)
Message-ID: <c5c2dba26e217763c73c237daa6d8639043f5207.camel@gmail.com>
Subject: Re: [PATCH bpf-next v3 1/3] bpf: Preserve pointer state for
 commuted arithmetic
From: Eduard Zingerman <eddyz87@gmail.com>
To: Shung-Hsi Yu <shung-hsi.yu@suse.com>, Yiyang Chen
	 <chenyy23@mails.tsinghua.edu.cn>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>,  Andrii Nakryiko <andrii@kernel.org>, Kumar
 Kartikeya Dwivedi <memxor@gmail.com>, John Fastabend	
 <john.fastabend@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song
 Liu	 <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa	
 <jolsa@kernel.org>, Shuah Khan <shuah@kernel.org>, Emil Tsalapatis	
 <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Thu, 23 Jul 2026 10:35:25 -0700
In-Reply-To: <amGUjFu1MN__jM4c@u94a>
References: <cover.1784696371.git.chenyy23@mails.tsinghua.edu.cn>
	 <004a83de52a36e9f3acd6c3fa2d0dfd0a013460d.1784696372.git.chenyy23@mails.tsinghua.edu.cn>
	 <amGUjFu1MN__jM4c@u94a>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.1 (3.60.1-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2026-07-23 at 12:25 +0800, Shung-Hsi Yu wrote:

...

> The sole purpose of having orig_off_reg seem to be for satisfying the
> 'off_reg =3D=3D dst_reg' conditional in sanitize_err(). If that's the cas=
e,
> maybe it is better to change sanitize_err to accept an ptr_is_dst_reg
> argument too.
>=20
> And given now that we are starting to make more use of scratch register
> states, it seems better to get rid the likes of 'off_reg =3D=3D dst_reg' =
all
> together, and simply have ptr_is_dst_reg passed down by
> adjust_scalar_min_max_vals().
>=20
>=20
> diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> index 52be0a118cce..72d49f2a57a3 100644
> --- a/kernel/bpf/verifier.c
> +++ b/kernel/bpf/verifier.c
> @@ -13505,13 +13505,13 @@ static int sanitize_ptr_alu(struct bpf_verifier=
_env *env,
>  			    const struct bpf_reg_state *off_reg,
>  			    struct bpf_reg_state *dst_reg,
>  			    struct bpf_sanitize_info *info,
> -			    const bool commit_window)
> +			    const bool commit_window,
> +			    const bool ptr_is_dst_reg)

That's a bit invasive. I think the simplest thing to do is to drop
off_reg and dst_reg parameters from sanitize_err() and re-derive the
information about which one is a pointer.

...
