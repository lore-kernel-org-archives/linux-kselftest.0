Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8041400962
	for <linux-kselftest@vger.kernel.org>; Wed, 12 Aug 2026 21:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786570497; cv=none; b=peLyMpsTR9HI0G+xrr432x3EprycFFV5qvVXu5DBuGejtV35eSRsTiP3Ew47ZkSxR1eUyCkAYF/4OKmvGG3epNK0GfYkx3uLnuV6AjTNWv9YxdsHFQONWMTJOEm3bMjz0K1Yasfd/XRO7DABXNEsXatAtNlyvLUej/ozzgM8oxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786570497; c=relaxed/simple;
	bh=X3O7nIG4wEV6N4TWtjouy4sS5Qwyj/jG9sAoPW345WA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=uMDCKGnkqYebfoquSOM3Z4wqdj9nD+mDk8gqbFO0Q5oJJ1oGlSqKkeyH/oo5Ml0/4btdRd4RpI1XHaiGY7/LvHGSB43FgcWjAZQt9IFMSzv5LWH1LCrtONRFT76EJsotptmEK4nw6I3pzWd9RXGHnQBUZSfQO5VbuU5dhrGqxIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ElxqveAH; arc=none smtp.client-ip=209.85.214.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ElxqveAH"
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cc640dfde3so19635115ad.1
        for <linux-kselftest@vger.kernel.org>; Wed, 12 Aug 2026 14:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786570495; x=1787175295; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gd+C2m5glZwGB8A6MFkRhDf1k0GKC1mWi3Ys+MVAnsc=;
        b=ElxqveAHerXwwd/yz01nOgBAGErcIWy6ElPd0UotdX7+nTuNpxqR9/cRftLeRSmAX6
         IukYRUx3MKylTF/zs0w0EGnLhdFj+XYoCVp0vB61tzi/nmYfnNZqO9/ZG6O+npgx2d4B
         3kbjMgccK5B+MHADAalHWpeRLpLtGpod26MWLUfZGqIbSWzp6uKRR/ZWIFamQnq8mB2G
         HAO7PvoUDymyhN6FXb+nBgn3KnwMDtYOvOm57Gz7tE623p0PkClyAgUjcNMyfSViDhVE
         1SCco1tNa+lSQzzkYakPB2H0pE6nAPAj3kkzWRxiCj5GUGiMAOKKYRlP0y/5SyVjBpA7
         54eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786570495; x=1787175295;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gd+C2m5glZwGB8A6MFkRhDf1k0GKC1mWi3Ys+MVAnsc=;
        b=bfPDDPDSzC16axiRLQoXS9gAnkomwko5C0y8atuHcA1uTnjrdd99PA6R3bxI0HiDSS
         4QF7zcsPoHYbsJDmR84b8R8fF2eamCPgad3rJ9Xu7oWjfpO3Ve1RiTp+8XzcJe8cC7Jr
         PRvB71qmyDbafSP2q8XCuOTj87vbrzjge4IIl5V8/U8yjDqlmWf7xnxAwPL1NqKlPaJ7
         cXuCL4VOKvLXvx1DQqGWryZUGC3fZ/Me3xpsBnutEc0mxdIZ7noaVb3ZQHRRu8u4D9Ne
         4PmpKHTnNA7QyGFb+16G4Rdwzjtb7YtDaYKfB8LriEMOe6Ogizo7v3oTmhPbgk8u4nT2
         okfQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro4kC4NbAMBqWbbhuQWNR56wyY3OFtc8E9zhlgFcsjzvwLC59dFmydeh0CCAs694erK9R+xKK2y+G4jpAzc4fc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQUFILXGRrhvXybPUmILRAdVKPIKwu/1CZkhUisdUs7o5vKH/m
	OqMoPVFgrxEjbLF4Qf7o90GshqIFB9i2jEf9ABaAa1XsJBFo1rNYaQwmrxvr6oo3QWMS9xn+rDm
	vcD4RLQ==
X-Received: from plblf13.prod.google.com ([2002:a17:902:fb4d:b0:2ca:eea9:9845])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:d990:b0:2cf:9344:b80c
 with SMTP id d9443c01a7336-2d37ebb2b42mr10699005ad.18.1786570494619; Wed, 12
 Aug 2026 14:34:54 -0700 (PDT)
