Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A33937754B
	for <linux-kselftest@vger.kernel.org>; Wed, 29 Jul 2026 13:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785330618; cv=pass; b=axMikqgYItLq/5QtzVytRRc3dZ0/5oRDW6V7169pd5u4Gv8V3CfXdO1+BBXMLjtrHHevtWZGkZkfIUdkDG7emOx1ca+FKkl4DvXmt7POZ8PD8lmqE6u8gqZ+2KSLOjq/CjrgYiS4pkcx6BXBpThySDr4Wry4EqUlJer/uC19xUo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785330618; c=relaxed/simple;
	bh=HQMamYzrjc3kdo4OIOaw5dT7zfL51Msc3DUcmqn9HOc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i6Um+bnCSnnIAGiSsrHA3vJNFcK6/MEY/pwXmFGgxpQ1uu7q4DyDPnyv3/L04e/2uhlQpw73IYSvcDxTYI4oTR2hi1kHaeGXrcJu7ljssVNoC4EOVyH8sdJwPh/dg3n8sHJs+/8K41R3Qcj8K2fD1+K00FOsTwwzVp1Yb1vO0gs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org; spf=none smtp.mailfrom=brainfault.org; dkim=pass (2048-bit key) header.d=brainfault-org.20251104.gappssmtp.com header.i=@brainfault-org.20251104.gappssmtp.com header.b=a6hfJ3s9; arc=pass smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault-org.20251104.gappssmtp.com header.i=@brainfault-org.20251104.gappssmtp.com header.b="a6hfJ3s9"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-47de0093c42so751784f8f.3
        for <linux-kselftest@vger.kernel.org>; Wed, 29 Jul 2026 06:10:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785330615; cv=none;
        d=google.com; s=arc-20260327;
        b=I/6xmMleSZ31G0QrTu+mR9wJPTYMl6ps4uAYjWkfUVJhjq0Z9+WXCeOvnTuZTm7V3K
         +9l0E+w9tKxQSP/CwPYmKwg/9R0p5hxsSbNbEL5T0llgUx34oUAuU91IYgszdK+qa91t
         OB1A5N2rbPBWSwraaNYmLm870uWAb39Dx2KrhjPS4eClW+fWu+TXEsuq81G97DO8Qpeo
         l3yCjUS7XkhsDxxPO8XMxGjRPNjzN7PkwVFgZIyIjpuGCUqqhTE2IYC7TogB1tuMLUgu
         fQA/g55+ZyHZhmzQigrH97aKO2orS6fS4IRwzCVCMgCciBNstf1U+/0TdSFN5kp9WFZY
         /B7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KlahTC06J1bekMd44QG1g3xZUKIEUfQuaHqFpAEocdM=;
        fh=27rvzQIZXbIvbnH3j+vi9DOx9rI1AEuAFbJGzaveiV8=;
        b=FAYVXS5UpVrEFVk0EsJYTN7q5j2ufOiBzS9G8E/55Ww5EggjG8VIQFWKLJyMmLM2po
         If/37PqrfHfwIAclnIeU+Mr5ZtA4SsyagWAramFWQcb2AeIQl4MpRhyiv8kVvju3qEtd
         dphqpwysHFyVpbAxPfV+jN7MGhbPvnD1v8tBEH4OEiMn4i+U5Xl5PHTVZBCwRyRF/t1y
         hSKkvZbgrTk1ZIPEhxx9tD9F8XiWT+VmPHBhBIzFtdpY3NH4dYZPHM8ztfdn1Ja476HY
         AgIfNEKEBQp2yheWipAYS9923drfJcGmyRDpKv4S1xKzTy5McO1tmAvzucrq0eiu0oHt
         DZAw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1785330615; x=1785935415; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KlahTC06J1bekMd44QG1g3xZUKIEUfQuaHqFpAEocdM=;
        b=a6hfJ3s9chuvyxaRe44B66WI93pH2lAfcOOu5pAwJc6xZ37QD6Kls1Bf+pN19uhr+M
         FDc4Kh/fZn+6boa6eCtmnyUZlVIgXizkZ9LtQlaOLu5ch0RvFuKMPAJt3DoKDJ/Cvxr3
         OHmBiqjapMBx3ylmtGMbFBV7vli6Puw2bYdVfKMnzBpfWY4/GK3YMYi7FqxsiEv7LlG6
         CEyUM6Ix9szc+hxxbLWfAm6qacGzhaTV1JYNlW/8fEB06fqDU+PqyXmupFQP8O5UM9N4
         r7TLUP7HHc875mhC9N0V8t7HgGvma1K0uZJ1PmAl8q8cid07xeS3SYE5wwRNS5WzzaQl
         bU/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785330615; x=1785935415;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KlahTC06J1bekMd44QG1g3xZUKIEUfQuaHqFpAEocdM=;
        b=F62embjaYSfo3qwgBGhNGNfyGoWOM9bTOZEIFCmx4fUU5MH8XT/k+VvfZp17MSP5DG
         ffFulGOqSFOfU9v+zkaXWlNGqU7cK9N2foN8PYEjEbjZe57pb4AuRI8Ii0bIIcoAfLsz
         o8/1o8pCIFOBSgjPD3i6HpIppry6To1JoBWPP8R+Dd+WwLCWc1mxE/YqqVzlEuWZhCRx
         De8x8xZBpGNj4YtYZMYxE6m22kvILzahNkLcQYgIIBAwJ4imxpUetVEWmUtBin6wYcTG
         mpbMy4U8Nvj+7oNNr+JnmyansmpvuFIrTxwmYkWZV0AwxDy45YWTxD9GPfUTMAj6EhsJ
         nXGQ==
