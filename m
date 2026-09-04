Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1701A3DDDA0
	for <linux-kselftest@vger.kernel.org>; Fri,  4 Sep 2026 23:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788566348; cv=pass; b=BibxkjUesMsMBSHIGzszhM7WIkmpg0U4MG76W9+og1ARp/0QgWqYLuCkRTYsj5G6y56OGqfPzpiBZL11e+spGA2mGF8YRZlRs2InJy5vQPm5b8pdUA1WmBwO90HZBW9D3bNabe+IFu5GeMxP+vbH6J8EI/7r4+a4bZD8xp5ipYk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788566348; c=relaxed/simple;
	bh=krBmnFRbIq8gF67j4Y7+7n50O8rGry2k/xf6HDV+HQs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IE+5CNa+g0OL9n+U7YyBET38UxR6bI+99n75UnOhlEc5MMNbFh8+EGAccHeeDd8ADYht/SikhAL1s3DINfb7TFDv/AVPJ14poxBFIufVHGC0b5uem7ha+j0/6jIbRlIdzWXyUDqsF1A9bVTxLhAcYxYl0BGuWAzGQA2FXAaVh4g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tPfZhjQh; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tPfZhjQh"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a5d8fd8d8dso1648a12.1
        for <linux-kselftest@vger.kernel.org>; Fri, 04 Sep 2026 16:59:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788566345; cv=none;
        d=google.com; s=arc-20260327;
        b=nKfOQywFuRHBUzfQ7ceU8rR8oQqGyRbJHCpOlEc5M3vgfgOT5UlgTBXoQud+SqJRlC
         /BYiO48mwqzadydrjFa/DaucN59cPFpd6NYS+K5aQGVylg92qRS3PTwDfygRNh0ycVEF
         4fVmCO2Jt921VA5SYqaD9z+FPPH3RCwChsRZBUgE7gRU6ARbu4yrQbbGmK8W8BIrbjXU
         OkpcH38IJXE6IHTcBKVPi1WTEh3b3tCD8AAnZHWcaeSoFONZyj5fdCdNJkvu0CmiB78A
         f3BSmz6U8g8mjFNTWJz4+3+4/Dydunb1wffqKcZVggaSRSQeGJ543zjuNOajglAPggg/
         47yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=P15M9YH6S+kcXbz1rCaJgiRw7qh7wUbJsCq2CIKQ2jE=;
        fh=XLBnJLmqmyP2cDBMQpz9Eun89sXsVBKATGE5QeGQXhA=;
        b=kaIUm7K4ixEoOXUbgsKGkEhPEqqhVxFl30IpQaruOa9NT/ALrKbF5y5hy4dBGfCiio
         yExFj2PryF9TBEppF31To5U46yl/Wsnp6wm45DhtKUnQJO+OcLMFIu4Ggwlg7r17+B/v
         ekK3R6l61YahTyTSDFkz3g8cyw6kr4H/9tzhC/BRymj2j/efnqKELCxW9eTVVr/0VMb+
         vI+Qd4zt4IS6NbQR8I+3DQm2DiS7r4Dw/nm5/ZoNYFx1lx4XLjE8DEvqFpHB0z5cwjF/
         BHnRpH9S2NTYGLkNi14Ebsls/tdQvmbbUPxyOi3aiL0zheHvgDdvfNIzzwudGgcfo/yf
         SauQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788566345; x=1789171145; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=P15M9YH6S+kcXbz1rCaJgiRw7qh7wUbJsCq2CIKQ2jE=;
        b=tPfZhjQhDVwmNy1sVnstD0Be7ummGaDZcrFc8j11i9CKV2eqKlaBGDmMJ901e8Xtjq
         INWzo1vj34VIbPo4v7d0V8PgxdbpnpTYxeB+q7WUqa0LnoxAQRUtdcZzIW629DdFomkA
         fICmank83k1iDHCMF4GUMcZf1yZl//9EmgQHpUlYYhBdzoul1Z7BQYEMFPD9/8qh9+Nr
         w01B7J0z8DHEdg24wiE8ive+B3kxmXhfAQdxYdnXsV488N0wd7tgzq9HGew+L9sIzdJQ
         LXWpyiVUKbUCCZF85YM7JHaXRoguDSWDVu+ntMLpEF3Sp8V/u/H5cDGzkgXmmLPj7A2b
         4qow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788566345; x=1789171145;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P15M9YH6S+kcXbz1rCaJgiRw7qh7wUbJsCq2CIKQ2jE=;
        b=X0VlHqlmmUX23uQ68Qu6wOFHbe67L2OYbDg34Z1W6ZspIc0mMyywxBZBmX5yhKQ86H
         9Vb4H4BNKljIHc2366SpJhX48ThrtANzas57A+lZ0vZH/WNi6iNO49+d4g1FHPTr6Ac6
         K0anF4viqznRL82kZUYoklBbcTEIRv0dC2WQCV2EU9MuS6K/6MyNtWmBj0fqJPndOqIV
         dHbhXyrd/7AvCzySmThBrEyXjoPQYVksSRvYnEdLFIL8JwB5krx0O2P9m32lWLCVj1PQ
         AsPsk+0YIAtomrvsgHvws1Ds1QmReH7vio2GQgO9b8D3wvwB7d6gpNVlf3f3PXsFSnzL
         eh+g==
