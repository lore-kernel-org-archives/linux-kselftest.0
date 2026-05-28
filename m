Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10C162E7393
	for <linux-kselftest@vger.kernel.org>; Thu, 28 May 2026 16:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779984487; cv=none; b=WBkl5hIJbQ7ufpZIanW0GcoaivPSKMmo6w8DMvGqKFUBs+WROV0/QonUNW3zVqCpK+N73fMJrEbSd50E7yI95KgHP7Ocj+NAJ2FtwfGlhCpQeSnAyrlY4RYiXy0tarTxxayvjEfEecVohcSLXtNRD5tx0XWZFv9na7QjafYp6ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779984487; c=relaxed/simple;
	bh=BQEMwhyrh8A5haXsBbov37wycYsrn1vSMAyk8OB4dPY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=VlXpol0G41ZykDvYsb42OtJf5l9g6qulVE/Dez5iCciV5mUc4GVb1qjlhkOpZpCDDyjdnx544snCXkT+hS6CafqLdcpgPcrvI0IB0rCrBXuaBAUsemE8LG6mr9zzXDXYba0zfmlxmi+zKvryGNRn4ZEBqFCp/+oslJM+paIRI48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jSup77r1; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jSup77r1"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-82fa860e71eso6657815b3a.0
        for <linux-kselftest@vger.kernel.org>; Thu, 28 May 2026 09:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779984485; x=1780589285; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ek22Fd3FycfLolcYwfif8xkvFpAFlov1T6Xslq0mpiw=;
        b=jSup77r13GYL5o+H/Z5T7BAOwQZT7t9eOkTo+JNfKA062PI0/D+Jdb7hWhi+Ehspqc
         LcV/Njs16iOMLPTZIPIKHfpjvDMzntY6NnNHC7PM1dmGc0bIzwZbyvs1vl9tyPxc+hnS
         rKJ1bHvhzRLDEBpW9FPHylTHLqV5yNokGigyJSVl2SrU3WOaUN4ejfBvbxmI46QSkA8J
         5fdfzt9+0lU11XQuQ4LyAAkWnlcj3s6+xalMsze2v1HGA8OwNAw72DYnvDZk2BWhZMm9
         oVBNVr0ieBrBj0oNkmL+ML6YgBKMGErIVMP26IPxfbMLsPIPHULopbxQOf/IYV+VPPq9
         m2Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779984485; x=1780589285;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ek22Fd3FycfLolcYwfif8xkvFpAFlov1T6Xslq0mpiw=;
        b=TVNhUL2f0th6JQ7R1vypEbGcrJjqXRUk0zZfq/Nm1R/y7MX3t0Q/TvztkhTTk2Htsr
         xvt92MGJcOWPJ1duLaQTsrWOha8B6KKE4ktWRRQIBAQYlfjZk+BiI6F43IBU5fxcaCUX
         lJpT0Wzih1YDReds342HkqJcCq+/7wcNcxA38otrWFeiy4JtaT5iXAr5GmQbXpRZQj06
         Im4ZmFc7O4YlDnDn2X73/VDxay7310snTTx2NK9OFrDqry+mXhSdCezW8w3L02Yb4NWC
         Rk8Fk30uVfgz5Huwj2ImucBZL2X38OHfL6vNobyje5//QXPPoZ4kwB7byaXzLyaaEw2f
         glZQ==
X-Forwarded-Encrypted: i=1; AFNElJ+cxZvBfUPiBAD26LrmzfhDMiMGRAmBANbX8athr5dAe+rwmMB35UTG/tgXmeAV4ALPakmFOrUzM9DimTjjqOo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIwqJ7XHvRs+LhZT31LlYh1ZxC31pTMJiv7d8wRWSxqAjsbaIj
	AT0wL9cKLjCk8xnJx8857Lr0GkwP1737NMKGXWG8EjOKphqyrG6hWZdrp4BHzlU+9mL4JJkdacO
	SF1iiug==
X-Received: from pfnp18.prod.google.com ([2002:aa7:8612:0:b0:835:4c30:5576])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:bd8c:b0:82f:b0:28f0
 with SMTP id d2e1a72fcca58-8415f544527mr27982787b3a.34.1779984485130; Thu, 28
 May 2026 09:08:05 -0700 (PDT)
Date: Thu, 28 May 2026 09:08:02 -0700
In-Reply-To: <CALMp9eS5xT2PKHW4RWNsY0d9jKpA_xOrOpyZjY8CT6E80W-42w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260527174347.2356165-1-jmattson@google.com> <20260527174347.2356165-2-jmattson@google.com>
 <20260528091357.GB343181@noisy.programming.kicks-ass.net> <CALMp9eS5xT2PKHW4RWNsY0d9jKpA_xOrOpyZjY8CT6E80W-42w@mail.gmail.com>
Message-ID: <ahhoYs4B-VUoqhTq@google.com>
Subject: Re: [PATCH v4 1/5] KVM: x86: Consolidate CPUID fault handling for
 emulator and interception logic
From: Sean Christopherson <seanjc@google.com>
To: Jim Mattson <jmattson@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, pbonzini@redhat.com, tglx@kernel.org, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, 
	hpa@zytor.com, shuah@kernel.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	ctpence@google.com, David.Kaplan@amd.com, binbin.wu@linux.intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 28, 2026, Jim Mattson wrote:
> On Thu, May 28, 2026 at 2:14=E2=80=AFAM Peter Zijlstra <peterz@infradead.=
org> wrote:
> >
> > On Wed, May 27, 2026 at 10:43:43AM -0700, Jim Mattson wrote:
> >
> > > [jim: Add EXPORT_STATIC_CALL_GPL(kvm_x86_get_cpl) so that KVM vendor
> > > modules can call kvm_is_cpuid_allowed(). Fix typo in commit message.]
> >
> > > diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> > > index 1578c0ecbbd1..72bd3cddb026 100644
> > > --- a/arch/x86/kvm/x86.c
> > > +++ b/arch/x86/kvm/x86.c
> > > @@ -151,6 +151,7 @@ struct kvm_x86_ops kvm_x86_ops __read_mostly;
> > >  #include <asm/kvm-x86-ops.h>
> > >  EXPORT_STATIC_CALL_GPL(kvm_x86_get_cs_db_l_bits);
> > >  EXPORT_STATIC_CALL_GPL(kvm_x86_cache_reg);
> > > +EXPORT_STATIC_CALL_GPL(kvm_x86_get_cpl);
> >
> > Are you aware of the distinction between EXPORT_STATIC_CALL_GPL() and
> > EXPORT_STATIC_CALL_TRAMP_GPL() ?
>=20
> I am now. :)
>=20
> > Specifically, the former allows modules to do static_call_update(),
> > while the latter does not. Whenever possible use the TRAMP thing, this
> > allows modules to *call* the static_call, but not to redirect it.
>=20
> Sean - Can you fix this up when you apply it, or do you want a v5?

Neither, as detailed in my other response, using EXPORT_STATIC_CALL_TRAMP_G=
PL()
requires switching kvm_x86_call() to static_call_mod().  We can do that, bu=
t I
want to do it separately.
