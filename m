Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5A226FC5;
	Mon, 14 Sep 2026 16:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789404404; cv=none; b=GuNC2hkyvFaQKPmbdIA2D2DJbgnftt1WBdI3bJ3cjgHbg7lfWC52pMs6xJ5doiPdTYOO2yNUWWLiMmko+9guECZWh91M23f6YMkspIwKBYQAr4E5F45DkhHrRWHLoMuF2V72nTk1pb2dzFLlxjbsKfJYnpL34NG4NPjxMjpqvJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789404404; c=relaxed/simple;
	bh=1r0rw5uXWXH7+bTv+MSPJvopnTN1PMSJsWeAueQ3OIw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J6r/IRLjXzYoPJxtrmlnVwMgyJ29CAm2WBG0M2oQZ8NanT5sJF9FNiX7UQKMgT3kZceJWu+Kvk9asFwYU4QjjK9CVayJTCsgF4x6dpT1Jyer6IQ33PU9v3PKKPJaHjKIO21rM4G/VdDTYbTtQo3jQLg1FPT9PVlQu9YLD/qVxoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=uQlLzw5h; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="uQlLzw5h"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 64B02153B;
	Mon, 14 Sep 2026 09:46:38 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F2B093F86F;
	Mon, 14 Sep 2026 09:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789404402; bh=1r0rw5uXWXH7+bTv+MSPJvopnTN1PMSJsWeAueQ3OIw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uQlLzw5hH4+y/inqoVF5LI/F5v/0OKn3hBu6YiJiF5RclJSOU30kwx8YQiz+Vd6PF
	 Kv7GPxXOdE5fNGfmy84Lk4zDUWKwNpomuiIOPLKBUe5upqoT8HCMnT9CQccy6wU2yp
	 spL1qj8fM3HA59WNxLYe00SO/h32opTmY4jE0wkM=
Date: Mon, 14 Sep 2026 17:46:36 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Nico Pache <nico.pache@linux.dev>,
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>,
	Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>,
	Peter Xu <peterx@redhat.com>, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Shuah Khan <shuah@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>,
	Leon Romanovsky <leon@kernel.org>,
	Sarthak Sharma <sarthak.sharma@arm.com>
Subject: Re: [PATCH v3 2/3] kselftest: mm: remove HPAGE_SIZE and HPAGE_SHIFT
 macro
Message-ID: <aqgk7EVV1K_3Pc86@e129823.arm.com>
References: <20260914-fix_hpage_macro-v3-0-c9a305a01d39@arm.com>
 <20260914-fix_hpage_macro-v3-2-c9a305a01d39@arm.com>
 <08d3313b-d891-4202-b460-c5cefa96bbce@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <08d3313b-d891-4202-b460-c5cefa96bbce@kernel.org>

