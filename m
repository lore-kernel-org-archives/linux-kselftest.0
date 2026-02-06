Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64CE92236F0
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Feb 2026 01:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770340220; cv=pass; b=PLohwolgY0ynQCqapzE86juka4/ior64yOyYMblrLfxM0Ec99RiQmIDSFMRYWlfY54ZWw18Xz6FbQy4RlJKtUgveouFgorOkCdge9Ao4vOtAg3d0DMGpvt2VjTMugssQ8inf9BfMMmajMAmIPpCdkEkHWJ6MDnqVmbaUrVYdpqo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770340220; c=relaxed/simple;
	bh=1vNVLQJG5oXLqAy4C434UqfIxmm1yq8IJUp605bCllM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o/gbQsGJw81eWzaTVTqNm9OXm8TFpmpgjVY5WhW+wwk6RvuEzUbkPAmioyt/SnutAc/0tCYHA18oqNTz0QXWi2PbKQtKfFfXCiILxPY3o9+OSU99rMX0ObGKbrrw322sBq01Gg2DXMfIlolkfwtsse/J73tQ5n6Gah3QNTHeU9Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aQKePXfn; arc=pass smtp.client-ip=209.85.161.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aQKePXfn"
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-662f91bba0fso1669129eaf.0
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Feb 2026 17:10:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770340219; cv=none;
        d=google.com; s=arc-20240605;
        b=fZmOZSzUH6OooSwhCEXkNiFS+LEbLB3vPTm41VwSuQwlPsg6ctQ/ZnHoExIVpp9dqU
         X4ZuaFix8BLoQMUj4DCOky81OR7Qv3vlE6WdVsogV4dvU1YnBvXBSDc+CNvBWo+Ov8N/
         AkZKC6ctLFCsPMfgW7BU84CW13zoJdQi2jmG+yXnQ+M/jWCD2rmnzzF/TR6cyRdltsGY
         X+y8ugXlw3n4rHlr7HgEVw901rkKQ+jweg1A+sIEKsEAhEo3YJSOb4iiMX8U0e6q0PyI
         zhDrhKghfeLQAH6aTDlrB387W4k9rVDHFIdQ8McuagU3XhDmCvifVeQsid/wItUNOVXe
         6zFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=g/MfuwqLqbhKjZWvGBnhdqUtPnwfWft+1ZZSTUtvZos=;
        fh=Um2y7Qd3POvKvlJ1OmhLToobV8RRVPYafJG/Xcm1BXk=;
        b=C/6GulK18Uq7elKc1aLFDDD3exjUvBITLqvTVdqRWsO3NXMS1y1sDkoz2VEO5dl4Za
         jBB0o0KivulRA9qVLGji0AY+DObkVbLUzuErXGveDukzr21ZMxkwf4RtIeFKr6AijpRC
         iHLsFkKMF95KWCPzDniAemCqyGhuTnZ0qwfV9dHZoawbMfT8BESxInGDl5g5s/cUznVy
         jWOmI08vIZmF9tbt9ey1unwW7ZQWIfMKD2aka5qtOzRQBjo8oX79F6w+RKaYsNZYVobn
         17u9ZjuEXs2O4N2fV+kjFnsZQMJx+Hjd6mayLB++lKviI2G2ZI1ep0bbRDrH3nqC81c6
         xtrQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770340219; x=1770945019; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g/MfuwqLqbhKjZWvGBnhdqUtPnwfWft+1ZZSTUtvZos=;
        b=aQKePXfnu+W9MDd615sSOwnKwTl97iQpLqeWfDHcmCAtJfwCiOEOtKGxRdCZ9rrRDC
         RO9+7SApuKr5ZZ6eg2qP0dPpADFCS+nRcWRoFVKQqHMfRUxReGEuka7h520gUC+FGir1
         PWrLaBLNi3gWg/TZKfvYe2jhM5WgXWM40Mljx3+TCIbGAw1MfNJ/YSFUANBIgsnvJxLe
         m9USkoUyXJwrrYOHTLswassLUysVe7zbPZn44i6M5WH2EcjRauPlQ5/VcJYgfyjk4GvW
         dZjRt/86eqvbVq2qNTbz4NuycUVuzWMgZaXvOVZiatni+0E1Sd/h0lbMszl/3JXWnt8N
         V/XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770340219; x=1770945019;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g/MfuwqLqbhKjZWvGBnhdqUtPnwfWft+1ZZSTUtvZos=;
        b=rFrasdvvd7Mrd1RdVCD0J3xctPytO1RIyzWx2BD1mGHWkePMOTjNJE3MF/4P5DZBwW
         CF+8TITxOzcm01TmF0nJ4sJtF6VqQlGjYwg4qAhNb+XeT1Mzleftt81vAsqRlx7bzO3t
         DVgWZ1xBsf7hTNraQLP33IGWXtOrurfAOLeHzCUqHToULWcdWk3dikollgeT1hhDWynZ
         npxRL6Pp3v0H+6Lv+S3SH3Me5kLv25nAjOLIVYFUdhEfwWpPAgwXwhLQHP8BIf62oqga
         AFdCAkhHSV2O45WmglMRY4VsD7H1VZmiK+eL2GT7C46cXGoVzZAOLoqYRg8gaz/gyfUX
         98kg==
