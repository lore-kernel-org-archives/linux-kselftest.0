Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44B0F3D7D67
	for <linux-kselftest@vger.kernel.org>; Fri, 31 Jul 2026 23:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785539774; cv=none; b=eK7wsxTuT6+X7Gv0y7U66lDdVj7vFSE5Eeq1gfy6LYGkPkjWy53cSDhNw5Xwufd4KIa6bveP4eXzR1gjrks/YcceCTRp2mpYRZy2+nCh/0KlH0VNNpuodJ/hrFeWYy3+421AXplGnoGjiCXdTtVbIIrL36z+l/YUBq4bmoBYqKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785539774; c=relaxed/simple;
	bh=A2ZszD5oB/5IQjIY93Gpv4YTCK5z3C0SzJKpHpheYqk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=q4B5P9awo/Hbnw+fyoTr+BnkHw+ELECbH1ryslavBGvdjKZoHFM1OSfKmU0Io/SI8x0fd3aUs/Ir5AVmyhHseHffGRfPXPfofioBN2WrsGJj3C19iX9CUUoQOB2C/KCuKicml2Bx7xPwqw5D1ahaGXfuB8/g53RSXzj130z+qbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=A8OuXPAN; arc=none smtp.client-ip=209.85.216.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="A8OuXPAN"
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38dd87656d3so2062306a91.2
        for <linux-kselftest@vger.kernel.org>; Fri, 31 Jul 2026 16:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785539773; x=1786144573; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=A2ZszD5oB/5IQjIY93Gpv4YTCK5z3C0SzJKpHpheYqk=;
        b=A8OuXPANnLkDjarhzKPe24I6SF43B15rvif1t1SQ0QC67vSCeuD6AXVGy/D3nWeQNH
         Pav0kVzw0SgEy1O6C6cpRR7MXAUl4tz2Quzdj8/Un9nv4U27NsyY2Ly5RZbgBJM25zWT
         uOd0UGXyFkUXkVj+Fs24OSsNHhGtSIr8B0EFeo8CBFPW2M4EsQLoLlPsntwau+rxy0rv
         hWAEEF3RVWKmW+41MAQlwEGylETmDUiRym/EHVy/kwogCZFjncvpZ8pdClWKVMGbpFDF
         p3b+cddI/bBOLzuiReaGe+Q+I5EWk/HZT6uUxA4aEICIRh0aHVE18tHma2p7n0bHZDAu
         vV4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785539773; x=1786144573;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A2ZszD5oB/5IQjIY93Gpv4YTCK5z3C0SzJKpHpheYqk=;
        b=iqhvFoMm2619X2eU75uWryVGl58Ia4K2hz9ewE17LPyziit1s+GP8UiYr4wZMc8/Ls
         emiu8fnjYI8cI6/EwrTkxhVymtdxiAirbuu8wH1RGIr22Ky7wIALmB03zHxfEKB+3RX7
         dqFRh5+6+yojCciGKZYJAJ56yqpCv/3/VjZnprEy0lM0i+CXJPVbFdEkHAnnjM7UvqCT
         QCpA123P6BA2ChQO98KnY94OKIqtYwI0iU+GL88eTsMzpgPzas3DRgGdNOsOAEaIFURb
         nIm8b6ZBUxHBdJjNAtVd/invj5g4lxGZpBpq0k/NR02LDZTlqL1hOxBU07MgGoLTFzSu
         kPcQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqd53haB3tgNGvEs2esC+Ilg4RZ+UvQYmO3v6TPJ9hDS82FsS5IkkWF7Zu6ZB9VyqvQ9ZNnt76NtgDeVadPZRg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxP3N9GSe4ZJaF6cBDRMFCP5CMkTgcEEuggrr/KT+TS/VH1Atsw
	5n7mndgWdafWD7f9td+5SSf4QQjcNfDr39vakkjNqT25ij7Vi98cmcqur9Ek3dgrURKGKpjZ6Oz
	mswn94w==
X-Received: from pjbqx12.prod.google.com ([2002:a17:90b:3e4c:b0:38e:a577:5cbd])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:584e:b0:38e:76f8:fcbe
 with SMTP id 98e67ed59e1d1-38fbc561b48mr1327142a91.29.1785539772383; Fri, 31
 Jul 2026 16:16:12 -0700 (PDT)
Date: Fri, 31 Jul 2026 16:16:11 -0700
In-Reply-To: <e8e7554debef481d13265f0870e847e2fa37f7c2.camel@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260703212145.343527-1-dwmw2@infradead.org> <20260703212145.343527-6-dwmw2@infradead.org>
 <amPWX8lKXw2KS_kZ@google.com> <e8e7554debef481d13265f0870e847e2fa37f7c2.camel@infradead.org>
Message-ID: <am0su482WLEa3ojQ@google.com>
Subject: Re: [PATCH v6 05/36] KVM: x86: Add KVM_[GS]ET_CLOCK_GUEST for
 accurate KVM clock migration
From: Sean Christopherson <seanjc@google.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, Juergen Gross <jgross@suse.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Paul Durrant <paul@xen.org>, 
	Jonathan Cameron <jic23@kernel.org>, Sascha Bischoff <Sascha.Bischoff@arm.com>, 
	Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, Jack Allister <jalliste@amazon.com>, 
	Dongli Zhang <dongli.zhang@oracle.com>, joe.jin@oracle.com, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	xen-devel@lists.xenproject.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 25, 2026, David Woodhouse wrote:
> On Fri, 2026-07-24 at 14:17 -0700, Sean Christopherson wrote:
> > On Fri, Jul 03, 2026, David Woodhouse wrote:
> > > +4.145 KVM_GET_CLOCK_GUEST
> > > +----------------------------
> > > +
> > > +:Capability: none
> >=20
> > Why not add a CAP?=C2=A0 The check in the subsequent selftest is quite =
gross.
>=20
> Because nobody would ever use it in practice anyway.=20

Yes, the selftest will.

> Even if the ioctl is present, you *still* have to try it and fall back to=
 the
> old method because there are ways that a *guest* can force master clock m=
ode
> off.

That's totally fine, but userspace, especially for selftests, needs a way t=
o
know the ioctl exists and _should_ work.
