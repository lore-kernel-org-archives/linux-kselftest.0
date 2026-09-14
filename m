Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB173A0E80
	for <linux-kselftest@vger.kernel.org>; Mon, 14 Sep 2026 22:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789425227; cv=pass; b=KTNr3QDK8RZGs3h8qL5bbe/f1aUy9p/bgT2u3Eeyrz0XestTIyfOACk6LdQRB0ut3adW6J0AI7RUvLQMU9w4EmSpiqDWsDfoI8ttX69Rki5x2YAOyAovlqMxZyJX2LfPINv900uOFzj+8U3luuXT9UInbYu8UI5ik0hz3Dc4vro=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789425227; c=relaxed/simple;
	bh=RErsm8IuxjqeMbKnZnpM9fWpr2T2HyUPVGa44TsRw5I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CUf1yxSomrme3sYvuH53Gb7AoOSIR5k19s4/EZNeDqN3Dv+y8XTVAq1+/FpY9LOIE5VYfuhLVU8KmAscxkU5D3/2eWdreHI+9dIL98LFiJ0h7g1i8NJkAcJIaHGooONhH3M0gW9wePceq8v9VolEUIWJ59vFMpi0rXfc2iUOfPM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vu2PqzsO; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vu2PqzsO"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a613a6bcd8so893a12.0
        for <linux-kselftest@vger.kernel.org>; Mon, 14 Sep 2026 15:33:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789425224; cv=none;
        d=google.com; s=arc-20260327;
        b=IzXw+hhfhhhCVPWhAZY17N/EodPyoIAXsUaYlxSipx6XOn+gNpozKbRuAdrwhaqSDU
         s1J9+2pcr3POpgZhLrtQYRMSwVT5+gPjBAn1dHRw8E3Vu9Tx4xq7w7Rg5NIYg33zxSWj
         eYgt6gFYLOwzmyIv0OBvmcdwnuT5mrCma+JMC5Fs1gFd02j4ONGOSNxvXNyJKIXXkoHE
         BtVN2Wo/jXjgRkkPU6RzwNy9mj3suELsLHOHyXhDhQ9OcnrfQO93H8wkslJKc86l83pW
         w7/vcgHF3L0d75jb27FbLyqhJBp0Q9fRG8gLkStRlATmK00bzbB3QHHQZYEQ6hnwXpYY
         qpkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8R+DoiNw8tUga/vTi1Xfm5DnH9rWZFwdCJZG7HXQcWY=;
        fh=WKDH+wcBdEdrJ96XZZjdASELzEYGFh9QAGfzszYPuHU=;
        b=hAYpAdm7j6tjveQQPeib71NTFavQkwzZ/teE4SfQZUHickB/J1U/WtzP8KQQJunVHP
         X50rfgafMIU0ET8wr8lgCyjXy5rs2aBUdzfgzxvFpkqr2CRzGHFOcwF6hzMZzEVVGKMv
         1lYUBxpPp6sXF8cT3BDq8FfQ4LNKDTyx/w9z0479qxXLNpL26pFGxPrbN7vF7SZiFAJz
         alqJg60P+ssVakqQuh81pBMfN/0Ezukrh35jJV7zw0furOQ2nr2JmdJ4Pm0Y9Z/JbTPE
         pMV2JJJoPSIcf5KuitFOhEmhkzAythOWwMwlKXopibnvGOaBIK4+7Ae5xfTD5IQzQflQ
         VmTg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789425224; x=1790030024; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8R+DoiNw8tUga/vTi1Xfm5DnH9rWZFwdCJZG7HXQcWY=;
        b=vu2PqzsO2PGG4ZpWIE6PJG3dJpgI0uOEXP7raWzusWjJdCwp0KIVCt46YaTHZlnObq
         SCLsRVU8Em/iuHCYo4nm5B6Dq+cBTK4BL9YBwV3KQr8XRYeMnvtUdf1buSsT2eXVfTtt
         yAli95KJpEuTUVhyZ3bFG66fCnlz+CqtfEjr2mh8YCrWEuUEI2ubgTf9DOOMjFE7vn/7
         Coc83N7yezeAniKnHkkFoH0kg+WFBQNECXtxpgWaFTnwMt86nWvYDI0a8Udnm27+JJ89
         WZnSgS7brpAiTTcp5cp09WVcIFN1i1KoaFynh328uYMVKpL+RsCsCABVNb34xCqa+NmM
         h5Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789425224; x=1790030024;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8R+DoiNw8tUga/vTi1Xfm5DnH9rWZFwdCJZG7HXQcWY=;
        b=aoxxOjb5WyeqmFaQ5XH4Ifxvpgv3PZbdLZ47s4yTJhyv4X+DTjoVNVvoJAT7w9OMs9
         DhIO2CW/P8DLp1w3wf1vkTS6lCP0IncSrkZeVHUHfSzawk/KzxF6Lw7AN6wFrjPUUIAK
         XwnmJ+ZT7l/fBab4i4E4ud77wFlwESXebu2RsFpJbW1vhxK/cSD6wh9TtWuSobvdv6oA
         A1UugC2U5E9hMsNS/WGAXb6PESru/9wowTW3S3O824g4cHROqm6NEoxH0ShIIitJtUxx
         FYKvqMVeAq00qWzBunUIR/KPzdwEYOIfifrfUq3nqtBjSYVrTAODMnIRQd+6yi0ZBnwb
         sxzw==
