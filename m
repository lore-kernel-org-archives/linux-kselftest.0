Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6605739EF2E
	for <linux-kselftest@vger.kernel.org>; Mon, 14 Sep 2026 19:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789413464; cv=pass; b=WWN7reZiMVhZSueKNyMHc1GoQd3ivcOmxTbvLlgAUQxmnBAt6nx6HLu78hnnN1rek8YDxr0PJMEt2ss0Uk/Xu1btOAlPAAImJApKgNjpurfzG+kfk38YP0WJCKnKn0+C2fmTTZw++iEBE89nGHyrX//3uD41tgLYixxCNgLQUIo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789413464; c=relaxed/simple;
	bh=I70R/0YWeF0y09zlTpACQii1qrXFuiFewaTsH+8kBNo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P8Z87c6DpegdUOJKn1PoTM2xZDtb1OOr1rEsNtu/Ulvj9VLU07TrysURdlZmFCdr16Zt0VUuPBw2wqP4Nm0iDBici3QdLETTTwGPmCYeaGxMIxT3mfh82VSeBVMeK+RiO99nhUxTeUNfP+O4D+/yg6naGlKgl6TCciHBwYLL3AI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=T0axpJWS; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="T0axpJWS"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a6141a61c0so16522a12.1
        for <linux-kselftest@vger.kernel.org>; Mon, 14 Sep 2026 12:17:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789413460; cv=none;
        d=google.com; s=arc-20260327;
        b=KvQjnPtOloaU+MJWTrCceQYsznpqS2fv1sKx48ebXUuwfDxL8TEACycIESb+/9EIh+
         NcWN9EKKUNg9k/Ai2KaHQUVB19oCVXEuPsJqcTyIIQfc/qLWPOv142LlN/zWotLmZ8RL
         yEUtOiR+mKtJOM3UQtYgC6U/IJkHuO3T4TfxmsdIMl8bI8mFbs+oIX+4Y9y5hnF/yVXn
         nMMtE/wY0rdS1s3BgMm/sCUq1EwyjbrRk3zi0hhp1PxHJzAUls6IfdDpU0P0GVjjCYU6
         J0m6lT42Rn5kMLF3gEzif/hFzU6+rZ6argX71Mqq24Fv4TWuLFZeTgplOxcGghnSuC2s
         F9ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=myrSaQTa4vHBu2omtc5agr+BkgMWLQGN5WekDwWEnao=;
        fh=+9V0/Kyj25lkyK8lyYT8LjuL669V4UMM8iw8DawAArc=;
        b=DMIwIXujiF76osG+pC9PWtoqVdCoe38AWBsvAGeSU2YiUVoCxhfc76aWEnV+RIPQ8Q
         mnHsDs/p4XBn7tfGoyyAP8B9xkxwwRmJ1zBwM3ZEwqxlmQgbKbRT8WJ9i4aREHF9EkCY
         ecioJ80vs8nxxl5OGVjYTjg/TYT/bUkz3ar9wDTxzyGDmFXMtAbgDcqLGJ5Cy3ZDKKly
         SzWHx2w5hy6b43swsWym6LAjrNWcc2kMC0nua688Ouagaesdopqn7EDjSsxAUF3YWgt9
         8ErOVlycI/C2ZSPTtZqGJAKe9Y3PE+L8U5wXm/OJ7NBnaYsd5xa+XV2dEupMNxXPBySD
         yqLA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789413460; x=1790018260; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=myrSaQTa4vHBu2omtc5agr+BkgMWLQGN5WekDwWEnao=;
        b=T0axpJWSk2XvqBX5ng9MHBtx3WjHmA3UjvcoCp+HbbWqSyB50puhUo2gV2ZVzeAyxJ
         DP0PvhpBPkDSWLKQlTa6sP7Tv2JBpMhvUc+p6TY62u91BI0qtBEsb16n93WXxkD6UzZq
         3ikdC062nh/5V346G2IQc2WBQPyOEhwAmi0fcQlvAS9d+TGVSFLONyzrrHVXiMrTWiQk
         +aXu0QQAEjtFWC8zYmY7PvA0QKnH6bz31c4UVYPv6NZOlitG2fH/5/We22EWehU4uKP/
         d+zmoKnT9aCMeZe58dNdVf+hEX4MSqozpzZs3WptX3a1XBl6ZGqjwjEgvyi/yfWhl8wO
         y1Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789413460; x=1790018260;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=myrSaQTa4vHBu2omtc5agr+BkgMWLQGN5WekDwWEnao=;
        b=ESdONwnn2XmdrE1dDrf7rY/4GuwIKwnDJRdP1wRpL3QdufFvecFn8MVNMtqg22hmr4
         fnlFRCltJW7bTQxM91gKecTTyFPGHAMsMHUy8AE6VbcePeuwWK1iNUXfSBamj7+OrKpC
         0VXIqhapdAaHU/yT5d8f8JUiJE06s4Flk5K46qhzFfOxN7ZZT+QJfH86i/piWkEGW0J7
         /+OZRNjwQL1aM1neTWVvzYpFUKKHvfi7/61W0s0SX6xshLltBUJ1XFMZSqHskR5L6A1b
         fd+aUyQ0iUA+DdgCXl3krOC7vN4gJwqmWnqJIW4QhwxStt44OUV2nGTV/U4dja1MV98D
         Ogow==
