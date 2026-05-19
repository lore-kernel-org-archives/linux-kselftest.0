Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6323A377558
	for <linux-kselftest@vger.kernel.org>; Tue, 19 May 2026 19:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779220466; cv=none; b=Vj2R2L491g+lUFGJ5KTX+3k0RI65aJ5crS/eO+2EOb2xmOqIpueACRhEIhZaxMl/hb6CO54qVWy+iRX2wxd1eojU5MXxOnt1o+mnA7n5GTYbWHYPSNcMHB+vP2XWZpJapBMgjOUvoAGvgmBRz+QPmHaY4enYliG6Iuu+w6wf3g8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779220466; c=relaxed/simple;
	bh=6tfGb49ZRedzfCouA50bV3/0wXxsxoJ4fIw9A0Ifz4U=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=cXBQr9lVTdToNCwJyXSNkEZ/rLDzHOJeZA8xO/MZ3MEYBpGydj8db5bWFgB6Nt9IVwByRntR/OaSZ04Q+yVfBtF9oNcVdh+mgmK9qL6vFn/1eyaVHxo5GaUhEAxfcTcj+NKZSe2KOGwgR2KKCl//uK8F7WSLy2RxCZWAED64rTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ivKep9oo; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ivKep9oo"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2babbeff9e4so42433305ad.0
        for <linux-kselftest@vger.kernel.org>; Tue, 19 May 2026 12:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779220465; x=1779825265; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=qAVfvuPEzTQrhFN0ZRU1W9jX6cZgBZO1ZxbdghzeH5g=;
        b=ivKep9oo+fInZx3A0ifdL26qwEgErdKKTa40FI37QuDEMbwDZN+dOozCpEotRxO9uA
         jfKjGnMgN7mHGI+/PTcPkV4tssG0bDx5QNe9s+RqcUlIj6AcC/b6dXxXSZJOy6NAAEYr
         GncMEWFnTLICjb+FsZalDOIfplHq2T/XPxsnSr3N+aOMo4Ay7We1bZeSXx058++NUoqO
         /qmxEzHuQYcM0dq36IUdNthEPqJRJRv4D+PTZOCFKedoFb6UQ8ldb7yWsFl0htlNg4h9
         gYaOU/buzppAeSzO4IKI/kVxDMVHUqzVN8+eEHr96izakEnXlUIL2FGmj4sBdLGg7Y8R
         LAag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779220465; x=1779825265;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qAVfvuPEzTQrhFN0ZRU1W9jX6cZgBZO1ZxbdghzeH5g=;
        b=i5AMtPcTPpSbOYFDxyhZo6KdrfI8Eq2AyrdpJG+heGa82d7UvhwWo4y2PbDO3jaV+8
         ZepfIhXSeqahl+u1nLmu5OtOppHGbi4DtKOp88VeSh05ixJX8caJS1JGKdMeKe+X+e03
         oQqS3Hkf9Yh3SlnRsVVJMP3xyVXVlBu7WYW3RJ0c7M2oA9+VSdBGrx2v6AkPGVA0vxd3
         IA+ahCuIsv1hGlPLiAPaK48lVJLWhpAGwtC88Mn/LNHBm1RpG8NaJebyNAaOMJpaI62s
         72s/KmBlHZ6tBa6mSwgsAqg0nP9hHh4zR1ryfORy9ZyvhqgM4WupBfr9hi0ZX6ggwa4V
         fHqw==
X-Forwarded-Encrypted: i=1; AFNElJ/lQqL7Olj1LCBf6hC5kFAcRY2mTuRMDFaOmQ1YVSzwA6geY+L+88yXTRmarBDiCF+ZJbBqbcgyLEMgzPt5M7M=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPYmSgJWYERVsSuOvw4ToC3Gw4uR5apIvPNPF4grJjGvQf0CPB
	2XJgE+3VnXE5X2Ca0YoDY3ycmJNJ7jfEmzhbPmWxkTVjLI5N+kexpOKaV0I76VMd8/1HYWBaX+J
	SrzKFfQ==
