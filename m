Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E0DE236A73
	for <linux-kselftest@vger.kernel.org>; Wed, 24 Jun 2026 23:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782342038; cv=pass; b=EKVB6DARx15z/Jnqz2d+i9YxvjS/nMQFYPqW6iK+2O5TM6g4RBHdsLatI6jewV/xky/1i6vB5CfAgts2KFBXcFKDwjhxlF8LuiEdkc11gXM7KfZXcVYgfs9rB86z1DmCbhChoX7+Sp1pmk7IApMXA9BvLdo3XxIinsyB2Lk8/to=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782342038; c=relaxed/simple;
	bh=IqPLVwsO0D0MZhplC6ajaXmgltfNbyg+xs7Qj1el6YM=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P30eIaEEJR9OJS44puu/XlJE7U7tG4hRE0SlByNjoxnP2tpDyLte3594lR+1Gn5FFZcbAns5mFOpM7bIwWJ/oNG4PfMYPedJ/bM5z2tZn4Kk6Jy7HFU7B4QOl7O/oh4cEho77LWQloDeFlO4eze0mFYGHbvgpo7i+5uFxDc8JVI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MeAL5LQP; arc=pass smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MeAL5LQP"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-137335bc3caso2719837c88.0
        for <linux-kselftest@vger.kernel.org>; Wed, 24 Jun 2026 16:00:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782342034; cv=none;
        d=google.com; s=arc-20260327;
        b=IjfIg/3PmNUgFCf2uZZeXP4pyJEh/L/2oXQ4OvriA7kxYKAvLsmCBK93N/SrAH02rr
         P3grTCdwTh4Vm5t1wvXryZtguFQF+CIjx8S5sQTY0esIDv7QOtleNlpY4pMl5Rorg4ay
         Y3luF5Ujda3+jyaHh8bAVNIE1o43uQeddA6ZX+pYVRkrHqRJ0PzEvKYhceC5TswU9MFf
         2fuaGKHCyUCcBGVwJAPWx50MYC138qCzan6irjxcyIR8tsFBoMYjOM2uSTkuykNKmnin
         VcRKURNwtvkbdODC1K7zzwfPSN9UJfPUdAFdDnkQW0OCgFeZMjRaSSPKHoHULII9PXtx
         opxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=uiDSxDdQCuoFNlxYLhHEIwl1aJFHoLPbVFXDv4LT02c=;
        fh=ELFME8VFGrsHZTDYvpporUN8Ckv6Ep9VtAYcJL0D1z0=;
        b=VM8kgjkLsHJrDuMVnXJIufWAy30xGeexQBBY814mYZ0PKpJVYyg6tyNxOykvaN5joY
         y4Floqwv5GRm4WxvVc/saQYdzxD2zP6FBPWGSkjfmkjKyAAwistB3GD7f86QjgJq+8Sv
         y97HecLutMxhsPI2/cwalnm0E5moQ2au6YHbS32rde16mc/jo3zinKdmwhWFM+CFPkxN
         FjvVK5IIh/Sjr3ROgPxmMOlunVrbGlcHSzOx+umN+emUmeCT1+p2/U5AaO5EKRVBK6F7
         OuuRlhBz6XU9QJ5QUUz6M7zI0R97p5cH5aQTh30nFOlcKveTZSPHunHXfDT/3ebjeeVO
         7x2A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782342034; x=1782946834; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=uiDSxDdQCuoFNlxYLhHEIwl1aJFHoLPbVFXDv4LT02c=;
        b=MeAL5LQPCxoChlD4CJt8wfrrIhSqF0/tu6nyPd+ZAm+Fv7ZGG/N76wIf3v3I/oe/UA
         +1Io1MP412rJ7THsbuz8Tp+H57mtevqeusr1PrVPiZguFo6aF32KSxkmVYnx08RuUKbG
         XzSqYzSkn2y4D+cgcfeASW9ngKaZRfYNosUDAb2ibzusJpTgJuChjamJ2mS0gGOza+5y
         5jtm5tQxH5VddDSxd+0NvtTvr2YeRmfT4qC77vG0Fnkf/nQtYYvhzrv6Ylj65lQGhcBa
         hPCbLbNPsdit3Yes0VpYvK4c43lglqVzG+bhCKU1DTBzPxUDJeS6BvhneDcIUykvqrqk
         YCPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782342034; x=1782946834;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uiDSxDdQCuoFNlxYLhHEIwl1aJFHoLPbVFXDv4LT02c=;
        b=fJDY3yJ+OsyyswbVGuaujxZSoiyT+5FWToIIYVSUE6vKLAZ6WXrj8nNNVhRz2rwmyB
         i2PiGDl6uai7yMuOXsUJvPVeiHWEsLTluRdrw88rQsiSlODlSqHpUWDvBEMwEcxnIvjr
         EpWme5MGIEFdgPeG3gvDZAw5FOz8GEiQvX4ChYcyd9/yMwghg6+xs7/q8lCcKuFesJKy
         qpCQjrGYAseUnJQSGRira3OHPSUvG6tigkbUuVMRowlyBJ+hhEf3DzQrBTxOYag/LA+3
         WxunP8yCoHfSjb0WqJDTaYh27ClKyyyGyM4xDW+cu6M3D7y2fbW57hH8F0zLWZ8atd0n
         v1FQ==
