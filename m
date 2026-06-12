Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E802331F99F
	for <linux-kselftest@vger.kernel.org>; Fri, 12 Jun 2026 13:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781272299; cv=pass; b=sqGs8bJPz5BxwW18tiKLT3Iuc9U4CjoWJxBBxGAIi8iBcphMZ8Sx8aoJnH6gX9OJEb2+mDmyhCjzwdYL/bRypNCm6OGPw4QNgKfaFPnH57Kw1HlV8SNHrgKSswSay2LsN5DKVGzE9G3nJUNvkaywr016m8Jz+Or5sAoq+zt5wy4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781272299; c=relaxed/simple;
	bh=tT4YqoZd40mTDfR7B+ZovVmHGlTP3GckEXJWWqPnoqs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c7jdC7Tq3GMstDEMxhVQ51iPJPvzwxXcY/ANLM5+Wb+caAXPRXAGlw6t9vVERzvVoGORQ80/6WCVfP+mhp3G7MOtGTJYW29wcIZl2Nq6kpDruZmaRmZLEXX+S3zjxH2sNyxeik/frHugPVqAxRM6znRqbyot01ZhSFOjGJcrhyE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eqXyFahB; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ibIu2lwG; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eqXyFahB";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="ibIu2lwG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781272297;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Iy/v7kxpOlqBCTDcC4jlmM2w9KphND71Hvl/We9DfQ4=;
	b=eqXyFahBiG3zpRsbwyYbj9/S646LwWDLO6CvFbwyO9fLgG2XeAcafbqPry0txDiEzWyocc
	S4UTA+YZ0Bm+AolZFFZ5qpdovHbo+FmGnTi19kyGSOnyYySdW5XQckbsOz1bNBtBl5L6q2
	Mg/nlHvk1WQNp4cSTHPAiQUZaKayYT0=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-433-qceMJ-XrOZmeJrKvfCs_EQ-1; Fri, 12 Jun 2026 09:51:35 -0400
