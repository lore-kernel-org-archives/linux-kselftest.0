Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FDBD4C9549
	for <linux-kselftest@vger.kernel.org>; Tue,  9 Jun 2026 17:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781026033; cv=none; b=Kfh5H5GFHTIJrMJ0l4FrvJPZnwIRpcnXdboN2+FGoJeAC45KpZzGyIezFK/HMANWx53JqGABhMBMhIFrg2VBgtUkSj1Rdf/jfN7k3lxDL8Cz5ENokcC1J0+7aqPpDjEFqEZflUbjYGP5WKdThz4ZVPgo05tDe4lz5eFHkuammBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781026033; c=relaxed/simple;
	bh=XP12//l6icFutubq5HcIhpjs1JD3dOe7rFIpKieBZYw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SrR9LXyzTqveMlg+xcLTA9yowDIBieleMZnbY/GnMq8VXOiAMn/CLXttno07trSI+P74D1OirLJW9E6Q9IefNHHURsR+MFDpQVicWuT3zotDUM+wHwK0EI2lu6HM3jkktVlgRlPxH71ijhNg6OeTDuYmvKQmi2JPtqPJPG8PpSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pZvMEgxK; arc=none smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pZvMEgxK"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-13832028e9fso1023443c88.1
        for <linux-kselftest@vger.kernel.org>; Tue, 09 Jun 2026 10:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781026028; x=1781630828; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vXMiGqxbaUP+oImtGF3Od5sBeqsgvxmpYzRfPRB1FZM=;
        b=pZvMEgxKr9855ZmlbJoiA/5IKV1qyqQYvEsPckraclBbWt+9s8fU4r09aEpQ8YeFYR
         uT0trqUMPq1LO3IE+n3zNVjNZEdlfcpQoOyTlcRC5olidb7HRvEIKqnyrMAwrw8obzUs
         vFRpJBxwJZPRgtVSamSawsn/OZMZeHC/RBd1v6XNA9yeS2IFh31gqe0a9wNrN3D9TsGT
         1b14ToPrZgL4KZW7HAVIoXotTxfrMzq0rvL7eQZjWL4d+zqUydEfuDOJx+fgBDXyieE1
         2HqenjksjLG60RPwJ2hUWtvTlbe/FkoBu4466/3dgPgslzH8q5/qWt6WomwuJ2/SFKXF
         kpJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781026028; x=1781630828;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vXMiGqxbaUP+oImtGF3Od5sBeqsgvxmpYzRfPRB1FZM=;
        b=cFtpp2q/QvLJwUkrSYrI3LTPfd8m2F/MxkTcYAmzF5niP9a+tAYteAWaqDu7mXMiGK
         aiQzsQPCc8mTboMP2utEt+mQCKkHhu0kdHgbYlh3cnq52N2xA9Vv2h4gQvvjrjnZZYUl
         wrIsVLHP8PHqdkGOs8Jxtb6cVbLK2GLBLoA+1DngFLogtidBasZ658N2RU0NgoVwbKK7
         DKmGk5GBWl7ySNLcoel+5aCUFqap+USUmc7hRXtbentMC82S+hDlQsXBhIXGTJld7TPn
         FR2wtKzWy1qo7xk7Ge1dYD6cmUAlu1pvVIl6ejxiO1CBvwDch+erKRFwRZFPN32rmjUY
         vg3Q==
X-Forwarded-Encrypted: i=1; AFNElJ+Ab+km1kU2psWPUBmjU2QAx9rLTCC8zxyo2LsUFPgj9I/sv4QxA9nh1SpWl7jy791/cx6oo4IiqJFLnp19j5g=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZjySTuPbyBSO3P2R2tLPTlfh1cLL+LJJ3k5i4PnCDQA4Jc/Ux
	Ut4k6kNax/pa5zoYKKfYDYAxrGT3GJnJPa6LrnTimvIuaOcb7x/6f4D0
X-Gm-Gg: Acq92OG3pte7AOkfPZXgJytuYu2EAuS8TYLE2eDSHRrZ9EEXnya2sFKbpTcbLxmr5fw
	08Qjwnm7qEHQY0iz24WNaGz6FKUuGHY3ShAdb5zzi14B677u0KVgXLGT6ZdszJzNgcwlCZkURDs
	lWwPZvbEbBQEjiZnhHaA0ozLV0edfmbAFP+PyruAFcJOPs5gtroiVQNFdMXBTgdH6mter/ByFyq
	w8DZ1uFIMhhOL1C4EZ2t2vN+8TV3xkc/pzPCg6dtjrXygHaa9FElbOoVfJL9HhACvXA7YiKX7hi
	4gwhf+fRNpqwklR9FQ6OhK9HRrAw3ppGqNf2jCn6vzN4lWcJkGdtpY/1Z/UgykbXSurI+ppMO7w
	lnNhdSVXG79xfnDYE5uSZcM7ij4L78rDP/NaXe3jICbMWDeLkLAbRE43zDomzRtkx6WU9LfCA1S
	mk1BGTvlKbbXnJjbTKbPuMmRbUUB9uvEczylZ8GYluxQrizFa1j9AGIRX1k5PXIJtLNbAZnr1Qu
	+90fXtcKzeeVAUYt9A=
X-Received: by 2002:a05:7022:f9a:b0:11a:342e:8a98 with SMTP id a92af1059eb24-138065b2f54mr12010692c88.0.1781026028061;
        Tue, 09 Jun 2026 10:27:08 -0700 (PDT)
