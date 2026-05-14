Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6364726FA7A
	for <linux-kselftest@vger.kernel.org>; Thu, 14 May 2026 18:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778781710; cv=pass; b=ILCRqKlO0JTjjZEMehrN+j2d6fpFoiCEBWanIRRNIRmSAro1RlkV8jCcrRNaa52ZAXvvJEujPqFkRfYg5ClYJBnY2DYKHTNEVZaJVxbqvgHNVyABiAqTJMaWVE7uChRp6uclML9EiONADwg/Ai0uEL+nF9PIe9Pt66ABT2ftiuA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778781710; c=relaxed/simple;
	bh=bz7VCAlC3pS/IeMmBV0BkER+XEA2HS4Ltbcv/N+3xv8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qh/wKBU6pVWpuR7e9tGNK1RIxHPBmU1Hny4vjjNmcaxKy6If4xkdVYsldphcJjJKmFUUj+U07o0X0TWSel1Wu9i+h3EH+KjSBTm4ARheGzUUvEMe987u287bn0sokjx34k5mWWcmoiPMMAvh3kVXX391ja310EKfwwSFaTOtJa8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fYWdx6Fu; arc=pass smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fYWdx6Fu"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-671588ab0cfso233a12.1
        for <linux-kselftest@vger.kernel.org>; Thu, 14 May 2026 11:01:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778781708; cv=none;
        d=google.com; s=arc-20240605;
        b=EHvYpsKko9zNkty+tyrdsDrjxVxySXHVlTN0cD9u3Rcw2S3FZiLvsRfQ8XC/VXg7iu
         zUwvySBDpjSBNlSzat633PcDe7X7LdAQS5heD92ad8jsYIBMoiR7LUb9inOW/ZFgcV1Z
         2GvNKqoJCi8BzmbrfAE2DkU2jlEk5kxypEnBwZIn2d426VMDjRG4z4EFQXbPCQekSGxA
         YjyACk1q3nn4lLIt+amOt5Vvy9M1GEfcL3em3CNZ5UL3luzDYFeHf+zYd9wmweHZThkj
         gMwSbRIWYgal/DWXRZs8DKdL6hbpbMPdJWF0C1t+3VDSmN8JXYu4UJg8XpdIT8PwgghP
         Ihlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EuQv+2Xkz0PPaxnC48IjSJx36n2gfqEKQS5cw1hUKio=;
        fh=wudiYYz83dQqtduLjPuPU064sLXIGUdCUizx2h2/RDs=;
        b=gB/vRJa9zxUVyUZJZdxv9UfxmF7+e4T3a2nJaFsdh318rK+2sWN5NZl6FTazsfYZQ/
         XNT3J1pSpPbcOqez0xwZcgdBbJL4y1DR05hfJu9onM4nMlBVdCY2MMkvsa3JQeiHkHvL
         0T4k5qo10NiU9GlLpcLtxP522uSjMgkJSqfGQ4rIg62srqPM1zusnN8aX4luoZUPprQH
         cZo7G+JyjDbBJ4W32RQVmKwJYyppubP2DMi7Gq1SSMAkYucvB6awY+S8O5AkkB33b3AZ
         klpAioeAAhqWh4+nfbeKMco1SIFXogZZiPzWbbUdAnvqLuIBInTL2ComYY57j/92sOxj
         pBzQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778781708; x=1779386508; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EuQv+2Xkz0PPaxnC48IjSJx36n2gfqEKQS5cw1hUKio=;
        b=fYWdx6FuylmeL6AEPs1v1BZCWiwwYRGNMJU298q5jhhvA8uXhRsfXdKi1i2wubCysF
         iGPfzgB72+ms/uYUjkUiYdJ1ZSWCv4yGhvnCHwrVcTviS22DtMwIPCTA0a8l4MYk/03/
         EGvi744rELnAciy7Ribin1jZifIHnapJqmFNEI7teKXjV/pYgFSh1t8R5F4A3Zp9HOCo
         jEyIFEewpolulBuL747Uo03+Yb0gP7YMDDM6lNmEpKSYpiea+w4KI2ZtyqTH2wvcveK1
         bKMOur80bD6BhMdpA0/Myc3wKcWuzb7NS90Vj+ornrcEgMg5/l4l0Iie5c0SA22g5rnP
         1aQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778781708; x=1779386508;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EuQv+2Xkz0PPaxnC48IjSJx36n2gfqEKQS5cw1hUKio=;
        b=liQYktFJ56teCwooObJ+k05CCwaoYXhENvFitF4WDJZyll0BX/EPnbAHruTKuZNcW0
         5YFvD25NeI/K8Nstv8Cbwn+5RKwPvCflCmDmJn1np0Sqe4WTiunqENBvqu5ZCw7L6T0o
         xeIMdrLGtWoadCy7UtDf7PofmSxjW4Lk911ahZz9UmHqQQYFlALoEjNJnBSsZ3Tafkq3
         ENZtGUBVlgHPvd3NxcqIGJRswO/hwgPMNX6/ZsV/6xNN6h8pT7E1I/sAA0NrqRyhXVaS
         kFyYFIga5CM9E8CrPeUWGy8Jkim6LzM9ur2kQGx1LeAlma1HcxPmxz6lXQv/TLGY+Ylr
         E9dA==