X-MC-Unique: qceMJ-XrOZmeJrKvfCs_EQ-1
X-Mimecast-MFC-AGG-ID: qceMJ-XrOZmeJrKvfCs_EQ_1781272295
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-915b6b63056so212030985a.1
        for <linux-kselftest@vger.kernel.org>; Fri, 12 Jun 2026 06:51:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781272295; cv=none;
        d=google.com; s=arc-20240605;
        b=Hfa8MSV0KfhP5t8HOqPABofkhimpVq5CMPFw80e9XVdbfHPeGuPJRTqsWxNzfcY1UA
         qD7UR/pXal9MpOJYX3SapxTHe5TpezOmQQulGaI6ZFDI5lCmn/Coc/AchHsubeRLs3A/
         rDl/tNGJ+HpAFcQ9Hk2hCiFQKKUHxQjmYH6SWof4UvYDLBgU2fT684ArnryxqG0Su0Ln
         gSp1MI9nSv85KAS7+lUXo2+ky4iryOWYWsFQUv4lZ0VtPjEh1pB2YS+dsZkk6y5q+YMZ
         NQ8q7RUZvpf7dR7szoSLnW6WkxcyaOgop0w8+Lgk9urGPKOQluh8Rdykg/SIn1D0KoRB
         NSRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Iy/v7kxpOlqBCTDcC4jlmM2w9KphND71Hvl/We9DfQ4=;
        fh=vqT0xLmGgy5TRRQtt/cvhIw2C0h2XJO3rQmdZBahsj0=;
        b=LZseTjYeCs5sN8RRhrNJs+wsglXDowjrz2PQXWBBM/1J7ag23yc4c2RTezFc10sGqN
         KJiLwqHh1kuVmUOV9ubkkSoDt/M53Yk9F3XSM0yDCxRQZdbWtBhcrONVJKd8rGVIcasg
         MhxaXGGRZp/1pO4yWDJ/siAOKrbRrqkqouWY3rmZJf1fhWBoa6iVMdADYaJkovmenepb
         CemDjjtaONyi1fWHYJ+EO3oPLdUhQfrMVLZtgonv6W3rLC/wdD19SN78GF8KmNRX0jQj
         rKGNEavpeafZcI2vdXFVDpcnP/NTRqwnIdJ9Zvgz9z6tHek+L2Be2IRmhI3mR1TUBqbw
         OYjQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1781272295; x=1781877095; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Iy/v7kxpOlqBCTDcC4jlmM2w9KphND71Hvl/We9DfQ4=;
        b=ibIu2lwGWGi5LJXd6uw6IrKW+nTUsdKRyOeOWPAsqY9rq9JHc9pqUcff16cSolR1vk
         ClWmdurqIH7zKU1tp2RySSbkSM997Zt1Gq4dZGnvTrg9sRjOZQRuVF+gxuH7keIcKfOr
         dkYawBZ1Fi6xstx1YVK2k+9Z2uBqs2SVNnvhudCZUG/LotUcEg0yAf0o9uUVVTAYupWH
         gp8BFJ9c+pu9bZ383xN6otcx1vYBLDV6RL1WCzDSSNHB+GyIE+MkEKjKQIfT7nHuRChH
         Y65UgaKxIxgwJzjqhTCn/DTAeJ7zBwNc8q9n95K7d2Dr2lRpCJkScUXgofmB9lWN2OYL
         8r5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781272295; x=1781877095;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Iy/v7kxpOlqBCTDcC4jlmM2w9KphND71Hvl/We9DfQ4=;
        b=Jx9OKuj7zJy1ytEU/WH8FQ1eMBY+S0UcC4osMDEwVRjlk+9x3e3dNxJpwBNwXTbOTc
         kGjMnTki+Ybod6N+GVR8kJsDk8R5fD4W8/ZRii0RNgm4kTMM2VJOEW+cXcEXCqbIpUDw
         rO5hAseRYAxhPLOSnnDnLLUEQKtSd5+oz3WlYOJqfuVNO0j6NvcEIqK7z+9p1UDoOech
         vryKRMYRr+P/BZIJ4Tu/b1PLikzSEOAXWIZ31QfBQq5hIRU7+tEFroXKQZG6XaMjT8AQ
         XeJ70ymHpjUf23szefEXwWkeTTxGcVWNu1KvcQBlPM65XyhccYxRCHCr+lDYQSiftM8s
         qEGw==
X-Forwarded-Encrypted: i=1; AFNElJ+lZzFHs5droXEpe46vNHR9LvV+P2zr/gqLeAchJEim5gbbvnldQA9aUpts3D90fspIYmRcl0BHFjrt8hcoCak=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbeIph+bEMM4qeBqNaL1MRqmhHk8qfilsMoH8wXAQBSzLcNwRV
	cH46v5qBKBMmO77QEJvAQp06FnbtW2Yw69XR3NqXUJVENazyDYrnO8vOk1+7m0mXhPcOkO1hIgG
	LKh0R+7nuERl47z5l5vxHk/D6n+j+Zg0aWdwiHQvVVAhBvPhSkZUeJ3oa0isUwWQFplcubgkARC
	D/pB6HZxTg+2phwKYRby51pyM6fe+9bcD2M0psfNwvVQp8
X-Gm-Gg: Acq92OFpAV8UJ0BbocKz3X43tbmJyLfDvmaNsypj0ACUVbNiYaqR999+dbscJboJV1x
	GLTYKm/W/9QcCe5ShLPD7cCMgvj+0OWlpW2Loi6nXH8ZKHZnYHLo5I0g6JaR7HdQB0bjLq4LPyi
	AhPi248kIMXm3Mymim25QQGyIHTuDW3r+CwcReuqjPV+/QRJV9i/gOxTuWBNmsaI2CKBLCeKGr3
	r7yOfFqDWv8kHpM3ROY6Wk9N0GQsU5jmG8K9g==
