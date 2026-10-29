Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793279032;
	b=QhsDcomSPJ1Ijksb2PLexOBBWCGttjkAWtT213QjJKAveaAYXIC9pbvWxhroOwtNx68W
	 tBEybZgNGtDTTOxkMXB4k8sf0AhfBO+khTzl2zmZX6JRa1ZasWtmXD74LlIHDed0l8gJE
	 9mqVQYC6ZGwjB3W9idB9qLf8N6jVdZOg7/nViUHD07kvJVoa2WKqubQEPYg7TZAEwd/UM
	 nCNZ18LuBQ+BdFnnQQVu7CbRk+xKSH6BR4pyRXio7skbykmsTgi4dr/YdcDFTSyIq9WNz
	 lqNdEZkukbEFxmL2IXqNihsAxohKNvji5zYwAJOim7qi4FK8tD82b5oUo8X4TZemrDQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793279032;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:In-Reply-To:References:MIME-Version:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=KF90/0GARuMWHyMTMB3Xwv0e5GgnH85LGW7qmrj44J0=;
	b=gt03bFL+5qYBjpgAQzJ9O3FUnSCqZ7lG5sYcWf3+DKyZBeWfxJMyLgxubRETRktKdjuy
	 LltrJqLuXudS3lhkWuhiQ29QR76k3I6CJq2Q6q+uYGJSuow7RbSTGso9JOxeW4nZ+MyZt
	 YOsbz6XszBNprkrYFq4aIpeUjvrYt10wiwo9XpTfFZmO1F1ZbZYuZgLR8AW97DoaZSwBc
	 wcWzaszruzj7gldf0XCJYg7xAnxTCT1EqAw6dL9C3j37cFP9jeOUWbG2W7IspMWIx3P3W
	 n/O3g0nk9bxK1chdRQyL4cJdJm11MuwLs7WbHMCYMDmwaujwWKKvaWP+kYT1Vrjw/Zw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=C50p55VE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.180
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A48F5606A324
	for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 13:03:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A48F5606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=C50p55VE
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-5365f9a04c5so31637761cf.1
        for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 06:03:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793279030; cv=none;
        d=google.com; s=arc-20260327;
        b=MmC//fjbKbx7ogc8wdqQMU83h3biYgjEYVtHf4n/+Y8baD0nAOS4/40UvjH0m63/RL
         I06x6Mapmgxl5UAJzKC9coqLs6v9o/B0xggy2qQ99NuRz2BPN6nDn7uzAMcuxTuCNKEw
         xBuIs7zMYzvUWLZHl+QnHgXlWe6IQvRzSc9fACqeBrZ4IUQlw3Iy+xSohWM+MK7FI/B/
         rcXpWCO3659rya7daBwPU5Iln8uTWYcFAOGW2D1ghkIs4IW0hUaut1GuObQhZO9HZ3/G
         Fyzy6Q1cUDWEXZq9XH6i5S4SpmKUFZtIYLrP7z8+OkFMNj+Uu+FDS1LvEjTutM9Qsx1C
         Af1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=KF90/0GARuMWHyMTMB3Xwv0e5GgnH85LGW7qmrj44J0=;
        fh=0e8J5T4Vw50WG5EOew2lo7eONs52dxiEsZF4r1A12x8=;
        b=f/AK+kU5cMXcrdwgAtSlbPzbQmT7J7Ghaane1h3I2rc8OtTkbxgBWT7/j4cnyndnAe
         dQbJ6NxU+hThHfvySZb5VtuY3nfa/oHuBnR0F+r/0PzEo1DrEDQydnOj8RADJ2UdP9CA
         tVzxna2AVPrGMaXxXMjWBnWYku06ndrtccRD9BBLz47GMzc+ZZ72IGx6FK3wr7mJdJwb
         12IEbNrBjx0//TCDfc1CAikOyPODDjLt/zYkto2RE3A7dGismfQCFxkzcT5isvV8keYh
         nBS2ofZlqu9K/kMzOnPfc1GrOREhJbdid0xcDs7wSVgD4UhLYqqVPJIF0gJdicCOCldc
         p2gw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793279030; x=1793883830; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KF90/0GARuMWHyMTMB3Xwv0e5GgnH85LGW7qmrj44J0=;
        b=C50p55VE6UDgdJKjElhLNYeFnq2Z4W8Od9eebfXsNR9VAhMbuaucrBe3v34nD049Xh
         yXm9F3TtGHSCUfiyL84unodeE/D/DA4pXmQUqEyGn/jbzwUXL1qz7UhjKg7x/77SkPix
         fsjUQTeybn8SfOvtOZp7Ze23YYniYqtLT1UwOhsEzcphyyhlfKEtsn4tdZBRLgc6VGnn
         khGCfASslvGnrRTfZsJpLUafVUjMR4da5X1aPxkPViKfkQjA5KDrJs0J0Eq/vsUuWr/y
         tjS3p/M+jkqfdwuGB0zuj39WLEgzFkDffjSEsV+2WjPvf4qzkU/p2d+HMbeijeMHkNP0
         cH/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793279030; x=1793883830;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KF90/0GARuMWHyMTMB3Xwv0e5GgnH85LGW7qmrj44J0=;
        b=I62Qd38P/7i0jX9a5VvLiYCQHD/WeQVygjSkX4NeTYXgnk0t9vYWej/pnbeV+cUJGC
         6aF6GV2CTA7HRlRWDYdX6aNIMDawAmw3820OVSCDDB4ScA9RzFOUiaqByjRALB6U2pHY
         2YcQshYNnpVLS/wLsvl9feRm2UJM5Qksoa+69ucUrZrUbEIwgC2I5B2JB3/RpTPCYwzj
         dEG6FH+GPA2W5W+BEOt6kT3ORPmDzzDPzmQJ8OAu5W4YUPPibdw++Hado9YuPG3TGm0e
         wSqLl1g+CaCog9bSEUYUYAEdcY0i8IX0yEB/pRyqSYMvqEhBKyUGZkmi+TJ0YsL2MCdB
         eFQA==
