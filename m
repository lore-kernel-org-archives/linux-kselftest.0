Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23E812931D5
	for <linux-kselftest@vger.kernel.org>; Sat,  5 Sep 2026 00:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788567448; cv=pass; b=Ie65PDw3y81g12HPlxyonZcaouJiV6+XrzWKcaHgQCQ1TRW8RZo4FZy9kB3ciKi+gIBgHH8pIzWGhda5+79ntv3LhR1blSRGrp2pyfdvvQYHuteliaXi0KNwaRMGi6uNnIY8gC/QAMd6bEiFQP3IkyNB2TmTUcECmPh3U2sqeYM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788567448; c=relaxed/simple;
	bh=zI5fGSwjsWTiLlNBOtJtqSsIJLDmrw+sj2jKVbZYzU0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CYw4m4VFutU3H7khuwrEKZ5AEx45YnbnwPo8FTHaMtYZzsqu32jMGmxhQ/SpfnvehA+38E0rEGusaSutS634UpdbTHy3ofdhZVM7IH2Im9QquRjO5vnYXcFKZcMrnu0WuFPQcHsjCE4YYhfPCafLQ6sdx4i35CgDP6Jf8cICCzE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FIfYS9Po; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FIfYS9Po"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a5d8fd8d8dso1714a12.1
        for <linux-kselftest@vger.kernel.org>; Fri, 04 Sep 2026 17:17:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788567444; cv=none;
        d=google.com; s=arc-20260327;
        b=AYc7W8s90hDLIhegmOTX5ib0bUJSmiwu07yZj0fdk00JrKKKt/fKSGCvH/4mb5OsoF
         +cWnuEq90JbhoIfMrmAFcJeZUIsOInsku+0UouX7VfV3jUb8jfwLom8BLL0YBzOqPNiG
         mezQi9Z7WNqkww3JgRlvAeFyjEphZbAFCLrbAiK280UVFZKLz/K6eL1wVCjBw2L6PUT7
         oY8l/HMPDfFuK8EYJuyMUk9uOzKyjCbKq79VjgqpZM+dH+VBY7QlFh5BsfGYxe1m73gb
         YhUxikU72inFjh9Arjf8SX0DKl+/+LLGQZdfSY5M4J98ZYgv0uGZXAVBRwWptfdxe4Ow
         vaAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Sc2IfuuJuGolKz2gmkWX0SVyqSmKQRXBMRP12Me7TNk=;
        fh=qG7GkcaOyMB0eTVpWraURARnmTNBhVEaHRhIdnteRQQ=;
        b=Va/wbPWUOPE9FO8phLrv8yUFu+mFaO+Cn/sICvwl5mW/ZQWOiii7hqDeGYsaMFUEaf
         8jqdIgJe0LmKi2VW97Dz7fPVkE/9gG4lc9C16EEdn9KkUSHu0pmJUY51Ntzj0dZwybVF
         P7G86/1CNrOeSMKrQbJY3Rj/cjq2xbjic8HMy6hzuhl2o+AzW5CHeoqJlOA/nP1Pq1yM
         qbnVYAGpG+JNYsdgaeImR7l2uYawgAcV4JJfNcb39R2Ky9WNSxcfkDZVPf9gr3nblPad
         v13Hl/6nZAnnZz4HUjDFKj+mmenlB7CU/fOORtNVt3HHSqxmQrMRetfe8VOY6GOjdLNU
         BDTQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788567444; x=1789172244; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Sc2IfuuJuGolKz2gmkWX0SVyqSmKQRXBMRP12Me7TNk=;
        b=FIfYS9PoxECi1D2a0S3HzODWdnNdiutisOvWa5RnVsQTKjXrwVAzDqHFp4/cqLGx/L
         /fZRqapsCBDCGkOpo03fS5NojZVZvTJyJj0UwEMms2yoUh3nN4MM6twGVjhfR/EaCcmt
         uPe+e09/4daZ9pgzskNXAJSsbQc7/NcoD3ZfBwmdCnSsuLI/scmjaSg0tux67TfByjDF
         pUZ1L9TxA2zdKWlEtjWpYcQlbLecFb4W0OxmCqlYiPQutLn3aM9fA/sM0goxO9+j1RjK
         W9heGZfxGpfr5c428u+Bhnw+fmUiG3mGRLBflA0zQDMq+RsUbBaAPE9EtNwH7cm7f02+
         CmHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788567444; x=1789172244;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sc2IfuuJuGolKz2gmkWX0SVyqSmKQRXBMRP12Me7TNk=;
        b=oud5djiCrvsc32mzi11aSmm7kbpH1WuFpmuDPfgExvwQ1XtEkE94kDYm/8IXDJJgLv
         ZxtmDI22vs8WsxuCIYGDt/aMEkSuNb44GIRFDfgIYgSM06XxSM710qx5+t5Ddr2vFR7V
         MpC3DW7wcpHM41FqFCUXRajX9X3Hj7ktG0+GQP/iAq/1GtxvkcEaQFDaY72BRiTLKb76
         yFX9eCw7FxkqEJlWm0pgw0j+bRsItPHQMgfY2AgCwCmlmp789v2Q1jPVLIgE9BSGDx9w
         Ot0jjM61F7hSsPfRY3hZs1jxVN1L7YKl16blgdXIBA/RkUQfGr4gj/Ln9uQhk+us/sIU
         GXrQ==
