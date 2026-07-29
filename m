Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EEBF4314BD
	for <linux-kselftest@vger.kernel.org>; Wed, 29 Jul 2026 13:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785330662; cv=pass; b=aALZwVklaYqBlDXUe4SYhw+40EL+GyAyu0nuGWevsHqt+NQ0HXwn06wvhTpdW9PaSTkYzRRhsQ/cGfA36CTFwrMFKpFzg+M5qAvnAWP3hZYeYEDii7/7XOvRL/XWItbf5tHzMs4D+//Ztigonur1m3wka47WCSYoWcecvGqPlps=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785330662; c=relaxed/simple;
	bh=i6HAqTjIUPRyTQ2G4dQ7dkE3rQX7nqlDjKg58AqrlKw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UdhDqeSMsjxiYBADSwgO+sz7aGm0VNykrtF0pkoKZS5CgpQVh8zQAyViEKV+xTK/umyZS4H57bSzcs/LJE0Z8vxp68SYiPIr9LJ5ElKykR/BPrKrGzYvTPKs4FNEHgieXWC3Sg/IOWzgj7zOQAS3xRdTLhhi9v+0SssNrh6jQTQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org; spf=none smtp.mailfrom=brainfault.org; dkim=pass (2048-bit key) header.d=brainfault-org.20251104.gappssmtp.com header.i=@brainfault-org.20251104.gappssmtp.com header.b=C6F5KJ0w; arc=pass smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault-org.20251104.gappssmtp.com header.i=@brainfault-org.20251104.gappssmtp.com header.b="C6F5KJ0w"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-47f9ab7ee38so618729f8f.2
        for <linux-kselftest@vger.kernel.org>; Wed, 29 Jul 2026 06:11:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785330659; cv=none;
        d=google.com; s=arc-20260327;
        b=dq8Za0llUuPmh3yhalkSvuhhxF6yRmVHUy7alNXwau2YG6N5EYyFqKBoVmJS5bEC+f
         1XreuozskirJbaKOzfEuZjpeOpYVy54+d7ZTK390wjc2/JYzVl8o0MUL8wFZ+nsP7tpV
         +XBZiPyqeONs/mQzu1m4wCkDXv6d31QNbxbe7FOVlVdlG9LGVcg2WjypWRBxQuQnkepD
         uOEO2xFwYdEu8P0EcNNCpkwhc+BNu6NuO+tEYKEoanTFb5c+jgoIRjscSvGuNpxAUN6H
         oY54P87lDzf6J3nNPis64401oX7sPkS5oL1tCaYPkIO6IG9XafYvWKYutFk49N93gGas
         n81A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9x3/gz6Awf/XoZ9143h09QEhv/SMox5T2mVccN4dxLg=;
        fh=S6yzcYVjqjbSQeXTReCamoF7ivAcYpzHIJhT2C/utXY=;
        b=GLkewawT7hQPZyXkyFV43TW498YuNLEXVL7+qhKnKRc5Ox8Wx/1MxNBRwJKtYavlLP
         EWcRUZxZVbHZFyUIyZ8185gsX0ErKDKwP12nykMr06EmSnw9rZKhztY9UO6Ti5TWRNkK
         pyqBV35lYyFzqz+eHF4pfxhHBTbBTNS3AQ6XxjN4MXSvHkbsZaYje3RfqIsAoNYi6Mcp
         QjUTd2cYrcom6L0055rkHCKIjs1TVNsGEugfZJOFn9V/hEAI9vqscesfoymKNOODRbql
         ADaRp2tKQMknTH0hzEy5zUjY4GDd5duUznMso3JPmzZZaXVHf9qPhCnsBo9BntLhvV5D
         0bcQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1785330659; x=1785935459; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9x3/gz6Awf/XoZ9143h09QEhv/SMox5T2mVccN4dxLg=;
        b=C6F5KJ0wnDcqJDaygd+KktUN9nJZh5lI45jvVw/4X5/mHprUAOjZOtXR8v2/a4m/Ue
         JP8wBcLXwRPnl08Qs3EJSBpOMZDNKp6UPxuWUHaLPuXDCpOwx7cujiWunltjc6kps89H
         zZ3x6rWIS242YY3S6Lx7FKmgpQt2P+n75e9j1xq4NI570ry+wJJOMtudWB6Y5FQK1/0C
         TmAn+Fuq+GCdjTpwQDbdTCLm/sWP4iy9hfnjbASOHhz4ymrnvqSKepAXcarjcXh4YKky
         EHImDrERcs03wvljAiIVEjGHoqN3gbJkm43mHkMKygzfazp0uaiCy2UZHx7WDMQHKdsH
         RueA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785330659; x=1785935459;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9x3/gz6Awf/XoZ9143h09QEhv/SMox5T2mVccN4dxLg=;
        b=YT4xxrwj8w6NTtTY36hVk5b+9KBYrh6Wab/jGC8EJ+ILq8E/D+P0DmCA27R3nFatuh
         y6Af6EoIqYCoTyR0BwIquK6MbPEq+ISDz1Tp+flMUhcsVMMKQejXcJgV270s1cobro+4
         xxKp29yRFrNnGh3ed1SetcZgXhEE7OsVdw68fXlJDKVtXHbhgkBkBft1xLRYlm6C3KTj
         hG1U1q/zqn7Aa2kMdh91XWltwelFHwWhM5IbuXpeJ+tys6Uqz7TutwCGoL/QK9q7M1M6
         FTgt32YruXkVm8VsHSNVLgi93lx+ui3KdjtwR6c3jA3nSOZGXlV4Duq+4rDnnUPqzYj1
         T93w==
