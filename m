Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793314314;
	b=Dc8n93GyMWLTXQkpLNjEWFwW98VNHA3qe8Xvky9swMNuyOf3cpfU3ZU0msKD0QIlIFWs
	 DnyxRntzACRwXAIxoDnWbQ3bTMwb02lQoBpwMoHwmps2HCYoD0tWwULzQocgLvKJP06SP
	 g7H1nektDEURY9lgQKX0XX43Du0NHDiufKH+JV1Fk8OkBEAU9DbTcCmLYQoURdsMLtL1c
	 JBnsxDjURq9bawdeqp6xJvy2OOiZ1G+68ooSy7W7abn9ZApLXJfVwdEEquWUOpS9/Ejl9
	 q9uRPnuDzPeDnujWATVX+MieS2hffVlsHEfZl81ojH+mLC6ENe2EZHKYwyE+2n8LnhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793314314;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=Hss75QZMHY8uPDXRh4LQ1BVxzqq6aGc85aMpqhknHO0=;
	b=Jr+6Z4bEoxbp03C1BWyRTDj8weXhUEwvEMsOJPlQw2Q1DPOieAWy+uWri+sJhnsfW+C/
	 /n0qscYmBsfNJNWsB+rgMAU5Ju8yT4Uy2BbWJfn470xrWBZY6wJEsDNHi1E3us7nDY/Oc
	 8LrJxmicFk1qypcVV36C4CXU6u4UTU7ID8oNq0v/J8qCQTYPv3txQtwTWOkrA+vAbD/HF
	 zayoKSL/eLeeBYPDxJIKYpNyjje8BCAhue/TIPQSLIbAMnzKg7F2sGvUDtQ+u3tI64J0a
	 xyn4W1d41S6sVGVH0oOyUdECPUzap2/PRkMRJWJnX7pvsoxrYO45kqmqBy8v6NDlUwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iU6pl01B;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1E20606A31D
	for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 22:51:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1E20606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iU6pl01B
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-353804b591eso273132eec.0
        for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 15:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793314313; x=1793919113; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Hss75QZMHY8uPDXRh4LQ1BVxzqq6aGc85aMpqhknHO0=;
        b=iU6pl01BqZ2NwS1tYp1PUcjVqVNDN4aWkaYxrRXyxRXtaMCTX6DblvZ1sgcj9kENTk
         5lFO/4731Mj5U58dSZt3CJsG7lwk4N4isUB8worOznMe7fYGaQ5ZxbxEzqSiWXYmA9TA
         M1royqRzI4AdrmdjtiBwCcoJoVoB1HJ2MI+OZ5qtxi4nl2FjP+pAQP5RoqdKSb5+Iu5a
         75J6wOmH7arBr0LYQoqzqx93vfB4cwYqPMYt4h9PFuh3IDzwh9wNyC/ERbzEHrjIhGYP
         q2cAhSo9GxSDE4eavD2tpDbooYBETy0sy2qkQxBBqWxYcM9y6CT7aeH5eP8zpqUGyuar
         /SFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793314313; x=1793919113;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hss75QZMHY8uPDXRh4LQ1BVxzqq6aGc85aMpqhknHO0=;
        b=T4M/RGvXDsAek55bPKU85zdAb7fhMOcHUBc4DvN1Vw9ecqGMsP+d/PvI/oplN7DTby
         u6+jCCoC7q27UgGFHeTuxbljayAmfHlq15sDFSQ03+vrg4dbxWj2ORVvKoVAJXz+JnEC
         sgx1XNYp8agkFCDB9ursToXqrXjL7k0fK1gBqw/Ep2soQ9anhDXmyWXjeqmwjpnc/Di9
         RI5QAkBtMd0g21YmhjEtojDIAXgrlxeKJE5uIEYbgZCN9fSMaezhxOuCebrV9kt+ZPdl
         dC9n36hPF2+yhZPocQHmRvKyAAMBHKmaH+6Tpyp36nHfsRwas7JdlB23KaGuvOomsdRy
         oJRw==
X-Forwarded-Encrypted: i=1; AKwUvBz9dlPsHxWW+3phEjF3lEP7yZShZZISSUDMRhQZSFuXhblnR4VZj+QPk9XYYJwttlFMukeuQmVhGtF3Y6ceYUI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ+x3Ak87VrC6njwoHbX6he8TYU7Nr7kVOAignQk0Izxgh9YFHE
	1NW1B1sXp8ArT93RTNSs9NUTlCmdBfinIhYQB6aExUsFH3j6xbTiHCaN
