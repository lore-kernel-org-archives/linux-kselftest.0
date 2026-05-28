Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48D4D26ED33
	for <linux-kselftest@vger.kernel.org>; Thu, 28 May 2026 14:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779978031; cv=pass; b=mGetbHuK6b9yWlzB4O+P3OlWuVMYVGJ4RzXs5GKRqEDuVlmeoM9lqsVnUTr4pwDDTp0JNBFEyIoq82vHXvVuy1D25OGxUjkUS+MRPp7+xth0rlw6i7s+CxJsOwtLsMwAcur4C+/zMLCF0s9CQuvIyqRiWmJ0VbNciv2RSArseI8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779978031; c=relaxed/simple;
	bh=XCaJTjjoXzRW0BU+OoHvqtNVu7svIWiaq9STd3qU94A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aHRzI5De85Boizbl05X9w5BBabnUOCBaTt9KnsQoH92DM0ychKlYOB1qtoP7MXi0Mu7JpoQfc+Wb5ShXmIg/vjfvI66o81q1bZCjOKOCVxtUs8gVNXDOV15F7OD7ZS8FxVXLDQi+zB/2R70qcce1QU0Jae462A/iq4zSaNUA3eE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=s1q7QSpD; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="s1q7QSpD"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-67bf769704eso16a12.0
        for <linux-kselftest@vger.kernel.org>; Thu, 28 May 2026 07:20:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779978028; cv=none;
        d=google.com; s=arc-20240605;
        b=hIzVbhEGClyH4zUN4q/i0BAYhVwMi9T2TTuu4sbexaIHHWq92iibzmPY7ngKTClO02
         V/9flrhzSVUfznS0hvC5vkctsTj02uYZL2qUhbymiPWxoZ3zJ86uc30HxsdmiW8fcVIv
         AbqjXa7S2U4v/j/p4i5IBmS5QNNemyvfQRJl785pVEUvGNXMIpaPnaakHC0Hbo6inUP2
         UWFmLgIzMv0tUvdKQmf69sqv2Qgy2jnC9JNkWLxJmClndvvWGRoFf2MDdlcq4EeSQ/k4
         3vxSWDsiJpzkLlaABLLDFQeOl/mcIpI8zUo9h76DO2wn1AdewxfAAyLy0wSd/hVxHfzE
         hGSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4/BgxV4r2xUtkfEhT3cv7u/G3AQBhHvkVg6ydW30vSQ=;
        fh=QG9lbGb/zvV7i/dBlKz7Oh4WJ1rZDc2B/NxRR2SoKAw=;
        b=NE5QGCdAHzZvilHAVBPHF2DdvkFaz3INFvOHtvYGivbiFrtEtOFKWs2GFUbfic0nyq
         Rj/xl9ce6iZONQs6XuxiF66HVTTQIXRM8PH/+d6nn0MLMudZ7uUJ1Y8GNKGcgXSsKwEM
         bZWdPJ/+f3hTaX3mIhL8zzUMgduhnzNLJmGsYcrS393ffs2T57z9AdnfTIQ7g4001NPK
         tDpb/WVwCVRPfRqnak5Ocr5Yg+Zo1Oeh0+9gxK51lTvFovsBxxtBgnHCFY9whZT1S1kD
         A56BJ8trgOvaHaxwTIH7XCHCS8BJFbyOd//vB5v05pQC9uUSrJwDI7OKSmmgVU30B6KU
         yrSw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779978028; x=1780582828; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4/BgxV4r2xUtkfEhT3cv7u/G3AQBhHvkVg6ydW30vSQ=;
        b=s1q7QSpDQri7mMgj/Riom0FOMyE12QMtLVdwNsIfp912AE7G1+522kwTPG2orfR5oH
         zzB5FOZI6NNsn6vgabZFcDdDdrk2fzJEYeqnlinHrssb2hNGxLy3jquZheBMnJT9NLo7
         3LgKJR8VQSAY5ltYEq8wGSdvioZsby1GOYptGrkforMYJ6S8+ogns8pjE69wwUYyjO7O
         jjvAwp1Ikz9H2OyveWdyrFpRdiJWmhPrIxp40is+S4x4x4qisYezix3LBhZ8Q+qrSbzz
         dClFSp3Cr5miG4H7MiNo/YNPQUC/rk7uf0EL//iPvQY9f/L5oAgDr0cC342rUB4CRoK0
         nfkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779978028; x=1780582828;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4/BgxV4r2xUtkfEhT3cv7u/G3AQBhHvkVg6ydW30vSQ=;
        b=rN51yNb4BwRV3UHSjlw3+0/6mZh6846oYpWFDKyzm1mZ5blzoI1m9xX96SPSSNimH9
         +rrWqNo241wQrfmYLIddocVNyotfbHVTocliLCYEVUdr6qhcgfSeakio3WwNdFZz3/Eu
         3BBs64Z1aQWWhcS24wGsvgjJfr0vTMs9mEpMmrdEWZpcAIa2b2bRFA8H/kKbYJOoCDwI
         YVmf2ktRL4uHJ+RTW+ByBYRgQKcSqFdAF87deJT4IZHRoUcFE7eOyts9aokkBFYatCUC
         SuI+pgdCtZtnv8EcnxAj8c8mnfFkPvQZxY0Vu+AE1HuJ6MF7t9CLdL5+rO3B3lZB1vRX
         kX0g==