X-Forwarded-Encrypted: i=1; AHgh+RpdBoyC/AYguwksv+NIzGjKmxyMmZJ8Y7Gybtk96bpOzSWgp8rRN/gK4XnFrOiDh1T39cnMiIxqfGlNgizEuj4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzv0z+/x7omjofXZZg7Xh3ocmza01wm9uFzS+xdFjNW36uy2CNe
	mdTiWp7gVONPYTnwKqofiqV1Eb6zLnSw+17HQkRbvBm9d+QBiDwSgKfePrxpkUZQDWz11knbz1e
	acFseiSoBQxTnui9nA/d7TCO0r0PAQIOdgOw626gFnw==
X-Gm-Gg: AR+sD13CHtl6eFr53jTvmYpMj2kZF5GuVtqiVBQlj0fYmFzv+YFC8WceU0/8KCV3mpt
	vMzsKUeQ96LWZOsSc8Dlzk5iXxIU0AyvTGYC6nHR8R6gyOQoFNW80E19k4Oz3h2/KdHGMDEEhFi
	zhsEkfgAqstDVKdnOvo/A9Yg5DLMcGQebdaTacDR7RQ37apj9p1PTep1xCCjIzJzeZ8DAFnNT4D
	hYsKUnD/Dq5B07Cut2Q5kA30BF0T8gMa2PzX61fRRKdkGClTGy//W2Uaj73vHsIqyAfZAEj72bU
	FqH0r9QpXxRa8zC+Ty7udSUjgbPX6gmFvNW950MVaLw+dTbNbQhZ7qsRr4rDpSRptT60D6i2hom
	U5YxkwXzW5M7baNIcDjN6F6BrKWNOuAzQhTpKNAJZ9QGLnAuvnU+i3P2jWqkWx7U=
X-Received: by 2002:a05:6000:18a3:b0:474:530:9d with SMTP id
 ffacd0b85a97d-47fb1ed94ffmr8909825f8f.13.1785330659285; Wed, 29 Jul 2026
 06:10:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260713010302.303278-1-inochiama@gmail.com> <20260713010302.303278-9-inochiama@gmail.com>
In-Reply-To: <20260713010302.303278-9-inochiama@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 29 Jul 2026 18:40:46 +0530
X-Gm-Features: AUfX_myNiqlbAha1KK8MC_yl8dulLIaxCr6_MgvrGaUHSeOXkgBH7keIZeV2P80
Message-ID: <CAAhSdy3uZOBsBzi10SOiPrnsUokP-KugHcfToyzT9t4rbUiUtw@mail.gmail.com>
Subject: Re: [PATCH v6 8/8] KVM: riscv: selftests: add Zicfiss/Zicfilp
 extension to get-reg-list test
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
> The KVM RISC-V allows Zicfiss/Zicfilp extensions for Guest/VM so
> add these extensions to get-reg-list test.
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
>  .../selftests/kvm/riscv/get-reg-list.c        | 69 +++++++++++++++++++
>  1 file changed, 69 insertions(+)
>
> diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/tes=
ting/selftests/kvm/riscv/get-reg-list.c
> index 94e33b2ee796..bf3980e9db12 100644
> --- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
> +++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
> @@ -90,6 +90,8 @@ bool filter_reg(__u64 reg)
>         case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV=
_ISA_EXT_ZICBOP:
>         case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV=
_ISA_EXT_ZICBOZ:
>         case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV=
_ISA_EXT_ZICCRSE:
> +       case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV=
_ISA_EXT_ZICFILP:
> +       case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV=
_ISA_EXT_ZICFISS:
>         case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV=
_ISA_EXT_ZICNTR:
>         case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV=
_ISA_EXT_ZICOND:
>         case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV=
_ISA_EXT_ZICSR:
> @@ -358,6 +360,8 @@ static const char *core_id_to_str(const char *prefix,=
 __u64 id)
