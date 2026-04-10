Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C47C43DBD65
	for <linux-kselftest@vger.kernel.org>; Fri, 10 Apr 2026 22:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775859767; cv=pass; b=Q8e6f+IoXvHFj6GllB6/Ds3WzerL5YTpJGgbu0miz2EzncLPc5JTiUymxwo4mrmkBUZOJhxzkBe0aQmGI13h8/NveUVakeJmeuUBXEzjVYnKE9xTLKXd69VUPGsUa6V/8mOiQn8J1497nZGuUGhzOPbf+/+WTCF8ere7VsbCHv8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775859767; c=relaxed/simple;
	bh=5sV0fyoVLne5Qen+WKeWpPoq7Y7uIPbrOFrfTyCf4W0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VrPNJuS1efiR64aKqN1Gni+5y9zKPjy0Lg5/a7RNBM1LJ6QUaHJR1RPAhLm/nisUarH25qshuNk1DV2l/rhBC9xluY/h9QnpFqpriLS4SNnrKHjZkWJIgSegP7XHXXUT1RV2dvqJYDQ9CW7LDJx1hExmC7C56xxlrG/tux0CNmI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WDZlEuRK; arc=pass smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WDZlEuRK"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-67070d9ba4dso14737a12.0
        for <linux-kselftest@vger.kernel.org>; Fri, 10 Apr 2026 15:22:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775859764; cv=none;
        d=google.com; s=arc-20240605;
        b=PVoLr2/AFTeGmTFSqGzU2aJX0pLcX5QFj3RHwQ8WzXmHVA7eWQsqonXZGeM4d0z5uX
         q+vHo6BhXqVggeV2Ab7pY8CII9Wfa6pe3JC0KGCVMbN79yEQqP/Jc/YNaCqh55L9zTUb
         0farJaOpzvGc0CpHVqEaA2G0aQgujvRGEIZs8FVoB/bkzH0IMkftPsCZhG0TJm/sPolm
         02NVNbpUHVK0imAFeLAQmoatWGYLPcjuSw1yBUfWnVYCrww3aENF7Jr9Rfmo7kUoLis3
         kyEt0tBNe5YsV4bPrWPu3lcRNl63o9g6gOcPn7kL5wEXulceraIcYfo0xI8pOpRuI7ih
         5nUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dWxTs0UhFEVADlU47jI4rZxNB6bESY/XZWZ4wgzYH7A=;
        fh=G3SKfE2B/zvqLlqCJ2IfBiS7aLCP9StplmsUlBqgZ84=;
        b=FcPdRK/oD9fw7jDj9miIORClOLSrdhaoW2oA22WUgcxAZ/+GfTW2+Zz9xV10PVtmJ5
         phlIBI/Nr7vKHcQt9Oc2Zqk6mcSnoGQfhTMSje5sq+8EmtKGCUAfDMiaXw2H5n8LTfSc
         PIolXk/SN2aX1PvDm0fGUK2SOa7g2oCX+LMvPni19fyG3BNA3pVGHviZxoiP06lIVWC8
         yJiRmrDuEnAW295zb0R/aWYncL0j7bf2+dIvLCdGF2rkSWyY6P7IpPnT2HoZ1sd1ai0q
         UzEZg+rzYca1Sn3rO1iAbH36FO7ZdzXVn7tv/YrHPlfTHw4KN2cR4oTk0DgNTkoJxjFA
         or8g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775859764; x=1776464564; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dWxTs0UhFEVADlU47jI4rZxNB6bESY/XZWZ4wgzYH7A=;
        b=WDZlEuRKCHWZtApJFqjbxrC5o1Z6gtEfmcKS9bWKmoEZ6s8QBl2PNoWLMQA6o0ExVj
         aM0pZBMb8eaVbyIQmnAeVs8ba6fEqbgQe+Tj4C18+bIQnKGiY+OpyzZFkB/v78jJzjgh
         Wy285Ia7JTM3qHHUdyNNWneBnlssoB4EwtyK3b0VWHOv5qej4yFfZUVEB412iyxT/WkB
         k4EAGwbFpbpCxISURPAchBBgkLfu2+7Kp6qSbGld5Lv/ZJitzbsF/HzqyIcHyk+/magO
         GRHvWWS8D5mxeXdED6I00iIf6oqmWfaWmdki++2NFAzWTHXSquyG4aFsIHPLHBKFnCv+
         UH0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775859764; x=1776464564;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dWxTs0UhFEVADlU47jI4rZxNB6bESY/XZWZ4wgzYH7A=;
        b=kvgsWJBEuKOnIhd/6h7OFUdSw0raBB+/h0zeuiy1WZhru21Zbe6/a5Unr/RgP24aBr
         /WNwgqoyh6oB2+znxo0Yi/MScV5xygZj1rrTKBCnoF7vgwcpBh5lnEWHSAvim2LC4mMX
         je4REz5zWLiqIwIlNaXaMVNR4yWOKPt8dOFs29tG5WREqpKRxI8i6ockU2w9/iMpfnmW
         3jJYUxEBuqURZCYzD0H2zsl18TDornHaGF2PuUZDt3bGMj+UPysgx93O+8RBHFTW33sc
         iy5FFBXi3bFpe3iU71PbzqXVXruzTtQMMLlckPnCS1321QnVTr1/yuKGyXyYuiyN+Vyx
         Iw9A==
