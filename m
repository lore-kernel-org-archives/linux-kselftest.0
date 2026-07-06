Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43681436BE4
	for <linux-kselftest@vger.kernel.org>; Mon,  6 Jul 2026 18:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783361864; cv=pass; b=fr0Y8bLu/xTOU4wFZCUxnAnK5YIyJhUouK3BvqwRQ/mL3/M8W61VEyU2U1MP2fHm0Va0msH9ezb4vQADL651ROYlUTGFVBh9YWO3c0VxiYhJtYAAaK6PkdWBi3zFLx1eRlnfcqHfBsOTEP4R8khu9pRz5KvgkkbRT0knHY84Y40=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783361864; c=relaxed/simple;
	bh=qof4S+F17VBSSA1zaUR6umxTYpxJBd4EYxHTZo5RHIU=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lyUMHq77WO9XW7L334ZxiWNhogpz0FKXl6yZJeUlgILB74RBQy5ZQnpPPBucEijUfrAAik8pATw2SbXB7EeiwDPGdWrUEvyr56YLjmvglTadPR1gJl5q789P9qBCNpCyQyWvnHCexZ1H2jxCI7acI/y0P4W7WmsV5OXIoPMg7gw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZJd7ZdwW; arc=pass smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZJd7ZdwW"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c88973b6965so68455a12.1
        for <linux-kselftest@vger.kernel.org>; Mon, 06 Jul 2026 11:17:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783361862; cv=none;
        d=google.com; s=arc-20260327;
        b=FkXoFCxK82gyVRKSdKG0M/VA3X4tAIgMqls5wYNdUlzaKJKFr76V0mFFMaFuVat6j3
         pZsNL33wI+puEIQeWaCa1tCuPHcW2KlxR6+6EtU/eKlztksxo4lKDSMcuuBbi+vXBHk0
         EuXSLQH/sRrtSYvN6cZW6+BP/9ih+HvYCjZhPKnY2DMEN85/ZBjx6zRkp9ne9s6Dx8df
         XrPY2RbHz8Zvtnd2NiubMq09Gnnx8xi72aS+3JivyZ248em+ycoMpJR8REmO3QIkk8RU
         Smx975YFG5uEOOl0wHb2foBGfCwOqQShVh6jTLPG7MR/t9VJsSqWi6lNteeFs36WXCY3
         PAuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=c+wxJ1Yd1HSbDSoQd0ZgV/xzQAnAHKSd8sgBz4R4ZFc=;
        fh=72owWQ35CVFPbtX9arTPTLrD8l+ku7VYhkJfEQP0/xw=;
        b=rBPsq5MBMrgVvQPHupcDY5CPWRGBwLaO6h66cDwD0cH5AXQWSvjWhk1WVR9/TwfGa8
         OrdrMKRflPudlNid3R/+i+lljkirx0VelbPS9qzdA4ZYRXfSLSFd0p+JXS/oCfecAoeq
         ARV/qKeQ1Rguoin+I71MJ/BeH7MXqI4feE6raHQA+9PWmm7UtXropdEJ7FdDijznXHJ8
         GwMCgPnz9yBedi1AQZnDvz+pemACGIh48kg4t8iTTP9DIeZpadwfJxaLuJnNbdyh8R7Y
         /cYPaSLZfRXvEVw7nHQFfkqH1v7N/Mri0V0j42OX1++195yvs2oNj3WREV3dC6T4aREU
         P+oA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783361862; x=1783966662; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=c+wxJ1Yd1HSbDSoQd0ZgV/xzQAnAHKSd8sgBz4R4ZFc=;
        b=ZJd7ZdwWlAbQKSLwjOSWuHPVGVhCVdGI7XLRLLc7OEy6svimB49ddFMt9Yb57Nkn+3
         EOS+mec+Nu9yHfb6xFf+bchy0TMR4xL2PNpwj78qsYBye7WfAQl11eitoKlXKEHIZSjm
         ZVnA0g23QvXquT1+wVXtMfVwWq5OgLLRSVGuWzV5hypKAvFU8pBMAgbWyNCnOR9C0FoZ
         fGhryIyT2oiUl8Y4xzhL3QzR8r2O4/+Rj7MfV+YnOWQ95RbSWSaCfC/XOm/HauEdxe1h
         Gzv4XBYIPNYUOqqU77rMMwZwpCMk/tDkvWfmOM6hjq1cEwqaepW3MPjSLymIt3UvGHeH
         SHdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783361862; x=1783966662;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c+wxJ1Yd1HSbDSoQd0ZgV/xzQAnAHKSd8sgBz4R4ZFc=;
        b=OwLhL+vbq2ukPitYnfmGSWRj3HNhgbP2YHeNOlD/LOyqohFOJgtnOoXj4MG5i+r9BL
         HhRPT6wEJJeQxdEzvfWuGCmZRN1S6kVLgW2t7/U2akyxikfnkoEKXNjPEBtoqWpcR4YD
         WOnosW17+sTzpcgy4rd9CMMmu/4LS8dlHstE+qo7UcTDdgKMdFVmB68csZ7WmXCaNPGw
         gTQKn+PB63jIvHozdkK/WQBXe/sQjWC88Y6W37i8CmYX8h+yB+MicPFxHhovz2c/tHom
         EgE6rqUoegxYwtPvqoeCOQkuYeeHDwakvUoYYny01C3PSoR/VnqyTBkv5z1C2LQXsAxT
         MRBg==
