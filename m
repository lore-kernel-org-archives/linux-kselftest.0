Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77105395D87
	for <linux-kselftest@vger.kernel.org>; Wed, 20 May 2026 21:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779313458; cv=pass; b=WbqZEZtASkNFuCaJQRHvNQ8d4ji4hQdpt73NE1xDF7kLLTORLQfiHOAi+R+ojcDluiimOjeYZSlJ4z5UYshhUuLRzccDzIq5LdejAoF5ZqgzVraRwQpq+S+OkEHsIUfSpn/NCnq0P32RdME7Ni4gQUUWDvqSb+zB/+gjGnimPms=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779313458; c=relaxed/simple;
	bh=5vwh4tcfC1LD9NZjL0ZwGpI66Tl15UeToPVcfgSGyVE=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M4gSJ65/MzO/I3Vcg7mjStZL3lzp+y++UEzcGQr98DhJQDbbtFxcajmqI68KhHIeAZ/0Q27ELUt6CRWnYR0EsJozY3nnxUBTq+2+pDNoVk1pPIlESkJCNPFSGhatgOJWVsbfs6dfRJIQ2mQdV9bjIKT2wjg4tQ+4DVhmw3e6ytE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GWNCullx; arc=pass smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GWNCullx"
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-95697b46831so3712294241.0
        for <linux-kselftest@vger.kernel.org>; Wed, 20 May 2026 14:44:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779313455; cv=none;
        d=google.com; s=arc-20240605;
        b=Cqwr132RJ6X1pm4kDbv/9p9WOQOSlpAAoJsmtxU6rUj1Aru//XK81qSgo5TGLuxQb6
         6whoB2dg+gRAKJYM1ZYixoImM2l716SdrGk1RZPQilrS3k2JOQ/k7UAAIqn/UGwTX6eF
         Ygc/7F3YoBv6kevNNojWuymiKxzPEZ/ZRNeqUE0kB0QCmBswULsMJwAM0i3lFXu6eKEa
         TtnN4pSIdTvQmAGobP4Qy944yhJxV3KVQYkKYK4n2QzyFvUKXRmFEL8st9L76E/qlzCc
         rMtz9UVFBzCKMmrltkbxya2wcets94nOjTxX9AKArt4kIezWLUuLJKiSBW1XNNr6QG0U
         lkOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=lzeZHICde6LC2KLtrV1UyrIn4vikEEbCZhRCg7feJeA=;
        fh=sAG6Ac4TC/nf68rvGWHqwloQmrCX8puBipCtzQ5IgBk=;
        b=EeS2gyatq3w2/aRXk8ihvOk9JSMkRwEcwwfPTbZ6BiaTaFse94R1ybzpTnVQE0QkMa
         HG/iRvPhVHjaawVQmeUPVekgwcgiomoh4+MzjTwjGenAKMVrIm3S5PDBru8D6kYaKWyz
         /6WaVEAd2iyHqt3SBwkcclv4QYqxoEl4XiBf89QhjbG8JH62tY3vMiRalTk23iiihZa9
         XGThz14iyI+sx5q9KnHQqdHzc7D2c2BN6uzw/kDUc+xGkziQHJeqcij/afpHt6g+bp21
         9xcYCN+k7QY9iWYry0kxQLMwqvjhY/DueWCmv5OQeSlgPM8mgofDwxGkxISkP+HmnQ7G
         mXiQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779313455; x=1779918255; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=lzeZHICde6LC2KLtrV1UyrIn4vikEEbCZhRCg7feJeA=;
        b=GWNCullxl14OThGxaECTGNu4Prk5RLXlaewVXVO8Lwo4OoRJJMh/kMHsR1B+ImWmPd
         8USuNG++Pin23M63MhzIl3YJXJlwT/F8RCtm1kwzNv+T8uiAyY03Roq0i3Mm4gRhkhCj
         hwLdwOiDGuauoZUICd59XiEtHa3Bzscx9i18zt/hAe+Ho8bhGf0S447H7zpBfkXg2qq3
         i9fxbfvX96aXdhb77ytxuwtTrb/rAscET+GsPuMeeNctAHKGThTNAx/QjUqcm8Q3Hi9b
         2LD7LSPQkxioEfyN7OjdLZI5QLyKEzz6m5axzkd27nv917IhdsJNuL9AGsTAVd8pevw0
         DVhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779313455; x=1779918255;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lzeZHICde6LC2KLtrV1UyrIn4vikEEbCZhRCg7feJeA=;
        b=alqXJVSciVTdfA7umroaZQaOHht2fXDEd2eJXYVRF6BT8R7iG1UYtUoyh5xEmZbUAI
         oyrI9u+OBnALabnMErlUEUoBY2YwmgWDo19feg+PmLbzdnu4JphHMGrle3+wdtbSCjPQ
         unqXfaOaKnuKNv2yurOO/LjOcFmMtiaWRib3sYJK9E2PG0RDtL3RjmSvIELaUCgGL1Wc
         tlAerzBwg11yhSPKIfd2BPyi8rgfQYYiQda5IPur1n2PhqDoYo+SRjepeiat9GhJXhlg
         +8xAFQ0ISPoBV8CcGg9pY5IC5gXF0evYwH1xFYGu17z9SpRy/C6RbZzC2TgFJoVm/Mye
         q0AA==
