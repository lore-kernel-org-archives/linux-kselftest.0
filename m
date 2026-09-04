Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 133DA3EC833
	for <linux-kselftest@vger.kernel.org>; Fri,  4 Sep 2026 23:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788565375; cv=pass; b=HwY1Urgq43q5ClTL7qZrqiDbLNQvXmT5Qo+41cce820Y8CA7PrVpokB6F4FRPQG4Dl0k5V4JQuZgk2csMs6wncfuT51yaTcYr5k64buECgaJJMZHrt/Yh9CxELYGDSLktMqP7ah7Rw78OP0zcfCShuPLVXDabrCBsHWTniFjGlw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788565375; c=relaxed/simple;
	bh=tdeIH4baK11lM3YxuNe0/+kLC8zzDloAejtrDuGVn1o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M2vyexETiqTQn2VeITj/r39vLmiMWO+w84X9ZUWWFWq0sE6ki30req/vrXHYPhCyuZW9Qj2I94rYtGIs2jPxhCTeAmgvZWXkxJpQhaga4KhWwPtXpzmwwmCaGo/yHAKzF5E6EI7jW4vF0BnPV/j1cocxLVkCvm7u4Jcvmq9jI5w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZF4j5uCp; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZF4j5uCp"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a613a6bcd8so2107a12.0
        for <linux-kselftest@vger.kernel.org>; Fri, 04 Sep 2026 16:42:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788565370; cv=none;
        d=google.com; s=arc-20260327;
        b=Z2MB31htG3FcCpuUkmP5Q8MIJGw4AadHxUS0I7I9PmKsEUIooYBk7I+riWRVyqLBHn
         iDuJVsbMX6bkjtmgEnpMkzuGdrk3/DjEQCmIDhDfnOrJeRizQ80FCs/hiymccMarwmpF
         uVGfQJCRVZURmo+xP6gxwCiEYWFFdKvvnO3bjdi7l26wD9FXzFrUl4f6+tCHAMX/3LHQ
         a9AB6U/0e4DPQslmzXVxJAFYWGAPDzITQWG5oOJJwxrAieOYrECDwScAKY6KLrHn5K8/
         mrLvWxUy39Z7ySHFyXjKQzhGScki2uh+Vcz3udkGqrFY+oEH0vv8yCwf1jB2WawDY+L6
         4wpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=a490dV5va/G+fyNgSv3jbK3kZI5ySQnRWsBN/ioce6o=;
        fh=NDCetO71wi0C0zLnQCXIWJeuNOCh26AkkXtmLqbOEas=;
        b=BNNmRFRrZD5BmbCaE4AjcO3KC13785D3/YrDifbcesJX/njj9haJgFRL6X1zUZojbn
         JSaCzB6NPuI2fHolDb1/zicG6WDfsglMFULNa4JmUmWJB5N9cKRsLbIuXFQNZp2ewZht
         MbaOH/qV6WbLsLN1GzlU/+rN9tHXYEC4+D2g/PRxXMGcp+myKSDBtEZctBlyX/AMJ3IE
         /y8yGyDArn4P0lg+atg1bm3FUXx7stu2Hz3XOs5bYp6DsoUxsV77T5O1PME6pdhZCsJC
         rHltQrr5l74A/mHecM2KcvfZGfXHvRFSWte4m4Kb922PqgxZRi9toOWSwYlxyCKStiCc
         ofCw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788565370; x=1789170170; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=a490dV5va/G+fyNgSv3jbK3kZI5ySQnRWsBN/ioce6o=;
        b=ZF4j5uCpoKaUnazWnTNp2ojnyEHndnkgC5TuSr5x9xX2Gu7egVp6hYDu0gFYl5/aL3
         XrOMxY/HGvP8kkf247LrxyhJegpnNbgA6bS/8B3ktAUo9nB+1YlmLrJDVGWc1VUoPZ8U
         Q2iuTkZPPaj18l0BTgo0kqaZJ99IjW6b6rOocQxXpkYMqbYpIB0GmG0BlwhlM5av7MuI
         lhCzKrdRFYXjDnLMr8DdkiBJBFY2f1pdYnuycVoDTKhk5WNGSbtzJ1b8N5s6QMWxetPD
         77FN/KJfZXQwJpFcw9cC9gzhd5VBgvEKPrjwGOGH4EODJtHnYWKrufXDmEBabDF8NWrD
         GmTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788565370; x=1789170170;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a490dV5va/G+fyNgSv3jbK3kZI5ySQnRWsBN/ioce6o=;
        b=iDURIPRCZ9YcygGtTeUET3sCGK//L+IWcd4hU+4DIa5mAzt8jXwiUKR2lqzlSNCQFq
         T5iaEuKBaHAuV+6S/AIXyrzUX79d18AlAOWjpkE1a9e65+NrVkaC6RrDZQF9yjG+GIGs
         ffK8bkIIjX2/O2BF5vVxf4c4hBEezGC2tCGbv4yayzHI2Od67qF9U6AdG5MO5vxJKDV6
         tVYPXv2sbkfWKuqb8Ns6p4JGXNCMC2bYOdGevMw3cqDW5HmTYU6jYQnj+D4hls4e514G
         cff5SyjdwRopMh3ojnQITDy5BH6P0JgnZpHNe0NvB4ZUkf9rOlaeikFuWmRbBNNdL7r6
         7VmQ==