X-Forwarded-Encrypted: i=1; AHgh+Ro/q5zMfROivjXz5ns2ixP8scEvn/nQo0l1EUKjHKYAp6G5G0XLAyjI2p9+Kw9IinOdj82/JrxNTdXL+GrD+9k=@vger.kernel.org
X-Gm-Message-State: AOJu0YzObbIRc4rfOj1GdB83aEMYkQXUSjBNopl+YXKiocolN2NP/ZHh
	LlCluqmBW4nukgxbNEa6bdXJCtRuzJDJ2XCyMVUHKoS7mUYnErTrKr2ijzd/Xc+HFWluNBkrNRT
	iX8s23naKMKGXyWJshigaSVITTYDILhuxVhuWR0h/
X-Gm-Gg: AfdE7clXLMB+OsJHKhwXqV5F2YLNMPhHaMeBSgh2nkOMeXNzVcviBOSWPABfF7/UMIG
	xB7vb6tmTTC9LmvW3XI0kXiTAEZoScj9xUMIw2zGgey+AhU3aZ/M9PfvJKkT3q0kgJex7MjYzSh
	z+0B9G2/xgqvYKmE816YPLCxXZ1oylazlS8pn9kpkvLaC41m8yFgUC0MZybpfzr/76L+RoAwMd8
	9R+5wGuD/eMRq+fDwUj4HtKXbeVEXNWBQNZdJB7otqSm7v43EWA65l6ttf1EIUz0CBwO554wqUV
	d7WEftPN5rURINrzK5UIbkVHOXT+6LX45iUQGleEU6SeZOZ1QDEimgjDlnAGxZz6IJ65kg==
X-Received: by 2002:a05:6a21:6906:b0:3bf:79b5:ebdb with SMTP id
 adf61e73a8af0-3c01caab306mr16907533637.21.1783361861894; Mon, 06 Jul 2026
 11:17:41 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 6 Jul 2026 11:17:40 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 6 Jul 2026 11:17:40 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <114e2488-97ed-4740-a8e8-1edd991f26c5@arm.com>
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com>
 <20260618-gmem-inplace-conversion-v8-13-9d2959357853@google.com> <114e2488-97ed-4740-a8e8-1edd991f26c5@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 6 Jul 2026 11:17:40 -0700
X-Gm-Features: AVVi8CeLpju1khujHSRbueqIxtdXRIsffiKvTI6S-exNvUblyDgAMTgWeujtT7w
Message-ID: <CAEvNRgFKbKfTMkqh_XF-igm07qYWfRwYJ5SH7wHcLZnqesCzTw@mail.gmail.com>
Subject: Re: [PATCH v8 13/46] KVM: guest_memfd: Add base support for KVM_SET_MEMORY_ATTRIBUTES2
To: Suzuki K Poulose <suzuki.poulose@arm.com>, aik@amd.com, andrew.jones@linux.dev, 
	binbin.wu@linux.intel.com, brauner@kernel.org, chao.p.peng@linux.intel.com, 
	david@kernel.org, jmattson@google.com, jthoughton@google.com, 
	michael.roth@amd.com, oupton@kernel.org, pankaj.gupta@amd.com, 
	qperret@google.com, rick.p.edgecombe@intel.com, rientjes@google.com, 
	shivankg@amd.com, steven.price@arm.com, tabba@google.com, willy@infradead.org, 
	wyihan@google.com, yan.y.zhao@intel.com, forkloop@google.com, 
	pratyush@kernel.org, aneesh.kumar@kernel.org, liam@infradead.org, 
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
	Vlastimil Babka <vbabka@kernel.org>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Suzuki K Poulose <suzuki.poulose@arm.com> writes:

>
> [...snip...]
>
>> +static int __kvm_gmem_set_attributes(struct inode *inode, pgoff_t start,
>> +				     size_t nr_pages, uint64_t attrs)
>> +{
>> +	struct address_space *mapping = inode->i_mapping;
>> +	struct gmem_inode *gi = GMEM_I(inode);
>> +	pgoff_t end = start + nr_pages;
>> +	struct maple_tree *mt;
>> +	struct ma_state mas;
>> +	int r;
>> +
>> +	mt = &gi->attributes;
>> +
>> +	filemap_invalidate_lock(mapping);
>> +
>> +	mas_init(&mas, mt, start);
>> +	r = kvm_gmem_mas_preallocate(&mas, attrs, start, nr_pages);
>> +	if (r)
>> +		goto out;
>> +
>> +	/*
>> +	 * From this point on guest_memfd has performed necessary
>> +	 * checks and can proceed to do guest-breaking changes.
>> +	 */
>> +
>> +	kvm_gmem_invalidate_start(inode, start, end);
>
> I added support for Arm CCA KVM patches with the inplace conversion and
> I am hitting the following issue.
>
> 1. I am supporting INIT_SHARED + MMAP flags.
> 2. VMM creates the Gmem_fd with both the flags above.
> 3. Uses the shared gmem-mmap to load the initial payloads (kernel, dtb).
> 4. At the VM finalization time, Populate the loaded regions one by one
>     by
>      a) copying the images to a temparory buffer - Since CCA can't really
>         load the contents in-place.

