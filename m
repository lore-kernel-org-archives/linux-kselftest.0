Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EE2F3101CE
	for <linux-kselftest@vger.kernel.org>; Fri,  5 Jun 2026 16:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780675941; cv=pass; b=hhd8FvTY0VQ6pxU+0gVH/3MEpUoA2tJpVNwSqmjPNTKi58GoRXCK/siDZivvfU5wHREK45UDDhmLf9VBx74Oeny0j/cDu/8DEfGjA8NtEMJl1hoWyp6uSD1133ESL2EB+KRe1okIAI9nRmSaJHlQBl4iK8gJdl2CbhxDMZd3NS8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780675941; c=relaxed/simple;
	bh=/XfO5uK9c17TupHijoryKtiPHIhJ4G1dC+CFKMbv2gE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e7mvExm7ww2a/zhvjgTvHEtkkCDPe1N8Qs6/kPafWJ2szJq+9WVhvegHH8Td65xMF9RebFLSoVyKrhUalNaTTneqyxRoFaSvPHkhU8jlTjq1q3RlPfYWasMPsxI7wm1j/GHcNT9miAtVYvZRDoHiRaRv1c1FVIAWdDfWGFmbKw8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org; spf=none smtp.mailfrom=brainfault.org; dkim=pass (2048-bit key) header.d=brainfault-org.20251104.gappssmtp.com header.i=@brainfault-org.20251104.gappssmtp.com header.b=zof01yvl; arc=pass smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault-org.20251104.gappssmtp.com header.i=@brainfault-org.20251104.gappssmtp.com header.b="zof01yvl"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-51780bbc560so22151871cf.0
        for <linux-kselftest@vger.kernel.org>; Fri, 05 Jun 2026 09:12:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780675939; cv=none;
        d=google.com; s=arc-20240605;
        b=g6z5BIE5NdX5ifazkYCWjngGE1bIBfCBypAnfBEHJxp8u6XDn6nKdnisXJTDFNY903
         jmeDpOLTf+loC4YCnG1ZpV3UOGI113CYAdXOrLdmxfmBUs0bWqIOssf3J9ClwyBCbHN0
         l9Yd2JepTDSIQ2E4Siqf/PFAMwu9QdHj/P61/ZSg4QcMpbjvHjfOan5S6xwet4l8i3zo
         Xz94HTIfOgp/DXYRnLedhH9H+9XCqHvGjap4EKosQVdjewZ9gZ7hKuL0tPPRD+JmaXSi
         o3IOU6GgYt+abITiqUOrVuf5t0haDvExnt3S2Fn84hzscl+OcDF1aoSz90XpeWEURDMG
         o/Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xPaw6mSt+SZ0+7hkZ5t+m28KWYkm5UvxnSOV1wRbNvc=;
        fh=o1btV+zj9nnaE9gpr7KntmhVlBkUTAqJyrFrFsE0eVc=;
        b=kwt0YgXIs0Ja6AfLVq+A9AdMa8ofnAF7nu3z0igoPGoFG9WbOF1LaKncAfEBIDepk+
         gTLIjycaBSIYqNj5uCvsA6WRrvEgd7qmqDwjzdimnl7UYb0vv9RTwW01sjICYiddyP3a
         mYVD975LpFd5AT4nTR+kPlC9WOA43L5vOq/DzjzSXqZhE3L/Gg47lliZXkngiIpEumkz
         UPxBwpjHHb6AoCZLR3k2Z3DkHGm9GOiURTTrAkZ8Vjy0kJmllqd+Zif/4E0UejDmfZ5S
         RiCuIxa0YB6QrjAK7WrlDi/KcKPOKUu2FQNh3N+tL/v8GdfjBxClRhgCeQj+NG30c1kk
         Tt7Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1780675939; x=1781280739; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xPaw6mSt+SZ0+7hkZ5t+m28KWYkm5UvxnSOV1wRbNvc=;
        b=zof01yvlb1tEoUKrh1SpQLq1jYRg3ht5DNjAPnHlBuO4H/4BCBZ8icKKst4KP7s2D+
         M4HlTfezv+EbEUjaTbB3OPyBeqShSnG/k9kTAHEOfMMJ2AWM+w1ov4vnsA24V+q3niUJ
         VD01QRx7JYZLd+OIaQpBfe6OOtQRP8uvlov+NIguHQQ6mgzeYcIFSwSlwIjop3G1myIM
         MpPIlU/dRNMlWNNmysgdNO9qPmL8WqYQn17e5mH6S43POQ3KsvPXC9QncYLkgr+m82+P
         SsrX1kDehNpZFyMWzaWcZrkTO6+UIw3sHyl8zwXDrJcNsjGjTZQzjrCnMoOInCsTMuxg
         jqAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780675939; x=1781280739;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xPaw6mSt+SZ0+7hkZ5t+m28KWYkm5UvxnSOV1wRbNvc=;
        b=XOUPFbR3I2N/jfYGZJxWICRYRDhByM+h45c9yPTMTlq6a9dpQ8jVb+girHCFhB/K16
         +IwWXKJyxOF7W5ETp6HJo8mE0uWH7tJnPp1rRQj5EvoWP4fEIVCZ57gzX5NXM3umPA1f
         yLD9KnbCrKTpmtacaK55DL3fGQmyo2GvYK5XwOiGe1xstzxuDBB/R8rwOmRWSGtgZ42X
         4OpaiQYKtV1Sd6/6y0KDle0sDVHKEgzqzVgRTdP/3RQ0TtbLm7OQHDxcMn1o+FWP+8VE
         kee1mVxESGft/CYfUCabv9T3Ty6uq5u7R+Or5ByKed00qhYaBu9Zycjhdam/59vKMxOQ
         RIUg==
