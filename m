Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 220DA3EB81B
	for <linux-kselftest@vger.kernel.org>; Fri,  5 Jun 2026 16:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780675920; cv=pass; b=cZmRveQ8LM7wWPkBcfTqYryWYx1LNIlH0eab2iGmwn1sYSD4xku5MQDGYUFdLGCBdOKDyXcV4iQEBQq2s8TSFNGPCAppqib8OTP9pRNUnCPlU2/1aj+svta0gzzGJAvOxuuVPccY8bbaA4TDDRZstRlrq+de9F7EjkdV/nZlKrM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780675920; c=relaxed/simple;
	bh=qZVXKpPDjxCeKYy683RF7BwrEKu02kXmgev0H0RYQKk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hjfIapsHmNRlVpNEEw4xMi7KNwzTck0ESoXcxTLGKa109e5JWas6s5ZixauezuBZbSC86YPt41Amp+VuNUr52YPxsppRNaK8CsXRnD6rKs5h+bA8zHjTROz2yU6282fkkTnlpQrWfKg1GmAuoY4Af2KNYCe4pitBi4sS9E59ve0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org; spf=none smtp.mailfrom=brainfault.org; dkim=pass (2048-bit key) header.d=brainfault-org.20251104.gappssmtp.com header.i=@brainfault-org.20251104.gappssmtp.com header.b=jMtywR1m; arc=pass smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault-org.20251104.gappssmtp.com header.i=@brainfault-org.20251104.gappssmtp.com header.b="jMtywR1m"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-517583cb07aso23052861cf.2
        for <linux-kselftest@vger.kernel.org>; Fri, 05 Jun 2026 09:11:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780675916; cv=none;
        d=google.com; s=arc-20240605;
        b=CgyaZp3Vcb/i/TOBK62/+z13m4T4lDahTCGnGuo97WBep1uwzXmlSvguNbqPKphT+F
         oCWPB0A286KIayjAt40ueb6392BGvrv8AOZwkN+fgsbyc0zFMZI8eWORSVT9yuQ1bn8x
         uRTQZ5xsct2gJmBr++0LBh3WAHouNbcG1cJyVE+P9vAm3QqyF2CWeNmJJsjsCVsbJq8A
         0XMzjQRztwWlMPAmAMkRnrDiZ5JidUUKNdHBR4qEI5HPi4tHf4WHVFc+MSDmxW4qSkBT
         14p/gSN6XbcUfDGQpmfV6QTCToSkXNh81oJVu4Hn/9WPJyxp3Bpq6X3n5CJVx9/bDZ75
         r66Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=B8zHAowjm9o5sCCpDMwWhliapSVQZdoHydKt2nMqWDU=;
        fh=BLxJsbr5lx1xxXqPTuOFHqBuYpei82doP+MEgK7cF6w=;
        b=XOHpGZGnEhycaYe9h5TU8MXKyuICNr4CK0a7x8pz+SmYmfYpyKOUOfA04KoueYdp0s
         apJffWpjTFl1fLb9YoY0jzbH4XW8Vly6ZrJil/p/rymLzngarpmjBgJcyyNDNcYQ2AqG
         TibtcUX1WODGlQmNX2XVwq0DmDroovTq7Fl9/qMfj/27+4ypcDwWrajSdijJPktxnLis
         l9Ty/oDrSgBOBcMKJXmFZIcUqKq09mBjb2mhwZbGNgrfNPvFF0tc9SMNbquWq8CSKakc
         abvaEuGPA0dMB5xa/q+e+5iydxaVyFyWAVQauugMGoYY7Ook+WuLwyuNF+dN6NCjm5LP
         1pCA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1780675916; x=1781280716; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B8zHAowjm9o5sCCpDMwWhliapSVQZdoHydKt2nMqWDU=;
        b=jMtywR1mAflvEKL/DcgZ1lQ88kOb7YKj6nMPg9s7VnsqLzZ9DVSuzrc7hUOD1lLpMQ
         o8VaMhQoY6Of9wP0OZEdlDOs72pRouvHr/S5VDpjd5Q6PrtodYgniUotwvkKK+z4cro5
         McE9MTduCsiCjExOAVO4vsC8Q1Mt5MjzCPgAXsoHiYlCyNA+BalAV7e61GZ+rWLaaZ71
         uRcg8Qh3rQgSb49vFvk9lzCxhUjeG1ApzuMUr8kGWgk5yBi15IJHaWkVc/KubHfqm5kf
         +Np5AfPDRkWJcDb/CQ1vkcdB0NmzeFlCLlWy2Yi4FqZTSToVXSUAZ1B7SqJN0RtEc4Dv
         5FMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780675916; x=1781280716;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B8zHAowjm9o5sCCpDMwWhliapSVQZdoHydKt2nMqWDU=;
        b=mX/KiT/1FwDEVMToYUcHmLBrTgUF0TNqcfU5KLpKgewGD0epeA0sT3J2xShRNjUVeO
         sZSkwz3oPIxzDi6rZqIdt2/LnAh1rk8EYy3T9UFCnBRPOJ5LKKSvJWPth74LvqVq5XKN
         sj3hwz+7EXJB93yDFXfGmrzf+kftzBf7GvpmADySI40rKt0wwzgiAHeOrhACdK3QOXSJ
         y9yckNcnPN6+Imy3nC42+9qFhiSrt/2uEC+hi0GjAIZEJBOr9r4+G+HAfRfV0wTD8yZf
         LtKIKok+WFcM5n2zjH2oY8NpwQ2Fglivf6ltd0RQG/zsGZRDH7gzsJtgqcE1gcSlt5xy
         cYfw==
