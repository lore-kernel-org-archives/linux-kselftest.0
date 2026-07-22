Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43842241695
	for <linux-kselftest@vger.kernel.org>; Wed, 22 Jul 2026 00:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784679139; cv=none; b=kuktTUVSehBU8yG5bIjxJ+HSVtcbRzLY+/o5D7kv15QfG9wdCJGZ5/tiWH80v8Qf5bqKAcs/4L4BIod4JrWoy1H7VI2VY1joRSXajfJkP5GcFtlLcrPIjN7bZYR0aRVvatEbQ+2OWfzWdiVZMGX/XXLGminMYAO7pEKLigRmh6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784679139; c=relaxed/simple;
	bh=INJwYTrSQ3WAovcuijCA3YELaIRjXjzM8P0z1g5h5Ag=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=g5IuWkuOUNcEmDAsY81y02iR6kQwvnBXWGbCY58GNsJe4exOTYQp1RKqMbdv+0CNijwZ4dFw4q5QXYdbTW0wari1yu2JQ6cIQE2vzGuhB7QV5jqK099fuwoEDKhn/qmSeH+m6xwUXB8b0ChyESXJVUrUPC1Yfzafo9KU5Xzq4Q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ToV//2k3; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ToV//2k3"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c9e30214d8fso8529782a12.3
        for <linux-kselftest@vger.kernel.org>; Tue, 21 Jul 2026 17:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784679137; x=1785283937; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=cWKpfdDZ5rwahGdKmtliUWjX0cNTR5TraqAEREqnMtI=;
        b=ToV//2k3xpy9GDnRpv5mpAzagZ8Y9EAsbyNTwifQW1bDq2xHUmURlHh/ebdqo1AVQE
         N/KDBsEYSiuCFOqVfwhuQO529qBgnZgPsB4hKovZg0ZPkrfe8iJYXddQSnCTsPYFtqA2
         WJGrKHH8CDrUYV3vnVEqyaFtFA+FEoPX7y3jWC5NddglaiNwNrxNPX6DqTZnb//HeI9Y
         CJahrxx/o6A97hKnUC6q3rEMkc221q2BuswM5HzVaYu9nXMlhe1B2eTztJFy7wiI4x5y
         FFBkflxifoty2gZLQot5UGdIC9K9tvUpkWvcqbji3yCr23NKGCF6q7+jj+4G3ZPIkIlG
         ByTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784679137; x=1785283937;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cWKpfdDZ5rwahGdKmtliUWjX0cNTR5TraqAEREqnMtI=;
        b=T57eOicDRiqavlyKycLjRyROJEKRVNF2JHO73FaqP2z4LXmBC7k2hXsqJFhADWMOe0
         tR8lgwDlG/SIyzJFIt53YhCUYAaznvfaw2k9oDnDpIF8ShACHeH9bETk878fAAOpJanD
         qZErk08LzFfrQVigQRn6I3Q5vPGAU+a7UV/KH8kGLYDFbKqzpCaoJoK7YndFS3kf5W3l
         clWMqS+v52KvXqXeN3cJF0jmNv90hqa82/iudmF12LZm7mXDT1eKBQn1DvMNeJmaxN1l
         5bVy6SwQw78k9tU6j76AYqizbzoX+85LfabX2qdP2aaLBh07y+4AZF+9PUgHO/FBKGhN
         qblg==
X-Forwarded-Encrypted: i=1; AHgh+Ro1kfiZLFRR7hzTU1RIDKjaLW6bYOZ57G5p395U1YbIrrSrUNZQuqDxC2ISrBu5fuXJQ56o297xN9aAhhwnTQg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/5OW2qIH61Yt5e5lZkvO4PDL55SF0ZO6Xhy01YMuvZE5apuh/
	UajXXjy+xKaWWuzKYrXvQw6nsdUhJa/1N1S13Rh/K22ANHRNvoUOFnaT
X-Gm-Gg: AR+sD10G4YUKaKqT2tKafU4g2UfynUjbcFRKmPK5tE2IvQG18Basppg7uIffIr9Vout
	oNkYfirUMF71gQ9axpywBDRZr9zBieo44wvGh+ajeGR7coOxrG/d2VG3LJxk1O4CISIwg31fvxS
	rcKPE4JoaQGghyrVI6CnUb3JQJ2awHuCSYpjsYdN+MJtX1H4Bwq/9eBhmKJiEsXfaa0shQJS8i1
	Iz6uKc61Ae+JgPrGdDgNhiYZRyQQbefw5l4b3Zhe6HHsvc3fJ/vQxnyzQkLaw3Ue0QcpqdgPIcA
	Pj4zwTPaWOAxurAHVZuEI2qnXjGsSMdDCJBd0StwN2O/kw/lGYzM9AtSQIJxE283/hlEcGZN60d
	2u4TEWblrqaGdp5hKlcZg4kCiKpaclx06WnmNEyBl+cnAeZjQx9yCF9Ec63NE2o7RhjSjWlMncU
	HNizMy1uGr5/UE9/yqqUmsF9NN9fYSWjrgzWb14BuyZz3GKGhl8VL5eIr5
