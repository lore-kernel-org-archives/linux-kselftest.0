Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE3653E314A
	for <linux-kselftest@vger.kernel.org>; Wed, 29 Jul 2026 12:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785329727; cv=pass; b=JCowzf7l75270bMHgCfc55ObhlsK1zUIIain4IC/mMmpqo+MUOuUdE8M1tix7eeYGtA5uHV85Gfgx5b0LG6/XHJW4Fsc1dHeTnwVAnIZ6U5wNWUz31dHJFWkyZom+rnfauDsoqWuDKyEcbs/DfjvzQreZjOxO/qgp/ZZ9iO72A8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785329727; c=relaxed/simple;
	bh=kzdYz0qURVS0hBv/puZkFsa+k2VxcA5UsiyANVupuKo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AkIJWqsnj2fRfeJS+x3Hp1OCywsN72B+TLqfkR9LHONEAQLbCuGTjgW7iHo+Gal9GIjR1Q+KZD5zFKcGg5hD7lEj1657V4hkGa38rliQqic54CFcok4os+n0WDKpgNKwCPMTL2SaAV03xqIJJ7JUPlF0cGrBEwDmLvpz9xDy+0o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org; spf=none smtp.mailfrom=brainfault.org; dkim=pass (2048-bit key) header.d=brainfault-org.20251104.gappssmtp.com header.i=@brainfault-org.20251104.gappssmtp.com header.b=BI+GDkZG; arc=pass smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault-org.20251104.gappssmtp.com header.i=@brainfault-org.20251104.gappssmtp.com header.b="BI+GDkZG"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4728c12ba97so616043f8f.0
        for <linux-kselftest@vger.kernel.org>; Wed, 29 Jul 2026 05:55:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785329716; cv=none;
        d=google.com; s=arc-20260327;
        b=aJIWrpscwj+6RJ96ySECfolsORVSMjQZR8kXX2t1UPCl7tvSK9cjNQPSmtVx5P6CI0
         I+cYTYLmq25818q0gaUx9HXfpODxOqG3Lwkm3J1w49kTwMpHi9zKgIlg8rnpHghuakgg
         yAAFck6JGUheQF9hOJ4bZBCC0mEmIRhuGr/r7bpz5MnBHRcevT0ZxWtxliwSHniXp29d
         QTC5EC4ivdOL76mzdeqxQ0nowH6NYH+zGCFma7YxEDAMp2MHwgQCSNuRPo1C74+8ao16
         UDZBjsZrjV/HgrMGz+PAWN/rZdGjvMuEBs2AnqrdDF06gySGgnZHjh2/6TD0nzNqiLiI
         nbpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MIOV3NXpceeLmsAkHaxVgR2wr4ZXHXaxDOyIxpxmXC0=;
        fh=ON7591PpgDhCXDh8WuS5HQeIz5ht51AiUkvK3YplcBU=;
        b=qV5p9ZlUvHsK2uUTyRsv7sa6ri/IdvPQ6ONwUYQIpx0XjJRr1pYV9gJfO4iJvuB7Hz
         zIjV+yCL5jddovbOFI8Rp/d/Z0auz4oug46Ap1oHPMJXqMy/5f7t0HhKcUTYfrKqRMJR
         0XAsHH2iG0GoetVWEBeshNCySlv9rxY6ZNJXThThg8ZlT4P9or7RQlKa1T7XtGrYXM47
         N3EUwVa4hfAYccqM9cN09eYFfqC1wGLZpWaKJz/cI44rtDJFKQwpxoocXV7iAVZ4Ktom
         00VY60ZRWbt24suTSMk7lSx56eNufptubgco31YuIKlAvvnKP+EXahv7WcxinesqQ9tV
         sVJQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1785329716; x=1785934516; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MIOV3NXpceeLmsAkHaxVgR2wr4ZXHXaxDOyIxpxmXC0=;
        b=BI+GDkZGRb4EKzaM0TSxW88I/U7AS4/fhpYGc+pEeJMOftc1NkDa70CMd7NgINHpvE
         SXuy+vuqG1ONhtL82aRAd/L0Tff6w8gSzyq+qne8s28qHeQUcVmykJqjFB5fbOKmmf0L
         HBFag9BA/in5CcIzKX/xRcEDrlEFSpbAqbpg+dTXZue/KUms6Fk4YtnLKqcGSvW83+nJ
         ygxz75jwJGZIKGKosmCD7YanqVKYaXICVudeF12XW1rLQaXqC+iGTIoBraW7HU3e82nf
         7zHc+DXv5exAC42DJh4bwYqB6b/g3Rl+7JZIn87pdk8gPzkp7TBSoNwuq7ppn2Q9zLgE
         G+FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785329716; x=1785934516;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MIOV3NXpceeLmsAkHaxVgR2wr4ZXHXaxDOyIxpxmXC0=;
        b=daB7LCgNdZ7J7gWgZmORvu7nZWgpdYbGmkD7FICvNL9VMfRWX1V/TG9WhT4Z/hNbhq
         hKmjJFIeWwdrtvBb9cPPYRXdSpra9TsbdbIoxwsdGWSqWlRK/6niZdj7CjpGwMcpQdMR
         C1nQdT60pyR2upMWsaKZDjKeezj1lvXWI5QO6r5HMq4D/RPwgLQbByflLVRsaOSI16TC
         ISqO/9mic+Qhfq3qF3A7y5YTLO31BP/NnUBw4qDlT7JLzGCi6sowEoXRZw/XV+uarMbI
         aZ7AI6BZ3x+g0qx1eO4IFmKHZQSbG+cVqxj/XYEDVNvS5uM3yvYIWyPBJEA6PMJ74EQC
         /rOg==
