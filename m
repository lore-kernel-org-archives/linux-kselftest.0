Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B86421DFF0
	for <linux-kselftest@vger.kernel.org>; Wed,  5 Aug 2026 02:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785895680; cv=pass; b=jJKkr9D3voPKguSa8WgKDHkcb3bohTzMVsUr33GR+bKvS9Hqx1gcpGTzX2Nl+MRDxiHal99RWuWcjJbLBkpjR6Gy3hiMyfHd2SGu71cs0rXtsJl08v2qTOc+51eVCLOxfXU7pr2kKrEbuqvzAXJxa9hoXcDoXP6NfTq4hQ4XDMA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785895680; c=relaxed/simple;
	bh=bo2Al5DQlcAE1N4YHSqDS6taaDUG9W+7g7pyrnCn0uE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ngVs7OLEI7lzYdF+FpzW2ai1DibsLe2Vh2EulYxxPpF2brzI9R3AQmuwBAOlkTQKYR74nBq7ypi1uFus7FdIwRC/lGgtKy/aST5bo+ACtSW0fozq8ZxlT9ftNHOtwudcpRcPHcdfFzDcVrSg1jYiS/sFKZrzJ4KHN+44K0CAeFA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KOpoBd/w; arc=pass smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KOpoBd/w"
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-6a168dc590cso345531eaf.0
        for <linux-kselftest@vger.kernel.org>; Tue, 04 Aug 2026 19:07:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785895673; cv=none;
        d=google.com; s=arc-20260327;
        b=eEhvWWmH/l70E0+67DPuJ3UhczRxbTX9Sdtn96scPgIkbgUVjjNateUfiF257V0azS
         t0a4PLFJrI/Gy0S0HPTUN/9RweimlDIb/dykTIQ+id5/gu9bGvHiw3mlPaLQNE0qvfKa
         8I5GYy5uagTYVJfJJmaJ24qs+5+zxf6qP4DKK+lekNOBRnwYrWK4Vf/2Lk5R4AWklK4H
         911qooDEl8U+nk8OuHTWNDyqVjIOWrGZvh6lYD18j04Jr3kpo1NAZGwr3GYSMG6HbckO
         53vMnOZs6jb2ZZT6ST9Bz57QOAz5ij1pBa4auo0QxItDgzQA4nu50DhV81NUe7Eo1rSH
         JRvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VVVHXn5WZE3TAq2lS738uM6fISl8R37mJNBh8dxBNlc=;
        fh=gC/bOWDARt+d+jEQaD1IDycb0GeuU42Yq7zQaIh097c=;
        b=URd1mhF8f48LH5+IDPLx/5OtrPGvE9OJMrOAKRq2dgh2Q9p/sVdRqf09RSDUoTvrry
         nL9yQ4MSufv46M+w2O7AD0Yd6vb0Dt8F8QjdgHJ9mnwdMI6EVfRdecagc+QRl1GU92db
         7cP67g9igzIapSiOR0IXd5pr2sPJCsjYXEQX5ujNyRKbQzhqKhdpjNH3GnBV3U0mfU1g
         QQcU24Tz1uabJXA9bMj5awljiarUmNM5ePMWnqndckAHIjx+WQ5aSx0tvCcdYZU+gPBU
         ZVfJbgR0tH8tY7EVp13UH6pplvbBcb9PZe8dHRTNKzWgAkTXjsp62RmKHnZnbdfBGeEU
         BUYw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785895673; x=1786500473; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VVVHXn5WZE3TAq2lS738uM6fISl8R37mJNBh8dxBNlc=;
        b=KOpoBd/w2fanh0jyBvIbHSZ2ZqhJERYPqijH33P1T/n7qL/d/q2CkgMUuA5vINrCIG
         rHlvjhliSeZN1NiDiICSvZarfm8sK3xH/DKv1ctvTVOEq2T18X+WKSbvh0ll61OmSAYL
         z2wvb8Ru0ePxomXipHkyOjD4wRtBhOqwN3+Wb2Akey6z2BDurx1p+mhs45LxICxydF5T
         MxElio9OYQ56/QIaYlxthT+TIPikm6DbNLWVTxkESvLX1yFI98iFlnjPO7o83OQz/Nza
         7QXQaZW+CMwTvjiO8nb5XsdTwPuC0iIBxunr29mUmjKYe4YT+WpZtlOPF2h2qYDjRg1t
         GfEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785895673; x=1786500473;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VVVHXn5WZE3TAq2lS738uM6fISl8R37mJNBh8dxBNlc=;
        b=AyApTshzfTYSRr/dhRSSH3eiYoLPy3HZrnScN5ShTQLkP2L0QHnaymom1Zz1+OfDOo
         gtDMnFeyQDlcbBjJ+6JswaOHOWC+Gyx7ofwvekK9epB0y03Ss4ri4T1W/rWRzfYfy2fj
         Ai+jJ3kegNXwpJ+0nkeFROfhoP2uKamF2NngZMrIrw3ei+hZxSDOkNrLOCbRjdNHlC3x
         FFSGtRGl60342Ev7474EzCB9pwDSKAfsLu+R3Y2D1Lcmxi8RmJprF8C2fOhPTVjQJIsO
         u9d8/6HzwUuO15t39BRSUf+aIxhfLQTVw3yKTrww8fVupnduhfKLYUcG3CMJA7bDHGw3
         k2oQ==
