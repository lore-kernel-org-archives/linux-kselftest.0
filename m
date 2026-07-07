Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5726E3AE6E5
	for <linux-kselftest@vger.kernel.org>; Tue,  7 Jul 2026 07:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783410254; cv=pass; b=ZqB9vi3SoBR9sMoPLyQd/X6bTsQ55k/qPqDuaQQZSJpY0Dhw7+XFGFWvK9iCOeolgmPLXgLOwJFy9FQSW8MtOSiK3qgVS8QaYplMZT05NbNd72B44cp01QGG6XaEMhZLKGJq7a2tCalAng0X7WEdI8zqclNKaF9kraEZmCCDA6M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783410254; c=relaxed/simple;
	bh=RlysqtgXblZkBhQ9adOHLuUXIGVw3CfVa6vQlz7qP5E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N33RBR3dBIlF7Bq0H0JDum7D0WpZKN/Boa0xmEkojKUT9bgH7B1nNnaSh9dfqCUg6sDnN5TCnFKB/ld3rDLXhCZjitYsNrAidanDFtHewuE7BVgRw9qrq98eCSzfQIcjM8LmhrtJiHZ1S3O8I5LkiSQBErZSEX+HLfdXXQl9oys=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org; spf=none smtp.mailfrom=brainfault.org; dkim=pass (2048-bit key) header.d=brainfault-org.20251104.gappssmtp.com header.i=@brainfault-org.20251104.gappssmtp.com header.b=v8MNI8CI; arc=pass smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault-org.20251104.gappssmtp.com header.i=@brainfault-org.20251104.gappssmtp.com header.b="v8MNI8CI"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-493c00f74baso23936015e9.0
        for <linux-kselftest@vger.kernel.org>; Tue, 07 Jul 2026 00:44:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783410251; cv=none;
        d=google.com; s=arc-20260327;
        b=Ge/MkGifQzqAi1oYmvLjT1fszLfirqKetJsWuCZNBvSzY5ru7EDb25sZzi9LFWQX+0
         mulgBvWSZzYIRThOR5BZBNsC/uvV+AX0KBTyzo5aKSFQd3Etyy6tfcT7LZabYaPHzvxI
         3Xn7SlgAdaCTZXgHTYAQtduRZXRT5jZPM3W5OigtR8vJCtfO4ZrUAKugqgmx0KKlX+K4
         4Br0e8Rl/h+h9rkWUixTza3iokMRffDND252C0MK0OPtJoXko3BeC0SpRN3yUUOcFjhw
         AOzmA3/MoXkRo8j20tnor/soW6Yx65OuaCxOhqy8A5JQE6f9J83S/q2mpUofHvjP+m8v
         pbtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vv2Den0YhG1W1a/jXh+Ffx3hTXGA8/cBXV3TkYxGd2s=;
        fh=0r2pqr9L496xpk1NPiGslMowQh5+FYGp5IS+YAxny94=;
        b=avFf31pivANJwzqtZ4fnOTY6e45E38PnekgrOx5gTcb02rlWcGOqGoV3WI2E91pbWb
         XqVBDPtvQzBrtZr9wH+/lhLs3EJJA5WBBh1biAKhE2fYWDdqzXMzvik4SIjbmlxoaF/F
         u+AVB3FfNv36WnHYsXkV+VCdKCxEtx9wiHkeyuuyjGzuD8cpaXALQLGWGK3LoRYAPXdV
         MA6y1oxHJan1+QbAD3PmGAeMFE3Ea5xuJkRnxdLi03IrXYumLDwP+sIXj6kw5x2QRmmb
         aVZudZaCS/+e8qS712px4g6cTVkAdXbWDdzH0+Qr/qhWkCZrCX1YD63I2rbeTFAlNruQ
         cXmg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1783410251; x=1784015051; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vv2Den0YhG1W1a/jXh+Ffx3hTXGA8/cBXV3TkYxGd2s=;
        b=v8MNI8CIQTl2VNSo/Fy1VgPVMhzx5ZtVqGRJIQR2WZh9S69nTbppdcgDS8SQhjxy0I
         Gmky2L3n2wViRff/1iim4W7FdzzL1r0IsROVrIPKLPVsOCNm/q/uu5p2GUOGiBMmcMMS
         fQHQUapIuXi3DFgNJAx0+1U1XRJ6QFFQ7DFrh2tCAcPRYXwimann1q5uPZiuNm51N7Ty
         6E9g/WIpbjrLg2TF1dWB3QH8dWtI6OIQQsVrbfwNEfD6zEEl2V/73SpgwT/Yns7h8TGQ
         XIhv7oPne6xzEPYS9N8dc4LNh9ibvDzThFJafZwea2mnleOT3/njUn/xJjCzjuJcUDNV
         Ii4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783410251; x=1784015051;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vv2Den0YhG1W1a/jXh+Ffx3hTXGA8/cBXV3TkYxGd2s=;
        b=K/vpDkpA2NciED7CjaUZqXIVQTK539ZyX/GBPm5RwvcOxmwEGlsaB4OkKzBeKy2JW6
         l4Vv3gBli+CApVvHFzMH+OKsX06N0iR+0FBlJ6dJJriLnXLAyscQa9GMi6spo85LEvha
         T4OMWO3lEhYAlK3MTz8xDVuav6CIYu5QAHvjn0WX9xyOS+3COhXJ7BkSSXnRnSAklEiY
         6sV9J1D6T56WFywpqvcx4Gp4fhKas5vjXttUT5i/7T5jIrLlasmsUVbp1jPq7cShu/zR
         aY1vpfHVLEqRrKQ2fTbuQWgxGsCCIqbZkVK+L358AdEqYf+cxDDoXNBU2kOP2d09pQzS
         q+6g==
