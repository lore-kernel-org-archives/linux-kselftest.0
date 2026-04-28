Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 014FE2772D
	for <linux-kselftest@vger.kernel.org>; Tue, 28 Apr 2026 22:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777416813; cv=pass; b=P7dV4ujoOccnNdpC27KtUvr4zxXz0N6gQwuZho0zXFhWM1cumT2AufsGq+cYwCXvmWg4SbDsApSUeyE6A8vtiJvGoo2HM6bOpODBCfH6ifPqTYpKNibP4vQmgpphJmEmwRYinemeS6pyzVpc7VlJBQG0Zy7MHpxEjjD5MoJ9iGI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777416813; c=relaxed/simple;
	bh=/mZiLUYMjIePv3dqlxqei0TgnsDjFK+hjpawZr8xajE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Px/qX9PBOgVA3f9cHPveZYzqNgaud3pg5fO7i70jiIzJsTtoFQyanBq4+2bUcL3mB194POLm2BRJRIo0g9t5hsB/W1FHIhioHt7pz6IXY3l2yCiBhfcVpxIROAo+hsSbQIn0cvxZ0eWSFq+ilCdDW1TyIvo/b448EJbDvXZdnEE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JlWCZp9H; arc=pass smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JlWCZp9H"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-38e84ed22bdso113467401fa.2
        for <linux-kselftest@vger.kernel.org>; Tue, 28 Apr 2026 15:53:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777416810; cv=none;
        d=google.com; s=arc-20240605;
        b=gaL06EBsxGpe3vNCa8qn3c5EbuakIfH4ffGVRTGrLCstNWUxjYSbP56uVr4I1tVcP9
         Sza3Dyndk8PE892qS2mRQm25ZVAJciwhwTD6LDGdxIDDBEbe63EFvfHUdXsT2S3p7KR2
         yv94ZmblJVL8jEWsKU0sUcWGtUlk6K4NbVw+JgrxEwJIwS00isNhJB73/2RXADlRMIhv
         T+rEVVLAaoFnfzjd8OBJUpc2zixLT5PjukRl2HVa8J6snwpciAtfJMcDhyUi5SiqwuFl
         nEF7xKhIJ3FDmf2fmZ5geuqpWpmL1JyrCKwocRMFP1cBfDidRrNPrxbIWHFQVmL2xRHS
         1e1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gCMoPkPIjy6kiY/a1DllffhMFIvPwXuiq9EBnYCEpV4=;
        fh=ttxqyFMa5eckHa9inVSJRA02606+nqiDZfOV9XICVEA=;
        b=MmKnHtDakElIqruDQYTJDA1Tkq3XM9bRPJiYMQHD4rdKB5WBWAmKFPg9DgC2kPDI/z
         ptuZc2tZzFzt/a6IHovbwxpt4uN/ThY9qQh7oTHfUF25KRE/4AbZniyb6HlQeFBewHbg
         7bzHajrQQYBcjlFeYD5fQO9yMP8QptgLZl118JFLwgNJfctHQrIlkP5MduuL1M9ecmAz
         NE1NuwzFPsiDhYlg4FxRV6MXy9StPCDSi29m9wykpILrx3yECdwd8V1xq1s5dBYFieb3
         ZH8sVjERY3jp7W8CA5pCGbl9K1XErfbm+nrQVeC4GFkQ8+ruKnRHlyWnqY+kHLiXg3KJ
         h+qA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777416810; x=1778021610; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gCMoPkPIjy6kiY/a1DllffhMFIvPwXuiq9EBnYCEpV4=;
        b=JlWCZp9HLU63dA+gLbdvehv5mgqeUB3ggJqAvkVYNRdib5pan21hmTGBt+PVIviiON
         /zpkvLYY3YuiGVGurwPAFuP44yJXMpQIzKNeAqSG/33g9JijdFJbMBsrDfiCYRrU5hOM
         GJOZOiMED9fCmUatmKhWZtAeCJcjWg+ogzReJ3EcJ9v5jrMpMkznnIFP+UyNCetwMT6p
         q4I5R4IJSy8846infjU8i/SoW7TO88Nz0y7onqabRKLo2YWNvXKA/VbuPS5ZVCZUsEcP
         oSjIo0Rr/zHMPv8jHl7Zt8LYxmurzr7mZXWZ6+vZ1B9vc9SzZUpBL9jPoVzFZbqgiJeg
         ej9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777416810; x=1778021610;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gCMoPkPIjy6kiY/a1DllffhMFIvPwXuiq9EBnYCEpV4=;
        b=opTXwoedol9alLJu0Nn8VK7n9EAaoCZOuzycT4m9xOIqGTy/vn9ndsB62cpwkbvTm0
         pMDVjp4nncJXa/h98uS3vr6u6OT5H1Bt3j0y6bkRad8DPIvM/8LEZRsa66M93Bmruj2T
         QMEwDOsiANL2582NROVRQaj3hdafkklb+N1j+7N/8+8Mg89FPQcMtkxEI3/V1cGqfWE8
         YQm4zEZppPF27rEG+QoBF8onJZt9jXh2KOj5a1d0omXWfYL8T7NklYzACw4hxFA/I7tT
         nPW4rRH+BqG5K8NVB+U47GmROsodyvSjBcafjNxhUXjj2gFdPILIDpKrCRoelRwi0o7I
         xpDg==