X-Forwarded-Encrypted: i=1; AKwUvByPIQLz24KLmleaN2qxuIC0iRFwLOnTw8rKQuZ2OYXkaK9VTgeMJ0+8EKa3VfW2SzAx6tg9ZLTOwUplh2GRy3k=@vger.kernel.org
X-Gm-Message-State: AFuF++mKkf7dq93pOLmOBAS9XAtTlyii6yxhM9nMzg5pRKFwtZ+91VXb
	vn/5WVtb4+s+KJQn9TXsvun2Atoj55CpT+BJFTWnctTXrBx7wbQeVhHK5zUORq9vPtgC+0XxhW4
	h6EMSqv8vzWrkgq6wQg6tBS9VZIa3VRMc/XeHi+tPJBisBVtk5FD0SxfkPC0=
X-Gm-Gg: AYBFou34qC4iY0nQi5SF1G7ZuIAgZgi0+hiqL3b+n0YtdJg3qAx5myefmEs/aGClL5b
	S0OdwZADrX/T1yn8wCymPzKsAKGvV6FH1h5Xv0ITWW/R5KEinTXSq7TU6L5VagmrHJZsTnEom3U
	LA7YH6s26xfnh4W/wDyT0X1eeTKIAU2qhM+4iV7hyajSCxWxxjR8xb0PabpMVS1oye95nlHoS8c
	Ox2IrKHizU5NzzGF6fXHoI+MkNu/wH39TbZPoICwyE4QI3UJ0jiEJGyx6OCAv24milxdjCHB+UZ
	UF0PzIe57v0wgCOV5ydVoOnq08wjckEEoPfOphfL9edi
X-Received: by 2002:aa7:c0c3:0:b0:6a6:967c:3186 with SMTP id
 4fb4d7f45d1cf-6a7f67ae76amr12701a12.2.1788566344746; Fri, 04 Sep 2026
 16:59:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824123954.315112-1-zhang_wei@open-hieco.net> <20260824123954.315112-5-zhang_wei@open-hieco.net>
In-Reply-To: <20260824123954.315112-5-zhang_wei@open-hieco.net>
From: Jim Mattson <jmattson@google.com>
Date: Fri, 4 Sep 2026 16:58:51 -0700
X-Gm-Features: AcwNN1VzwHjjOpDM8aPo2_uyIHXlBmHXB-Cus8IcnrfXF5YVspG-M2LzaQS3L0E
Message-ID: <CALMp9eR=TNUqfbNCFkxmg=O_Obcj11Tu9jAmX6Pe60qvvNx-2g@mail.gmail.com>
Subject: Re: [PATCH v5 4/8] KVM: nSVM: Propagate hardware DecodeAssist bytes
 to VMCB12