X-Forwarded-Encrypted: i=1; AFNElJ9lAWe158tVvWA5MPDpWScEMTQ5aiJKjFEdFwIjLTY1jT6xwekGjGQDltZ5Jz7JQ5RGB/oUjJg1dVT24Gj663w=@vger.kernel.org
X-Gm-Message-State: AOJu0YzK/n6FZd+1kDKuUY2x10Pd9h7MhcwoOi6bQ6buF3H1lBieGUS3
	Jy9KDrud/Rg3lTr5YFL5HgW8kRlv7/Zo8aUlpFLAjSdmyJ2pTVfRON4YdEeWcCqgrkmpKdB/Pqx
	OMw4LCsc3b81X0SS6dO7nDIah3Hvj4/eBbLXg5nEq
X-Gm-Gg: AfdE7clGU24Jv0FS76TTi5TAZp9UV4TZVYOTFLKfE5dPphXpE3CQT6dYJLjeXXJijHU
	Ecr0p1pnboOiCvR7fje0v7SBHmTyIfxYWYKqGp8Mvo1HxfoeZQQqzilQ/KYVa51vklXyVDzx0lh
	uaHfv65u9udGjvxNwR9JzvTkLILa9ZCanOvVWDrVUrS+CZnhItWVrM3p3F7s/cTUNbT2z9vBxk4
	75Np5gfP/4yEvAGQ0we8J2Cme8MrG55PxOm93KFZ3e4cjDRroO2wLO1JUYjuMP3Tigq4KIajRS2
	aSXVv1JZObamE+BENUBJDPcXlfDgHc6X8nB8wqQnSZzMPHavjADOzMyrNw68fvkHd9zv+A==
X-Received: by 2002:a05:7022:160a:b0:139:cf4f:3b80 with SMTP id
 a92af1059eb24-139dbb1250dmr40215c88.34.1782342033417; Wed, 24 Jun 2026
 16:00:33 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 24 Jun 2026 16:00:32 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 24 Jun 2026 16:00:32 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <ajxasFBzp_9KnQLq@google.com>
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com>
 <20260618-gmem-inplace-conversion-v8-23-9d2959357853@google.com>
 <ajjc0hw8PjGw69e9@yzhao56-desk.sh.intel.com> <ajnf5Z9nWZxoLS4x@google.com>
 <ajoWngKaZ+wfIyR+@yzhao56-desk.sh.intel.com> <ajpGxu2uQys+S2F8@yzhao56-desk.sh.intel.com>
 <ajxasFBzp_9KnQLq@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 24 Jun 2026 16:00:32 -0700
X-Gm-Features: AVVi8Cd6MsvMJuk5LYLyYsxDOenZ5WDyms3uLYv9lo6HnpeNhZqAtHcdl1tcM3o
Message-ID: <CAEvNRgG1nHipzw4=eBgwhvyXi8xYo7FQD_sy9Ax6FDf7YDu3Og@mail.gmail.com>
Subject: Re: [PATCH v8 23/46] KVM: TDX: Make source page optional for KVM_TDX_INIT_MEM_REGION
To: Sean Christopherson <seanjc@google.com>, Yan Zhao <yan.y.zhao@intel.com>
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	jmattson@google.com, jthoughton@google.com, michael.roth@amd.com, 
	oupton@kernel.org, pankaj.gupta@amd.com, qperret@google.com, 
	rick.p.edgecombe@intel.com, rientjes@google.com, shivankg@amd.com, 
	steven.price@arm.com, tabba@google.com, willy@infradead.org, 
	wyihan@google.com, forkloop@google.com, pratyush@kernel.org, 
	suzuki.poulose@arm.com, aneesh.kumar@kernel.org, liam@infradead.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
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
	Vlastimil Babka <vbabka@kernel.org>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Sean Christopherson <seanjc@google.com> writes:

