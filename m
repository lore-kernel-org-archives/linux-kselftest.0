Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3340848383D
	for <linux-kselftest@vger.kernel.org>; Wed, 29 Jul 2026 12:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785329410; cv=pass; b=lCJaQrtLhDUa08hlGhzSt5jhD2Vjzhv18u0GfishkzhPOfTQEjwwmfQmU4fA5Ox1yzpQhYiSJPsKeDoLGeMIuIantZgc3axU3H6kT7Ywflo1UCwfsL9nnLfkl67sFrPnEzrgqR3QiDKZuq10BYUZ3u2I86Bfyt8SxQlTkRWrweo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785329410; c=relaxed/simple;
	bh=JGRGDiAJOaG2w2NCqn2ChsJscwfpJhdBeZ8nl6dBIXo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nP1M45ftuBcV4Bhr2HingFyQqEBGxxEnHZdnT1zz/pj5fBAsrAx5vbhSmaV7y5Ngg+4HP+69/1NMwl+++YD9TaMidqDLUoHpGBEnf4p0/h4lYUH2zsOWf9PSS7JyQjT0TehBxrc1eE8L1g/nluj9BwA2UgfLVXgGLTe8ZP8CCN4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org; spf=none smtp.mailfrom=brainfault.org; dkim=pass (2048-bit key) header.d=brainfault-org.20251104.gappssmtp.com header.i=@brainfault-org.20251104.gappssmtp.com header.b=LR11f3Ew; arc=pass smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault-org.20251104.gappssmtp.com header.i=@brainfault-org.20251104.gappssmtp.com header.b="LR11f3Ew"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-476a130c138so1030442f8f.0
        for <linux-kselftest@vger.kernel.org>; Wed, 29 Jul 2026 05:50:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785329405; cv=none;
        d=google.com; s=arc-20260327;
        b=PA9iWE0AAPiaRdIqRtiD8OaDbDoHXUo/RSgHsds9OtkwMOEBjFTK9fuyTKE4imjjUp
         Bpg1il2hBtgOm3KeCxUgyUxpQ4PiVOKSOw1MbP6LYCXCf1vMvXBplG+ZPEzB2MdfTFaU
         vJf/heYcatmoynu2WnobqTa3wtCdPC/a2bIBBg94pT45AhrMtH75r3R0gq++3mv7yJBK
         chkxlZ5zmrRbWavL0LTYJEsCYcniNuNb+onXEOKQJhhd4nZ2/GeosfXT0xC/Q3YklJus
         MdAbZkd/MencCR/o92a0goKjYZjzC6iGUFEHuTN0AAOXA9rA1pv8CJ7mFEgu9ci+RmFo
         otvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dx/CmVrpueSln+pSRsdy5aEFve/DvptB38ixtepw5a0=;
        fh=wrnESzbeD2mnhW/LnXtApEmv3CHHhcI4pdup0zdRkZs=;
        b=pUr2tglorluS6Nrs/i9av7EAYGtx0R7cKGKdvsjDsZeHXLhxAJFrKpNypnOejXZ6VB
         nG9mqADBZ6qwlajToMw4uMevlpNjf5H7rGns9ciajmln5UD7wyNb6TX9AoM3eA4OejXX
         0CnzXskziT/iN7Kb8uBVuPWRTjQJ8q51Qd2JFxlK/bwqxfpxPKMWm2qyrSmEaTBOwwJ5
         ErN7uFY2PmTHsuhoZIngu4p7EV944OWamLzFdffy3ddn8UaCqo998obgVGf8/P2MFrs9
         yh2Pf4e7cYBwHXkSDYX9NR5sD/EPrb1GIaZIm8wpCWPOj8ywuRkhHArmD+euZHlM+vqm
         TyFA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1785329405; x=1785934205; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dx/CmVrpueSln+pSRsdy5aEFve/DvptB38ixtepw5a0=;
        b=LR11f3EwMYPhBLa0O05e2nU65PA7uFXrjLAPnSrW29JDZjFu1gNCGHb+E8eDc7Mesp
         Oj/aRq+YVl1hw7vXZa7/5Udvs2zhhxOEFT5Hn2Q/3vi3Cguyl/M0XcHB86kTk+5TY/v1
         aT80TwivmK7KkC3tvAqDRtaJtgIP7NwFceQolar/u5KclbuShAPPAkQpIE9Jab98wKhb
         swBFaRkP39BT/f9osbIB51zFvSFIMMXhEq4r44L1KdrqxPjmcdPjxY0MSSgxZxoygRMV
         WTo+eZa0Yrzj90BCbwdoEBTGnU1QWYSUn4gRkRRTXNNfdmJffwiFo8ljxhsjsrl1L0EL
         kIlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785329405; x=1785934205;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dx/CmVrpueSln+pSRsdy5aEFve/DvptB38ixtepw5a0=;
        b=oxTlzIFbrQDKgOPWOhlr3RdTMbmH1dMrTz0cwh3i5y+WWW+Inzj9A0rgq5iU+KX/HF
         A0nS2RVLF1ZEyxauh+dvDq3XCQvo3WX1kqYBjSqBr48jxrhJndpmwg7AhU+PndWJC+cD
         85nzeubr3dppD/8vB9khZhOYX5tLnG9GMELn9JHSKwQ6e73tP25F1k6WJNLR2Nwpl/wl
         KEfoseylwGMb+YD0YnFdEKpucctfIT+ITgJ5RK+NuQapJfPyQP063BsQpryYu7lFGKsT
         +ZjIkXDXOhfxm/Ff1jFyo0UzO2i7fO/3PjnMEWIrh/WVf/jWiM7DAkeE+qYnY0RiHgPO
         sUxg==
