Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5CE439185E
	for <linux-kselftest@vger.kernel.org>; Fri,  4 Sep 2026 23:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788563242; cv=pass; b=A/pxjLPFh6CjSAKAJoDb2scPPlDnnnpW1Xrs/srHfMF01lSNqCyRi/OUgkHLnTrLp56oLqvGSZT4K0nardcu7vtcUHgiw4jhuDM6XQQNAE17d+LEaNSMXc9dEdYgZZzvjeOatrp4MCXfKb/QNsKuhCXnTdLFKZizFMnF+Rk9k/I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788563242; c=relaxed/simple;
	bh=gb4dOZ2ww7j3/A+6+TU83/q7vS18PQ0rzYZIjQp5d48=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cypSVVGJVr18oN3ZcBTMtpHjKcpOLkQS8va4EBFBqRscyHQXCOWBVPDG+yHj7UiMbdKe5HLwOkQsFGHD81iX+lJ26LGAMzWKCTWQBQyUdJkcdWSQR74ELyK8SlGfgk+lB5qSCLNBFbDLBYfldUaib8d0Sq/fdvkF7y9HnfyLg08=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=c+Mm4LUy; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="c+Mm4LUy"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a5d8fd8d8dso1372a12.1
        for <linux-kselftest@vger.kernel.org>; Fri, 04 Sep 2026 16:07:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788563239; cv=none;
        d=google.com; s=arc-20260327;
        b=GP2jscaqx08r8wKTJpOy3thtJhCLrIpeBn8LWVfC5S6cpnsv2MlGfS/IREKnXBk0kB
         c+bcWN7o0StVdjJW7NcVSuGm7PbplyM1jqFFirdMc4YQAprjMpfpPKLSEaZt3Rlm5A4z
         iyf6JBqYIxBnLjKpsBd1TkJoUsq/gwhYFqoh90GpOCOxigsuRzUpxvbakr0Yl97cL85l
         2hOpaUsYtEc/mK6tz75EBYywZachbGpjroBBgqiMdTqY3M6HD1AyJgZzmezJqZzdDJcs
         blquawF86gH7AVw9Igyq06kEFlZ4JafqviDUTbjBmKK971hBSS/51OgsRXACiLm2Yzkf
         9NNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/6zIiOUhrTcb0uUWQ8IotYmhxf+N+MfQ3oz9P1c3HMU=;
        fh=UyqKTW6aj9mXQ4H6IAVhoVSmvmKxEp8D9Xiao8JQ4aM=;
        b=JBXsk7VC81OV2w2QeS8YW+SBb1JuvJZrW9w/LixETgj0wmJBA7074o5Woal29xXFo4
         /KTQTQjSI4/Q7zWqJdO/eOhSw54rW0fT2HuC7cIdsP1W/Pw/3Sq7Ngvwe9FN/R6glZ3/
         m5re8lkIg0vd0uOaqIorfK+ZBuT6BWvH4O0AQs8q3k2km1vl03vYLxCyJ0XWkTCgb6M5
         pTzsYCq4E1YECtQyr2i0+lmEKSoa928rsTBO4gtX/2vIQkyAwSIN1UTIB37PTqrFIaDb
         mHYTA1XBlP6qDWGRlU0YWRe5Ub7DdYvchn+jOlMv7L/paDXe6zOjUillym1v6reISayV
         Sdaw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788563239; x=1789168039; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/6zIiOUhrTcb0uUWQ8IotYmhxf+N+MfQ3oz9P1c3HMU=;
        b=c+Mm4LUy6CQfMa6+qhM4yfbVh1vMpIvUyh2B2j+e69FRqYw3Ov5mzgNtu1GXPZEntP
         kMTxC3cWeGGQqL/i3eplHjKRxsXvAW8izmZl1o5JclnxB5Utk01bOVDW2Mg7ofN+vhhl
         wI/Ge93armEP8pAWxKTBcSbmcr1FTAxLMHoxjcK4Jx2v4yOFGqePGjRBMIZYHXex9bfo
         erXeJPKyV5fMhSg/NnKGWj6AFBWy8Z7NTa75p6owNJBAsJL9TFDGXIgVNHjjq0k7k0h5
         t7rrZLOkSvlRmISH3qR37L5xBb4RgwWkQNV20z4i+dg79OWa3T/qsqxrXsZlYMDsav8Z
         R8yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788563239; x=1789168039;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/6zIiOUhrTcb0uUWQ8IotYmhxf+N+MfQ3oz9P1c3HMU=;
        b=UNIWHunQd/yzUv3DhxJYbG75Jdq+udZmuaZ7eTH+ZbIKY2lsAaD0NNVA1dnz6EYHfE
         d0KdzWl3q120T7LPjQeL8spE5U+3Q3TtjYGsfeJ4vZsHxQ878/ey0XPHeNfawlFY2nIO
         ZVGPo5cK5fxKgqOS5ZRT50KxnpPAJdQHYEVKpxMmx/nHJhEhJwkXp0TNGbP9HZmRZlud
         b4X/QydIvzVIOJ5e0CtcdAHZC6q7jkl7AOJ+mM9aSq0hFqv4jgPA585RTMmybGd/dadz
         8Hwj9JzpBwQ0o1ByCLnZ8uaypOobjPwdy9AlugQ+1Ug2SZNMZjRdPOfUyXFFJgfnGaSB
         8IJA==