X-Received: by 2002:a05:620a:4149:b0:915:d5cd:8cce with SMTP id af79cd13be357-9161bc02c6bmr425212685a.22.1781272295112;
        Fri, 12 Jun 2026 06:51:35 -0700 (PDT)
X-Received: by 2002:a05:620a:4149:b0:915:d5cd:8cce with SMTP id
 af79cd13be357-9161bc02c6bmr425204785a.22.1781272294560; Fri, 12 Jun 2026
 06:51:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260611-rva23u64-hwprobe-v2-v4-0-3f01a2449488@gmail.com> <20260611-rva23u64-hwprobe-v2-v4-5-3f01a2449488@gmail.com>
In-Reply-To: <20260611-rva23u64-hwprobe-v2-v4-5-3f01a2449488@gmail.com>
From: Jesse Taube <jtaubepe@redhat.com>
Date: Fri, 12 Jun 2026 09:51:22 -0400
X-Gm-Features: AVVi8Cei37Nc7wEh-QPxeO4jIlCv0ZbORPC259y2xDJU0379i8L_rI91Rp2DJbE
Message-ID: <CADRr4bd10AYwAZwHxEiuSJEOwD5qv68L1r5DRjxXFM8pmrG+WA@mail.gmail.com>
Subject: Re: [PATCH v4 05/16] riscv: Add Zicclsm to cpufeature and hwprobe
To: Guodong Xu <docular.xu@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Zong Li <zong.li@sifive.com>, Deepak Gupta <debug@rivosinc.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Yixun Lan <dlan@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@gmail.com>, linux-doc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	Paul Walmsley <paul.walmsley@sifive.com>, Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org, 
	spacemit@lists.linux.dev, sophgo@lists.linux.dev, 
	linux-kselftest@vger.kernel.org, Palmer Dabbelt <palmer@sifive.com>, 
	Jesse Taube <jesse@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, 
	Charlie Jenkins <charlie@rivosinc.com>, Andrew Jones <andrew.jones@oss.qualcomm.com>, 
	Andy Chiu <andybnac@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 11, 2026 at 4:14=E2=80=AFPM Guodong Xu <docular.xu@gmail.com> w=
rote:
>
> From: Jesse Taube <jesse@rivosinc.com>
>
> Zicclsm requires misaligned support for all regular load and store
> instructions, both scalar and vector, but not AMOs or other
> specialized forms of memory access, to main memory regions with both
> the cacheability and coherence PMAs, as defined in the profiles spec.
> Even though mandated, misaligned loads and stores might execute
> extremely slowly. Standard software distributions should assume their
> existence only for correctness, not for performance.
>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Andy Chiu <andy.chiu@sifive.com>
> Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
> Tested-by: Charlie Jenkins <charlie@rivosinc.com>
> Signed-off-by: Jesse Taube <jesse@rivosinc.com>

Thanks for the update! Just an fyi email has changed to
jtaubepe@redhat.com though.
No need to change the signoff though.

Thanks,
Jesse Taube