X-Forwarded-Encrypted: i=1; AHgh+RpcVFLUb3pDXk20ezODPY3DXN2pRiPCy4M2XmZLlcMtC5p7Jcft4pOSpph94IhQpLJlZ218wLw8Y+6cbD/pEnc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdrvJKCT41uHIxLuV4fvaZIpjyLZZ2qCdU4mWhWo1ChyD8BBw7
	rLFqfR7y/hvCmgSOWofGkmznHR0eAbqX3h9088ej0vr9NHfctysSVc5N9T3VM5avBmjUTt72m9W
	7eLKAx/qYt/7WIgDmLoi+l+OuLYe66zOYbe48TVQ6yQ==
X-Gm-Gg: AR+sD11ocaaftEhJ+rdbzenyheU4vO1FUvSC5aSHSBi+Nxy/uJ030P/1UQYSbjKWi3K
	oa+oBVeLCuEH7mJh9VYas4h74URCbXSfA9CFU95u4pybMcwlkpbnmltQKf4HM25KFb7GTdLeyoF
	3byPU+lXhPZhwsAQ1dVN9KgSgF3yotravvF33+Gqvl/HW/tk2uhC1ExjmzIekxSNjfY2pxVeHKJ
	fAAP+jYLg87Ryq2ZTL8e989J5gz5I86T3kXJDOSEmjskGgLOPf/12CLPyhQvL3UdN0eRNA6HZlq
	soN1omCN9NvtuEVnqe7lc66wMh/WiIeY5yqVgyzEaEkliW9RbP9K1cIh/R8uk+kJ3Lm6peO7yEU
	gjcRvxGnHUg/ry1X1dXd67asYUG04UpZcMnTG18gvwm2Evkbe4nwc/nPvrqP+Mow=
X-Received: by 2002:a05:6000:707:b0:47f:90df:4ec6 with SMTP id
 ffacd0b85a97d-47fb1e5ffa9mr7439787f8f.6.1785330615148; Wed, 29 Jul 2026
 06:10:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260713010302.303278-1-inochiama@gmail.com> <20260713010302.303278-8-inochiama@gmail.com>
