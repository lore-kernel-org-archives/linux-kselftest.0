Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AE964ADD81
	for <linux-kselftest@vger.kernel.org>; Tue,  9 Jun 2026 17:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781024472; cv=none; b=H4WhcX3G0QCWub1xVvq/e2R5rbM21rc2Sitomq9WeQ3WovJNfqCULDJzp/DS5wEYX27Ql6TAftlUqSZGOrFU4/TZf6zf7L5yE//w5oq+px0djRvesIaIB+c4+6xg8stA5S7Q2IXzAgzc/aMwF2yvmGBEqEer7UmvimK9i38cM3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781024472; c=relaxed/simple;
	bh=WDmcAROiZzPtamIVySVJ0+BibdW1AO8nRjbT9ZEyGoI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=D7I+m7x2NGVA9Ae6iB7/b+J99fqLoPG9JPOM8QiHSfA5ECk5GiQ3ovJY/Zo8d6hkD1Eiycu2TKNYS3O+o5borCTEct6VM/djIjWkhyYJ5+zo5/g0HcdbkDboqEtmNJc2pjLFuO45I8jwj7B6aftdhtT1nBuAdDRXLXngGE4CKdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JE1KJOEi; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JE1KJOEi"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3074adb8fcaso10125321eec.0
        for <linux-kselftest@vger.kernel.org>; Tue, 09 Jun 2026 10:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781024470; x=1781629270; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nN5MW2PnNv4yAQd89c4hNRm4nd60DU2qj0yVzLTHfgQ=;
        b=JE1KJOEieOOlKJGRgX8eiMzTvNK+/DFOwma9VrfuMe1zXZ6xoa94jINYcgeBaghl+Z
         xwq38GjAvk3k42bxWycQVSF9XDh6u/Mi0YbE2sDoXWnPgYxcfEeQEAgpGhuxzY9O6oMG
         evJn4b3p6EueErSsuo+fRG4L0HGpY5zSPrl5UnJ+X6hjWkbeX4QoGD/GoYPge+6sD7BU
         jC5I6VGeA0o+PfRWCON9itDnpNUQgXqEH6td4lgMckEkK5v20B4Jq1CUmhJnHE7uX2mh
         v2kzXmE4SNyhDeRH6FN7eutwdAQg9VG13fi//W7rtLFqUh75CXaF0HjdQ9wCycShyZto
         qWqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781024470; x=1781629270;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nN5MW2PnNv4yAQd89c4hNRm4nd60DU2qj0yVzLTHfgQ=;
        b=MHxcBiC70mkkUHXpztbIRG7aV5w2MkDP8RI79sv67b7H5R2lnjWeJDdOe7tjGerYeg
         jfQ+mzX7KebscqHLBje/ZmPwW4kkZWoDQpRnTHUHxPV3uy9wzdkeBZFKD1TtFNoQUgq9
         i2zA4KgENv/fchRDUS60ye8z1Lg1p3rZ6hldZmd7nJ6vx8hOA8AsGlJsl5z788krIOxb
         znisJWdfqn5qC2ztJGWfmEQJtXS5r2fArrTG5yeMIbqzqV5MYoiCVziQFXAz17Ps4SU3
         v8eIBn8saF5SclN0/O5s4Qb+Tdmj+toFtKLgCyTjo6AyeVSfkNNiCVfQcsYawGHd+aV6
         mrgg==
X-Forwarded-Encrypted: i=1; AFNElJ8emx0h7rVMWnU56UbDll/LwZomraODxZeDIltN4sexFTJ3S23sBNocSxL0+rGbQCSTAgl+QxFEgYk6E7wMzSo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1fuQY0n8cDRZsaaH/4OfKxFYIIocjIdqz9Kl4oxhnJHXdnoNq
	j3ZqaSzN0z0gGi+a+SuJDU8pcN6akHxitXpaFDEprbRh14v4ntyOrQg3
X-Gm-Gg: Acq92OED11s+vrzKwVsmaF/OKcABbDlrteSolkPd5MMgzrMsAI6hXR4EhshQBfLxeHP
	vH0mwNKQ/SkIYvuSUVw1iMx+RN1ggwj2cZPXwjbP7/xOKv2gXyiBYka+utHNPOd1V0oDe8LhMKq
	LDD1rsdhNmwvsWkve6XAnn8O/FayC7GORa64OC5VHyHj10FElXZJo2hwFVLOqZ/BxAsEDCJI0uG
	tnINtJUv3dAcKYx5q548/2Nps+tb75MSwmf6op4b+K8ailoeulpJX+/rbvV2qPrCLTxYyPuAIm6
	k8N5Z5vRLDUaP7Z8Uj7tgnlx58G+dW/jZMjq4rPz8Pu16efkdxJ7+gXs/tlJH4Ay8jRyDutyeFj
	SX7oA7UxR15dU0g97n7YEC8D7fK1ur6l7Y6+jIT2+vq05CWTi+TnieIARuUBkjHOmSSKfxB39KF
	ZtYtMGvpAcYW/CGFQuklEShvRyx9PmzaxiBk/G6aM7HYNQeBd21TJxkDkykhkgyFssL4i5Z3iG8
	y6m4aCWC4ry0o91vVY=