X-Received: by 2002:a05:6a20:734d:b0:3c3:69d0:c573 with SMTP id adf61e73a8af0-3c3adaae79amr21522093637.68.1784679137427;
        Tue, 21 Jul 2026 17:12:17 -0700 (PDT)
Received: from ?IPv6:2a03:83e0:115c:1:cda2:e912:7f2e:f787? ([2620:10d:c090:500::7827])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147df06864sm2786421eec.15.2026.07.21.17.12.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 17:12:16 -0700 (PDT)
Message-ID: <976ae2fbf6f2ead76622e39813bfda6a6981d382.camel@gmail.com>
Subject: Re: [PATCH 1/2] bpf: Preserve stack frame number for commuted
 arithmetic
From: Eduard Zingerman <eddyz87@gmail.com>
To: Yiyang Chen <chenyy23@mails.tsinghua.edu.cn>, Alexei Starovoitov
	 <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko
	 <andrii@kernel.org>, Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: John Fastabend <john.fastabend@gmail.com>, Martin KaFai Lau	
 <martin.lau@linux.dev>, Song Liu <song@kernel.org>, Yonghong Song	
 <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, Shuah Khan	
 <shuah@kernel.org>, Emil Tsalapatis <emil@etsalapatis.com>,
 bpf@vger.kernel.org, 	linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Tue, 21 Jul 2026 17:12:14 -0700
In-Reply-To: <a092a059781aad37b8d8ce3bb927052de5f73431.1784563950.git.chenyy23@mails.tsinghua.edu.cn>
References: <cover.1784563950.git.chenyy23@mails.tsinghua.edu.cn>
	 <a092a059781aad37b8d8ce3bb927052de5f73431.1784563950.git.chenyy23@mails.tsinghua.edu.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.1 (3.60.1-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2026-07-21 at 09:39 +0000, Yiyang Chen wrote:
> When scalar +=3D pointer is handled in adjust_ptr_min_max_vals(), the
> destination register has to inherit the pointer register state from the
> source pointer. Copying only selected fields is fragile because pointer
> provenance is tracked by several bpf_reg_state fields.
>=20
> For the commuted form, pass a temporary scalar offset register to the
> common pointer arithmetic helper and copy the full pointer state before
> applying pointer arithmetic. This preserves the frame number for
> PTR_TO_STACK registers and keeps parent identity fields consistent.
>=20
> Fixes: f1174f77b50c ("bpf/verifier: rework value tracking")
> Signed-off-by: Yiyang Chen <chenyy23@mails.tsinghua.edu.cn>
> ---
>  kernel/bpf/verifier.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
>=20
> diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> index 52be0a118cce0..3c0af83db4672 100644
> --- a/kernel/bpf/verifier.c
> +++ b/kernel/bpf/verifier.c
> @@ -13796,11 +13796,12 @@ static int adjust_ptr_min_max_vals(struct bpf_v=
erifier_env *env,
>  		return -EACCES;
>  	}
> =20
> -	/* In case of 'scalar +=3D pointer', dst_reg inherits pointer type and =
id.
> -	 * The id may be overwritten later if we create a new variable offset.
> +	/* For 'scalar +=3D pointer', dst_reg inherits the complete pointer
> +	 * register state. Individual fields may be adjusted later by pointer
> +	 * arithmetic.
>  	 */
> -	dst_reg->type =3D ptr_reg->type;
> -	dst_reg->id =3D ptr_reg->id;
> +	if (ptr_reg !=3D dst_reg)
> +		*dst_reg =3D *ptr_reg;


Lot's of tests are failing on the CI, please investigate.

> =20
>  	if (!check_reg_sane_offset_scalar(env, off_reg, ptr_reg->type) ||
>  	    !check_reg_sane_offset_ptr(env, ptr_reg, ptr_reg->type))
> @@ -14854,15 +14855,18 @@ static int adjust_reg_min_max_vals(struct bpf_v=
erifier_env *env,
>  					bpf_alu_string[opcode >> 4]);
>  				return -EACCES;
>  			} else {
> +				struct bpf_reg_state off_reg;
> +

We store such temporaries in the bpf_verifier_env to avoid excessive
stack consumption.

>  				/* scalar +=3D pointer
>  				 * This is legal, but we have to reverse our
>  				 * src/dest handling in computing the range
>  				 */
> +				off_reg =3D *dst_reg;
>  				err =3D mark_chain_precision(env, insn->dst_reg);
>  				if (err)
>  					return err;
>  				return adjust_ptr_min_max_vals(env, insn,
> -							       src_reg, dst_reg);
> +							       src_reg, &off_reg);
>  			}
>  		} else if (ptr_reg) {
>  			/* pointer +=3D scalar */
>=20
> base-commit: 0bcca2a42cc50b7d64a95c08dffc6b93661a7ea2