X-Forwarded-Encrypted: i=1; AFNElJ+iTHuvYBUPCBZiPty7aBfzgAgxhBzUMggwWRBhZ6dgtP32NolxyNfuVefJWdmgOp5J46HAnrvk0mdbMWDA5qM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMLPXuw5n1D+ThhPJV/WeUGosZHTM2/DACj5e6N3OJo+C4eEDx
	1twhhKePyjHCJqMICzDE/VqpBwmzAlmbzllvnSIVmQT3G4STAAsfckZfsW3RJpS/4hnzWKfCuYW
	BhvdJ0dvKp/Nk4ut6ng+uhzhH5ZxjAd1Zwbwa7H7t
X-Gm-Gg: Acq92OH23hJLB/OECGZN0duBwCuImpWQL1rOd9k1pGqbFOA+IyIDr3BbzAmtfmVSHWH
	s3/DOxYaR9EMPGKbuDzrmZi1retheDP0mBY2kkNc8X0FqTv9JmU5611huH6ZcCZSjwks5NBOGPl
	2aWjotprCnBbhoBkfMzwhQO5xSHFC+CySJTcpX5f/2aYDEDudPlF7QVc/HT7KFEHJ+cpbyfw6Sy
	KlIDR+dfwiC5vAKmey3FjasOyrL/I0eNlD5Dv3ZGMB9ykIE0ELHBJOCT+FsoHb2bJPCZSXyTkSw
	+M1tlv8D0h4wGwWVrw==
X-Received: by 2002:aa7:d655:0:b0:671:4bfd:e074 with SMTP id
 4fb4d7f45d1cf-68b452ef798mr24852a12.9.1779978027233; Thu, 28 May 2026
 07:20:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260527174347.2356165-1-jmattson@google.com> <20260527174347.2356165-2-jmattson@google.com>
 <20260528091357.GB343181@noisy.programming.kicks-ass.net>
In-Reply-To: <20260528091357.GB343181@noisy.programming.kicks-ass.net>
From: Jim Mattson <jmattson@google.com>
Date: Thu, 28 May 2026 07:20:15 -0700
X-Gm-Features: AVHnY4JBbRjeobtGGSawQVKaiKB6lyL2sv8vmrUzchZ1xrSrD2h3ZYNrMd9jIgw
Message-ID: <CALMp9eS5xT2PKHW4RWNsY0d9jKpA_xOrOpyZjY8CT6E80W-42w@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] KVM: x86: Consolidate CPUID fault handling for
 emulator and interception logic
To: Peter Zijlstra <peterz@infradead.org>
Cc: seanjc@google.com, pbonzini@redhat.com, tglx@kernel.org, mingo@redhat.com, 
	bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, 
	shuah@kernel.org, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, ctpence@google.com, David.Kaplan@amd.com, 
	binbin.wu@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 28, 2026 at 2:14=E2=80=AFAM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> On Wed, May 27, 2026 at 10:43:43AM -0700, Jim Mattson wrote:
>
> > [jim: Add EXPORT_STATIC_CALL_GPL(kvm_x86_get_cpl) so that KVM vendor
> > modules can call kvm_is_cpuid_allowed(). Fix typo in commit message.]
>
> > diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> > index 1578c0ecbbd1..72bd3cddb026 100644
> > --- a/arch/x86/kvm/x86.c
> > +++ b/arch/x86/kvm/x86.c
> > @@ -151,6 +151,7 @@ struct kvm_x86_ops kvm_x86_ops __read_mostly;
> >  #include <asm/kvm-x86-ops.h>
> >  EXPORT_STATIC_CALL_GPL(kvm_x86_get_cs_db_l_bits);
> >  EXPORT_STATIC_CALL_GPL(kvm_x86_cache_reg);
> > +EXPORT_STATIC_CALL_GPL(kvm_x86_get_cpl);
>
> Are you aware of the distinction between EXPORT_STATIC_CALL_GPL() and
> EXPORT_STATIC_CALL_TRAMP_GPL() ?

I am now. :)

> Specifically, the former allows modules to do static_call_update(),
> while the latter does not. Whenever possible use the TRAMP thing, this
> allows modules to *call* the static_call, but not to redirect it.

Sean - Can you fix this up when you apply it, or do you want a v5?
