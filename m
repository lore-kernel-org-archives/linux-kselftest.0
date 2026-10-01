Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1D65449B01;
	Thu,  1 Oct 2026 13:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790862734; cv=none; b=DbFKZGnFqJOSY9D4R0QH3U/kYCUxLZGpJKA89ismj9XY2H+Zq64bbVO744SSzz3+pf5eLoiZFpwOB+32OpQb7cwlXlvIulxQNBtL35HsDziboPPxg/sLgYrcQqXgGKimGjjbnsX1zLusZBtSLaRYmQ6ft01wydwXTiU5GsW/IjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790862734; c=relaxed/simple;
	bh=BFYsSQEEDW9ivKme2GW+ybv9NgRrwNxqnlj2UvnfFOY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MimD4An8XhbFqvXIDS0SKS8Tfnj9KAbTrA7QiimW/QUhTmFMKHMf4ZUblepAYm8lJpECYZ5VcGxXOJZ0h12XFHTQyjpgc/xWq6aW3DnbL+bY5uUFhy8q1v6Dje613eXIVaJ9ALIgbnWzOWg9iy1sma+AiZ1EQ5JNiEqJvIoff4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=avLvr1eT; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="avLvr1eT"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 97F87497;
	Thu,  1 Oct 2026 06:52:07 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 572643F86F;
	Thu,  1 Oct 2026 06:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790862731; bh=BFYsSQEEDW9ivKme2GW+ybv9NgRrwNxqnlj2UvnfFOY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=avLvr1eTGOHRMC4ainKq32M1Rv9qJhzcdp8ui1a6bT05iOwUQqOjMwV6ahWU8ss3M
	 jdv6uqw6vGM52rUj4rOlVEcanprQmJ311rJcSCmQcbBoyOGAeEvbbSnKj2j+zpn10K
	 uKUcHHRSK8QicsnORjwxzMBcM3eo2FWE3bVkDB3I=
Date: Thu, 1 Oct 2026 14:52:06 +0100
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
Message-ID: <ar5lhhdKlK6NwX19@e129823.arm.com>
References: <20260924-fix_split-v8-0-cba7359d882a@arm.com>
 <20260924-fix_split-v8-3-cba7359d882a@arm.com>
 <16f16e77-05ab-418e-ad06-8f48fb29375a@kernel.org>
 <aruMgm8UZ_t2V_wh@e129823.arm.com>
 <3e03425b-7962-4c69-93aa-96168fd7168e@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3e03425b-7962-4c69-93aa-96168fd7168e@kernel.org>