X-Forwarded-Encrypted: i=1; AKwUvBwulffVY71J9Zx+wv+UNET+yXqBhT4mOgOGnhmF4D6HX9KpeHTHC493bvV3oKsaSszZZ/ZjDZ1DfsCRcNjtK1k=@vger.kernel.org
X-Gm-Message-State: AFuF++mXm2S1+dTHerwkpQTuLB8kCOIZ3lehSs0Q8ulK8nq1h1vc76p+
	FXOAQCLg1uI3HydgZNOb9ZfVT8Xtc/Es226ZDctF7u4eCf7dNscXPLecQbRWl0KbO/H3BH/NMm8
	5Iw+5ASD3CO+8fZHDCzOoRhvmlRykyIt1mpLw/FU6
X-Gm-Gg: AYBFou2rBbKOdEM0VP78JGv2iLGDyettzJAsqA4909hDjqZnSo5h/rFxMerE2iXTLaS
	cWHqo9bwNWdHw9tuN/uWkt876icSMGHKkNtoK7GLeMT6W8nG8toWwKUSUUoHAdzzMDkMsLg2+aL
	YSkThqZCnWYPjubHw/PvdzGHb1V38Lwlg16DOPQ539Tw/tBqnxmHQj1fUBrgP3PW2sxRNFjrwC/
	ltHeHcl/WDbr3nKF7T0mTE55TXc0hG4hFFoK8382/7avO8YfI1Iij5tcZPuNgpct0/pykw0W8Rc
	hrCstTmVbWfwBKGT3Hkp1YapcXfuG45zxQa39tJkAyyd0kCOcmlMKAQ=
X-Received: by 2002:a05:6402:1c0e:b0:6a6:871a:ab96 with SMTP id
 4fb4d7f45d1cf-6aa043c1f89mr24144a12.10.1789425223409; Mon, 14 Sep 2026
 15:33:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1789281096.git.zhang_wei@open-hieco.net> <016ecb3a3187b20fac299f1c2cb15aac01358412.1789281096.git.zhang_wei@open-hieco.net>
