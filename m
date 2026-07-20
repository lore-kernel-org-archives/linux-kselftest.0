Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD20E31354F
	for <linux-kselftest@vger.kernel.org>; Mon, 20 Jul 2026 18:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784573236; cv=none; b=nOG7RhgH9hntcEjSiqTEQ9xqS6hl8dAUk0ehUHTY3ilFEIT3AO10yVOUvsARRWLR7rSv3B8U+gCkrnfu1M535n5RpJH3lE3mXLHK4Gy4L6YEdd0jTs1VrV0rkziFdX7Z3qLcYBFoDRgYTLQeDlOrTe+KDN7J0QWff1ufmE9QiSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784573236; c=relaxed/simple;
	bh=2JEVIKRjuogw3CiJj97/97MbKmbSMBHFdJ8CWOymg3Y=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oL2yUBCdnsMwzpNREPAumAUpJamHmEEjemVBJ77NkDoMA0yLIFlVTKlYIVMQFFh+4VC/COAquFMdhgdSus8Hv5A5cNGC2i69uHNB8lq8nzoPyjY/Xctu9+E+FubQH7clUFj8EpYtmztV4UOz7wieEW5jA9wSEPI9yMhQL5tsNnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c7WTa0jS; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c7WTa0jS"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-38a0c7e841fso8248481a91.2
        for <linux-kselftest@vger.kernel.org>; Mon, 20 Jul 2026 11:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784573234; x=1785178034; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=wYNGagPb4YA1YB5zrq43PT6RJzgokAlH9V1waITYWGM=;
        b=c7WTa0jSJR7YlJdgNC5nm4+tQSXpI3lu1p674oiopBy5vkAthEwpX/hH5CP0vE8HPW
         SPnGb4KXxZuTugL4haC8tpOQ5aPxyf3pqdtkX9V/Q9rAdCMYfW3feUCPpWdxbc5WYh0x
         ncrWQllHFUkyA2ppWLkVZvsm6FctdSyBI8ArViSnNbtcW0ycF5a144UesLedIOLgSPSy
         seZTeLZAzZRvUtonNZaOw12r4NO3zBiLzQ25M612efnFuWMahcIziRBUsmi4Z+ITn1BD
         38Sp88OZHrGIa+fFB27UI0QSkxK9tP1YEcEP+xpTbAW1I0aXtkC0QkmyCFBh1VH3tMGp
         s6zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784573234; x=1785178034;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wYNGagPb4YA1YB5zrq43PT6RJzgokAlH9V1waITYWGM=;
        b=NHICCF8ix7At2ayrKPKZiG934A35MeTdek4YgQfZSGeV6lSQNKUW6llTQ5bLmttvvc
         ltTMhNokWARnUaoyjDtcrm7gq4kOqXKGV7fs0+kMJbGozuM93I3vSe4hZm0xNgknf5Gi
         483gyFXJ7ECSW8WyNBcg56p/EBGWtFEmdZvaNUDLlc87l3w3+uXhnLfCsSH4MTSLSpsS
         4577NDv0mbE19Ic3GIKjF8/5fgeAsHrTnRoahS+p5XhOH+yshAvGDR2TwB1HN9mWtIeR
         oB8V/sImqJ0GRp4a6F69tlEx/LtCRC/lO4zjamTm/KtNaa4gzjISq4O/RrQNmiwTx8Hv
         eMzg==
X-Forwarded-Encrypted: i=1; AHgh+RrNI4E3BXZL1dcLQtSvSQj34CVSbiEt9KwnECaX2ckAQwxPsUiym12Ug01+L5kuVHBJ6LEX4lG0wsNB1kOxyGc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBXSpBopSbRK/4mjzXSNpGF7q3BM5Kug9f4qvnAIqcs6Yak8q0
	TB1+LJVSsokxn5IgvNH1CmtlDhW3dGcpPHSj8a1ovH4ALnWSnxbM3Loz
X-Gm-Gg: AR+sD10BMwfPHqzQMKVcwn8MguRSJG7aJxMOpeuKaG5cTi96oy/rnBSV3t80l3Yqaku
	tTt6oanAUDg/rGnAUcJ+BukWpAF5jKgtJVH8qDU3BrhtyJ4119w9cER6SQFqfeVUs8emmtALEAX
	D8boOwMsgNhnyDvzmdUdWiOnhRmXyrMMY8vYz1BO6GIcFcUl0hFl3/B0Vp/SAjpQCoHjGLfa6OO
	I/7QPk3fAGExT8SaAVulCZ/m9KtfGJka4O1djiTbcbH67pKpL4ZzZjzwOhgztDpY4o0VRIc2ue5
	ftm0jWDP4AKXaCUO1R4wCK1V2TlsHkmoPRVqMD8BirJ1/cWpf0GpjsRReEqAAdSlKeKGvdP633M
	srvHe6fQg7jf2nMVcM5D2mb16iMUknAqdYOTFILHE31kUzAmK2B9Rgb+oGwp9vFPzwFB0XGQqlK
	Ik4571cJ9GYjgdbjTgzzR9MV959BQFbw==