X-Forwarded-Encrypted: i=1; AKwUvBxRq7AmBv2nEfQWejO6hl2yda7kbZMl0ZMdSWzvchm8uQPI27ZwTY2Tu/2dQTmau/ZtBHPiOnlYJ+58pkcfG5c=@vger.kernel.org
X-Gm-Message-State: AFuF++mh/7dd4SAwEgPGCP8f4aImBeHGSTYF7qnS4sg3LO46zHiKb6O+
	N/Ee+y9uiGs+Kw4GcopS8bRFLzkk9rUNyWH5cWFipJ3a0wVe8Ycm0ulWd2HvLwQE/FSvWG+HAR/
	EniSf5c8UfeLIskZ6/OElfpqrQ6oJgU1DGyrbQyT5
X-Gm-Gg: AYBFou1UK3/5YqtYUDow1xO8rIk66PpNMq08vGVu0s2U+RAGs/wJxwLj7mlnhJh3qDV
	oHK7Ttj5Ufze6pAemXaGb+GOL9RlgEylKqs9vy8MgDGWwfEttr3lE4fKloeyl1eB4QQRD0mdHZ0
	ZiS5oTzmkrqNpoK/ZcH/pemC3L6CLHFWfDfitB+DG3ZJwKSpWVCjGmQB1oh5AR/R5jCYU7az06C
	QN9bGtmvmxtt3g07aM8M+zxIkCE8/EbjCiQK6e/7zcVcqBjkRP9v6yluo7MNvuTZozL/+k3sqM4
	7wAJqgdg8EVvALLIuSRoRhucw9vcyYAXIsx1wNdr87pUwpYbgBWCqEWwow1wf1c6eg==
X-Received: by 2002:aa7:cd18:0:b0:6a4:abe:b08c with SMTP id
 4fb4d7f45d1cf-6aa043d1f1fmr13883a12.12.1789413459616; Mon, 14 Sep 2026
 12:17:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1789281096.git.zhang_wei@open-hieco.net> <37a1f336c303c78bbf942b1babcde828899968f6.1789281096.git.zhang_wei@open-hieco.net>