X-Forwarded-Encrypted: i=1; AKwUvBzkGF70ZvrRNxd/jdcLzbQ99MteyK48tdMdKoEefVY4ZCfH9B7sRt2426s7dfbvs69LqqQndpiQS4lmNof3jU8=@vger.kernel.org
X-Gm-Message-State: AFuF++mCtqjUZHvPOh2IqNUTvAUKwCv0fpBne7dhLL3Voj6cffrGhcZb
	7mstzngX8avbJXuOVd3ojcaxD6H+cUfJI6fyHrZL+3lMDLfBJQ9R/wz0P76AvIKYFlu1lEgM/94
	rOt/sOHMQBLy31KkBJiDdVhLHkWkhHFYRXjCDxWS8
X-Gm-Gg: AYBFou2h6pyjC8qzxgWEGO6WnrbkkwC1eW34zXPZu8VgYgN86sdZLH6Ge/4NeubroqS
	yBVgth0XBKN/YEo2BD1UyqvK7hyYZM5t0Ge43bVNeKka49Xko363J2B6JiOGoHueSxX/I6bxpmi
	E82d+tg21c92JFdrbtVSCtk4UDsHK2o1MwOMzoe1z2WmV7HhAtWd2ckkfRsniF0q0apY8Msakow
	EBl0RZwA6dKDEQDgsFqlpDgVAVk8sal9JYePk582UWGKhispkc/Aj1klYLeYVevOSik6Bf3WBgN
	8pIgYDg9+ef7ElPItCXqUsnSwANCtN9bg//fCO5cmyAS
X-Received: by 2002:aa7:c0c3:0:b0:6a6:967c:3186 with SMTP id
 4fb4d7f45d1cf-6a7f67ae76amr12958a12.2.1788567443649; Fri, 04 Sep 2026
 17:17:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824123954.315112-1-zhang_wei@open-hieco.net> <20260824123954.315112-6-zhang_wei@open-hieco.net>
In-Reply-To: <20260824123954.315112-6-zhang_wei@open-hieco.net>
From: Jim Mattson <jmattson@google.com>
Date: Fri, 4 Sep 2026 17:17:11 -0700
X-Gm-Features: AcwNN1U1BmZHUf7tYcSc1W-hMHQbwms_ZkVgDOwBA2YimPa5kIpujfF625gK86o
Message-ID: <CALMp9eQFtNihRpkxDTs05UnfLgYJOHR7AsTLWi9FGjpNDq_kBA@mail.gmail.com>
Subject: Re: [PATCH v5 5/8] KVM: nSVM: Use emulator bytes for synthesized
 nested #NPF