X-Forwarded-Encrypted: i=1; AFNElJ+PB+M7ipEdOlq87lEjNbl6H72JL8zxBtLI9sM4ypYVkM0jr+Wi+AfUvdhV8A2dWabO/q+Sg0Fe0mI//PuqClU=@vger.kernel.org
X-Gm-Message-State: AOJu0YybNSF3I52OE3TMqV/gUUYkd2+v0IzB4qrGvbPCLwuyedoMRNym
	UR9kVC2WbHAniBWG7ABjU1HHQBiQ2Ns2gMwBTxNJ5v/ZkMf5FyEjBt30TYzw+oPzSPV+OLPRMZI
	NBRHbV9hjzOg1jDf3X8yIs5j2qM4G0jlCM6Xe4kTIIg==
X-Gm-Gg: Acq92OGhwDon8ZxnuAhCFT3U40bvMbbBRuiUEl4GB1w7tmSmTUHFyW221NjLVyAJbTl
	7qJkqHhXegdjazsr/5Kps449Pb5DGKMuUW0/k2/V5JfvgCphMcUKV9QUQKtnqNKGnxnFJtB9tdi
	wVTlS7IMwn2VfJUx6gReqmlIlQc7dU3+4KMo6Xdjex0ceB30Q89cR6s3pHJ9bqYVci9fjl4n5eQ
	cj8ghsdUlL59cKU8LxQ5JLFrLD5v325jqsGFVLaErIfpPrZcvoCsjlpnqUt1QuPPyyhYzdFUOOs
	W/ew3CeqOTzS+pbTPS89PeuoAP4HnxmbSzLo/Oby8s0nqt8pEssA2Wlg2zo1XQS9yPP6O2LIJte
	AnTChYe9taGyN74qZk4gMzTjGhExeGdu7yR0d
X-Received: by 2002:a05:622a:47ce:b0:514:5d67:7a30 with SMTP id
 d75a77b69052e-51795c74e62mr59512281cf.43.1780675915711; Fri, 05 Jun 2026
 09:11:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260601-kvm-get_reg_list-v2-v5-0-415d08a2813b@sifive.com> <20260601-kvm-get_reg_list-v2-v5-2-415d08a2813b@sifive.com>
In-Reply-To: <20260601-kvm-get_reg_list-v2-v5-2-415d08a2813b@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 5 Jun 2026 21:41:43 +0530
X-Gm-Features: AVVi8CdMjAT0z7-9b8EOLBKxYkX64w5Y19kWLNobId7ujEDIshFbGvocPy1UTls
Message-ID: <CAAhSdy1QsWMYvn9ma5gSLHyezY32t=2YGpddOgrCzqCR9qa_ug@mail.gmail.com>
Subject: Re: [PATCH v5 2/5] KVM: RISC-V: SBI FWFT: Add optional init()
 callback for hardware probing
To: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Cc: Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, greentime.hu@sifive.com, vincent.chen@sifive.com, 
	zong.li@sifive.com, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, inochiama@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 1, 2026 at 3:56=E2=80=AFPM Yong-Xuan Wang <yongxuan.wang@sifive=
