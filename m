Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06B4A392C2C
	for <linux-kselftest@vger.kernel.org>; Mon, 14 Sep 2026 18:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789412396; cv=pass; b=ZOS7bV3n+GB3MQcqvV6bTkmBREFQ5AsTmbEBPUReEQJAg2KWPA5dBQGkJuFy0SAnb1TGUoDFzP5bG4bVVPD0s9BwR2toboQ9Oj3ZKH4v0m+l4Nk0R+tt6w2mNoPM5/bmwUOJCodFTLpbhAkeX/thZx9CVNan37uHHlZlq6OYyjw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789412396; c=relaxed/simple;
	bh=NhbjBxjZC9QaqhJh1oSQvVf3rlrk3ZYiHUcnxcsGtM0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cm/KOP5ojLWotfPxe69o6MCFG2ACVB2XD9CugXEaFemi9tTvztBBYF0fj5uodbnFvT98JJ3CfRdPlbEvbvGJ2IepWm931/igdCM9HAsitMpGWUjbY1SRRRFZkU39iHBMRkqp5ElQLFHF6lsftn5HTbAU60rn5EqM17f47WPm9Rs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=M1TW4fJE; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="M1TW4fJE"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-53012819c04so454141cf.0
        for <linux-kselftest@vger.kernel.org>; Mon, 14 Sep 2026 11:59:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789412392; cv=none;
        d=google.com; s=arc-20260327;
        b=bppitUN/3JkG5v0xYby8iLP5VimJCwTSipvXMaIhu2TJCrQmXJ7Qbajq7cqk5atdoZ
         WZKrhfM738PMKrJTdw5BzLReR+IyTRyHxmbtDidR5/6rLbav7Gkur7ZAHEDKZ2rOS38g
         aEi33B0B3JTdbLE2gUMfI5GWOCof4p9lOZ/S1Ba5yGG8MbpsGvfoM77XWlEjOWeoxOfC
         yhGEqHBXj7wbC9k8NGNBwQGxRLy7ZOhHjTHn5RHzE23rv0+TDlqodq2IdwKunev1pEnD
         lNnXRVuC18z8pqcAW80enWosQrROR2GjryM5RzZErXCQhmB7vIfue/96D6lIhzr/zrPl
         XGAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MXbtIxiTnl0yl3kL8iSegb1NJaJ65aO3IifGdRU9GVg=;
        fh=HsOGa5iMqJaiY3GhjqnG+MTLqiLVPOOjqbQrSkjZPxU=;
        b=C/f38zP+2wqgne1oKTWqYpB7apLcZ9KCEHA4FPHLzV0L7z0WfdAmi5Pn3fc+jd5BNV
         sioqlOlyyx6/yLxTYEuKe6Lvsu5RCRtfEfBFtWrrSim/+cTcX6AU3cduunC+n4HRYxMi
         k9ivmhCZAYj5Ecj+fU3HplZIG3VQIlWo2DVmlEO98wPPBJstAPzlW9Woh1v56FCccawX
         e629KfqBTCb16AWCfVvKLus0UBIPU+/JqQRsfMAwfnjxDiU/iru/li5QnLFosxnJ/Ssl
         wDLRXtUGchdh71ZbIXKVyDcONbU9nt38x9ozfH1fMhZOV4gIxrMLPQ5E5EMr1tDTKFAu
         +TgA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789412392; x=1790017192; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MXbtIxiTnl0yl3kL8iSegb1NJaJ65aO3IifGdRU9GVg=;
        b=M1TW4fJEAJrPGDk8d7UWtlra4MHWA6oBITL7jbkAMqOfllWA5yBxUbEikRE/HsxfYL
         AEGWXpApRu/EWbXTY63y3Ep3M80NjsyfGNqUvAKY2RSKaL1yp4P/Zm6dsVdDzaiVbw30
         SX+eS6xUownioV1D3YzlPM9MYTu7jfqAmo2NJR82Wud0jwczZyNotOPjEGsZr1RxXm3y
         +DTIHw1oByF2WavsyCUjM5Q0yyB4GBvOEPbyAIyVJiNb3PsLpLwSv/sHet0xChf4YBzX
         bl34x8fAyqfNjxVjT0Bgm2Dz15A6s5paaTbbXQHflX9RH7xCrX8TC/986QcBDxVyM9Tl
         betA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789412392; x=1790017192;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MXbtIxiTnl0yl3kL8iSegb1NJaJ65aO3IifGdRU9GVg=;
        b=kFASuAIkepjYSxwi1CY9oZzP3R3XptehgkrPlF0CBPcIKf3VCUQkZJiM783gjGrjXa
         aXch+4tqBAv6IXE7z4sVxJ5izOX8hl9hJOLHA/IUchXkQOBqQyvZZPPBDxSITzA6vlF2
         /8f7waITMnAUbY0u6YRQPV/ipKFCYfdjy1JRunBo7QNijXVSNZ5gzkplW+Nbd0E97f6N
         UWbtfVZ1JJr0W31f3trDhKLP3tKT1xqXulJFLwmPUhp0GJ1WC1ZcXAV9dyne+LfilzLj
         iQHRDSfdrxIkVh2X+XZMhEihUmZgp7nuEg0JSb0s7DZ9Toadw6XUKNfkeWI3DXN+hB68
         u/fw==
