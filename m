Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED3D1414A09
	for <linux-kselftest@vger.kernel.org>; Mon, 10 Aug 2026 23:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786404165; cv=none; b=n5TbHqNeXYTKfG/YM4uU6fRPBZvEmfsBu9rSOAep6brC6GvtnyUaTi0hNmBlR9mOWs/FT8yEynMCSF1jKa/0PMgoUXLXJMFFqtCU5v3QAims+z+AgPu+yr4/+rAMqyrWEkS9bfUY0SJLD3LBRRqhjgTaNOtrf1v5kQzXOcsrwuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786404165; c=relaxed/simple;
	bh=M0MjLcWTskDALbCS54CZ4/9+M5FLfIcdbvqgABIt+TA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Q2Nm4EDs9eJ/JFVoWDE0SmiOE0rm22+geSFr5GkZw9Z8b2isBtTUvjrD9qy2Fox5fJSKjRZlbPtq0bEyIlDMogRfOVCPBlBhxHC9QjoEWXC5yjjDfXq+irhHmBgBKDiZMeJBuLjZ9lGfFh8XOlO4N7wmXOZ2T45o34IXzfg2Igs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HnvX48gj; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HnvX48gj"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2d0407aedd6so26597575ad.0
        for <linux-kselftest@vger.kernel.org>; Mon, 10 Aug 2026 16:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786404163; x=1787008963; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=3sR0roWS7ay8jw9jkIlC9XLTYMTiMVpzbqbRgtEhFxM=;
        b=HnvX48gj+gTC5lccl2ewu0YBISb1i2fwxlC3R54THhBzaD4SakFXTiUU938tYQ2zZl
         cpsCnZanlARXkk2fSmGz3ydyJT5Mfg3jLIaOc6NOefN0+hnsDgTAJyQcXu60rZA4ZqNO
         4XzFYsB8n4VCw8IdroVlUTsAd09l+0hDUVuyOQrHUE+qJ7ba+jSyFGc4+RpLiNRWCBWP
         PRJLE1awyrXkCSGJ1THSePufgAoL8mt+7EoaWokTL22M8SJZNgUv/mOPQWidkC2w1KWK
         zRtmUvNXarhg1qT5RKBL2qLe9J2eizRzAirb2/u3/ck4B7LOVCJhljBJUOr1R8hvN0oA
         YpHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786404163; x=1787008963;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3sR0roWS7ay8jw9jkIlC9XLTYMTiMVpzbqbRgtEhFxM=;
        b=GbdROlfuBDIPdCmVTFivlFuYUqytP1hVrNLHfHlItJONs+ggCpLvJxBOPgRjKqVaEo
         B3CwOwVNrvcXivDdBwRmH0ubjnXeSHEw40xJ1scuwoEMnmVpQeRKu9Mb1mY8lM9U9GF0
         VFkBVQ4tD7wRJFqtPvkauVEdzR1u+PvZ/DfLW8rZ006Hvz0KanAg+JjfRb9+MRR2qnsT
         utTIaw32gLYtIib7scpLUkO56ELUxZbA/erthYzbKCriGhhTNqLNn1mV3yIEV+qRSdLc
         j8Hy6gT4P4+F1AqxCaKS2mGPc1xgpRuE0TP85e9g21T14qecueZLkWKm2u7KHclFvxlO
         lLdQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpyk2f5LRwlz0W2uQ8ng7Ih5YOZ5+5twZmlQssRF/Pyw2Poe10XaURgSEJfWIVzF8SGdnoXuuRiRkpyG9SQpxA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVyjBGzdmVR4Tr54XWyIwZIpwuW0TQMrDptEh2ip7haiiGctVh
	ZP0miLd8Sv48ckiqErfpIPp53dBBEOVmyL6eIcxcAorM5ens6YAnH3NC
X-Gm-Gg: AR+sD11m3aqY+hLDjlEyQu6LyKK1NUnYbRnEl0T3/SJvjqFzztPQ6e1wPSSCq/UB79R
	xLrq+v7TvD1bCzPvc/4zUbzZY6ZpqcDAzMh9cINkRx5h6/rIk+xjZsbKzB6xZpeUuDrBC+cDAa4
	xrO2qQML09S3muT10ug71YKNwMxE5TVLLoRJTK74TAIHJub3nFFzt9C/BmKMhCfb4nDxWSmMy41
	0A1jtWoPGPz4ijaumm2RT1EMfJ3F21/KOCb9NP5xTsmqsBaulRbhw3d4yzv3seIzQh2J3PxsnzQ
	LCPmzisnn4SS+bKKGFQIF0b3SdLFa200avHp3ETVIYa226U4nRquoNhRzvGhmDkVU7KHKw5aUG0
	bqehhT8o/uE5vNCKocrzjlKsWE07Jnpo9/ECMxUJFmCaUYeLQZExQjUT3zCS2IviZo5zLE9D8k+
	z7TZTnAxvydN4qbmqP5b3gk1jfVYe6MiHpLrFQs9GCPWLaha2LH7EW7JpbMvEkNQb9Kr7m+3Zg7
	Jvg6MpGe+ZcLvVR
