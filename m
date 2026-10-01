Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CAC548FF9D;
	Thu,  1 Oct 2026 21:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790888985; cv=none; b=aQgEv2QDZTDXZtlkerBO081FzpAEBT2Wo3dFAMXUredtS7Tr4uJUy2NKIt0WT0ioinJJjU0XfP5Tk6Td87bHkkOHPnOdPAcN5vtg1HsJc5pFkSL5bXm8/paxs6HQa4srPlTbhU+gXf80024Q8Xp9HAkZ61uTwdghKZjDDMSJszM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790888985; c=relaxed/simple;
	bh=6UxZiSMXOZ2G2+H1G1Efxdl+y1iSPxd/HGooq6Ez18w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RWCy27hm+Qy1WVHXF7G5XYSJO4T5QqfK2PZBYWtNv5XZs4qPpU8AHnO7Yj/ukZYzcbkTH2ymB3bqcjhhxxr/jcfNmCMQ3zEy0FxG2/EJOuYHYxqBb9sh5CYribB3BCdApnPZfJE7KR6PCKH9fVhxqnqEslIZRPaDhqMW4ayXY0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=dXSalrrG; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="dXSalrrG"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2B42C497;
	Thu,  1 Oct 2026 14:09:40 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 802F93F86F;
	Thu,  1 Oct 2026 14:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790888983; bh=6UxZiSMXOZ2G2+H1G1Efxdl+y1iSPxd/HGooq6Ez18w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dXSalrrGGT+/wYVtpiKsAv3e9vNf4B7zYrCJ2/ujeL3rpHLfJSmO3OeLVAtjoaVaY
	 J8ZXO6HNNqGRjwaPtFSAK3/hsL5FVHTBDaJVZGCFcqYJkKFVklzyNV69sfi+X395NY
	 Y7sNaIO28zT6AxELiD9yryQnajhutiuDUk8ySJUk=
Date: Thu, 1 Oct 2026 22:09:38 +0100
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
Subject: Re: [PATCH v8 3/4] kselftest: mm: integrate huge page checks
Message-ID: <ar7MEl_EBWSNOO5F@e129823.arm.com>
References: <20260924-fix_split-v8-0-cba7359d882a@arm.com>
 <20260924-fix_split-v8-3-cba7359d882a@arm.com>
 <16f16e77-05ab-418e-ad06-8f48fb29375a@kernel.org>
 <aruMgm8UZ_t2V_wh@e129823.arm.com>
 <3e03425b-7962-4c69-93aa-96168fd7168e@kernel.org>
 <ar5lhhdKlK6NwX19@e129823.arm.com>
 <a3a4ae76-c09d-4e9a-a84c-acea6f5fc437@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a3a4ae76-c09d-4e9a-a84c-acea6f5fc437@kernel.org>

