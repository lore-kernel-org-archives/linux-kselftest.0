Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFCEB330328
	for <linux-kselftest@vger.kernel.org>; Thu, 25 Jun 2026 20:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782419678; cv=none; b=uHXk3YQ5FAYlOT0NUoLQtIViEanKNc1yR7Tu2l2h8GPCW/kUI0oPhj8uaRzvjYlyBGPSWizumZftKYuoCeqSdO+7yQqIY2Nu5hz1VHPf/4LjMM2V8UCThgksI5HkyhN63NE3aqG8nNCpvp2UwWhgid6lFj7FfzFhUew5jnbqZjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782419678; c=relaxed/simple;
	bh=jvefDCupa63B7z6ewc8630KRIlgmUwgjGlbSSSzOvhw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HoxXhchXpuPnM/SeKRihkgRpaOslrpSm2AjnOh0IfrZep7J0WTASmByIgqZlE0l1a3UGudebBeh5aXZncp6Gn2ESMozdhGxVo7w7M0laSyuShgeE1bOnW0S7YsB8Ly2HO6eGqe3iI7C6jt0sZr6+VOCYP2JM/HdZmLva5ZDqKr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q2ZBfBby; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q2ZBfBby"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-845b6f34873so135994b3a.1
        for <linux-kselftest@vger.kernel.org>; Thu, 25 Jun 2026 13:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782419676; x=1783024476; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=j4cziRsnOXU8udnzmTxz4VvnRIsHkxiDHnSiCu2+4Iw=;
        b=Q2ZBfBbyP1DHdbTQM2KQsipfzQ3jCbx1FckHKtvFCFs57R0u3DHVOIj5rlKswpUKmE
         EmQLfUQL9VmzKwe/zpd54DG2jlkBz2bUkLzaRxLuqGPYx6ebHNmcKrvKL0PdDIh+TIMG
         5tfDyX76CJj8BUrvt6EX/+aLIjukAity0jpM1XCrN8fq1wdVlKW0+LYaCiwrliHyPJTc
         kP+yXMUNB6RlHPfTjGK0c0hnPKk21QWyxKwTdG47jKFw3BLkdejTmo16QG5c0bd/flFa
         xKW42k5cUxaPU2YzQE1kPGg3J/srKpHeQNU3zcZjhV7xyDynnGcn0hC9YiI/Hr1zSF2q
         TXTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782419676; x=1783024476;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j4cziRsnOXU8udnzmTxz4VvnRIsHkxiDHnSiCu2+4Iw=;
        b=WQCxyQaFnuABPLg5QlohheJZ77xrF+P2ZHvWErvDjCchOIYIhH5xeUEB7VR1WNg4mI
         P4a9FS4igSTpt4OO1HAjro3/M78IYS8kLjKjbiJg//GXe1D1BbktsQoRdiIlf7qCBS3q
         VvkgC78iE+1d89mr1UzPiKUGRCiENeHMlYxznLFDwxZZFLX/oVhk/eUMbfqMaHlXf55B
         ZAVO0SbMcQuGm0gzQLSqq7TXfUluVV0feTQlqEIDqZxKzzkGaQrgM0QauT+4YYQg3sge
         67X4ThWa6w5tmtw5guJMOO9+ClnNSDi3BVvwtzprnpRdkTEnMQQaU3J54pMRDmXqWR/6
         NS5w==
X-Forwarded-Encrypted: i=1; AHgh+RprnmRGztbc6HzCtucQBhmz/7+MhbFF+MC7cJ43JE9lqFOptAbUoXLLbgY22Cnc0ENo1JhxhEJPJ37Jffz4esQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBXxjfQA4cYRlc0YxIIsyTr0Nk5+VDhMld2AZ4yChDgO6RICIs
	8JowPaU+0b82u9Z6L4cv4tIZepsRBnJy+x1t/+599SdrRW5yNP0xaUb+1jb0UkXJ4hk=
