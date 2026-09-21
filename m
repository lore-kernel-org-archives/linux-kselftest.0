Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB56503BF3
	for <linux-kselftest@vger.kernel.org>; Mon, 21 Sep 2026 22:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790029549; cv=none; b=IdXCFqTxxx+1pXA66JuqAMcQY6igSOYIbqBqrTsVplywXXjrvfC/2gUQeMmL+OHKpgHfiDrGkmvV0ENSX0YqD/VVq0vMbrh2r1O8FKdhwtr67aVgndzaXRrh2+nDxp7H6Mfy2HEuj8/mnQFbSlQkidW8UHI2zzoaPs2fl+h4miA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790029549; c=relaxed/simple;
	bh=8NC0hujbv7xtfa8dEzl5XFjQ+Qebvjd183H6KwElKpU=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=PNejEdX9PMdYQrcJkqtkKdLAH23EOc/G7gmJUAXqgI6Av8eCFelUPRfJGm3zJooLGLxHfcj3xYIGteVMsjaYndrDQGZPwJRlqgxg6wiS0ABZrbvqTRl5fOMj7FvhaL1wgTQ343YB4fO+L7R1B4SuGxI05num4ucQrD6SYlKejVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tJ2nsNed; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tJ2nsNed"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2caced6038eso4377915ad.0
        for <linux-kselftest@vger.kernel.org>; Mon, 21 Sep 2026 15:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790029547; x=1790634347; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1gmnlHshE9s3UsHmSY/lKD7Hmyco0TSK2+U3+Y1IWwk=;
        b=tJ2nsNedRL/vOcCrmKB7Aow7okBkgiypcHwQRkhQVwx9VzqSx9PfcKqDmWfy7Uss04
         yERNn5aOFMywgcaM/V5NJdQ1RJVl0DhBi0/tJ5oKCtJhaXE/ZbEt7uooTApmntAkhbZD
         Ufi+BIYtD3zQ2aLCi6xElaNwELTYgPj1JrkdrTeYEANopeZSZyUMTVOtf8J0/J895u5W
         kbKlXNipQANqJmt/c1n0ei6hnv80XtvNNXUisPrZ0UDTIhpu/sxgw5DRrckgOKhFQV/z
         jVyFw5O4+oA9Xe1IYAa46IyxyAFAe01zgENZIPG4TohthWfWPX1df48dMH7hpZtdUDrL
         8Z2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790029547; x=1790634347;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1gmnlHshE9s3UsHmSY/lKD7Hmyco0TSK2+U3+Y1IWwk=;
        b=m6DXcEuYjQ3zDFVoOXjfQ9USWTAuoHpSc9wcdkTKycu+hWLT5WCjW6ZVKZN6bg2fxE
         PKqBSWDevxnDcllxlZPOVFDWFFfNeA+TbYXyYX73cv9/CLwQIsv4r3Z7951u5j8+OOxR
         bSZMNb4lnPnDNEmT4aMuXaMH1TaCOnBHexDdpZPCMl6/Ypm0QU6H8Z/2q3mp4EGHITRR
         1CqXiBkmYkmd1dGfdQ8limcEOt4D9r+v0SG6yA3NNgt1lnKNvvKRkrtjzj6nBJoBbt+V
         6L6fc/NaDOVJ7BkQD6WKlnLitC4W7fiJLlF0O7EChLDelWLnb0A7CCNuUDDfZVldCK5s
         kR9w==
X-Forwarded-Encrypted: i=1; AKwUvBzIECMF0hvQN5U2Qkjzs0p2XOy9dnvTxYLuG305ZTnQZscETqXbb/xXO1qJEcDYFrFCPGKMVyNq4cBVEKtimag=@vger.kernel.org
X-Gm-Message-State: AFuF++lwYanHkPxEL7y0uwBPaVfNFGWBltB0Vuoup2YtMaIDUOoW4KC/
	0RFDSZgWYA2htOu999IQ1ZBoAXqv4G4T1TMlhrkxeo2MPfJ1XN8gmHXA
