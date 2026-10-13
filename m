Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8564340A6B;
	Tue, 13 Oct 2026 10:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791886454; cv=none; b=gSdHZw6YDNgS3/niHtrsGRL4l7u9APzx8ojVRrK0UPOasLRpuwA0rY8jdHHI4r8cuSWALP17FehdvA/OEDYxXzwgsdCqRhh+8Z3qVt8rwjBezscPy/AfJ+TYTqmgAEC0eiDU9KSM/HR0EDaHHAyrWsGDivWITxLMc/VIxbSVpgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791886454; c=relaxed/simple;
	bh=CwIINxwYMx735E6F8s9ep3Xem7KHZ4ZBlh/HyIgAbgg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=unzBtXx32uSq1vdCr4JPrEpmEEeHdTeANrVMkiYc6pym7ere0ySPNk/CE2GEagPnzgCJWWGiDeJuaAP2cfs0IZ7N4pINXgRdyACqZdnke9dHEr0VfzxCvE8mJUoiJiH6YHdRyhYBV6rtAsAkoKQsZRwrCQub+44mvcMKPD0DyHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=EwlAFwkD; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="EwlAFwkD"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D2D21169C;
	Tue, 13 Oct 2026 03:14:08 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 75FB13F7B4;
	Tue, 13 Oct 2026 03:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791886452; bh=CwIINxwYMx735E6F8s9ep3Xem7KHZ4ZBlh/HyIgAbgg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EwlAFwkDH3DXPIhTH/r3Gq7gzfPEvks0fkmwjKTIIEU8lU7V9m+CEaFGUJ2qIKkcH
	 LBg1oIHubi4Bc3NZ0+tI90c3UVa78sskD/3IZOdXFNrnVPDx4Ice2OAwYQT3Uerlxg
	 RYruN74ALtEB3aq/oz+lABH3jelhu/OBkGnIJslI=
Date: Tue, 13 Oct 2026 11:14:05 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Sarthak Sharma <sarthak.sharma@arm.com>
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
	David Hildenbrand <david@kernel.org>, Shuah Khan <shuah@kernel.org>,
	Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>
Subject: Re: [PATCH v6 2/3] kselftest: mm: remove HPAGE_SIZE and HPAGE_SHIFT
 macro
Message-ID: <as4Ebb8GQmAfRb5r@e129823.arm.com>
References: <20261013-fix_hpage_macro-v6-0-2c52d0484de3@arm.com>
 <20261013-fix_hpage_macro-v6-2-2c52d0484de3@arm.com>
 <40f95078-4d3c-48da-9262-afadf231014f@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <40f95078-4d3c-48da-9262-afadf231014f@arm.com>

On Tue, Oct 13, 2026 at 03:26:40PM +0530, Sarthak Sharma wrote:
> Hi Yeoreum!
> 
> On 10/13/26 3:16 PM, Yeoreum Yun wrote:
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
> > Tested-by: Sarthak Sharma <sarthak.sharma@arm.com>
> > Reviewed-by: Zi Yan <ziy@nvidia.com>
> > Reviewed-by: Sarthak Sharma <sarthak.sharma@arm.com>
> > Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> > ---
> 
> [...]
> 
> > diff --git a/tools/testing/selftests/mm/vm_util.c b/tools/testing/selftests/mm/vm_util.c
> > index 5f2fb5b819c4a..efd99298be135 100644
> > --- a/tools/testing/selftests/mm/vm_util.c
> > +++ b/tools/testing/selftests/mm/vm_util.c
> > @@ -21,6 +21,8 @@
> >  
> >  unsigned int __page_size;
> >  unsigned int __page_shift;
> > +uint64_t __pmd_psize = -1ull;
> > +uint64_t __pmd_pshift = -1ull;
> >  
> >  uint64_t pagemap_get_entry(int fd, char *start)
> >  {
> > @@ -161,19 +163,40 @@ uint64_t pmd_psize(void)
> >  	char buf[20];
> >  	ssize_t num_read;
> >  
> > +	if (__pmd_psize != -1ull)
> > +		return __pmd_psize;
> > +
> >  	fd = open(PMD_SIZE_FILE_PATH, O_RDONLY);
> > -	if (fd == -1)
> > +	if (fd == -1) {
> > +		__pmd_psize = 0;
> >  		return 0;
> > +	}
> >  
> >  	num_read = read(fd, buf, 19);
> >  	if (num_read < 1) {
> > +		__pmd_psize = 0;
> >  		close(fd);
> >  		return 0;
> >  	}
> >  	buf[num_read] = '\0';
> >  	close(fd);
> >  
> > -	return strtoul(buf, NULL, 10);
> > +	__pmd_psize = strtoul(buf, NULL, 10);
> > +
> > +	return __pmd_psize;
> > +}
> > +
> > +uint64_t pmd_pshift(void)
> > +{
> > +	if (__pmd_pshift != -1ull)
> > +		return __pmd_pshift;
> > +
> > +	if (__pmd_psize != -1ull)
> > +		__pmd_psize = pmd_psize();
> 
> Kiryl pointed this out in v5 [1], you might have missed it. This check
> seems to be inverted.
> 
> [1] https://lore.kernel.org/all/asj4dT2Q__SlKhgr@thinkstation/

Oh. Thanks. I've missed. 

-- 
Sincerely,
Yeoreum Yun