To: Tina Zhang <zhang_wei@open-hieco.net>
Cc: Sean Christopherson <seanjc@google.com>, kvm@vger.kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, zhouyanjing@hygon.cn, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 24, 2026 at 5:40=E2=80=AFAM Tina Zhang <zhang_wei@open-hieco.ne=
t> wrote:
>
> SVM DecodeAssists provides instruction bytes for data-access #NPF exits.
> Hardware-reflected VM-Exits can use fresh VMCB02 bytes, but a
> KVM-synthesized #NPF has no hardware byte state to propagate.
>
> Use the emulator fetch cache when the nested #NPF is the current emulator
> exception.  Store the bytes in a one-shot buffer that is consumed while
> constructing VMCB12 and cleared before the next nested run, preventing an
> unrelated nested VM-Exit from reusing stale emulator bytes.
>
> Signed-off-by: Tina Zhang <zhang_wei@open-hieco.net>
> ---
>  arch/x86/kvm/svm/nested.c | 50 ++++++++++++++++++++++++++++++++++++++-
>  arch/x86/kvm/svm/svm.h    | 12 ++++++++++
>  2 files changed, 61 insertions(+), 1 deletion(-)
>
> diff --git a/arch/x86/kvm/svm/nested.c b/arch/x86/kvm/svm/nested.c
> index 2db0ec66e8dc..635ff20cc431 100644
> --- a/arch/x86/kvm/svm/nested.c
> +++ b/arch/x86/kvm/svm/nested.c
> @@ -81,11 +81,45 @@ static void nested_svm_clear_vmcb02_insn_bytes(struct=
 vcpu_svm *svm)
