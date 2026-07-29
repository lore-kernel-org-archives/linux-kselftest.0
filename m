Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B9545D5E0
	for <linux-kselftest@vger.kernel.org>; Wed, 29 Jul 2026 13:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785330173; cv=pass; b=Xr/VYyJRnMNLt/OBFiOnbvYlc/2DRdnQA8Gbtv5wewbPGmlJky9ZbnbY7m4gtU/MappbdqrlRIgYi5tdKtbam3kTtGRmmCyhE8+9Xq4jB9Gu4d/rDpglcm4zueFGNtRoo+r0+DCNsUSuzoSih0Hs4TShxRxmCLYNALwmK8VzBmw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785330173; c=relaxed/simple;
	bh=eDqo2iDGEPiXODUhjSnQVeqKbgf2WIdc1/PE6oVTP+o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uMG+9Qdppkby/3JumDqUIz/ZCJphazRFlHO40JpCZhrXVKOBsg4DFFnGgCTdOeORZhPu8uKQlDKZCCtwUGZT4XvrfQIatufJtIVAl4r08pjqndOmpBmYCMkW1DErawKoWeMEiigSS251Ts2YXZaR6Ahzui32z4J3ATNLiJUeX/M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org; spf=none smtp.mailfrom=brainfault.org; dkim=pass (2048-bit key) header.d=brainfault-org.20251104.gappssmtp.com header.i=@brainfault-org.20251104.gappssmtp.com header.b=EVw16Iyc; arc=pass smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault-org.20251104.gappssmtp.com header.i=@brainfault-org.20251104.gappssmtp.com header.b="EVw16Iyc"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-47ddf7b09aaso827977f8f.3
        for <linux-kselftest@vger.kernel.org>; Wed, 29 Jul 2026 06:02:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785330167; cv=none;
        d=google.com; s=arc-20260327;
        b=el5+JUbRMfmcrsg7bRSxjipC+9Xlaa38Xbn5NN07ZeVMkJX71ieB89y5IT4dVFVgXE
         8Hh2XUEEWmGoxKZu4U0moBiuskmPi9/93XFH/+oumRds3ZxG1ua9W0UaoZGiaeiwnh7k
         V201Iwdc1ilIiSg+nZNPITFt15dxX4q4fLCJglOp4HC/hgvmpN+/1jXClxwzGJ0z6pbJ
         Ig7yjCNcm8cyWKludBIhz6mK9Qq3GsAIE3TRfxmbyYnPYEaBCbT8rSJDM2nwJvgOh8L0
         LLbq3NIZ129x4GIXjh9FDYsJrqcpIWLV4gNtyTVkN9FrUcrjfrlkyAa0Rw6xh5W4ftz0
         mZ5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xwG4KZ8DundkT4/gQU792HRUkxOVMwanRijYp1dPzBA=;
        fh=RzEOkdXUzVsb16U9yYGeO7kkTqF2dZKEdJxApeoFp2U=;
        b=WkEVgPvoUgtfEgJBdnQ/R2PWnNspvh9zYFDaJBV7eFUoUYr8ou8JqBqntETQaUDO+A
         0rvIMrIYTdWmMTMa71RJIZBFPxOaIno2F709X6Nr4SqpuwPNEivNmMzTJ0bpVTacx7rn
         LYAtPZ9boHcScxS7yFi4OQF4+HY5qOaXU3bFV1qGmJTjVXj238btzioWGd3ayNhdoGcW
         fjmAIG1W8hRshSKQf2wWOl4Sgrz8sSEIB6bJc+D06SzlAS0Cl8jZpuSuvxhEuFAHKhGy
         vsvKrCmsZyq4434hjQO7p2atJC5ShkHHmGil/sqEh+Xx7ticzC+fT6+pY/QcVlm5vV6/
         Etug==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1785330167; x=1785934967; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xwG4KZ8DundkT4/gQU792HRUkxOVMwanRijYp1dPzBA=;
        b=EVw16IyccdgQ7aSi73T06rGPlPlX9ivLdW+GtJMsd1WDDlFHVqttHstozV7F2Wenbe
         FG9xit9VExKqzVY3AepqY3Sle16SkE8T5JN+0xHub91edY7GjE5CG9xAddZE7jwc3GnW
         wRHsgeukuFfFDkD/1iInvoSMS02QfIie4P6rceIGyiJHj4aGdF5NlZbrHOxfrntsh1QE
         tuBBGpQIMi4LyGxN07WsNKDtnLA92mobFFaT76cCELwAMUaoitq48yB6vIJgdlPBDmLz
         PeMvpRDtekgH5htA9+/fFAkSA+HtVT+XFcB18L7lc9XvtfdsReA2U0+Z5wXnMmZViDG1
         avlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785330167; x=1785934967;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xwG4KZ8DundkT4/gQU792HRUkxOVMwanRijYp1dPzBA=;
        b=Hm4ja/E6XfXdWpYuedYrrR+VduDhuvX4ec8jvKzXg5N1EkwJRA7scGtHHq4XxNFiEq
         lCNYbSgm7t+jSQsU+p3oVhwT8DgJa/0VIeTYv4NETX74YPfwL3ElLjH4g/OoLL5jVz6m
         bJ23JyDxgukrUa4jBkwpeM9CoOqSqKcp9NJoZquD/XaQ9tRjxrJGwm2jCd+aQdBcjNzz
         cCQoLq8+n+yuvcXQAVwsFcotlQ/0mOlHncGiaNQUBh7Jbp2j6bZB+VXZXsuP6zNrUXnq
         SUB4MeUT6M6IJTYg7JxUCJGayc61KVjkBOAg9R4YUjF+5YrVZFrmj0l+EUO3SM5K/sgm
         gHaQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqvzed+W1L06BeFica7+Kef74vfiBXP33wisrEXfUk9RQmNDjdRF09OsFRYV2d4iFANCjsag/qEY9DQmUxCi4g=@vger.kernel.org