Date: Wed, 12 Aug 2026 14:34:53 -0700
In-Reply-To: <69c86172-9175-46cc-895e-9ecd449332cd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260807-gmem-inplace-conversion-v10-0-2fc18ee6d3ba@google.com>
 <20260807-gmem-inplace-conversion-v10-7-2fc18ee6d3ba@google.com>
 <ed483d25-d908-4248-b8c7-862dd35dc6d4@kernel.org> <annnrGR1noVuBkCc@google.com>
 <69c86172-9175-46cc-895e-9ecd449332cd@kernel.org>
Message-ID: <anzm_YLft-J7pxiy@google.com>
Subject: Re: [PATCH v10 07/41] KVM: guest_memfd: Stub in ability to enable
 in-place shared<=>private conversion
From: Sean Christopherson <seanjc@google.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: ackerleytng@google.com, aik@amd.com, andrew.jones@linux.dev, 
	binbin.wu@linux.intel.com, brauner@kernel.org, chao.p.peng@linux.intel.com, 
	jmattson@google.com, jthoughton@google.com, michael.roth@amd.com, 
	oupton@kernel.org, pankaj.gupta@amd.com, qperret@google.com, 
	rick.p.edgecombe@intel.com, rientjes@google.com, shivankg@amd.com, 
	steven.price@arm.com, tabba@google.com, willy@infradead.org, 
	wyihan@google.com, yan.y.zhao@intel.com, forkloop@google.com, 
	pratyush@kernel.org, suzuki.poulose@arm.com, aneesh.kumar@kernel.org, 
	liam@infradead.org, Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
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
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, tarunsahu@google.com, 
	Vlastimil Babka <vbabka@kernel.org>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev, Xiaoyao Li <xiaoyao.li@intel.com>
Content-Type: text/plain; charset="us-ascii"

On Wed, Aug 12, 2026, David Hildenbrand (Arm) wrote:
> On 8/10/26 17:01, Sean Christopherson wrote:
> > On Mon, Aug 10, 2026, David Hildenbrand (Arm) wrote:
> >> On 8/7/26 23:52, Ackerley Tng via B4 Relay wrote:
> >>> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> >>> index 65fbce46b63f4..9477ecebbbced 100644
> >>> --- a/include/linux/kvm_host.h
> >>> +++ b/include/linux/kvm_host.h
> >>> @@ -2580,6 +2580,8 @@ static inline bool kvm_vm_mem_is_private(struct kvm *kvm, gfn_t gfn)
> >>>  #endif  /* CONFIG_KVM_VM_MEMORY_ATTRIBUTES */
> >>>  
> >>>  #ifdef kvm_arch_has_private_mem
> >>> +extern bool gmem_in_place_conversion;
> >>
> >> Is there a "supports/has/enable" in there? And should we call it "kvm_gmem" for
> >> completeness?
> > 
> > It's kinda stupid and definitely more than a bit inconsistent, but overall I think
> > I actually like "gmem_in_place_conversion" the best.
> > 
> > gmem_has_in_place_conversion and gmem_supports_in_place_conversion are misleading
> > because it's not just that guest_memfd has/supports in-place conversion, it's that
> > that KVM is tracking PRIVATE in guest_memfd and so in-place conversion is the only
> > option.
> > 
> > On the other hand, while gmem_in_place_conversion_enabled is better, it's not
> > quite accurate either because userspace isn't strictly required to do in-place
> > conversion.
> > 
> > As for a kvm_ prefix, IMO gmem_ is sufficient for a namespace, and not having kvm_
> > is consistent with most module params in KVM.
> 
> Maybe we should have a helper function instead of accessing the module parameter
> directly, then the gmem_in_place_conversion could just stay file-local and
> kvm_gmem_in_place_conversion() would be used by other code that wants to obtain
> the value.
> 
> Instead of the
> 
> #define mem_in_place_conversion false
> 
> We'd have
> 
> #define kvm_gmem_in_place_conversion()	false
> 
> just a thought ...

FWIW, I'd rather prefix kvm_ than add a wrapper to get a boolean.
