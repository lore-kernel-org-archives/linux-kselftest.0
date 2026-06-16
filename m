Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 674933A6EF0
	for <linux-kselftest@vger.kernel.org>; Tue, 16 Jun 2026 21:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781644456; cv=none; b=OWw7PsSzmOnT09Srv6Rvx7/Dph5qQJFYZ6xlHZm/z7RkNeIcmzcbKZ04MKat6a5HgiP+3V4oYSO8pvump8TdoCfVJ6O7ILm0ld3s8aWhhGWvjKH62VrGSIO/Vllv/UjcRejoAzka6xOBDW44nKrTwevO5LMY6zSOgGQQl/OkCEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781644456; c=relaxed/simple;
	bh=szkiZMk/51Dn59gZAVp5UYnh69ioTUYKzeBduM21+TE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Z8DMHSrQluRVb7Pf4xsQ5bWmkw1nwHEJnUAmRaG1Jv0STVdqWqAOjEQUiaEgsVDOMPkV5cFN07IBtVG+XRA8i6doOVPNdYRQIG9Q927IUvSm9w7/TY3tbodFzXMV2rAo6RXKH8y1spRXJuCkomvDtNndp6XvobVa1c2mAfu/Y8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com; spf=pass smtp.mailfrom=etsalapatis.com; dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b=cDwbFFKw; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b="cDwbFFKw"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-306f36df4feso270850eec.0
        for <linux-kselftest@vger.kernel.org>; Tue, 16 Jun 2026 14:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=etsalapatis-com.20251104.gappssmtp.com; s=20251104; t=1781644454; x=1782249254; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c17Bx16QV5sl8RyBSVDSL07SiEznBKCXYOLNi/brxf0=;
        b=cDwbFFKwrjJ6W8DRY9p4ZjGLLs4DNKM3pNds5OQtraLBRe+6Si/wSi6OH619YeFXZy
         N3y5UPPtnQkle4bf9tDz2JTaYjg3xWJaZUmnwKxqfihygUxIeFGy/tqTYiB5COkQ9joT
         zlb0iZDWnZssuj0RueVn85LXSWxXLiXwWjtOKzL90uTf/JOhz5uWCRaKCPbvdg1Jz0EP
         3gwcoNsXy1MWz2pQuyqyV4NfNokLmHv58nguN5KLLLeqXSHsndYaVoz0O9zdHhngfFx4
         WyPDApyBzvA31cfxsHf/eTXwocksxYxYxzjZKIWAIizl5eTJ7j0m4Q9uEeGi2VX6idCV
         7N3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781644454; x=1782249254;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c17Bx16QV5sl8RyBSVDSL07SiEznBKCXYOLNi/brxf0=;
        b=PFMfT/55OfkzN6CuhSgXP1gLLuKbl+h8YFckGMGCHmAdFnNTVh90lhkEywEdZ8ADFM
         TaakqoWyEsU2CV6ton7CK80jv4QL1UZP5YUvBFS7+vwF7ha5c9PYj+pV2ReQWh8oy0NJ
         PHWh4tGGQZznWDSxUDDS/bewn0U70slGeDhfcVrZlJP4tyqhyUibvdLnYphFXRmFeL8U
         8zZosZ1Ss476TVje2R+rriPhB4LGXCTWfY8qiJBxgct+ZnSSJb9HiBMee9V7xX0HyiRo
         gZjP+T7bK+K9slzjZo+UTysmoYq9MniJI/26iiqhyf7LENIwX5SLGslly/PzQ7sCbIdG
         JMPg==
X-Forwarded-Encrypted: i=1; AFNElJ+Px5mKpdbv6qX7KFTcMjaUj/7HpVEP9kzO35beL77zVaTzsfs5haaEc2is3GD8y7mtKZgu9y/L6NHqkE5l1I4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLQRC8zGknO4FhVseD/ZwGTxr/8CS/46LgbDiAoepWLAv0srM/
	rRPQ1oG9vph+jAULdEHI0hMHjGa1M17B7/O7YfbInJdtd25k2QSY4mWhibjh+upGsRU=
X-Gm-Gg: AfdE7cnyvzvL0v8MI90d87X1Afk98xp7nQ2IbP4M3i2++AEkUw8ByV1Wwe1EFUuClCv
	4QvliPAu5WseqHacQj/v8pA7T4sx99qr648sIvDi0PAmZVYEhK4s82P5Ko7agols5qKcSdvdhKo
	Y2H9jIeJGnWrqgUVVuTrFz5QHQRlCj+rAPdmHeMr/hkEBOAlk0QCZ/b6XD/Vz5dZH4THuYitFBP
	20XWICXUqO2R73EKNbTjGLVSdxixkPBId5wKM+M6hYzcXKhj1O4Fo8Em9XJ3oMyiuPKMyg368ZA
	4GDLmAvzQKcR7RpaxZt3iK85Xg+TE3o3zvJ32EU+lrKK7TRrxZ0JiWSMnC1N+x9aacuoAYxpLns
	JT2T9+ZI/aZP3SxOWsdYfpqsBb/d+Q3bn+TCuktJgBp8MADsQp0uh+d/ufR0Y2xU2x4wbfb1EKE
	+u/uuv
