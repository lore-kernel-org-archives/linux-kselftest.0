Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 116593A6F11
	for <linux-kselftest@vger.kernel.org>; Thu, 30 Jul 2026 22:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785450396; cv=pass; b=XjWVrHnlUHiwhnmIL4ZddQvQYbw7U/3krLxDQMTkFlEGl4GWUzGnhbUh8wdqDAV61a3GWN9j1HHOpNZnerlckk4syZbLyHyGFhSQ4pwnKQllpJU7k8tOpL0ZJo17W/YqsIw2nXLZd65QdhfZZevdM+kjugXTtWcZheRKS7QgsZk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785450396; c=relaxed/simple;
	bh=pGAe7A065N0DCyNKa4jnFCoxW2vRFq0rZ9EKmD0iYuI=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LfW1zGGxtc2N62nblGudHw3QIv6j44Vf62oyhH4a4+PdCIIlx1PvKa8/UaNsfMo+OuKX/QbYLOATf0wVd6imjTQSfshm6n0n2M/S1FvjYBRp4hzEPnTbLTy5otD0YdKhdbMg38TfW49+LnBYD5TKq6Ddjzng7y/XrkbwloHeqxY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gygENs6j; arc=pass smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gygENs6j"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2ce7d2adef4so4017945ad.3
        for <linux-kselftest@vger.kernel.org>; Thu, 30 Jul 2026 15:26:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785450394; cv=none;
        d=google.com; s=arc-20260327;
        b=BXgnm11ahHnzXydNcifL/TBqzIkFInmNIJ19h3MIUDALP7/PI5t3tlHcc+CWTtboDd
         40LWCGbu2+8XJJrf4yWtw9dSR3edPlYLeZpgFMlodG2Q2LkoI2yGe2You7MjqwJUa6+k
         cuLnNRJ7tqLrwo8JSBwpSKf1M4h29Kk2BSTzpZuJ76SSc4BpsAHXp0U0/3zPO9NtJAQE
         ATUK8llOCEzqLBRkIBRk2z+KboJ4Y37ztbPuqaNmxgzka7eEYUubI9OWIT0oAPVQGXCK
         RHF8Hcg5/KJPB9Kim1Hw6tBhHLUlhHlZYb5JaP/Wk9LapoIiVcbpzJReuvOoiBilnGpW
         KtFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=ArtSog1FoVnhFcfpT6OFcOCesxyMDJkDrg6P703rT7g=;
        fh=NXX++j+U/hraD3fh7085LKGtAgU8JftJrO0dlpFC6vo=;
        b=OTSzNhXvlSv7HgZluH4hUWHK2F0jDS/obY1iAwGdbD70EqVTYZ3pmv/V8TPIQepGde
         6kn4EMu3JLvJ1xSDEMKwkDUPowO+YqA9TkTp0A74T1nq915WKv+YRJMaOeip9+TxEbpl
         FtKdRu2uLo3H9n1v+shAKAJnAq+ivghWLQ8vthPvPYHP0zShyCFP3hLuWmEUZWmvsdhO
         m9qyR+QxecS2uZXoq9rl5N65klDKNO2H5vM+hJ3GHrSgRDTlUhkT1ZWTP6ilqSZfSnBH
         BKJslUzKd8VTWI63mpqnYJdjbQAm7WAVU1zI7NZOKyG6A2qZrAXr68Mrb0/5f+6VRdTl
         hM8w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785450394; x=1786055194; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ArtSog1FoVnhFcfpT6OFcOCesxyMDJkDrg6P703rT7g=;
        b=gygENs6jW8fvr57Qa7vKd8a1GxV0xl2dDJYAAXekl72u9ALfdbLxrr7JcH+bCTaEN6
         PWokQpsUZ9OpRVh2aMDZcqEuWLnbvxiG5hiT91GG80+pGZng+PfGfaxYkZsFaCMMi7bt
         TEsdyMhblzd+1OIQZJgVACLsG6OQJEkk41uWqcf8VJ/+XyHleUlXq8q5r1X+xOzSr3L8
         Q+d/1BDmdhwsYE9WfAQ/hHY6BIwJQ+DX+k8jiqfG9MQyVsgfb5FXXCj777OQ3uH0IykE
         1X9m60Wc3MHAFIUnrabeGLaCzKnPtvkAlknFYSz1N2LBUJciLc1pSkzwCh2ddq/qEQeA
         aRcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785450394; x=1786055194;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ArtSog1FoVnhFcfpT6OFcOCesxyMDJkDrg6P703rT7g=;
        b=gNBuz/ICXS/sLaThKllVocs5wPaexdB0RUflX8jhYNuiGvk3ZZzuZ2qUyxtXH61dAZ
         5dvQuTVQZsyDXPSmrKNT8icubqRA+a5+NLPyvLnaAT3Q2kURUewgj/MhHX7NOtp9cYWe
         YRR2rRdb4gjJNS+qhRotSvbTFBPKyK0KKNLA+sb1lPboPNv7wheKfaXZBp2rEEQpMhdK
         gNGL7pKAve1gtRxVq59VDWVl+pEILN9L03tgE6HJJqGIuTXtRzHk3jP87LiwmRDQiyPy
         9fsOX+WaFAPHKDmqs9N9tlnRQhvpJRzDriPVvn7zdOs6ZotJWQC6QgXFMsB6ij5OxSQa
         swXg==
