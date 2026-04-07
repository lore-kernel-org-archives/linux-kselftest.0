Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2830B39A078;
	Tue,  7 Apr 2026 10:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775557362; cv=none; b=ftxy11srt5PR9IMOcPhUFgEvknMvvQHIORqS47EERvJ6JSX5KFFJHaxGQ22d+9VpEx4h3sNMzi/VAFC1vUzacpPoco+hhHWj6xxFUMa5RD7vcHJma2D9cKQJa24r6cY4BykgBqQC60DzKZujXiPzc2Rrt52M48gLezwpUpX7pGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775557362; c=relaxed/simple;
	bh=FZkXrU5Sd83jhvoTVMaDHnOI/PwYuAOxdZZgsx2RnDQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cZ9K91zkW5lkHiVnoSYQurwU6js+aCKaZQ6QPl4NC4xprKyXkoF7V8Kj0KvxUrsvggigwJqv38VKVE8J3WA5dIcB7HQ+jVNI6d4p1qz2TTqZaF+U4nsRR0Osz64AvfAwQnmUR/TmcqUg3wtd/vgQ8Qo16AEWsBhOIQkHbwPXHC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZHXzlVJd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZHXzlVJd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46A19C116C6;
	Tue,  7 Apr 2026 10:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775557361;
	bh=FZkXrU5Sd83jhvoTVMaDHnOI/PwYuAOxdZZgsx2RnDQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZHXzlVJdcn23biVy0NIGUnEkgIbhCKM79YUU7qVLdsa27iyW2F4YS/cqLPvQZMwnx
	 wBUa9244UMoGK9QDESuLHCHGfivKDN5nFW8aZEzs5aKMjYodHJFTSaD4vIkJNVNFvx
	 pLlTln2YYRfSIluTOI9UpSdIqFr72/k4dLuXK1bhEcEvteMzcd5bOlFDY2JBmUmiF4
	 QH46TOAbDtuDwMDKhCHjkwLY7Wtz5p5st0Yx1jggpBGBSUs5DczSD/qjS+dNcVTlfJ
	 1jDiTdUlSamOHQ6s6UXivis4w6CZYdzw7FvFtKFmf3Bq5uUd8IAu0gPwFcqiDXJk8q
	 xgQwywDrKn3Rw==
Date: Tue, 7 Apr 2026 11:22:35 +0100
From: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
To: Sayali Patil <sayalip@linux.ibm.com>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Ritesh Harjani <ritesh.list@gmail.com>, Zi Yan <ziy@nvidia.com>, Michal Hocko <mhocko@kernel.org>, 
	Oscar Salvador <osalvador@suse.de>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Dev Jain <dev.jain@arm.com>, Liam.Howlett@oracle.com, linuxppc-dev@lists.ozlabs.org, 
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Subject: Re: [PATCH v3 08/13] selftests/mm: ensure destination is
 hugetlb-backed in hugepage-mremap
Message-ID: <adTa3YItApOvQAlN@lucifer>
References: <cover.1774591179.git.sayalip@linux.ibm.com>
 <3b6ffba238a4b59de891acf896fa25d7d3193228.1774591179.git.sayalip@linux.ibm.com>
 <ee15d52f-45df-415b-b0d9-3d267d147e5c@kernel.org>
 <b590a17c-13ed-45f4-9f51-ac662d00e7bf@lucifer.local>
 <066a146b-7dbb-408e-bbc0-542bdcdd6681@linux.ibm.com>
 <86889304-c450-491c-8c06-48ca9c973531@kernel.org>
 <0a1befae-1037-4bbe-b976-352ef4607d2a@lucifer.local>
 <f0905481-3ed3-49e6-a25d-4b58dca7493c@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f0905481-3ed3-49e6-a25d-4b58dca7493c@linux.ibm.com>