On Mon, Sep 14, 2026 at 04:08:03PM +0200, David Hildenbrand (Arm) wrote:
> On 9/14/26 09:30, Yeoreum Yun wrote:
> > HPAGE_SIZE and HPAGE_SHIFT macro is written based on the 4KB PAGE_SIZE.
> > When this macro is used in some test, test result would be strange in
> > the system where PAGE_SIZE is more then 4KB.
> > 
> > Here is the example with transhuge-stress test with 16KB PAGE_SIZE:
> > 
> >   transhuge-stress: allocate 61073 transhuge pages, using 122146 MiB virtual memory and 1908 MiB of ram
> >     3.292 s/loop, 0.054 ms/page,  37106.002 MiB/s	2566 succeed, 58507 failed, 2566 different pages
> >     0.591 s/loop, 0.010 ms/page, 206850.792 MiB/s	   0 succeed, 61073 failed,    0 different pages
> >     0.527 s/loop, 0.009 ms/page, 231895.107 MiB/s	   0 succeed, 61073 failed,    0 different pages
> >     0.527 s/loop, 0.009 ms/page, 231839.704 MiB/s	   0 succeed, 61073 failed,    0 different pages
> >     0.528 s/loop, 0.009 ms/page, 231544.782 MiB/s	   0 succeed, 61073 failed,    0 different pages
> >     0.528 s/loop, 0.009 ms/page, 231462.074 MiB/s	   0 succeed, 61073 failed,    0 different pages
> >     0.527 s/loop, 0.009 ms/page, 231770.300 MiB/s	   0 succeed, 61073 failed,    0 different pages
> >     ...
> >   ok 1 Completed
> > 
> > Remove the HPAGE_SIZE and HPAGE_SHIFT macro and introduce pmd_pshift()
> > helper to get the HPAGE_SHIFT properly. For HPAGE_SIZE, use pre-existing
> > helper, pmd_psize().
> > 
> > Also, run the KSM_MERGE_TIME_HUGE_PAGES test with a size of 512 MiB,
> > which is the least common multiple of the PMD sizes for 4 KiB, 16 KiB,
> > and 64 KiB base pages. Since allocate_transhuge() allocates mappings in
> > PMD-sized units, the test may fail with the previous size of 100 MiB,
> > which is not a multiple of the PMD size when the base page size is
> > 16 KiB or 64 KiB.
> > 
> > After this patch, output of transhuge-stress:
> > 
> >   transhuge-stress: allocate 3817 transhuge pages, using 122146 MiB virtual memory and 119 MiB of ram
> >     2.558 s/loop, 0.670 ms/page,  47755.759 MiB/s	2585 succeed, 1232 failed, 2585 different pages
> >     2.640 s/loop, 0.692 ms/page,  46268.432 MiB/s	2585 succeed, 1232 failed, 2585 different pages
> >     2.635 s/loop, 0.690 ms/page,  46360.298 MiB/s	2585 succeed, 1232 failed, 2585 different pages
> >     2.782 s/loop, 0.729 ms/page,  43899.795 MiB/s	2616 succeed, 1201 failed, 2616 different pages
> >     2.692 s/loop, 0.705 ms/page,  45380.876 MiB/s	2627 succeed, 1190 failed, 2627 different pages
> >     2.612 s/loop, 0.684 ms/page,  46765.812 MiB/s	2628 succeed, 1189 failed, 2628 different pages
> >     2.683 s/loop, 0.703 ms/page,  45520.990 MiB/s	2630 succeed, 1187 failed, 2630 different pages
> >     2.727 s/loop, 0.714 ms/page,  44789.321 MiB/s	2631 succeed, 1186 failed, 2631 different pages
> >     ...
> >   ok 1 Completed
> > 
> > Suggested-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> > Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> > ---
> 
> [...]
> 
> > index e712a980851c..fd1432dc6152 100644
> > --- a/tools/testing/selftests/mm/vm_util.c
> > +++ b/tools/testing/selftests/mm/vm_util.c
> > @@ -21,6 +21,8 @@
> >  
> >  unsigned int __page_size;
> >  unsigned int __page_shift;
> > +uint64_t __pmd_psize;
> > +uint64_t __pmd_pshift;
> >  
> >  uint64_t pagemap_get_entry(int fd, char *start)
> >  {
> > @@ -161,6 +163,9 @@ uint64_t pmd_psize(void)
> >  	char buf[20];
> >  	ssize_t num_read;
> >  
> > +	if (__pmd_psize)
> > +		return __pmd_psize;
> 
> The only suboptmial thing about these functions is that we keep querying
> repeatedly in case of failure.
> 
> If it failed once, it will fail always.
> 
> You could either add a new variable for "queried" or encode it in the variables like
> 
> uint64_t __pmd_psize = -1ull;
> uint64_t __pmd_pshift = -1ull;
> 
> To then set them to 0 or the actual value after we queried.

Okay. I'll respin it with above.

Thanks.


-- 
Sincerely,
Yeoreum Yun