X-Forwarded-Encrypted: i=1; AFNElJ9DF2T98DkbJ9TyI8qKh0L7Cmd3D8D6GWqvGiBCqUEnyq0TVmWIUrSEQAnzqrx8bFcV9Hn/+ptHtXKPG2j7gOE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxeti97UX222eqrbTmWGe9l3ZuWfOEg5oP+q3Nf7brjOfyWTWU8
	h23stdJChxs4NXxIlmaw9o7br2n+2qX9fGMyJOpq9gVVNYcLcUQe21xseJrw55wcaXXoQ0fEKGE
	f8ea78d4oA9/uRRmPLPaJJvWK614spKw7ppBRVDny
X-Gm-Gg: AeBDietqJW+MEayZNpLu3oT7D+eo/sdaom685BcQWBKEFRU1wRrB6TrkTXP/je/1lfz
	CqzJxSsZngghF2bT9+gzPLGl7CmDmjxGinoSoftH6K8hP1/KMk975ukCdNGoqpH6b+h0uk7Snvr
	CJW4flzi70GOFHNNxdozoG2m15ymrEvFBnsdSaV/ZShoP1ccJzAk1MnmPCZm3IbqNWLYHiQsKdE
	dSA1/aOXRFSDtAduXrW892OnOUPhI/mklL41LEr7DegYxk165icWFzRjIxKgdE5oza5K8uSSh6C
	WgWeQ1hAh+gRw9OqA2CYy1aNS1zNEg==
X-Received: by 2002:a05:6512:a90:b0:5a4:10ff:4e0d with SMTP id
 2adb3069b0e04-5a746407d4emr1588789e87.8.1777416809842; Tue, 28 Apr 2026
 15:53:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260202-vfio-selftest-only-64bit-v2-1-9c3ebb37f0f4@fb.com>
 <e51b4ff2-13c4-47d4-b781-3dcbd740d274@meta.com> <20260427231217.GA1670652@nvidia.com>
 <afATrrjqt8zj2plL@google.com> <afEEN_4ufBcQld0q@google.com>
 <afEQDT_nv0kdlaBU@google.com> <CALzav=ecmNh6bE88oCHdmjSKK_Zpd96b84HbtmkaiDNRcotYfw@mail.gmail.com>
 <afEusUxXDpFtZvV0@google.com>
In-Reply-To: <afEusUxXDpFtZvV0@google.com>
From: David Matlack <dmatlack@google.com>
Date: Tue, 28 Apr 2026 15:53:01 -0700
X-Gm-Features: AVHnY4KROHtcyZ8U_dHsYJqSV2d56G01Fv3HTYG7tHEcHveDjakYQKdw1QYHfig
Message-ID: <CALzav=e08+Kh60daAM=A7rAwRU-SFs8m7k2JqSb6v+=T9RZGSQ@mail.gmail.com>
Subject: Re: [PATCH v2] vfio: selftests: only build tests on arm64 and x86_64
To: Sean Christopherson <seanjc@google.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>, Matt Evans <mattev@meta.com>, Ted Logan <tedlogan@fb.com>, 
	Alex Williamson <alex@shazbot.org>, Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 28, 2026 at 3:03=E2=80=AFPM Sean Christopherson <seanjc@google.=
com> wrote:
>
> On Tue, Apr 28, 2026, David Matlack wrote:
> > On Tue, Apr 28, 2026 at 12:52=E2=80=AFPM Sean Christopherson <seanjc@go=
ogle.com> wrote:
> > >
> > > On Tue, Apr 28, 2026, David Matlack wrote:
> > > > On 2026-04-27 06:55 PM, Sean Christopherson wrote:
> > > > > On Mon, Apr 27, 2026, Jason Gunthorpe wrote:
> > > > > > Even though this is a 64 bit build.
> > > > >
> > > > > Heh, it's much funnier when it's happening to someone else.  :-)
> > > > >
> > > > > KVM selftests went through these exact pains.  I'm pretty sure th=
ese are the
> > > > > relevant commits (the empty targets one may or may not apply to V=
FIO).
> > > > >
> > > > > 9af04539d474dda4984ff4909d4568e6123c8cba KVM: selftests: Override=
 ARCH for x86_64 instead of using ARCH_DIR
> > > > > 67730e6c53d70fb31618230f81c4acee9f72eaa3 KVM: selftests: Use cano=
nical $(ARCH) paths for KVM selftests directories
> > > > > 43fbd8cd389faa9760c5152b1c58e893c812953b KVM: selftests: Provide =
empty 'all' and 'clean' targets for unsupported ARCHs
> > > >
> > > > KVM selftests don't prevent 32-bit x86 builds though,
> > >
> > > Yes they do?  x86 is an alias for x86_64 (or vice versa), and so the =
i386 target
> > > gets binned into the empty target provided by tools/testing/selftests=
/kvm/Makefile.
> > > And KVM selftests most definitely don't play nice with 32-bit.
> >
> > Are you sure that x86 is an alias for x86_64?
>
> Well, I was quite sure :-)   But scripts/subarch.include disagrees:
>
>   SUBARCH :=3D $(shell uname -m | sed -e s/i.86/x86/ -e s/x86_64/x86/ \
>
> as does attempting to build KVM selftests on a 32-bit host.

Yeah that's what I was seeing as well. With that cleared up I'll send
a fix for VFIO selftests to allow ARCH=3Dx86 if __LP64__ is defined,
which will fix Jason's issue.

> > If it is then we don't even need the __LP64__ stuff I posted.
> >
> > But when I look at the top-level Makefile and imagine running make
> > without setting ARCH on the command line on a 32-bit x86 host, ARCH
> > will be set to SUBARCH, which will be x86.
>
> Yep.  So the big question is, why doesn't anyone complain about KVM selft=
ests not
> building on 32-bit?  Because they most definitely don't build.

I guess no one's building on 32-bit hosts anymore? :)