> [Rebased, rewrote doc text, minor commit message revisions]
> Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
> Signed-off-by: Guodong Xu <docular.xu@gmail.com>
>
> ---
> v4: No change.
> v3:
> - Move the hwprobe.rst entry to the IMA_EXT_1 section so its
>   documentation matches the IMA_EXT_1 bit it was allocated in v2
>   (Sashiko, agreed by Andrew).
> v2:
> - Rebased onto v7.1-rc2; moved ZICCLSM to IMA_EXT_1 and
>   allocated a new bit for it
> ---
>  Documentation/arch/riscv/hwprobe.rst  | 4 ++++
>  arch/riscv/include/asm/hwcap.h        | 1 +
>  arch/riscv/include/uapi/asm/hwprobe.h | 1 +
>  arch/riscv/kernel/cpufeature.c        | 1 +
>  arch/riscv/kernel/sys_hwprobe.c       | 1 +
>  5 files changed, 8 insertions(+)
>
> diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/ri=
scv/hwprobe.rst
> index d9928641deb99..49d9fb68632d0 100644
> --- a/Documentation/arch/riscv/hwprobe.rst
> +++ b/Documentation/arch/riscv/hwprobe.rst
> @@ -401,3 +401,7 @@ The following keys are defined:
>      as defined in version 1.0 of the RISC-V Control-flow Integrity (CFI)
>      extensions specification, ratified in commit 302a2d45c243
>      ("Update build-pdf.yml") of riscv-cfi.
> +
> +  * :c:macro:`RISCV_HWPROBE_EXT_ZICCLSM`: The Zicclsm extension is suppo=
rted,
> +    as defined in the RISC-V Profiles specification starting from commit
> +    b1d80660 ("Updated to ratified state.")
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwca=
p.h
> index 44bf8c7d8acc5..e8f4a7dd96a93 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -112,6 +112,7 @@
>  #define RISCV_ISA_EXT_ZCLSD            103
>  #define RISCV_ISA_EXT_ZICFILP          104
>  #define RISCV_ISA_EXT_ZICFISS          105
> +#define RISCV_ISA_EXT_ZICCLSM          106
>
>  #define RISCV_ISA_EXT_XLINUXENVCFG     127
>
> diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/u=
api/asm/hwprobe.h
> index 9139edba0aecb..6819df159c51e 100644
> --- a/arch/riscv/include/uapi/asm/hwprobe.h
> +++ b/arch/riscv/include/uapi/asm/hwprobe.h
> @@ -116,6 +116,7 @@ struct riscv_hwprobe {
>  #define RISCV_HWPROBE_KEY_ZICBOP_BLOCK_SIZE    15
>  #define RISCV_HWPROBE_KEY_IMA_EXT_1            16
>  #define                RISCV_HWPROBE_EXT_ZICFISS       (1ULL << 0)
> +#define                RISCV_HWPROBE_EXT_ZICCLSM       (1ULL << 1)
>
>  /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
>
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeatur=
e.c
> index 686dde3ce3b98..1fb595581adcf 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -502,6 +502,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] =3D {
>         __RISCV_ISA_EXT_SUPERSET_VALIDATE(zicbom, RISCV_ISA_EXT_ZICBOM, r=
iscv_xlinuxenvcfg_exts, riscv_ext_zicbom_validate),
>         __RISCV_ISA_EXT_DATA_VALIDATE(zicbop, RISCV_ISA_EXT_ZICBOP, riscv=
_ext_zicbop_validate),
>         __RISCV_ISA_EXT_SUPERSET_VALIDATE(zicboz, RISCV_ISA_EXT_ZICBOZ, r=
iscv_xlinuxenvcfg_exts, riscv_ext_zicboz_validate),
> +       __RISCV_ISA_EXT_DATA(zicclsm, RISCV_ISA_EXT_ZICCLSM),
>         __RISCV_ISA_EXT_DATA(ziccrse, RISCV_ISA_EXT_ZICCRSE),
>         __RISCV_ISA_EXT_SUPERSET_VALIDATE(zicfilp, RISCV_ISA_EXT_ZICFILP,=
 riscv_xlinuxenvcfg_exts,
>                                           riscv_cfilp_validate),
> diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwpr=
obe.c
> index f8f68ba781b45..9cf62266f1890 100644
> --- a/arch/riscv/kernel/sys_hwprobe.c
> +++ b/arch/riscv/kernel/sys_hwprobe.c
> @@ -205,6 +205,7 @@ static void hwprobe_isa_ext1(struct riscv_hwprobe *pa=
ir,
>                  * in the hart_isa bitmap, are made.
>                  */
>                 EXT_KEY(isainfo->isa, ZICFISS, pair->value, missing);
> +               EXT_KEY(isainfo->isa, ZICCLSM, pair->value, missing);
>         }
>
>         /* Now turn off reporting features if any CPU is missing it. */
>
> --
> 2.43.0
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
>