X-Forwarded-Encrypted: i=1; AFNElJ8CmQIO3RtHGy+4VKn/t9Y9rY/8Jb/0nxGFFNHGGlJSNGdJnpbJssHWNomD9HwtqoyjmHU2KRqpYkh/76qasWc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyC669geWOswgzgHseKkDPr+M08jdSO9nvfchPZRInNh6YEVR9q
	x0tNUo9i8OgAFfug7/lZNxYG56cwCgckLTGUoBT6aJOmJAwH1tq4rF2okM7G8zg3VohrmSZQA69
	N9U4r9oc86k37l8agthYhQJhRPhxN4r50f8T8GwiP
X-Gm-Gg: Acq92OFT3KEKBu93rJQATWMReR8u71EwUQr+5PUYt6HqbXC1fhbsZ2XmF0QEoLEcVAz
	XcNHGJZUf78yrXzXFrf1BcyAI9Tpn8BedZ3LygvUUfwj52BXFWbMNt+ubXS3LqSfmfvunP5yYPT
	eRRtpi+1L+V9XdF09SeL7kwMj0jKyyW+Y3gr31GTZSXL1nPjoitpqxSwUEx2B3nLW3vw57pD7Lr
	thDO18lNZJaris2hmsZN9jJVx7qQO7KVgWzD+SPNKciG6gM/x3xKK5u3pzhxpk7eKBE0LHcD+fB
	IW1/azhNooXbayw03rcBmuEJlVvVT7UKj7iqLQI3EK43u6eMp7AmXbtDC7/FKTAEHYxLF4a5nl8
	ngI9B
X-Received: by 2002:a05:6102:32ca:b0:631:8665:3510 with SMTP id
 ada2fe7eead31-6739e54982dmr235113137.31.1779313454629; Wed, 20 May 2026
 14:44:14 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 20 May 2026 14:44:13 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 20 May 2026 14:44:13 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <CA+EHjTw-cUM=FrJevtSDtR7K6MwUfGfOx21LMFDn7DAy5bFzYw@mail.gmail.com>
References: <20260507-gmem-inplace-conversion-v6-0-91ab5a8b19a4@google.com>
 <20260507-gmem-inplace-conversion-v6-5-91ab5a8b19a4@google.com> <CA+EHjTw-cUM=FrJevtSDtR7K6MwUfGfOx21LMFDn7DAy5bFzYw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 20 May 2026 14:44:13 -0700
X-Gm-Features: AVHnY4KMeQgcJsvqoO4sP8lu-TRiPVeIaM4bWX0cqtV0EsssjCZBV_2_Gq2a7HM
Message-ID: <CAEvNRgGQvMdDmVfbk42EY_PGN0ybTp-x21Zj+pg_X1mk9iCRtA@mail.gmail.com>
Subject: Re: [PATCH v6 05/43] KVM: guest_memfd: Wire up kvm_get_memory_attributes()
 to per-gmem attributes
