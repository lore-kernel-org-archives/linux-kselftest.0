Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 382D0362137
	for <linux-kselftest@vger.kernel.org>; Fri, 22 May 2026 23:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779491139; cv=none; b=b5+tr8Zp0GVBGx3+QTxL0Shi7dpvq/2G0dIjIKoBL23XMZ3ghvBz87esbflQqHFDuopbZdcH9f3HJcA/cCiOg1pwGvNA3yTaRr17nlF11eI3cZtw8eDcvMxCH0D/g/rDbFhWh/aoQ2HM3LcCmkzdgZUxS2ujeU3f2keLcjvUeO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779491139; c=relaxed/simple;
	bh=8vLtsz7ZKDtp2UNuNvqYFVPILl8UflYPbV55sojcBjs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=r95NVp245aajIlOJ1CRow/qZzmi0nXL7+EWTyIcnZfPmaaAq3GXkuaiA0qOKVNvr4OIa2AghPUSuiIrCrTu8ND1OGMo6gCbCZeKybIroPxHUym2luTo2O+WcFSqKg7LWaB8wcAj68okrPo2d+9rFTi619FJdnswXYJAUVY6A9vU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Q1omRqF7; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Q1omRqF7"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2b458add85aso84815375ad.2
        for <linux-kselftest@vger.kernel.org>; Fri, 22 May 2026 16:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779491137; x=1780095937; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=L9YbEtCfOkOpVPBvBwRE/wDUhUbdeL8GFXWIWh+htCc=;
        b=Q1omRqF7GS+r+lObqpsye11fwGR0yKpERorPgGM2HXjOz1ZE/0Ru6hjz2Ujvv11Ijz
         YsHwL21TMEaqqRKU9uFYSjf/EhPDN2F09Pa1A7JlXdBkrCX4wiyXQO2RZfVBcXRUrfNa
         rOI7LHhik7z78t/e98ciQjoFcBhtesS7/HMTKg+lPbHdKipHbit13lt2CfzsJWOax+cV
         L42VsFtWU8pa/+9sps5991TpH5atmHItZNdXVrvhNn4OS7bxIZ1vxSAOSHGAyeSCiRSG
         CHMnlsltXGmMOZKNSki2X3Qk0hzjOrVJqp5dWnEjvv70om6z3NZoixsuFVBXkUGnbJL5
         JD+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779491137; x=1780095937;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L9YbEtCfOkOpVPBvBwRE/wDUhUbdeL8GFXWIWh+htCc=;
        b=ExjauK9fMHbs78b6OocOdFPUIoWzr5mflkkswJfw3YMDJfkxi11zKnfh3Lv8lxbZlF
         Ib0ITJbg6Y3zsSB6T5tXXFtvVLj03vFvOTW6yvHw9dPSofcWOrI7TiCVVFlPjluBnFBQ
         juYp9C+ziIO9Z/ud7cXQ2Qef7p2Gj3jXqA5UNyq+4tDCGKSSZ8LSRWRnvWdd6U5J+u+o
         qLPOBnGgOWpr+ESqWXDOuEMiLg0ARJCVsBD0dsO0qh7Twhd8xxpYOGjjNIldJbiGZTKJ
         +/upz5GNbPqCkVuEXv1IkLn9mcP1IiCH0DYH8/qYR06YZz4OKS2i12a4mHe8UKI1kKQd
         54Pg==
X-Forwarded-Encrypted: i=1; AFNElJ9YHLzkfUnLVPAV5p6hj43EM6ovGku+4jS9UDkQmK/YPNE1uztThNMmHOpwNt7VMllcqT04kBKjl8eSP6bxMLE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7I3CGg+zLAcfRELpB3/0xfdzoGDYucShv2bmXG6ie8RWOA5mp
	NkFP6V5YXh+NuSbrPiHrwh3O794/b64URd0n0lFs3mWRuSXLsORvRYLXLniZkEA8NOJSWU3WlwX
	Ko+AZXw==
X-Received: from plbjh21.prod.google.com ([2002:a17:903:3295:b0:2be:1727:6821])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:e88e:b0:2bd:9803:9308
 with SMTP id d9443c01a7336-2beb070261bmr61986275ad.36.1779491137176; Fri, 22
 May 2026 16:05:37 -0700 (PDT)
Date: Fri, 22 May 2026 16:05:36 -0700
In-Reply-To: <CAO9r8zMY6i+TWoZPWzj8zB+Xw3rONbK-Nee1kSFwDkT3hy66zg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260521-tdx-selftests-v13-v13-0-6983ae4c3a4d@google.com>
 <20260521-tdx-selftests-v13-v13-7-6983ae4c3a4d@google.com> <CAO9r8zMY6i+TWoZPWzj8zB+Xw3rONbK-Nee1kSFwDkT3hy66zg@mail.gmail.com>
Message-ID: <ahDhQJI7xBOQpnjg@google.com>
Subject: Re: [PATCH v13 07/22] KVM: selftests: Introduce structures for TDX
 guest boot parameters
From: Sean Christopherson <seanjc@google.com>
To: Yosry Ahmed <yosry@kernel.org>
Cc: Lisa Wang <wyihan@google.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Ackerley Tng <ackerleytng@google.com>, Binbin Wu <binbin.wu@linux.intel.com>, 
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

On Fri, May 22, 2026, Yosry Ahmed wrote:
> > +static void __attribute__((used)) common(void)
> > +{
> > +       OFFSET(TD_BOOT_PARAMETERS_CR0, td_boot_parameters, cr0);
> > +       OFFSET(TD_BOOT_PARAMETERS_CR3, td_boot_parameters, cr3);
> > +       OFFSET(TD_BOOT_PARAMETERS_CR4, td_boot_parameters, cr4);
> > +       OFFSET(TD_BOOT_PARAMETERS_GDT, td_boot_parameters, gdtr);
> > +       OFFSET(TD_BOOT_PARAMETERS_IDT, td_boot_parameters, idtr);
> > +       OFFSET(TD_BOOT_PARAMETERS_PER_VCPU, td_boot_parameters, per_vcpu);
> > +       OFFSET(TD_PER_VCPU_PARAMETERS_ESP_GVA, td_per_vcpu_parameters, esp_gva);
> > +       OFFSET(TD_PER_VCPU_PARAMETERS_GUEST_CODE, td_per_vcpu_parameters,
> > +              guest_code);
> > +       DEFINE(SIZEOF_TD_PER_VCPU_PARAMETERS,
> > +              sizeof(struct td_per_vcpu_parameters));
> > +}
> 
> This is neat.
> 
> Sean, is this the preferred way to expose offsets to asm files (or asm
> code blocks) -- as opposed to say using .equ [*]?

For actual .S assembly, yes.  For inline asm, maybe?  If it looks prettier, go
for it.  

> If yes, I can rework my nVMX GPR fixes to use the same approach for
> register offsets. I wonder if the non-TDX part of this patch (i.e.
> Makefile stuff) can be split, then patch 6 and the Makefile stuff can
> land independently and allow development on top.
> 
> I can also split them out and include them in the next version of my
> series, then whichever series lands first will land the offsets
> support.
> 
> WDYT?

Hmm, I'd say keep your series as-is for now.  The OFFSET() infrastructure really
shines for proper assembly.  For what you're doing, AFAICT it's only marginally
better.  So I don't think it's worth juggling dependencies to use it right away,
we can always convert if/when the TDX series lands the fancy stuff.
