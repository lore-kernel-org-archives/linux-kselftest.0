Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 581FD3D1CAD
	for <linux-kselftest@vger.kernel.org>; Fri, 28 Aug 2026 20:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787948051; cv=none; b=OT5906PaV6GAOfnmoxYc6NtcIdvfhBbnmiwg+TFWhcDytwWTec+G9XTs0/4gvd97nh6QI6asmQKuWfPGvCUz7mLpgaZkT1SdhZPeS83kjiUhIYXbCtBUjyOWqNz1sGVofSVOzksaBuFUmBFGnTkrJLvGt1p2Jr9dkEXCo0IbCf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787948051; c=relaxed/simple;
	bh=RrlgIjKQtS2iaNVqkTRdRTy02FrfZJ1ASwUAxdnue2c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WigLn+my+7YuegiFpPPfSLGbQisRQ9ceUp7F1I4zqDTzHxWaPYvHqeNPrnXy/GeVc5NtmRPyG3wHAIlHe4r4BHRIhRLYQenQ4YGQ3y5xVstBeeNoTkTZA2uIKpqySHD6CSDw8Yywz9JYaBVb+vk8lMYTUCk9jmK59iAy0nonbPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Xy7jaMC3; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Xy7jaMC3"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2d3b440b97aso5435ad.1
        for <linux-kselftest@vger.kernel.org>; Fri, 28 Aug 2026 13:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787948049; x=1788552849; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1W99GsbYdan7e4eL7ZVdhDx98mSTGYMmyZJimSzUaX0=;
        b=Xy7jaMC3s/Mz4S8vdPPGXaHr2smRZE+dx1unqDZbo/sGMkQm59ENDpCVo2uXJRBKel
         5v+IVKyMB+7pzlLkyOqXNO9j/s5YvHmTG1UwrVvzTrpIvQbEdoGQktExhdBDOad96jkq
         gTAVSzYJ+qlOv5dD4Jc+4sPqRMjRmk/OOASlCykzhWf1gI1XwCQwMnjD3L1sJqVAPBp+
         LsPyJzR9IhABjN3x3zdsc0Z8+sRPHdnH4y7KD6OhMODs1nfxr9rl0FX3bfHF9uMNQY/G
         KRAGnenn49k94sOQFqwnrlCA9Mat5xpnRNU+1D35pI2Hugmic/mCk5HH+Xqae1KmoFwH
         nM6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787948049; x=1788552849;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1W99GsbYdan7e4eL7ZVdhDx98mSTGYMmyZJimSzUaX0=;
        b=HivcBdXbhhbLobNco2k6K7mR9vl+SgKuujnLc9cazYZ+qXEYiYM7v2281QFk0RRwee
         vTHclnSUbwl+wHipbMywAeVFJYod+A0r+5FkcxorG6U3e7pYgAYtKcM1fdhJQr5KzxCi
         p3WP/QdIc+y/9Dn1b8ZXp/VwmRuYogW63ra/SEtj4+JUANRtuVjXrWvpYFuQ25EAG6RU
         bANcw4bY6bOVWvDh9tzU2weiXGFQWu1nKKSOmIrqcI1j9/wOsKanDX+w5RTdm1BLAATX
         MJsprmOS9X/txl88P1PMHoFsycAi5bSPEZ3ix5bY8WLsZAAA9tk4Q8avWdDh4acj8X3J
         fzvQ==
X-Forwarded-Encrypted: i=1; AKwUvBzCc0mcCUoM+2P4rtt+LQoaf/CF/7YNyBJCjfqIHOa79rq7E1gmLIrTNm+bjuAkIR0NwMtVOxDoRc842i6MVIQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lvtdPlwQRs9A+9V5s5AcTSY7byEwFlg49sPgw5UbefwIAvbvb1
	VaGSDLDPxNQ52fnHhNc/mQzz43QkBGybqxGi11aLoCswqF7M7BTPGGo8ukkseYucEA==
X-Gm-Gg: AYBFou2ed4zcKHQOQvpJk2bDOPZWeevgp47XqrXoujR6DfDqG00HRMAF9SSoTbS1I07
	eb2fdOkgXBXPqghmw4rKy9rC8tPxflMMdWpa/gFKbX9LlCCsemPnF/vza36XkWb2XNvfPFtZKqj
	SZ5j0Lhid7wsIbU8GeHaanQ8Uq4dhMyIFGmBeC2o5zRoX4eKzwsWUPJXMKj0u50AhsHzFmwZSfW
	4h7PVE/u26J0irHhZQ0ogfYiJNw6VWJqZWERxd7FlItnPHtayH4NJwwhF0YpsgOABN/ssqMVidv
	qAgff19rQQEls9wzAfh0tZF+jvBz7Q/vskjKq6xbZIjPtvHtGGLdnPGyBpCL5PI1MyCPxZ9P7iY
	h3pVcyuDfSRoKKoLu0N8iznkE7KYJUbIMQOHoOIlemSQOT+ftbxUHF11RttipZMg7dPO1bBRPoo
	+VVJLPR98c2+K9yHQKNYPx+9bYmyp1rw1NB2JBfOeJLia8/sQRkLTByNjeLNfrH6nmAg6KgcL7F
	5/wvLKpgQh4ITJ0uz5PciMW
