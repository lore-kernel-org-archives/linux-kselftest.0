Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A46F3B530D
	for <linux-kselftest@vger.kernel.org>; Tue, 28 Apr 2026 19:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777405970; cv=none; b=dAN8ANDmNhkmmq5/LhsRC+d+7xUJUeQQIwgeD7NldH88PN7F3AN8xUjJnkOccXWvManpoV9oQSrpQ/QR0FY8mO+pgJLEwlLw4B0SxbAzQAho20NM2sqUwAbSH++qaZ9nG9IecNQ+4AMmhs42altJv5xcnmf2BKam/h6EwqSyT+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777405970; c=relaxed/simple;
	bh=EdF6NqLMXj+vo4TMcPGE8M5ypFpIZGyhqbD7NyYtkA4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=hTNa660TFBl+YTz8ZmZzeO0uJvvVPGr96fgmuUHYKunIVhp+AuMIWh4EIEVlOIo7hglTR0LI7fW8BiMrvwy0plIfy3NN22FCd5yFDESJIs7ra+trP1NsS4CfeDxHCMFq8+GtQLf/IZ50BD1cXbLh+wSP3WwVuaaKFxU5G4zQ0ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lSTjhffE; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lSTjhffE"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-82f07078eaaso9021974b3a.0
        for <linux-kselftest@vger.kernel.org>; Tue, 28 Apr 2026 12:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777405967; x=1778010767; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=3s28yegQ9fVQN3KSZhlWBZCHr39ir/gqDmXWLfmjY4U=;
        b=lSTjhffEBJSbSVVUCyOgznBSPWLP2+oO0otHTTg0ANM/ITngvU3tnJRWu6DWJhhqm0
         0/1lIPNKk9XgSuKPvRj87lz9+ToYr4QSgsTJNzYqzt6KmDii0A+2p0dABNYSap4YUhd9
         zjLQuHqLGj5j9ePEA2/dzG7T1bPpsbPfQYD5RXbaILibU4Gc5VeUKNimQU1+UQ3ebkYs
         bwJqirrVe3/pcQYBsI9fbPmtWBmFdpdF8d7u1/c/idPlhAlqtjxeUGT0wUOJmARXwQ79
         HlmtUBpL5LTDAsFrMhsBzghhhvZMrxAHI3TKlKq+8Hs9st6wKlVAcvfPREhL/I6pKynW
         gFuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777405967; x=1778010767;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3s28yegQ9fVQN3KSZhlWBZCHr39ir/gqDmXWLfmjY4U=;
        b=a3ydl/xy4idxZ2ir03VtD8HTbWPc8zjO+Iy0mxwhQw+c8yNULiMpOsgCdyCqedG/no
         rSmDybfaJEpRMKkP30dj+I2OlpduhMQ7qO24/DncgxpJ3z/fHDiy4qGztNDHfAdKeEki
         lysnVkkM0pumW+k54RDTvfa/3fX8rf6Q4+9lIdJ4uBH5VXEjVG8/anYJClGvd+XobgCZ
         XujUR9EgVBmoXmh9s5f7h0gnk7UlaAwWi2uErzwQ8EnzTwkxSD+bJ+XA7eCLh6RJO2nt
         VGcOdjmlwbSXDlDkGaE9qldxZ0vKnWtlI932nbftGcajkmcuwP6xV63bNH/CMVpkoJkt
         ui0A==
X-Forwarded-Encrypted: i=1; AFNElJ9437+mMAQmlhswXMPosRlLNiEubJN6w8Ja/HA+0EZQHqphIdV80oe2LgUFLmvOc6feqxOGVkx4SGID5bhYJvI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKapVeR0uVYi9/0MXfWUcHP5MjPJMPAkVUvLXeLUuwMSMafjXF
	wnRijQyaTS+A6pLQ9rNzSSAr4JLIkhgJKoQezhS1T34LBifEp6jtv3/T3Htx77+I3PK2orqeTJ9
	GhPspDg==
X-Received: from pfbk21.prod.google.com ([2002:a05:6a00:b015:b0:82f:790c:3922])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:2d85:b0:82a:6de8:fa50
 with SMTP id d2e1a72fcca58-834ea5cb4b4mr674937b3a.18.1777405966843; Tue, 28
 Apr 2026 12:52:46 -0700 (PDT)
Date: Tue, 28 Apr 2026 12:52:45 -0700
In-Reply-To: <afEEN_4ufBcQld0q@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260202-vfio-selftest-only-64bit-v2-1-9c3ebb37f0f4@fb.com>
 <e51b4ff2-13c4-47d4-b781-3dcbd740d274@meta.com> <20260427231217.GA1670652@nvidia.com>
 <afATrrjqt8zj2plL@google.com> <afEEN_4ufBcQld0q@google.com>
Message-ID: <afEQDT_nv0kdlaBU@google.com>
Subject: Re: [PATCH v2] vfio: selftests: only build tests on arm64 and x86_64
From: Sean Christopherson <seanjc@google.com>
To: David Matlack <dmatlack@google.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>, Matt Evans <mattev@meta.com>, Ted Logan <tedlogan@fb.com>, 
	Alex Williamson <alex@shazbot.org>, Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"

On Tue, Apr 28, 2026, David Matlack wrote:
> On 2026-04-27 06:55 PM, Sean Christopherson wrote:
> > On Mon, Apr 27, 2026, Jason Gunthorpe wrote:
> > > Even though this is a 64 bit build.
> > 
> > Heh, it's much funnier when it's happening to someone else.  :-)
> > 
> > KVM selftests went through these exact pains.  I'm pretty sure these are the
> > relevant commits (the empty targets one may or may not apply to VFIO).
> > 
> > 9af04539d474dda4984ff4909d4568e6123c8cba KVM: selftests: Override ARCH for x86_64 instead of using ARCH_DIR
> > 67730e6c53d70fb31618230f81c4acee9f72eaa3 KVM: selftests: Use canonical $(ARCH) paths for KVM selftests directories
> > 43fbd8cd389faa9760c5152b1c58e893c812953b KVM: selftests: Provide empty 'all' and 'clean' targets for unsupported ARCHs
> 
> KVM selftests don't prevent 32-bit x86 builds though,

Yes they do?  x86 is an alias for x86_64 (or vice versa), and so the i386 target
gets binned into the empty target provided by tools/testing/selftests/kvm/Makefile.
And KVM selftests most definitely don't play nice with 32-bit.

> which is part of what we're trying to do here.
> 
> For example running...
> 
>   $ make -C tools/testing/selftests/kvm ARCH=x86 CC="gcc -m32"
> 
> ...produces a lot of -Wformat errors that were also seeing in VFIO selftests
> from the kernel test robot.

Uh, don't do that?  KVM selftests can't even get past the preprocessor with -m32.
Either the kernel test robot is trolling y'all, or there's something missing in
the VFIO configuration, because I'm not seeing any magic in KVM to guard against
the above.
