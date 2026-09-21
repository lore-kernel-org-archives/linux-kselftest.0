Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D563851B173
	for <linux-kselftest@vger.kernel.org>; Mon, 21 Sep 2026 22:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790029031; cv=none; b=IQecJvN93PSK2QWvzcN5z2tsQJon3trOaPlhGwO41kdTbZQjl9dpCkA2ltq5AYla77hWMOqplZc1oe5YlJ3HY2kq5kOWgHyzwPvDZ+KOXb3UXQSB0pYnGwIQdpZlvNOIAkrdixBe6ygvQeEPoIlB9P9BhkULbObENaEI+dtwlPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790029031; c=relaxed/simple;
	bh=i+nL9jSpz0eRtAS0Q2BIMZbPF3IYP2ss12701pXlPRI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ecYzqyLeaw1luATeKX32GHx7Lvv51nyH1X4YXxwA3Ugxj9/3Bfecy2BjhDcMBDWzca7AFjVUuflWEcm1BYR/Pmkk2llymK2WF0gXfJrkpzh69R3ovDiUCY7449qNKgxdbzCEv0NOZH5bsUOqtRZer9+oHrjHLm5jpa6lqOkwhkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gfGBWrrh; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gfGBWrrh"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccafb74fso3344599a91.3
        for <linux-kselftest@vger.kernel.org>; Mon, 21 Sep 2026 15:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790029029; x=1790633829; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=46Oxsbf5zuDUQc7C52Kj3PElaB6G7AgxwRfexhKeRrA=;
        b=gfGBWrrhU5uuGuFxNWyuGynNfWPrfyRn5x0YnYf/N8k1886oqpFz03EwjxeK3rSqtD
         WEeWry1jwFvcTdoWBEy0RhPlcntFzD00ingg/6m56zh8i07JKu+sNyj4jmu+uRjmQUBg
         J8ZybOJknIQ5c4bshhNWkXbm/mhVjnAbJeY+vKImVbofXG65Iiy18XRI5jVHkGLDhNoL
         ohk9fiX0zSdY+Q4/gwqVvPTl4A8JN4I9eK9aF3o0hErNXJ6T43h4bi55aRuRejlbCRig
         CC9DX/PXGbjr3jtqHUPzqJnennSAlY/JKPRh1Oicxs5DQuzUDLqahg5kXZA1xwTA6dC/
         btPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790029029; x=1790633829;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=46Oxsbf5zuDUQc7C52Kj3PElaB6G7AgxwRfexhKeRrA=;
        b=dO3y1l5R9Ib4agUyn3ZM65vGbAaYzusJS+dkCq1GD/QH84soSqX3Yug4pQ6ajVrJu3
         TPnYDBPHAyD0E+8RSllR3G6C7IZ5K+Bskh0/+Wjp2oi+XRaIf7OCmasZ5qrxcEirqE20
         T01eiNJLSZgqVdHrOVBRTn1AcmtAKW2HIj3+tRbgmHySB6+g7x63JulwTQoD82kmz15W
         ekTL8Q6bWvB9S8EPPf2WT8dtePFSOBv1tEILfXY4aLRq7BEsiPQgSv/0AS8JK5Db4K0q
         ToqEC7xALFOyEMxNM20N9nnsgwAB3RwIqCL5p2JfYiS7R2K8WUyxiUgWrdiTX5Fr6fgQ
         ZFDA==
X-Forwarded-Encrypted: i=1; AKwUvBwknI1HjgI6WUNOxNbYesHOoWNzv2C+4lzOsjRQ7B/YA51HvITw827MYlP6utSv8kA/D0URTZMixj88YN9UrBM=@vger.kernel.org
X-Gm-Message-State: AFuF++kIjoojBJZHFkI9x4TP02GFdXDv6IhTEnWfyBAdWN54I50Q0w/n
	wp/ib8YswXmgvx8mhRV6V22cJu3vy/Ycrs+iGiZQKzSbbV2V540jMWHd
X-Gm-Gg: AYBFou2FYzNH2Z1Ap6XFtonxgHKlNvZ0SzgVBeE1+4jBc3ewK4mZG1zOQTdFy3Bmyq3
	R6JhM3IJYWC20KGI1eKtIo0paY8w+5GskmgC9n+38WXWyYAX4gZr+bVfBAUM+FryMVDWGEfb1mP
	pg/ZTKctAkixUk7Im7r85Gg2Uq7eKvv5Q6OgFs+unes3a2F42Otyj9GIzCAIQer2H4sKsMNL36u
	Fu5K52DhyLUCRNdi8hA12bkRM0BZtTPMZch7KOpTlOQslhGFjsTcdGpk3JUVPQeKiveFrdN2T3H
	TIeZeUeGPkA7/uVRCaDcFTL3TKcSDpKPRHHXizh5DYyED8i105CJhrGiYvvRTUECWztQamr9Iva
	xV6OV80eEHgpthrpTVCnkQSWrgOAVb8/a+Fd55CTBKbhx+cLpVkHboBdsVH0jOi8sCGD7XDIbAg
	21tLOqjCC7UjQIMGj9s+vvrWNbTd9/hmiBPoigQRFUgb2ivRA4O5bIilK99X0URJGptmKfZOWwr
	vqks/jS+TxXfVQNS2L7OHR1RPQfn35rb+z0liybfcBpedEe8YtGdZvB9Q==
