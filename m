Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792777343;
	b=SknF2yOulqgaq2u2V9wd1oQoU0KngRn2NDcp2mihAXaZckYTUEfqp0c4+EFgV7FVWaPj
	 b/9jCCx1pws2D2Hqjm45buf1DIsQvxTStFePIFwC2LBJdUytpfClJqOhAuAPgwcHSafcw
	 v2QwC+SruAdos/Mqlg4amLNOC9qA44g83s5Gu2QOJzQpsLc6Bvapaqt0I0HK7YpT5p2E0
	 Lxc7dSZC309b+mb9P1u0dzc9Q0cSLjWkZi9zILalZPiwz/5lihM5tm1orCkNlgI5M8srO
	 CcaEloiJFtrj1y5f5z1lksNtTp4ARGfm4BY8ExAzApa+T3KW076TVR/ih2Bi76lz40w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792777343;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=IArJW2D7DC4NrWDvM238weKBxrWboHP+GmGljUSheNA=;
	b=oyZnrVFpmNL3Dq+R3d7Foi+TIdqP5dgQl843IoUZPzuucWGrmf/H8PAKpHv/BlLo3oUc
	 AScmZPw+PKEgSofM6A4Au8bj17dWkdFEtgT6F3hrjFA2xhg5beFUqORQmD5FLJzzOjMtt
	 qNs1p2f3TCQyYjc773kfgABslmykzEbXQsWvaGUQs/LwnYT3JG8AeaIGu56AHmHcrJyQ6
	 CqqQCGys0Pz+jzc1Op8l4JGWKxatHZ1kkvHN6/SVLuFJd3KhcOUqeMb8fETr0LnzZBJ3A
	 kwxn4QGbumZUfaMHpzQG15vbvH1BP5p8hSyNKpOE3As1kWutm+Zhu8rAhUXvYZcf2Kg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qE15pYgN;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBCBB606A31D
	for <linux-kselftest@vger.kernel.org>; Fri, 23 Oct 2026 17:42:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBCBB606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qE15pYgN
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48e0d1c095dso809139f8f.1
        for <linux-kselftest@vger.kernel.org>; Fri, 23 Oct 2026 10:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792777341; x=1793382141; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IArJW2D7DC4NrWDvM238weKBxrWboHP+GmGljUSheNA=;
        b=qE15pYgNtOgyK2wp9uhHmPW3lpnIrQjWDDouCy3JYbd1IPAGnpkiQ1sFjBCfeqsgVk
         11lRWEucebETVSgkVRwe4eQ7IHe8OlPrizWnzae5mEN51Lz7LmMQAvfowgfp7pp9VjSY
         8ojMFcQ8Y/cMXl9Vl5ClHIKs8MbSDwSpdyrxKk5eONs/+iNwEGuTjszhx81xmGle2j3u
         5SttvDKVdVVC6L1H6oJIFjikyY5gkiye6rcli8bFHH5Otyy3QtD+qvimrzBlONJNZ6SJ
         X5NX0lfRgpuebTW3dXrYQ6ah5QMTrTT9+wd/GIR0AgncOrzQqe42eAZ9koOBhOXDH0X3
         DVDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792777341; x=1793382141;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IArJW2D7DC4NrWDvM238weKBxrWboHP+GmGljUSheNA=;
        b=Ye8WkdQUpHMoL3Cc/mYbwRFQPfdCnZJyPYh8j6u2/EUrx4bgHVCGs+J9CC2wo32vRR
         NEPXco5mL+BXwrf1IQcFjDzjwcnqvWm80E1yavrjAGFxS8ioZpsQzd14hFpsS7afFGsD
         /sEKRMcfH62VFBYq/N3f/tasKPeRHEFw0qNN3ojvCC+zIOa1Ums0N3j/wM+b2Cm05UB0
         iKfqesUDOgkyNkTTx6vEDgU4bHb1rABa9jpIHhoDNjxeb0D50ZJizmjW74xToKOuNS3I
         msyYkoWxTqWdoPdJtquTW0KtdKZCXGAJmIBO3Qe31nOQtBZUFH3g6MkZrEnhYY8sNwfq
         HOxw==
X-Forwarded-Encrypted: i=1; AKwUvBwhX1kDAzbdLmZ0xXXeE7bN+WyTreTW+pCPyfMGMSwRqR2woVkSwW3EBL4kxxBx9iWquHSOiKnJWZKqRjno8Kg=@vger.kernel.org
X-Gm-Message-State: AFq9FYITal57nbrtLTMHteilXagaNe5b5y11u2W22+7l0qz/+7bMmzn3
	+Xko53AN8j4T/Lv57AfxlSAggTZcIJUnIKkEkbdfy6jclfgNjnujGYEw
