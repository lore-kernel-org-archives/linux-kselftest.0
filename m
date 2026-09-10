Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58E6D4949FA;
	Thu, 10 Sep 2026 13:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789048336; cv=none; b=HpWk5e7M5txIIvnpuNTDkc5Q5KeCKRKCy7FVugu6uEnhgnERhFz8iLcXG7cVoQzorxom6tnBznwXgY/OS01Rg4YPRQ+QPaOps7e+BdEbksYC5npkeWQUfAoqkL38prG5P1Fn0pQ68ZpI+ZDx2kSCEDtU4Vhz5Kv3NnTViP8bs4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789048336; c=relaxed/simple;
	bh=BLeoWk5uxGFQ/YEtzA3yICYffhVnHkWffEkn9ZTAC5U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gNZZqg2MpRN4EWsrb3eovdykvvFYaP7WObuulJlbSaOMTLDo/lH6cKRE7clkB+YlmtfiEl6sFD8SmQoWSCabAs+3iKiu433dPvm2+MMoTkZwrcOwXx5trOjMiohUJgDwD8cX74wvGFgFHuhYYymZ9v8FjPqHKSHjjVIamAO4yo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=vARC6GeL; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="vARC6GeL"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A05201570;
	Thu, 10 Sep 2026 06:52:09 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CC7FF3F59E;
	Thu, 10 Sep 2026 06:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789048333; bh=BLeoWk5uxGFQ/YEtzA3yICYffhVnHkWffEkn9ZTAC5U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vARC6GeLbF1eSnLStgikeBQEfsKezRxmbdmUGMAx6++HTEpu/3HCtHdfmAzI3UZYc
	 ac1ZRP+v5TZhF0i9kwYvN7wTSjvRUVod9/iUe8KlZZ7IVsrEGN3Dl568ewPpLEP2sq
	 UNWVhKw5mm0nYzLAp6lUmqqigrSBI4rzGyLgwXfM=
Date: Thu, 10 Sep 2026 14:52:07 +0100
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
Subject: ;, Re: ;, [PATCH v5 3/3] kselftest: ;, mm:
 introducealloc_isolated_mem;
Message-ID: <aqK2B_ehcrcGM-kV@e129823.arm.com>
References: <aqKOVGECsCNtSMIV@e129823.arm.com>
 <d0b3ea99-e20b-4883-8fa3-67fdbf5b1ee4@kernel.org>
 <aqKS7CP67X4h6NiM@e129823.arm.com>
 <31418d0e-9745-4e8d-bc02-dbbd5cb9e193@kernel.org>
 <aqKU0-Gm4yh78F3V@e129823.arm.com>
 <d6f2e6b2-9dc9-4f02-be37-14329c1a6798@kernel.org>
 <aqKfjqa6ye2AOU5k@e129823.arm.com>
 <11a36d52-89a0-4f43-8a51-a4930e171ba0@kernel.org>
 <aqKj5ojQ3dabOV5g@e129823.arm.com>
 <8d27168e-5443-4073-bc65-24ddbe32e29a@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8d27168e-5443-4073-bc65-24ddbe32e29a@kernel.org>

On Thu, Sep 10, 2026 at 03:14:36PM +0200, David Hildenbrand (Arm) wrote:
> On 9/10/26 14:34, Yeoreum Yun wrote:
> > On Thu, Sep 10, 2026 at 02:25:40PM +0200, David Hildenbrand (Arm) wrote:
> >> On 9/10/26 14:16, Yeoreum Yun wrote:
> >>>
> >>> True. I overlooked guard bit is sticky.
> >>>
> >>>
> >>> It's enough but alloc_isolated_mem() could be modified to allocate with
> >>> PROT_NONE first and then change the prot.
> >>>
> >>> It seems whether make a helper or testcase should write the code
> >>> properly in case of unwanted VMA merge.
> >>>
> >>> IMHO, instead of testcase write them all
> >>
> >> So far I am aware of exactly one test case, which others do absolutely need this?
> > 
> > True. I'll respin with your suggestion.
> 
> Don't get me wrong, if we'll need this for other tests we can add helpers. But
> for a single user adding a helper is not really worth it.

No worries. Since I thought there is no use case right now except the
test, I've agreed.

Thanks!


-- 
Sincerely,
Yeoreum Yun
