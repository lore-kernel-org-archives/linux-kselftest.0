Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D6A12701C4
	for <linux-kselftest@vger.kernel.org>; Tue, 28 Apr 2026 23:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777417356; cv=none; b=XqHqWzH005pGYRUxrEz5Bm6PcJiOkrPXBqZ0OwqB5TfZ0STiAOdcU75OcCSJKGFgO/I865A00fUw0DEIHo/g+zgoGYYr7eeC4tHYG5IrX0tfAJneIbNSktnR0nPC5HDimJUCEp8S3vQj9AIYwwbHceDb7T4+4smQ9iRFN9RL454=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777417356; c=relaxed/simple;
	bh=1+mXgVo7dAnt/giXtEwqqUppC06EJq5mpBzjemrc370=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DD/bvCoy675xN7lqKZYUgr3VYJZn9GpJDOt1UWRJZ4uisuJ0VaRmiEMT/emXPh5qSKi4raUGeSwk4xfu1waDThiPEi1EoqniIG1DAA+P1GBwUYjJNdbvt3cEP1w2d+W8tBF1thNeyxkSpbOCVxAcu+pQHjbwEl68bc5UOCVJws8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MB6i6/8G; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MB6i6/8G"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c76b994f7a8so4833199a12.3
        for <linux-kselftest@vger.kernel.org>; Tue, 28 Apr 2026 16:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777417354; x=1778022154; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=g6i0zRvpsTAv5H6O7m9/7Y3z4KnMgLavq86NudH21Hs=;
        b=MB6i6/8GLbYTZQIkKMHVmqprT5El4klyoelMuCc1kWYgvt400FA/RDsOuf8sfaTi/X
         hMakOw+avpsdr3I0T/PJhfXAvPlveWY43Xw3Xf0eIuxx1r7DYkeN6O9+NtlG4f2Qpygb
         Xcb9fMx4PJgKSo8ofz+D/vNgudhYRuhe9Ci1JiKlLBbiMj3pfqRcWRSr3tZL6Tifv+lU
         cfaf/PgbugNExhffmkyogr0sz5vM8IvjEu2dkgn4Yh8yIxszdMZps6Wqa5CN3EUIIfzE
         r36y72q0llXO9Hxm2+HIZCRm7Az3cTucOVTfj2FLOBrQ9iqwaWPtp88dySsQvrlx37Vt
         OPNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777417354; x=1778022154;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g6i0zRvpsTAv5H6O7m9/7Y3z4KnMgLavq86NudH21Hs=;
        b=rKollkNhszpfK7YKew6FMcIPXDKsIAxEToextT0GWIB07N77J+ApGQuXLt4brhcggo
         Lza8XZa2QPn+6mu9prNIsSEGR+IedDy+gRBkGZ4E+Q7MqAsw3T0beGhp7STW3PKRM0Pq
         WjFVPBdPt8f2YPPEzOpI+HsqoMYKcKAM6n8P2K70P/976bTFtBoauGqxZIF5xwgxnrU2
         quZ+ApvPzTPzE8ChajKeqin0GErHrdmNFCt8Pr/S/oTGX5swHMK+NnlFx6D8Q27fanNq
         r2VQFxztc0TOINb0FLnWUvbmcPpDFz5aYubBcT307GRGLsOjnQhEMKVn35XyZtlgdFz1
         7n+w==
X-Forwarded-Encrypted: i=1; AFNElJ+7APVQqnQpi4pzxSRKVeO9tXQALL/Az25XFe7qkCMPVBpZorTpYI7y8hdZYloGNJUHVDA/KeACbuc6aWq2SGA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBaAXbEvdV+5V5wbI3QTF+FNKmlvAqon2Sk+w0P1TYzk+55rz6
	u6eMZUlQ+XpiVgw2TwjZCieUtemWF3EAzlE234fAePEsrDO6dolInpZOcTJxNTExxw==
X-Gm-Gg: AeBDiesMErTVCTFk90+ckVBCPpckvivvm1Xv8UxcoDrSGtBucDBINKZPA8M4oKBuz12
	HVhfpgXA5aP/hSviVU0az5IolQNC3cVv0aDJV6uPOA5viK1boHHwZV29gQQL7F+DgBR9yKHYVjK
	FzvGYovhtweHiDB09LK7hkJ+/5Mnu0x/sOrf7ooRgNuqS6B2yPjx1ysuhCBP0ido6Agg/For1Gu
	AdqVlUlhDDq0gWFoqx/0n7alN5MrF+lfp1PQvwGcn+INM52sjRfWsLSWWa7G4Ur3HuhxDXcNx7V
	EHEqtWqcJd+pLl8PC39q7gLEqoQ6RdpcUfdGeoFeYAcRmPVtP6Dg80EyyuHqSTayF8/YVge+1Bm
	kUPBUKHoV/YSAvwPb/CQvQjmGTM4FSRbwuxVYJFcUSxTB3HdoFm8JBAdHAF4lNdmMoF2iu44gU0
	Qh3HFqfEVkQ1YZU/2Vj6pPUuHvbrzJoadUvb7mBYH/eE6S78GG1VAtWdGk+LVRa/ftu39rxyUth
	2yqqw==