>         svm->nested.vmcb02_insn_bytes_fresh =3D false;
>  }
>
> +static void nested_svm_clear_synthesized_insn_bytes(struct vcpu_svm *svm=
)
> +{
> +       svm->nested.synthesized_insn_bytes.prepared =3D false;
> +       svm->nested.synthesized_insn_bytes.insn_len =3D 0;
> +}
> +
> +static void nested_svm_prepare_synthesized_insn_bytes(struct kvm_vcpu *v=
cpu)
> +{
> +       struct vcpu_svm *svm =3D to_svm(vcpu);
> +       struct nested_svm_insn_bytes *synthesized =3D
> +               &svm->nested.synthesized_insn_bytes;
> +       struct x86_emulate_ctxt *ctxt =3D vcpu->arch.emulate_ctxt;
> +
> +       static_assert(sizeof(synthesized->insn_bytes) >=3D
> +                     sizeof(ctxt->fetch.data));
> +
> +       nested_svm_clear_synthesized_insn_bytes(svm);
> +
> +       if (!guest_cpu_cap_has(vcpu, X86_FEATURE_DECODEASSISTS))
> +               return;
> +
> +       if (!ctxt || ctxt->eip !=3D kvm_rip_read(vcpu) ||
> +           ctxt->fetch.end < ctxt->fetch.data ||
> +           ctxt->fetch.end > ctxt->fetch.data + sizeof(ctxt->fetch.data)=
)
> +               return;

Peeking into emulator internals violates encapsulation. Rather than
performing arithmetic on fetch.data and fetch.end, the emulator should
provide a function for accessing the fetch cache.

> +       synthesized->insn_len =3D ctxt->fetch.end - ctxt->fetch.data;
> +       memcpy(synthesized->insn_bytes, ctxt->fetch.data,
> +              synthesized->insn_len);
> +       synthesized->prepared =3D true;
> +}
> +
>  static void nested_svm_update_vmcb12_insn_bytes(struct kvm_vcpu *vcpu,
>                                                 struct vmcb *vmcb12,
>                                                 const struct vmcb *vmcb02=
)
>  {
>         struct vcpu_svm *svm =3D to_svm(vcpu);
> +       struct nested_svm_insn_bytes *synthesized =3D
> +               &svm->nested.synthesized_insn_bytes;
>
>         nested_svm_clear_insn_bytes(vmcb12);
>
> @@ -93,11 +127,20 @@ static void nested_svm_update_vmcb12_insn_bytes(stru=
ct kvm_vcpu *vcpu,
>             !nested_svm_vmexit_has_insn_bytes(vmcb02))
>                 goto out;
>
> -       if (svm->nested.vmcb02_insn_bytes_fresh)
> +       if (svm->nested.vmcb02_insn_bytes_fresh) {
>                 nested_svm_copy_insn_bytes(vmcb12, vmcb02);
> +               goto out;
> +       }
> +
> +       if (synthesized->prepared) {
> +               vmcb12->control.insn_len =3D synthesized->insn_len;
> +               memcpy(vmcb12->control.insn_bytes, synthesized->insn_byte=
s,
> +                      vmcb12->control.insn_len);

These instruction bytes may be short. Although this is fixed in the
next commit, introducing a bug in one patch and fixing it in the next
is bad practice.

> +       }
>
>  out:
>         svm->nested.vmcb02_insn_bytes_fresh =3D false;
> +       nested_svm_clear_synthesized_insn_bytes(svm);
>  }
>
>  static void nested_svm_inject_npf_exit(struct kvm_vcpu *vcpu,
> @@ -106,6 +149,8 @@ static void nested_svm_inject_npf_exit(struct kvm_vcp=
u *vcpu,
>  {
>         struct vcpu_svm *svm =3D to_svm(vcpu);
>         struct vmcb *vmcb =3D svm->vmcb;
> +       struct x86_emulate_ctxt *ctxt =3D vcpu->arch.emulate_ctxt;
> +       bool from_emulation =3D ctxt && fault =3D=3D &ctxt->exception;
>         u64 fault_stage;
>
>         /*
> @@ -134,6 +179,8 @@ static void nested_svm_inject_npf_exit(struct kvm_vcp=
u *vcpu,
>         vmcb->control.exit_info_2 =3D fault->address;
>
>         nested_svm_set_vmcb02_insn_bytes_fresh(svm, from_hardware);
> +       if (from_emulation && !(fault->error_code & PFERR_FETCH_MASK))
> +               nested_svm_prepare_synthesized_insn_bytes(vcpu);
>         nested_svm_vmexit(svm);
>  }
>
> @@ -937,6 +984,7 @@ static void nested_vmcb02_prepare_control(struct vcpu=
_svm *svm)
>          * Clear stale DecodeAssist data before L2 runs.
>          */
>         nested_svm_clear_vmcb02_insn_bytes(svm);
> +       nested_svm_clear_synthesized_insn_bytes(svm);
>
>         if (guest_cpu_cap_has(vcpu, X86_FEATURE_VGIF) &&
>             (vmcb12_ctrl->int_ctl & V_GIF_ENABLE_MASK))
> diff --git a/arch/x86/kvm/svm/svm.h b/arch/x86/kvm/svm/svm.h
> index 610def16f700..9344707e9ffd 100644
> --- a/arch/x86/kvm/svm/svm.h
> +++ b/arch/x86/kvm/svm/svm.h
> @@ -209,6 +209,12 @@ struct vmcb_ctrl_area_cached {
>         };
>  };
>
> +struct nested_svm_insn_bytes {
> +       bool prepared;
> +       u8 insn_len;
> +       u8 insn_bytes[X86_MAX_INSTRUCTION_LENGTH];
> +};
> +
>  struct svm_nested_state {
>         struct kvm_vmcb_info vmcb02;
>         u64 hsave_msr;
> @@ -245,6 +251,12 @@ struct svm_nested_state {
>
>         /* True if VMCB02 has instruction bytes from the current hardware=
 exit. */
>         bool vmcb02_insn_bytes_fresh;
> +
> +       /*
> +        * Cached instruction bytes for the current synthesized nested #N=
PF.
> +        * Valid until the corresponding nested VM-Exit is constructed.
> +        */
> +       struct nested_svm_insn_bytes synthesized_insn_bytes;
>  };

I think the implementatiom would be much cleaner if you wrote the
synthesized instruction bytes directly to the vmcb02, rather than
going through this staging buffer.

>  struct vcpu_sev_es_state {
> --
> 2.43.7
>