> On 9/29/26 12:01, Yeoreum Yun wrote:
> > On Tue, Sep 29, 2026 at 10:07:37AM +0200, David Hildenbrand (Arm) wrote:
> >> On 9/24/26 21:11, Yeoreum Yun wrote:
> >>> check_large_folios() only checks for large folios without distinguishing
> >>> between anonymous and file-backed huge pages.
> >>>
> >>> To add huge page type checking, integrate the huge page checks into
> >>> __check_huge():
> >>>
> >>>   1. If hpage_size == pmd_pagesize, check PAGE_IS_HUGE instead of using
> >>>      check_large_folios(), since only the mapping type matters. This
> >>>      identifies PMD-mapped huge pages.
> >>>
> >>>   2. Otherwise, use check_large_folios() to detect large folios. This
> >>>      covers mTHP cases.
> >>>
> >>>   3. Check the folio flags according to the huge page type.
> >>>
> >>> Suggested-by: David Hildenbrand (Arm) <david@kernel.org>
> >>> Suggested-by: Zi Yan <ziy@nvidia.com>
> >>> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> >>> ---
> >>
> >> Instead of merging both things (detecting mapping vs. detecting anon vs. file),
> >> could we simply perform the anon vs. file change separately?
> >>
> >> Doing another pagemap walk that focuses on that should end up with something
> >> that is easier to read.
> > 
> > Okay. I'll change like below in next-spin:
> > 
> > -------&<-------
> > 
> > @@ -411,57 +400,78 @@ static bool check_huge_type(uint64_t categories, enum check_huge_type type)
> >         return false;
> >  }
> > 
> > -static bool __check_pmd_huge(void *addr, size_t len, int nr_hpages,
> > -                 uint64_t hpage_size, enum check_huge_type type)
> > +static bool __check_huge(void *addr, size_t len, int nr_hpages,
> > +               uint64_t hpage_size, enum check_huge_type type)
> >  {
> >  {
> > -       int pagemap_fd;
> > +       bool ret = false;
> > +       int pagemap_fd, kpageflags_fd;
> >         int nr_pmd_mappings = 0;
> > +       uint64_t pmd_pagesize, scan_mapping_size;
> >         uint64_t categories;
> > +       unsigned long pfn;
> > +       bool check_pmd_mapping, allow_nonpresent;
> >         char *start = addr;
> >         char *end = start + len;
> > 
> > +       pmd_pagesize = read_pmd_pagesize();
> > +       if (!pmd_pagesize)
> > +               ksft_exit_fail_msg("reading PMD pagesize failed\n");
> > +
> > +       check_pmd_mapping = hpage_size == pmd_pagesize;
> > +       scan_mapping_size = (nr_hpages > 0) ? hpage_size : psize();
> > +       /* Some mTHP tests check a partially populated PMD-sized range. */
> > +       allow_nonpresent = (uint64_t)nr_hpages * hpage_size < len;
> > +
> >         pagemap_fd = open(PAGEMAP_PATH, O_RDONLY);
> >         if (pagemap_fd < 0)
> >                 ksft_exit_fail_perror("open pagemap");
> > 
> > -       for (; start < end; start += hpage_size) {
> > +       kpageflags_fd = open(KPAGEFLAGS_PATH, O_RDONLY);
> > +       if (kpageflags_fd < 0)
> > +               ksft_exit_fail_perror("open kpageflags");
> > +
> > +       for (; start < end; start += scan_mapping_size) {
> >                 categories = pagemap_scan_get_categories(pagemap_fd, start);
> > -               if (!(categories & PAGE_IS_HUGE))
> > +               pfn = pagemap_get_pfn(pagemap_fd, start);
> > +               if (pfn == -1UL) {
> > +                       if (!allow_nonpresent)
> > +                               goto out;
> >                         continue;
> > -               if (check_huge_type(categories, type))
> > +               }
> > +               if (!check_huge_type(categories, type))
> > +                       goto out;
> > +       }
> > +
> > +       if (!check_pmd_mapping) {
> > +               ret = check_large_folios(pagemap_fd, kpageflags_fd,
> > +                               addr, len, nr_hpages, hpage_size);
> > +               goto out;
> > +       }
> > +
> > +       for (start = addr; start < end; start += scan_mapping_size) {
> > +               categories = pagemap_scan_get_categories(pagemap_fd, start);
> > +               if (categories & PAGE_IS_HUGE)
> >                         nr_pmd_mappings++;
> >         }
> > -       close(pagemap_fd);
> > 
> > -       return nr_hpages == nr_pmd_mappings;
> > +       if (nr_pmd_mappings != nr_hpages)
> > +               goto out;
> > +       ret = true;
> > +
> > +out:
> > +       close(pagemap_fd);
> > +       close(kpageflags_fd);
> > +       return ret;
> >  }
> > 
> 
> I'd leave existing __check_huge() mostly alone, and instead have an additional
> function that checks the type.
> 
> Essentially a __check_type() or sth that we run after the large folio / pmd check.

So, You mean like this?

-------&<-------

-enum check_huge_type {
-       CHECK_HUGE_ANON,
-       CHECK_HUGE_FILE,
+enum check_type {
+       CHECK_TYPE_ANON,
+       CHECK_TYPE_FILE,
 };

-static bool check_huge_type(uint64_t categories, enum check_huge_type type)
+static bool __check_type(void *addr, size_t len, uint64_t page_size,
+               bool allow_nonpresent, enum check_type type)
 {
-       const bool file = categories & PAGE_IS_FILE;
+       bool ret = false;
+       int pagemap_fd, kpageflags_fd;
+       char *start = addr;
+       char *end = start + len;
+       uint64_t categories;
+       unsigned long pfn;
+
+       pagemap_fd = open(PAGEMAP_PATH, O_RDONLY);
+       if (pagemap_fd < 0)
+               ksft_exit_fail_perror("open pagemap");
+
+       kpageflags_fd = open(KPAGEFLAGS_PATH, O_RDONLY);
+       if (kpageflags_fd < 0)
+               ksft_exit_fail_perror("open kpageflags");

-       switch (type) {
-       case CHECK_HUGE_ANON:
-               return !file;
-       case CHECK_HUGE_FILE:
-               return file;
+       for (; start < end; start += page_size) {
+               categories = pagemap_scan_get_categories(pagemap_fd, start);
+               pfn = pagemap_get_pfn(pagemap_fd, start);
+               if (pfn == -1UL) {
+                       if (!allow_nonpresent)
+                               goto out;
+                       continue;
+               }
+
+               if ((type == CHECK_TYPE_FILE) != !!(categories & PAGE_IS_FILE))
+                       goto out;
        }

-       return false;
+       ret = true;
+
+out:
+       close(kpageflags_fd);
+       close(pagemap_fd);
+       return ret;
 }

-static bool __check_pmd_huge(void *addr, size_t len, int nr_hpages,
-                 uint64_t hpage_size, enum check_huge_type type)
+static bool __check_huge(void *addr, size_t len, int nr_hpages,
+               uint64_t hpage_size)
 {
+       bool ret = false;
        int pagemap_fd;
        int nr_pmd_mappings = 0;
+       uint64_t pmd_pagesize;
        uint64_t categories;
        char *start = addr;
        char *end = start + len;

+       pmd_pagesize = read_pmd_pagesize();
+       if (!pmd_pagesize)
+               ksft_exit_fail_msg("reading PMD pagesize failed\n");
+
        pagemap_fd = open(PAGEMAP_PATH, O_RDONLY);
        if (pagemap_fd < 0)
                ksft_exit_fail_perror("open pagemap");

-       for (; start < end; start += hpage_size) {
+       if (hpage_size != pmd_pagesize) {
+               ret = check_large_folios(addr, len, nr_hpages, hpage_size);
+               goto out;
+       }
+
+       for (start = addr; start < end; start += hpage_size) {
                categories = pagemap_scan_get_categories(pagemap_fd, start);
-               if (!(categories & PAGE_IS_HUGE))
-                       continue;
-               if (check_huge_type(categories, type))
+               if (categories & PAGE_IS_HUGE)
                        nr_pmd_mappings++;
        }
-       close(pagemap_fd);

-       return nr_hpages == nr_pmd_mappings;
+       if (nr_pmd_mappings != nr_hpages)
+               goto out;
+
+       ret = true;
+
+out:
+       close(pagemap_fd);
+       return ret;
 }

 bool check_huge_anon(void *addr, size_t len, int nr_hpages, uint64_t hpage_size)
 {
-       uint64_t pmd_pagesize = read_pmd_pagesize();
-
-       if (!pmd_pagesize)
-               ksft_exit_fail_msg("reading PMD pagesize failed\n");
+       /* Some mTHP tests check a partially populated PMD-sized range. */
+       const bool allow_nonpresent = (uint64_t)nr_hpages * hpage_size < len;
+       const uint64_t scan_mapping_size = (nr_hpages > 0) ? hpage_size : psize();

-       if (hpage_size == pmd_pagesize)
-               return __check_pmd_huge(addr, len, nr_hpages, hpage_size,
-                                       CHECK_HUGE_ANON);
+       if (! __check_huge(addr, len, nr_hpages, hpage_size))
+               return false;

-       return check_large_folios(addr, len, nr_hpages, hpage_size);
+       return __check_type(addr, len, scan_mapping_size, allow_nonpresent,
+                       CHECK_TYPE_ANON);
 }

 bool check_huge_file(void *addr, size_t len, int nr_hpages, uint64_t hpage_size)
 {
-       uint64_t pmd_pagesize = read_pmd_pagesize();
+       /* Some mTHP tests check a partially populated PMD-sized range. */
+       const bool allow_nonpresent = (uint64_t)nr_hpages * hpage_size < len;
+       const uint64_t scan_mapping_size = (nr_hpages > 0) ? hpage_size : psize();

-       if (!pmd_pagesize)
-               ksft_exit_fail_msg("reading PMD pagesize failed\n");
-
-       if (hpage_size == pmd_pagesize)
-               return __check_pmd_huge(addr, len, nr_hpages, hpage_size,
-                                       CHECK_HUGE_FILE);
+       if (! __check_huge(addr, len, nr_hpages, hpage_size))
+               return false;

-       return check_large_folios(addr, len, nr_hpages, hpage_size);
+       return __check_type(addr, len, scan_mapping_size, allow_nonpresent,
+                       CHECK_TYPE_FILE);
 }

-- 
Sincerely,
Yeoreum Yun