X-Forwarded-Encrypted: i=1; AKwUvBy3/MaFMfZHYgKGRuIUugc7X6aFElUTlyIF2ZjjOf1n40eJh9dTY9x2tyfPQmb8ZibmgiHM/RauSjS4vdRUlm4=@vger.kernel.org
X-Gm-Message-State: AFuF++k24/9kEITykGD5/2G0hnHi4akx2ldF/xBkzizd+rAN9EXYcj0y
	eiFXxIXT4Wzh86ROtTkrnpMTQ47htmW6MQRz/Pp6pvQXktZ2ApCSW5dU6eoSwNhMhE7pZ6sYH6v
	RraB6v7pHu5YLk6/606ivN2tD+zaDDsQPTTljaOHu
X-Gm-Gg: AYBFou1N3TxCX7NL6ZD38cwFj78ujr/vDPO50FgcDuypXIBxASRQUTiplxbbxAztyin
	Z6xDmF6GebebvZlsy/+kl2oyk4PzzTeHi8ZhiaFAwdzpKzuEVb81YboC3whcyZrWWiOjtXewRwR
	yk1f6ttDvJ0kzI5l4kBNI4ZgMzDJbOCs/Wek7RSHrsxxM815T+u9KLIEKQGQF214UnOBWaeCM60
	M9FwDC941QwFW07KSu71tabCl3c4Fwh3YiFVRGnJY5ogRM1YdW47FeOzwX/8p/JqYF4qUNPvs4f
	oeSZxdxf0vYqwD/75Q/O+rrI4JFosAb4GGlpTIhn9QjP
X-Received: by 2002:a05:6402:311c:b0:69e:98c8:e958 with SMTP id
 4fb4d7f45d1cf-6a7f687b853mr12119a12.7.1788563238383; Fri, 04 Sep 2026
 16:07:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824123954.315112-1-zhang_wei@open-hieco.net> <20260824123954.315112-3-zhang_wei@open-hieco.net>
In-Reply-To: <20260824123954.315112-3-zhang_wei@open-hieco.net>
From: Jim Mattson <jmattson@google.com>
Date: Fri, 4 Sep 2026 16:07:06 -0700
X-Gm-Features: AcwNN1W1tvX6VzRjnC7l8gz4hxgqZGETgcAZJsyQxtEsA1mVWr9eN5JoJOp6QQk
Message-ID: <CALMp9eSmrHdLpOi9-xQvcRUxyVN-8CG2MKWnxKfXFaBBDztzNg@mail.gmail.com>
Subject: Re: [PATCH v5 2/8] KVM: nSVM: Synthesize DecodeAssists EXITINFO for
 emulated intercepts