X-Received: by 2002:a17:90b:38cc:b0:3a0:41ad:6b9b with SMTP id 98e67ed59e1d1-3a041ad747dmr5731325a91.34.1790029029157;
        Mon, 21 Sep 2026 15:17:09 -0700 (PDT)
Received: from ?IPv6:2a03:83e0:115c:1:9de9:26b9:a969:69d7? ([2620:10d:c090:500::5:f95e])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f0bfc7fdsm571510c88.3.2026.09.21.15.17.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 15:17:08 -0700 (PDT)
Message-ID: <f4a616cf9241589fd093bbd0b34e8c8a162d579a.camel@gmail.com>
Subject: Re: [PATCH bpf-next v2 03/13] bpf: track low-32 scalar equality
 across zero-extending movs
From: Eduard Zingerman <eddyz87@gmail.com>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>, Vineet Gupta
	 <vineet.gupta@linux.dev>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>,  Andrii Nakryiko <andrii@kernel.org>, Kumar
 Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau	
 <martin.lau@linux.dev>, Song Liu <song@kernel.org>, Yonghong Song	
 <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, Emil Tsalapatis	
 <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, John
 Fastabend	 <john.fastabend@gmail.com>, Shuah Khan <shuah@kernel.org>, bpf	
 <bpf@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, "open
 list:KERNEL SELFTEST FRAMEWORK"	 <linux-kselftest@vger.kernel.org>
Date: Mon, 21 Sep 2026 15:17:06 -0700
In-Reply-To: <DLLBVIU33MLC.ITFPYGMFKWUT@gmail.com>
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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2026-09-21 at 21:55 +0000, Alexei Starovoitov wrote:
> On Mon Sep 21, 2026 at 7:44 PM UTC, Eduard Zingerman wrote:
> > > > > >=20
> > > > > > Where:
> > > > > > - id =3D=3D 0 =3D> no id link
> > > > > > - full =3D> all 64-bits of the register are identical to
> > > > > >           all 64-bits of a scalar value `id' (let's call it X).
> > > > > >           =E2=88=80 rA{.id =3D=3D X, .link =3D=3D full}, rB{X,f=
ull} =3D> rA =3D=3D rB
> > > > > > - zext =3D> lower 32-bits of the register are identical to
> > > > > >           lower 32-bits of a scalar value X,
> > > > > >           upper 32-bits of the register are null.
> > > > > >           =E2=88=80 rA{.id =3D=3D X, .link =3D=3D ?}, rB{X,zext=
} =3D> rA % 32 =3D=3D rB % 32
> > > > > > - sext =3D> lower 32-bits of the register are identical to
> > > > > >           lower 32-bits of a scalar value X,
> > > > > >           upper 32-bits of the register are either 0 or 1,
> > > > > >           depending on the bit 31 value.
> > > > > >           =E2=88=80 rA{.id =3D=3D X, .link =3D=3D ?}, rB{X,sext=
} =3D> sext(rA % 32) =3D=3D sext(rB % 32)
> > > > >=20
> > > > > hmm.
> > > > > there is also 32-bit link with delta, right?
> > > >=20
> > > > My point is that delta is independent of 32-bit/64-bit property.
> > > > `delta' can be used to propagate in both directions:
> > > > - full 64 bit -> 32 bit sign/zero-extened
> > > > - 32 bit sign/zero-extened -> full 64-bit
> > >=20
> > > both? how ?
> > > I was under impression that in 32-bit domain delta is one way.
> > > rX =3D ...
> > > wY =3D wX
> > > wY +=3D 5
> > >=20
> > > if wY =3D=3D 10
> > > We cannot do -5 to rX
> >=20
> > Why?
> > It is still valid to transfer r32 and tnum_subreg knowledge from wY to =
rX.
> >=20
> >   wY + 5 =3D=3D rX % 32 + 5 =3D> hence rX % 32 knowledge can be recover=
ed.
> >=20
> > If rX itself had some delta, e.g.:
> >=20
> >   rX =3D ...
> >   rX +=3D 7
> >   wY =3D wX
> >   wY +=3D 5
> >=20
> > Then it would still be possible:
> >=20
> >   wY + 5 =3D=3D (rX - 7) % 32 + 5 =3D rX % 32 - 2.
> >=20
> > Again, in case of this direction, only lower 32-bits of the 'full'
> > register can be inferred.
>=20
> Ok, so we're argeeing that it's not 'full' in your above definition.
> Your enum id_link_kind needs a 4th category : apply-delta-to-lower-32bit-=
...
> and it's not bi-directional.

It's not really a category, it's just a direction in a sync function:
- if known_reg is 'full' -> sync to sext/zext register recovers lower
  32-bits and infers upper
- if known_reg is sext/zext -> sync to 'full' register recovers only
  lower 32-bits and keeps upper untouched (counting on cross-domain
  bounds sync logic).
- 'full' -> 'full' and 'sext/zext' -> 'sext/zext' syncs are trivial.

> rX =3D ...
> wY =3D wX
> wY +=3D 5
> if wY =3D=3D 10
> here can apply -5 to lower 32-bit of rX only.
>=20
> rX =3D ...
> wY =3D wX
> wY +=3D 5
> if rX =3D=3D 10
> here can apply +5 to lower 32-bit of wY _and_ do zero extend into full rY=
.
>=20
> I don't see a value of 'zext' kind alone that doesn't do 'add delta'.

Exactly, that's why I suggest this as a completely orthogonal encoding.
Effectively for an abstract scalar value X it would encode whether
the particular register is:
- X + delta
- zext(X + delta)
- sext(X + delta)
