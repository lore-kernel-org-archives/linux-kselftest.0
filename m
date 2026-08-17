Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36EF92BE7A7
	for <linux-kselftest@vger.kernel.org>; Mon, 17 Aug 2026 13:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786974776; cv=pass; b=IInt5HnKneyB60GopKtosan9vyPQXJ0XQIL5GBettOfli73NGficwSvZJOmtxZV0gpj1aLMAOvuIxjsEnj7ePDPQI43Q39//GlIy4DRE/fhK8kzr+UQJW6odu64RI+Uxa1Z3fnApCamhbFA9+42+/9K1NltHQglsAHWZ+h7bY+0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786974776; c=relaxed/simple;
	bh=/NIweOu34CW2pFg29jrI6uvH5WNUNRSHaH/sZYONA68=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e6Q07AJNJNYLvIpnvMBWAyaU95gyQz635J0Jt7fwgotMaTXuUt86bVjNbHSgbF7g6avyPB/6GP94Dm+1Oy1iOZxg/saUq9GGYDuKRY8/DkUcGtBaNCxIqJcFqb2kQoY+KqQp1RJsLXeFZUCM/CEmp7eNH3swY+6i5rFCoxE0gMo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sLZSiei/; arc=pass smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sLZSiei/"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-38d489b6b71so3490505a91.0
        for <linux-kselftest@vger.kernel.org>; Mon, 17 Aug 2026 06:52:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786974769; cv=none;
        d=google.com; s=arc-20260327;
        b=T2nKudf41UZD3nEvyK00Hiy1PX01YTVrRoNxyQgFgZ89K+6aoSshTUOk1eFr7514rU
         p/MF1WSIQasWYhwxBZhixIv+zaWUVanhPFQ/k1JhoWZZ01e1CnD+ag03TTQ1WVyPi2Ep
         Q8VvC2CU1r6eouXMSCUUNBUUcEQ0IHhJRet/1/NhH/g/v++go23+CTABsu/HTknFoP3T
         GrVpp8h5DTf8BVzOTCymwugyytvVS3lhrlA53oEHuWdkMwknJwCd7KnEpG6P7Cgm6eB/
         0GcFs3sO9OimDOvYmycKrEha19MvaIc006Cs+Js9zNEaIiRin2qkPNqV2pRXWfTrlZMv
         8STg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=IX1KvI43fNPQ1XsnxDVHr/UZAXUksiAOakXpX5TJKNw=;
        fh=2tPbLrgPwJriuaJq3ZniELt6Dk1l5/ZJiC9RKKDjs5o=;
        b=cfgw4nP1zdSrzlLnxT8dGLHavOLnwhOZp0xMFdwB5HLiZORXJSlq29YcUT+4cgj6J8
         Wgdj6Shb3MMI4j8ih2LnPWKNcjAlG9A7Yq4jUfF/j2XzYkxYogkzFl+bZWzs432uNe7a
         lTP8XFGH/N8Fm93BJn7azginirkgjb5/Rr0suaDJUplPcGbZQ4d/+mI8/b4F/w9H019F
         Iv+SBlGb6wL7lFHB4Tf6yENAAsP0yVCZPIeJ2/3tpR1yTKmtR26SkmCo5Rx43ibl6TB3
         8e7HY2b+BNI8bBntmmkIH2mflTr4+lmaQVIlwIH2slQkAoN1/LkFEd+lavs0m101VShb
         uPpA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786974769; x=1787579569; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IX1KvI43fNPQ1XsnxDVHr/UZAXUksiAOakXpX5TJKNw=;
        b=sLZSiei/bJW+t/XpI9PA4AEglb9dDudmjPJCeHSZKuu9Pl8w6khVwpc5u7tIGik3Nc
         i8yDjdneyHWnqIe2ck5NRkkBS+4oqvL60S+WnHvJjrL4RIPAlKjQYQ20b/sJxdFmBKL7
         JY9WPe2jLPqUQ7/aq7WZKPQP82D5eh2qechllK+aIePPStGulPHt/hIxl3mfOay7p5Si
         vPBawvz5C1U2o29hY5d24ylaI9/7Q5xA7CZ+t+RinaAjjHATDm957qPMcyMyus880imb
         ZbOrY/G/mhGv/1BsF/E/zXKo+Gte7rrD2j8v7KtsxMwOD+1/DDamnDgvvVQS0KW3jbDK
         jbjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786974769; x=1787579569;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IX1KvI43fNPQ1XsnxDVHr/UZAXUksiAOakXpX5TJKNw=;
        b=NI+eRnYFtANuRZLra7UQPr+FcBEiQfXUd9eZVGNsv7jDv3SDdRvWIgk0p9kPx78R5I
         +n0Mam11xFTvs82WBAsjvZ/LRS2zZ+ItiltrYMFjXC3pimQJmvDvxEdb8axPVJMcYMnp
         /N0PHDf+Tt1fzQ7/VCOSCXG3Zael+gHBgaid9i4FV7tt+1H1b3xsOsHJXYrv7uyU4wBn
         IuE9zl275AMkPRghh6nOgGzT6ElSP8MKsFNH5tbHFJokYVD9/TZt6nlnCUMg3UxSYT0b
         0V5ky8N+TOuMCaETeRigCrMZ6xSQN8hULVG2vkwx5OiM/yaXEF1kLvzApz6QURy13RiU
         3PFg==