X-Received: by 2002:a17:903:4b27:b0:2b2:cf51:718a with SMTP id d9443c01a7336-2b97c404a41mr54844865ad.9.1777417354069;
        Tue, 28 Apr 2026 16:02:34 -0700 (PDT)
Received: from google.com (76.9.127.34.bc.googleusercontent.com. [34.127.9.76])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b98893fbbbsm2704415ad.41.2026.04.28.16.02.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 16:02:33 -0700 (PDT)
Date: Tue, 28 Apr 2026 23:02:29 +0000
From: David Matlack <dmatlack@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Sean Christopherson <seanjc@google.com>, Matt Evans <mattev@meta.com>,
	Ted Logan <tedlogan@fb.com>, Alex Williamson <alex@shazbot.org>,
	Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2] vfio: selftests: only build tests on arm64 and x86_64
Message-ID: <afE8hX3s-O-8yROu@google.com>
References: <20260202-vfio-selftest-only-64bit-v2-1-9c3ebb37f0f4@fb.com>
 <e51b4ff2-13c4-47d4-b781-3dcbd740d274@meta.com>
 <20260427231217.GA1670652@nvidia.com>
 <afATrrjqt8zj2plL@google.com>
 <afEEN_4ufBcQld0q@google.com>
 <afEQDT_nv0kdlaBU@google.com>
 <CALzav=ecmNh6bE88oCHdmjSKK_Zpd96b84HbtmkaiDNRcotYfw@mail.gmail.com>
 <afEusUxXDpFtZvV0@google.com>
 <CALzav=e08+Kh60daAM=A7rAwRU-SFs8m7k2JqSb6v+=T9RZGSQ@mail.gmail.com>
 <20260428225528.GA3225388@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260428225528.GA3225388@nvidia.com>

On 2026-04-28 07:55 PM, Jason Gunthorpe wrote:
> On Tue, Apr 28, 2026 at 03:53:01PM -0700, David Matlack wrote:
> > > > If it is then we don't even need the __LP64__ stuff I posted.
> > > >
> > > > But when I look at the top-level Makefile and imagine running make
> > > > without setting ARCH on the command line on a 32-bit x86 host, ARCH
> > > > will be set to SUBARCH, which will be x86.
> > >
> > > Yep.  So the big question is, why doesn't anyone complain about KVM selftests not
> > > building on 32-bit?  Because they most definitely don't build.
> > 
> > I guess no one's building on 32-bit hosts anymore? :)
> 
> Well, if that's the case and kvm is broken too, then just ignore it
> and turn on vfio for x86 like kvm does?
> 
> No sense in just fixing it for VFIO..

That's fair... So something like this?

From: David Matlack <dmatlack@google.com>
Date: Tue, 28 Apr 2026 22:57:48 +0000
Subject: [PATCH] vfio: selftests: Allow builds when ARCH=x86

Allow builds when ARCH=x86 since the top-level Makefile can set ARCH=x86
even for 64-bit x86 builds. ARCH=x86 can also be set if the host is
32-bit x86, but based on the fact that KVM selftests allow ARCH=x86 but
also don't build for 32-bit x86, this isn't an issue in practice.

Reported-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: David Matlack <dmatlack@google.com>

diff --git a/tools/testing/selftests/vfio/Makefile b/tools/testing/selftests/vfio/Makefile
index 0684932d91bf..40165d087a0b 100644
--- a/tools/testing/selftests/vfio/Makefile
+++ b/tools/testing/selftests/vfio/Makefile
@@ -1,6 +1,6 @@
 ARCH ?= $(shell uname -m)

-ifeq (,$(filter $(ARCH),aarch64 arm64 x86_64))
+ifeq (,$(filter $(ARCH),aarch64 arm64 x86 x86_64))
 # Do nothing on unsupported architectures
 include ../lib.mk
 else
/usr/local/google/home/dmatlack/kernel/trees/vfio
