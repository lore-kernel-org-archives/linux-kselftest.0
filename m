Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEEDB22A4E1
	for <linux-kselftest@vger.kernel.org>; Wed,  1 Jul 2026 14:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782914441; cv=none; b=PSSrd6u6PN4XuLqHyyAinrcq+oU9uR5tQcmNvpVHYgJmE58VuKkxNbGeV5v30bxokmKRA5SLtyce8WyvT8V5+JGdWJBFwKVGNxnLLS3hm3dMkY0mSCVAqful5+5yHOV/eH0twXVdoxaW8aN6Wy/kNE3G8ibRnahd5N4d4IrpFLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782914441; c=relaxed/simple;
	bh=4+CF4D06wokhU4O+NifMVK8cQYxNVxqRt/1c9XuJGcg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Xd4waKhJsXNxJigybFXwixvXtFAzC5LzME0x03TQZMXXwE7g5F2SE8GP2POyQXbREHoc73DNPhCjgrVbn80S7p72zFouNKOE/WqNJ5yCgGt39hlaqHI5w5cA66OWT6Y3A9rUEncjz55y9M0WCIQQDPuErpAydhWjngOy8QfFi1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pBI1wK2h; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pBI1wK2h"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-c88aab7c1fcso523346a12.3
        for <linux-kselftest@vger.kernel.org>; Wed, 01 Jul 2026 07:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782914439; x=1783519239; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=mXus0JUDYxgkQTMchRIbdr+tq1wNp1blaxpaHfy1IqU=;
        b=pBI1wK2h/v5oQYqF7Xo75dRhoXMpCTvO489/ixFRu+ABpEJahsNub7Gue0w5DUdTBm
         xqaBOla2NXJvDNgJidKPbocq6L3LBVr335ukNFp8WLaXFpTxnMMXOt7c8kk77axLiMJF
         1VEFmdWPQsyRNvUlOQBNaGJBEG/97aREQdxoMiQbvP2WG1EjMQIGNFP1f4p45lQgvmTE
         myi0qPqF8YrMWPjBYoCfYg2bSFRLrDC4x/KaTcw4zzB7aSIySAD+70HMoo95INcdRLfZ
         TRP6NZ/ZuM048cCIxsNzFptiDejtbl60nsZlVdk4YUEPctggcpHg1vjznJImONYBFB5g
         +zcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782914439; x=1783519239;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mXus0JUDYxgkQTMchRIbdr+tq1wNp1blaxpaHfy1IqU=;
        b=HUCuZtd2NvxkeYKFHBPqmJAB2Z/y6vt90aPMd6zgFBydDUF+1PSLNgDIPQLIbT7GDL
         sGv+/09RDKbyBgcDGbvb09RvyIoRQ3Y3ADv0oaqMqHsxRyCr5gUps+l+0BbwQdXdva8/
         UMe1eIneGoWFf88qzB353efRpJAZGOug9XGLcZEKq1WlEA8ZLE29B3Nd29vlNtp9U5e9
         xtmQ19bEFX1DnFQk8bF57sVLiFVm6uLJAZD6DCKDvx7jtdXnWbb8SA4MuQwOO9TCe7/l
         JYmV7ZqlqS/niM9LILsG3aHXiKhga+ZrjLIr98C9nXLN32Yacf4ehwb1FSAXmtWHsOhx
         Wqog==
X-Forwarded-Encrypted: i=1; AFNElJ/ViwNID0+JYPBkA2JY4fC9ic37UBGrBO2yfpdOmFAEOy8Vd9JVl/T1XVETCyjpcjk/AyqtYH2Fy8QFDOQpTko=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyq4DphgmjW1YH/TZrZRKtY86pibUVYN1gaAMpU+SfuQ8lkWSOB
	f3A0OLfZvpdxvBGUFRhASHVbcgzjIjwFCEBxuk4VHwF1vhSv/30ZhGt3GF1Og0gv5T41eskTYIQ
	nmBmNPg==
X-Received: from pgbcq12.prod.google.com ([2002:a05:6a02:408c:b0:c99:a30a:7619])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:6a20:b0:3bf:a1e5:ff62
 with SMTP id adf61e73a8af0-3bfed592b05mr1757052637.47.1782914438635; Wed, 01
 Jul 2026 07:00:38 -0700 (PDT)