To: Tina Zhang <zhang_wei@open-hieco.net>
Cc: Sean Christopherson <seanjc@google.com>, kvm@vger.kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, zhouyanjing@hygon.cn, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 24, 2026 at 5:40=E2=80=AFAM Tina Zhang <zhang_wei@open-hieco.ne=
t> wrote:
>
> DecodeAssists provides instruction bytes for nested page faults and
> intercepted page faults caused by data accesses.  When the feature is
> exposed to L1, copy fresh hardware-provided instruction bytes from VMCB02
> to VMCB12 for these exits.
>
> Clear the VMCB12 instruction-byte state before rebuilding it, and leave t=
he
> length zero for instruction-fetch page faults, unrelated exits, and exits
> without fresh hardware bytes.
>
> Signed-off-by: Tina Zhang <zhang_wei@open-hieco.net>
> ---
>  arch/x86/kvm/svm/nested.c | 35 +++++++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
>
> diff --git a/arch/x86/kvm/svm/nested.c b/arch/x86/kvm/svm/nested.c
> index 6770721d4e4c..2db0ec66e8dc 100644
> --- a/arch/x86/kvm/svm/nested.c
> +++ b/arch/x86/kvm/svm/nested.c
> @@ -42,6 +42,20 @@ static void nested_svm_clear_insn_bytes(struct vmcb *v=
mcb)
>                sizeof(vmcb->control.insn_bytes));
>  }
>
> +static void nested_svm_copy_insn_bytes(struct vmcb *to,
> +                                      const struct vmcb *from)
> +{
> +       u8 insn_len =3D from->control.insn_len;
> +
> +       nested_svm_clear_insn_bytes(to);

It's not obvious to me that this clearing is necessary (except in the
case of the early return below). The APM does not say what happens to
the remaining bytes if there is a short read.

> +       if (WARN_ON_ONCE(insn_len > sizeof(from->control.insn_bytes)))
> +               return;
> +
> +       to->control.insn_len =3D insn_len;
> +       memcpy(to->control.insn_bytes, from->control.insn_bytes, insn_len=
);
> +}
>  static bool nested_svm_vmexit_has_insn_bytes(const struct vmcb *vmcb)
>  {
>         u64 exit_code =3D vmcb->control.exit_code;
> @@ -67,6 +81,25 @@ static void nested_svm_clear_vmcb02_insn_bytes(struct =
vcpu_svm *svm)
>         svm->nested.vmcb02_insn_bytes_fresh =3D false;
>  }
>
> +static void nested_svm_update_vmcb12_insn_bytes(struct kvm_vcpu *vcpu,
> +                                               struct vmcb *vmcb12,
> +                                               const struct vmcb *vmcb02=
)
> +{
> +       struct vcpu_svm *svm =3D to_svm(vcpu);
> +
> +       nested_svm_clear_insn_bytes(vmcb12);

Clearing here is premature. If L1 does not have
X86_FEATURE_DECODEASSISTS, the "Guest Instruction Bytes" fields of
vmcs12 should not be touched.

Moreover, as I pointed out earlier, if L1 has
X86_FEATURE_DECODEASSISTS, and the VM-exit doesn't have instruction
bytes, you onlyhave to clear bits 7:0.

> +       if (!guest_cpu_cap_has(vcpu, X86_FEATURE_DECODEASSISTS) ||
> +           !nested_svm_vmexit_has_insn_bytes(vmcb02))
> +               goto out;
> +
> +       if (svm->nested.vmcb02_insn_bytes_fresh)
> +               nested_svm_copy_insn_bytes(vmcb12, vmcb02);
> +
> +out:
> +       svm->nested.vmcb02_insn_bytes_fresh =3D false;
> +}
> +
>  static void nested_svm_inject_npf_exit(struct kvm_vcpu *vcpu,
>                                        struct x86_exception *fault,
>                                        bool from_hardware)
> @@ -1332,6 +1365,8 @@ static int nested_svm_vmexit_update_vmcb12(struct k=
vm_vcpu *vcpu)
>         if (guest_cpu_cap_has(vcpu, X86_FEATURE_NRIPS))
>                 vmcb12->control.next_rip  =3D vmcb02->control.next_rip;
>
> +       nested_svm_update_vmcb12_insn_bytes(vcpu, vmcb12, vmcb02);
> +
>         if (nested_vmcb12_has_lbrv(vcpu))
>                 svm_copy_lbrs(&vmcb12->save, &vmcb02->save);
>
> --
> 2.43.7
>
