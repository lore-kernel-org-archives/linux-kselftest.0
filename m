Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2699C3D567C;
	Mon, 27 Apr 2026 16:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777308693; cv=none; b=dpPJH5GfHrpuNByFJh3aCgxhYUVxm69r+OlHzyeK4hbBxRjbHjgz6U5Blm3BUH+G8MhA81u4qBkoa5Ut5ZarBCj5YTyEUBLyyt7IJeCQQyvS1b1/THJzCYXJLw/Gm//GzwYzpp5H5P61iPuYvG2X7FbYdksjIxwq/Mxo0aNUnRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777308693; c=relaxed/simple;
	bh=wk5Lpv1tDjcTgkb38S1GdZbUP/B9Epp7J8Jqy+D91+0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oeiYlntQ1AKchju18TuiUidwjJOPuLx0HV6yTQPXLS7iCZpKEcb62OaqrFolyy5FE2eaX/OvvXZpqTzkoaCISjRlujm44MpkBZPL0EEcWT0IYx4sVXB9h92UwrTVmJkhKIGCAFljbOFYGX+TjPXq3Bg0hWNC4MY4D9kSRSFj1DA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RqwlM5at; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RqwlM5at"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90B80C19425;
	Mon, 27 Apr 2026 16:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777308692;
	bh=wk5Lpv1tDjcTgkb38S1GdZbUP/B9Epp7J8Jqy+D91+0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RqwlM5at3f2RHg6Brtta+vAerb0epgvShvlwsNfKx2w/K9k310FWyYID6PyO5huTZ
	 jVTBtNz9RS745lmvu+vor/NrpHcdaUWapQMLhLX1Ry5v3gQr00WGje1UP+RZoAL9TB
	 MhVeQdi2R3knacXshbo7EzbUcgdva/RS0/w/UVRNQQawAk98ZIXZEo1w3pVqayacXi
	 2d+mAqBZGMnWEyVOAeTx+ZTNDrHtkIcBhbJlL2WZXiIQK816LzR9QvrJ01rHPg2cUr
	 peeHKP95rRcF3vjikvz3jv3tr/O8T5R+fHKZcjowKBGaxohplsLwwWZ6E1kWy0OAep
	 tJB0TXyhqrmIw==
Date: Mon, 27 Apr 2026 18:51:21 +0200
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
Message-ID: <ae-UCVba16jg3-gR@kernel.org>
References: <20260418105539.1261536-1-rppt@kernel.org>
 <20260418105539.1261536-44-rppt@kernel.org>
 <a8510cbd-4a30-460c-b870-a250ceb8a522@redhat.com>
 <ae3v1cyMLbcvJtYW@kernel.org>
 <67d7b067-97a8-4600-a9a6-46f3e797ffed@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67d7b067-97a8-4600-a9a6-46f3e797ffed@redhat.com>

On Mon, Apr 27, 2026 at 08:56:27AM -0400, Luiz Capitulino wrote:
> On 2026-04-26 06:58, Mike Rapoport wrote:
> > > And there's another issue: when running the migration test individually,
> > > private_anon_htlb gets skipped. I guess it's because the previous test
> > > is restoring the HugeTLB state:
> > 
> > It could be.
> > 
> > I pushed the updated version that has the fixes for both zombie and
> > signal issues:
> > 
> > https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git/log/?h=mm-selftest/v3
> > 
> > Would be great if you can test it in your setup.
> 
> This works! Both issues are fixed: the migration test completes w/o
> hanging and when I run it individually all tests run.

Thanks for confirming!
 
> One last question: should we munmap() the mappings in this test? Though
> I understand this goes beyond your series goal.

We could, but the tests _exit() anyway as a part of kselftest_harness, so
it does not really matter.

-- 
Sincerely yours,
Mike.