> On 10/1/26 15:52, Yeoreum Yun wrote:
> >> On 9/29/26 12:01, Yeoreum Yun wrote:
> >>>
> >>> Okay. I'll change like below in next-spin:
> >>>
> >>> -------&<-------
> >>>
> >>> @@ -411,57 +400,78 @@ static bool check_huge_type(uint64_t categories, enum check_huge_type type)
> >>>         return false;
> >>>  }
> >>>
> >>> -static bool __check_pmd_huge(void *addr, size_t len, int nr_hpages,
> >>> -                 uint64_t hpage_size, enum check_huge_type type)
> >>> +static bool __check_huge(void *addr, size_t len, int nr_hpages,
> >>> +               uint64_t hpage_size, enum check_huge_type type)
> >>>  {
> >>>  {
> >>> -       int pagemap_fd;
> >>> +       bool ret = false;
> >>> +       int pagemap_fd, kpageflags_fd;
> >>>         int nr_pmd_mappings = 0;
> >>> +       uint64_t pmd_pagesize, scan_mapping_size;
> >>>         uint64_t categories;
> >>> +       unsigned long pfn;
> >>> +       bool check_pmd_mapping, allow_nonpresent;
> >>>         char *start = addr;
> >>>         char *end = start + len;
> >>>
> >>> +       pmd_pagesize = read_pmd_pagesize();
> >>> +       if (!pmd_pagesize)
> >>> +               ksft_exit_fail_msg("reading PMD pagesize failed\n");
> >>> +
> >>> +       check_pmd_mapping = hpage_size == pmd_pagesize;
> >>> +       scan_mapping_size = (nr_hpages > 0) ? hpage_size : psize();
> >>> +       /* Some mTHP tests check a partially populated PMD-sized range. */
> >>> +       allow_nonpresent = (uint64_t)nr_hpages * hpage_size < len;
> >>> +
> >>>         pagemap_fd = open(PAGEMAP_PATH, O_RDONLY);
> >>>         if (pagemap_fd < 0)
> >>>                 ksft_exit_fail_perror("open pagemap");
> >>>
> >>> -       for (; start < end; start += hpage_size) {
> >>> +       kpageflags_fd = open(KPAGEFLAGS_PATH, O_RDONLY);
> >>> +       if (kpageflags_fd < 0)
> >>> +               ksft_exit_fail_perror("open kpageflags");
> >>> +
> >>> +       for (; start < end; start += scan_mapping_size) {
> >>>                 categories = pagemap_scan_get_categories(pagemap_fd, start);
> >>> -               if (!(categories & PAGE_IS_HUGE))
> >>> +               pfn = pagemap_get_pfn(pagemap_fd, start);
> >>> +               if (pfn == -1UL) {
> >>> +                       if (!allow_nonpresent)
> >>> +                               goto out;
> >>>                         continue;
> >>> -               if (check_huge_type(categories, type))
> >>> +               }
> >>> +               if (!check_huge_type(categories, type))
> >>> +                       goto out;
> >>> +       }
> >>> +
> >>> +       if (!check_pmd_mapping) {
> >>> +               ret = check_large_folios(pagemap_fd, kpageflags_fd,
> >>> +                               addr, len, nr_hpages, hpage_size);
> >>> +               goto out;
> >>> +       }
> >>> +
> >>> +       for (start = addr; start < end; start += scan_mapping_size) {
> >>> +               categories = pagemap_scan_get_categories(pagemap_fd, start);
> >>> +               if (categories & PAGE_IS_HUGE)
> >>>                         nr_pmd_mappings++;
> >>>         }
> >>> -       close(pagemap_fd);
> >>>
> >>> -       return nr_hpages == nr_pmd_mappings;
> >>> +       if (nr_pmd_mappings != nr_hpages)
> >>> +               goto out;
> >>> +       ret = true;
> >>> +
> >>> +out:
> >>> +       close(pagemap_fd);
> >>> +       close(kpageflags_fd);
> >>> +       return ret;
> >>>  }
> >>>
> >>
> >> I'd leave existing __check_huge() mostly alone, and instead have an additional
> >> function that checks the type.
> >>
> >> Essentially a __check_type() or sth that we run after the large folio / pmd check.
> > 
> > So, You mean like this?
> > 
> > -------&<-------
> > 
> > -enum check_huge_type {
> > -       CHECK_HUGE_ANON,
> > -       CHECK_HUGE_FILE,
> > +enum check_type {
> > +       CHECK_TYPE_ANON,
> > +       CHECK_TYPE_FILE,
> >  };
> > 
> > -static bool check_huge_type(uint64_t categories, enum check_huge_type type)
> > +static bool __check_type(void *addr, size_t len, uint64_t page_size,
> > +               bool allow_nonpresent, enum check_type type)
> 
> 
> As discussed off-list, maybe we can avoid the allow_nonpresent handling!

Okay. I'll change. Thanks!


-- 
Sincerely,
Yeoreum Yun
