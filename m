Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35E6D43CE53;
	Tue,  4 Aug 2026 09:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785835415; cv=none; b=pJjwYFkrxYZaGyF0HPpscxT0STA22AjbvmlxmeWgSxR4Tapk5jvMO9/eK7cdNc4PdFSU0HLIcRYQK9QX307eWZfnvkfti539kOhnW/HwMhGz+TBGBrFjq+OjWWuZe9spgB7au7EhRVzBzOk6AziXD4HnEjPM2Ge9H0izmQDC6cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785835415; c=relaxed/simple;
	bh=Rm/YF2/nBIK00kBEAOp/CfMCg4xVkoCnhN3ghNsCd6M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wr4RAdSoykj7Mr01qhe/SuRvxKCrufQUbQUnMXdubMm4RU0nKe8WRWE+FqcP/Shs/y01pS3NLq925E+L6V+Q9GKJNWaCLiwbhOLk5dnw7qfp/naJUEW/4ZBQv1wOM5RBXNYxxYKL6C35zBBbM0BT9NcWTMcZZO+c6wHycBDrco0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=auceVknK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="auceVknK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83E891F000E9;
	Tue,  4 Aug 2026 09:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785835413;
	bh=c0oBKAlrGfQ4L00OUKNbiE0vTuWPdsmHlbQ2cQ+aPi4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=auceVknK1YjKJgJKNAhpIvg+nRJEVOIcMRKKArQhVQfb7+FefkosnaquqOrLiBuJf
	 XaBiNEeand8CuLAqj4IbWbbz3kr/ShGoZqN8xD2bJx2yXJ0+O2K/5Fffq17C+ybk1C
	 05oRqQh+dVqlMcOuZ/JsfVh0C6YmY/jHPzh8hQ+9np0vg1i36xgETTtJ84rUcxNzqN
	 sA2FJGPq8+RF/0u6ftra/o9AlyFn35jWgZmQYyBom3xkv6vwiVBvjlazksIB2+8uG8
	 L3jEsyyqXbDZ8WLTcQ7yAXeThbgtbzKfrspCzFRDwx/5/yYvp1WuonAfR2g8AbmOT0
	 65Uk1MKd/zi2A==
Date: Tue, 4 Aug 2026 12:23:24 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Sarthak Sharma <sarthak.sharma@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
	Lance Yang <lance.yang@linux.dev>, Jason Gunthorpe <jgg@ziepe.ca>,
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>,
	Leon Romanovsky <leon@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Mark Brown <broonie@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/6] tools/lib/mm: add shared file helpers
Message-ID: <anGvjAJpL6_n4XWK@kernel.org>
References: <20260730140825.238130-1-sarthak.sharma@arm.com>
 <20260730140825.238130-3-sarthak.sharma@arm.com>
 <178574760161.1561566.15822401997260524037.b4-review@b4>
 <6dd92e11-77c2-4a18-8ec0-82977832b724@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6dd92e11-77c2-4a18-8ec0-82977832b724@arm.com>

Hi Sarthak,

On Tue, Aug 04, 2026 at 12:13:06PM +0530, Sarthak Sharma wrote:
> Hi Mike!
> 
> On 8/3/26 2:30 PM, Mike Rapoport wrote:
> >> Move read_file(), write_file(), read_num(), and write_num() out of
> >> tools/testing/selftests/mm/vm_util.c into a new shared helper under
> >> tools/lib/mm/.
> >>
> >> @@ -187,8 +188,8 @@ TEST_FILES += write_hugetlb_memory.sh
> >>  
> >>  include ../lib.mk
> >>  
> >> -$(TEST_GEN_PROGS): vm_util.c hugepage_settings.c
> >> -$(TEST_GEN_FILES): vm_util.c hugepage_settings.c
> >> +$(TEST_GEN_PROGS): vm_util.c hugepage_settings.c $(top_srcdir)/tools/lib/mm/file_utils.c
> >> +$(TEST_GEN_FILES): vm_util.c hugepage_settings.c $(top_srcdir)/tools/lib/mm/file_utils.c
> > 
> > I was too lazy to change the Makefile, but we should do something to
> > compile those once and link to every TEST_PROG that uses them.
> 
> Yes, we can do that. But since this is preexisting, let's keep it
> separate from this series. I can send a patch for this separately. Would
> that be okay?

Works for me :) 

-- 
Sincerely yours,
Mike.