X-Received: by 2002:a17:90b:3b52:b0:381:1c96:829b with SMTP id 98e67ed59e1d1-392cc8d043emr4789411a91.3.1786404163218;
        Mon, 10 Aug 2026 16:22:43 -0700 (PDT)
Received: from [192.168.0.13] ([38.34.87.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392d5238e07sm1164685a91.15.2026.08.10.16.22.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 16:22:42 -0700 (PDT)
Message-ID: <8ea2c2ef5a50333c84865d09c860a9617edbda9b.camel@gmail.com>
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
Date: Mon, 10 Aug 2026 16:22:39 -0700
In-Reply-To: <20260806163125.11172-4-leon.hwang@linux.dev>
References: <20260806163125.11172-1-leon.hwang@linux.dev>
	 <20260806163125.11172-4-leon.hwang@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-10 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2026-08-07 at 00:31 +0800, Leon Hwang wrote:

...

> diff --git a/kernel/bpf/fixups.c b/kernel/bpf/fixups.c
> index 440e73e1b11b..f2398749103b 100644
> --- a/kernel/bpf/fixups.c
> +++ b/kernel/bpf/fixups.c
> @@ -1817,6 +1817,43 @@ int bpf_do_misc_fixups(struct bpf_verifier_env *en=
v)
> =C2=A0			goto next_insn;
> =C2=A0		}
> =C2=A0
> +		if (bpf_jit_supports_percpu_insn() &&
> +		=C2=A0=C2=A0=C2=A0 insn->code =3D=3D (BPF_LD | BPF_IMM | BPF_DW) &&
> +		=C2=A0=C2=A0=C2=A0 (insn->src_reg =3D=3D BPF_PSEUDO_MAP_VALUE ||
> +		=C2=A0=C2=A0=C2=A0=C2=A0 insn->src_reg =3D=3D BPF_PSEUDO_MAP_IDX_VALUE=
)) {
> +			struct bpf_map *map;
> +
> +			aux =3D &env->insn_aux_data[i + delta];
> +			map =3D env->used_maps[aux->map_index];
> +			if (map->map_type !=3D BPF_MAP_TYPE_PERCPU_ARRAY)
> +				goto next_insn;
> +
> +			prog->jit_required =3D true;
> +
> +			/*
> +			 * We are *skipping* first half of ld_imm64 insn
> +			 * with 'i++;', patching over second half of it
> +			 * with that same half + mov64_percpu_reg insn.
> +			 * All because bpf_patch_insn_data() can only
> +			 * replace one 8-byte insn, which does not work
> +			 * well for ld_imm64 insn.
> +			 */
> +
> +			insn_buf[0] =3D insn[1];
> +			insn_buf[1] =3D BPF_MOV64_PERCPU_REG(insn->dst_reg, insn->dst_reg);
> +			cnt =3D 2;

Hi Leon,

Sorry for joining the discussion so late, but Andrii asked me to take
a look at the verifier part of the changes. Could you please elaborate
on what exactly does not work with 16-byte instructions and
bpf_patch_insn_data()? Note that e.g. 'if (insn->imm =3D=3D BPF_FUNC_timer_=
set_callback) {'
case in the same bpf_do_misc_fixups() applies a patch containing BPF_LD_IMM=
64().

The rest of the patch lgtm.

> +
> +			i++;
> +			new_prog =3D bpf_patch_insn_data(env, i + delta, insn_buf, cnt);
> +			if (!new_prog)
> +				return -ENOMEM;
> +
> +			delta=C2=A0=C2=A0=C2=A0 +=3D cnt - 1;
> +			env->prog =3D prog =3D new_prog;
> +			insn=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D new_prog->insnsi + i + delta;
> +			goto next_insn;
> +		}
> +
> =C2=A0		if (insn->code !=3D (BPF_JMP | BPF_CALL))
> =C2=A0			goto next_insn;
> =C2=A0		if (insn->src_reg =3D=3D BPF_PSEUDO_CALL)

...
