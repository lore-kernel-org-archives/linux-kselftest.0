Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9529311C2C
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Feb 2026 22:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770417494; cv=pass; b=YSeEBWvstLfmziBtLsV332/CcXuhpM4htD7G0a/VmA2HJwCsbO+aFmWMycse4DEdEMlnGdnB66if35KiNp9iCL7Glv3yB0QFXezvZsXWCQsskBA8xoLP3SDofTvHUTHzaXMkdfJGPmFkgxIO2w0WewUUFKQ2ITq/iP+Hv7zRmhI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770417494; c=relaxed/simple;
	bh=WpKCdaj0b04bCkkhFNILyKYzgJ4uD6OczXLU8WXTaQc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YYaOG5v3CuDweNd4Ymj04QmbN6HTNAI4UhpYvdH24LNzlnl1Opcp2X2sSwuQck9E9KI6cqm8wE9hCvjaQ7Q0/F377347GPJQkBEwWmY+NBqiVPjmIDwbLWiz+cpy42nwNdGFQhF32UDGwh6LBOnslDK7Zsqu+yuclN2edLRhXyU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=u1mBD6wb; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="u1mBD6wb"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-652fe3bf65aso1168a12.1
        for <linux-kselftest@vger.kernel.org>; Fri, 06 Feb 2026 14:38:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770417492; cv=none;
        d=google.com; s=arc-20240605;
        b=GarCAkF5VmzW7RWLoT2S17sRxHZtG8xrfpO/Nzkr/830eRgkJWIc19eKsZokJeAtXt
         43NYgVgdr0wx2XHVD5BDkdtQiJOBbl3UKh9fRh7wRqbXs33sx0o7FJHnnRRzcuh2PVH9
         q30OUtVNlF5/R47O78aBKJ1rrkgAymjQ3KPN6gASW648/+Q5gcWZIz7OsyMI2ibtSlY2
         tbg/JfN7zRsUV1gCqbmP2uFFXvmE5GLXITydI6Q57VGJkhSjvbWaSZyNdIPznQx17rRz
         dLx029YguGPsbIc1uWTRpC2HS/Z15gYoKiqZfeIe7V6w7tu35JXun62JunECCfH7jSSp
         TuyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8OZHNrPRDVp9qsqcZ7IHEQW80ty2xaejJuWwPlj+dT8=;
        fh=FGdMl6BUwBe+Nqvl8R+z71sp35M1Z8fVhBtqdpOOozE=;
        b=XSqwnIb/bZNFetZ/4RJXNzTOX2IfgJDn0clfs4/HYWFgB8c92B5+VwN3YSRCftlGcG
         BWyGIBIwR9kfVZ8ufXCIdSth6yvMkSBfr/C56r/jZ5fUjB2nAe1adTRhvqmpdh2u5TwU
         snuxewkr2wBuAe4ufiHDbOVH7HF7qUkqnksYytwWkeeOfK6K4+kL6EdWDoT9wVSNzEX6
         rGvcJCK3/QveT07XmLVhitGMO836KYCHx12mKQV2yPEfeSKaqK0XKXYu5HWTPlx93OYq
         jZSRJdoBc5/ekPLarTK2v9UkfdNR/oLR5l8DTlQ5PKd5JZHImAk2f/cSCqnsPawpfpRo
         VrfA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770417492; x=1771022292; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8OZHNrPRDVp9qsqcZ7IHEQW80ty2xaejJuWwPlj+dT8=;
        b=u1mBD6wbcKxVlnN91xnB878u4ZBcAbrx5Y32mbsqf3zmsmhI6Dx+ydkBq1a/StgtFw
         9oQ96XfvYzZrHsc0J4f00PyN0z9Z+uANukgAPcRhY2H8on32/Fi8gBX5dPT49kFaw1gH
         0eSQehEYpJZpMEFncwW2g4flfjXZgVgwHdQfz2/v1BUgUoZTXDzBzQKBHeT52/+nWeuQ
         KSWOLqi9hp/c6dxJXkZwfJADbfSgP3kY0T1DAbER3ydEiaVUQC+pDe0aVTwnW2gvwJNs
         Kcw6A6BY7rIarowthTw8QEbvfmipCW7B8enaHD6eoT39pF4K4yTh95aUdAIZoKr9K2of
         wEsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770417492; x=1771022292;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8OZHNrPRDVp9qsqcZ7IHEQW80ty2xaejJuWwPlj+dT8=;
        b=cj8+mLaeX/avHQxR8ZH2lmhIzs/yF6fL1/MR2u76v56StWpv/w/Szno/oOp04fTQI4
         3wXq9SA77xuUfKGy9l0HCFkvupmMDRrveXs5yMuFHpjw0Rv7Q4K1CsVq32pVpGrAkw/Q
         GWAqWtyD0KG3DDKe/Zwtlr5uFpnfLvx2ovV4AU7VFrSdeXjRMLRkr4zYLS56neJF458K
         bbWdVAsy48VIOj7qyXDpKMglrijQ1vtfVi7VMrFboaLsP6zsT6sIEV0QHjuN4bXsUzlG
         jtX7OcT3TlzyL/B1wxRNiqsDcSxNDFL2RobMeJh4QtGnhvkVLEen0ZVrs2yJRkJP8Ad6
         Nimg==