X-Forwarded-Encrypted: i=1; AHgh+Rr8KIJtEqzfnr5xkSH0J2HNJ0njB/M39XS8kR8+v/IjaBw7hI3AUxSbqekXFw6nXWexQqRru00wr1pl+28lnkA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/glar7zhPgKZTOgmDY21vicfsVJ9bbIUmcAppKBNmK1rNVFFb
	qfjfxYFYS+eVQOkOOytjO5lrEaIAW6A0aNKPRS9QDVpwmNe09No2slZmOj0LmX+48kLwBsdY7oW
	rXagYOfkoRMgCoAeWQqjG693WnLc/2KtGluFrvVAy
X-Gm-Gg: AR+sD13eVv0cJaUvA1ulbI1hQ7O85a+Egxqa7qtoNejlyfP1M9DS5dqP1eCojLVjZFX
	45VoNyeWTewkzoxecnVXm46zlqqXY7N1Z0LYn+Je8XnNpT0uGv3KBvZMSpRnTqmyIBZDCLxTwms
	ELUWq4y28Sin4OXFJ4YCMYDX83Rjyn0b8TSK5GRjo+fF+IXRaQ49V95su3QfLOaKBQB1bXVqZ5x
	9HSqOk9YeFtx3B9N2R23G5jmx5ATahq7A0hBcukJraJrrLAMMLEzZkkOrBdeoFk90rguxfeLZEH
	v7tYPo9Rr83TNw94irHW20uPNxyjFuLi/IjLEu+5REOBB0h7W+zNqtWVNjXG8Q0vGWPCNcYgSk8
	=
X-Received: by 2002:a17:90b:274e:b0:38d:dfd1:7c1 with SMTP id
 98e67ed59e1d1-3955a3dd549mr974362a91.2.1786974768174; Mon, 17 Aug 2026
 06:52:48 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 17 Aug 2026 06:52:47 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 17 Aug 2026 06:52:47 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <befe73e1-3287-440e-90de-6c62f6c19d47@intel.com>
References: <20260722-tdx-selftests-v14-0-15ad654a50db@google.com>
 <20260722-tdx-selftests-v14-18-15ad654a50db@google.com> <befe73e1-3287-440e-90de-6c62f6c19d47@intel.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 17 Aug 2026 06:52:47 -0700
X-Gm-Features: AcwNN1UHGhzK4sYy5HwqSRuK05tzBOG6iD052SVLEabdQ5BbvTOapBvBVGicZOU
Message-ID: <CAEvNRgH00s3NWUH8EGUZq3WWweboBcUaTZs_0Cye5D=3o0OALQ@mail.gmail.com>
Subject: Re: [PATCH v14 18/22] KVM: selftests: Add helpers to init TDX memory
 and finalize VM
