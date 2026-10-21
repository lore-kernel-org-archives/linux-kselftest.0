Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792626411;
	b=WWF5ZQPBQnTJlvFON2HtMbK4cRPbTdE969ed2IBB1UiIjGOV3B4Vc1n4+MYM3ZU+belV
	 zUTw9qmOaqXbm6L5nzXN9UXzr5xGlg0qH54ZEBDsX7ZM1bO9nNOS81s1HB6i+/bUl0B7z
	 5tyIXSHH9Yk5bXM77dF+SFUakaFbSgn9SDWIoG23974gesAnNyI19LVUQXluJJITCIZgz
	 490qqF4wJZk4xz5r/w8H9qTnr0aCx2Rh/TfqaIf4hs9YOFfBNd3EhOFlOgaq5wEXlqGKc
	 ErxjbLrNKXZwYGCEZ5w31laMzPTNc0I6lYi2sO5qRNYf1PbgUuZRxjUL7yDjpifMvhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792626411;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=n5hOymfjgaz7xpjT1ssIdHSQ+wD4cuNPKUAfRnejzdg=;
	b=W4J8/NcuP6J/0Rd3dd5AJdsXNiQJSefMvhe5VgvHCi79ZcVxYTgzmDQd3bLrSXd+qn0/
	 J3XJRBHttjl+mZkYpZ2/6B3pMw2E9KRmySup5KB5nUvxJbbGBTCl1EAslxsa0FcsBIHjV
	 DmwtlH2Pc2urX7gzNmT94KsTsEbVay1BO74cKLw7HKY8wSCAjRayYZHgp0WMs4Z6+ten0
	 Gnp4g8e4R12w6msCxQUi3m7R1AnAB0TG6dSlbcsHrVNm7DMwRl/ussSy6rzmrHnAwtDWl
	 21a0ZZmnrt8ipYgrzWSxjWNhbC+fKgUM7axOSRabjO+wxTove78CUY51qaHB6VKNTwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=RWEqARLN;
	arc=none smtp.remote-ip=209.85.222.182
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85706606A320
	for <linux-kselftest@vger.kernel.org>; Wed, 21 Oct 2026 23:46:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85706606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=RWEqARLN
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-93e63ee7b4cso146021585a.2
        for <linux-kselftest@vger.kernel.org>; Wed, 21 Oct 2026 16:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1792626409; x=1793231209; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=n5hOymfjgaz7xpjT1ssIdHSQ+wD4cuNPKUAfRnejzdg=;
        b=RWEqARLNhr7kM3UoylUxt0c18uD7BW+nnkV6qlrI9YT9zsHGYUDmS0p2u/OOJbEXRO
         SgtdrfJPP8qwXew2mkzTL5kBpez8YAljokMt8HUv0ST5gnPGdO65tJGybD3uqk3DHnFQ
         VEfyFNtRpndd2xu3NGiNoG2k4NxrYb1vsCefZIqb45l7I9z62Aci6eddaiDR77WnIZoy
         eWMUHuI+2+oIZ9KbTn2PavphoEY3W05B528MicbkGhBUCoiwiAwUvz+JZs0AWZblHyFz
         J4NMmzr4UzXCJ11N9e51QR5awZqclvbU5xHpjVK9003y/gTpC40ys8/YEtw5gSAxngqs
         Ulog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792626409; x=1793231209;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n5hOymfjgaz7xpjT1ssIdHSQ+wD4cuNPKUAfRnejzdg=;
        b=GBfcGfkp8R2v4kFA1OjLrZLi+Gvwws8ja29vBMNVlp3vtpEvPFn4Ue0XraVGF5duTp
         fNKLPAbPjRX6t1qL5Q+X5PmOYjoUj/eb3qI6BwkoetfAyoc1aSnh4a+jBWmjGx8gbkpF
         t9lPduCi5B8YDleCVqjOvCO1RyCVUdTKLEkk+lCuS/eQQare94WD81wU9OHwtJqwwOf/
         WCaAgHIuIAGapSGNTPE7kpms16upXoZeb3GefYMvEfsLDSTDawwswkVyqsD9HTQiu2XD
         kTgO8FXVOIWprjPIDhQJeOkTlRRXGCdGN1JotcWssw5CXmN46KETRSsBnl7bm8IOcno2
         7U9Q==