X-Forwarded-Encrypted: i=1; AHgh+RrJ3mdyaza+KLYnfxuzfhIECFta/p6lg1ySs6LccH469v4cc5AbVKsylLEO6RPwdFwU4Z1PsLyDD0T0aFh5znU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyyMfqfUwjppK3Q/j8K08FYDvjpV4gUQrFjY2wKDnQKwN4JntQx
	ckokLS8ydoiJ5d8staPxIb8T4FlIOAbXOZxqSesNLGAGIpaBG60n5Ek9f9nvJ+dXLVRiJzv0syR
	jKfUvTl+QZbFNHHapxPN5Ys1kcuSCKmc=
X-Gm-Gg: AR+sD13d9eaOkhuecI7UIKtavbbhCjlU6w4SFnl0nhwZep+m8WgiaPaYk5JagZFzxMM
	XzRr0jLmdr7AE5mSwN7QlkB6E5PseXcyJ5F2Z/cmhSNj95DIR4WwtzMs50Q75wHsUe360wjjt+G
	bZ6FvJFKxU6eN2HcoEOmac64e/YtAId/V0ylsais5PlA1Os//e51/KD31b5E5pjPAQFSobuUiyC
	dK/5o+CUU7ZjR6z5KqTmT3NHXCxgEvOwN/dHnuyEmC6a0s5zkJRRy8YpXkBdNGcynSZ5mn6I8yg
	U5H4ajBWzNCwSum7j92r8WXI8sjbLJipak12pF5zqc/CCVByZbxVSYh2Ig==
X-Received: by 2002:a05:6820:188d:b0:69e:98c0:4bd6 with SMTP id
 006d021491bc7-6ae96c3662emr1951640eaf.1.1785895673383; Tue, 04 Aug 2026
 19:07:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260729022837.355549-1-chenguang.zhao@linux.dev> <20260729022837.355549-2-chenguang.zhao@linux.dev>
In-Reply-To: <20260729022837.355549-2-chenguang.zhao@linux.dev>
From: Hengqi Chen <hengqi.chen@gmail.com>
Date: Wed, 5 Aug 2026 10:07:41 +0800
X-Gm-Features: AUfX_mxUnxXDGZm3CuFfAeIJjZntI0dLwAv3hjNI7wnI7mpI1FaKzmFthF5pw-c
Message-ID: <CAEyhmHTgCkt2Zezuwkqjgo+MRzA2fkpMcsz_0ddC0Y7semgyvw@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] LoongArch: bpf: Fix memory ordering for
 value-returning atomics
To: Chenguang Zhao <chenguang.zhao@linux.dev>
Cc: chenhuacai@kernel.org, kernel@xen0n.name, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev, 
	eddyz87@gmail.com, memxor@gmail.com, yangtiezhu@loongson.cn, song@kernel.org, 
	yonghong.song@linux.dev, jolsa@kernel.org, shuah@kernel.org, 
	loongarch@lists.linux.dev, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Chenguang Zhao <zhaochenguang@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 29, 2026 at 10:29=E2=80=AFAM Chenguang Zhao
<chenguang.zhao@linux.dev> wrote:
>
> From: Chenguang Zhao <zhaochenguang@kylinos.cn>
>
> Per the Linux Kernel Memory Model, value-returning atomic RMW operations
> must provide sequentially consistent ordering (a full memory barrier). On
> LoongArch, plain AMO instructions and bare ll/sc loops do not satisfy thi=
s
> requirement by themselves.
>

The subject line could be:
  LoongArch: bpf: Align value-returning atomics with LKMM ordering

I think it's not a fix and we don't need a Fixes tag.

Other than that,
Acked-by: Hengqi Chen <hengqi.chen@gmail.com>