X-Forwarded-Encrypted: i=1; AKwUvBz4jI8ypBSX/dYtLeivRCH4IBFj6Kz+o1JsUiYruzXMDwGiWsgm4m+CTbD7IAGW5t+416L0ciylaKy3iWTwxzw=@vger.kernel.org
X-Gm-Message-State: AFuF++nRjfZSaLTbNMTP80QpIYA7ZTh+ZQeVrE608Nu8Z53o5FIdVtgk
	VxRfgnVf809SrfB6r/2t27wrtXd56GkwDjdmhrsuDwfYzp9eHxnZH/6IUt6e24Gh9hlpw+duBs4
	uVwHsbqqQfdjCtDsY/0L0ky9PFIT+QgWL0kBCMYix
X-Gm-Gg: AYBFou1cJ3DDrMU55C6Ot1Qle9WkgU5Gq8SIjTM9ENHLdI0foW0tojPw7nUyqOlDZQj
	k8hm3e6ArgEnJGzVVows9mq2pss/hbFzYsl1stjb/RPGSvd1aB/f3UrJjrMYLIxZzcowf37ewGm
	VHgK7Gg2rSzwYEgsTAe6iE9yamM9fPOjX59OVOXFX5vwQ+ge3OhqbBfhJqm16xM1NXsYU1uRz+E
	JgIWCfTw9qKgyN0Hgz2HBMtRnYRGQKUjUh0DvuotjK/oChs1MTxZ4D7CNrvQECLdNQviqIvUSF7
	uGVCxDROm6HOHMDtN+VaPvG5VBr4GNu1zEo/Y2SnK45s
X-Received: by 2002:aa7:d892:0:b0:6a6:32f6:2841 with SMTP id
 4fb4d7f45d1cf-6a7f684a29bmr14334a12.14.1788565369618; Fri, 04 Sep 2026
 16:42:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824123954.315112-1-zhang_wei@open-hieco.net> <20260824123954.315112-4-zhang_wei@open-hieco.net>
In-Reply-To: <20260824123954.315112-4-zhang_wei@open-hieco.net>
From: Jim Mattson <jmattson@google.com>
Date: Fri, 4 Sep 2026 16:42:37 -0700
X-Gm-Features: AcwNN1VTu8soNFdZKDDuJyRJOCyguZsvF4fhB4VorP5tfiMZXhPhnkzdAlhwRFU
Message-ID: <CALMp9eTUv+4v3jT7w3T8XoQmoSwkEjx6LHr39oJ9k8QNiQnyUA@mail.gmail.com>
Subject: Re: [PATCH v5 3/8] KVM: nSVM: Track fresh hardware DecodeAssist bytes
To: Tina Zhang <zhang_wei@open-hieco.net>
Cc: Sean Christopherson <seanjc@google.com>, kvm@vger.kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, zhouyanjing@hygon.cn, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 24, 2026 at 5:40=E2=80=AFAM Tina Zhang <zhang_wei@open-hieco.ne=
t> wrote:
>
> VMCB02 instruction bytes are valid only for the hardware VM-Exit that
> populated them.  Track whether VMCB02 contains instruction bytes for the
> data #PF or #NPF currently being reflected to L1 so that stale bytes are
> not copied to VMCB12.
>
> Clear the VMCB02 instruction-byte fields and freshness state before each
> nested run.  Mark the bytes as fresh only when a data #PF or #NPF came