X-Forwarded-Encrypted: i=1; AKwUvBwyZGijdGxX6J0kIBtIhQPxQBPJjQ5pLYcQdLS68w/7+SCrmMJBS8xinWa4iYysl1OODCLKqS+KD/cKpKL8MC0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKfA2DSdF5/f/uCnXMp2a5HtQllnMw85230xDJIO3Zgr8bVs4Jg
	yKEqNIr8XHY/L1ux149Vf60uclOTVmvF5x6L13bdTbWcNG7ZpEJRp4lGSz6WsqnDc8OdPN5SqGW
	C5nMq+Mhm4qGi2XWVqj5IuyL+jr4HuWCIMSmJAbLO
X-Gm-Gg: AYBFou0m26E5Gfum9MkYzRBQL8yy3q1/dofrcr+OtSwDr1LiEjjviACmywWpfOaFXed
	idvwDx1WwQ/82yZLasR4gSObv6pXt+dQtk49Da0AtshvS8RSMbdzbEcrs/TxC1183OafYDOAgRs
	SiYEhgARh1K+3IyhlUfOIFQV0jZGzqrHMBwbKw5xvAW0tp4fNLVjz0o+z/jpJxXo3Abd0Pp9I/k
	tFoTJ75ruVQlH2z1N5JEJcCpaGy0a0zeyOXN7WLwiHt8dsBPG11GsNsO2yQrsYoKkDTfpB0cWxv
	otAtV9jqlV8jz1TgD3h73ToWQLj/neR7lnPdkGaatysLE4MeKXKpLJ4CaWIrsw7gnwP7OOHjPvI
	ap2L2YFQKFujYIUs9Cv94w4XCLksNpMD2er5Y5d1rFUTwwqpx49k=
X-Received: by 2002:a05:622a:528f:b0:537:b9f5:e05 with SMTP id
 d75a77b69052e-53fcc7cc0camr87903901cf.69.1793279029444; Thu, 29 Oct 2026
 06:03:49 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 29 Oct 2026 06:03:47 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20261027154649.91571-14-griffoul@gmail.com>
References: <20261022-gmem-alternative-providers-v2-0-5dd1dc6c660a@google.com>
 <20261027154649.91571-1-griffoul@gmail.com> <20261027154649.91571-14-griffoul@gmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Thu, 29 Oct 2026 06:03:47 -0700