X-Forwarded-Encrypted: i=1; AFNElJ9H98RlB8h5kzloyDnvO4CVX6pNyHOwg9R1hgNAmjoeON0tZTdgg+UVBmUnDMH3sUj8cVLDokw39jvUtvM1TWA=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywxd1FGytz1P0Nmgw5CqF9H8MErDiG4k3cPWzC/x1gq3fSzg4Wv
	tWDForlQcXYEHwGD4y99UypHTdRHGhWH0iz7ng7VBcjBywmJri3vIDVi49VlyHr0EKOflybid18
	LutWsbEKL48WQdfWOJznHVCyoFk4cgJ9GEIR2dev3nw==
X-Gm-Gg: Acq92OFn8AGo72wKM6sEzTB7D7ePzk70/3HKcQs9DvNfmHXm29nsGt6jyce3YL6BPIm
	ul3CESG8GM+YHFX5aXmgZWKWqUWKYfcBYRdMlfQZvxu+oY7CdffeQEbz49KaceT3GGms4dr1LFr
	H+CC1sB2qSu2Q4d4RUdI1cHl7foHQdrbvYdZOiyPsn6+n5e6BZvlyvefo77yaKJxw+Aghcvm3dS
	xwhu0qLACF/UT+QnPxu+Wm4PbLfF7X+ot5YvXb2awLFhH3YhZbBoznVTGlfLzo+QX08d1YpNAy3
	mcnBRE0zZMHxPa5cbSC1iadtcWqFQuQ5iEwgmvqy6e1lh4jM46hFO8053ZlglhRyADtFeT3VpVw
	mOnm02K+eD0X4/AKk0EgaNRtxBbpv2PIth6Ej
X-Received: by 2002:a05:622a:1144:b0:50f:c403:7ffb with SMTP id
 d75a77b69052e-517987acbbcmr40203221cf.18.1780675939140; Fri, 05 Jun 2026
 09:12:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260601-kvm-get_reg_list-v2-v5-0-415d08a2813b@sifive.com> <20260601-kvm-get_reg_list-v2-v5-3-415d08a2813b@sifive.com>