X-Forwarded-Encrypted: i=1; AJvYcCUUrR2GGPshoSJfI7KRsrbId7FYcgACRzAQwfuheKE3aWcf7U0/pQuJDfo0FOE9ipHsKLyWjUt88cpDACVOxDY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRdoizhfp6CE6eNTbg1yKuCNXTzm3DbBs9YF+GKipXVT0DEjd2
	hE8XhSxvpf5Gk5AAHHYV+sVVNPSBT6ykjxtvsjMkQKSgwiwq/h6b2NjJviT94c4IZ09lIsGkmdG
	j3kVuWL25jccHFYze6V3N6IJEgVZpNlna61+T1Otn
X-Gm-Gg: AeBDietPRyJn8HBUCo2HncPrkWjOZpFDoJGROrvMdT7di+x79QjvJoXUI99UjtbC3rN
	tusKYevF0TsbKlFCTA4gkkyk9eD8DUv/Wk0hWPMp1RZMKxGi26G0Bi8rJM7o+YIo81RuofXE7XA
	w3hm6c3nGlgeHqQX/FYiYMFFS+ZLSjsEd2gGQRVP9Uc3iz08iKeKdB7WrCPBTqXDICNk/1dLZU5
	SrtxsVT6tmVpbTjDEsGmIifZEH59QDMnVoe9WTxWyEhsQZzKa7mKOGxcnBTEjMN2GhdOCGIbdvz
	YbRPAAnKLkargJOjRQKSdT7mYDI5
X-Received: by 2002:a05:6402:26cc:b0:664:eadc:7262 with SMTP id
 4fb4d7f45d1cf-6701e2ad1e6mr149856a12.13.1775859763640; Fri, 10 Apr 2026
 15:22:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260402223108.650572-1-jmattson@google.com> <20260402223108.650572-2-jmattson@google.com>
 <adl30JQXxxQGmHvj@google.com>
In-Reply-To: <adl30JQXxxQGmHvj@google.com>
From: Jim Mattson <jmattson@google.com>
Date: Fri, 10 Apr 2026 15:22:29 -0700
X-Gm-Features: AQROBzBPJqBkmwQWBKn_x66e1ny7Ah7maxTYcpMJflkeizG3bpZTClRBQ8ejwG4
Message-ID: <CALMp9eRgF7+99P+-jjROastwJyfHEQE60pa=guFvC0KsDoHeEg@mail.gmail.com>
Subject: Re: [PATCH 1/3] KVM: x86: Rename supports_cpuid_fault to supports_intel_cpuid_fault
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Clayton Pence <ctpence@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 10, 2026 at 3:21=E2=80=AFPM Sean Christopherson <seanjc@google.=
com> wrote:
>
> On Thu, Apr 02, 2026, Jim Mattson wrote:
> > The function, supports_cpuid_fault(), tests for guest support of Intel'=
s
> > CPUID faulting feature. Rename the function to supports_intel_cpuid_fau=
lt()
> > for clarity.
> >
> > Signed-off-by: Jim Mattson <jmattson@google.com>
> > ---
> >  arch/x86/kvm/cpuid.h | 2 +-
> >  arch/x86/kvm/x86.c   | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/x86/kvm/cpuid.h b/arch/x86/kvm/cpuid.h
> > index 039b8e6f40ba..51cbe67c992a 100644
> > --- a/arch/x86/kvm/cpuid.h
> > +++ b/arch/x86/kvm/cpuid.h
> > @@ -181,7 +181,7 @@ static inline int guest_cpuid_stepping(struct kvm_v=
cpu *vcpu)
> >       return x86_stepping(best->eax);
> >  }
> >
> > -static inline bool supports_cpuid_fault(struct kvm_vcpu *vcpu)
> > +static inline bool supports_intel_cpuid_fault(struct kvm_vcpu *vcpu)
>
> *sigh*
>
> I was going to suggest supports_misc_enables_cpuid_fault(), since KVM emu=
lates
> the MSR for all CPU vendors, but the enable is in MISC_FEATURE_ENABLES, n=
ot
> IA32_MISC_ENABLES.
>
> What if we just drop the helper?  There's only one user.  I.e.

My thoughts exactly. :)