To: Xiaoyao Li <xiaoyao.li@intel.com>, Lisa Wang <wyihan@google.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Binbin Wu <binbin.wu@linux.intel.com>, 
	Chao Gao <chao.gao@intel.com>, Chenyi Qiang <chenyi.qiang@intel.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Erdem Aktas <erdemaktas@google.com>, 
	Ira Weiny <ira.weiny@intel.com>, Isaku Yamahata <isaku.yamahata@intel.com>, 
	Kiryl Shutsemau <kas@kernel.org>, linux-kselftest@vger.kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, "Pratik R. Sampat" <pratikrajesh.sampat@amd.com>, 
	Reinette Chatre <reinette.chatre@intel.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Roger Wang <runanwang@google.com>, Ryan Afranji <afranji@google.com>, 
	Sagi Shahar <sagis@google.com>, Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>, 
	Oliver Upton <oupton@kernel.org>
Cc: Jeremiah McReynolds <jmcrey@google.com>, kvm@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

Xiaoyao Li <xiaoyao.li@intel.com> writes:

>
> [...snip...]
>
>> +static void tdx_load_private_memory(struct kvm_vm *vm)
>> +{
>> +	struct userspace_mem_region *region;
>> +	int ctr;
>> +
>> +	hash_for_each(vm->regions.slot_hash, ctr, region, slot_node) {
>> +		const struct sparsebit *protected_pages = region->protected_phy_pages;
>> +		const gpa_t gpa_base = region->region.guest_phys_addr;
>> +		const u64 hva_base = region->region.userspace_addr;
>> +		const sparsebit_idx_t lowest_page_in_region = gpa_base >> vm->page_shift;
>> +		void *source_pages = NULL;
>> +		sparsebit_idx_t i, j;
>> +
>> +		if (!sparsebit_any_set(protected_pages))
>
> sparebit_any_set() doens't check if the input is NULL. So we need to
> check it here.
>
>> +			continue;
>> +
>> +		TEST_ASSERT(region->region.guest_memfd != -1,
>> +			    "TD private memory must be backed by guest_memfd");
>> +
>> +		sparsebit_for_each_set_range(protected_pages, i, j) {
>> +			const u64 size_to_load = (j - i + 1) * vm->page_size;
>> +			const u64 offset =
>> +				(i - lowest_page_in_region) * vm->page_size;
>> +			const u64 hva = hva_base + offset;
>> +			const u64 gpa = gpa_base + offset;
>> +
>> +			if (!kvm_has_gmem_attributes)
>> +				source_pages = (void *)hva;
>> +
>
>> +			vm_mem_set_private(vm, gpa, size_to_load);
>
> So vm_mem_set_private() has to be called at this late stage when run
> with in-place gmem. But for non in-place gmem, we can actually call
> vm_mem_set_private() in __vm_phy_pages_alloc().
>
> Calling vm_mem_set_private() here instead of in __vm_phy_pages_alloc()
> looks like a trick to me.

I thought this is fine because __vm_phy_pages_alloc() seems to be a
rather low-level function, where the responsibility of the function is
just to allocate (for find some physical pages). Calling
vm_mem_set_private() in there seems to be doing too much.

> That is, we cannot set the page as private
> when allocating a guest physical page as protected because if doing so,
> we cannot write the initial content to it.
>

I think calling it here isn't a trick, it's a good way to reuse all the
existing code that builds up the guest image in place. In-place
conversion allows you to set stuff up in shared memory and then convert
everything when you're done and also populate the memory.

> This is the topic about how to implement the infras for in-place gmem,
> not the issue of this series. Let me go read the selftest patches of
> gmem in-place series and we can discuss there.
>
>> +			tdx_init_mem_region(vm, source_pages, gpa, size_to_load);
>> +		}
>> +	}
>> +}
>> +
>> +void tdx_vm_finalize(struct kvm_vm *vm)
>> +{
>> +	tdx_load_private_memory(vm);
>> +	tdx_vm_ioctl(vm, KVM_TDX_FINALIZE_VM, 0, NULL);
>> +}
>>
