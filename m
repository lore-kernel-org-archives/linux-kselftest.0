Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F88E3C3F75
	for <linux-kselftest@vger.kernel.org>; Wed, 19 Aug 2026 04:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787114136; cv=none; b=U/hrS6GslzHoT/cfKUYS2UM7kwdjRoa+9hJVRUQo64iOJcfkVsbPeZvEbC1T/6Ns5ZuU4TKY/+MasGJPsk6jBk96vtsDM1ICxrus32GAtBgQ/vZjTZBV0HYBrh274nIhVXms/Im0mN2bx5mO9OyNyCCk0/R6tnrXhYRFE7IXJg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787114136; c=relaxed/simple;
	bh=04uek7pA566woZc3ndF2+9uLrmc3+K0tLZuLhD7XrNw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=det11MUksZtNXor20v6wfd+I3+0Ttlr3b/Nlwt+BDYMrCPvtFaKYGYHhCKfMNZWjreD3bxsbbwWWFrLrllMuLVkjAkfU7FLjKPj9jIp+tC7SnS3/gOua6dZ27fkVFaQSHydx1XT/F2ijQR1tCJBdm6VgA6YYBDwSCOhtqy1gibk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sG/WGphT; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sG/WGphT"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2cc7ef7ec27so6230855ad.1
        for <linux-kselftest@vger.kernel.org>; Tue, 18 Aug 2026 21:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787114133; x=1787718933; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=04uek7pA566woZc3ndF2+9uLrmc3+K0tLZuLhD7XrNw=;
        b=sG/WGphT8JR+/LYojZALykulUbPuGCZZ4DdBJKUNDS0RxNzXKTwnECE/3ygdKvmdgI
         Kmh4gmlpASapn9T9OCXJequiCXXZwdE8Wg434cSLFp2KgvuT3nFqfC7BcQ7h+tQfvDqy
         3x0M3lm1LnsS9UAruIM6tB0GE5yv7iDT+gv1VlIepGfWTd1tDXFjVs9Fy2fqywN3p7fa
         R+omESNQYPsdyv30cxfuCv4AC6IeWe62/rJFLMuaPUOcH7+XVhqOUe9s1haK8c4yBdNY
         lpXlNXPafb4t976rAVeAcv0OXDVowFfFMdY0LV9RHJFSQbX6K/+muBs6MMCa07Faoqge
         DHPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787114133; x=1787718933;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=04uek7pA566woZc3ndF2+9uLrmc3+K0tLZuLhD7XrNw=;
        b=kohpC4cy+MkSLMxkALhBXS9w65wQbF56BrC3y1ZX6Firbxt+BPqmvyYV9sWUE9d3+6
         VzhJGLQ9vvrwHNKJwYXhOFUVD+FliaQQZkUFAPkCmt9pg/WN2YMa0jd16mA94sdrSQcp
         eF8UuYxoBgto992uGFgHszojvun1VyZIFmhmpPrzWexEs/5zRKpM3bcBupMvc5LCHLNO
         q72dqD7SI7lLSPRrSdweTVhe/0/V1eWWaWcXZauD0cmc+yn+cAzNqZcpYCGpdjr6aJ37
         kKXmop4K45UdslOGa1VUMNzshtU69dqTHAMONswxms/tm7//1kJo1utrOQa61XvW5s+W
         oS0Q==
X-Forwarded-Encrypted: i=1; AHgh+Rr6qaoGuNboHkUVldleYpVSDsQ/HEBFKcpc+CcMM3C4IEXaDTphY2N3UvTle0hUUom1kwFguT/BVsJeI8S579o=@vger.kernel.org
X-Gm-Message-State: AOJu0YyypcVnqS/gmL4W3s79lCYN2RnK7fkZLt05OTO15eN/ghqePSMU
	lzwHpBrQPQa4gyJNpJmePQpg3mccNCufgx5mz69SC9c9XRRpVdAcT+6k