X-Received: by 2002:a05:7300:1912:b0:30b:b4b5:4979 with SMTP id 5a478bee46e88-30bcf50dac8mr197992eec.12.1781644454518;
        Tue, 16 Jun 2026 14:14:14 -0700 (PDT)
Received: from localhost ([2620:10d:c090:600::1a8e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081eb95450sm25214840eec.28.2026.06.16.14.14.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 14:14:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 16 Jun 2026 17:14:12 -0400
Message-Id: <DJAS8Y6NFDM3.2UBTXDT6CKACA@etsalapatis.com>
Cc: "John Fastabend" <john.fastabend@gmail.com>, "Martin KaFai Lau"
 <martin.lau@linux.dev>, "Luis Gerhorst" <luis.gerhorst@fau.de>, "Shuah
 Khan" <shuah@kernel.org>, <bpf@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH bpf 2/2] selftests/bpf: Cover stack nospec slot indexing
From: "Emil Tsalapatis" <emil@etsalapatis.com>
To: "Nuoqi Gui" <gnq25@mails.tsinghua.edu.cn>, "Alexei Starovoitov"
 <ast@kernel.org>, "Daniel Borkmann" <daniel@iogearbox.net>, "Andrii
 Nakryiko" <andrii@kernel.org>, "Eduard Zingerman" <eddyz87@gmail.com>,
 "Kumar Kartikeya Dwivedi" <memxor@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260617-f01-11-stack-nospec-slot-index-v1-0-e3a080b0cd7e@mails.tsinghua.edu.cn> <20260617-f01-11-stack-nospec-slot-index-v1-2-e3a080b0cd7e@mails.tsinghua.edu.cn>
In-Reply-To: <20260617-f01-11-stack-nospec-slot-index-v1-2-e3a080b0cd7e@mails.tsinghua.edu.cn>

On Tue Jun 16, 2026 at 12:57 PM EDT, Nuoqi Gui wrote:
> Add a verifier test for the fixed-offset stack write case where two 4-byt=
e
> stores initialize opposite halves of the same stack slot.
>
> The test uses the CAP_BPF-without-CAP_PERFMON loader lane so Spectre v4
> mitigation remains active. It expects both half-slot writes to emit nospe=
c
> in the translated program.
>
> Signed-off-by: Nuoqi Gui <gnq25@mails.tsinghua.edu.cn>

Reviewed-by: Emil Tsalapatis <emil@etsalapatis.com>

Trivial style nits.

> ---
>  .../testing/selftests/bpf/progs/verifier_unpriv.c  | 23 ++++++++++++++++=
++++++
>  1 file changed, 23 insertions(+)
>
> diff --git a/tools/testing/selftests/bpf/progs/verifier_unpriv.c b/tools/=
testing/selftests/bpf/progs/verifier_unpriv.c
> index c16f8382cf17d..9ebbd4b531df1 100644
> --- a/tools/testing/selftests/bpf/progs/verifier_unpriv.c
> +++ b/tools/testing/selftests/bpf/progs/verifier_unpriv.c
> @@ -976,4 +976,27 @@ l0_%=3D:	exit;						\
>  	: __clobber_all);
>  }
> =20
> +SEC("socket")
> +__description("noperfmon: Spectre v4 stack write slot index")
> +__success __success_unpriv
> +__caps_unpriv(CAP_BPF)
> +__retval(0)
> +#ifdef SPEC_V4
> +__xlated_unpriv("r0 =3D 0")
> +__xlated_unpriv("*(u32 *)(r10 -4) =3D r0")
> +__xlated_unpriv("nospec")
> +__xlated_unpriv("*(u32 *)(r10 -8) =3D r0")

No whitespace to the right of -

> +__xlated_unpriv("nospec")
> +__xlated_unpriv("exit")
> +#endif
> +__naked void stack_write_nospec_slot_index(void)
> +{
> +	asm volatile ("					\
> +	r0 =3D 0;						\
> +	*(u32 *)(r10 - 4) =3D r0;			\
> +	*(u32 *)(r10 - 8) =3D r0;			\

Unaligned \=20

> +	exit;						\
> +"	::: __clobber_all);
> +}
> +
>  char _license[] SEC("license") =3D "GPL";

