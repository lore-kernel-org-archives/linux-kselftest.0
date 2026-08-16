Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D1D63BE16E
	for <linux-kselftest@vger.kernel.org>; Sun, 16 Aug 2026 23:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786924605; cv=none; b=fZJjb2qHLRlfbfWlkZbj8aHQwTomWAz1qWu6cUtiV3fT+fPDQaff8gnfKgg9zq6zQZCclbAv67KzSICRw+nJUlTPSVZeKHp+9ijHQG5s+IPMIiFue1ko7LjhcTxILaxaU0G/eT16I2OmS9LMNRmWh8NJs5YT86+GU5odMfpunQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786924605; c=relaxed/simple;
	bh=Qvkal74R1egH335vOx3qBPn3Bpf6UiClQE9XMnOZRgs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=C9/3RIovu+uwrtwhZHN0OegHNmVvLLjaVwtr04/D0It0LnV6ha0XPw8sGV8ywrCJkPhFFPJ8fOsASk3tbqapiIhnknViCdQLO1YFBsG8IDzYstmRjJJGbjaxuekJoBPy+4rR3v99wpDVela6hZMhLG86rKayiq+BbSO1Gdz765o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GXbZ/28V; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GXbZ/28V"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2cfbbdfa60bso22912415ad.3
        for <linux-kselftest@vger.kernel.org>; Sun, 16 Aug 2026 16:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786924602; x=1787529402; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=GfZg4C+Rx7mhf0/KR0B5Y+MvdvLojqVCPN2v8hs0gwo=;
        b=GXbZ/28VR6QPYjUTY6PHpV2qKXfr8BGdDAaPhIu79ym+xVwaTfCSFGYzU77imCdO/9
         5JKQzprH7wjTI4/LSqckLmRfMjtYQcKWeuLryChTrTYzskCVg/uI2r2BFp2Bgz2J/MlO
         PuCg4JctcBs4p6xXtXZWr6OZUkDGG3isEPb7iV20bOaK7HYzhrNzuhqlMKv53ceON8A9
         t0XZ8dggXxA5GJ5dAoArHVbXjstTv1ngP5jtmu6RLP1Fy/PL184sA9UkbWgE3e0bygny
         pupb9c3N1GFsJLu42/qUXmTmLJf2dRVlopUVc6o+erWz7opZthl5HP7elpjlexdhek7p
         Dq7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786924602; x=1787529402;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GfZg4C+Rx7mhf0/KR0B5Y+MvdvLojqVCPN2v8hs0gwo=;
        b=n3z4KnI9AS4bW+ELhhXsuvfnZe2bPdhovn52hJyFYt/3jfv0XCUpNOz5/X2Jw2KpBC
         ukVPOmpSmjbDwr1d6Sm/r5iqwIWZLHS1nZshAYcg/HlmjEz4i0AtrCHQy/Q73ZQOUtVv
         1xRDce76tGt4jsRyTY+XanZGxyw3g5bKP6q+5TxK6uQjdDiCy4ti1seyLfdZEd8j0cej
         aKBK82obUKcKQ7kslbqJp3wTUgfludlX8yryxwNH+dgFcHCN5pIhJRVEWYjEVUfQT/Tb
         zR/ONwBU8M0vcPodPNobcdI+Dg649yh7vIr48xUj2mPp/T1zR4JzuCNFaZwlxsTecIB/
         KOVQ==
X-Forwarded-Encrypted: i=1; AHgh+RoKqNfQW5cRQeCa2J3XWzQysZ8lUqoETix/zejZOyMuEZsC1/HlG4yb0ljmj73pNBRbw2zu0RJW3vIJkUvLPbY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCRao9fNgzjovCqMZzK8owNGZqsT9WRijgXv5rap8xEZ6FAYeD
	DraPGtub8yHsx0BJ20CubEWoN75jnx/AJtoPiYCrPQvW/awqorWhcsuB
X-Gm-Gg: AR+sD11f7LH5LZlpM626Qn9En9rzjxgmDeKEkXun3vsPfwpPRdbSyrv2KY+OHX7Fj65
	vun/Eq8VCz3z6vllvb+UpFyTqN0X2eYxq1npIj35OpIxJRvh905cZ8WY+6XE3xSytgxfzyu3OPr
	zveIcIwV58xXIVbH+7cfDzvfRAglaC+hilPAPOPHuwDHcJV2HlCNg/i4yzEbf4e1uKwmiJlwDlL
	4baYa0zwoIs/oh9fMoQrOIU37R9J3SQ+zYj/9Y5Mw2oZDRoqrZn94LUWLZfYpeFPXcjorsQSgFJ
	+QvJ9Tfabc6Db48Ox4uzoL+FOnxROZUbTVCoANqIRUU10yHHEe/0KK5hB2ZggoUNS+vxvKMnMVo
	/iNwolrYi4Nv8Thkki5JZIXoYAjXpzg5o823mUZTpNWYclHdjK5LcNweVBEsG/JpuMrSZLdCMSI
	1NrqbZIO2CLC4ZfmRCAyCEYYCyF5at4YmM+MW/F059/IQ9AbV2AZP7+PBvXC3z3xOIBOEZy3pUS
	SlAwf1m8iTOwy5k