X-Gm-Gg: AYBFou1jSvuq4NJVfswTJbjrp3B1WAQsw0zbiDPrmE2VdFZN7psGgTWcj7toKnwC76Q
	pWElvA3UlhXXEKLzk6Ai0oKJv2WeUp3TGBCc7dv7QbqqJqUv01+SoeJO7Y8IijQAgb2OnsmOywU
	RR/yl+ow/Fm4shLXkVFzD6XFUW+T1pCGH9RIeKhqS56eoI5zct+xyAepJrTzEdl1dQtiiq8zquH
	0MxssbKzZmpQb+Wzf5sS5/VwF/Q48FsrJpfq3+zqgSeP4nWeP2tKNVEAvDDVbm7nJrVWaFCjYUe
	mpzpc3EH1CMRSWOP2YmKujLmHa7A90UNQxic8I7GF5tp8ko7U6RGqDSzRnsMMAjo6wwGQxCGp5h
	0r0sviojGppZ8iCrtntHqTf9/52lQBiSQw8Ni+E0A9g7ufHAdkdQKt9C/5p4l3mPQrb55YwMJPH
	co5t0u8MQqltL0UuiGd4bnYfX+IKNkp6MeD25NrET6G0sDIh1YKvO4jrw2HXwUsJtiWZ8fxB2gb
	hJqO4s19UbhCAR9/9Dd7aZQmOM39AIZx2ZTKesa4kU3c3UA4jNUh7jeJpTcWy8hdfCyF6iHKl0t
	ulA=
X-Received: by 2002:a17:903:11c4:b0:2d8:d4d2:d138 with SMTP id d9443c01a7336-2df59a6039amr7832095ad.20.1790029547035;
        Mon, 21 Sep 2026 15:25:47 -0700 (PDT)