X-Forwarded-Encrypted: i=1; AKwUvByipc02COK/WQpZNnLbmWPQu1/JbSkDSqdaCOa5lrByPpOOUB5/hQbmV2a3wdvA6fa3sv+q5OSMvg/VvruUgyk=@vger.kernel.org
X-Gm-Message-State: AFuF++mB2cw1mPQOQiNCXG9FiZdFvvR60UsMd4IW1HKPTxMmWphLwpV8
	nAC7lASGQGv/tv7uMSE3ZkNxWnt9PsTK+IniOswQMUq+mWFOPtS8HBhRwmD4jT/l7ZH3Jl2GUjj
	740HAFwCMibo5qT7+pWkaCrmIwl8vk7RJQR/lNZek
X-Gm-Gg: AYBFou3qaNbA+zd8UI5s2tFTlYpi/JLzE5MsPrtfmg3TRKcBlwb2oGQQ9QnZmO9PvOE
	ex3p0HMMiI4u8QJGUaSwzb+dXRVP8zo4eeuGX+wtZtiknUsnDfQ35TIe4EtQtkcrCcjTIUv01Md
	rb93Zkpm11IuuNrwd3urFGKGQhZozfmyYhc8rkoNxaxoPL88NwnFPDCExyLSmYKBf8ji6AIPzVz
	Znp4pgp97PMwvlTevHj0pDA9hlwRlwQdlFkBHOXnY0kCx5pgqJHFlfbHr6Zr+Km65zD3z9s4bxe
	bKVjAQNxC1sdEdZRL1RNF49a0ipQP58xt9qiqHXTdtgfMzdM+dso6GY=
X-Received: by 2002:a05:622a:8b:b0:530:e00f:7768 with SMTP id
 d75a77b69052e-5311a495dfbmr2698831cf.0.1789412391372; Mon, 14 Sep 2026
 11:59:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1789281096.git.zhang_wei@open-hieco.net> <a362ecf119a7e1c6a42c0643537cc51e83f78bb2.1789281096.git.zhang_wei@open-hieco.net>
In-Reply-To: <a362ecf119a7e1c6a42c0643537cc51e83f78bb2.1789281096.git.zhang_wei@open-hieco.net>
From: Jim Mattson <jmattson@google.com>
Date: Mon, 14 Sep 2026 11:59:37 -0700
X-Gm-Features: AcwNN1X2mz6cTxPV1l_OulVBMfNkr7dwm4_Z-lQ3Da2vVo6vle-Sc_6TFpBuX9I
Message-ID: <CALMp9eRL2rTkRMj0cuhxUcrzJ9G8VY4an6vCiCDSu5X139UKtA@mail.gmail.com>
Subject: Re: [PATCH v6 2/8] KVM: nSVM: Synthesize DecodeAssists EXITINFO for
 emulated intercepts