X-Forwarded-Encrypted: i=1; AJvYcCXbQJ4B32TuWDBKfT3R69EBhU5uAjGdWQzr9zXdLlHmP9D2U2r1kPDG6DWUDC8NEhafr51wU+fQhnFglCXYZ+M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzn1DO+YVKgR2WAbJKUD0vOBDMU46ZVE0+2nBO35biVSjieWH+a
	19UO7hUYdx9ymDU7P0VHmUv02c2EaF57YOOb7pOzWM/Ku+DFK4TcwUTSHUaJWz7C4HnYHHyf61+
	lkpqylUFdorTwMnnL3jIGs8aWENxcWsI=
X-Gm-Gg: AZuq6aI5xI53KtwYLbVPE2iP3C0w2VeAhkqe06T+nVOBKBsBb0gEuHL6cdm2bOKFKDn
	C2KC1JLw3f9b9N6+fdow5TcWrYtRi1avypml2IVgbzEEP9DDLJ+WDUwCSGUK29luw+NXwd6Jtdm
	Zq82+XRxmyJQ1dNoe92k4xalwzh6apqrQE14XLivxBba7JGFyGDTmZ5W4/YruhEWRzLIbUau1YH
	TyQ4P6E4mC2TnlEu2raDfhcdlJWR6PRB6ccN2LYREpMsp14/xFE2b08snehPeieIcbH1eEC7Sp5
	gTBda73dXdXe6PMZG1NxuxCDZ/0=
X-Received: by 2002:a05:6820:4df5:b0:663:12ec:15b8 with SMTP id
 006d021491bc7-66d148a45c3mr529303eaf.26.1770340219223; Thu, 05 Feb 2026
 17:10:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260205010502.2554381-1-xujiakai2025@iscas.ac.cn>
 <20260205010502.2554381-3-xujiakai2025@iscas.ac.cn> <gcspbbvqkr7y53c4ytkqqycygkcqkiakle4aelq2z7nsnlyegl@addv4v655cbg>
In-Reply-To: <gcspbbvqkr7y53c4ytkqqycygkcqkiakle4aelq2z7nsnlyegl@addv4v655cbg>
From: eanut 6 <jiakaipeanut@gmail.com>
Date: Fri, 6 Feb 2026 09:10:08 +0800
X-Gm-Features: AZwV_QhcFA9toIkXo56oGUCoj8hyEt0zkeewoqds6t1BmWq6FbDPmwG23AVfrVE
Message-ID: <CAFb8wJuXBLiqZieA+puXd=5BGhHaNqy_vvSJgfhp-v4q3D4mHQ@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] RISC-V: KVM: selftests: Add RISC-V SBI STA shmem
 alignment tests
To: Andrew Jones <andrew.jones@oss.qualcomm.com>
Cc: Jiakai Xu <xujiakai2025@iscas.ac.cn>, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Andrew Jones <ajones@ventanamicro.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Drew,

Thanks a lot for the detailed review and suggestions.
I agree with your points.

I will post a revised version in about a week. This is mainly to allow
some time in case other reviewers have additional feedback on the
current approach, so that everything can be addressed together in the
next revision.

Thanks again for the careful review.

Best regards,
Jiakai

On Thu, Feb 5, 2026 at 11:58=E2=80=AFPM Andrew Jones
<andrew.jones@oss.qualcomm.com> wrote:
>
> On Thu, Feb 05, 2026 at 01:05:02AM +0000, Jiakai Xu wrote:
> > Add RISC-V KVM selftests to verify the SBI Steal-Time Accounting (STA)
> > shared memory alignment requirements.
> >
> > The SBI specification requires the STA shared memory GPA to be 64-byte
> > aligned, or set to all-ones to explicitly disable steal-time accounting=
.
> > This test verifies that KVM enforces the expected behavior when
> > configuring the SBI STA shared memory via KVM_SET_ONE_REG.
> >
> > Specifically, the test checks that:
> > - misaligned GPAs are rejected with -EINVAL
> > - 64-byte aligned GPAs are accepted
> > - INVALID_GPA correctly disables steal-time accounting
> >
> > Signed-off-by: Jiakai Xu <xujiakai2025@iscas.ac.cn>
> > Signed-off-by: Jiakai Xu <jiakaiPeanut@gmail.com>
> > ---
> >  .../selftests/kvm/include/riscv/processor.h   |  4 +++
> >  tools/testing/selftests/kvm/steal_time.c      | 33 +++++++++++++++++++
> >  2 files changed, 37 insertions(+)
> >
> > diff --git a/tools/testing/selftests/kvm/include/riscv/processor.h b/to=
ols/testing/selftests/kvm/include/riscv/processor.h
> > index e58282488beb3..c3551d129d2f6 100644
> > --- a/tools/testing/selftests/kvm/include/riscv/processor.h
> > +++ b/tools/testing/selftests/kvm/include/riscv/processor.h
> > @@ -62,6 +62,10 @@ static inline uint64_t __kvm_reg_id(uint64_t type, u=
int64_t subtype,
> >                                                    KVM_REG_RISCV_SBI_SI=
NGLE,          \
> >                                                    idx, KVM_REG_SIZE_UL=
ONG)
> >
> > +#define RISCV_SBI_STA_REG(idx)       __kvm_reg_id(KVM_REG_RISCV_SBI_ST=
ATE,   \
> > +                                                  KVM_REG_RISCV_SBI_ST=
A,                     \
> > +                                                  idx, KVM_REG_SIZE_UL=
ONG)
>
> We don't need this because...
>
> > +
> >  bool __vcpu_has_ext(struct kvm_vcpu *vcpu, uint64_t ext);
> >
> >  static inline bool __vcpu_has_isa_ext(struct kvm_vcpu *vcpu, uint64_t =
isa_ext)
> > diff --git a/tools/testing/selftests/kvm/steal_time.c b/tools/testing/s=
elftests/kvm/steal_time.c
> > index 8edc1fca345ba..30b98d1b601c3 100644
> > --- a/tools/testing/selftests/kvm/steal_time.c
> > +++ b/tools/testing/selftests/kvm/steal_time.c
> > @@ -209,6 +209,7 @@ static void steal_time_dump(struct kvm_vm *vm, uint=
32_t vcpu_idx)
> >
> >  /* SBI STA shmem must have 64-byte alignment */
> >  #define STEAL_TIME_SIZE              ((sizeof(struct sta_struct) + 63)=
 & ~63)