On Fri, Apr 03, 2026 at 11:11:25PM +0530, Sayali Patil wrote:
>
>
> On 02/04/26 14:35, Lorenzo Stoakes (Oracle) wrote:
> > On Thu, Apr 02, 2026 at 09:33:29AM +0200, David Hildenbrand (Arm) wrote:
> > > On 4/1/26 22:39, Sayali Patil wrote:
> > > >
> > > >
> > > > On 01/04/26 20:10, Lorenzo Stoakes (Oracle) wrote:
> > > > > On Wed, Apr 01, 2026 at 04:21:55PM +0200, David Hildenbrand (Arm) wrote:
> > > > >
> > > > > OK so digging in:
> > > > >
> > > > > mremap -> ... -> vrm_set_new_addr() -> get_unmapped_area() -> ... (in
> > > > > ppc arch
> > > > > code) -> slice_get_unmapped_area():
> > > > >
> > > > > unsigned long slice_get_unmapped_area(unsigned long addr, unsigned
> > > > > long len,
> > > > >                        unsigned long flags, unsigned int psize,
> > > > >                        int topdown)
> > > > > {
> > > > >      ...
> > > > >      /* bunch of checks */
> > > > >
> > > > >      /* If we have MAP_FIXED and failed the above steps, then error out */
> > > > >      if (fixed)
> > > > >          return -EBUSY;
> > > > >
> > > > >      ...
> > > > > }
> > > > >
> > > > > Is presumably where we hit the issue.
> > > > >
> > > > > >
> > > > > > That is weird. An mremap(MREMAP_FIXED) is really just an munmap() +
> > > > > > move.
> > > > >
> > > > > Yeah the weird bit I guess is that we _still_ invoke
> > > > > get_unmapped_area() but
> > > > > with MAP_FIXED set to indicate that we want the specific address, so it's
> > > > > subject to the above checks.
> > > > >
> > > > > >
> > > > > > Are we sure this is not some actual problem in the hugetlb
> > > > > > implementation?
> > > > >
> > > > > It seems the 'slices' check sees if the _target address_ has an
> > > > > equivalent page
> > > > > size, presumably hugetlb-mandated, and fails if they're not
> > > > > equivalent, so this
> > > > > change is just accounting for that.
> > > > >
> > > > Yes, this change accounts for that by ensuring the destination is
> > > > created with MAP_HUGETLB so it has the same page size as the source.
> > >
> > > Okay, weird, so it's the right thing to do to cover all odd arch behavior.
> > >
> > > > >
> > > > > >
> > > > > >
> > > > > > But then the test suddenly requires more hugetlb pages, no? I don't see
> > > > > > a good reason for the MAP_POPULATE, really. It will be discarded
> > > > > > either way.
> > > > >
> > > > > Yeah I'm not sure about the MAP_POPULATE being all that important here.
> > > > >
> > > > As far as I understand, without MAP_POPULATE, memory accesses would
> > > > trigger userfaults, and since the test is single-threaded and has no
> > > > background handler for the uffd, it would deadlock. MAP_POPULATE ensures
> > > > the test runs correctly by prefaulting all pages, but please let me know
> > > > if I’m mistaken.
> > >
> > > So you are saying the test would deadlock if you are not adding
> > > MAP_POPULATE? If so, please double check if that is actually the case.
> > >
> > > And if it's actually the case, please carefully document that in the
> > > patch description, and probably as a comment above the MAP_POPULATE usage.
> >
> > Do keep in mind MAP_POPULATE is not _guaranteed_ to work :)
> >
> > For guaranteed populate you need madvise(..., MADV_POPULATE_[READ/WRITE]) or to
> > directly fault in.
> >
> > >
> > > --
> > > Cheers,
> > >
> > > David
> >
> > Cheers, Lorenzo
> >
> Thanks David and Lorenzo for the input.
> I tested without MAP_POPULATE and the test works fine without it.
> I will remove it in the next version.

Thanks!

Cheers, Lorenzo