In-Reply-To: <20260713010302.303278-8-inochiama@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 29 Jul 2026 18:40:03 +0530
X-Gm-Features: AUfX_mzDcWuxE6PkzrbfuK4rtESRLEYMRMklaBIZb-MTh6f9nimxeIEC2cIHilw
Message-ID: <CAAhSdy2P3Fgfv3t9n=wNTfBL-63k+3qaDvsG1QWxtkWTFfvWvg@mail.gmail.com>
Subject: Re: [PATCH v6 7/8] RISC-V: KVM: Add support for control-flow
 integrity FWFT features
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
> Control-flow integrity is controlled through a WARL field in henvcfg.
> Expose the feature only if the Zicfilp/Zicfiss is supported for VS-mode.
> Allow the VMM to block access to the feature by disabling the ISA
> extension in the guest.
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
>  arch/riscv/include/uapi/asm/kvm.h |   2 +
>  arch/riscv/kvm/vcpu_sbi_fwft.c    | 107 ++++++++++++++++++++++++++++++
>  2 files changed, 109 insertions(+)
>
> diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/=
asm/kvm.h
> index fd4c81697617..20d9959ca44f 100644
> --- a/arch/riscv/include/uapi/asm/kvm.h
> +++ b/arch/riscv/include/uapi/asm/kvm.h
> @@ -248,6 +248,8 @@ struct kvm_riscv_sbi_fwft {
>         struct kvm_riscv_sbi_fwft_feature misaligned_deleg;
>         struct kvm_riscv_sbi_fwft_feature pointer_masking;
>         struct kvm_riscv_sbi_fwft_feature pte_ad_hw_updating;
> +       struct kvm_riscv_sbi_fwft_feature landing_pad;
> +       struct kvm_riscv_sbi_fwft_feature shadow_stack;
>  };
>
>  /* If you need to interpret the index values, here is the key: */
> diff --git a/arch/riscv/kvm/vcpu_sbi_fwft.c b/arch/riscv/kvm/vcpu_sbi_fwf=
t.c
> index 4d474a439b29..03153fd8d15f 100644
> --- a/arch/riscv/kvm/vcpu_sbi_fwft.c
> +++ b/arch/riscv/kvm/vcpu_sbi_fwft.c
> @@ -176,6 +176,95 @@ static long kvm_sbi_fwft_get_misaligned_delegation(s=
truct kvm_vcpu *vcpu,
>         return SBI_SUCCESS;
>  }
>
> +static long kvm_sbi_fwft_set_cfi(struct kvm_vcpu *vcpu,
> +                                struct kvm_sbi_fwft_config *conf,
> +                                bool one_reg_access, unsigned long value=
,
> +                                u64 flag)
> +{
> +       struct kvm_vcpu_config *cfg =3D &vcpu->arch.cfg;
> +
> +       if (value =3D=3D 0)
> +               cfg->henvcfg &=3D ~flag;
> +       else if (value =3D=3D 1)
> +               cfg->henvcfg |=3D flag;
> +       else
> +               return SBI_ERR_INVALID_PARAM;
> +
> +       if (cfg->henvcfg & (ENVCFG_LPE | ENVCFG_SSE))
> +               cfg->hedeleg |=3D BIT(EXC_SOFTWARE_CHECK);
> +       else
> +               cfg->hedeleg &=3D ~BIT(EXC_SOFTWARE_CHECK);
> +
> +       if (!one_reg_access) {
> +               csr_write(CSR_HEDELEG, cfg->hedeleg);
> +               /*
> +                * Both Bit LPE and SSE are in the lower part, so it is s=
afe
> +                * to only write the henvcfg
> +                */
> +               csr_write(CSR_HENVCFG, vcpu->arch.cfg.henvcfg);
> +       }
> +
> +       return SBI_SUCCESS;
> +}
> +
> +static bool kvm_sbi_fwft_landing_pad_supported(struct kvm_vcpu *vcpu)
> +{
> +       return riscv_isa_extension_available(vcpu->arch.isa, ZICFILP);
> +}
> +
> +static void kvm_sbi_fwft_reset_landing_pad(struct kvm_vcpu *vcpu)
> +{
> +       struct kvm_vcpu_config *cfg =3D &vcpu->arch.cfg;
> +
> +       kvm_sbi_fwft_env_flag_reset_helper(vcpu, ENVCFG_LPE);
> +       if ((cfg->henvcfg & (ENVCFG_LPE | ENVCFG_SSE)) =3D=3D 0)
> +               cfg->hedeleg &=3D ~BIT(EXC_SOFTWARE_CHECK);
> +}
> +
> +static long kvm_sbi_fwft_set_landing_pad(struct kvm_vcpu *vcpu,
> +                                        struct kvm_sbi_fwft_config *conf=
,
> +                                        bool one_reg_access, unsigned lo=
ng value)
> +{
> +       return kvm_sbi_fwft_set_cfi(vcpu, conf, one_reg_access, value, EN=
VCFG_LPE);
> +}
> +
> +static long kvm_sbi_fwft_get_landing_pad(struct kvm_vcpu *vcpu,
> +                                        struct kvm_sbi_fwft_config *conf=
,
> +                                        bool one_reg_access, unsigned lo=
ng *value)
> +{
> +       return kvm_sbi_fwft_env_flag_get_helper(vcpu, conf, one_reg_acces=
s,
> +                                               value, ENVCFG_LPE);
> +}
> +
> +static bool kvm_sbi_fwft_shadow_stack_supported(struct kvm_vcpu *vcpu)
> +{
> +       return riscv_isa_extension_available(vcpu->arch.isa, ZICFISS);
> +}
> +
> +static void kvm_sbi_fwft_reset_shadow_stack(struct kvm_vcpu *vcpu)
> +{
> +       struct kvm_vcpu_config *cfg =3D &vcpu->arch.cfg;
> +
> +       kvm_sbi_fwft_env_flag_reset_helper(vcpu, ENVCFG_SSE);
> +       if ((cfg->henvcfg & (ENVCFG_LPE | ENVCFG_SSE)) =3D=3D 0)
> +               cfg->hedeleg &=3D ~BIT(EXC_SOFTWARE_CHECK);
> +}
> +
> +static long kvm_sbi_fwft_set_shadow_stack(struct kvm_vcpu *vcpu,
> +                                         struct kvm_sbi_fwft_config *con=
f,
> +                                         bool one_reg_access, unsigned l=
ong value)
> +{
> +       return kvm_sbi_fwft_set_cfi(vcpu, conf, one_reg_access, value, EN=
VCFG_SSE);
> +}
> +
> +static long kvm_sbi_fwft_get_shadow_stack(struct kvm_vcpu *vcpu,
> +                                         struct kvm_sbi_fwft_config *con=
f,
> +                                         bool one_reg_access, unsigned l=
ong *value)
> +{
> +       return kvm_sbi_fwft_env_flag_get_helper(vcpu, conf, one_reg_acces=
s,
> +                                               value, ENVCFG_SSE);
> +}
> +
>  static bool kvm_sbi_fwft_pte_ad_hw_updating_supported(struct kvm_vcpu *v=
cpu)
>  {
>         return riscv_isa_extension_available(vcpu->arch.isa, SVADU) &&
> @@ -313,6 +402,24 @@ static const struct kvm_sbi_fwft_feature features[] =
=3D {
>                 .set =3D kvm_sbi_fwft_set_misaligned_delegation,
>                 .get =3D kvm_sbi_fwft_get_misaligned_delegation,
>         },
> +       {
> +               .id =3D SBI_FWFT_LANDING_PAD,
> +               .first_reg_num =3D offsetof(struct kvm_riscv_sbi_fwft, la=
nding_pad.enable) /
> +                                sizeof(unsigned long),
> +               .supported =3D kvm_sbi_fwft_landing_pad_supported,
> +               .reset =3D kvm_sbi_fwft_reset_landing_pad,
> +               .set =3D kvm_sbi_fwft_set_landing_pad,
> +               .get =3D kvm_sbi_fwft_get_landing_pad,
> +       },
> +       {
> +               .id =3D SBI_FWFT_SHADOW_STACK,
> +               .first_reg_num =3D offsetof(struct kvm_riscv_sbi_fwft, sh=
adow_stack.enable) /
> +                                sizeof(unsigned long),
> +               .supported =3D kvm_sbi_fwft_shadow_stack_supported,
> +               .reset =3D kvm_sbi_fwft_reset_shadow_stack,
> +               .set =3D kvm_sbi_fwft_set_shadow_stack,
> +               .get =3D kvm_sbi_fwft_get_shadow_stack,
> +       },
>         {
>                 .id =3D SBI_FWFT_PTE_AD_HW_UPDATING,
>                 .first_reg_num =3D offsetof(struct kvm_riscv_sbi_fwft, pt=
e_ad_hw_updating.enable) /
> --
> 2.55.0
>