X-Received: by 2002:a05:7301:1009:b0:2f2:32bc:787d with SMTP id 5a478bee46e88-3077b1f31f7mr11653007eec.23.1781024469439;
        Tue, 09 Jun 2026 10:01:09 -0700 (PDT)
Received: from ?IPv6:2a03:83e0:115c:1:bc91:a683:c279:a106? ([2620:10d:c090:500::3:1322])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074df191d0sm31809976eec.21.2026.06.09.10.01.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 10:01:09 -0700 (PDT)
Message-ID: <c6cf40ef2957b6b2acf8820bce10becda20d9dfd.camel@gmail.com>
Subject: Re: [PATCH bpf-next 1/2] bpf: Reject scalar addition from untrusted
 memory
From: Eduard Zingerman <eddyz87@gmail.com>
To: Nuoqi Gui <gnq25@mails.tsinghua.edu.cn>, Alexei Starovoitov
 <ast@kernel.org>,  Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko
 <andrii@kernel.org>
Cc: Kumar Kartikeya Dwivedi <memxor@gmail.com>, John Fastabend	
 <john.fastabend@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song
 Liu	 <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa	
 <jolsa@kernel.org>, Shuah Khan <shuah@kernel.org>, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Date: Tue, 09 Jun 2026 10:01:07 -0700
In-Reply-To: <20260609-f01-03-scalar-add-bpf-next-v1-1-e6212e274155@mails.tsinghua.edu.cn>
References: 
	<20260609-f01-03-scalar-add-bpf-next-v1-0-e6212e274155@mails.tsinghua.edu.cn>
	 <20260609-f01-03-scalar-add-bpf-next-v1-1-e6212e274155@mails.tsinghua.edu.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.1 (3.60.1-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2026-06-09 at 22:55 +0800, Nuoqi Gui wrote:
> scalar +=3D rdonly_untrusted_mem reaches adjust_ptr_min_max_vals() with t=
he
> pointer as the source register. The untrusted PTR_TO_MEM case returns the=
re
> without updating the scalar destination, leaving stale verifier state.
>=20
> Reject that addition before the early return. Pointer +=3D scalar remains
> handled by the existing untrusted-memory rule.
>=20
> Fixes: f2362a57aeff ("bpf: allow void* cast using bpf_rdonly_cast()")
> Signed-off-by: Nuoqi Gui <gnq25@mails.tsinghua.edu.cn>
> ---
>  kernel/bpf/verifier.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> index c8d980fdd709..c6b350f9585a 100644
> --- a/kernel/bpf/verifier.c
> +++ b/kernel/bpf/verifier.c
> @@ -14823,6 +14823,14 @@ static int adjust_reg_min_max_vals(struct bpf_ve=
rifier_env *env,
>  				 * This is legal, but we have to reverse our
>  				 * src/dest handling in computing the range
>  				 */
> +				if (opcode =3D=3D BPF_ADD &&
> +				    base_type(src_reg->type) =3D=3D PTR_TO_MEM &&
> +				    (src_reg->type & PTR_UNTRUSTED)) {
> +					verbose(env, "R%d tried to add from %s to scalar\n",
> +						insn->dst_reg,
> +						reg_type_str(env, src_reg->type));
> +					return -EACCES;
> +				}
>  				err =3D mark_chain_precision(env, insn->dst_reg);
>  				if (err)
>  					return err;

Should the fix be like this:

  diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
  index 7d27ba396d32..9c85dd680a46 100644
  --- a/kernel/bpf/verifier.c
  +++ b/kernel/bpf/verifier.c
  @@ -13593,8 +13593,10 @@ static int adjust_ptr_min_max_vals(struct bpf_ve=
rifier_env *env,
           * Accesses to untrusted PTR_TO_MEM are done through probe
           * instructions, hence no need to track offsets.
           */
  -       if (base_type(ptr_reg->type) =3D=3D PTR_TO_MEM && (ptr_reg->type =
& PTR_UNTRUSTED))
  +       if (base_type(ptr_reg->type) =3D=3D PTR_TO_MEM && (ptr_reg->type =
& PTR_UNTRUSTED)) {
  +               *dst_reg =3D *ptr_reg;
                  return 0;
  +       }
  =20
          switch (base_type(ptr_reg->type)) {
          case PTR_TO_CTX:

Instead?