To: Fuad Tabba <tabba@google.com>
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	ira.weiny@intel.com, jmattson@google.com, jthoughton@google.com, 
	michael.roth@amd.com, oupton@kernel.org, pankaj.gupta@amd.com, 
	qperret@google.com, rick.p.edgecombe@intel.com, rientjes@google.com, 
	shivankg@amd.com, steven.price@arm.com, willy@infradead.org, 
	wyihan@google.com, yan.y.zhao@intel.com, forkloop@google.com, 
	pratyush@kernel.org, suzuki.poulose@arm.com, aneesh.kumar@kernel.org, 
	liam@infradead.org, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Shuah Khan <shuah@kernel.org>, Vishal Annapurve <vannapurve@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@kernel.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org, linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Fuad Tabba <tabba@google.com> writes:

>
> [...snip...]
>
>> +unsigned long kvm_gmem_get_memory_attributes(struct kvm *kvm, gfn_t gfn)
>> +{
>> +       struct kvm_memory_slot *slot = gfn_to_memslot(kvm, gfn);
>> +       struct inode *inode;
>> +
>> +       /*
>> +        * If this gfn has no associated memslot, there's no chance of the gfn
>> +        * being backed by private memory, since guest_memfd must be used for
>> +        * private memory, and guest_memfd must be associated with some memslot.
>> +        */
>> +       if (!slot)
>> +               return 0;
>> +
>> +       CLASS(gmem_get_file, file)(slot);
>> +       if (!file)
>> +               return 0;
>> +
>> +       inode = file_inode(file);
>> +
>> +       /*
>> +        * Rely on the maple tree's internal RCU lock to ensure a
>> +        * stable result. This result can become stale as soon as the
>> +        * lock is dropped, so the caller _must_ still protect
>> +        * consumption of private vs. shared by checking
>> +        * mmu_invalidate_retry_gfn() under mmu_lock to serialize
>> +        * against ongoing attribute updates.
>> +        */
>> +       return kvm_gmem_get_attributes(inode, kvm_gmem_get_index(slot, gfn));
>> +}
>
> Doesn't this imply that all consumers of kvm_mem_is_private() should
> validate the result using mmu_lock and the invalidation sequence?

Let me know how I can improve the comment.

I think the "consumption" of private vs shared here actually means
something like "don't commit a page being faulted into page tables based
on the result of kvm_gmem_get_memory_attributes() without checking
kvm->mmu_invalidate_in_progress.", since a racing conversion may
complete before you commit.

kvm_mem_is_private() is used from these places:

1. Fault handling in KVM, like page_fault_can_be_fast(),
   kvm_mmu_faultin_pfn(), kvm_mmu_page_fault(): this already handles the
   entire mmu_lock and invalidation dance. No fault will be committed if
   a racing conversion happened after kvm_mem_is_private() but before
   the commit.

2. kvm_mmu_max_mapping_level() from recovering huge pages after
   disabling dirty logging: Other than that it can't be used with
   guest_memfd now since dirty logging can't be used with guest_memfd
   and guest_memfd memslots are not updatable, this holds mmu_lock
   throughout until the huge page recovery is done. invalidate_begin
   also involves zapping the pages in the range, so if the order of
   events is

   | Thread A                     | Thread B          |
   |------------------------------|-------------------|
   | invalidate_begin + zap       |                   |
   | update attributes maple_tree | recover huge page |
   | invalidate_end               |                   |

   Then recovering will never see the zapped pages, nothing to
   recover, no kvm_mem_is_private() lookup.

3. kvm_arch_vcpu_pre_fault_memory()

   This eventually calls kvm_tdp_mmu_page_fault(), which checks
   is_page_fault_stale(), so it does check before committing.

Were there any other calls I missed?

> sev_handle_rmp_fault() calls kvm_mem_is_private() without holding
> mmu_lock and without any retry mechanism. Is that a problem?
>

Sean already replied on your actual question separately :)

> Cheers,
> /fuad
>
>
>>
>> [...snip...]
>>