X-Received: from plgq11.prod.google.com ([2002:a17:902:eb8b:b0:2b0:6cdd:87e2])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:758b:b0:2ba:838b:bfae
 with SMTP id d9443c01a7336-2bd7e93d8b2mr127872135ad.18.1779220464419; Tue, 19
 May 2026 12:54:24 -0700 (PDT)
Date: Tue, 19 May 2026 12:54:23 -0700
In-Reply-To: <CAEvNRgE4o6C8P2jW_MGn=1BHxgmp183UTk_h5YkM+U_MCTMdzA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260518070943.2091287-1-ZongYao.Chen@linux.alibaba.com>
 <20260518070943.2091287-3-ZongYao.Chen@linux.alibaba.com> <CAEvNRgFgobnW+O=t32gu-0YDy0n7ZqvmdCtg+DzLT3uf0+BDeg@mail.gmail.com>
 <agt5A90k9lS9JPWp@google.com> <CAEvNRgE4o6C8P2jW_MGn=1BHxgmp183UTk_h5YkM+U_MCTMdzA@mail.gmail.com>
Message-ID: <agy_7zPjksEk26qX@google.com>
Subject: Re: [PATCH 2/2] KVM: selftests: Test guest_memfd binding overlap
 without GPA overlap
From: Sean Christopherson <seanjc@google.com>
To: Ackerley Tng <ackerleytng@google.com>
Cc: ZongYao.Chen@linux.alibaba.com, Paolo Bonzini <pbonzini@redhat.com>, 
	kvm@vger.kernel.org, Shuah Khan <shuah@kernel.org>, 
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, Chao Peng <chao.p.peng@linux.intel.com>, 
	Xiaoyao Li <xiaoyao.li@intel.com>, Tianjia Zhang <tianjia.zhang@linux.alibaba.com>, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Tue, May 19, 2026, Ackerley Tng wrote:
> Sean Christopherson <seanjc@google.com> writes:
> > @@ -542,6 +542,26 @@ static void test_add_overlapping_private_memory_regions(void)
> >         TEST_ASSERT(r == -1 && errno == EEXIST, "%s",
> >                     "Overlapping guest_memfd() bindings should fail with EEXIST");
> >
> > +       /*
> > +        * Repeat the overlap tests, but so that there is overlap in the
> > +        * guest_memfd bindings (i.e. in guest_memfd file offsets), but _not_
> > +        * in the GPA space.  Regardless of where there's overlap, KVM should
> > +        * return -EEXIST.
> > +        */
> > +       r = __vm_set_user_memory_region2(vm, MEM_REGION_SLOT, KVM_MEM_GUEST_MEMFD,
> > +                                        MEM_REGION_GPA,
> > +                                        MEM_REGION_SIZE * 2,
> > +                                        0, memfd, MEM_REGION_SIZE);
> > +       TEST_ASSERT(r == -1 && errno == EEXIST, "%s",
> > +                   "Overlapping guest_memfd() bindings should fail with EEXIST");
> > +
> > +       /* And now the back half of the other slot's guest_memfd binding. */
> > +       r = __vm_set_user_memory_region2(vm, MEM_REGION_SLOT, KVM_MEM_GUEST_MEMFD,
> > +                                        MEM_REGION_GPA,
> > +                                        MEM_REGION_SIZE * 2,
> > +                                        0, memfd, MEM_REGION_SIZE * 3);
> > +       TEST_ASSERT(r == -1 && errno == EEXIST, "%s",
> > +                   "Overlapping guest_memfd() bindings should fail with EEXIST");
> 
> I just noticed this is kind of odd, what is the purpose of "%s" and then
> filling the string in with a hardcoded string?

Purely oversight.  I didn't even see it until you said something :-)