In-Reply-To: <016ecb3a3187b20fac299f1c2cb15aac01358412.1789281096.git.zhang_wei@open-hieco.net>
From: Jim Mattson <jmattson@google.com>
Date: Mon, 14 Sep 2026 15:33:28 -0700
X-Gm-Features: AcwNN1UeF8yVhm34VZLyZ4GqN5kQf1hbSkumsh5DDm3dMWJVzB8VwSpiEFZADUQ
Message-ID: <CALMp9eSnoFAk5PN-JudLc=xB6jzKzERfTVPEeAaRbLTYqtnKKA@mail.gmail.com>
Subject: Re: [PATCH v6 8/8] KVM: selftests: Add nested SVM DecodeAssists test
To: Tina Zhang <zhang_wei@open-hieco.net>
Cc: Sean Christopherson <seanjc@google.com>, kvm@vger.kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, zhouyanjing@hygon.cn, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 12, 2026 at 11:44=E2=80=AFPM Tina Zhang <zhang_wei@open-hieco.n=
et> wrote:
>
> Add a focused nested SVM selftest for DecodeAssists.  Verify that KVM
> exposes the feature to L1 and synthesizes EXITINFO for representative
> MOV CR/DR, CLTS, INTn, INVLPG, and INVLPGA intercepts.
>
> Exercise instruction bytes for hardware and synthesized #NPF/#PF exits.
> Cover a synthesized #NPF that follows a hardware #NPF in the same emulate=
d
> instruction, an unreadable instruction tail that leaves only the cached
> opcode, and the absence of bytes for an instruction-fetch #PF.  Modify th=
e
> MOVSB opcode while its MMIO read is pending to verify that the emulator's
> cached bytes are preserved.
>
> Inject a userspace #PF while an MMIO read is pending.  Verify that after
> MMIO completion, L1 receives instruction bytes from the current RIP,
> not the previous instruction's emulator cache.
>
> The synthesized OUTSB #NPF and userspace-injected #PF cases run by
> default.  The forced-emulation #PF and instruction-intercept cases
> require kvm.force_emulation_prefix=3D1.
>
> Signed-off-by: Tina Zhang <zhang_wei@open-hieco.net>
> ---
> ...
> +static const struct instruction_intercept_test instruction_intercept_tes=
ts[] =3D {
> +       {
> +               .name =3D "MOV-from-CR4",
> +               .code =3D l2_fep_mov_from_cr4_code,
> +               .intercept_cr =3D BIT(INTERCEPT_CR4_READ),
> +               .exit_code =3D SVM_EXIT_READ_CR4,
> +               .exit_info_1 =3D BIT_ULL(63) | 10,
> +               .exit_info_1_mask =3D ~0ULL,
> +       }, {
> +               .name =3D "MOV-to-DR7",
> +               .code =3D l2_fep_mov_to_dr7_code,
> +               .intercept_dr =3D BIT(INTERCEPT_DR7_WRITE),
> +               .exit_code =3D SVM_EXIT_WRITE_DR7,
> +               .exit_info_1 =3D 3,
> +               .exit_info_1_mask =3D ~0ULL,
> +       }, {
> +               .name =3D "CLTS",
> +               .code =3D l2_fep_clts_code,
> +               .intercept_cr =3D BIT(INTERCEPT_CR0_WRITE),
> +               .exit_code =3D SVM_EXIT_WRITE_CR0,
> +               .exit_info_1_mask =3D BIT_ULL(63),

Should this be:

.exit_info_1 =3D BIT_ULL(63),
.exit_info_1_mask =3D ~0ULL,


> +       }, {
> +               .name =3D "INTn",
> +               .code =3D l2_fep_int_code,
> +               .intercept =3D BIT_ULL(INTERCEPT_INTn),
> +               .exit_code =3D SVM_EXIT_SWINT,
> +               .exit_info_1 =3D TEST_INT_VECTOR,
> +               .exit_info_1_mask =3D ~0ULL,
> +       }, {
> +               .name =3D "INVLPG",
> +               .code =3D l2_fep_invlpg_code,
> +               .intercept =3D BIT_ULL(INTERCEPT_INVLPG),
> +               .exit_code =3D SVM_EXIT_INVLPG,
> +               .exit_info_1 =3D (u64)&npf_target,
> +               .exit_info_1_mask =3D ~0ULL,
> +       }, {
> +               .name =3D "INVLPGA",
> +               .code =3D l2_fep_invlpga_code,
> +               .intercept =3D BIT_ULL(INTERCEPT_INVLPGA),
> +               .exit_code =3D SVM_EXIT_INVLPGA,
> +               .exit_info_1_mask =3D ~0ULL,
> +               .check_rax =3D true,
> +               .rax =3D (u64)&npf_target,
> +       },
> +};

If you omit the FEP from the assembly in
instruction_intercept_tests[], KVM will copy VMCS02's EXITINFO1 to
VMCS12. Assuming L1 itself is not nested, this can be used to validate
KVM emulator behavior against hardware. (Maybe this can be used to see
if I'm right about CR0_SEL_WRITE, which is currently untested.)

> ...
> +static void run_intercept_test(struct svm_test_data *svm,
> +                              const struct instruction_intercept_test *t=
est)
> +{
> +       struct vmcb *vmcb =3D svm->vmcb;
> +       struct vmcb_control_area *control =3D &vmcb->control;
> +       u64 expected_exit_info_1 =3D test->exit_info_1 & test->exit_info_=
1_mask;
> +
> +       control->intercept |=3D test->intercept;
> +       control->intercept_cr |=3D test->intercept_cr;
> +       control->intercept_dr |=3D test->intercept_dr;
> +
> +       control->exit_info_1 =3D ~0ULL;

Perhaps you should poison insn_len and insn_bytes here as well?