X-Forwarded-Encrypted: i=1; AHgh+RoR9tVaLTPoYXcFzUHRt5wzsFnzq/klreFWT7KCkcybtVrNydi53ILQVw/80jPgHsDOhKJlUDoUzhRzAc1uGNQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywh/1fSSJXo/Y3DinULaMqHsKjwuKM9RZNS2Gkov91R/f6PRvFd
	49/LWjNH81p501yYUGCF+Ws2vCrUWFxWzT0BSckLaEwP2aZ/nely5FLFayVH4yfS0FtI1NNclpM
	0lbbulDTtbfnb85RjseHPjai9E4smbL6c23R+Y9BlIA==
X-Gm-Gg: AfdE7ckK5tzkVSgSJctyO4QYp56jKPxsp+9J1U6nvfQ4WIjIzDQohQaLhnSdbbjH/D4
	uuGLegnZ1kri9x2Xq3I9OrHFzxUmKPaV+EdOBccGKRIkjDJ40imKST0W0Wqj8kP41pOAYqnBu8Z
	TqW95JR4sa/luBbs+yS0YbKbqbjV+OTEzzHVFva4P7ycWHR9g3SJ53grZ1o2Xx9FP9m/KNMpAMo
	Ddqxgs4sJMVpyLNOCn5aqeyhGEMlEDENYy4HdCIH4k//Dbp9tTT1CWjlkdrt4VFy6XVSFt+rxrW
	QEPwpb859dzlwXO6T9zWnJmf6H2Mh+0PxvZLRAhCWBMRJlcdinj3aXC4CwdLJZC791D+xODJ3Wl
	BecuOSy2fHxOCSfyeRWzUS/M/qQ==
X-Received: by 2002:a05:600c:3e19:b0:490:5057:f5f7 with SMTP id
 5b1f17b1804b1-493df08ba2dmr38413535e9.11.1783410250515; Tue, 07 Jul 2026
 00:44:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260706022046.214956-1-inochiama@gmail.com> <20260706022046.214956-2-inochiama@gmail.com>
 <akxm_sT7R9u4OIXo@inochi.infowork>
In-Reply-To: <akxm_sT7R9u4OIXo@inochi.infowork>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 7 Jul 2026 13:13:58 +0530
X-Gm-Features: AVVi8CdAbCSVwzWnyKUTkhwaRsg0E1mft2P8fRkO5Uf7DAxOupq0MJNEfLWnnTo
Message-ID: <CAAhSdy3uPsYQUm5S+XHmAHunxB3M999GxNyM0Yj=9wakAVW=KA@mail.gmail.com>
Subject: Re: [PATCH v5 1/8] RISC-V: KVM: Add support for Svadu FWFT features
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Atish Patra <atish.patra@linux.dev>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Charlie Jenkins <charlie@rivosinc.com>, 
	Sergey Matyukevich <geomatsi@gmail.com>, Thomas Huth <thuth@redhat.com>, Deepak Gupta <debug@rivosinc.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-kselftest@vger.kernel.org, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>, Quan Zhou <zhouquan@iscas.ac.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 7, 2026 at 8:16=E2=80=AFAM Inochi Amaoto <inochiama@gmail.com> =