X-Gm-Gg: AYBFou1ARjRu544teNiCCc2h5HxER74VVuy6Fqjvv6yFE/hbucU5yC2ANFxcI4iId/j
	y7/qAQgpxt1F298LY2XfizXuu+VtSukeS3aqXkdtxrlMH5JW+FLD3FYQxY1OaramtNP2wGcT3Al
	rkmVEtydAtw9hpnavKpr1hSkONnZsyHNgnNsUpRmYZTG75uDtYOiRI8qWz5H5cRPBlyAUxASNUd
	Wd6mlbzrCOYP0BSsU1wxreRsgu0Ou0Oqv1XZhF1t182DMixgsYbvthB/VD0gVtdHarZsomk+KNX
	eSODm0boFS5aRgX9kpQzNSVjfW69VN0bRalKd/phahNJDQDCk+7AJ6n9VjM8ULSiHJ5muBakAVU
	fRv2rsTHlNh4fM7ryjEKRvqNOp842GVmk4D8wx+Qw5QKv7O9LFsED1uw/dr1L9UT1UHDG2O61o6
	1x4tZM+XG84cxln4TvNP2OrZ0XOBmbqay4nVIU+XmqCYUsTqjPYBuiG1On6XkZftiO1BfLE18sX
	AIvGFn8egM1RUvgdnpaHAs+vp58ilVZknwv0G0cU71UnMFahSieDwR6kAueRGPVOISD8IY3Sy5L
	KBQ4h3rsLMnBG6RP8f6iGe5tOPpH85KLN+F5rLvJ2767v5jk2GGo3IiNwhobvR3LJOOS1ANtipv
	Fa5BnHx+MEck=
X-Received: by 2002:a05:7022:285:20b0:1ab:f77:2977 with SMTP id a92af1059eb24-1ac5b027fa5mr581517c88.14.1793314312717;
        Thu, 29 Oct 2026 15:51:52 -0700 (PDT)
Received: from ?IPv6:2a03:83e0:115c:1:cb2e:96f2:5ce4:2074? ([2620:10d:c090:500::4:5b14])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac19f4a04esm1522321c88.15.2026.10.29.15.51.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 15:51:52 -0700 (PDT)
Message-ID: <49019042b63d5718a9419e8fac035cf9104ae8bf.camel@gmail.com>
Subject: Re: [PATCH bpf-next v3 03/12] bpf: Prepare linked scalars for
 relations narrower than 64 bits
From: Eduard Zingerman <eddyz87@gmail.com>
To: Vineet Gupta <vineet.gupta@linux.dev>, ast@kernel.org,
 daniel@iogearbox.net, 	andrii@kernel.org, memxor@gmail.com
Cc: martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev, 
	jolsa@kernel.org, emil@etsalapatis.com, ihor.solodrai@linux.dev, 
	john.fastabend@gmail.com, shuah@kernel.org, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Date: Thu, 29 Oct 2026 15:51:50 -0700
In-Reply-To: <20261020161907.2115379-4-vineet.gupta@linux.dev>
References: <20261020161907.2115379-1-vineet.gupta@linux.dev>
	 <20261020161907.2115379-4-vineet.gupta@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Tue, 2026-10-20 at 09:18 -0700, Vineet Gupta wrote:
> Two scalars sharing an ->id are always related by full 64-bit equality
> today: reg =3D=3D base + delta over all 64 bits (this is true for
> BPF_ADD_CONST32 as well, which implies upper bits to be all zero).
> Sign-extension needs a genuinely low32 equal only relationship kind
> with bit 31 supplying upper 32-bits.
>=20
> Today the following 2 relationships exist
>=20
>   #define BPF_ADD_CONST64 (1U << 31)
>   #define BPF_ADD_CONST32 (1U << 30)
>=20
> Model them differently as
>=20
>   enum bpf_reg_link_kind { BPF_REG_LINK_NONE, BPF_REG_LINK_FULL,
>                            BPF_REG_LINK_ZEXT, BPF_REG_LINK_SEXT };
>=20
> So BPF_ADD_CONST64 becomes BPF_REG_LINK_FULL and BPF_ADD_CONST32 becomes
> BPF_REG_LINK_ZEXT with the exact same semantics as today. But this paves
> the way for a future BPF_REG_LINK_SEXT in the same framework.
>=20
> The implementation needs to change as well. Today the above 2 bits are
> shoe-horned into ->id, needing masking and OR'ing to get ->id and kind
> bits: with more types and bits needed, move them out into an enum
> bitfield of its own. To avoid growing the storage (and stay within the
> 1K allocator bucket), borrow 2 bits out of ->map_uid, 31 -> 29, which is
> still far more ids than a program can generate.
>=20
> ->id becomes a plain identifier, so check_scalar_ids() loses its "compare
> the compound id, then the base id" dance in favour of one check_ids().
>=20
> With the kind out of ->id it also leaves the idmap key, so regs_exact()
> and regsafe()'s explore_alu_limits arm have to compare it explicitly.
>=20
> One case changes behaviour -- old {r2.id=3DA+delta32} against
> cur {r2.id=3DB+delta64} was accepted and is now rejected, correctly, sinc=
e
> alu32 and alu64 deltas diverge in sync_linked_regs().
>=20
> Clearing a link is no longer just ->id =3D 0: any stale ->link_kind needs
> to be cleared out as well. And given this needs to be done in the newly
> added kernel/bpf/scev.c, it is moved into bpf_verifier.h as
> bpf_clear_scalar_id().
>=20
> The helper also zeroes ->delta, which the open-coded clear left behind.
> Unlike ->id that field is inside the memcmp() prefix state comparison
> uses, so a leftover value could keep two otherwise-identical states
> apart; clearing it can only help pruning.
>=20
> Suggested-by: Eduard Zingerman <eddyz87@gmail.com>
> Signed-off-by: Vineet Gupta <vineet.gupta@linux.dev>
> ---