Date: Wed, 1 Jul 2026 07:00:37 -0700
In-Reply-To: <81caa42d-9d07-4bed-892d-c24e0b298a1d@intel.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260521-tdx-selftests-v13-v13-0-6983ae4c3a4d@google.com>
 <20260521-tdx-selftests-v13-v13-13-6983ae4c3a4d@google.com>
 <CAEvNRgEBiivp9tOHZnFmWvF6ek-Ar-m2B+hb=-H0dgAcM2=z8Q@mail.gmail.com>
 <f8937d16-4aed-44d9-a058-beff56eac4ad@intel.com> <CAEvNRgFLjt+-cO-XT0s8uW2xXgyd+VVZ0g0Os6V0+LBFQzx8cQ@mail.gmail.com>
 <81caa42d-9d07-4bed-892d-c24e0b298a1d@intel.com>
Message-ID: <akUdhVsIb7BEqU7z@google.com>
Subject: Re: [PATCH v13 13/22] KVM: selftests: Set first memory region as
 shared if guest_memfd
From: Sean Christopherson <seanjc@google.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
Cc: Ackerley Tng <ackerleytng@google.com>, Lisa Wang <wyihan@google.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Binbin Wu <binbin.wu@linux.intel.com>, 
	Chao Gao <chao.gao@intel.com>, Chenyi Qiang <chenyi.qiang@intel.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Erdem Aktas <erdemaktas@google.com>, 
	Ira Weiny <ira.weiny@intel.com>, Isaku Yamahata <isaku.yamahata@intel.com>, 
	Kiryl Shutsemau <kas@kernel.org>, linux-kselftest@vger.kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, "Pratik R. Sampat" <pratikrajesh.sampat@amd.com>, 
	Reinette Chatre <reinette.chatre@intel.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Roger Wang <runanwang@google.com>, Ryan Afranji <afranji@google.com>, 
	Sagi Shahar <sagis@google.com>, Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Jeremiah McReynolds <jmcrey@google.com>, kvm@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="us-ascii"

On Wed, Jul 01, 2026, Xiaoyao Li wrote:
> On 7/1/2026 2:18 AM, Ackerley Tng wrote:
> > > > I think this patch should fully buy into in-place conversions, so we
> > > > need to also set GUEST_MEMFD_FLAG_MMAP:
> > > > 
> > > > @@ -483,6 +483,7 @@ struct kvm_vm *__vm_create(struct vm_shape shape,
> > > > u32 nr_runnable_vcpus,
> > > >    {
> > > >    	u64 nr_pages = vm_nr_pages_required(shape.mode, nr_runnable_vcpus,
> > > >    						 nr_extra_pages);
> > > > +	enum vm_mem_backing_src_type src_type = VM_MEM_SRC_ANONYMOUS;
> > > >    	struct userspace_mem_region *slot0;
> > > >    	u64 gmem_flags = 0;
> > > >    	struct kvm_vm *vm;
> > > > @@ -503,10 +504,16 @@ struct kvm_vm *__vm_create(struct vm_shape
> > > > shape, u32 nr_runnable_vcpus,
> > > >    	 */
> > > >    	if (is_guest_memfd_required(shape)) {
> > > >    		flags |= KVM_MEM_GUEST_MEMFD;
> > > > -		gmem_flags |= GUEST_MEMFD_FLAG_INIT_SHARED;
> > > > +		gmem_flags |= GUEST_MEMFD_FLAG_INIT_SHARED | GUEST_MEMFD_FLAG_MMAP;
> > > GUEST_MEMFD_FLAG_INIT_SHARED is valid only when the memory attributes is
> > > per-gmem.
> > > 
> > GUEST_MEMFD_FLAG_INIT_SHARED was introduced before guest_memfd in-place
> > conversions, so I think it's orthogonal to whether memory attributes is
> > per-gmem.
> 
> But before gmem in-place conversion, i.e., per-gmem attribute,
> GUEST_MEMFD_FLAG_INIT_SHARED is not supported/valid for Coco VMs.
> > > we need to check KVM_CAP_GUEST_MEMFD_FLAGS or kvm_has_gmem_attributes.
> > I think we do want to deprecate the non-in-place-conversions setup, so
> > how about inserting a TEST_REQIRE(kvm_has_gmem_attributes) here?

No.  Unless supporting out-of-place conversion requires orders of magnitude more
effort than just supporting in-place conversion, selftests should play nice with
both.

> Well, then all the TDX and SNP selftest will be skipped on the kernel with
> gmem_in_place_conversion=false.

Exactly.  They'll also be unusable on previous kernels.

Deprecating per-VM PRIVATE tracking does not mean dropping support.  We won't be
able to drop support for years, if ever.  And so from a testing perspective, we
absolutely need to validate both models (again, within reason).