wrote:
>
> On Mon, Jul 06, 2026 at 10:20:37AM +0800, Inochi Amaoto wrote:
> > Hardware updating of PTE A/D bits is controlled through ADUE bit in
> > henvcfg Expose the feature only if both Svadu and Svade are supported
> > for VS-mode.
> >
> > Allow the VMM to enable/disable this feature by change the ISA
> > extension state in the guest.
> >
> > Assisted-by: YuanSheng:claude-4.7-opus
> > Co-developed-by: Quan Zhou <zhouquan@iscas.ac.cn>
> > Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >  arch/riscv/include/uapi/asm/kvm.h |  1 +
> >  arch/riscv/kvm/vcpu_sbi_fwft.c    | 77 +++++++++++++++++++++++++++++++
> >  2 files changed, 78 insertions(+)
> >
> > diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uap=
i/asm/kvm.h
> > index 504e73305343..7bbea8812d92 100644
> > --- a/arch/riscv/include/uapi/asm/kvm.h
> > +++ b/arch/riscv/include/uapi/asm/kvm.h
> > @@ -240,6 +240,7 @@ struct kvm_riscv_sbi_fwft_feature {
> >  struct kvm_riscv_sbi_fwft {
> >       struct kvm_riscv_sbi_fwft_feature misaligned_deleg;
> >       struct kvm_riscv_sbi_fwft_feature pointer_masking;
> > +     struct kvm_riscv_sbi_fwft_feature pte_ad_hw_updating;
> >  };
> >
> >  /* If you need to interpret the index values, here is the key: */
> > diff --git a/arch/riscv/kvm/vcpu_sbi_fwft.c b/arch/riscv/kvm/vcpu_sbi_f=
wft.c
> > index ab39ac464ffd..01db40b53295 100644
> > --- a/arch/riscv/kvm/vcpu_sbi_fwft.c
> > +++ b/arch/riscv/kvm/vcpu_sbi_fwft.c
> > @@ -11,6 +11,7 @@
> >  #include <linux/kvm_host.h>
> >  #include <asm/cpufeature.h>
> >  #include <asm/sbi.h>
> > +#include <asm/kvm_nacl.h>
> >  #include <asm/kvm_vcpu_sbi.h>
> >  #include <asm/kvm_vcpu_sbi_fwft.h>
> >
> > @@ -94,6 +95,45 @@ static bool kvm_fwft_is_defined_feature(enum sbi_fwf=
t_feature_t feature)
> >       return false;
> >  }
> >
> > +static void kvm_sbi_fwft_env_flag_reset_helper(struct kvm_vcpu *vcpu,
> > +                                            u64 flag)
> > +{
> > +     vcpu->arch.cfg.henvcfg &=3D ~flag;
> > +}
> > +
> > +static long kvm_sbi_fwft_env_flag_set_helper(struct kvm_vcpu *vcpu,
> > +                                          struct kvm_sbi_fwft_config *=
conf,
> > +                                          bool one_reg_access,
> > +                                          unsigned long value, u64 fla=
g)
> > +{
> > +     struct kvm_vcpu_config *cfg =3D &vcpu->arch.cfg;
> > +
> > +     if (value =3D=3D 0)
> > +             cfg->henvcfg &=3D ~flag;
> > +     else if (value =3D=3D 1)
> > +             cfg->henvcfg |=3D flag;
> > +     else
> > +             return SBI_ERR_INVALID_PARAM;
> > +
> > +     if (!one_reg_access) {
> > +             ncsr_write(CSR_HENVCFG, vcpu->arch.cfg.henvcfg);
> > +             if (IS_ENABLED(CONFIG_32BIT))
> > +                     ncsr_write(CSR_HENVCFGH, vcpu->arch.cfg.henvcfg >=
> 32);
> > +     }
> > +
> > +     return SBI_SUCCESS;
> > +}
> > +
>
> Hi, Anup,
>
> The sashiko bot point out calling NACL helper is not safe here as
> preemption is not allowed when calling this_cpu_ptr() and it is
> used by the NACL helper. Since I have no idea about how to fix it,
> is it acceptable to use csr read/write directly here as other FWFT
> feature?

I think its okay use regular csr_read/write() over here because FWFT
calls are not in hotpath so it won't have much impact on nested
virtualization performance.

Regards,
Anup