.com> wrote:
>
> Add an optional init() callback to separate one-time hardware probing
> from runtime availability checks. For pointer masking, this allows
> probing supported PMM lengths during initialization while checking ISA
> extension availability at runtime.
>
> Fix try_to_set_pmm() to restore the previous HENVCFG.PMM value after
> probing, preventing side effects from hardware detection. Add preemption
> protection to ensure CSR probe sequences complete atomically on the same
> CPU.
>
> Fixes: 6f576fc0aeb9 ("RISC-V: KVM: Add support for SBI_FWFT_POINTER_MASKI=
NG_PMLEN")
>
> Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Thanks,
Anup

> ---
>  arch/riscv/kvm/vcpu_sbi_fwft.c | 33 +++++++++++++++++++++++++++++----
>  1 file changed, 29 insertions(+), 4 deletions(-)
>
> diff --git a/arch/riscv/kvm/vcpu_sbi_fwft.c b/arch/riscv/kvm/vcpu_sbi_fwf=
t.c
> index 5e4aafb0cbf1..aee951f2b8e6 100644
> --- a/arch/riscv/kvm/vcpu_sbi_fwft.c
> +++ b/arch/riscv/kvm/vcpu_sbi_fwft.c
> @@ -35,6 +35,16 @@ struct kvm_sbi_fwft_feature {
>          */
>         bool (*supported)(struct kvm_vcpu *vcpu);
>
> +       /**
> +        * @init: Probe and initialize the feature on the vcpu
> +        *
> +        * This callback is optional. If provided, it will be called duri=
ng
> +        * vcpu initialization to probe the feature availability and perf=
orm
> +        * any necessary initialization. Returns true if the feature is s=
upported
> +        * and initialized successfully, false otherwise.
> +        */
> +       bool (*init)(struct kvm_vcpu *vcpu);
> +
>         /**
>          * @reset: Reset the feature value irrespective whether feature i=
s supported or not
>          *
> @@ -131,19 +141,30 @@ static long kvm_sbi_fwft_get_misaligned_delegation(=
struct kvm_vcpu *vcpu,
>
>  static bool try_to_set_pmm(unsigned long value)
>  {
> +       unsigned long prev;
> +       bool ret;
> +
> +       prev =3D csr_read_clear(CSR_HENVCFG, ENVCFG_PMM);
>         csr_set(CSR_HENVCFG, value);
> -       return (csr_read_clear(CSR_HENVCFG, ENVCFG_PMM) & ENVCFG_PMM) =3D=
=3D value;
> +       ret =3D (csr_read_clear(CSR_HENVCFG, ENVCFG_PMM) & ENVCFG_PMM) =
=3D=3D value;
> +       csr_write(CSR_HENVCFG, prev);
> +
> +       return ret;
>  }
>
>  static bool kvm_sbi_fwft_pointer_masking_pmlen_supported(struct kvm_vcpu=
 *vcpu)
>  {
> -       struct kvm_sbi_fwft *fwft =3D vcpu_to_fwft(vcpu);
> +       return riscv_isa_extension_available(vcpu->arch.isa, SMNPM);
> +}
>
> -       if (!riscv_isa_extension_available(vcpu->arch.isa, SMNPM))
> -               return false;
> +static bool kvm_sbi_fwft_pointer_masking_pmlen_init(struct kvm_vcpu *vcp=
u)
> +{
> +       struct kvm_sbi_fwft *fwft =3D vcpu_to_fwft(vcpu);
>
> +       preempt_disable();
>         fwft->have_vs_pmlen_7 =3D try_to_set_pmm(ENVCFG_PMM_PMLEN_7);
>         fwft->have_vs_pmlen_16 =3D try_to_set_pmm(ENVCFG_PMM_PMLEN_16);
> +       preempt_enable();
>
>         return fwft->have_vs_pmlen_7 || fwft->have_vs_pmlen_16;
>  }
> @@ -231,6 +252,7 @@ static const struct kvm_sbi_fwft_feature features[] =
=3D {
>                 .first_reg_num =3D offsetof(struct kvm_riscv_sbi_fwft, po=
inter_masking.enable) /
>                                  sizeof(unsigned long),
>                 .supported =3D kvm_sbi_fwft_pointer_masking_pmlen_support=
ed,
> +               .init =3D kvm_sbi_fwft_pointer_masking_pmlen_init,
>                 .reset =3D kvm_sbi_fwft_reset_pointer_masking_pmlen,
>                 .set =3D kvm_sbi_fwft_set_pointer_masking_pmlen,
>                 .get =3D kvm_sbi_fwft_get_pointer_masking_pmlen,
> @@ -365,6 +387,9 @@ static int kvm_sbi_ext_fwft_init(struct kvm_vcpu *vcp=
u)
>                 else
>                         conf->supported =3D true;
>
> +               if (conf->supported && feature->init)
> +                       conf->supported =3D feature->init(vcpu);
> +
>                 conf->enabled =3D conf->supported;
>                 conf->feature =3D feature;
>         }
>
> --
> 2.43.7
>
