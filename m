Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 430E14746C9;
	Thu, 10 Sep 2026 11:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789040159; cv=none; b=L9U21OLOce/UFpeSs3LeV4EMYUeuqCTYIJzoUpugYLAur1mik47oUNWZs3gdPtalbXBSHa5NVQuQPfcclU+tPRGwuTmY52ppDDkkLNR1fhSMVkz4wQrW6phJJshy7qrJNjF+VUA1c+biIAsvKzue57KE6QUpjKg4+HIxrk+9eWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789040159; c=relaxed/simple;
	bh=aczfw/OR9qUx8B3t8k1OQ/240hod4So0X5+xLV4/xTA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bZRi7PqJXhbmHt609FyFycyjPpB3gLrn/rKkeHYJ8P5SQpeOCDAoZqGVCo87nngSqhNkzXUCHE2i7UqadcI4OBwjf2EVeKQ/efvICo6G9q2mzGIAsSoBMt062Cc8wHoM1NTE4Glhzx3khVZ7Tygph2/QDzNTzW26fcuxXtryk0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=CgX/mRT0; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="CgX/mRT0"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BE4EF153B;
	Thu, 10 Sep 2026 04:35:52 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E863B3F528;
	Thu, 10 Sep 2026 04:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789040156; bh=aczfw/OR9qUx8B3t8k1OQ/240hod4So0X5+xLV4/xTA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CgX/mRT04r6IGfuQdDy64iV7rk9c3tmgqtkbP4fAHIXXQyY1qGDmqhzrIGyBV/x4d
	 6VCv3Ejrr5df0vlUe/MKPJyXEN0lFj6n7DXxd5v6HhF8nC2JCBMcBt1BitEZZ0JtGb
	 G6tL2+pAkuCeWX/2qbtSouG74LXKcFbRexY4TzWA=
Date: Thu, 10 Sep 2026 12:35:50 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Lorenzo Stoakes <ljs@kernel.org>, Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	"Liam R. Howlett" <liam@infradead.org>,
	Nico Pache <nico.pache@linux.dev>,
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>,
	Usama Arif <usama.arif@linux.dev>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>,
	Kevin Brodsky <kevin.brodsky@arm.com>, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/3] kselftest: mm: fix some failure of
 split_huge_page_test
Message-ID: <aqKWFihYpLrLILcZ@e129823.arm.com>
References: <20260907-fix_split-v5-0-822b810458bc@arm.com>
 <b923f63c-db7c-4ecb-949d-368bc6311626@kernel.org>
 <aqKHHWKvOonYZPy0@e129823.arm.com>
 <21e0a933-63b6-42b4-8cd7-df05b0c9acfc@kernel.org>
 <aqKRdIjAYB2PEwRN@e129823.arm.com>
 <9750125c-49b4-48b1-adab-3a1cbec4255a@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9750125c-49b4-48b1-adab-3a1cbec4255a@kernel.org>

On Thu, Sep 10, 2026 at 01:23:15PM +0200, David Hildenbrand (Arm) wrote:
> On 9/10/26 13:16, Yeoreum Yun wrote:
> > On Thu, Sep 10, 2026 at 12:45:39PM +0200, David Hildenbrand (Arm) wrote:
> >> On 9/10/26 12:31, Yeoreum Yun wrote:
> >>>
> >>> Well, users currently for using /proc/self/smaps are for check vm-flags:
> >>>   - guard-regions where using check_vmflags_guard()
> >>>   - pfnmap test where uses check_vmflag_pfnmap()
> >>
> >> Most vm-flags should not be an issue when it comes to merging. The only
> >> exception are vmflags that do not prevent VMA merging.
> >>
> >> So it's VM_SOFTDIRTY and VM_MAYBE_GUARD. And I agree that for guard-regions.c we
> >> likely have to care such that we don't merge by accident with other VMAs (guard
> >> regions).
> >>
> >> But that's independent of memalign.
> >>
> >> ptr = mmap_(self, variant, NULL, 10 * page_size, PROT_READ | PROT_WRITE, 0, 0);
> >> ASSERT_FALSE(check_vmflag_guard(ptr));
> >>
> >> could be problematic on its own (unlikely but possible).
> > 
> > Yes. That's why I'm think it would be good to use alloc_isolated_mem()
> > in case of ANON mapping for this case.
> 
> It's really only guest-region code that needs this.
> 
> > 
> >>
> >> For other flags, you really only have to find the smaps area that covers the
> >> given address and look at the vm-flags.
> >>
> >> Or am I missing something important?
> >>
> >> (merging vnas with VM_PFNMAP is impossible right now IIRC)
> > 
> > No. what I want to say including the patch #3 is for the above case
> > where you point out -- ASSERT_FALSE(check_vmflag_guard(ptr)).
> > 
> > Since we don't have any interface to check vm_flags execpt smap
> > and for memory mmaped with anon would have a chance to merge,
> > We need something to replace memalign() with preventing unexpected VMA
> > merge. 
> Only for the cases that actually really needs this, which is in my understanding
> guard-regions.
> 
> And I repeat, this is not a memalign() problem.

Yes. I'm not claim memalign() is problem but want to prevent unwanted
VMA merge. That's all.

And as I mentioned in another reply, if we get rid of
ASSERT_FALSE(check_vmflag_guard(ptr)), this patch would be droppable.

-- 
Sincerely,
Yeoreum Yun