Received: from localhost ([153.61.198.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df5b7a534dsm1068885ad.35.2026.09.21.15.25.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 15:25:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 21 Sep 2026 22:25:46 +0000
Message-Id: <DLLCIL3RGVY1.H5A4OEASW5OF@gmail.com>
To: "Eduard Zingerman" <eddyz87@gmail.com>, "Vineet Gupta"
 <vineet.gupta@linux.dev>
Cc: "Alexei Starovoitov" <ast@kernel.org>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "Andrii Nakryiko" <andrii@kernel.org>, "Kumar
 Kartikeya Dwivedi" <memxor@gmail.com>, "Martin KaFai Lau"
 <martin.lau@linux.dev>, "Song Liu" <song@kernel.org>, "Yonghong Song"
 <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>, "Emil
 Tsalapatis" <emil@etsalapatis.com>, "Ihor Solodrai"
 <ihor.solodrai@linux.dev>, "John Fastabend" <john.fastabend@gmail.com>,
 "Shuah Khan" <shuah@kernel.org>, "bpf" <bpf@vger.kernel.org>, "LKML"
 <linux-kernel@vger.kernel.org>, "open list:KERNEL SELFTEST FRAMEWORK"
 <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH bpf-next v2 03/13] bpf: track low-32 scalar equality
 across zero-extending movs
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
X-Mailer: aerc 0.17.0
References: <20260910164635.459558-1-vineet.gupta@linux.dev>
 <20260910164635.459558-4-vineet.gupta@linux.dev>
 <DLDKI0ZXYI7H.1XQZZE2RCU7IF@gmail.com>
 <4ab75099-0e95-4fee-81da-6f4198e3e6a0@linux.dev>
 <CAADnVQ+N9tzBJ0Bbvp8_8QvR+QcCP4ej5CgV_kRHt=iw4BANSQ@mail.gmail.com>
 <202c45e2-58ba-4ad5-a234-c90703031f91@linux.dev>
 <CAADnVQ+Si9Au8J_j2nt+ZzFq6WPaz8hpmh0n=_dFysZmSOeipA@mail.gmail.com>
 <ff18ccb77a554000a030199e8c1fbb7d8d298e18.camel@gmail.com>
 <DLL84IMPTRQF.3DOQQTN2KCAEW@gmail.com>
 <e9aad352ba82dadd97a17867108b5db1865fa38d.camel@gmail.com>
 <DLL8Q69N7BUD.1HI0MKU2M2UGE@gmail.com>
 <951923920747d8dcba3d56ca8858e106d9c7ba4e.camel@gmail.com>
 <DLLBVIU33MLC.ITFPYGMFKWUT@gmail.com>
 <f4a616cf9241589fd093bbd0b34e8c8a162d579a.camel@gmail.com>
In-Reply-To: <f4a616cf9241589fd093bbd0b34e8c8a162d579a.camel@gmail.com>

On Mon Sep 21, 2026 at 10:17 PM UTC, Eduard Zingerman wrote:
> On Mon, 2026-09-21 at 21:55 +0000, Alexei Starovoitov wrote:
> > On Mon Sep 21, 2026 at 7:44 PM UTC, Eduard Zingerman wrote:
> > > > > > >=20
> > > > > > > Where:
> > > > > > > - id =3D=3D 0 =3D> no id link
> > > > > > > - full =3D> all 64-bits of the register are identical to
> > > > > > >           all 64-bits of a scalar value `id' (let's call it X=
).
> > > > > > >           =E2=88=80 rA{.id =3D=3D X, .link =3D=3D full}, rB{X=
,full} =3D> rA =3D=3D rB
> > > > > > > - zext =3D> lower 32-bits of the register are identical to
> > > > > > >           lower 32-bits of a scalar value X,
> > > > > > >           upper 32-bits of the register are null.
> > > > > > >           =E2=88=80 rA{.id =3D=3D X, .link =3D=3D ?}, rB{X,ze=
xt} =3D> rA % 32 =3D=3D rB % 32
> > > > > > > - sext =3D> lower 32-bits of the register are identical to
> > > > > > >           lower 32-bits of a scalar value X,
> > > > > > >           upper 32-bits of the register are either 0 or 1,
> > > > > > >           depending on the bit 31 value.
> > > > > > >           =E2=88=80 rA{.id =3D=3D X, .link =3D=3D ?}, rB{X,se=
xt} =3D> sext(rA % 32) =3D=3D sext(rB % 32)
> > > > > >=20
> > > > > > hmm.
> > > > > > there is also 32-bit link with delta, right?
> > > > >=20
> > > > > My point is that delta is independent of 32-bit/64-bit property.
> > > > > `delta' can be used to propagate in both directions:
> > > > > - full 64 bit -> 32 bit sign/zero-extened
> > > > > - 32 bit sign/zero-extened -> full 64-bit
> > > >=20
> > > > both? how ?
> > > > I was under impression that in 32-bit domain delta is one way.
> > > > rX =3D ...
> > > > wY =3D wX
> > > > wY +=3D 5
> > > >=20
> > > > if wY =3D=3D 10
> > > > We cannot do -5 to rX
> > >=20
> > > Why?
> > > It is still valid to transfer r32 and tnum_subreg knowledge from wY t=
o rX.
> > >=20
> > >   wY + 5 =3D=3D rX % 32 + 5 =3D> hence rX % 32 knowledge can be recov=
ered.
> > >=20
> > > If rX itself had some delta, e.g.:
> > >=20
> > >   rX =3D ...
> > >   rX +=3D 7
> > >   wY =3D wX
> > >   wY +=3D 5
> > >=20
> > > Then it would still be possible:
> > >=20
> > >   wY + 5 =3D=3D (rX - 7) % 32 + 5 =3D rX % 32 - 2.
> > >=20
> > > Again, in case of this direction, only lower 32-bits of the 'full'
> > > register can be inferred.
> >=20
> > Ok, so we're argeeing that it's not 'full' in your above definition.
> > Your enum id_link_kind needs a 4th category : apply-delta-to-lower-32bi=
t-...
> > and it's not bi-directional.
>
> It's not really a category, it's just a direction in a sync function:
> - if known_reg is 'full' -> sync to sext/zext register recovers lower
>   32-bits and infers upper
> - if known_reg is sext/zext -> sync to 'full' register recovers only
>   lower 32-bits and keeps upper untouched (counting on cross-domain
>   bounds sync logic).
> - 'full' -> 'full' and 'sext/zext' -> 'sext/zext' syncs are trivial.
>
> > rX =3D ...
> > wY =3D wX
> > wY +=3D 5
> > if wY =3D=3D 10
> > here can apply -5 to lower 32-bit of rX only.
> >=20
> > rX =3D ...
> > wY =3D wX
> > wY +=3D 5
> > if rX =3D=3D 10
> > here can apply +5 to lower 32-bit of wY _and_ do zero extend into full =
rY.
> >=20
> > I don't see a value of 'zext' kind alone that doesn't do 'add delta'.
>
> Exactly, that's why I suggest this as a completely orthogonal encoding.
> Effectively for an abstract scalar value X it would encode whether
> the particular register is:
> - X + delta
> - zext(X + delta)
> - sext(X + delta)

ahh. it wasn't clear to me that 'zext' you're proposing does '+ delta'.
Now I see that your zext is the same as apply-delta-to-lower-32bit-and-zext
as I was talking about all along.