> > +#define INVALID_GPA (~(u64)0)
> >
> >  static vm_paddr_t st_gpa[NR_VCPUS];
> >
> > @@ -301,6 +302,34 @@ static void steal_time_dump(struct kvm_vm *vm, uin=
t32_t vcpu_idx)
> >       pr_info("\n");
> >  }
> >
> > +static void test_riscv_sta_shmem_alignment(struct kvm_vcpu *vcpu)
> > +{
> > +     struct kvm_one_reg reg;
> > +     uint64_t shmem;
> > +     int ret;
> > +
> > +     reg.id =3D RISCV_SBI_STA_REG(0);
>
> ...here we should use KVM_REG_RISCV_SBI_STA_REG(shmem_lo)
>
> > +     reg.addr =3D (uint64_t)&shmem;
> > +
> > +     /* Case 1: misaligned GPA */
> > +     shmem =3D ST_GPA_BASE + 1;
> > +     ret =3D __vcpu_ioctl(vcpu, KVM_SET_ONE_REG, &reg);
> > +     TEST_ASSERT(ret =3D=3D -1 && errno =3D=3D EINVAL,
> > +                 "misaligned STA shmem should return -EINVAL");
>
> remove the word 'should'
>
> "misaligned STA shmem returns -EINVAL"
>
> > +
> > +     /* Case 2: 64-byte aligned GPA */
> > +     shmem =3D ST_GPA_BASE;
> > +     ret =3D __vcpu_ioctl(vcpu, KVM_SET_ONE_REG, &reg);
> > +     TEST_ASSERT(ret =3D=3D 0,
> > +                 "aligned STA shmem should succeed");
>
> same comment about 'should'
>
> > +
> > +     /* Case 3: INVALID_GPA disables STA */
> > +     shmem =3D INVALID_GPA;
> > +     ret =3D __vcpu_ioctl(vcpu, KVM_SET_ONE_REG, &reg);
> > +     TEST_ASSERT(ret =3D=3D 0,
> > +                 "INVALID_GPA should disable STA successfully");
>
> We're not testing that STA was successfully disabled, only that all-ones
> input doesn't generate an error. So the message should be along the lines
> of "all-ones for STA shmem succeeds"
>
> > +}
> > +
> >  #endif
> >
> >  static void *do_steal_time(void *arg)
> > @@ -369,6 +398,10 @@ int main(int ac, char **av)
> >       TEST_REQUIRE(is_steal_time_supported(vcpus[0]));
> >       ksft_set_plan(NR_VCPUS);
> >
> > +#ifdef __riscv
> > +     test_riscv_sta_shmem_alignment(vcpus[0]);
> > +#endif
>
> We like to try to avoid #ifdefs in common functions by providing stubs fo=
r
> architectures that don't need them [yet]. So we should rename this to
> something more generic, like
>
>  check_steal_time_uapi()
>
> and then call it for all architectures. Actually the other architectures
> can already make use of it since both x86 and arm64 do uapi tests in
> their steal_time_init() functions and that's not really the right
> place to do that. I suggest creating another patch that first moves those
> tests into new functions (check_steal_time_uapi()) which only needs to
> be called once for vcpu[0] outside the vcpu loop, as you do here. In
> that patch check_steal_time_uapi() will be a stub for riscv. Then in
> a second patch fill in that stub with the tests above.
>
> Thanks,
> drew
>
> > +
> >       /* Run test on each VCPU */
> >       for (i =3D 0; i < NR_VCPUS; ++i) {
> >               steal_time_init(vcpus[i], i);
> > --
> > 2.34.1
> >