To: Tina Zhang <zhang_wei@open-hieco.net>
Cc: Sean Christopherson <seanjc@google.com>, kvm@vger.kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, zhouyanjing@hygon.cn, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 24, 2026 at 5:40=E2=80=AFAM Tina Zhang <zhang_wei@open-hieco.ne=
t> wrote:
>
> When the x86 emulator encounters an instruction intercepted by L1,
> svm_check_intercept() synthesizes a nested VM-Exit without fresh hardware
> DecodeAssist state.  Populate the architectural EXITINFO fields when
> DecodeAssists is exposed to L1.
>
> Generate EXITINFO1 with the GPR number for MOV CR/DR, the interrupt vecto=
r
> for INTn, and the linear address for INVLPG.  Set EXITINFO1 to zero for
> CLTS, LMSW, SMSW, and INVLPGA; the INVLPGA address remains in guest rAX.
> Clear EXITINFO2 for all covered intercepts and leave unrelated intercepts
> unchanged.
>
> Signed-off-by: Tina Zhang <zhang_wei@open-hieco.net>
> ---
>  arch/x86/kvm/svm/svm.c | 48 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 48 insertions(+)
>
> diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
> index 9d607b98bd06..c7c1f1527c3c 100644
> --- a/arch/x86/kvm/svm/svm.c
> +++ b/arch/x86/kvm/svm/svm.c
> @@ -4810,6 +4810,52 @@ static const struct __x86_intercept {
>  #undef POST_EX
>  #undef POST_MEM
>
> +static void svm_prepare_decode_assist_exit_info(struct kvm_vcpu *vcpu,
> +                                               const struct x86_instruct=
ion_info *info)
> +{
> +       struct vmcb *vmcb =3D to_svm(vcpu)->vmcb;
> +       u64 exit_info_1;
> +
> +       if (!guest_cpu_cap_has(vcpu, X86_FEATURE_DECODEASSISTS))
> +               return;
> +
> +       switch (info->intercept) {
> +       case x86_intercept_cr_read:
> +       case x86_intercept_cr_write:
> +               /* MOV CRx: bit 63 set, GPR number in bits 3:0. */
> +               exit_info_1 =3D BIT_ULL(63) | (info->modrm_rm & 0xf);
> +               break;
> +       case x86_intercept_clts:
> +       case x86_intercept_lmsw:
> +       case x86_intercept_smsw:
> +               /* CLTS/LMSW/SMSW: no decode information, bit 63 clear. *=
/
> +               exit_info_1 =3D 0;
> +               break;
> +       case x86_intercept_dr_read:
> +       case x86_intercept_dr_write:
> +               /* MOV DRx: GPR number in bits 3:0. */
> +               exit_info_1 =3D info->modrm_rm & 0xf;
> +               break;
> +       case x86_intercept_intn:
> +               /* INTn: software interrupt number in bits 7:0. */
> +               exit_info_1 =3D info->src_val & 0xff;
> +               break;
> +       case x86_intercept_invlpg:
> +               /* INVLPG: linear address of the target page. */
> +               exit_info_1 =3D info->intercept_linear_addr;
> +               break;
> +       case x86_intercept_invlpga:
> +               /* INVLPGA: the address remains available in guest rAX. *=
/
> +               exit_info_1 =3D 0;
> +               break;
> +       default:
> +               return;
> +       }
> +
> +       vmcb->control.exit_info_1 =3D exit_info_1;
> +       vmcb->control.exit_info_2 =3D 0;
> +}

Can this entire function be integrated into the existing switch
statement in svm_check_intercept()?

And, if !guest_cpu_cap_has(vcpu, X86_FEATURE_DECODEASSISTS), should
exit_info_1 be cleared for these intercepts?

>  static int svm_check_intercept(struct kvm_vcpu *vcpu,
>                                struct x86_instruction_info *info,
>                                enum x86_intercept_stage stage,
> @@ -4931,6 +4977,8 @@ static int svm_check_intercept(struct kvm_vcpu *vcp=
u,
>                 break;
>         }
>
> +       svm_prepare_decode_assist_exit_info(vcpu, info);
> +
>         /* TODO: Advertise NRIPS to guest hypervisor unconditionally */
>         if (static_cpu_has(X86_FEATURE_NRIPS))
>                 vmcb->control.next_rip  =3D info->next_rip;
> --
> 2.43.7
>