In-Reply-To: <20260601-kvm-get_reg_list-v2-v5-3-415d08a2813b@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 5 Jun 2026 21:42:07 +0530
X-Gm-Features: AVHnY4Jd3LwHzYiVtfabtRsTfsG1iw3bev0LUzu4pHEM1i3Lnky8Ia0dxnf5nH8
Message-ID: <CAAhSdy25VTfezS2zUsuTCTZ+Bwie7c-oHQYOWod1ix1y5rWOWQ@mail.gmail.com>
Subject: Re: [PATCH v5 3/5] KVM: RISC-V: SBI FWFT: Fix stale feature exposure
 after runtime extension changes
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
> Fix a bug where FWFT features could be incorrectly exposed to guests
> after userspace disables their dependent ISA extensions at runtime.
>
> The 'supported' field in kvm_sbi_fwft_config was set once during vCPU
> initialization based on the initial hardware/extension availability.
> However, when userspace subsequently disables ISA extensions via the KVM
> ONE_REG interface, the 'supported' field was not updated. This caused
> the following issues:
> 1. FWFT features would remain visible and accessible to guests even
>    after their prerequisite ISA extensions were disabled
> 2. Guests could configure FWFT features that depend on disabled
>    extensions, leading to undefined behavior
> 3. The static 'supported' flag and the dynamic supported() callback
>    could disagree about feature availability
>
> The fix introduces a two-layer checking mechanism:
> 1. Add an optional init() callback to the kvm_sbi_fwft_feature structure
>    for features that require hardware probing during initialization. This
>    separates the one-time hardware detection logic from the runtime
>    availability check.
> 2. Add runtime checks in all FWFT-related functions that call
>    feature->supported(vcpu) if the callback exists. This ensures feature
>    availability is re-evaluated based on the current ISA extension state.
>
> This approach maintains the cached 'supported' field for initialization-
> time decisions while ensuring runtime availability is always determined
> by the current vCPU configuration, not initialization-time snapshots.
>
> Fixes: 6b72fd170592 ("RISC-V: KVM: add support for FWFT SBI extension")
>
> Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Thanks,
Anup

> ---
>  arch/riscv/kvm/vcpu_sbi_fwft.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/arch/riscv/kvm/vcpu_sbi_fwft.c b/arch/riscv/kvm/vcpu_sbi_fwf=
t.c
> index aee951f2b8e6..ab39ac464ffd 100644
> --- a/arch/riscv/kvm/vcpu_sbi_fwft.c
> +++ b/arch/riscv/kvm/vcpu_sbi_fwft.c
> @@ -303,6 +303,8 @@ static int kvm_fwft_get_feature(struct kvm_vcpu *vcpu=
, u32 feature,
>
>         if (!tconf->supported || !tconf->enabled)
>                 return SBI_ERR_NOT_SUPPORTED;
> +       else if (tconf->feature->supported && !tconf->feature->supported(=
vcpu))
> +               return SBI_ERR_NOT_SUPPORTED;
>
>         *conf =3D tconf;
>
> @@ -433,6 +435,8 @@ static unsigned long kvm_sbi_ext_fwft_get_reg_count(s=
truct kvm_vcpu *vcpu)
>                 conf =3D kvm_sbi_fwft_get_config(vcpu, feature->id);
>                 if (!conf || !conf->supported)
>                         continue;
> +               else if (conf->feature->supported && !conf->feature->supp=
orted(vcpu))
> +                       continue;
>
>                 ret++;
>         }
> @@ -455,6 +459,8 @@ static int kvm_sbi_ext_fwft_get_reg_id(struct kvm_vcp=
u *vcpu, int index, u64 *re
>                 conf =3D kvm_sbi_fwft_get_config(vcpu, feature->id);
>                 if (!conf || !conf->supported)
>                         continue;
> +               else if (conf->feature->supported && !conf->feature->supp=
orted(vcpu))
> +                       continue;
>
>                 if (index =3D=3D idx) {
>                         *reg_id =3D KVM_REG_RISCV |
> @@ -490,6 +496,8 @@ static int kvm_sbi_ext_fwft_get_reg(struct kvm_vcpu *=
vcpu, unsigned long reg_num
>         conf =3D kvm_sbi_fwft_get_config(vcpu, feature->id);
>         if (!conf || !conf->supported)
>                 return -ENOENT;
> +       else if (conf->feature->supported && !conf->feature->supported(vc=
pu))
> +               return -ENOENT;
>
>         switch (reg_num - feature->first_reg_num) {
>         case 0:
> @@ -527,6 +535,8 @@ static int kvm_sbi_ext_fwft_set_reg(struct kvm_vcpu *=
vcpu, unsigned long reg_num
>         conf =3D kvm_sbi_fwft_get_config(vcpu, feature->id);
>         if (!conf || !conf->supported)
>                 return -ENOENT;
> +       else if (conf->feature->supported && !conf->feature->supported(vc=
pu))
> +               return -ENOENT;
>
>         switch (reg_num - feature->first_reg_num) {
>         case 0:
>
> --
> 2.43.7
>