> On Tue, Jun 23, 2026, Yan Zhao wrote:
>> On Tue, Jun 23, 2026 at 01:16:14PM +0800, Yan Zhao wrote:
>> > On Mon, Jun 22, 2026 at 06:22:45PM -0700, Sean Christopherson wrote:
>> > > On Mon, Jun 22, 2026, Yan Zhao wrote:
>> > > > On Thu, Jun 18, 2026 at 05:32:00PM -0700, Ackerley Tng via B4 Relay wrote:
>> > > > > diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
>> > > > > index ffe9d0db58c59..56d10333c61a7 100644
>> > > > > --- a/arch/x86/kvm/vmx/tdx.c
>> > > > > +++ b/arch/x86/kvm/vmx/tdx.c
>> > > > > @@ -3198,8 +3198,12 @@ static int tdx_gmem_post_populate(struct kvm *kvm, gfn_t gfn, kvm_pfn_t pfn,
>> > > > >  	if (KVM_BUG_ON(kvm_tdx->page_add_src, kvm))
>> > > > >  		return -EIO;
>> > > > >
>> > > > > -	if (!src_page)
>> > > > > -		return -EOPNOTSUPP;
>> > > > > +	if (!src_page) {
>> > > > > +		if (!gmem_in_place_conversion)
>> > > > When userspace turns on gmem_in_place_conversion while creating guest_memfd
>> > > > without the MMAP flag, the absence of src_page should still be treated as an
>> > > > error.
>> > >
>> > > Why MMAP?
>> > Hmm, I was showing a scenario that in-place conversion couldn't occur.
>> > I didn't mean that with the MMAP flag, mmap() and user write must occur.
>> >
>> > > Shouldn't this be a general "if (!src_page && !up-to-date)"?  Just
>> > > because userspace _can_ mmap() the memory doesn't mean userspace _has_ mmap()'d
>> > > and written memory.  And when write() lands, MMAP wouldn't be necessary to
>> > > initialize the memory.
>> > Do you mean using up-to-date flag as below?
>
> Yes?  I didn't actually look at the implementation details.
>
>> > if (!src_page) {
>> > 	src_page = pfn_to_page(pfn);
>> > 	if (!folio_test_uptodate(page_folio(src_page)))
>> > 		return -EOPNOTSUPP;
>> > }

Yan is right that with the earlier patch "Zero page while getting pfn",
folio_test_uptodate() here will always return true.

Actually, this is an alternative fix for the issue Sashiko pointed out
on v7 where userspace can do a populate() (either TDX or SNP) without
first allocating the page, with src_address == NULL, and leak
uninitialized memory into the guest.

Advantage of using the uptodate check in populate: if the host never
allocates the page, populate doesn't incur zeroing before writing the
page anyway in populate().

Disadvantage: Both TDX and SNP will have to implement this uptodate
check. guest_memfd can't check centrally because for SNP, for a
PAGE_TYPE_ZERO, !src_page should be allowed with a !uptodate page since
firmware will zero and there's no leakage of uninitialized host memory?

>>
>> Another concern with this fix is that:
>> commit "KVM: guest_memfd: Zero page while getting pfn" [1] always marks the
>> folio uptodate before reaching post_populate().
>>
>> [1] https://lore.kernel.org/all/20260618-gmem-inplace-conversion-v8-21-9d2959357853@google.com/
>>
>> > One concern is that TDX now does not much care about the up-to-date flag since
>> > TDX doesn't rely on the flag to clear pages on conversions.
>> > I'm not sure if the flag can be reliably checked in this case. e.g.,
>> > now the whole folio is marked up-to-date even if only part of it is faulted by
>> > user access.
>> > Ensuring that the up-to-date flag works correctly with huge page support seems
>> > to have more effort than introducing a dedicated flag for TDX.
>> >
>> > > > Additionally, to properly enable in-place copying for the TDX initial memory
>> > > > region, userspace must not only specify source_addr to NULL, but also follow
>> > > > a specific sequence (where steps 1/2/3/7 are required only for in-place copy):
>> > > > 1. create guest_memfd with MMAP flag
>> > > > 2. mmap the guest_memfd.
>> > > > 3. convert the initial memory range to shared.
>> > > > 4. copy initial content to the source page.
>> > > > 5. convert the initial memory range to private
>> > > > 6. invoke ioctl KVM_TDX_INIT_MEM_REGION.
>> > > > 7. do not unmap the source backend.
>> > > >
>> > > > So, would it be reasonable to introduce a dedicated flag that allows userspace
>> > > > to explicitly opt into the in-place copy functionality? e.g.,
>> > >
>> > > Why?  It's userspace's responsibility to get the above right.  If userspace fails
>> > > to provide a src_page when it doesn't want in-place copy, that's a userspace bug.

Yan, is your concern that userspace forgot to update the code and
forgets to provide a src_page, and if we keep the "Zero page while
getting pfn" patch, ends up with the guest silently having a zero page?
I think that would be found quite early in userspace VMM testing...

>> > I mean if userspace specifies a NULL source_addr by mistake, it's better for
>> > kernel to detect this mistake, similar to how it validates whether source_addr
>> > is PAGE_ALIGNED.
>
> The alignment case is different.  If userspace provides an unaligned value, KVM
> *can't* do what userspace is asking because hardware and thus KVM only supports
> converting on page boundaries.
>
> For a NULL source, KVM can still do what userspace is asking.  Rejecting userspace's
> request would then be making assumptions about what userspace wants.
>

Also, +1 on this, what if userspace, knowing that pages are zeroed on
allocation, actually wants to rely on that to get a zero page in the guest?

>> > Since userspace already needs to perform additional steps to enable in-place
>> > copy, specifying a dedicated flag to indicate that the NULL source_addr is
>> > intentional seems like a reasonable burden.
>
> I don't see how it adds any value.  I wouldn't be at all surprised if most VMMs
> just wen up with code that does:
>
> 	if (in-place) {
> 		src = NULL;
> 		flags |= KVM_TDX_IN_PLACE_COPY_INITIAL_MEMORY_REGION;
> 	}
