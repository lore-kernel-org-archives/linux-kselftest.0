Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 683BC37B017
	for <linux-kselftest@vger.kernel.org>; Thu,  2 Apr 2026 19:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775158813; cv=pass; b=Vn++ZzqRKY6jMKF1ccePHNrVY8SSN2wGl//NtPrI9hfOM0nX5H/+eLO1Xd+lCbAOIfX2LklHI4zSwj5P6CsUdPf0F5Xj/MXftNWyyisANIzQYG0gJrZrPiaN6iRlhPQVcO3g3RfVXCR37mw+n+VHJWbVOPsIebtb15AAtUWtz+g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775158813; c=relaxed/simple;
	bh=US2V7kzwHw+XpVhDyUggsFAHRpyi5Z5kvJJ43HbFkRM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=smjcEnz95q5nBZ7R+phM/utj0fpfEeaMLWthiXPRZ3Xg+PddXpKNLT+rajQ6LbnRlyyq9+ROGk8keJEF8IqajEIOl6BWr339tSuzkvQjzEPYf8eRRbd2q60o7F0J3nxPk+Nc9cgPyZJbP/kBTMQGLz5yPrGB6ua+dPd9bFF//SI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Z+Wc1N8g; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Z+Wc1N8g"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-66b0dc690bcso370a12.1
        for <linux-kselftest@vger.kernel.org>; Thu, 02 Apr 2026 12:40:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775158809; cv=none;
        d=google.com; s=arc-20240605;
        b=F2jr73tW1pifzyHr06wFWiozvYBUDzCu3ji3qQ2VAy0leyAV6btr6S5Y+YQMHrzIBK
         lnSOeKvslrxnggxgK+7ziP1L8ZMJ21Ns6cXNOwoRsWLSjm+5tl/VSS8WtCMDtINi++xM
         owVBrt9ubDVN00J1QyrAa/71wuJqa7o3gw+t5dPr+h+j8EK7RCOPfyhTF0dSYy7WNENh
         qMJ/3Il2bV+8OnTeyYedOezboFTMzcAWchdUrvfqR12A5oeyeAbJoXIi0uEoDoVWNC2H
         JsX0JN1qkQep+0XXi7bGunVKoFHr83YFyBYnMFrtlFQIUFjgWlYWuuXCKn9hpD3HMzVI
         0psA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=J0DvflLdp3i7a17ynT3a78GmDFDn7qbQSpDZ8abq9cA=;
        fh=U2VUF2p+PwHNNNVo+fUXCiwCPWmUu9uE+iF+IFdkh+8=;
        b=TdOpFtxA1KUgjK3c2Xr1pb9KUaeIOMLGohsnmsMqwJFWolB6RqbVMonj5axvahNXSJ
         c1qkeV8h1S2zGVuI98NufGlN/9D6+AILr8g/cFVAYULgLm+mzNBszx46ISPCecuA09pF
         h8lBi/ScOAnbvOdyRXlqLj9mJHkhvCrlW/fTOa2jfdRkdUAGyrwirNhFVt/NV6xK46zB
         9k796lm4Hsy5nbjCUDXEgZk3pXZVJSUlKZbYBP5zSLKyMrcTjBrpeCEFJoENwaFI7Zrc
         g4vtKkTGcl8S2gngSp7ecRKL/9bzUCYU4eaSmXlq/lNpAQ0GpuXL3aB0UTj6z4VBCBrA
         WiPQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775158809; x=1775763609; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J0DvflLdp3i7a17ynT3a78GmDFDn7qbQSpDZ8abq9cA=;
        b=Z+Wc1N8gFdHRRaTj4eCm1Vdd+8m71jgh+a/eRMZKAkXD05ZWd+1ezgQ4peeqABToHi
         p3hn1BF/wNmKvy0/Ho9Vtmx10Yjna4fouN4cxibja4dMIpVm/lARlT59/RvdAWG9OOxJ
         v9uONRDeERj3QVAi5frZwvpNdkTLO5YM/MXcbdU0YWdcVlp0ka3P1uZwFlxa5clsoViG
         kdSEi00rAX2QWbXX+xg8FDQ88TQYTOzktjH4LOJBqty87GKGF01jRyphDX7rlOOo2MKV
         ym1EHGKXjC1XOditNR23aN/rA3Dpj4b8WErLS4SugPUxYh0ilgtow/l12XpAV2luuSfO
         iX+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775158809; x=1775763609;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=J0DvflLdp3i7a17ynT3a78GmDFDn7qbQSpDZ8abq9cA=;
        b=d5y7f6ELdwHP8B8G3xF2FpA/8yOl+CPSajIiNcxaQlN26CWRq2po/L2hL1TFBuWor4
         37CqaUTD1GmHkolG9pTzYqKxtSuWIVh5EB7MT5NaPOvc4rZm6pWNpwET9vQabm7pycvJ
         ooBqN2xwDp2g4FsgzXHj9y0Srsq2oyeuOoEQOjgVreoR+5PBFMJdb0CRFWW06m4OAB6C
         /Kp3bNW7LZLNNnmlwOAaKneDSxWhnwkjteSQ8v8wQoLnJd77M42w2+dly3cTAhyyUMqA
         bL/5po3X0z5YvF1htLvFLca+kf1XamZVyaMpPqIgPTrQH3ra1vfkY0RYjhMNvoBigW+t
         WDDA==