X-Forwarded-Encrypted: i=1; AHgh+RpisrOGP/dh5aduqns4X9lvvqhole2yNtL2enxqlWXPLB0kWbGBLK1/3el0Tvbdd29clvRg+uwXxg2HBfLcTzY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yym7W6K3IWHvFIgCU3T1GSBqAUJd98JpVRw3lgkku173oGED0b8
	5CptcnoBLISsNlAKkRj+7uskPzFX40Lx4cZWqkEZglPKrKtG6ktTId8cXN+Njw1CPP+jIPpO1Fb
	fT+vziCyn6h8mUHVVVuAoApTZ9rsBvI8Qa9Af6NWDOA==
X-Gm-Gg: AR+sD11g/KFr3YWU9F8c+IYhHGJBe+qGanKITnkdSRStcGKrT59N2m6kdArDWJNxPDx
	w4JqyentRfA5lgYF3fzQpTAjEn49xe2aCVC//Nk00J7dUEsAiRIf6D2gFEXTzW5cTDMP3NA6+ib
	fY5cppJLU6orJcKT1jwyv/FVa0xBbn2MmcRKGOmY8o6T/EjtDnN2LxRMEeGaTZ6+5TLsIN6Wqk4
	U5UUu7Yp87wxczFr3Y34l44xn/68MrVyjAmgkfKdm1aPOWEhsMCH8HL66nBR6TkWDK/BYTyxdrb
	EksHAkBmhC6rIaeu4pFyNQfkIIHJwKL+JktO0UlZhG61AMuMZzDTv10kUcz3SfA6q7gtopd9m5m
	ISZgDoAAaDs19rNaK8sRBhkL6vrWfJ0QAIkmwJMSUfBr1ecS2V3ipNi5o/7/CQG4=
X-Received: by 2002:a05:6000:4310:b0:473:6e8d:7f3 with SMTP id
 ffacd0b85a97d-47fb1e8282emr8113564f8f.1.1785329404905; Wed, 29 Jul 2026
 05:50:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260713010302.303278-1-inochiama@gmail.com> <20260713010302.303278-4-inochiama@gmail.com>
In-Reply-To: <20260713010302.303278-4-inochiama@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 29 Jul 2026 18:19:53 +0530
X-Gm-Features: AUfX_mxIAIAYLjpHcgaD3ozqXoaXRQtjaEsHbcis5uT8wvm3w9BPM7ZLbion2z0
Message-ID: <CAAhSdy2xe7DBRY0bhM1S0G-6ebEEi5y0x9fS3YFUC6D7bN32LA@mail.gmail.com>
Subject: Re: [PATCH v6 3/8] RISC-V: KVM: Allow Zicfiss/Zicfilp extensions for Guest/VM
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Atish Patra <atish.patra@linux.dev>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Andy Chiu <andybnac@gmail.com>, 
	Charlie Jenkins <charlie@rivosinc.com>, Deepak Gupta <debug@rivosinc.com>, 
	Thomas Huth <thuth@redhat.com>, Sergey Matyukevich <geomatsi@gmail.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>, Quan Zhou <zhouquan@iscas.ac.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 13, 2026 at 6:33=E2=80=AFAM Inochi Amaoto <inochiama@gmail.com>=
 wrote:
>
> Extend the KVM ISA extension array to allow KVM userspace to
> detect and enable Zicfiss/Zicfilp extensions for Guest/VM.
>
> Assisted-by: YuanSheng:claude-4.7-opus
> Co-developed-by: Quan Zhou <zhouquan@iscas.ac.cn>
> Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Thanks,
Anup

> ---
>  arch/riscv/include/uapi/asm/kvm.h | 2 ++
>  arch/riscv/kvm/isa.c              | 2 ++
>  2 files changed, 4 insertions(+)
>
> diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/=
asm/kvm.h
> index 7bbea8812d92..a27de850fa4c 100644
> --- a/arch/riscv/include/uapi/asm/kvm.h
> +++ b/arch/riscv/include/uapi/asm/kvm.h
> @@ -199,6 +199,8 @@ enum KVM_RISCV_ISA_EXT_ID {
>         KVM_RISCV_ISA_EXT_ZCLSD,
>         KVM_RISCV_ISA_EXT_ZILSD,
>         KVM_RISCV_ISA_EXT_ZALASR,
> +       KVM_RISCV_ISA_EXT_ZICFILP,
> +       KVM_RISCV_ISA_EXT_ZICFISS,
>         KVM_RISCV_ISA_EXT_MAX,
>  };
>
> diff --git a/arch/riscv/kvm/isa.c b/arch/riscv/kvm/isa.c
> index 1132d909cc25..9852a91fdecc 100644
> --- a/arch/riscv/kvm/isa.c
> +++ b/arch/riscv/kvm/isa.c
> @@ -65,6 +65,8 @@ static const unsigned long kvm_isa_ext_arr[] =3D {
>         KVM_ISA_EXT_ARR(ZICBOP),
>         KVM_ISA_EXT_ARR(ZICBOZ),
>         KVM_ISA_EXT_ARR(ZICCRSE),
> +       KVM_ISA_EXT_ARR(ZICFILP),
> +       KVM_ISA_EXT_ARR(ZICFISS),
>         KVM_ISA_EXT_ARR(ZICNTR),
>         KVM_ISA_EXT_ARR(ZICOND),
>         KVM_ISA_EXT_ARR(ZICSR),
> --
> 2.55.0
>