X-Gm-Message-State: AOJu0YwrrvWLEXrnxEnrb3IaPLvaxf3QtgLSBVzoa9Rm9/qDSMQpuJ0Q
	EMMZz14I16b1Qc/I3L+IcSPu7OP/5UxzbcfgXkeFeaTmoY73/VwTJYgMhicrFyjpkxZDicxRDuw
	Lzc60yvmEovcVCyOuCPLB4490PMJ2bzqoKi/Ypu4uEA==
X-Gm-Gg: AR+sD13ks6ViYgZQo5pwODlTyeAD2RGWcbh7/FIcmD4UI2bjkp59WEtbHlnv872ljsE
	PKoJRUH0LAnoznBLoRVCNNONdPkopSgh5KsJZDM/eBKA0xFik90XMsTH2FL9BRG/xnR/IMiipBF
	KJ9OXevPKGmd+bwPgbovE9FXt9EdfLP9T5Cx5HGZ5/JdKRm23DMnFN0xmFfKVYb997Vknms7LkQ
	Ogn/FkQsO57d8SPdskKRoLV/S2iPrIvANQwc+97gmep2IaT7wqSydmM6KXu3UOaMyRpnFELQ4Rm
	0u1ixpjgNHMhAGvKcpo7mqUMNWAKAwo4+w3UAJsyGBAAgJxhjljPM0ZEp90G99uQ5vQ8K2u/Tr7
	xn5BdSwyv+GtNBQd2mBSLEMn4l0+MnPO9GYypIDk9xik5gT5TnOifUwQ06OfpLyI=
X-Received: by 2002:a05:6000:2905:b0:47f:87f5:ed32 with SMTP id
 ffacd0b85a97d-47fb1f1ee67mr8269589f8f.46.1785330167110; Wed, 29 Jul 2026
 06:02:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260713010302.303278-1-inochiama@gmail.com> <20260713010302.303278-6-inochiama@gmail.com>
In-Reply-To: <20260713010302.303278-6-inochiama@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 29 Jul 2026 18:32:35 +0530
X-Gm-Features: AUfX_mwE8ZwJxVamoxay-s7b9HbXLhua7tMXOSg40tFpb0mLvfWDnTva0izJLrg
Message-ID: <CAAhSdy2Eg3H73At808Bq8yXv64j+nowRXzHZfMBsC=MDke7Bzg@mail.gmail.com>
Subject: Re: [PATCH v6 5/8] RISC-V: KVM: Handle software-check exits for VCPU
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

On Mon, Jul 13, 2026 at 6:34=E2=80=AFAM Inochi Amaoto <inochiama@gmail.com>=
 wrote:
>
> The extension Zicfiss/Zicfilp introduces a software-check exception
> to the privilege architecture. Delegate this exception to VS mode
> when vCPU enable Zicfiss/Zicfilp so the CFI violations in VU/VS could
> be reported.

The patch6 must be squashed into this patch.

Regards,
Anup

>
> Assisted-by: YuanSheng:claude-4.7-opus
> Co-developed-by: Quan Zhou <zhouquan@iscas.ac.cn>
> Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>  arch/riscv/include/asm/csr.h | 1 +
>  arch/riscv/kvm/vcpu_exit.c   | 4 ++++
>  2 files changed, 5 insertions(+)
>
> diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
> index 31b8988f4488..224af9facf1f 100644
> --- a/arch/riscv/include/asm/csr.h
> +++ b/arch/riscv/include/asm/csr.h
> @@ -117,6 +117,7 @@
>  #define EXC_INST_PAGE_FAULT    12
>  #define EXC_LOAD_PAGE_FAULT    13
>  #define EXC_STORE_PAGE_FAULT   15
> +#define EXC_SOFTWARE_CHECK             18
>  #define EXC_INST_GUEST_PAGE_FAULT      20
>  #define EXC_LOAD_GUEST_PAGE_FAULT      21
>  #define EXC_VIRTUAL_INST_FAULT         22
> diff --git a/arch/riscv/kvm/vcpu_exit.c b/arch/riscv/kvm/vcpu_exit.c
> index 0bb0c51e3c89..12eebeabdf14 100644
> --- a/arch/riscv/kvm/vcpu_exit.c
> +++ b/arch/riscv/kvm/vcpu_exit.c
> @@ -243,6 +243,10 @@ int kvm_riscv_vcpu_exit(struct kvm_vcpu *vcpu, struc=
t kvm_run *run,
>                 run->exit_reason =3D KVM_EXIT_DEBUG;
>                 ret =3D 0;
>                 break;
> +       case EXC_SOFTWARE_CHECK:
> +               if (vcpu->arch.cfg.henvcfg & (ENVCFG_LPE | ENVCFG_SSE))
> +                       ret =3D vcpu_redirect(vcpu, trap);
> +               break;
>         default:
>                 break;
>         }
> --
> 2.55.0
>