X-Gm-Gg: AR+sD11ZXLGR1+jzbdz8eJWPbZuo9dE5zi4fMeUENtg5DtY28phah2g5HQJB+/j8MG1
	gsadV1dTfik0PvfjBhImrcV+e17pPXVzosrYgSvmhD38gcjEv28iyxd9swOHyxttb/r/XaDb4hl
	48nYO1ei/a0Y6INHB392171EirGjflpQmvWcPjbzDRB7XfQdhtw0yq4zxYmxfishlcFC5Mi1ki0
	Zgs2PlyWS2TfvCC5iOFwJZX2OxrdKAfquWTG0KshkVSM2ByHisDL9ebgW/sW8rDrUtByGs3DbAK
	gABDde6cNYVYPLOJC0XznlMkfeTQvyRbivoCLYg57xxDhrrbON1dEl8bKEuU5ERsXB+5i9nrgXG
	DmMvyUUDHF41l+11ir0FTL1fXGVMvEMptDkdQw/ewkwpsyzhQjmP9XvH9gmIeTwHPBgn1+/rAhQ
	3bqAZGA+de1EVIFJrfmLoQY9Vl9U9FfzQB6haR1MHFos+ZLPX5fRCuhqz+2KtUwRethNdl4+uRD
	fgH9K+SRFUIzux1
X-Received: by 2002:a17:90b:5250:b0:38d:b36e:9813 with SMTP id 98e67ed59e1d1-395810b57d1mr3689625a91.11.1787114133239;
        Tue, 18 Aug 2026 21:35:33 -0700 (PDT)
Received: from [192.168.0.13] ([38.34.87.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957fc0d1besm369972a91.3.2026.08.18.21.35.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 21:35:32 -0700 (PDT)
Message-ID: <5f1b726cd88f2261f70a5aa99f94ea1434c078c1.camel@gmail.com>
Subject: Re: [RFC bpf-next 0/6] bpf: track scalar equality across the low 32
 bits
From: Eduard Zingerman <eddyz87@gmail.com>
To: Vineet Gupta <vineet.gupta@linux.dev>, ast@kernel.org,
 daniel@iogearbox.net, 	andrii@kernel.org, memxor@gmail.com
Cc: martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev, 
	jolsa@kernel.org, emil@etsalapatis.com, ihor.solodrai@linux.dev, 
	john.fastabend@gmail.com, shuah@kernel.org, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Date: Tue, 18 Aug 2026 21:35:30 -0700
In-Reply-To: <20260814231945.3884596-1-vineet.gupta@linux.dev>
References: <20260814231945.3884596-1-vineet.gupta@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-10 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2026-08-14 at 16:19 -0700, Vineet Gupta wrote:
> The verifier's linked-scalar machinery tracks register equality only for =
the
> full 64 bits (optionally with a constant delta). There is no way to recor=
d
> "these two registers share just their low 32 bits", so a 32-bit mov from =
a
> source with unknown high bits has to drop the relationship entirely, and =
a
> later narrowing of the source never reaches the destination:
>=20
> > =C2=A0r6 =3D ...=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* full 64-bit=
 unknown */
> > =C2=A0w7 =3D w6=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* 32-bi=
t zero-extending mov=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
*/
> > =C2=A0if w6 !=3D 0 goto .Lxx=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
/* not taken: r6's low 32 bits are 0=C2=A0 */
> > =C2=A0if w7 =3D=3D 0 goto .Lok=C2=A0=C2=A0 <-- not deduced today
>=20
> The same gap exists for the 32-bit sign extension and was the
> motivation for this patchset.
>=20
> > =C2=A00: (61) r2 =3D *(u32 *)(r1 +24)
> > =C2=A01: (bf) r0 =3D (s32)r2
> > =C2=A02: (56) if w2 !=3D 0x0 goto pc+10=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 ; R2=3D0 (branch taken)
> > =C2=A0=C2=A0=C2=A0 ...
> > 12: (95) exit

Note that ldx instructions have similar structure: one can either zero
or sign extend on 32-bit load. I think this series should be expanded
to cover these cases.

Also, please drop RFC tag when submitting v2.