X-Received: by 2002:a17:902:f642:b0:2d5:db38:800f with SMTP id d9443c01a7336-2d8df554483mr1432235ad.14.1787948049010;
        Fri, 28 Aug 2026 13:14:09 -0700 (PDT)
Received: from google.com (139.58.247.35.bc.googleusercontent.com. [35.247.58.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d759869cfdsm8784715ad.51.2026.08.28.13.14.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 13:14:08 -0700 (PDT)
Date: Fri, 28 Aug 2026 20:14:04 +0000
From: Lisa Wang <wyihan@google.com>
To: Sean Christopherson <seanjc@google.com>
Cc: Peter Fang <peter.fang@intel.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Ackerley Tng <ackerleytng@google.com>,
	Binbin Wu <binbin.wu@linux.intel.com>,
	Chao Gao <chao.gao@intel.com>,
	Chenyi Qiang <chenyi.qiang@intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Erdem Aktas <erdemaktas@google.com>,
	Ira Weiny <ira.weiny@intel.com>,
	Isaku Yamahata <isaku.yamahata@intel.com>,
	Kiryl Shutsemau <kas@kernel.org>, linux-kselftest@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Pratik R. Sampat" <pratikrajesh.sampat@amd.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Roger Wang <runanwang@google.com>,
	Ryan Afranji <afranji@google.com>, Sagi Shahar <sagis@google.com>,
	Shuah Khan <shuah@kernel.org>, Xiaoyao Li <xiaoyao.li@intel.com>,
	Oliver Upton <oupton@kernel.org>,
	Jeremiah McReynolds <jmcrey@google.com>, kvm@vger.kernel.org,
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org,
	x86@kernel.org
Subject: Re: [PATCH v14 10/22] KVM: selftests: Set up TDX boot code region
Message-ID: <apHsDCRHG-QIYZuL@google.com>
References: <20260722-tdx-selftests-v14-0-15ad654a50db@google.com>
 <20260722-tdx-selftests-v14-10-15ad654a50db@google.com>
 <20260824192702.GA3694338@pedri>
 <aoyi4nhWkhFrlIfs@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aoyi4nhWkhFrlIfs@google.com>

On Mon, Aug 24, 2026 at 01:00:34PM -0700, Sean Christopherson wrote:
> > 
> > There shouldn't be a need to "pad reset_vector to its full size of 16
> > bytes" as stated in v8 [1]. The exported "reset_vector" symbol in v8,
> > plus the boot code start & end markers, should be enough to help
> > tdx_vm_setup_boot_code_region() put this boot blob in the right place.
> 
> Ya, looking at this with fresh eyes, AFAICT there's no reason to handcode anything,
> it's just basic arithmetic.
> 
> Side topic, this series doesn't compile for me, so the below isn't even properly
> compile-tested (I hacked in arbitrary literals to get past the undefined references).
> 
> /usr/bin/x86_64-linux-gnu-ld.bfd: tools/testing/selftests/kvm/lib/x86/tdx/td_boot.S:26:(.text+0xf): undefined reference to `TD_BOOT_PARAMETERS_PER_VCPU'
> /usr/bin/x86_64-linux-gnu-ld.bfd: tools/testing/selftests/kvm/lib/x86/tdx/td_boot.S:30:(.text+0x17): undefined reference to `TD_PER_VCPU_PARAMETERS_ESP_GVA'
> /usr/bin/x86_64-linux-gnu-ld.bfd: tools/testing/selftests/kvm/lib/x86/tdx/td_boot.S:33:(.text+0x1d): undefined reference to `TD_BOOT_PARAMETERS_GDT'
> /usr/bin/x86_64-linux-gnu-ld.bfd: tools/testing/selftests/kvm/lib/x86/tdx/td_boot.S:37:(.text+0x26): undefined reference to `TD_BOOT_PARAMETERS_IDT'
> /usr/bin/x86_64-linux-gnu-ld.bfd: tools/testing/selftests/kvm/lib/x86/tdx/td_boot.S:44:(.text+0x2f): undefined reference to `TD_BOOT_PARAMETERS_CR4'
> /usr/bin/x86_64-linux-gnu-ld.bfd: tools/testing/selftests/kvm/lib/x86/tdx/td_boot.S:46:(.text+0x38): undefined reference to `TD_BOOT_PARAMETERS_CR3'
> /usr/bin/x86_64-linux-gnu-ld.bfd: tools/testing/selftests/kvm/lib/x86/tdx/td_boot.S:48:(.text+0x41): undefined reference to `TD_BOOT_PARAMETERS_CR0'
> /usr/bin/x86_64-linux-gnu-ld.bfd: tools/testing/selftests/kvm/lib/x86/tdx/td_boot.S:54:(.text+0x51): undefined reference to `TD_PER_VCPU_PARAMETERS_GUEST_CODE'
The patch series posted here on the mailing list is correct,
but I made a one-line mistake when pushing the code to the
GitHub branch. I have just force-pushed the fix to the branch.
It should compile correctly now. Please let me know if you
run into any further compilation issues.

I will test this change on my side. Thanks!

Lisa
