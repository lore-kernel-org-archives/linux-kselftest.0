Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.214.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793994595;
	b=PBJHG8nG7QaN6+z7HuxAv0HIDoV2Aw66MbiTa2dV9XpLLwlXyLIrAlsbR0A4rz7ClvgB
	 pFSM+1IdVdGAiDBySht+CU8xxHkp6o142XVrzfGp49gNbaPPrkCaco3t1fJ4CrH6+cFXa
	 G0BDUXWi9L+A6rt+6QbhnKFGO8zPxBv/3uZsc++aZfJE4f/zZl5pxdaX8eW3m4I1UGiKy
	 qvnaj0CyvPFuZNQthvq1PFThRoFmDuwomYagteUxuvmZ/o0iwbc1y1DsEqQ6de3yWuwgP
	 RZ/zhwBq5Ewwr16t8Kf3TLcGtfSda+uv71AZ7Io/l+BGQkXWyw6nlgAQMbE321nyYfg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793994595;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=b8v+/nVV3ssXYzzzdSdzKOO8zOsYTPEGfi/d2I/edOo=;
	b=bXJ68/ZOcArDOQlWLPlhrhYFhHv2/k/jqECDLeQZFeRzvDaj6EIxjenkS4JkAjjqdDp5
	 jeY4POAGMeVyLI/g/0n9rworTk6UiypOE7zHNXsVUB9pp5jte+w9ahSJJwkR3Aq31bFOr
	 SjIgdACtWgjqoaTcWXcLTVLuHoqE+r6YZBsK2UOwsYzTgoROsqxU5Wycf2DfAryBcj0We
	 PknA4D2DjFmr8aXVqqxASwVAw5E+tFYIqiEwreneCwMWttUguO6nKW8Wh2/iO4lAaZ2z8
	 YyPHAVMmxz/A+99kavTLlaP6bJsDotLEnt2A7qTXyA7xWTXMcnLRiFOSBbxRNZTHfRQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iiP4XVRy;
	arc=fail smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8592606A329
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Nov 2026 19:49:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8592606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iiP4XVRy
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2ed08b07213so4160065ad.2
        for <linux-kselftest@vger.kernel.org>; Fri, 06 Nov 2026 11:49:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793994594; cv=none;
        d=google.com; s=arc-20260327;
        b=L7pPBx6Futcn4NfkMJweTINx2n331HJy9Sgftig8Slwk1G2W2/NkGpk2O1kqgWczSi
         Eop96/SzPC4nGEgj+1RrBLsP1TNChN79LxrRgXORVBMHEPERA8fxsn5/RnDyZwr2nh7M
         IC9Hxy4bhhh/AwI7RCOfR1o0Ns8I63AkukEt67uzFFycyQbzsr6C6qxMlqsBSMjWSam1
         ZDsOKrYQ02BPs+fyOHZyoH1sMzSOW/PGDkQLDCQ/fQIMPP0jftQ9U1+A5dNugDpjfjSR
         JEDAweNxblZeFeWkhIy9NPGdWB0pDtsw/KdNvbOBDRlqDmRWxY2GuWiRVLq0f/itHi7d
         d3OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=b8v+/nVV3ssXYzzzdSdzKOO8zOsYTPEGfi/d2I/edOo=;
        fh=tdqpJhGK0kOlCC44MgtSIEpBeSuRUuC0bWTpL8lkryc=;
        b=XTcGAyY3fw96zgwLe1wquTcHEJKhn+o6zta3sAkpAjS/FrWganugj9NvhDfgf4mSqJ
         io81R0/eSUQZ8s5zQoMoHV7qaLh2/G3J3wCG3r146BNOFo3TK0VKEbH9NuNcVjxpJEPc
         sl7DA08rPEeLWVj6ETVRNtzoAlJRCrK9waEHA3QpmhqQX8+Fi0yO/MmKreYiqf5+d655
         OR4jPYEpYSxhNc1hC05YSy0kQZAt6QQCfGHsXmrFDiolqE/js0KTXLHP/uVrdyoSUAT+
         SE6F56uvD7wiGgCFXSYQ+wi23LgHHKt9vVbFssZ8WepocBabr+wac76u301F4pQmIR5B
         znCg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793994594; x=1794599394; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=b8v+/nVV3ssXYzzzdSdzKOO8zOsYTPEGfi/d2I/edOo=;
        b=iiP4XVRy+wXLIk4ARRYrY/94n6DfGcCtjqVZaf5AZDIxvtyNzlbQByMucXKDgDdWuW
         aVrkp0uz8Yo9gCb3NGwi8LoIldgrelj18hbXKhbc9A0JDNmmNDZQkmlvm9wVA3Y0Wb1o
         wGSj22bUwypJdk9fKsGIu1PPkqaGDeLm1BmyLdRbmppvsmHKPTyYxyBFMxnNH7lSmHtn
         iu8jRYK6BQrIdrXwFXdAKoP1sjw+K1Ni46AYielh2K3m2zuPfo5STxBrt/xb+aWLpmBY
         xaIhKOTpItzeTLeXxqlI9MF4kNF9h/K2RFD3uTjeeGFFv2ZspqvZ52M9/iUehgdSfig3
         EM6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793994594; x=1794599394;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b8v+/nVV3ssXYzzzdSdzKOO8zOsYTPEGfi/d2I/edOo=;
        b=Ium8kWKMDPCY73nLfXkMWbe8abU+OnvhF0qDLAKSJiMIfNCpWnOxIH3vw0EmBGEdxQ
         K4fy8Sekz9GpNmZhYympfaydgQS0BW0YdVvRwFqXz4MGq5vfBHaKyG2dvAy9FmjU0QED
         W+UZG58Dth83lFJwDKGNF9aXiyK8/NufnyAI3gLOhD5b7sdYQ2lyrzXwGE+uYBTIi3rg
         umbp93+xrPvDaBWIpmgJF9Y5tA0yIeqSNwYR9I7SpKDwis56fjyM99oHFNX0wRtDR6u/
         DgpB1LZR5iqf7w1TPuVrFPkeRTVDumtTJDJN3Vu764bzTPn5pUpX8YHknbflJq3D2Zds
         RDYg==
