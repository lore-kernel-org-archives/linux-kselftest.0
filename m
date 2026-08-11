Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5A133264CF
	for <linux-kselftest@vger.kernel.org>; Tue, 11 Aug 2026 07:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786434852; cv=none; b=aWs0NZNEPEpG3SpiRGFdsaOUSvYREWGLjLVzEyQ5BH44eojD3oujRxgZfwJuL86hNk8D349ArEVIF67yshev00OKtjm0k03k4J+g/lTilW2tvPGxha5eZSTHVG9NszAmc4sGddB8BpQZ/MWKqoBWUsF3rqQC1cv7qk8iy6nleU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786434852; c=relaxed/simple;
	bh=ysGeiwJobwNzoKYKgKeYBMdRrgPaDYz7Y69a4RA3mnY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RDST0ixUJO4o2KQp+AU/eGSvsSWMGDJAyJlFId3qof4JXWWKrJdlFG1JZUoR7Xm3ew1cpkshN/hICPQlg0MMU786FMgTa46ZYp3j64Y4WEsKwR0NA6wNVi3UM+kNqIdoAQ+ogczRSrghizXLQ67+PxQBR+BXA5XEslTo7fqzOm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KQUxNMwK; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KQUxNMwK"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-38e88b60121so2397945a91.3
        for <linux-kselftest@vger.kernel.org>; Tue, 11 Aug 2026 00:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786434850; x=1787039650; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=4Ce/1Lxe31Ixc3OKdVaTPYlnI2JOcKZE+0jH/sF2nPg=;
        b=KQUxNMwK3MndEdPj9HxWR7lAVFj+QiksFOF+p883Juem5EYDbpQ4D8rqzwO2Ad8teH
         6FIJt1YuvrR+eIjd1lWVk8eeFGIwdfJdqQ9pBwHV9tcEKwtn3aZHEbn9BkvgwMtadzub
         yr10iR1RnUJqKRZC25fU1nOhOlr6Bg3BvOFUvYsOXlbrQsde9mHfKNO5n/EG1MySDz6i
         w2c+Bp/KTvWNcSEMXS3hqggiZJAbESKC61x2fwwNALnu7qJQgUeskgNS16YJSvPge7lk
         ZnZKHNhKUI+4FYphJcCmK07ZUbihyvfBtJC0AJUBrkfL3vdAGfT8N6ltabTQS4jtbzh8
         rweg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786434850; x=1787039650;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4Ce/1Lxe31Ixc3OKdVaTPYlnI2JOcKZE+0jH/sF2nPg=;
        b=V6SzbVi2GDcB156bNahGMjZh19DwzuTM/vzy3+QpciaK9rkrUCFJo10jiBTQVk3+ll
         EF3GPKbfudjjXBKnqXctwbrYYpot4I+W1OdAUutWhvTHrO1Cubk0J7fsNqy3rWKj2q53
         dWw4NYTLWhglEB6sdfoF3VgVHI01Kk4vIPSwojUzl1iPdAO81A3a/mGM0leMdJwecjl2
         HdPUNdSlBxsHWI1yLcQp/PIxFwswI5piR+O88y4fWX6or+UAj2fvs1xYrnKzuf2RuIc0
         Bw82PtEgOpYb8CE1gZrlSQLpw2QaA7CC89F/R6segU4bgZFxUACsvrB0pVmXN8Wk6Zpz
         eHyA==
X-Forwarded-Encrypted: i=1; AHgh+RrZh0DsIej6D9VWR9wzpRnZPzzlcqB/ih7O7SH50EeWXn8Z+hUk89xjiyb8Qr67qvtzAEFbCN2CgCQ5TEE2GGk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwiRenzmVsSqIGy6mmDIOuX/tZ0tMBJkmpxwYnoeHv+kTSDlH9m
	XPSu0CTqAQwtLcdzsFLwp9+9EtBvgEVtcwzj/BWh/fKyd/csOsUPUw53
X-Gm-Gg: AR+sD10NGWkYwGdonqZrevP/UNoF4e5InBgKCsjCWthsH227GAhd0b5railIO7HHtbk
	TcQTtRzlFcVCjErQBx9jCkYBV3zCRFXqA8nlGYZeyb14z23gfw6c6kNdcMrrlOukt3UhKB3fOG5
	gRduOpi5p1saRhBO7N5Fl/6Ua5nhA27OsMyskL2Wu0V93gC885tfbwOF2SA5H3YiVmZTl50XzLo
	kj3DQDNDKYgQ2pz6zWAMy3X4PTOp+EnaPD1pXyHjoFswLqtlqvZty1vF7/dN+47N9IZY7Jkny3C
	mRtZKusNgy7st9JRth+aiYt57bWavx+GBnAbhyUDdmgq3InWpsttUq7UFww0mjtksXG93Np6e+j
	grrtqEMVir/gw9axn1yh6dbNwPhp641Sn13oV/IK+aG1ovg6qKlly9WXp2fK4/o7aR4Q4QtVdDF
	6wVdh7LlZ46DQTsdRLX2zpvTuCHLwj7MkoE4UK8R+yvL41q4ig9mQ7KSAeQR222NQxcfQj8ZyLI
	JTk9M1A9MJfwfQj
X-Received: by 2002:a17:90b:4c85:b0:381:c500:b0d1 with SMTP id 98e67ed59e1d1-392ec721e34mr1370211a91.20.1786434850004;
        Tue, 11 Aug 2026 00:54:10 -0700 (PDT)