X-Forwarded-Encrypted: i=1; AJvYcCUInfx49wI3HQ4kiyem81ne8mu3C8pqhdj3BuFJADRTlbIRSxP8AJN80LlJZj3iZfqejt4HtJen2ePRw9Xm22s=@vger.kernel.org
X-Gm-Message-State: AOJu0YxuFMuRmVMLfRPUrHTMFFWJH16PCl0sM3Ox8CQtsnuGhM1jTz2w
	cfYb3lGSv5rHP2t3oGkO93Z+KV9H7exMOHz0q5IU64/kIO3VXrZQoB/x+3ZfFFoUbhrlh3kvcnD
	DjGaqQoMAccrVJIg0+CcUvCjUup1gIW53khx5PQF5
X-Gm-Gg: AeBDieuUWZptaLjz0DMZLlEd5JSkxmMdm6AjvdyVmTH5GCIeO6wz+g1E8LguUKkY3tp
	BI9OdZuHaWkmiDR7cthG+1rVcaBcYe1CNSMkEjMSdrBdVXg276cyPDndIeYD73+dFGDs13uZvvU
	UefCM6G7Y+gCtNowtRAVyVL/lM93fayIZFpnKHtPMFLM6ue1xiAkRwnjyIXtqnJxHY1pUGTu5rm
	O70VCP+iVHQ2Gz/izyOYqTJXm056Z5t8fewnKqhXrNkxZnQsHwehDa5fEsStdrogXnpU13OIdZU
	sEPsj+s=
X-Received: by 2002:a05:6402:4588:b0:66b:9469:a0f1 with SMTP id
 4fb4d7f45d1cf-66e41481095mr1730a12.14.1775158808171; Thu, 02 Apr 2026
 12:40:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327234023.2659476-2-jmattson@google.com> <202603301501.N2sdlIQ9-lkp@intel.com>
In-Reply-To: <202603301501.N2sdlIQ9-lkp@intel.com>
From: Jim Mattson <jmattson@google.com>
Date: Thu, 2 Apr 2026 12:39:54 -0700
X-Gm-Features: AQROBzAy_EbHuWlN5wT5_Opuw5NUyxR9m0jIc3ZzushJ6pVsut7GdsF_uvQSOn8
Message-ID: <CALMp9eSO6gz4R0f1S=E-sA3YE8KE0uJ30otcGsMV1NS3ujUcNA@mail.gmail.com>
Subject: Re: [PATCH v7 1/9] KVM: x86: Define KVM_X86_QUIRK_NESTED_SVM_SHARED_PAT
To: kernel test robot <lkp@intel.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Sean Christopherson <seanjc@google.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Yosry Ahmed <yosry@kernel.org>, oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 30, 2026 at 12:50=E2=80=AFAM kernel test robot <lkp@intel.com> =
wrote:
>
> Hi Jim,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on 3d6cdcc8883b5726513d245eef0e91cabfc397f7]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Jim-Mattson/KVM-x8=
6-Define-KVM_X86_QUIRK_NESTED_SVM_SHARED_PAT/20260328-110805
> base:   3d6cdcc8883b5726513d245eef0e91cabfc397f7
> patch link:    https://lore.kernel.org/r/20260327234023.2659476-2-jmattso=
n%40google.com
> patch subject: [PATCH v7 1/9] KVM: x86: Define KVM_X86_QUIRK_NESTED_SVM_S=
HARED_PAT
> config: x86_64-randconfig-016-20260330 (https://download.01.org/0day-ci/a=
rchive/20260330/202603301501.N2sdlIQ9-lkp@intel.com/config)
> compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20260330/202603301501.N2sdlIQ9-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202603301501.N2sdlIQ9-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    In file included from arch/x86/kvm/svm/svm_onhyperv.c:11:
>    arch/x86/kvm/svm/svm.h: In function 'l2_has_separate_pat':
> >> arch/x86/kvm/svm/svm.h:626:18: error: implicit declaration of function=
 'kvm_check_has_quirk'; did you mean 'kvm_check_request'? [-Wimplicit-funct=
ion-declaration]
>      626 |                 !kvm_check_has_quirk(svm->vcpu.kvm,
>          |                  ^~~~~~~~~~~~~~~~~~~
>          |                  kvm_check_request
>    In file included from arch/x86/kvm/svm/svm_ops.h:7,
>                     from arch/x86/kvm/svm/svm_onhyperv.c:12:
>    arch/x86/kvm/x86.h: At top level:
> >> arch/x86/kvm/x86.h:429:20: error: conflicting types for 'kvm_check_has=
_quirk'; have 'bool(struct kvm *, u64)' {aka '_Bool(struct kvm *, long long=
 unsigned int)'}
>      429 | static inline bool kvm_check_has_quirk(struct kvm *kvm, u64 qu=
irk)
>          |                    ^~~~~~~~~~~~~~~~~~~
>    arch/x86/kvm/svm/svm.h:626:18: note: previous implicit declaration of =
'kvm_check_has_quirk' with type 'int()'
>      626 |                 !kvm_check_has_quirk(svm->vcpu.kvm,
>          |                  ^~~~~~~~~~~~~~~~~~~
> --

It looks like svm.h should include x86.h.

Sean: Do you want me to send a new series?