X-Forwarded-Encrypted: i=1; AHgh+RovOIQxVIjztz2k6kRMK8B7n5NY8m2kzVRLaZgNnIhRzih6F+2qwQ4P2t9FN67BEiHosOU8/TUDTKaJ4IyNLvc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJWFMFa4IJUqtCtuPsjq/apQKpqRUXFPe6Ty8CUhzty8Nkq88m
	oEgjoni9XSUCajtpDsHTbdOg5FmOq9lcGCLMLe38+9RRNricUfZqhTM6yZ/wgr55VpaGhe+kG16
	veGy7aIzub/HHbDSb+VTCIUeFuggOo5JJfSETUzv2nQ==
X-Gm-Gg: AR+sD13rWTyL0VMGNJhICQM/yy4wygCPzgRCpcKhKDgAMXM6/v1t/ZeJolRYi0RMhUG
	zLsyjwCYCvpB9gTSdMe3Xj+lRl28dpGK0fOQrIkffwiUpOVI3g8eFmSobMsh8WjTRKRrUDpcUza
	g03doFGCbxo7fNfQbk5zwGGtF9ZNReeo7YtiiAOZXIN7FgQeNBKd5Ey2Vj7mqigQr4aYyIythzX
	FJlrhVrvbDKg6JamfY3rvdwce5+5eZS0jg6Rd+j9LnUPE9Po4aO0S4kp9dS4j9eBRYCdGo5z718
	Yn8X6CIgpNXpkP79xxjiyrBsr9l6hhvvkPAoXtmji2Kv9WFWPD4sF6zL/53+7KUx4+naGvmsX8H
	6NAwlbrQT+2nIAL3RAWeJsHievEl3gHyoiyIh5398SyEaUikUJMq9hWlnYZBsXsU=
X-Received: by 2002:a05:6000:2c02:b0:47f:943a:a7f4 with SMTP id
 ffacd0b85a97d-47fb1f394f0mr7650941f8f.61.1785329715783; Wed, 29 Jul 2026
 05:55:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260713010302.303278-1-inochiama@gmail.com> <20260713010302.303278-5-inochiama@gmail.com>
In-Reply-To: <20260713010302.303278-5-inochiama@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 29 Jul 2026 18:25:03 +0530
X-Gm-Features: AUfX_mxv121yOdqBUy-IfBL_rS6019wk0oWYQDNGGYd0xvvVBh_Vr-_qG7KdmHE
Message-ID: <CAAhSdy0fwA3V_CKdJJ9tr7uHyBXD9QjehTfyyz_S87sSRSpMQw@mail.gmail.com>
Subject: Re: [PATCH v6 4/8] RISC-V: KVM: Add ssp context save/restore
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Atish Patra <atish.patra@linux.dev>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Andy Chiu <andybnac@gmail.com>, 
	Charlie Jenkins <charlie@rivosinc.com>, Deepak Gupta <debug@rivosinc.com>, 
	Thomas Huth <thuth@redhat.com>, Sergey Matyukevich <geomatsi@gmail.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 13, 2026 at 6:34=E2=80=AFAM Inochi Amaoto <inochiama@gmail.com>=
 wrote:
>
> Add ssp context save/restore for guest VCPUs and also add it to the
> ONE_REG interface to allow its access from user space.
>
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Thanks,
Anup

> ---
>  arch/riscv/include/asm/kvm_host.h |  7 ++++
>  arch/riscv/include/uapi/asm/kvm.h |  8 ++++
>  arch/riscv/kvm/vcpu.c             |  7 ++++
>  arch/riscv/kvm/vcpu_onereg.c      | 68 ++++++++++++++++++++++++++++++-
>  4 files changed, 88 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/k=
vm_host.h
> index 60017ceec9d2..e5ed3b0e5a55 100644
> --- a/arch/riscv/include/asm/kvm_host.h
> +++ b/arch/riscv/include/asm/kvm_host.h
> @@ -163,6 +163,10 @@ struct kvm_vcpu_smstateen_csr {
>         unsigned long sstateen0;
>  };
>
> +struct kvm_vcpu_zicfiss_csr {
> +       unsigned long ssp;
> +};
> +
>  struct kvm_vcpu_reset_state {
>         spinlock_t lock;
>         unsigned long pc;
> @@ -203,6 +207,9 @@ struct kvm_vcpu_arch {
>         /* CPU Smstateen CSR context of Guest VCPU */
>         struct kvm_vcpu_smstateen_csr smstateen_csr;
>
> +       /* CPU Zicfiss CSR context of Guest VCPU */
> +       struct kvm_vcpu_zicfiss_csr zicfiss_csr;
> +
>         /* CPU reset state of Guest VCPU */
>         struct kvm_vcpu_reset_state reset_state;
>
> diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/=
asm/kvm.h
> index a27de850fa4c..fd4c81697617 100644
> --- a/arch/riscv/include/uapi/asm/kvm.h
> +++ b/arch/riscv/include/uapi/asm/kvm.h
> @@ -102,6 +102,11 @@ struct kvm_riscv_smstateen_csr {
>         unsigned long sstateen0;
>  };
>
> +/* Zicfiss CSR for KVM_GET_ONE_REG and KVM_SET_ONE_REG */
> +struct kvm_riscv_zicfiss_csr {
> +       unsigned long ssp;
> +};
> +
>  /* TIMER registers for KVM_GET_ONE_REG and KVM_SET_ONE_REG */
>  struct kvm_riscv_timer {
>         __u64 frequency;
> @@ -266,12 +271,15 @@ struct kvm_riscv_sbi_fwft {
>  #define KVM_REG_RISCV_CSR_GENERAL      (0x0 << KVM_REG_RISCV_SUBTYPE_SHI=
FT)
>  #define KVM_REG_RISCV_CSR_AIA          (0x1 << KVM_REG_RISCV_SUBTYPE_SHI=
FT)
>  #define KVM_REG_RISCV_CSR_SMSTATEEN    (0x2 << KVM_REG_RISCV_SUBTYPE_SHI=
FT)
> +#define KVM_REG_RISCV_CSR_ZICFISS      (0x3 << KVM_REG_RISCV_SUBTYPE_SHI=
FT)
>  #define KVM_REG_RISCV_CSR_REG(name)    \
>                 (offsetof(struct kvm_riscv_csr, name) / sizeof(unsigned l=
ong))
>  #define KVM_REG_RISCV_CSR_AIA_REG(name)        \
>         (offsetof(struct kvm_riscv_aia_csr, name) / sizeof(unsigned long)=
)
>  #define KVM_REG_RISCV_CSR_SMSTATEEN_REG(name)  \
>         (offsetof(struct kvm_riscv_smstateen_csr, name) / sizeof(unsigned=
 long))