>         "KVM_REG_RISCV_CSR_AIA | KVM_REG_RISCV_CSR_REG(" #csr ")"
>  #define RISCV_CSR_SMSTATEEN(csr) \
>         "KVM_REG_RISCV_CSR_SMSTATEEN | KVM_REG_RISCV_CSR_REG(" #csr ")"
> +#define RISCV_CSR_ZICFISS(csr) \
> +       "KVM_REG_RISCV_CSR_ZICFISS | KVM_REG_RISCV_CSR_ZICFISS_REG(" #csr=
 ")"
>
>  static const char *general_csr_id_to_str(__u64 reg_off)
>  {
> @@ -425,6 +429,18 @@ static const char *smstateen_csr_id_to_str(__u64 reg=
_off)
>         return NULL;
>  }
>
> +static const char *zicfiss_csr_id_to_str(__u64 reg_off)
> +{
> +       /* reg_off is the offset into struct kvm_riscv_zicfiss_csr */
> +       switch (reg_off) {
> +       case KVM_REG_RISCV_CSR_ZICFISS_REG(ssp):
> +               return RISCV_CSR_ZICFISS(ssp);
> +       }
> +
> +       TEST_FAIL("Unknown zicfiss csr reg: 0x%llx", reg_off);
> +       return NULL;
> +}
> +
>  static const char *csr_id_to_str(const char *prefix, __u64 id)
>  {
>         __u64 reg_off =3D id & ~(REG_MASK | KVM_REG_RISCV_CSR);
> @@ -441,6 +457,8 @@ static const char *csr_id_to_str(const char *prefix, =
__u64 id)
>                 return aia_csr_id_to_str(reg_off);
>         case KVM_REG_RISCV_CSR_SMSTATEEN:
>                 return smstateen_csr_id_to_str(reg_off);
> +       case KVM_REG_RISCV_CSR_ZICFISS:
> +               return zicfiss_csr_id_to_str(reg_off);
>         }
>
>         return strdup_printf("%lld | %lld /* UNKNOWN */", reg_subtype, re=
g_off);
> @@ -585,6 +603,8 @@ static const char *isa_ext_single_id_to_str(__u64 reg=
_off)
>                 KVM_ISA_EXT_ARR(ZICBOP),
>                 KVM_ISA_EXT_ARR(ZICBOZ),
>                 KVM_ISA_EXT_ARR(ZICCRSE),
> +               KVM_ISA_EXT_ARR(ZICFILP),
> +               KVM_ISA_EXT_ARR(ZICFISS),
>                 KVM_ISA_EXT_ARR(ZICNTR),
>                 KVM_ISA_EXT_ARR(ZICOND),
>                 KVM_ISA_EXT_ARR(ZICSR),
> @@ -748,6 +768,12 @@ static const char *sbi_fwft_id_to_str(__u64 reg_off)
>         case 6: return "KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_R=
EG(pte_ad_hw_updating.enable)";
>         case 7: return "KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_R=
EG(pte_ad_hw_updating.flags)";
>         case 8: return "KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_R=
EG(pte_ad_hw_updating.value)";
> +       case 9: return "KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_R=
EG(landing_pad.enable)";
> +       case 10: return "KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_=
REG(landing_pad.flags)";
> +       case 11: return "KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_=
REG(landing_pad.value)";
> +       case 12: return "KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_=
REG(shadow_stack.enable)";
> +       case 13: return "KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_=
REG(shadow_stack.flags)";
> +       case 14: return "KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_=
REG(shadow_stack.value)";
>         }
>         return strdup_printf("KVM_REG_RISCV_SBI_FWFT | %lld /* UNKNOWN */=
", reg_off);
>  }
> @@ -954,6 +980,20 @@ static __u64 sbi_fwft_pte_ad_hw_updating_regs[] =3D =
{
>         KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_STATE | KV=
M_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pte_ad_hw_updating.value)=
,
>  };
>
> +static __u64 sbi_fwft_landing_pad_regs[] =3D {
> +       KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_EXT | KVM_=
REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_FWFT,
> +       KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_STATE | KV=
M_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(landing_pad.enable),
> +       KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_STATE | KV=
M_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(landing_pad.flags),
> +       KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_STATE | KV=
M_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(landing_pad.value),
> +};
> +
> +static __u64 sbi_fwft_shadow_stack_regs[] =3D {
> +       KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_EXT | KVM_=
REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_FWFT,
> +       KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_STATE | KV=
M_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(shadow_stack.enable),
> +       KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_STATE | KV=
M_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(shadow_stack.flags),
> +       KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_STATE | KV=
M_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(shadow_stack.value),
> +};
> +
>  static __u64 zicbom_regs[] =3D {
>         KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_CONFIG | KVM_R=
EG_RISCV_CONFIG_REG(zicbom_block_size),
>         KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_ISA_EXT | KVM_=
REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICBOM,
> @@ -969,6 +1009,11 @@ static __u64 zicboz_regs[] =3D {
>         KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_ISA_EXT | KVM_=
REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICBOZ,
>  };
>
> +static __u64 zicfiss_regs[] =3D {
> +       KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_CSR | KVM_REG_=
RISCV_CSR_ZICFISS | KVM_REG_RISCV_CSR_ZICFISS_REG(ssp),
> +       KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_ISA_EXT | KVM_=
REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICFISS,
> +};
> +
>  static __u64 aia_regs[] =3D {
>         KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_CSR | KVM_REG_=
RISCV_CSR_AIA | KVM_REG_RISCV_CSR_AIA_REG(siselect),
>         KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_CSR | KVM_REG_=
RISCV_CSR_AIA | KVM_REG_RISCV_CSR_AIA_REG(iprio1),
> @@ -1220,6 +1265,8 @@ KVM_ISA_EXT_SUBLIST_CONFIG(zicbom, ZICBOM);
>  KVM_ISA_EXT_SUBLIST_CONFIG(zicbop, ZICBOP);
>  KVM_ISA_EXT_SUBLIST_CONFIG(zicboz, ZICBOZ);
>  KVM_ISA_EXT_SIMPLE_CONFIG(ziccrse, ZICCRSE);
> +KVM_ISA_EXT_SIMPLE_CONFIG(zicfilp, ZICFILP);
> +KVM_ISA_EXT_SUBLIST_CONFIG(zicfiss, ZICFISS);
>  KVM_ISA_EXT_SIMPLE_CONFIG(zicntr, ZICNTR);
>  KVM_ISA_EXT_SIMPLE_CONFIG(zicond, ZICOND);
>  KVM_ISA_EXT_SIMPLE_CONFIG(zicsr, ZICSR);
> @@ -1279,6 +1326,24 @@ static struct vcpu_reg_list config_sbi_fwft_pte_ad=
_hw_updating =3D {
>         },
>  };
>
> +static struct vcpu_reg_list config_sbi_fwft_landing_pad =3D {
> +       .sublists =3D {
> +               SUBLIST_BASE,
> +               SUBLIST_ISA(zicfilp, ZICFILP),
> +               SUBLIST_SBI(fwft_landing_pad, FWFT),
> +               {0},
> +       },
> +};
> +
> +static struct vcpu_reg_list config_sbi_fwft_shadow_stack =3D {
> +       .sublists =3D {
> +               SUBLIST_BASE,
> +               SUBLIST_ISA(zicfiss, ZICFISS),
> +               SUBLIST_SBI(fwft_shadow_stack, FWFT),
> +               {0},
> +       },
> +};
> +
>  struct vcpu_reg_list *vcpu_configs[] =3D {
>         &config_sbi_base,
>         &config_sbi_sta,
> @@ -1289,6 +1354,8 @@ struct vcpu_reg_list *vcpu_configs[] =3D {
>         &config_sbi_fwft_misaligned_deleg,
>         &config_sbi_fwft_pointer_masking,
>         &config_sbi_fwft_pte_ad_hw_updating,
> +       &config_sbi_fwft_landing_pad,
> +       &config_sbi_fwft_shadow_stack,
>         &config_aia,
>         &config_fp_f,
>         &config_fp_d,
> @@ -1332,6 +1399,8 @@ struct vcpu_reg_list *vcpu_configs[] =3D {
>         &config_zicbop,
>         &config_zicboz,
>         &config_ziccrse,
> +       &config_zicfilp,
> +       &config_zicfiss,
>         &config_zicntr,
>         &config_zicond,
>         &config_zicsr,
> --
> 2.55.0
>
