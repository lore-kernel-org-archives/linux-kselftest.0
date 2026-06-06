Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C4132F0661
	for <linux-kselftest@vger.kernel.org>; Sat,  6 Jun 2026 20:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780778032; cv=none; b=lsJDr4HOE9+PvAfEtvTS5pVv9qe5CnK72WTjJ5NAaMjt83Zf2f8PpZdmjINBlPbB9RE1OQO7vWc6kbl4vSqUiJFuSSIyodFISG6qINLPA9JDlHRQ11tSbUKlgdQkgHyp0gxRKgpY0MCi3uOKFkR2d+JVA0RP13MZLPNHeIf9xNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780778032; c=relaxed/simple;
	bh=e714K+mzo2XhjxtDgqNCwQPN3x0crIIMszq1+viOfto=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fnX93j5aGbph6dFRdr9+OhA/txQ48y2BztzjSV782LP7+F0TkoegQaoeQpmf/0EfiJCq+K+mbk67s7/CGRmWvwiYicC/uK50fHLDwF8/A/iBsoZ+JphcLjumycF34aHg8PipIH/GGtjlyFncvoWJNzQh2nxKLwK4g0VdD4mBlr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V9EZR1CA; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V9EZR1CA"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2bf3781ca51so31382295ad.0
        for <linux-kselftest@vger.kernel.org>; Sat, 06 Jun 2026 13:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780778031; x=1781382831; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=e714K+mzo2XhjxtDgqNCwQPN3x0crIIMszq1+viOfto=;
        b=V9EZR1CAIcggaqv2B6aMhitDDNdui/7I7gcWjKr/RmfgLEgE8y9WQopgL0mti6G8ie
         CnCfYRphFcUQaiFdDYUjMGoeSeZYanmZY5TM8M2HfsDdJDY6dyiGrZtKwm+npZZUxVPt
         ifdEv0ejGYUtFq2fins0JpX073d1811womvTOl5xXaZiDUAsfqE848zHyYCKLnEeNm+d
         QPzUcEq82JTcXuTY3T3jEv/ozhwDpFccOvmPS/U7sWWjYI4huL5lCh/NsIMYvf2OSVrf
         51bHiKA0fK0EH1he8C7YFYoEKWTq2DXtrcDNT2/cdUU45PyLPQzPMXiQhtnL6GdXwdom
         uSUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780778031; x=1781382831;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e714K+mzo2XhjxtDgqNCwQPN3x0crIIMszq1+viOfto=;
        b=UiWIMHZde42J87tSLLDMAvOdDB6QX6VaW2PAuc/CmYqX5Ew80mVEZTiX4RzmJDHTQ8
         kp5QHhspc2oq7XdqsOGq2T+4AvFgCO3t8zzadStibKwVKugPyfa7rkJPs6KLoKUmCKL+
         T4Kg6+8baB7zqp28UHeCL5yT9YDpjet3B1uAFrTkFxk4XqMa7TJXfz557EH8p0UbkpUV
         UV9nMe9kyGx/YTDjfslwwBCCUmQiKkKhdfOt4IUdczTiYegTv/DSuqVhRGbQAr7mJ4Gi
         A2kC8QePWmS6tXVz2OQIfxHUh4uikiLwfWl4ohQCxZueUMhEgXJk0H/ds8EjvXhyw1dB
         MRQw==
X-Forwarded-Encrypted: i=1; AFNElJ9f3YRL9ksTUJ9I6cLr3HGcY7ZOdoyW1gJpxq1S2nEWJ1uuM68fSSy/inFgchXdabaguqU1yU21X/3Zt/+VqJo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy97q5BXuSenqNyIbtJJPmTLexlhe0X5qnHCLyeJWHqsGY/fqvD
	Vj0NHmrwydjH9M965+AslzShYp8hLswZIK5+7E/RhNwi3bmKysIgI/P/
X-Gm-Gg: Acq92OHdsKyVjbwCqQjkJ4x+P6EzkzBm9QB2pcACCbbuBCYpDMors6vA+EOVtWdbQ6d
	k1UuFAoVwZYEZlNs/Tg5Tk3i9pdbCd5hZCAmta4exlFioen8nlQzYEg6rQNxWAkLH+GbrM/Wxea
	+qyvJywzmuJwNPb7mdxkS/aBEo2RPvLINRTyAaYzbTWRdXwd6uE/3z3Pm7Si6FlK/PKoxSRM9n3
	0L7clgZwdG9/YQyJrF5rjr/+SWfJvB+9I8MXA7xK+2AjS+uuZt5L2Vyk/tT6UubDdgsD7PjT56u
	eJNgL0Zo1vOSMNL4ry8X34LJIYETge/+ZvasjbqBC8iXuwu+JAKJoIh5sNusGhsiLE/CyASHk6c
	jXO+fLnD4Gwu1+1jo9GaeSwsAHScf+nHgyfhcTOLanA0FyFCy/lESdHmtcZPOFry1BuYe9vcmI6
	/e6gZW6sXbCrRv7pAZGJCLmHbaK7BHD39NKFxOEWD8rYJkDEguPcVHHrvFOyJqag==