Nice refactoring.

Acked-by: Eduard Zingerman <eddyz87@gmail.com>

...

> diff --git a/kernel/bpf/log.c b/kernel/bpf/log.c
> index 5432c0fc442b..a6f205653a9e 100644
> --- a/kernel/bpf/log.c
> +++ b/kernel/bpf/log.c
> @@ -651,8 +651,8 @@ static void print_reg_state(struct bpf_verifier_env *=
env,
>  		verbose(env, "%s", btf_type_name(reg->btf, reg->btf_id));
>  	verbose(env, "(");
>  	if (reg->id)
> -		verbose_a("id=3D%d", reg->id & ~BPF_ADD_CONST);
> -	if (reg->id & BPF_ADD_CONST)
> +		verbose_a("id=3D%d", reg->id);
> +	if (reg->link_kind)
>  		verbose(env, "%+d", reg->delta);

Nit: it would be nice to see if the link is full or zext.

>  	if (reg->parent_id)
>  		verbose_a("parent_id=3D%d", reg->parent_id);
> diff --git a/kernel/bpf/scev.c b/kernel/bpf/scev.c
> index 48500d73105a..f0aa314233c8 100644
> --- a/kernel/bpf/scev.c
> +++ b/kernel/bpf/scev.c
> @@ -2285,7 +2285,7 @@ static void scratch_widened_reg_id(struct bpf_verif=
ier_env *env, struct bpf_reg_
>  {
>  	switch (base_type(reg->type)) {
>  	case SCALAR_VALUE:
> -		reg->id =3D 0;
> +		bpf_clear_scalar_id(reg);
>  		break;
>  	case PTR_TO_PACKET:
>  	case PTR_TO_PACKET_META:
> diff --git a/kernel/bpf/states.c b/kernel/bpf/states.c
> index 953700822fa7..a1b90a31747a 100644
> --- a/kernel/bpf/states.c
> +++ b/kernel/bpf/states.c

...

> @@ -574,13 +561,14 @@ static bool regsafe(struct bpf_verifier_env *env, s=
truct bpf_reg_state *rold,
>  		 * Linked register tracking uses rold->id to detect relationships.
>  		 * When rold->id =3D=3D 0, the register is independent and any linking
>  		 * in rcur only adds constraints. When rold->id !=3D 0, we must verify
> -		 * id mapping and (for BPF_ADD_CONST) offset consistency.
> +		 * id mapping and that the link kinds agree, along with any delta
> +		 * they carry.
>  		 *
>  		 * +------------------+-----------+------------------+---------------+
> -		 * |                  | rold->id  | rold + ADD_CONST | rold->id =3D=3D=
 0 |
> +		 * |                  | rold->id  | rold linked kind | rold->id =3D=3D=
 0 |
>  		 * |------------------+-----------+------------------+---------------|
>  		 * | rcur->id         | range,ids | false            | range         |
> -		 * | rcur + ADD_CONST | false     | range,ids,off    | range         |
> +		 * | rcur linked kind | false     | range,ids,delta  | range         |
>  		 * | rcur->id =3D=3D 0    | range,ids | false            | range      =
   |
>  		 * +------------------+-----------+------------------+---------------+

Nit: "linked kind" -> "link_kind".
     also, the table should show when link_kind equality is required.

...