X-Forwarded-Encrypted: i=1; AHgh+RoLaHAMh+vr1OtyHccViENMFk3KPh7DmO3QAAg6TIoRSch0CPXqXr5xtTNYgHwIBFSPS6PKiOYY0jGUBwd9rgc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9pVGAhrQSUUNAp19tMhRPI5/b9iQDucSHcpVGIlCo29z1CtHL
	T+4fQgpBbveeb+Amb8QDH53D5gyC0V+iOrgMVTqu90eh6e6hewcOS6k6huLHy3DxrcduGI2XGpD
	LcRVWNL25IcUWPJ0UHjnMoc+MBKyWmRpPkas52GTv
X-Gm-Gg: AR+sD13YhFySwZ8a1hngi76JCi5mLNr2UY6PFPX7LCfEe5LR+uDe6pUEkIXsceyFoJ3
	wS1aCn4G9D03/HLwP6XLLI1Yjg5hX+Wf4X2HTqYTnDKVQzNPb3UeiXcR2jt7eCyJFUUfiq8i3g5
	YpfpxcnOdqVfuAmPvGG/TjqpjXGPMSbb84r/bQhWYI42yFbpj1NvhLRdcJosJSZY1JBTfaEmT9B
	lIHKhGRiPTEvcgQr5dBN0jC/ZkpZeKpBTA+XPebFs+ZQlyqGcrqVMwQC4LADvkQXtmD1cujf6y/
	WrwKT0qu9L6Fhsu67GrUsk4uOl7EfrcCzzQOdNqxHHjmrhEZ5VkTqt6CBZHR8emKvwarV2zHNjh
	QCBvIf3wJi8Ez5lw6ha8T+TR/XC+APZgvUPD3u2qFgJAE2Q==
X-Received: by 2002:a05:6a21:3390:b0:3c3:7bb9:c93 with SMTP id
 adf61e73a8af0-3c9006b6c93mr3958275637.53.1785450393499; Thu, 30 Jul 2026
 15:26:33 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 30 Jul 2026 15:26:32 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 30 Jul 2026 15:26:32 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260728-gmem-inplace-conversion-v9-10-35f9aec2aed2@google.com>