X-Gm-Features: AclHuK_J4_B8WHMj3lc3Bqk_zMBRzyMWVypxyBk9aFiFYwwISWnD_-KRrJmOcto
Message-ID: <CAEvNRgFYecSKycFLkxwyK7gWZqKTXTPJVetSZm8YBbo0kg9tTA@mail.gmail.com>
Subject: Re: [RFC PATCH 13/14] samples/kvm: Back absent pages on demand in the
 sample provider
To: Fred Griffoul <griffoul@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, Jason Gunthorpe <jgg@ziepe.ca>, Kevin Tian <kevin.tian@intel.com>
Cc: Alex Williamson <alex@shazbot.org>, Alexander Graf <graf@amazon.de>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Alexey Kardashevskiy <aik@amd.com>, 
	Andrew Morton <akpm@linux-foundation.org>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, 
	Ashish Kalra <ashish.kalra@amd.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Baolu Lu <baolu.lu@linux.intel.com>, Bill Wendling <morbo@google.com>, 
	Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>, 
	Christian Brauner <brauner@kernel.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Connor Williamson <connordw@amazon.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Dave Jiang <dave.jiang@intel.com>, David Hildenbrand <david@kernel.org>, 
	David Rientjes <rientjes@google.com>, David Woodhouse <dwmw2@infradead.org>, 
	Erdem Aktas <erdemaktas@google.com>, Frank van der Linden <fvdl@google.com>, 
	Gregory Price <gourry@gourry.net>, "H . Peter Anvin" <hpa@zytor.com>, Hugh Dickins <hughd@google.com>, 
	Ingo Molnar <mingo@redhat.com>, Jacob Pan <jacob.pan@linux.microsoft.com>, 
	James Houghton <jthoughton@google.com>, Jan Kara <jack@suse.cz>, Jianxiong Gao <jxgao@google.com>, 
	Joerg Roedel <joro@8bytes.org>, Joey Gouly <joey.gouly@arm.com>, 
	John Starks <John.Starks@microsoft.com>, Jonathan Corbet <corbet@lwn.net>, 
	Justin Stitt <justinstitt@google.com>, Lorenzo Stoakes <ljs@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Michael Roth <michael.roth@amd.com>, Mike Rapoport <rppt@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Nicolin Chen <nicolinc@nvidia.com>, Oliver Upton <oupton@kernel.org>, 
	Pratyush Yadav <pratyush@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Robin Murphy <robin.murphy@arm.com>, Samiullah Khawaja <skhawaja@google.com>, 
	Shuah Khan <shuah@kernel.org>, Steffen Eiden <seiden@linux.ibm.com>, 
	Steven Price <steven.price@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Tarun Sahu <tarunsahu@google.com>, Thomas Gleixner <tglx@kernel.org>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Tycho Andersen <tycho@kernel.org>, 
	Vishal Annapurve <vannapurve@google.com>, Vlastimil Babka <vbabka@kernel.org>, Will Deacon <will@kernel.org>, 
	Xu Yilun <yilun.xu@linux.intel.com>, Yan Zhao <yan.y.zhao@intel.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, x86@kernel.org, 
	Shuah Khan <skhan@linuxfoundation.org>, Fuad Tabba <fuad.tabba@linux.dev>, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org, llvm@lists.linux.dev, iommu@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Fred Griffoul <griffoul@gmail.com> writes:

> From: Fred Griffoul <fgriffo@amazon.co.uk>
>
> The sample provider fails get_pfn() for an absent page and keeps its
> frames on a punch hole, so tests cannot exercise a provider that backs
> a hole when it is asked for a frame, one that backs more than the page
> asked for, or one that frees the frames that a punch hole gives back.
>
> Add MPS_NEW_FILE_FILL: get_pfn() then backs an absent page with the
> whole 2 MiB block around it, and put_pfn_range() makes the pages absent
> again.
>

Can what MPS_NEW_FILE_FILL is meant to illustrate be illustrated with
the ioctl that sets memory present?

> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Fred Griffoul <fgriffo@amazon.co.uk>
>
> [...snip...]
>
