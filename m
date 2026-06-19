Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A991140D594
	for <linux-kselftest@vger.kernel.org>; Fri, 19 Jun 2026 20:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781899529; cv=none; b=OftWzxwYecTPHM1707MtnK4xtQLrpNiY6ZpucNWbptwbLc6AV5gnlPmiyO8XZoZH574b43cCZgE11wLmrGz0zpOBmucKx1y2eHvViiMBT1Y2E8AIGQokqhxZc3y/CmdUys4ggJz9uYictEwVmvjF5UCrmSDBvjktEfrBwqot6bE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781899529; c=relaxed/simple;
	bh=0T4Z7K/rb2nHa13lr/ex8NbDdCu91yZhRTr7Sid9GFM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=izSr8XW09isixAfbsbdNSoBC3zUGXJS8Bg1hZaLxVrSiDBD+WrKiI6u3Jjrct5YPe1U1AUCBCVPoIjgwB0Yhsu1LSU68Podh+i5XriUxdHnfcGnB76HfE1sDhDruXp6ojBsEtJK8qiwWZZUy/H2mjQXHKWotYXnwAo4HUWxMqjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O4On/ejR; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O4On/ejR"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2bf1cda2b17so14989835ad.1
        for <linux-kselftest@vger.kernel.org>; Fri, 19 Jun 2026 13:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781899527; x=1782504327; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zH4OXFXG3GUtu3xSOVczzw0mmgwnoj/HVff9AySNWfk=;
        b=O4On/ejRCxff79FXdpvy8qxPlHq67Q/v64j/KfEDq7ma+IR6aJSodNYEVpXxJp2z8/
         ZJTJCwJVzTAdv5HoCCVkTbdCDSw7XW6ukrd9rMm6sobdxTsmqHVQatZUPxqfqX9oZfXc
         BSAPxyFGSXe4dz+9iU8TaUHSc2kPL/zmoQEkHosdwXWgLxzXuo0SVxWGRFuCtDUeGazO
         WZQVrQska7zYxBkUBQXIDc+LIoa7A3sYc/YZ5o+SCcwKog58/5E2hQPhY5+19gplz+LU
         ORCQLy2MhqBUe/ZWEp84T2+tfj3WXGjBkNYhLPT4frlf7DL17UrAFLlh7F9JieHdfAKf
         JF8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781899527; x=1782504327;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zH4OXFXG3GUtu3xSOVczzw0mmgwnoj/HVff9AySNWfk=;
        b=G4fXIFGLgB2P2U1e7DgazQ4KaFdfvqGKeU1ACTd7uCIZy5yjT9s8ihqvMXIww+rkgu
         z24cDio1hm22ZNBDgh6dg23PzlI9PMPqnJguF83nI6t/dVa4UuXNnQLtQRYsl1Jf7DHB
         6ZKfdqcNlcJV03pkNap1vofWEo5glPCn+fqfOJeWuuAqqZUGFtS1poS24hlp9CRqzZyj
         OGxYglaEJWTwXUEMuL7qIxQXAlpTpxJp19roXQoWQHKfISlE1dzIPEGf8HtkbLEh9UHD
         JNq4G0oNu5IczEUOXdvbcYHz+8pI34Z4XSDVL9OD7gQaZ6ZJu+CZG7n4QJpgwaZcELuP
         BZkA==
X-Forwarded-Encrypted: i=1; AFNElJ/gh0Zt9Gbw4RMDa1dywtpPpxO846d9GVzXOEhv3ZtYxMls8PxqAPE5y3FWq16B9qWIkqs/kO30fhDBVhLMpEE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVaxvr3RBzxCyI3kdLXeAflhvAxlasIIFDOFa2dKcUMs741jIS
	tDTzIMIB77/QRDJcx6za9qHInedOsKjFyrIbEQmTkKG4D+Mc3pAXEXWq
X-Gm-Gg: AfdE7cnnl5MMWkGaW9m0Ykm9A8JmHIY5AT/92mp0UQRZVZPNfCpoCwvVIJKns6gQLHD
	G/9q6B1RZII58UO800EwdwyXoiacNJEYW2ZUnXRSIVLRTVKWCg1gEUdqCzYlKXpxO+WZ38LfZNO
	9OmLEubWoLuY+BglOcFn+Y8CLcU2b0Z9BDU+dQYAbcxiLbvVtTCdvrv3ZFYuj/S3YKjyWDkf9m6
	43B5xRcFBNldaT1j8iHhWhLoL1Fl68upeYJmTbsqPli3KD2nK9bu57KoIIOCPVfn8WZgNpGSgps
	15kvP7YGRgAQvwnoVW5qSdJfJfJLZhsxqCziI3JIra2QZBM4O6SSlZc+64JKfTHDzjyuZEESu/4
	SEYXPqGXS+OvNMdHBN+X9dObqj0LFHCZp1TjBzZ2g/gMMBRkVTMFQ3Ayqx2oFA/PmAIErfz9Alx
	X+VHOa5b+24eiJU5n7DiyUWvqjEvI0i6n6aMxLdAL8Aw==