Sounds good :). I see that you blocked this in the kernel by returning
-EOPNOTSUPP if (!src_page) [0].

>      b) Set the "region" to Private in the gmem_fd (via
> SET_MEMORY_ATTRIBUTES2)
>      c) Invoke CCA backend to populate the private memory via
>         ioctl(KVM_ARM_RMI_POPULATE,..) [0]
>

This flow sounds right.

> [0]
> https://lore.kernel.org/all/20260513131757.116630-27-steven.price@arm.com/
>
>
> 5. Additionally, VMM can mark the entire RAM to be private before the VM
>     starts running, again via SET_MEMORY_ATTRIBUTES2. On CCA, this
> action is measured and doesn't require the Host to "commit" memory to
> the VM.
> Instead the host can lazily donate memory on a fault.
>

For both TDX and SNP, the host can also lazily donate memory,
guest_memfd supports this.

> But step (5) triggers the invalidation of both private and shared
> mappings of the gmem area, from the kvm_gmem_invalidate_start()
> above.
>
> This is because, the entire DRAM now has, some portions PRIVATE (the
> loaded regions) and the rest are SHARED (from the Gmem_fd creation).
>   Thus, kvm_gmem_get_invalidate_filter(Dram_start, Dram_end) causes the
> invalidation of both "PRIVATE" and "SHARED" regions, which results
> in the destruction of the already loaded data and things go south.
>

This destruction will happen for TDX as well. I think we managed to get
around this because we didn't apply conversion on the already-private
ranges.

IIUC on SNP, zapping pages in the stage 2 page tables doesn't destroy
the data, so that's probably why it has been fine for SNP.

> When we know that the kvm_gmem_invalidate_xx is triggered by a
> conversion, we don't need to invalidate the existing pages that
> are in the requested state. i.e., the following patch on top of
> this series does the trick for me :
>
>
> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> index a97fcac34a0e..62e0427a49f4 100644
> --- a/virt/kvm/guest_memfd.c
> +++ b/virt/kvm/guest_memfd.c
> @@ -250,16 +250,23 @@ static void __kvm_gmem_invalidate_start(struct
> gmem_file *f, pgoff_t start,
>                  KVM_MMU_UNLOCK(kvm);
>   }
>
> +static void kvm_gmem_invalidate_start_filter(struct inode *inode,
> pgoff_t start,
> +                                            pgoff_t end,
> +                                            enum kvm_gfn_range_filter
> attr_filter)
> +{
> +       struct gmem_file *f;
> +
> +       kvm_gmem_for_each_file(f, inode)
> +               __kvm_gmem_invalidate_start(f, start, end, attr_filter);
> +}
> +
>   static void kvm_gmem_invalidate_start(struct inode *inode, pgoff_t start,
>                                        pgoff_t end)
>   {
>          enum kvm_gfn_range_filter attr_filter;
> -       struct gmem_file *f;
> -
>          attr_filter = kvm_gmem_get_invalidate_filter(inode, start, end);
>
> -       kvm_gmem_for_each_file(f, inode)
> -               __kvm_gmem_invalidate_start(f, start, end, attr_filter);
> +       kvm_gmem_invalidate_start_filter(inode, start, end, attr_filter);
>   }
>
>   static void __kvm_gmem_invalidate_end(struct gmem_file *f, pgoff_t start,
> @@ -724,9 +731,14 @@ static int __kvm_gmem_set_attributes(struct inode
> *inode, pgoff_t start,
>          /*
>           * From this point on guest_memfd has performed necessary
>           * checks and can proceed to do guest-breaking changes.
> +        * Also, we don't have to invalidate the regions that
> +        * may already be in the requested state. Hence, we could
> +        * explicitly filter the invalidations to the opposite
> +        * state.
>           */
>
> -       kvm_gmem_invalidate_start(inode, start, end);
> +       kvm_gmem_invalidate_start_filter(inode, start, end,
> +                                       to_private ? KVM_FILTER_SHARED :
> KVM_FILTER_PRIVATE);
>

I think this makes sense. Thanks for catching this.

>          if (!to_private)
>                  kvm_gmem_invalidate(inode, start, end);
>
>
> Thoughts ?
>
> Suzuki
>
>
>>
>> [...snip...]
>>