Received: from ?IPv6:2a03:83e0:115c:1:f998:4362:fa1b:11a8? ([2620:10d:c090:500::3:f603])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1381495bb00sm9369001c88.3.2026.06.09.10.27.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 10:27:07 -0700 (PDT)
Message-ID: <b58e49c8f4d2d4d5d1a9a8f27e77b56b04b5a70d.camel@gmail.com>
Subject: Re: [PATCH bpf-next 1/2] bpf: Fix gotox target validation against
 CFG
From: Eduard Zingerman <eddyz87@gmail.com>
To: Anton Protopopov <a.s.protopopov@gmail.com>, Nuoqi Gui
	 <gnq25@mails.tsinghua.edu.cn>
Cc: bpf@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>, Daniel
 Borkmann	 <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Shuah Khan	 <shuah@kernel.org>, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Tue, 09 Jun 2026 10:27:06 -0700
In-Reply-To: <aig3p8QFlWv1sFqV@mail.gmail.com>
References: 
	<20260609-f01-02-gotox-bpf-next-v1-0-b441d63a1559@mails.tsinghua.edu.cn>
	 <20260609-f01-02-gotox-bpf-next-v1-1-b441d63a1559@mails.tsinghua.edu.cn>
	 <aig3p8QFlWv1sFqV@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.1 (3.60.1-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2026-06-09 at 15:56 +0000, Anton Protopopov wrote:
> On 26/06/09 11:03PM, Nuoqi Gui wrote:
> > CFG construction records the modeled gotox target set in
> > insn_aux_data->jt. It includes INSN_ARRAY maps based on whether the map
> > target is in the current subprog. check_indirect_jump() later validates=
 and
> > follows the current PTR_TO_INSN register's actual INSN_ARRAY map. The
> > verifier does not check that targets copied from that map match the tar=
gets
> > that CFG construction modeled for this gotox instruction.
> >=20
> > This lets one gotox instruction observe two different INSN_ARRAY maps. =
CFG
> > can select a map whose target is in the current subprog. Another path t=
o
> > the same gotox can carry a PTR_TO_INSN value from a map whose target po=
ints
> > at a different subprog. The verifier then accepts an edge absent from t=
he
> > CFG.
> >=20
> > On x86, gotox becomes a raw indirect jump in the JIT image. Accepting a
> > target not modeled by CFG can enter another subprog without a matching =
BPF
> > call frame and crash when executed. Validation observed a GPF in
> > bpf_test_run().
> >=20
> > Fix this by requiring every target copied from the actual PTR_TO_INSN m=
ap
> > to be present in the CFG jump table built for the current gotox
> > instruction.
> > Reject the program before pushing verifier states for any unmodeled tar=
get.
> >=20
> > Fixes: 493d9e0d6083 ("bpf, x86: add support for indirect jumps")
> > Signed-off-by: Nuoqi Gui <gnq25@mails.tsinghua.edu.cn>
> > ---
> >  kernel/bpf/verifier.c | 26 ++++++++++++++++++++++++++
> >  1 file changed, 26 insertions(+)
> >=20
> > diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> > index ed7ba0e6a9ce..25fa90e731e3 100644
> > --- a/kernel/bpf/verifier.c
> > +++ b/kernel/bpf/verifier.c
> > @@ -17124,6 +17124,23 @@ static int indirect_jump_min_max_index(struct =
bpf_verifier_env *env,
> >  	return 0;
> >  }
> > =20
> > +static bool is_cfg_indirect_jump_target(struct bpf_verifier_env *env,
> > +					u32 target)
> > +{
> > +	struct bpf_iarray *jt =3D env->insn_aux_data[env->insn_idx].jt;
> > +	int i;
> > +
> > +	if (!jt)
> > +		return false;
> > +
> > +	for (i =3D 0; i < jt->cnt; i++) {
> > +		if (jt->items[i] =3D=3D target)
> > +			return true;
> > +	}
> > +
> > +	return false;
> > +}
> > +
> >  /* gotox *dst_reg */
> >  static int check_indirect_jump(struct bpf_verifier_env *env, struct bp=
f_insn *insn)
> >  {
> > @@ -17171,6 +17188,15 @@ static int check_indirect_jump(struct bpf_veri=
fier_env *env, struct bpf_insn *in
> >  		return -EINVAL;
> >  	}
> > =20
> > +	for (i =3D 0; i < n; i++) {
> > +		if (!is_cfg_indirect_jump_target(env, env->gotox_tmp_buf->items[i]))=
 {
> > +			verbose(env,
> > +				"gotox target %u from map id=3D%d is not in the CFG jump table\n",
> > +				env->gotox_tmp_buf->items[i], map->id);
> > +			return -EINVAL;
> > +		}
> > +	}
>=20
> Thanks for reporting the bug.
>=20
> As for the fix, would it make more sense to either record maps in
> check_cfg or to re-check subfunc boundaries here?

+1 for checking if the jump is within subprog boundaries assumed for the go=
tox.

> >  	for (i =3D 0; i < n - 1; i++) {
> >  		mark_indirect_target(env, env->gotox_tmp_buf->items[i]);
> >  		other_branch =3D push_stack(env, env->gotox_tmp_buf->items[i],
> >=20
> > --=20
> > 2.34.1
> >=20