By "nested run," do you mean "emulated VMRUN"? IIUC, that's when the
bytes and freshness are cleared.

> from hardware; KVM-synthesized exits and instruction-fetch faults leave
> the state clear.
>
> A subsequent change will use this state when propagating hardware
> DecodeAssist instruction bytes to VMCB12.
>
> Signed-off-by: Tina Zhang <zhang_wei@open-hieco.net>
> ---
>  arch/x86/kvm/svm/nested.c | 41 +++++++++++++++++++++++++++++++++++++--
>  arch/x86/kvm/svm/svm.c    |  6 +++---
>  arch/x86/kvm/svm/svm.h    |  5 ++++-
>  3 files changed, 46 insertions(+), 6 deletions(-)
>
> diff --git a/arch/x86/kvm/svm/nested.c b/arch/x86/kvm/svm/nested.c
> index 73f37b050d0a..6770721d4e4c 100644
> --- a/arch/x86/kvm/svm/nested.c
> +++ b/arch/x86/kvm/svm/nested.c
> @@ -35,6 +35,38 @@
>
>  #define CC KVM_NESTED_VMENTER_CONSISTENCY_CHECK
>
> +static void nested_svm_clear_insn_bytes(struct vmcb *vmcb)
> +{
> +       vmcb->control.insn_len =3D 0;
> +       memset(vmcb->control.insn_bytes, 0,
> +              sizeof(vmcb->control.insn_bytes));
> +}

Is it necessary to clear the bytes? The APM says, "All other
intercepts clear bits 7:0 in this field to zero (to indicate an
invalid condition); implementations may leave the other bytes
untouched."

Are you concerned about leaking bytes from unreflected VM-exits handled by =
L0?

> +static bool nested_svm_vmexit_has_insn_bytes(const struct vmcb *vmcb)
> +{
> +       u64 exit_code =3D vmcb->control.exit_code;
> +
> +       if (exit_code !=3D SVM_EXIT_NPF &&
> +           exit_code !=3D SVM_EXIT_EXCP_BASE + PF_VECTOR)
> +               return false;
> +
> +       return !(vmcb->control.exit_info_1 & PFERR_FETCH_MASK);
> +}
> +
> +static void nested_svm_set_vmcb02_insn_bytes_fresh(struct vcpu_svm *svm,
> +                                                  bool from_hardware)
> +{
> +       svm->nested.vmcb02_insn_bytes_fresh =3D
> +               from_hardware && static_cpu_has(X86_FEATURE_DECODEASSISTS=
) &&
> +               nested_svm_vmexit_has_insn_bytes(svm->vmcb);

For  consistency, should svm->vmcb be svm->nested.vmcb02.ptr?

> +}
> +
> +static void nested_svm_clear_vmcb02_insn_bytes(struct vcpu_svm *svm)
> +{
> +       nested_svm_clear_insn_bytes(svm->nested.vmcb02.ptr);
> +       svm->nested.vmcb02_insn_bytes_fresh =3D false;
> +}
> +
>  static void nested_svm_inject_npf_exit(struct kvm_vcpu *vcpu,
>                                        struct x86_exception *fault,
>                                        bool from_hardware)
> @@ -68,6 +100,7 @@ static void nested_svm_inject_npf_exit(struct kvm_vcpu=
 *vcpu,
>                                     (fault->error_code & ~PFERR_GUEST_FAU=
LT_STAGE_MASK);
>         vmcb->control.exit_info_2 =3D fault->address;
>
> +       nested_svm_set_vmcb02_insn_bytes_fresh(svm, from_hardware);
>         nested_svm_vmexit(svm);
>  }
>
> @@ -868,7 +901,9 @@ static void nested_vmcb02_prepare_control(struct vcpu=
_svm *svm)
>         /*
>          * Filled at exit: exit_code, exit_info_1, exit_info_2, exit_int_=
info,
>          * exit_int_info_err, next_rip, insn_len, insn_bytes.
> +        * Clear stale DecodeAssist data before L2 runs.
>          */
> +       nested_svm_clear_vmcb02_insn_bytes(svm);
>
>         if (guest_cpu_cap_has(vcpu, X86_FEATURE_VGIF) &&
>             (vmcb12_ctrl->int_ctl & V_GIF_ENABLE_MASK))
> @@ -1643,14 +1678,16 @@ static int nested_svm_intercept(struct vcpu_svm *=
svm)
>         return vmexit;
>  }
>
> -int nested_svm_exit_handled(struct vcpu_svm *svm)
> +int nested_svm_exit_handled(struct vcpu_svm *svm, bool from_hardware)