X-Received: by 2002:a17:902:c401:b0:2bc:ac76:c1d0 with SMTP id d9443c01a7336-2c719626ed0mr40699335ad.17.1781899526920;
        Fri, 19 Jun 2026 13:05:26 -0700 (PDT)
Received: from [192.168.0.226] ([38.34.87.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7439f8d1dsm2592035ad.51.2026.06.19.13.05.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 13:05:25 -0700 (PDT)
Message-ID: <a15079723c8834a2baf3f35c6a8ed52c63addeb9.camel@gmail.com>
Subject: Re: [PATCH bpf-next 1/2] bpf: Require CAP_BPF for pseudo-BTF ksym
 loads
From: Eduard Zingerman <eddyz87@gmail.com>
To: Nuoqi Gui <gnq25@mails.tsinghua.edu.cn>, Alexei Starovoitov
 <ast@kernel.org>,  Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko
 <andrii@kernel.org>, Kumar Kartikeya Dwivedi	 <memxor@gmail.com>, Song Liu
 <song@kernel.org>, Yonghong Song	 <yonghong.song@linux.dev>, Jiri Olsa
 <jolsa@kernel.org>, Emil Tsalapatis	 <emil@etsalapatis.com>, Hao Luo
 <haoluo@google.com>
Cc: John Fastabend <john.fastabend@gmail.com>, Martin KaFai Lau	
 <martin.lau@linux.dev>, Shuah Khan <shuah@kernel.org>, bpf@vger.kernel.org,
 	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Fri, 19 Jun 2026 13:05:22 -0700
In-Reply-To: <20260620-f01-13-pseudo-btf-id-cap-bpf-v1-1-f950f69fe60c@mails.tsinghua.edu.cn>
References: 
	<20260620-f01-13-pseudo-btf-id-cap-bpf-v1-0-f950f69fe60c@mails.tsinghua.edu.cn>
	 <20260620-f01-13-pseudo-btf-id-cap-bpf-v1-1-f950f69fe60c@mails.tsinghua.edu.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.1 (3.60.1-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sat, 2026-06-20 at 00:04 +0800, Nuoqi Gui wrote:
> BPF_PSEUDO_BTF_ID is resolved before the main verifier pass. The resolver
> looks up the referenced kernel symbol through kallsyms and rewrites the
> ldimm64 immediate to the concrete address that later becomes verifier
> state.
>=20
> Require CAP_BPF before doing that materialization. This keeps typed ksym
> address resolution on the privileged side and prevents loaders without
> CAP_BPF from receiving a verifier log that contains the resolved address.
>=20
> Fixes: 4976b718c3551 ("bpf: Introduce pseudo_btf_id")
> Signed-off-by: Nuoqi Gui <gnq25@mails.tsinghua.edu.cn>
> ---
>  kernel/bpf/verifier.c | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> index ed7ba0e6a9ce..dbf5df995fc2 100644
> --- a/kernel/bpf/verifier.c
> +++ b/kernel/bpf/verifier.c
> @@ -17639,6 +17639,11 @@ static int check_pseudo_btf_id(struct bpf_verifi=
er_env *env,
>  	int btf_fd;
>  	int err;
> =20
> +	if (!env->bpf_capable) {
> +		verbose(env, "BPF_PSEUDO_BTF_ID loads require CAP_BPF\n");
> +		return -EACCES;
> +	}
> +

Thank you for identifying this issue.
I think the correct way to fix it is to extend the `is_ptr && !allow_ptr_le=
aks`
logic in kernel/bpf/disasm.c:print_bpf_insn().
Note that it seems there are additional cases that are not covered,
something like below seem warranted:


  bool is_ptr =3D insn->src_reg =3D=3D BPF_PSEUDO_MAP_FD    ||
                insn->src_reg =3D=3D BPF_PSEUDO_MAP_VALUE  ||
                insn->src_reg =3D=3D BPF_PSEUDO_MAP_IDX    ||
                insn->src_reg =3D=3D BPF_PSEUDO_MAP_IDX_VALUE ||
                insn->src_reg =3D=3D BPF_PSEUDO_BTF_ID;

Could you please double check?

>  	btf_fd =3D insn[1].imm;
>  	if (btf_fd) {
>  		btf =3D btf_get_by_fd(btf_fd);