References: <20260728-gmem-inplace-conversion-v9-0-35f9aec2aed2@google.com> <20260728-gmem-inplace-conversion-v9-10-35f9aec2aed2@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 30 Jul 2026 15:26:32 -0700
X-Gm-Features: AUfX_mzO4np18y-var3XtfpQ4yIIWVbEpBnhPk-BB6NlVysHL79jcDWiNU37Sj8
Message-ID: <CAEvNRgF3HQfivC2CRp_61Fa-YsSGPpdHa1A77t88japfW015XA@mail.gmail.com>
Subject: Re: [PATCH v9 10/41] KVM: guest_memfd: Add base support for KVM_SET_MEMORY_ATTRIBUTES2
To: Ackerley Tng via B4 Relay <devnull+ackerleytng.google.com@kernel.org>, aik@amd.com, 
	andrew.jones@linux.dev, binbin.wu@linux.intel.com, brauner@kernel.org, 
	chao.p.peng@linux.intel.com, david@kernel.org, jmattson@google.com, 
	jthoughton@google.com, michael.roth@amd.com, oupton@kernel.org, 
	pankaj.gupta@amd.com, qperret@google.com, rick.p.edgecombe@intel.com, 
	rientjes@google.com, shivankg@amd.com, steven.price@arm.com, tabba@google.com, 
	willy@infradead.org, wyihan@google.com, yan.y.zhao@intel.com, 
	forkloop@google.com, pratyush@kernel.org, suzuki.poulose@arm.com, 
	aneesh.kumar@kernel.org, liam@infradead.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Shuah Khan <shuah@kernel.org>, Vishal Annapurve <vannapurve@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Baoquan He <baoquan.he@linux.dev>, Jason Gunthorpe <jgg@ziepe.ca>, 
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, 
	Vlastimil Babka <vbabka@kernel.org>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Ackerley Tng via B4 Relay <devnull+ackerleytng.google.com@kernel.org>
writes:

> From: Ackerley Tng <ackerleytng@google.com>
>
> Add a new ioctl (and matching struct), KVM_SET_MEMORY_ATTRIBUTES2, using
> the same base ioctl number (0xd2), but with R/W semantics for the kernel
> instead of just read semantics.  "Officially" documenting that KVM writes
> to the payload will allow KVM to support partial/incremental conversions,
> instead of all-or-nothing updates (which requires complex unwinding), by
> recording the failing offset if an error occurs.
>
> Opportunistically add a new struct as well, even though KVM could squeeze
> the error offset into "struct kvm_memory_attributes", as there's no cost to
> doing so in practice.  Pad the struct with a pile of extra space to try and
> avoid ending up with "struct kvm_memory_attributes3" in the future.  Use
> the same layout for the fields that common to version 1 of the struct,
> e.g. to ease upgrading userspace, and to provide flexibility if KVM ever
> adds support for KVM_SET_MEMORY_ATTRIBUTES2 at VM scope.
>
> Introduce KVM_CAP_GUEST_MEMFD_MEMORY_ATTRIBUTES to advertise the
> availability of the KVM_SET_MEMORY_ATTRIBUTES2 ioctl.
>
> Update the KVM API documentation to define the new ioctl and its behavior,
> and add the necessary UAPI definitions and capability checks.
>
> The process of setting memory attributes has a clear point of no return
> because, for CoCo VMs, zapping stage 2 page tables is a destructive
> operation. Unlike regular VMs, where re-faulting pages into the stage 2
> page tables merely incurs a performance penalty, CoCo guests must
> (re-):accept pages after every fault. To preserve CoCo security guarantees,
> guests will not accept pages they did not explicitly request faults
> for. Consequently, during memory conversions, any operation that could
> cause the process to abort must be completed before the stage 2 page tables
> are zapped.
>
> Zap only the ranges that are not already in the requested state to avoid
> inadvertently destroying (CoCo) data. ARM CCA guests will try to mark the
> entire DRAM as private at boot. If there are no shared pages at all, the
> to-private conversion can be skipped, but the existence of a single shared
> page would require the conversion process to proceed, and if it proceeds,
> zapping both shared and private pages would destroy data and break the
> guest.
>
> Co-developed-by: Vishal Annapurve <vannapurve@google.com>
> Signed-off-by: Vishal Annapurve <vannapurve@google.com>
> Co-developed-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> Reviewed-by: Fuad Tabba <tabba@google.com>
> Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
> Suggested-by: Michael Roth <michael.roth@amd.com>
> Tested-by: Shivank Garg <shivankg@amd.com>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
>
>
> [...snip...]
>
> +	filter = to_private ? KVM_FILTER_SHARED : KVM_FILTER_PRIVATE;

I left out a

Suggested-by: Suzuki K Poulose <suzuki.poulose@arm.com>

for the suggestion. Sorry! Will add it.

And thank you Fuad for letting me know!

> +	kvm_gmem_invalidate_start(inode, start, end, filter);
> +	mas_store_prealloc(&mas, xa_mk_value(attrs));
> +	kvm_gmem_invalidate_end(inode, start, end);
> +out:
> +	filemap_invalidate_unlock(mapping);
> +	return r;
> +}
> +
>
> [...snip...]
>