X-Gm-Gg: AfdE7cnG4EY+stmHqVZQd3DS6vAereGgdlafm3d545YSzt0Cs9+nxFwfNOUO87lfY9p
	rLIlUBA67OS1A2X/cwQw1AwRp6BUOpJcaGe490PbeBxJTTgnlfHrOAQoDfsQWzWAaVj4CWaDlqY
	+aMKl71QGj8ZvLXmM93dhsVIbmUg55hvmTNbvkAd6AEdc9hL1bxTEy0c+58jhmRRMLLGqFt1Mit
	79ElS476YGSXTTedqlXiRcU3kCBCt4RgnIw0kKBDwYavS4bPBrOSjuacHLQ4IiF+02iwJWfD+EV
	xm+UQF6We8XbqnSPgjYCehpRg7Ks7B7GwKRxudECCCWotuDYSeK2fONPHTU/mjmRSA08yi85358
	2fO2hRFqNKT4PyWdAfdlL0Z//5m9Vjk2ERLiFrQxa8kBXWQWWzZfxbS+fPwMciQHJ82itF+DtgD
	/GBn8yTuOpUfugkJzCjd2xAFSq3eYu2UdcdGvmMIRykA==
X-Received: by 2002:a05:6a00:b81:b0:842:7f81:8085 with SMTP id d2e1a72fcca58-845b39969a1mr5178575b3a.8.1782419676054;
        Thu, 25 Jun 2026 13:34:36 -0700 (PDT)
Received: from [192.168.0.226] ([38.34.87.7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845ba19f72bsm1607019b3a.20.2026.06.25.13.34.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 13:34:35 -0700 (PDT)
Message-ID: <f1f1c8875b8ee2122aea8febafdc15d79898e6d2.camel@gmail.com>
Subject: Re: [PATCH bpf-next v2 1/2] bpf: Reject MEM_ALLOC BTF accesses past
 object bounds
From: Eduard Zingerman <eddyz87@gmail.com>
To: Yiyang Chen <chenyy23@mails.tsinghua.edu.cn>, Alexei Starovoitov
	 <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko
	 <andrii@kernel.org>, Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: John Fastabend <john.fastabend@gmail.com>, Martin KaFai Lau	
 <martin.lau@linux.dev>, Song Liu <song@kernel.org>, Yonghong Song	
 <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, Emil Tsalapatis	
 <emil@etsalapatis.com>, Shuah Khan <shuah@kernel.org>, bpf@vger.kernel.org,
 	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Thu, 25 Jun 2026 13:34:24 -0700
In-Reply-To: <703a2cbfeb17ae707fa4a003b795c5326cc0abb8.1782197377.git.chenyy23@mails.tsinghua.edu.cn>
References: <cover.1782197377.git.chenyy23@mails.tsinghua.edu.cn>
	 <703a2cbfeb17ae707fa4a003b795c5326cc0abb8.1782197377.git.chenyy23@mails.tsinghua.edu.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.1 (3.60.1-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2026-06-23 at 17:34 +0000, Yiyang Chen wrote:
> BTF struct walks relax the struct-size check for accesses through a
> trailing flexible array. That is valid for ordinary BTF type walking, but
> PTR_TO_BTF_ID | MEM_ALLOC values point to objects allocated with the stat=
ic
> BTF type size.
>=20
> When walking a MEM_ALLOC object, reject the access before applying the
> flexible-array relaxation if the access range extends past the struct siz=
e.
> This keeps verifier-approved BTF accesses within the bytes provided by th=
e
> allocation kfunc.
>=20
> Fixes: 958cf2e273f0 ("bpf: Introduce bpf_obj_new")
> Fixes: 36d8bdf75a93 ("bpf: Add alloc/xchg/direct_access support for local=
 percpu kptr")
> Signed-off-by: Yiyang Chen <chenyy23@mails.tsinghua.edu.cn>
> ---

Acked-by: Eduard Zingerman <eddyz87@gmail.com>

>  kernel/bpf/btf.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
>=20
> diff --git a/kernel/bpf/btf.c b/kernel/bpf/btf.c
> index 15ae7c43f..3e68af9c1 100644
> --- a/kernel/bpf/btf.c
> +++ b/kernel/bpf/btf.c
> @@ -7069,7 +7069,7 @@ enum bpf_struct_walk_result {
>  static int btf_struct_walk(struct bpf_verifier_log *log, const struct bt=
f *btf,
>  			   const struct btf_type *t, int off, int size,
>  			   u32 *next_btf_id, enum bpf_type_flag *flag,
> -			   const char **field_name)
> +			   const char **field_name, bool is_alloc)

Nit: 'walk_flex_arrays' would be a better name.

>  {
>  	u32 i, moff, mtrue_end, msize =3D 0, total_nelems =3D 0;
>  	const struct btf_type *mtype, *elem_type =3D NULL;

[...]