X-Received: by 2002:a17:90b:2691:b0:387:e0db:3fb2 with SMTP id 98e67ed59e1d1-38e4b602948mr16389172a91.43.1784573233855;
        Mon, 20 Jul 2026 11:47:13 -0700 (PDT)
Received: from [192.168.0.13] ([38.34.87.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e92396445sm158611a91.17.2026.07.20.11.47.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 11:47:13 -0700 (PDT)
Message-ID: <a469d5344126d38b5151b9bd044ce83320875517.camel@gmail.com>
Subject: Re: [PATCH bpf-next 1/2] bpf: Preserve stack frame number for
 commuted arithmetic
From: Eduard Zingerman <eddyz87@gmail.com>
To: Yiyang Chen <chenyy23@mails.tsinghua.edu.cn>, Alexei Starovoitov
	 <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko
	 <andrii@kernel.org>, Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: John Fastabend <john.fastabend@gmail.com>, Martin KaFai Lau	
 <martin.lau@linux.dev>, Song Liu <song@kernel.org>, Yonghong Song	
 <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, Shuah Khan	
 <shuah@kernel.org>, Emil Tsalapatis <emil@etsalapatis.com>,
 bpf@vger.kernel.org, 	linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Mon, 20 Jul 2026 11:47:09 -0700
In-Reply-To: <fee8d44c3c792e29b8898951a68c8313d9d2da53.1784563939.git.chenyy23@mails.tsinghua.edu.cn>
References: <cover.1784563939.git.chenyy23@mails.tsinghua.edu.cn>
	 <fee8d44c3c792e29b8898951a68c8313d9d2da53.1784563939.git.chenyy23@mails.tsinghua.edu.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-10 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2026-07-20 at 16:37 +0000, Yiyang Chen wrote:
> When scalar +=3D pointer is handled in adjust_ptr_min_max_vals(), the
> destination register inherits the pointer type and id from the source
> pointer. For PTR_TO_STACK, the inherited pointer state also has to carry
> the stack frame number.
>=20
> Without the frame number copy, a stack pointer derived inside a callee
> through scalar +=3D fp can be recorded as pointing to frame 0. Stack read=
s
> and writes through that register can then update or consult the caller
> frame while the actual instruction uses the callee frame.
>=20
> Copy the frame number when PTR_TO_STACK state is inherited by the
> commuted arithmetic form.

Could you please infer a "Fixes" tag?

> Signed-off-by: Yiyang Chen <chenyy23@mails.tsinghua.edu.cn>
> ---
> =C2=A0kernel/bpf/verifier.c | 7 +++++--
> =C2=A01 file changed, 5 insertions(+), 2 deletions(-)
>=20
> diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> index 52be0a118cce0..58017141d52b7 100644
> --- a/kernel/bpf/verifier.c
> +++ b/kernel/bpf/verifier.c
> @@ -13796,11 +13796,14 @@ static int adjust_ptr_min_max_vals(struct bpf_v=
erifier_env *env,
> =C2=A0		return -EACCES;
> =C2=A0	}
> =C2=A0
> -	/* In case of 'scalar +=3D pointer', dst_reg inherits pointer type and =
id.
> -	 * The id may be overwritten later if we create a new variable offset.
> +	/* In case of 'scalar +=3D pointer', dst_reg inherits pointer type, id,
> +	 * and for stack pointers also the frame number. The id may be overwrit=
ten
> +	 * later if we create a new variable offset.
> =C2=A0	 */
> =C2=A0	dst_reg->type =3D ptr_reg->type;
> =C2=A0	dst_reg->id =3D ptr_reg->id;
> +	if (base_type(ptr_reg->type) =3D=3D PTR_TO_STACK)
> +		dst_reg->frameno =3D ptr_reg->frameno;

This patch fixes a real issue and this a surprisingly buggy piece of
code. Looking at other fields defined in bpf_reg_state, it appears
that several additional modifications are necessary:
- dst_reg->delta =3D 0
- dst_reg->parent_id =3D ptr_reg->parent_id

Given such an error prone nature, I think it would be better to:
- stash the value of the off_reg in a temporary variable and adjust
  off_reg pointer accordingly (see bpf_verifier_env for a collection
  of similar temporaries).
- do *dst_reg =3D *ptr_reg instead of the fixup.

Wdyt?

> =C2=A0
> =C2=A0	if (!check_reg_sane_offset_scalar(env, off_reg, ptr_reg->type) ||
> =C2=A0	=C2=A0=C2=A0=C2=A0 !check_reg_sane_offset_ptr(env, ptr_reg, ptr_re=
g->type))
