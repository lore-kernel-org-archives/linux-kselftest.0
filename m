Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 949D141A508;
	Tue, 15 Sep 2026 09:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789466114; cv=none; b=RmK22rwtMY8s/CRGHGlGX+EpA6JyKS37FAUaMkfWipw7FSKQB97OP7uQjjn3ESAuIox60l5Dlo6SN1+WvSza3ccPr4ekFbPdqqTn0F+OzEEtIbWx+PCPOP5M9L5M+mrVvsVcwNBRmW/4raeRKmpk2d0U/677EZJnuavMf50GtdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789466114; c=relaxed/simple;
	bh=l1ghniEQ93Ye4iFedobCshR6rPrWBA+Us5ebC1PJPek=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uFzCSN7famjDItpEXuHRR0KuyV8nu81lA1ZaY0KsD+nwWpINVNLZJoy6hj5tWlbiFjpeluoklZiZH1HP3LnLxRja/UouMqGSo226e5n5bcw8Zte1m18b9cRqkTb3AFEH+3IrOUQzENaFk133PTxgWyl2Lx7WLGBSOt8F33yWpZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=nT55uM6R; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="nT55uM6R"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 422FF2F;
	Tue, 15 Sep 2026 02:55:08 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 456EB3F86F;
	Tue, 15 Sep 2026 02:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789466111; bh=l1ghniEQ93Ye4iFedobCshR6rPrWBA+Us5ebC1PJPek=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nT55uM6R8V9djaEveovbIJi5GECmcNNr8/CxGyfFVO+dy5IPZ9mm0pilhHcvT8Raw
	 IZ+HGhWwfvDDaiR3hD/oGdLBshAVdx4VOUbPkNX2pTOZ0qwKW1qN7t9wIlETGM4HJ3
	 TelznupwP65Jpm/hq05LEyc9Tb0mXV/AsW7SDkKY=
Date: Tue, 15 Sep 2026 10:55:06 +0100
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
Subject: Re: [PATCH v6 2/3] kselftest: mm: replace usage of /proc/self/smaps
 for check_huge_xxx() helper
Message-ID: <aqkV-saU4BWbqu4s@e129823.arm.com>
References: <20260914-fix_split-v6-0-16ed7123800b@arm.com>
 <20260914-fix_split-v6-2-16ed7123800b@arm.com>
 <6c9727cb-6cfa-4d0a-b8d8-077cbeb5cf4f@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6c9727cb-6cfa-4d0a-b8d8-077cbeb5cf4f@kernel.org>

On Mon, Sep 14, 2026 at 04:10:49PM +0200, David Hildenbrand (Arm) wrote:
> 
> >  
> > -	if (hpage_size == pmd_pagesize)
> > -		return __check_pmd_huge(addr, "AnonHugePages: ", nr_hpages, hpage_size);
> > +static bool check_huge_type(uint64_t categories, uint64_t kpageflags,
> > +			    enum check_huge_type type)
> > +{
> > +	const bool file = categories & PAGE_IS_FILE;
> > +	const bool swapbacked = kpageflags & KPF_SWAPBACKED;
> > +
> > +	switch (type) {
> > +	case CHECK_HUGE_ANON:
> > +		return !file;
> > +	case CHECK_HUGE_FILE:
> > +		return file && !swapbacked;
> > +	case CHECK_HUGE_SHMEM:
> > +		return file && swapbacked;
> > +	}
> 
> I wasn't probably clear. Don't add an intermediate CHECK_HUGE_SHMEM. Make
> check_huge_shmem() simply use CHECK_HUGE_FILE and remove the function then in
> patch #3.

Okay. Thanks for clarification ;)

-- 
Sincerely,
Yeoreum Yun
