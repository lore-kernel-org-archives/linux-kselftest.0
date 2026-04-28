Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CAFD1A6816;
	Tue, 28 Apr 2026 05:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777355316; cv=none; b=ZnaoAYAVz8GKBVZybjjzLUvRvkJuR7hKLUp3tNjvi/6E+f8bYRMZB8sMp5hJi52AT5ZFxEhWPIV7SYqI/2r37RmAjb7bol2NTDjuCM8mNgCvTGKyjBqILxFkLxQHI+nkrx/alttrlazBTn1jELOZL4mQiPt7bhYdQPSVD/HQCqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777355316; c=relaxed/simple;
	bh=EdPSc+WMWGhg4RFoHQwwCJBiIBgm1vzCd/Q0/u0vbUw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LRt2f62Y0nDEqbyMgb/hzBsCt2Xxo5lKSFlMo/yBe0Nks20jTgX2TyfoLLEdJJXLRI6/LNJueHas52J4Zxix2bVWI96XdRgaM0oFJovAZBueFDyp8HIhXz/oJn74f6Kj/p+qi3X30dkBEjs3vBopEl0vQDSodZVL3QdmYcFhjJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oGKCutFN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oGKCutFN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C10C0C2BCAF;
	Tue, 28 Apr 2026 05:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777355315;
	bh=EdPSc+WMWGhg4RFoHQwwCJBiIBgm1vzCd/Q0/u0vbUw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oGKCutFN123k6dj8oOb6F2qm17O+ZlRbm1g65QIeeCO3Ixd8+EVkVtAssaRwGiOus
	 6T7sWrkcxTMlJu4A/QzzpKRyCtNUJv5om7B2hVfPiK34BIjbF4TFkN+22fMq/ySom5
	 P/xLChAnY/KUe/j1/vhoEtS/ee6No9lsk3bgrEOoexoLa8t39gv98kuDCv94MZaOAs
	 VTILVWtfyGoOxwCIeeYEV7QLUycalFi4AaJaj5g5dtCtXyz5lRqrFP0bVyRsYpeRNx
	 IbLELRLF0nK4uBIppwCdwGlOfi7NuXXDkYx6/WoFArpjXinNUylIzHwFHVApKdfkv8
	 kMDx4njkrvp0w==
Date: Tue, 28 Apr 2026 07:48:22 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Luiz Capitulino <luizcap@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Barry Song <baohua@kernel.org>, Dev Jain <dev.jain@arm.com>,
	Donet Tom <donettom@linux.ibm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
	John Hubbard <jhubbard@nvidia.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lance Yang <lance.yang@linux.dev>,
	Leon Romanovsky <leon@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
	Mark Brown <broonie@kernel.org>, Michal Hocko <mhocko@suse.com>,
	Nico Pache <npache@redhat.com>, Peter Xu <peterx@redhat.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Sarthak Sharma <sarthak.sharma@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@kernel.org>, Zi Yan <ziy@nvidia.com>,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH v2 43/53] selftests/mm: migration: add setup of HugeTLB
 pages
Message-ID: <afBKJn_EjaTAe4A-@kernel.org>
References: <20260418105539.1261536-1-rppt@kernel.org>
 <20260418105539.1261536-44-rppt@kernel.org>
 <a8510cbd-4a30-460c-b870-a250ceb8a522@redhat.com>
 <ae3v1cyMLbcvJtYW@kernel.org>
 <67d7b067-97a8-4600-a9a6-46f3e797ffed@redhat.com>
 <ae-UCVba16jg3-gR@kernel.org>
 <0e2ef2c0-d74e-4aff-bba0-6dd91dbd4e41@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0e2ef2c0-d74e-4aff-bba0-6dd91dbd4e41@redhat.com>

On Mon, Apr 27, 2026 at 01:19:07PM -0400, Luiz Capitulino wrote:
> On 2026-04-27 12:51, Mike Rapoport wrote:
> > On Mon, Apr 27, 2026 at 08:56:27AM -0400, Luiz Capitulino wrote:
> > > On 2026-04-26 06:58, Mike Rapoport wrote:
> > > > > And there's another issue: when running the migration test individually,
> > > > > private_anon_htlb gets skipped. I guess it's because the previous test
> > > > > is restoring the HugeTLB state:
> > > > 
> > > > It could be.
> > > > 
> > > > I pushed the updated version that has the fixes for both zombie and
> > > > signal issues:
> > > > 
> > > > https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git/log/?h=mm-selftest/v3
> > > > 
> > > > Would be great if you can test it in your setup.
> > > 
> > > This works! Both issues are fixed: the migration test completes w/o
> > > hanging and when I run it individually all tests run.
> > 
> > Thanks for confirming!
> > > One last question: should we munmap() the mappings in this test? Though
> > > I understand this goes beyond your series goal.
> > 
> > We could, but the tests _exit() anyway as a part of kselftest_harness, so
> > it does not really matter.
> 
> OK. Just to clarify that I meant exercising the munmap() path, not that
> we're not freeing resources. But if we know that _exit() is sufficient
> for this, then it's fine.

exit tears down all the mappings, but the code path is slightly different
than calling munmap().

We can add munmap() calls there, but let's do it separately from this
series. 

-- 
Sincerely yours,
Mike.