X-Gm-Gg: AYBFou3vhhKoNQsZpSOHUeKKYRo5UyXfH5Jrt3TlkQIQLNfscmqTyvujh5ljolovoul
	xNpn7bF90q7JPt2rRFm40160nbQL5HiEuWO3X9olR804zeuXEvVGnfd74OiP0gxdMEwRT/EGdyK
	FU/e8F3DTTiyCyEqYl2im8CiWtHqne7vS4CMbjjqwmhg22pb/RNM9bx48e93nJ2Tgu5O+aoNLhs
	JIhVYYxhKpwRaeo7DS6XqTaUydQFPRJgNWfghH4PFjFTqEtzbdrcPMdsezEknCo978YxpDNYiMC
	YfjJEy0vj9dE3Q0JEBtm29o+rGZP+AjmTrvBzFgjsGg71IZJclPbVBZRu8xC3zBs7ZTso1ASJdG
	3xvVLWIIix+d/8K7JkenER+GrGTlrH/xPlvXXQxCbZI0XBNZui3Tx8A2cEBQPPzZb/04CAuFdmc
	tcHMnuvKYI6oLJAVsBHY5Cg1EG66DBKcrgT6dtBaC3G8GGrdUFA24+lL1whEwVNKEHKNaOg234H
	zlYR7WDjW8Hh483VJ3sHSQPQ3E6hfhN8gUrdcalQBJ2S6TnKUQ26w5z20SIR68X9XySXPuftL2w
	QW+GFw7HXnTeEA5LBIJCXDg5DUXDBghadwYCG/YHvGd7ZEc9UEelcfA9tNwueDPLP6TE9NXzk7j
	XNqHWAfwbDWW9qlNe
X-Received: by 2002:a05:6000:98e:b0:48d:ea67:79d4 with SMTP id ffacd0b85a97d-48e385af0d1mr4196895f8f.53.1792777340908;
        Fri, 23 Oct 2026 10:42:20 -0700 (PDT)
Received: from dev-dsk-fgriffo-1c-93421965.eu-west-1.amazon.com (54-240-197-234.amazon.com. [54.240.197.234])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d40c182sm1118217f8f.34.2026.10.23.10.42.18
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 23 Oct 2026 10:42:20 -0700 (PDT)
From: Fred Griffoul <griffoul@gmail.com>
To: Ackerley Tng <ackerleytng@google.com>
Cc: Alex Williamson <alex@shazbot.org>,
	Alexander Graf <graf@amazon.de>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Alexey Kardashevskiy <aik@amd.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	Ashish Kalra <ashish.kalra@amd.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Baolu Lu <baolu.lu@linux.intel.com>,
	Bill Wendling <morbo@google.com>,
	Borislav Petkov <bp@alien8.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christian Brauner <brauner@kernel.org>,
	=?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
	Connor Williamson <connordw@amazon.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Dave Jiang <dave.jiang@intel.com>,
	David Hildenbrand <david@kernel.org>,
	David Rientjes <rientjes@google.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Erdem Aktas <erdemaktas@google.com>,
	Frank van der Linden <fvdl@google.com>,
	Gregory Price <gourry@gourry.net>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Hugh Dickins <hughd@google.com>,
	Ingo Molnar <mingo@redhat.com>,
	Jacob Pan <jacob.pan@linux.microsoft.com>,
	James Houghton <jthoughton@google.com>,
	Jan Kara <jack@suse.cz>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Jianxiong Gao <jxgao@google.com>,
	Joerg Roedel <joro@8bytes.org>,
	Joey Gouly <joey.gouly@arm.com>,
	John Starks <John.Starks@microsoft.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Justin Stitt <justinstitt@google.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Michael Roth <michael.roth@amd.com>,
	Mike Rapoport <rppt@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Oliver Upton <oupton@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Samiullah Khawaja <skhawaja@google.com>,
	Sean Christopherson <seanjc@google.com>,
	Shuah Khan <shuah@kernel.org>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Tarun Sahu <tarunsahu@google.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Tycho Andersen <tycho@kernel.org>,
	Vishal Annapurve <vannapurve@google.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Will Deacon <will@kernel.org>,
	Xu Yilun <yilun.xu@linux.intel.com>,
	Yan Zhao <yan.y.zhao@intel.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	x86@kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	kvm@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH RFC v2 31/50] KVM: guest_memfd: Support getting PFNs for stage 2 from providers
Date: Fri, 23 Oct 2026 17:42:18 +0000
Message-ID: <20261023174218.54790-1-griffoul@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261022-gmem-alternative-providers-v2-31-5dd1dc6c660a@google.com>
References: <20261022-gmem-alternative-providers-v2-0-5dd1dc6c660a@google.com> <20261022-gmem-alternative-providers-v2-31-5dd1dc6c660a@google.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> +	if (kvm_gmem_is_pfn_mode(gi)) {
> +		r = gmem_provider_get_pfn(gi, index, pfn, max_order);
> +		if (r)
> +			return ERR_PTR(r);
> +		return NULL;
> +	}

The order goes from the provider to the fault handler unchecked. MPS
reports 0, but a provider with contiguous memory won't, and then a
fault can map a block that the gfn and pfn aren't aligned to, one that
mixes shared and private pages, or one that covers a page being revoked
or converted at the same time: only that page's gfn is marked as being
invalidated, so the fault doesn't retry.

Clamping the order in kvm_gmem_get_pfn() to an aligned block of uniform
attributes, and widening invalidations to the surrounding blocks, would
cover it.

Fred