X-Received: by 2002:a17:902:da88:b0:2c0:db23:4c1 with SMTP id d9443c01a7336-2c1e7b359e8mr116953145ad.5.1780778030642;
        Sat, 06 Jun 2026 13:33:50 -0700 (PDT)
Received: from [192.168.0.13] ([38.34.87.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f94a7fsm131987615ad.28.2026.06.06.13.33.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 13:33:50 -0700 (PDT)
Message-ID: <562b1652176c8f40dd24027d0e0d44ddae800353.camel@gmail.com>
Subject: Re: [PATCH bpf-next v3 1/2] bpf, verifier: fold reg->var_off into
 PTR_TO_FLOW_KEYS bounds check
From: Eduard Zingerman <eddyz87@gmail.com>
To: Nuoqi Gui <gnq25@mails.tsinghua.edu.cn>, Alexei Starovoitov
 <ast@kernel.org>,  Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko
 <andrii@kernel.org>
Cc: John Fastabend <john.fastabend@gmail.com>, Kumar Kartikeya Dwivedi
	 <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu
	 <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa
	 <jolsa@kernel.org>, Emil Tsalapatis <emil@etsalapatis.com>, Shuah Khan
	 <shuah@kernel.org>, bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Date: Sat, 06 Jun 2026 13:33:46 -0700
In-Reply-To: <20260606-c3-01-v3-v3-1-97c51f592f15@mails.tsinghua.edu.cn>
References: <20260606-c3-01-v3-v3-0-97c51f592f15@mails.tsinghua.edu.cn>
	 <20260606-c3-01-v3-v3-1-97c51f592f15@mails.tsinghua.edu.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sat, 2026-06-06 at 18:50 +0800, Nuoqi Gui wrote:
> Constant pointer arithmetic on a PTR_TO_FLOW_KEYS register lands the
> constant in reg->var_off (e.g. flow_keys(imm=3D4096)), but the
> PTR_TO_FLOW_KEYS path in check_mem_access() passes only insn->off to
> check_flow_keys_access() and never folds reg->var_off.value.=C2=A0 The
> verifier therefore accepts an access that, at runtime, dereferences past
> struct bpf_flow_keys -- a verifier/runtime divergence that yields an
> out-of-bounds read and write of kernel stack memory.
>=20
> Commit 022ac0750883 ("bpf: use reg->var_off instead of reg->off for
> pointers") removed the generic "off +=3D reg->off" that check_mem_access(=
)
> applied before the per-type dispatch and replaced it with per-path
> folding of reg->var_off.value (for example the ctx path now folds the
> register offset via check_ctx_access()).=C2=A0 The PTR_TO_FLOW_KEYS path =
was
> not given the equivalent fold, so a constant offset that used to be
> folded and rejected is now silently accepted:
>=20
> =C2=A0 before 022ac0750883: the offset stays in reg->off and is folded
> =C2=A0=C2=A0=C2=A0 generically, so the access is checked with off=3D4096 =
and rejected.
> =C2=A0 after=C2=A0 022ac0750883: the offset lands in reg->var_off, the fl=
ow_keys
> =C2=A0=C2=A0=C2=A0 path checks off=3D0 and accepts; at runtime the access=
 dereferences
> =C2=A0=C2=A0=C2=A0 base + 0x1000.
>=20
> For a BPF_PROG_TYPE_FLOW_DISSECTOR program the following is accepted:
>=20
> =C2=A0 r2 =3D *(u64 *)(r1 + 144)=C2=A0=C2=A0 ; R2=3Dflow_keys (PTR_TO_FLO=
W_KEYS)
> =C2=A0 r2 +=3D 0x1000=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 ; R2=3Dflow_keys(imm=3D4096), accepted
> =C2=A0 r0 =3D *(u64 *)(r2 + 0)=C2=A0=C2=A0=C2=A0=C2=A0 ; accepted, var_of=
f.value=3D0x1000 ignored
>=20
> while the equivalent insn->off form
>=20
> =C2=A0 r0 =3D *(u64 *)(r2 + 0x1000)
>=20
> has the same effective offset but is correctly rejected with
> "invalid access to flow keys off=3D4096 size=3D8", which isolates the def=
ect
> to the missing var_off fold.=C2=A0 Once attached as a flow dissector, the
> accepted program reads kernel stack past struct bpf_flow_keys (a
> kernel-stack / KASLR information leak) and can likewise write past it,
> corrupting kernel memory.
>=20
> Fix it by folding reg->var_off.value into the offset before the bounds
> check and rejecting non-constant offsets, mirroring the other pointer
> types (e.g. check_ctx_access()).
>=20
> No released kernel is affected; the regression is confined to the 7.1
> development cycle (reproduced on v7.1-rc1..rc5), and v7.0.x rejects the
> program above.
>=20
> Fixes: 022ac0750883 ("bpf: use reg->var_off instead of reg->off for point=
ers")
> Signed-off-by: Nuoqi Gui <gnq25@mails.tsinghua.edu.cn>
> ---

Acked-by: Eduard Zingerman <eddyz87@gmail.com>

[...]