To: Tina Zhang <zhang_wei@open-hieco.net>
Cc: Sean Christopherson <seanjc@google.com>, kvm@vger.kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, zhouyanjing@hygon.cn, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 12, 2026 at 11:44=E2=80=AFPM Tina Zhang <zhang_wei@open-hieco.n=
et> wrote:
>
> When the x86 emulator encounters an instruction intercepted by L1,
> svm_check_intercept() synthesizes a nested VM-Exit without fresh hardware
> DecodeAssist state.  Populate the architectural EXITINFO1 field when
> DecodeAssists is exposed to L1.
>
> Provide the GPR number for MOV CR/DR, the interrupt vector for INTn, and
> the linear address for INVLPG.  Leave EXITINFO1 clear for CLTS, LMSW,
> SMSW, selective CR0 writes, and INVLPGA; the INVLPGA address remains in
> guest rAX.  Leave EXITINFO1 unchanged when DecodeAssists is not exposed,
> and leave unrelated intercepts unchanged.
>
> Signed-off-by: Tina Zhang <zhang_wei@open-hieco.net>
> ---
>  arch/x86/kvm/svm/svm.c | 32 +++++++++++++++++++++++++++++++-
>  1 file changed, 31 insertions(+), 1 deletion(-)
>
> diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
> index ea647938a2a6..6834e1101bb6 100644
> --- a/arch/x86/kvm/svm/svm.c
> +++ b/arch/x86/kvm/svm/svm.c
> @@ -4837,6 +4837,7 @@ static int svm_check_intercept(struct kvm_vcpu *vcp=
u,
>         int vmexit, ret =3D X86EMUL_CONTINUE;
>         struct __x86_intercept icpt_info;
>         struct vmcb *vmcb =3D svm->vmcb;
> +       bool decode_assists;
>
>         if (info->intercept >=3D ARRAY_SIZE(x86_intercept_map))
>                 goto out;
> @@ -4846,14 +4847,26 @@ static int svm_check_intercept(struct kvm_vcpu *v=
cpu,
>         if (stage !=3D icpt_info.stage)
>                 goto out;
>
> +       decode_assists =3D guest_cpu_cap_has(vcpu, X86_FEATURE_DECODEASSI=
STS);
> +
>         switch (icpt_info.exit_code) {
>         case SVM_EXIT_READ_CR0:
>                 if (info->intercept =3D=3D x86_intercept_cr_read)
>                         icpt_info.exit_code +=3D info->modrm_reg;
> +
> +               if (decode_assists)
> +                       vmcb->control.exit_info_1 =3D
> +                               info->intercept =3D=3D x86_intercept_cr_r=
ead ?
> +                               BIT_ULL(63) | (info->modrm_rm & 0xf) : 0;

Nit: CR_VALID | (info->modrm_rm & SVM_EXITINFO_REG_MASK)

>                 break;
>         case SVM_EXIT_WRITE_CR0: {
>                 unsigned long cr0, val;
>
> +               if (decode_assists)
> +                       vmcb->control.exit_info_1 =3D
> +                               info->intercept =3D=3D x86_intercept_cr_w=
rite ?
> +                               BIT_ULL(63) | (info->modrm_rm & 0xf) : 0;

Same nit.

> +
>                 /*
>                  * Adjust the exit code accordingly if a CR other than CR=
0 is
>                  * being written, and skip straight to the common handlin=
g as
> @@ -4891,13 +4904,30 @@ static int svm_check_intercept(struct kvm_vcpu *v=
cpu,
>                  */
>                 cr0 =3D vcpu->arch.cr0 & ~SVM_CR0_SELECTIVE_MASK;
>                 val =3D info->src_val  & ~SVM_CR0_SELECTIVE_MASK;
> -               if (cr0 ^ val)
> +               if (cr0 ^ val) {
>                         icpt_info.exit_code =3D SVM_EXIT_CR0_SEL_WRITE;
> +                       if (decode_assists)
> +                               vmcb->control.exit_info_1 =3D 0;
> +               }

I don't think clearing EXITINFO1 here is correct. The APM says:

> MOV-to-CR0 Special Case. If the instruction is MOV-to-CR, the GPR number =
is provided. If the instruction is LMSW or CLTS, no additional information =
is provided and bit 63 is not set.

The Decode Assists depend on the instruction opcode, not on the intercept.

>                 break;
>         }
>         case SVM_EXIT_READ_DR0:
>         case SVM_EXIT_WRITE_DR0:
>                 icpt_info.exit_code +=3D info->modrm_reg;
> +               if (decode_assists)
> +                       vmcb->control.exit_info_1 =3D info->modrm_rm & 0x=
f;

Nit: SVM_EXITINFO_REG_MASK

> +               break;
> +       case SVM_EXIT_SWINT:
> +               if (decode_assists)
> +                       vmcb->control.exit_info_1 =3D info->src_val & 0xf=
f;
> +               break;
> +       case SVM_EXIT_INVLPG:
> +               if (decode_assists)
> +                       vmcb->control.exit_info_1 =3D info->invlpg_linear=
_addr;
> +               break;
> +       case SVM_EXIT_INVLPGA:
> +               if (decode_assists)
> +                       vmcb->control.exit_info_1 =3D 0;
>                 break;
>         case SVM_EXIT_MSR:
>                 if (info->intercept =3D=3D x86_intercept_wrmsr)
> --
> 2.43.7
>