X-Forwarded-Encrypted: i=1; AFNElJ8XWC+Up9WiQYAegu+JLVNEi/ZD7TpXOcby3d6Vo9TLTROnkY50YX0wJAVNBTN9usRKLJCGmsFTNotQbiAisEM=@vger.kernel.org
X-Gm-Message-State: AOJu0YytLUEly2Xh+MgxoR7N6RMi/Re7fCD87AfA28vUtR/lDm2OBG8g
	TURVydSSZYC6o1L8HU6kQM0A947f3wWRA6hDN+X7i6vfLNShZz1ycX/vT5VrHTBbqFp2udGdrLu
	tCXTvR5fTruYdPLRMzLJyOpyEkc3C0aUB6xStO/U4
X-Gm-Gg: Acq92OHE3h+ndt7EpX+U4MjUQXGuPV5hE2VZAI/QZYThJju5XphsYadSgYpF+62s/Pj
	kVymmeWA7cHaeafnUeDeR/ZJX2hlQtXDTKhBbUOc7NOrJQehQ0sjNmiwydAedh1De7bWjAKku9K
	OGXETY1tOdyenFWWA3OF7Thq+bzLMa7WvnoApg/vERqkmsF4XUM//c8uQDcZ3qG/ju+o+zEFlj6
	UtvEjTNdcUOIQ6t5ICzWHxFtviKXrBDJgc2OyMrTmHeXOg8/YR5Q2ZNnvi4CG0Oh/rNJE8Iq+GB
	rDBL2cYLaoQObxFKQO9ltzxT7Uag
X-Received: by 2002:a05:6402:46c9:b0:67b:6d1c:9585 with SMTP id
 4fb4d7f45d1cf-683c02f0f2amr4920a12.8.1778781707399; Thu, 14 May 2026 11:01:47
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260513224608.1859737-1-jmattson@google.com> <20260513224608.1859737-4-jmattson@google.com>
 <CALMp9eS4s9tsOmvDUDeqS7oph0mSHyhxBiULQdwHVaG+7gXLSQ@mail.gmail.com>
 <agXcKDjnJc9DPcyr@google.com> <CALMp9eS831M153QmAgjzJcR2dFY_wCCCzDisd7_T6GyS3-gAFw@mail.gmail.com>
 <agX2SJF3rJSkIqDe@google.com> <CALMp9eQTSxFkVf4vV83yNYvv2AjseHYiD3M68mcc951L4U1Jxw@mail.gmail.com>
 <agX5v1utAfyMadPm@google.com>
In-Reply-To: <agX5v1utAfyMadPm@google.com>
From: Jim Mattson <jmattson@google.com>
Date: Thu, 14 May 2026 11:01:33 -0700
X-Gm-Features: AVHnY4LLIpTGXClPtZ3NIuJ5IjxRpd6GGNfBMTLD-JMB8crD1vsnQ7OTTrR2bno
Message-ID: <CALMp9eQqbHrcV1_WM+5xUR16OpGk+unxoZGi+=t55cqVhFgAfQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] KVM: x86: Virtualize AMD CPUID faulting
To: Sean Christopherson <seanjc@google.com>, "Kaplan, David" <David.Kaplan@amd.com>
Cc: pbonzini@redhat.com, tglx@kernel.org, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, shuah@kernel.org, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, ctpence@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 14, 2026 at 9:35=E2=80=AFAM Sean Christopherson <seanjc@google.=
com> wrote:
>
> On Thu, May 14, 2026, Jim Mattson wrote:
> > On Thu, May 14, 2026 at 9:20=E2=80=AFAM Sean Christopherson <seanjc@goo=
gle.com> wrote:
> > > Oooh, this is based on the generic CPL rules.  I didn't think about i=
t from that
> > > perspective.  So yeah, addressing that does make sense.  What a pain.
> >
> > When I fix this in version 4, what's the correct footer for Sashiko att=
ribution:
> >
> > Assisted-by: Sashiko:gemini/gemini-3.1-pro-preview
> >
> > or
> >
> > Reported-by: Sashiko:gemini/gemini-3.1-pro-preview
>
> This, or even just:
>
>   Reported-by: Sashiko
>
> is good enough for me.  I don't expect random developers to know or care =
what
> model was used, at least not when it comes to reporting bugs.  If you use=
 AI to
> help write the code, then maybe I'd care?

I had Jetski write an empirical test to see how the hardware behaves.
On the first userspace CPUID VM-exit, temporarily set #GP on userspace
CPUID per the appropriate vendor's mechanism, make sure that we
intercept #GP, and re-enter the guest without advancing RIP. Then, see
what the next VM-exit is.

Surprise!

kvm_intel: KVM: EMPIRICAL TEST RESULT: #GP took precedence over CPUID VM-ex=
it
kvm_amd: KVM: EMPIRICAL TEST RESULT (SVM): CPUID VM-exit took
precedence over #GP!

LOL!

David: Is this intentional or a bug?