>
> Regards,
> Inochi
>
>
> The original reply from the bot is
>
> Is it safe to call ncsr_write() here without preemption disabled?
>
> KVM handles SBI ecalls with preemption enabled. The ncsr_write() macro
> evaluates nacl_shmem(), which relies on this_cpu_ptr(). Using this_cpu_pt=
r()
> with preemption enabled will trigger a CONFIG_DEBUG_PREEMPT warning.
>
> Could the thread be migrated to another CPU after computing the pointer b=
ut
> before writing to it, resulting in per-CPU memory corruption by writing t=
o
> the NACL shared memory of another physical CPU?
>
> Additionally, when NACL is disabled, it falls back to csr_write(), which
> writes directly to the physical CPU's host CSRs (CSR_HENVCFG). Could this
> leave the host with modified hardware state if the vCPU thread migrates?
>
>
> > +static long kvm_sbi_fwft_env_flag_get_helper(struct kvm_vcpu *vcpu,
> > +                                          struct kvm_sbi_fwft_config *=
conf,
> > +                                          bool one_reg_access,
> > +                                          unsigned long *value, u64 fl=
ag)
> > +{
> > +     *value =3D (vcpu->arch.cfg.henvcfg & flag) =3D=3D flag;
> > +
> > +     return SBI_SUCCESS;
> > +}
> > +
> >  static bool kvm_sbi_fwft_misaligned_delegation_supported(struct kvm_vc=
pu *vcpu)
> >  {
> >       return misaligned_traps_can_delegate();
> > @@ -137,6 +177,34 @@ static long kvm_sbi_fwft_get_misaligned_delegation=
(struct kvm_vcpu *vcpu,
> >       return SBI_SUCCESS;
> >  }
> >
> > +static bool kvm_sbi_fwft_pte_ad_hw_updating_supported(struct kvm_vcpu =
*vcpu)
> > +{
> > +     return riscv_isa_extension_available(vcpu->arch.isa, SVADU) &&
> > +             riscv_isa_extension_available(vcpu->arch.isa, SVADE);
> > +}
> > +
> > +static void kvm_sbi_fwft_reset_pte_ad_hw_updating(struct kvm_vcpu *vcp=
u)
> > +{
> > +     if (kvm_sbi_fwft_pte_ad_hw_updating_supported(vcpu))
> > +             kvm_sbi_fwft_env_flag_reset_helper(vcpu, ENVCFG_ADUE);
> > +}
> > +
> > +static long kvm_sbi_fwft_set_pte_ad_hw_updating(struct kvm_vcpu *vcpu,
> > +                                             struct kvm_sbi_fwft_confi=
g *conf,
> > +                                             bool one_reg_access, unsi=
gned long value)
> > +{
> > +     return kvm_sbi_fwft_env_flag_set_helper(vcpu, conf, one_reg_acces=
s,
> > +                                             value, ENVCFG_ADUE);
> > +}
> > +
> > +static long kvm_sbi_fwft_get_pte_ad_hw_updating(struct kvm_vcpu *vcpu,
> > +                                             struct kvm_sbi_fwft_confi=
g *conf,
> > +                                             bool one_reg_access, unsi=
gned long *value)
> > +{
> > +     return kvm_sbi_fwft_env_flag_get_helper(vcpu, conf, one_reg_acces=
s,
> > +                                             value, ENVCFG_ADUE);
> > +}
> > +
> >  #ifndef CONFIG_32BIT
> >
> >  static bool try_to_set_pmm(unsigned long value)
> > @@ -246,6 +314,15 @@ static const struct kvm_sbi_fwft_feature features[=
] =3D {
> >               .set =3D kvm_sbi_fwft_set_misaligned_delegation,
> >               .get =3D kvm_sbi_fwft_get_misaligned_delegation,
> >       },
> > +     {
> > +             .id =3D SBI_FWFT_PTE_AD_HW_UPDATING,
> > +             .first_reg_num =3D offsetof(struct kvm_riscv_sbi_fwft, pt=
e_ad_hw_updating.enable) /
> > +                              sizeof(unsigned long),
> > +             .supported =3D kvm_sbi_fwft_pte_ad_hw_updating_supported,
> > +             .reset =3D kvm_sbi_fwft_reset_pte_ad_hw_updating,
> > +             .set =3D kvm_sbi_fwft_set_pte_ad_hw_updating,
> > +             .get =3D kvm_sbi_fwft_get_pte_ad_hw_updating,
> > +     },
> >  #ifndef CONFIG_32BIT
> >       {
> >               .id =3D SBI_FWFT_POINTER_MASKING_PMLEN,
> > --
> > 2.55.0
> >