X-Forwarded-Encrypted: i=1; AJvYcCXAoNo31+UQFAn9BOmLVnrcGKUocs/PUsNW01GNlcvRozNSErFrVI2uTvYJNrG+/bKCCdEIgyHxPCewVoo+WcY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1AfaNanvkRCDKvd7Nd3+LuJ0RS2k3anPI/1u1JTSU2UbEbvfn
	lPGKndLQbZTAwxoFD99KMvSt1yUp6634JM2UISTbLcowiuU6YRr4gfIhRJuHrHQvx/sbX+TqYRs
	4aqSMGFZR6F0OSznHHkZdQv5jTj51asueF7MyE5dN
X-Gm-Gg: AZuq6aI16ozKKNvD95B4syw9EyQgHzftrUToL8rtqkhjsJHukgL52F7EVKXaEc8JQsE
	v+QXwKrcEpvxOABTpmhDevztxuv67O/PVcQWuAwnntQ/OAku2kkN7tsaGJev0kb0SpzHuwAf5ck
	udL4j+09Df3nq5macXQ/0qfqeSW3CmHztRGpKyHH+3QJFlG2KyIRFZIZcIt/b68cmN0Ff9zP4NB
	z4MY0m/S1LJIufMt1wVBkjvm1YfoCyND6znbKyOWCBIPMQ6aK+zVwqK9dbpAvH1r/Es7P8=
X-Received: by 2002:aa7:c98e:0:b0:634:90ba:2361 with SMTP id
 4fb4d7f45d1cf-659a9c16313mr3646a12.7.1770417491919; Fri, 06 Feb 2026 14:38:11
 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260205214326.1029278-1-jmattson@google.com> <20260205214326.1029278-8-jmattson@google.com>
 <aYY-ZwjEnHbY5J-T@google.com>
In-Reply-To: <aYY-ZwjEnHbY5J-T@google.com>
From: Jim Mattson <jmattson@google.com>
Date: Fri, 6 Feb 2026 14:38:00 -0800
X-Gm-Features: AZwV_QjIilRUJ1j9fcVJsKGyopyfYUmDpLvg2aSanEQA0gYSu9-DhXX9wC_lxkc
Message-ID: <CALMp9eTZaH=kc1xM-u9DT8QSMDBE05YwG8Tw5SqeMHa24x5gmQ@mail.gmail.com>
Subject: Re: [PATCH v3 7/8] KVM: x86: nSVM: Handle restore of legacy nested state
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Yosry Ahmed <yosry.ahmed@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 6, 2026 at 11:18=E2=80=AFAM Sean Christopherson <seanjc@google.=
com> wrote:
>
> On Thu, Feb 05, 2026, Jim Mattson wrote:
> > When nested NPT is enabled and KVM_SET_NESTED_STATE is used to restore =
an
> > old checkpoint (without a valid gPAT), the current IA32_PAT value must =
be
> > used as L2's gPAT.
> >
> > The current IA32_PAT value may be restored by KVM_SET_MSRS after
> > KVM_SET_NESTED_STATE. Furthermore, there may be a KVM_GET_NESTED_STATE
> > before the first KVM_RUN.
> >
> > Introduce a new boolean, svm->nested.legacy_gpat_semantics. When set, h=
PAT
> > updates are also applied to gPAT, preserving the old behavior where L2
> > shared L1's PAT. svm_vcpu_pre_run() clears this boolean at the first
> > KVM_RUN.
>
> State this last point as a command and explain why.  E.g. I think this is=
 why?
>
>   Clear legacy_gpat_semantics on KVM_RUN so that the legacy semantics are
>   scoped to a single restore (inasmuch as possible).  E.g. to support
>   restoring a snapshot from an old KVM, and then later restoring a snapsh=
ot
>   from a new KVM.

Actually, it's just because I'd like to return to normal behavior once
the non-atomic restore operation is complete. I'll add that note.
