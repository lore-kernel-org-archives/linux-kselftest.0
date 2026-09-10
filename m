Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E02E34746B3;
	Thu, 10 Sep 2026 11:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789039839; cv=none; b=gHShipbVT82AwWSJuZ5zASa2GiXL+vl8SwRjLzo66Lq0uWz6/kr9i9tCPafr2QCXMSLr9IPqoFzrqIvGALqY/uSb1htPYCzMLFrtej8okd2Ux0KWA8LLe4ccvVCl7t4M8J8nxW24UDZXbpnwimaPX6EnM8AJGvtm3MPtpY4dloE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789039839; c=relaxed/simple;
	bh=L5i7mVveayCy4P36Os2p3EeZ4N7n15du1C0VbezxZKM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tlUIaIzPZPam+WSOhULs/pRwPbPrK9AW1TdsUdEt1KvGxLcWJqQhuQtXFSGi/T5YtXNS3M8VkdTPFuiBEraysEO19tThGruZQ4qNiQ2Z+sae8dZiJ94Kd6HPb2/WAILxim8d7GMqIGOTOmj0agtLW+ada0ElSWckJolOyD4qLog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=S3yeQE4F; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="S3yeQE4F"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 10E89153B;
	Thu, 10 Sep 2026 04:30:29 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B80D53F528;
	Thu, 10 Sep 2026 04:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789039832; bh=L5i7mVveayCy4P36Os2p3EeZ4N7n15du1C0VbezxZKM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S3yeQE4FGIKitHwxhtAWJo1+SEzcq29goaN6s8K/smUGgoj4iffJqZxc3GUYDMO6u
	 /B13CWJcxxeZN3brYIv0ZbVP0+FUlYLHBtUDwfD8fELky+hFAiC475N39A2mOmgIcW
	 WrzseTqc7sPSzeewfQGfJlVRMVpxA2xbY5w+/h0g=
Date: Thu, 10 Sep 2026 12:30:27 +0100
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
Subject: Re: [PATCH v5 3/3] kselftest: mm: introduce alloc_isolated_mem()
Message-ID: <aqKU0-Gm4yh78F3V@e129823.arm.com>
References: <20260907-fix_split-v5-0-822b810458bc@arm.com>
 <20260907-fix_split-v5-3-822b810458bc@arm.com>
 <5c05b620-7a2f-453d-9725-fed4f536a019@kernel.org>
 <aqKOVGECsCNtSMIV@e129823.arm.com>
 <d0b3ea99-e20b-4883-8fa3-67fdbf5b1ee4@kernel.org>
 <aqKS7CP67X4h6NiM@e129823.arm.com>
 <31418d0e-9745-4e8d-bc02-dbbd5cb9e193@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <31418d0e-9745-4e8d-bc02-dbbd5cb9e193@kernel.org>

> On 9/10/26 13:22, Yeoreum Yun wrote:
> > On Thu, Sep 10, 2026 at 01:14:42PM +0200, David Hildenbrand (Arm) wrote:
> >> On 9/10/26 13:02, Yeoreum Yun wrote:
> >>>
> >>> Since there is no interface to get vm_flags not via /proc/self/smaps,
> >>> It might be good to have it for preventing unwanted VMA merge.
> >>>
> >>> And might be useful for future to prevent unwated VMA merge.
> >>
> >> See my reply on why vm flags are generally not a problem. Just like other
> >> properties that are not changed during VMA merging.
> >>
> >> Let's not perform random code changes without a clear picture.
> >>
> >> And just to emphasize again: VMA merging could already be a problem before
> >> memalign() internal changes.
> >>
> >> (also observe here how we do a MADV_HUGEPAGE, so this is all rather arbitrary,
> >> which is not good)
> > 
> > As I mentioned in my previous reply, what I’m trying to prevent here is
> > a failure when checking, immediately after memory allocation,
> > that a specific vm_flag is not set.
> > 
> > Yes, I agree that this could have been a problem even before
> > the internal changes to memalign(). An unwanted VMA merge could already
> > occur at the time of memory allocation.
> > 
> > So what I’m trying to avoid is a test failure where, due to such an
> > unexpected VMA merge during allocation, the subsequent check that
> > a specific vm_flag is not present fails.
> Which is only a guard-region marker problem?

Yes. so if we remove ASSERT_FALSE(check_vmflag_guard(ptr)), TBH
we don't need this patch unless other usage comes up to prevent unwanted
VMA merge.

Would it be better to drop ASSERT_FALSE(check_vmflag_guard(ptr)) in
guard test?

-- 
Sincerely,
Yeoreum Yun