I don't think 'from_hardware' is necessary. The two callsites where
from_hardware is false are for opcode exits, and will be ruled out by
the check for nested_svm_vmexit_has_insn_bytes(svm->vmcb). If you drop
this extra parameter, there will be less churn.

>  {
>         int vmexit;
>
>         vmexit =3D nested_svm_intercept(svm);
>
> -       if (vmexit =3D=3D NESTED_EXIT_DONE)
> +       if (vmexit =3D=3D NESTED_EXIT_DONE) {
> +               nested_svm_set_vmcb02_insn_bytes_fresh(svm, from_hardware=
);
>                 nested_svm_vmexit(svm);
> +       }
>
>         return vmexit;
>  }
> diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
> index c7c1f1527c3c..5426a9669053 100644
> --- a/arch/x86/kvm/svm/svm.c
> +++ b/arch/x86/kvm/svm/svm.c
> @@ -2571,7 +2571,7 @@ static bool check_selective_cr0_intercepted(struct =
kvm_vcpu *vcpu,
>
>         if (cr0 ^ val) {
>                 svm->vmcb->control.exit_code =3D SVM_EXIT_CR0_SEL_WRITE;
> -               ret =3D (nested_svm_exit_handled(svm) =3D=3D NESTED_EXIT_=
DONE);
> +               ret =3D (nested_svm_exit_handled(svm, false) =3D=3D NESTE=
D_EXIT_DONE);
>         }
>
>         return ret;
> @@ -3723,7 +3723,7 @@ static int svm_handle_exit(struct kvm_vcpu *vcpu, f=
astpath_t exit_fastpath)
>                 vmexit =3D nested_svm_exit_special(svm);
>
>                 if (vmexit =3D=3D NESTED_EXIT_CONTINUE)
> -                       vmexit =3D nested_svm_exit_handled(svm);
> +                       vmexit =3D nested_svm_exit_handled(svm, true);
>
>                 if (vmexit =3D=3D NESTED_EXIT_DONE)
>                         return 1;
> @@ -4983,7 +4983,7 @@ static int svm_check_intercept(struct kvm_vcpu *vcp=
u,
>         if (static_cpu_has(X86_FEATURE_NRIPS))
>                 vmcb->control.next_rip  =3D info->next_rip;
>         vmcb->control.exit_code =3D icpt_info.exit_code;
> -       vmexit =3D nested_svm_exit_handled(svm);
> +       vmexit =3D nested_svm_exit_handled(svm, false);
>
>         ret =3D (vmexit =3D=3D NESTED_EXIT_DONE) ? X86EMUL_INTERCEPTED
>                                            : X86EMUL_CONTINUE;
> diff --git a/arch/x86/kvm/svm/svm.h b/arch/x86/kvm/svm/svm.h
> index 66b44b54608e..610def16f700 100644
> --- a/arch/x86/kvm/svm/svm.h
> +++ b/arch/x86/kvm/svm/svm.h
> @@ -242,6 +242,9 @@ struct svm_nested_state {
>          * on its side.
>          */
>         bool force_msr_bitmap_recalc;
> +
> +       /* True if VMCB02 has instruction bytes from the current hardware=
 exit. */
> +       bool vmcb02_insn_bytes_fresh;
>  };
>
>  struct vcpu_sev_es_state {
> @@ -887,7 +890,7 @@ static inline void nested_svm_simple_vmexit(struct vc=
pu_svm *svm, u32 exit_code)
>         nested_svm_vmexit(svm);
>  }
>
> -int nested_svm_exit_handled(struct vcpu_svm *svm);
> +int nested_svm_exit_handled(struct vcpu_svm *svm, bool from_hardware);
>  int nested_svm_check_permissions(struct kvm_vcpu *vcpu);
>  int nested_svm_check_cached_vmcb12(struct kvm_vcpu *vcpu);
>  int nested_svm_check_exception(struct vcpu_svm *svm, unsigned nr,
> --
> 2.43.7
>