> +#define KVM_REG_RISCV_CSR_ZICFISS_REG(name)  \
> +       (offsetof(struct kvm_riscv_zicfiss_csr, name) / sizeof(unsigned l=
ong))
>
>  /* Timer registers are mapped as type 4 */
>  #define KVM_REG_RISCV_TIMER            (0x04 << KVM_REG_RISCV_TYPE_SHIFT=
)
> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index cf6e231e76e2..acdb12fcdb69 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -63,6 +63,7 @@ static void kvm_riscv_vcpu_context_reset(struct kvm_vcp=
u *vcpu,
>         memset(cntx, 0, sizeof(*cntx));
>         memset(csr, 0, sizeof(*csr));
>         memset(&vcpu->arch.smstateen_csr, 0, sizeof(vcpu->arch.smstateen_=
csr));
> +       memset(&vcpu->arch.zicfiss_csr, 0, sizeof(vcpu->arch.zicfiss_csr)=
);
>
>         /* Restore datap as it's not a part of the guest context. */
>         cntx->vector.datap =3D vector_datap;
> @@ -720,6 +721,7 @@ static void kvm_riscv_update_hvip(struct kvm_vcpu *vc=
pu)
>
>  static __always_inline void kvm_riscv_vcpu_swap_in_guest_state(struct kv=
m_vcpu *vcpu)
>  {
> +       struct kvm_vcpu_zicfiss_csr *zicficsr =3D &vcpu->arch.zicfiss_csr=
;
>         struct kvm_vcpu_smstateen_csr *smcsr =3D &vcpu->arch.smstateen_cs=
r;
>         struct kvm_vcpu_csr *csr =3D &vcpu->arch.guest_csr;
>
> @@ -727,10 +729,13 @@ static __always_inline void kvm_riscv_vcpu_swap_in_=
guest_state(struct kvm_vcpu *
>         vcpu->arch.host_senvcfg =3D csr_swap(CSR_SENVCFG, csr->senvcfg);
>         if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SMSTATEEN))
>                 vcpu->arch.host_sstateen0 =3D csr_swap(CSR_SSTATEEN0, smc=
sr->sstateen0);
> +       if (riscv_has_extension_unlikely(RISCV_ISA_EXT_ZICFISS))
> +               csr_write(CSR_SSP, zicficsr->ssp);
>  }
>
>  static __always_inline void kvm_riscv_vcpu_swap_in_host_state(struct kvm=
_vcpu *vcpu)
>  {
> +       struct kvm_vcpu_zicfiss_csr *zicficsr =3D &vcpu->arch.zicfiss_csr=
;
>         struct kvm_vcpu_smstateen_csr *smcsr =3D &vcpu->arch.smstateen_cs=
r;
>         struct kvm_vcpu_csr *csr =3D &vcpu->arch.guest_csr;
>
> @@ -738,6 +743,8 @@ static __always_inline void kvm_riscv_vcpu_swap_in_ho=
st_state(struct kvm_vcpu *v
>         csr->senvcfg =3D csr_swap(CSR_SENVCFG, vcpu->arch.host_senvcfg);
>         if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SMSTATEEN))
>                 smcsr->sstateen0 =3D csr_swap(CSR_SSTATEEN0, vcpu->arch.h=
ost_sstateen0);
> +       if (riscv_has_extension_unlikely(RISCV_ISA_EXT_ZICFISS))
> +               zicficsr->ssp =3D csr_swap(CSR_SSP, 0);
>  }
>
>  /*
> diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
> index bb920e8923c9..dd9519438546 100644
> --- a/arch/riscv/kvm/vcpu_onereg.c
> +++ b/arch/riscv/kvm/vcpu_onereg.c
> @@ -355,6 +355,44 @@ static int kvm_riscv_vcpu_smstateen_get_csr(struct k=
vm_vcpu *vcpu,
>         return 0;
>  }
>
> +static inline int kvm_riscv_vcpu_zicfiss_set_csr(struct kvm_vcpu *vcpu,
> +                                                unsigned long reg_num,
> +                                                unsigned long reg_val)
> +{
> +       struct kvm_vcpu_zicfiss_csr *csr =3D &vcpu->arch.zicfiss_csr;
> +       unsigned long regs_max =3D sizeof(struct kvm_vcpu_zicfiss_csr) /
> +               sizeof(unsigned long);
> +
> +       if (!riscv_isa_extension_available(vcpu->arch.isa, ZICFISS))
> +               return -ENOENT;
> +       if (reg_num >=3D regs_max)
> +               return -ENOENT;
> +
> +       reg_num =3D array_index_nospec(reg_num, regs_max);
> +
> +       ((unsigned long *)csr)[reg_num] =3D reg_val;
> +       return 0;
> +}
> +
> +static int kvm_riscv_vcpu_zicfiss_get_csr(struct kvm_vcpu *vcpu,
> +                                         unsigned long reg_num,
> +                                         unsigned long *out_val)
> +{
> +       struct kvm_vcpu_zicfiss_csr *csr =3D &vcpu->arch.zicfiss_csr;
> +       unsigned long regs_max =3D sizeof(struct kvm_vcpu_zicfiss_csr) /
> +               sizeof(unsigned long);
> +
> +       if (!riscv_isa_extension_available(vcpu->arch.isa, ZICFISS))
> +               return -ENOENT;
> +       if (reg_num >=3D regs_max)
> +               return -ENOENT;
> +
> +       reg_num =3D array_index_nospec(reg_num, regs_max);
> +
> +       *out_val =3D ((unsigned long *)csr)[reg_num];
> +       return 0;
> +}
> +
>  static int kvm_riscv_vcpu_get_reg_csr(struct kvm_vcpu *vcpu,
>                                       const struct kvm_one_reg *reg)
>  {
> @@ -381,6 +419,9 @@ static int kvm_riscv_vcpu_get_reg_csr(struct kvm_vcpu=
 *vcpu,
>         case KVM_REG_RISCV_CSR_SMSTATEEN:
>                 rc =3D kvm_riscv_vcpu_smstateen_get_csr(vcpu, reg_num, &r=
eg_val);
>                 break;
> +       case KVM_REG_RISCV_CSR_ZICFISS:
> +               rc =3D kvm_riscv_vcpu_zicfiss_get_csr(vcpu, reg_num, &reg=
_val);
> +               break;
>         default:
>                 rc =3D -ENOENT;
>                 break;
> @@ -423,6 +464,9 @@ static int kvm_riscv_vcpu_set_reg_csr(struct kvm_vcpu=
 *vcpu,
>         case KVM_REG_RISCV_CSR_SMSTATEEN:
>                 rc =3D kvm_riscv_vcpu_smstateen_set_csr(vcpu, reg_num, re=
g_val);
>                 break;
> +       case KVM_REG_RISCV_CSR_ZICFISS:
> +               rc =3D kvm_riscv_vcpu_zicfiss_set_csr(vcpu, reg_num, reg_=
val);
> +               break;
>         default:
>                 rc =3D -ENOENT;
>                 break;
> @@ -680,6 +724,8 @@ static inline unsigned long num_csr_regs(const struct=
 kvm_vcpu *vcpu)
>                 n +=3D sizeof(struct kvm_riscv_aia_csr) / sizeof(unsigned=
 long);
>         if (riscv_isa_extension_available(vcpu->arch.isa, SMSTATEEN))
>                 n +=3D sizeof(struct kvm_riscv_smstateen_csr) / sizeof(un=
signed long);
> +       if (riscv_isa_extension_available(vcpu->arch.isa, ZICFISS))
> +               n +=3D sizeof(struct kvm_riscv_zicfiss_csr) / sizeof(unsi=
gned long);
>
>         return n;
>  }
> @@ -688,7 +734,7 @@ static int copy_csr_reg_indices(const struct kvm_vcpu=
 *vcpu,
>                                 u64 __user *uindices)
>  {
>         int n1 =3D sizeof(struct kvm_riscv_csr) / sizeof(unsigned long);
> -       int n2 =3D 0, n3 =3D 0;
> +       int n2 =3D 0, n3 =3D 0, n4 =3D 0;
>
>         /* copy general csr regs */
>         for (int i =3D 0; i < n1; i++) {
> @@ -740,7 +786,25 @@ static int copy_csr_reg_indices(const struct kvm_vcp=
u *vcpu,
>                 }
>         }
>
> -       return n1 + n2 + n3;
> +       /* copy Zicfiss csr regs */
> +       if (riscv_isa_extension_available(vcpu->arch.isa, ZICFISS)) {
> +               n4 =3D sizeof(struct kvm_riscv_zicfiss_csr) / sizeof(unsi=
gned long);
> +
> +               for (int i =3D 0; i < n4; i++) {
> +                       u64 size =3D IS_ENABLED(CONFIG_32BIT) ?
> +                                  KVM_REG_SIZE_U32 : KVM_REG_SIZE_U64;
> +                       u64 reg =3D KVM_REG_RISCV | size | KVM_REG_RISCV_=
CSR |
> +                                         KVM_REG_RISCV_CSR_ZICFISS | i;
> +
> +                       if (uindices) {
> +                               if (put_user(reg, uindices))
> +                                       return -EFAULT;
> +                               uindices++;
> +                       }
> +               }
> +       }
> +
> +       return n1 + n2 + n3 + n4;
>  }
>
>  static inline unsigned long num_timer_regs(void)
> --
> 2.55.0
>