X-Received: by 2002:a17:903:8d0:b0:2cc:aa36:c04c with SMTP id d9443c01a7336-2d3b0ad0fa1mr237628105ad.1.1786924602338;
        Sun, 16 Aug 2026 16:56:42 -0700 (PDT)
Received: from [192.168.0.13] ([38.34.87.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d3aec05092sm26446205ad.82.2026.08.16.16.56.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 16:56:41 -0700 (PDT)
Message-ID: <f721efe944dc7393511a8f35a2474e1f812a31be.camel@gmail.com>
Subject: Re: [PATCH bpf-next v2 2/2] selftests/bpf: Cover mixed arena and
 stack atomics
From: Eduard Zingerman <eddyz87@gmail.com>
To: Yiyang Chen <chenyy23@mails.tsinghua.edu.cn>, Alexei Starovoitov
	 <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, John Fastabend
	 <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>, Kumar
 Kartikeya Dwivedi
	 <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu
	 <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa
	 <jolsa@kernel.org>, Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai
	 <ihor.solodrai@linux.dev>, Shuah Khan <shuah@kernel.org>, 
	vineet.gupta@linux.dev
Cc: bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Date: Sun, 16 Aug 2026 16:56:36 -0700
In-Reply-To: <123a014b2b4ecd7d19cbdfe62c62d994e612b6f0.camel@gmail.com>
References: 
	<20260816-bpf-next-038-mixed-atomic-v1-v2-0-4644c1886dbc@mails.tsinghua.edu.cn>
			 <20260816-bpf-next-038-mixed-atomic-v1-v2-2-4644c1886dbc@mails.tsinghua.edu.cn>
		 <cd62cd53be9bcea2d5b63fef8eece815f5095103.camel@gmail.com>
	 <123a014b2b4ecd7d19cbdfe62c62d994e612b6f0.camel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-10 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sun, 2026-08-16 at 16:36 -0700, Eduard Zingerman wrote:
> On Sun, 2026-08-16 at 16:17 -0700, Eduard Zingerman wrote:
> > On Sun, 2026-08-16 at 10:56 +0000, Yiyang Chen wrote:
> > > Add a verifier test with one atomic RMW instruction reached through
> > > PTR_TO_ARENA and PTR_TO_STACK paths. The verifier must reject the
> > > shared instruction with the existing incompatible-pointer diagnostic.
> > >=20
> > > Signed-off-by: Yiyang Chen <chenyy23@mails.tsinghua.edu.cn>
> > > ---
> > > =C2=A0tools/testing/selftests/bpf/progs/verifier_arena.c | 39 +++++++=
+++++++++++++++
> > > =C2=A01 file changed, 39 insertions(+)
> > >=20
> > > diff --git a/tools/testing/selftests/bpf/progs/verifier_arena.c b/too=
ls/testing/selftests/bpf/progs/verifier_arena.c
> > > index b241bbcf54a8a..b22bab33301ab 100644
> > > --- a/tools/testing/selftests/bpf/progs/verifier_arena.c
> > > +++ b/tools/testing/selftests/bpf/progs/verifier_arena.c
> > > @@ -637,6 +637,45 @@ int non_arena_ptr_add_to_arena_ptr(void *ctx)
> > > =C2=A0
> > > =C2=A0#endif
> > > =C2=A0
> > > +static const struct bpf_insn addr_space_cast_insn =3D {
> > > +	.code =3D 0xbf,
> > > +	.dst_reg =3D BPF_REG_7,
> > > +	.src_reg =3D BPF_REG_7,
> > > +	.off =3D 1,
> > > +	.imm =3D 1,
> > > +};
> > > +
> > > +SEC("socket")
> > > +__description("arena and stack atomic at the same instruction")
> > > +__failure __msg("same insn cannot be used with different pointers")
> > > +__arch_x86_64
> > > +__load_if_JITed()
> > > +__naked void mixed_arena_stack_atomic(void)
> > > +{
> > > +	asm volatile ("					\
> > > +	r1 =3D %[arena] ll;				\
> > > +	r6 =3D r10;					\
> > > +	r6 +=3D -8;					\
> > > +	r9 =3D 0;					\
> > > +	*(u64 *)(r6 + 0) =3D r9;			\
> > > +	r7 =3D 8192;					\
> > > +	.8byte %[addr_space_cast];			\
> >=20
> > I'm going to fix this to:
> >=20
> > 	r7 =3D addr_space_cast(r7, 0, 1);			\
> >=20
> > as in the test case above.
> > Waiting for CI [1].
> >=20
> > [1] https://github.com/kernel-patches/bpf/pull/13325
>=20
>=20
> A...and it requires another exception for GCC-BPF:
> https://github.com/kernel-patches/bpf/blob/bpf-next_base/ci/vmtest/config=
s/DENYLIST.test_progs-bpf_gcc
>=20
> Ihor, it's a third time GCC-BPF strikes this weekend.
> What do people think about downgrading it to may-fail until the
> DENYLIST decreases to something reasonable?

I'm not being fair here. ksock series shown a real deficiency in
verier logic, matchers in Daniel's series were unstable.
Please disregard the above suggestion.