Received: from [192.168.0.13] ([38.34.87.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392ee3e97d2sm819010a91.11.2026.08.11.00.54.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 00:54:09 -0700 (PDT)
Message-ID: <b2a7babb5101db6c46422dbda62a3cc485fe4caa.camel@gmail.com>
Subject: Re: [PATCH bpf-next v11 03/10] bpf: Introduce global percpu data
From: Eduard Zingerman <eddyz87@gmail.com>
To: Leon Hwang <leon.hwang@linux.dev>, bpf@vger.kernel.org
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>,  Andrii Nakryiko <andrii@kernel.org>, Martin KaFai
 Lau <martin.lau@linux.dev>, Kumar Kartikeya Dwivedi	 <memxor@gmail.com>,
 Song Liu <song@kernel.org>, Yonghong Song	 <yonghong.song@linux.dev>, Jiri
 Olsa <jolsa@kernel.org>, John Fastabend	 <john.fastabend@gmail.com>,
 Quentin Monnet <qmo@kernel.org>, Shuah Khan	 <shuah@kernel.org>,
 linux-kernel@vger.kernel.org, 	linux-kselftest@vger.kernel.org,
 kernel-patches-bot@fb.com
Date: Tue, 11 Aug 2026 00:54:05 -0700
In-Reply-To: <5e8cc9c2-ae36-493b-922f-0d86f253265c@linux.dev>
References: <20260806163125.11172-1-leon.hwang@linux.dev>
	 <20260806163125.11172-4-leon.hwang@linux.dev>
	 <8ea2c2ef5a50333c84865d09c860a9617edbda9b.camel@gmail.com>
	 <5e8cc9c2-ae36-493b-922f-0d86f253265c@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-10 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2026-08-11 at 12:16 +0800, Leon Hwang wrote:
> On 11/8/26 07:22, Eduard Zingerman wrote:
> > On Fri, 2026-08-07 at 00:31 +0800, Leon Hwang wrote:
> >=20
> > ...
> >=20
> > > diff --git a/kernel/bpf/fixups.c b/kernel/bpf/fixups.c
> > > index 440e73e1b11b..f2398749103b 100644
> > > --- a/kernel/bpf/fixups.c
> > > +++ b/kernel/bpf/fixups.c
> > > @@ -1817,6 +1817,43 @@ int bpf_do_misc_fixups(struct bpf_verifier_env=
 *env)
> > > =C2=A0			goto next_insn;
> > > =C2=A0		}
> > > =C2=A0
> > > +		if (bpf_jit_supports_percpu_insn() &&
> > > +		=C2=A0=C2=A0=C2=A0 insn->code =3D=3D (BPF_LD | BPF_IMM | BPF_DW) &=
&
> > > +		=C2=A0=C2=A0=C2=A0 (insn->src_reg =3D=3D BPF_PSEUDO_MAP_VALUE ||
> > > +		=C2=A0=C2=A0=C2=A0=C2=A0 insn->src_reg =3D=3D BPF_PSEUDO_MAP_IDX_V=
ALUE)) {
> > > +			struct bpf_map *map;
> > > +
> > > +			aux =3D &env->insn_aux_data[i + delta];
> > > +			map =3D env->used_maps[aux->map_index];
> > > +			if (map->map_type !=3D BPF_MAP_TYPE_PERCPU_ARRAY)
> > > +				goto next_insn;
> > > +
> > > +			prog->jit_required =3D true;
> > > +
> > > +			/*
> > > +			 * We are *skipping* first half of ld_imm64 insn
> > > +			 * with 'i++;', patching over second half of it
> > > +			 * with that same half + mov64_percpu_reg insn.
> > > +			 * All because bpf_patch_insn_data() can only
> > > +			 * replace one 8-byte insn, which does not work
> > > +			 * well for ld_imm64 insn.
> > > +			 */
> > > +
> > > +			insn_buf[0] =3D insn[1];
> > > +			insn_buf[1] =3D BPF_MOV64_PERCPU_REG(insn->dst_reg, insn->dst_reg=
);
> > > +			cnt =3D 2;
> >=20
> > Hi Leon,
> >=20
> > Sorry for joining the discussion so late, but Andrii asked me to take
> > a look at the verifier part of the changes. Could you please elaborate
> > on what exactly does not work with 16-byte instructions and
> > bpf_patch_insn_data()? Note that e.g. 'if (insn->imm =3D=3D BPF_FUNC_ti=
mer_set_callback) {'
> > case in the same bpf_do_misc_fixups() applies a patch containing BPF_LD=
_IMM64().
>=20
> The BPF_FUNC_timer_set_callback case is different from this patch.
>=20
> The BPF_FUNC_timer_set_callback case inserts a ld_imm64 insn at the
> position of the call insn.
>=20
> However, this patch is going to insert a mov64_percpu_reg insn after the
> ld_imm64 insn.
>=20
> Since ld_imm64 insn is a 16-byte insn, the new mov64_percpu_reg must sit
> after the ld_imm64 insn by 'i++'.
>=20
> Then, let's look into bpf_patch_insn_data(). bpf_patch_insn_data()
> utilizes bpf_patch_insn_single() to insert insns at the position of one
> 8-byte insn. See memmove(..., + off + 1, ...), the *1* is for one 8-byte
> insn. I tried to modify bpf_patch_insn_single() to add 16-byte insn
> support, but that looked much complicated against this patch.

Ok, I see, it splits the original 16-byte instruction and moves the
second half after the last patch instruction. Thank you for explaining.

Acked-by: Eduard Zingerman <eddyz87@gmail.com>