In-Reply-To: <37a1f336c303c78bbf942b1babcde828899968f6.1789281096.git.zhang_wei@open-hieco.net>
From: Jim Mattson <jmattson@google.com>
Date: Mon, 14 Sep 2026 12:17:27 -0700
X-Gm-Features: AcwNN1VzS9Vin9kOzYrPdaEV4UDdLP1p-qtdqTYgtpYlaZGFsre3kVUF8nVDPxU
Message-ID: <CALMp9eQbk4i3jMz4U7cTy_CNKCs6FfU+2fMLW4WDj612YdDfCA@mail.gmail.com>
Subject: Re: [PATCH v6 3/8] KVM: nSVM: Track valid hardware DecodeAssist bytes
To: Tina Zhang <zhang_wei@open-hieco.net>
Cc: Sean Christopherson <seanjc@google.com>, kvm@vger.kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, zhouyanjing@hygon.cn, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 12, 2026 at 11:44=E2=80=AFPM Tina Zhang <zhang_wei@open-hieco.n=
et> wrote:
>
> VMCB02 instruction bytes are valid only for the hardware VM-Exit that
> populated them.  Track whether VMCB02 contains instruction bytes for the
> data #PF or #NPF currently being reflected to L1 so that stale bytes are
> not copied to VMCB12.
>
> Invalidate VMCB02's instruction-byte state when preparing VMCB02,
> normally in response to an emulated VMRUN.  Mark the bytes as valid only
> when the current VMCB02 exit is a data #PF or #NPF.  Opcode exits and
> instruction-fetch faults are excluded by inspecting the exit state.
>
> A subsequent change will use this state when propagating hardware
> DecodeAssist instruction bytes to VMCB12.
>
> Signed-off-by: Tina Zhang <zhang_wei@open-hieco.net>
> ---
>  arch/x86/kvm/svm/nested.c | 38 +++++++++++++++++++++++++++++++++++++-
>  arch/x86/kvm/svm/svm.h    |  3 +++
>  2 files changed, 40 insertions(+), 1 deletion(-)
>
> diff --git a/arch/x86/kvm/svm/nested.c b/arch/x86/kvm/svm/nested.c
> index 73f37b050d0a..1cc3af8247f2 100644
> --- a/arch/x86/kvm/svm/nested.c
> +++ b/arch/x86/kvm/svm/nested.c
> @@ -35,6 +35,35 @@
>
>  #define CC KVM_NESTED_VMENTER_CONSISTENCY_CHECK
>
> +static void nested_svm_invalidate_insn_bytes(struct vmcb *vmcb)
> +{
> +       vmcb->control.insn_len =3D 0;
> +}
> +
> +static bool nested_svm_vmexit_supports_insn_bytes(const struct vmcb *vmc=
b)
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
> +static void nested_svm_set_vmcb02_insn_bytes_valid(struct vcpu_svm *svm)
> +{
> +       svm->nested.vmcb02_insn_bytes_valid =3D
> +               static_cpu_has(X86_FEATURE_DECODEASSISTS) &&
> +               nested_svm_vmexit_supports_insn_bytes(svm->nested.vmcb02.=
ptr);
> +}
> +
> +static void nested_svm_invalidate_vmcb02_insn_bytes(struct vcpu_svm *svm=
)
> +{
> +       nested_svm_invalidate_insn_bytes(svm->nested.vmcb02.ptr);
> +       svm->nested.vmcb02_insn_bytes_valid =3D false;
> +}
> +
>  static void nested_svm_inject_npf_exit(struct kvm_vcpu *vcpu,
>                                        struct x86_exception *fault,
>                                        bool from_hardware)
> @@ -68,6 +97,10 @@ static void nested_svm_inject_npf_exit(struct kvm_vcpu=
 *vcpu,
>                                     (fault->error_code & ~PFERR_GUEST_FAU=
LT_STAGE_MASK);
>         vmcb->control.exit_info_2 =3D fault->address;
>
> +       if (from_hardware)
> +               nested_svm_set_vmcb02_insn_bytes_valid(svm);
> +       else
> +               svm->nested.vmcb02_insn_bytes_valid =3D false;

For consistency, should the line above be:

nested_svm_invalidate_vmcb02_insn_bytes(svm);

>         nested_svm_vmexit(svm);
>  }
>
> @@ -869,6 +902,7 @@ static void nested_vmcb02_prepare_control(struct vcpu=
_svm *svm)
>          * Filled at exit: exit_code, exit_info_1, exit_info_2, exit_int_=
info,
>          * exit_int_info_err, next_rip, insn_len, insn_bytes.
>          */
> +       nested_svm_invalidate_vmcb02_insn_bytes(svm);
>
>         if (guest_cpu_cap_has(vcpu, X86_FEATURE_VGIF) &&
>             (vmcb12_ctrl->int_ctl & V_GIF_ENABLE_MASK))
> @@ -1649,8 +1683,10 @@ int nested_svm_exit_handled(struct vcpu_svm *svm)
>
>         vmexit =3D nested_svm_intercept(svm);
>
> -       if (vmexit =3D=3D NESTED_EXIT_DONE)
> +       if (vmexit =3D=3D NESTED_EXIT_DONE) {
> +               nested_svm_set_vmcb02_insn_bytes_valid(svm);
>                 nested_svm_vmexit(svm);
> +       }
>
>         return vmexit;
>  }
> diff --git a/arch/x86/kvm/svm/svm.h b/arch/x86/kvm/svm/svm.h
> index e958943b8162..1e12ef1105c0 100644
> --- a/arch/x86/kvm/svm/svm.h
> +++ b/arch/x86/kvm/svm/svm.h
> @@ -243,6 +243,9 @@ struct svm_nested_state {
>          * on its side.
>          */
>         bool force_msr_bitmap_recalc;
> +
> +       /* True if VMCB02 has instruction bytes for the current nested ex=
it. */
> +       bool vmcb02_insn_bytes_valid;
>  };
>
>  struct vcpu_sev_es_state {
> --
> 2.43.7
>