X-Forwarded-Encrypted: i=1; AKwUvBx9kKwwU4JmRghP0bWAyNsCPJUZALVoJ7KI+V3CNRV9JU43b7OJt6dW9wlrhi7G3q72nDysSJHE8M/fdBjgfEA=@vger.kernel.org
X-Gm-Message-State: AFq9FYL40EBveiSb19P4M+gAeIFLPd0dodRnTq5mLzowxD2hLwHpa5fJ
	jL+q2W274ZUzkJeBxMxv8ep3juPX927AyspUFFO9RESOGD6SdxsVaWebf7F0dNXgFMs=
X-Gm-Gg: AYBFou28ctN0pIQHBCSx2CxnHBmgPY6ZZAlDRC0n3CGtM2IQJgTDehavHbq+WJZOhcD
	VgVJCqyeVqFYKC+mVYuPPE+fhhxJ9uN6jCHbTl5RnOIDPcmcYIDjEtdC4f3MCE6Ql6K8LihOrS1
	RKAxi0bxpv4095kF+d7vmup5Jdh909tPJFl4E4XJHVmQ5ToklqxVcjsI5p5/qfwY+IekAZ+mo7g
	WDWMs0eNqETAaN/8CO3pCeB1ecy4s8zRVK/BtX5U+K48Jim9GCw5uJkn4rH6pXOvkuLg4c+VrN7
	7AwtTmunWz4NoogIBwJ0ArH+3o1hI+JyoHKTqPnfKy5KxRi/po2KKgtZeczQfQV4alTmqNi+BRj
	kthwQKy6P2f0F16VhrxyIwk9nOKLnqKZQR6VempjiQJEyQxW4WuZzgRKd+uLO9M4EK+XeRpgss1
	Jp/TGwHDqjoWZzSeYxntoRQ52jS6lqfZihACz7lyCcIGZtVfO8DbEHqjmqP0UtOReIu3VXCF02T
	ci3koK5lGvw8za+Qcegkm8uVtzRj5x+Lsna6lKaIwWtPKhohEnO1QpxhOhyacnVIl0TzSJABbtf
	pnKEkH1d0A9+DvFuIfPsL8DG3+K4HR7MBfWzWLrrZUMOZY6jW3h7PzPKwbw=
X-Received: by 2002:a05:620a:17a1:b0:93f:22f1:97be with SMTP id af79cd13be357-93f5800e406mr694136885a.72.1792626409239;
        Wed, 21 Oct 2026 16:46:49 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f56e2bee2sm373858385a.42.2026.10.21.16.46.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 16:46:48 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xJg19-0000000EWG8-3cjA;
	Wed, 21 Oct 2026 20:46:47 -0300
Date: Wed, 21 Oct 2026 20:46:47 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Samiullah Khawaja <skhawaja@google.com>
Cc: Fred Griffoul <griffoul@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	Kevin Tian <kevin.tian@intel.com>, Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Ackerley Tng <ackerleytng@google.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>, linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [RFC PATCH v2 06/11] iommufd: Map memory provider files
Message-ID: <20261021234647.GA3381610@ziepe.ca>
References: <20261014093733.90312-1-griffoul@gmail.com>
 <20261014093733.90312-7-griffoul@gmail.com>
 <atkO08eCJzLX6R58@google.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <atkO08eCJzLX6R58@google.com>

On Wed, Oct 21, 2026 at 08:17:05PM +0000, Samiullah Khawaja wrote:

> With this approach, silently skipping holes during IOAS_MAP_FILE means
> iommufd has no tracking of which IOVA ranges in the area are actually
> mapped, which complicates unmap and could also hide a bug if a hole in
> the range was not expected?

I think if we are going to do this it should only work with iommupt
and iommupt should provide an unmap that is compatible with the holes.

There are other places that would like such an operation, IIRC.

This will have to block an access reaching into a guest memfd mapping
as well, so that should be OK.

Jason