X-Forwarded-Encrypted: i=1; AL+hErHDYpyJiei7y9nZfPVnnDWFy7rfmtxUj6T83AqdiNvmxL+UslSLAFEJJ/5oLRw+nIq1p+iy+hNbeBU+QOvDrK4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/9QrjBp4VgTYsc0JQR2uI1ZBJkxpbonIj9afyOndVjkjd94WEH
	Y+dDWB+LuNtLsD7IDJLGPPtgox6oZKgvyAdOfrg9cC2Mhk63+WEiqfaXW6cydb5dQpa/UgKZ5Mj
	/qc/9NuimcP/OrOkuDoxBeqyiVxycy0o=
X-Gm-Gg: AYBFou1fpGAhGI+6kp8iHDN/Nc0JUY3FbW8DQZXkvIarYqNR1VU8RWlu9kKSn5vy1GY
	w5USCHeO/tFBp7ajeF3V90i2fhXnBEitXH2INehMRKhlq3IEmml6DkDKeQRCBy2VfP4CwAYVlB9
	zi/wJpV3UeEiSGKoXKHNnbQC7ISYB1OqrI4SpLSgmxaIWBJb4CnZ2dD5u3DLpTkXrDRtOIJldnE
	VdW2LtiahCLhPvadgbZOksf7+UTTNKQyCVUh8zkX6kcvVUGlC8mPLPKp7FbKg0ju/DGjibJjTDi
	BLVAVsUfQq/Oo0+jCEB9oC0T5B3i7g43z2ja6OMy1YETMyI1zcLvhEQVPJJqOQ0zrrN+gu8Q+0V
	SVuYWPAhAb6DJtjIvEjbGuEhtzsMwLsrh1ChQqSENJPpnFMbHMoxX6TlKW9qntb1FsSMysyBGP4
	MhxtkIVjzJkBcwntIzxQ==
X-Received: by 2002:a17:902:ce03:b0:2dd:ad73:5b6f with SMTP id
 d9443c01a7336-2ed40bdca7cmr42581615ad.31.1793994593947; Fri, 06 Nov 2026
 11:49:53 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101103221.51534-1-dennylin0707@gmail.com>
 <20261101103221.51534-3-dennylin0707@gmail.com> <CAEf4BzaES0KDyhHhk7UguLmRKVWxGoiEXhNvp7QHpeJSZSjbYA@mail.gmail.com>
 <CAGEkeHf9d6BuQWsaqiresmbPNWAVZRbzZv03kfJisT6SQD8aAg@mail.gmail.com>
In-Reply-To: <CAGEkeHf9d6BuQWsaqiresmbPNWAVZRbzZv03kfJisT6SQD8aAg@mail.gmail.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Fri, 6 Nov 2026 11:49:37 -0800
X-Gm-Features: AclHuK-D1ZOSyHMac2tfkJx6j69nnEJP0Zd6RBV1HfjXz9rX2igCRXKdBHWZqjQ
Message-ID: <CAEf4BzY-7XH+XzWzcr6ew5+CFQL_=FxJLZpDNw=ZdPqeA8O6VA@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 2/3] bpftool: Preserve unsigned enum values in
 data dumps
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: ast@kernel.org, bpf@vger.kernel.org, andrii@kernel.org, qmo@kernel.org, 
	daniel@iogearbox.net, yonghong.song@linux.dev, eddyz87@gmail.com, 
	ihor.solodrai@linux.dev, shuah@kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 5:03=E2=80=AFPM Hungyu Lin <dennylin0707@gmail.com> =
wrote:
>
> > how old by now are those btf produces that do not emit kflag=3D1 for
> > signed enums? should we even care at this point or just assume that
> > kflag is set correctly?
>
> LLVM 14 and earlier, and pahole before 1.24, for example. Signed
> enum kflag support was added in pahole 1.24 (August 2022) and
> LLVM 15 (September 2022), about four years ago.
>
> libbpf still clears enum kflag when loading BTF into kernels without
> enum64 support, though. bpftool map dump reads that BTF back from
> the kernel, so this also happens with newer compilers.

BTF enum64 support (BTF_KIND_ENUM64) first shipped in Linux 6.0, which
was released on October 2, 2022. So those kernels are old as well.

>
> Dropping the legacy comparison would lose existing negative-enumerator
> name matches for 1-, 2- and 8-byte ENUMs in bpftool, and the 8-byte
> case in libbpf. In the proposed code, 4-byte ENUMs match through the
> helper with or without the legacy comparison.
>
> I'd keep the legacy comparison to preserve those existing name
> matches. Would you prefer to drop it and rely on kflag alone?
>

Yes, we should simplify stuff instead of adding more quirks and
workarounds. I think it's fair to assume kflag is meaningful by now.

> Thanks,
> Hungyu