> Update emit_atomic_rmw() to emit barrier-carrying instructions for all
> value-returning BPF atomics:
>
>  - BPF_FETCH (ADD/AND/OR/XOR): use am*_db.{b,h,w,d}
>  - BPF_XCHG: use amswap_db.{b,h,w,d}
>  - BPF_CMPXCHG: emit dbar 0x700 after the ll/sc loop, matching
>    __WEAK_LLSC_MB in cmpxchg.h
>
> Add the corresponding instruction encodings and emit helpers to inst.h.
> Non-value-returning RMW ops (plain BPF_ADD, BPF_AND, etc.) are left as
> weakly ordered, consistent with LKMM.
>
> Signed-off-by: Chenguang Zhao <zhaochenguang@kylinos.cn>
> ---
>  arch/loongarch/include/asm/inst.h | 18 +++++++++++++++++
>  arch/loongarch/net/bpf_jit.c      | 32 +++++++++++++++++--------------
>  2 files changed, 36 insertions(+), 14 deletions(-)
>
> diff --git a/arch/loongarch/include/asm/inst.h b/arch/loongarch/include/a=
sm/inst.h
> index 76b723590023..bdbc17d07110 100644
> --- a/arch/loongarch/include/asm/inst.h
> +++ b/arch/loongarch/include/asm/inst.h
> @@ -199,6 +199,10 @@ enum reg3_op {
>         amswaph_op      =3D 0x70b9,
>         amaddb_op       =3D 0x70ba,
>         amaddh_op       =3D 0x70bb,
> +       amswapdbb_op    =3D 0x70bc,
> +       amswapdbh_op    =3D 0x70bd,
> +       amadddbb_op     =3D 0x70be,
> +       amadddbh_op     =3D 0x70bf,
>         amswapw_op      =3D 0x70c0,
>         amswapd_op      =3D 0x70c1,
>         amaddw_op       =3D 0x70c2,
> @@ -783,6 +787,20 @@ DEF_EMIT_REG3_FORMAT(amswapb, amswapb_op)
>  DEF_EMIT_REG3_FORMAT(amswaph, amswaph_op)
>  DEF_EMIT_REG3_FORMAT(amswapw, amswapw_op)
>  DEF_EMIT_REG3_FORMAT(amswapd, amswapd_op)
> +DEF_EMIT_REG3_FORMAT(amswapdbb, amswapdbb_op)
> +DEF_EMIT_REG3_FORMAT(amswapdbh, amswapdbh_op)
> +DEF_EMIT_REG3_FORMAT(amadddbb, amadddbb_op)
> +DEF_EMIT_REG3_FORMAT(amadddbh, amadddbh_op)
> +DEF_EMIT_REG3_FORMAT(amadddbw, amadddbw_op)
> +DEF_EMIT_REG3_FORMAT(amadddbd, amadddbd_op)
> +DEF_EMIT_REG3_FORMAT(amanddbw, amanddbw_op)
> +DEF_EMIT_REG3_FORMAT(amanddbd, amanddbd_op)
> +DEF_EMIT_REG3_FORMAT(amordbw, amordbw_op)
> +DEF_EMIT_REG3_FORMAT(amordbd, amordbd_op)
> +DEF_EMIT_REG3_FORMAT(amxordbw, amxordbw_op)
> +DEF_EMIT_REG3_FORMAT(amxordbd, amxordbd_op)
> +DEF_EMIT_REG3_FORMAT(amswapdbw, amswapdbw_op)
> +DEF_EMIT_REG3_FORMAT(amswapdbd, amswapdbd_op)
>
>  #define DEF_EMIT_REG3SA2_FORMAT(NAME, OP)                              \
>  static inline void emit_##NAME(union loongarch_instruction *insn,      \
> diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.c
> index 29c281bef28e..5417a5624327 100644
> --- a/arch/loongarch/net/bpf_jit.c
> +++ b/arch/loongarch/net/bpf_jit.c
> @@ -8,6 +8,9 @@
>  #include <asm/asm-offsets.h>
>  #include "bpf_jit.h"
>
> +/* dbar hint for ll/sc completion ordering, see __WEAK_LLSC_MB */
> +#define DBAR_LLSC_MB   0x700
> +
>  #define LOONGARCH_MAX_REG_ARGS 8
>
>  #define LOONGARCH_SAVE_RA_NINSNS   1
> @@ -433,7 +436,7 @@ static int emit_atomic_rmw(const struct bpf_insn *ins=
n, struct jit_ctx *ctx)
>                                 pr_err_once("bpf-jit: amadd.b instruction=
 is not supported\n");
>                                 return -EINVAL;
>                         }
> -                       emit_insn(ctx, amaddb, src, t1, t3);
> +                       emit_insn(ctx, amadddbb, src, t1, t3);
>                         emit_zext_32(ctx, src, true);
>                         break;
>                 case BPF_H:
> @@ -441,39 +444,39 @@ static int emit_atomic_rmw(const struct bpf_insn *i=
nsn, struct jit_ctx *ctx)
>                                 pr_err_once("bpf-jit: amadd.h instruction=
 is not supported\n");
>                                 return -EINVAL;
>                         }
> -                       emit_insn(ctx, amaddh, src, t1, t3);
> +                       emit_insn(ctx, amadddbh, src, t1, t3);
>                         emit_zext_32(ctx, src, true);
>                         break;
>                 case BPF_W:
> -                       emit_insn(ctx, amaddw, src, t1, t3);
> +                       emit_insn(ctx, amadddbw, src, t1, t3);
>                         emit_zext_32(ctx, src, true);
>                         break;
>                 case BPF_DW:
> -                       emit_insn(ctx, amaddd, src, t1, t3);
> +                       emit_insn(ctx, amadddbd, src, t1, t3);
>                         break;
>                 }
>                 break;
>         case BPF_AND | BPF_FETCH:
>                 if (isdw) {
> -                       emit_insn(ctx, amandd, src, t1, t3);
> +                       emit_insn(ctx, amanddbd, src, t1, t3);
>                 } else {
> -                       emit_insn(ctx, amandw, src, t1, t3);
> +                       emit_insn(ctx, amanddbw, src, t1, t3);
>                         emit_zext_32(ctx, src, true);
>                 }
>                 break;
>         case BPF_OR | BPF_FETCH:
>                 if (isdw) {
> -                       emit_insn(ctx, amord, src, t1, t3);
> +                       emit_insn(ctx, amordbd, src, t1, t3);
>                 } else {
> -                       emit_insn(ctx, amorw, src, t1, t3);
> +                       emit_insn(ctx, amordbw, src, t1, t3);
>                         emit_zext_32(ctx, src, true);
>                 }
>                 break;
>         case BPF_XOR | BPF_FETCH:
>                 if (isdw) {
> -                       emit_insn(ctx, amxord, src, t1, t3);
> +                       emit_insn(ctx, amxordbd, src, t1, t3);
>                 } else {
> -                       emit_insn(ctx, amxorw, src, t1, t3);
> +                       emit_insn(ctx, amxordbw, src, t1, t3);
>                         emit_zext_32(ctx, src, true);
>                 }
>                 break;
> @@ -485,7 +488,7 @@ static int emit_atomic_rmw(const struct bpf_insn *ins=
n, struct jit_ctx *ctx)
>                                 pr_err_once("bpf-jit: amswap.b instructio=
n is not supported\n");
>                                 return -EINVAL;
>                         }
> -                       emit_insn(ctx, amswapb, src, t1, t3);
> +                       emit_insn(ctx, amswapdbb, src, t1, t3);
>                         emit_zext_32(ctx, src, true);
>                         break;
>                 case BPF_H:
> @@ -493,15 +496,15 @@ static int emit_atomic_rmw(const struct bpf_insn *i=
nsn, struct jit_ctx *ctx)
>                                 pr_err_once("bpf-jit: amswap.h instructio=
n is not supported\n");
>                                 return -EINVAL;
>                         }
> -                       emit_insn(ctx, amswaph, src, t1, t3);
> +                       emit_insn(ctx, amswapdbh, src, t1, t3);
>                         emit_zext_32(ctx, src, true);
>                         break;
>                 case BPF_W:
> -                       emit_insn(ctx, amswapw, src, t1, t3);
> +                       emit_insn(ctx, amswapdbw, src, t1, t3);
>                         emit_zext_32(ctx, src, true);
>                         break;
>                 case BPF_DW:
> -                       emit_insn(ctx, amswapd, src, t1, t3);
> +                       emit_insn(ctx, amswapdbd, src, t1, t3);
>                         break;
>                 }
>                 break;
> @@ -524,6 +527,7 @@ static int emit_atomic_rmw(const struct bpf_insn *ins=
n, struct jit_ctx *ctx)
>                         emit_insn(ctx, beq, t3, LOONGARCH_GPR_ZERO, -6);
>                         emit_zext_32(ctx, r0, true);
>                 }
> +               emit_insn(ctx, dbar, DBAR_LLSC_MB);
>                 break;
>         default:
>                 pr_err_once("bpf-jit: invalid atomic read-modify-write op=
code %02x\n", imm);
> --
> 2.25.1
>
