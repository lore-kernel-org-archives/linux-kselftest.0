Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D18073CA4A8;
	Fri,  1 May 2026 15:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777649152; cv=none; b=BgUqPQ+OKpyqZwwWsx0VKd75kmo7KVzDzona3/qEA1ggx5rfncL7qeLnqNQd3ggGusIRV71zKYpw0UbcFEP2ZbOFa5ZBNfj1Tr2+JmnlDVpQ/Nn2nM/rz9SOGgYQDiL0g3QN5aBPk58WnumFH9WKAEN5/X7AppuGiLuOIzRCXdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777649152; c=relaxed/simple;
	bh=ELgfGsxPvaqHD+H6X2GusUqMNBV/G7DowThnoh9IrVU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fz48roqQoh4zYrMDpto8DMeD5zTlHB5IMsm1BITashVMZDnpTjgS8sif0NRoQh1trUC9MwzN4AI57jJfy+IqplJs/3brRJIw/rw0x2D4E2hBKsO9Ca2mYJCky2G9FsOQ2XFlqnoOAmjXjLW1wBBCqmO/hzN/zrfvERxiEYRz49U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BlrSp4wv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BlrSp4wv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F216C2BCB9;
	Fri,  1 May 2026 15:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777649152;
	bh=ELgfGsxPvaqHD+H6X2GusUqMNBV/G7DowThnoh9IrVU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BlrSp4wvE554fWFq+y+lP/HaALbT1NM9dBC4frlM3O+ech+F61RvM+MoV0HtNMJzM
	 VUthzBW6dF2Fts9BrX5BleQunpinUP14ZsmYHB0O+w5RXLjZRC3h9uq8mkAEWKH9jy
	 zkBD1Z2AHKNh1lNHuedOhqWRWiTqZtIZ1T02E75GMsNa4zip1WujKuFUfuBNZ6Ggd1
	 E87KmYhHNLB9581PU+Ih8mGMV/I3xNV8Tre2uxp1Lkx+IYqV9C/kgqyH/PFxAkO33Y
	 XmsBh8AIuM4+kSczqEpYEe8/KFiua8kkSJZQr+jfcMZzu7SGnQHRPmF8vga0K59e3j
	 ruap77HSz5yCg==
Date: Fri, 1 May 2026 17:25:41 +0200
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
Subject: Re: [PATCH v3 27/54] selftests/mm: hugepage_settings: add APIs for
 HugeTLB setup and teardown
Message-ID: <afTF9RCy8eBoWYaj@kernel.org>
References: <20260428204240.1924129-1-rppt@kernel.org>
 <20260428204240.1924129-28-rppt@kernel.org>
 <2f443474-4448-462e-bc1e-55bc657d70ba@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2f443474-4448-462e-bc1e-55bc657d70ba@redhat.com>

On Thu, Apr 30, 2026 at 02:31:48PM -0400, Luiz Capitulino wrote:
> On 2026-04-28 16:42, Mike Rapoport wrote:
> > From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> > 
> > A lot of tests require free HugeTLB pages. Some need just a few default
> > huge pages, some need a certain amount of memory available as HugeTLB, and
> > some just skip lots of tests if huge pages of all supported sizes are not
> > available.
> > 
> > This all resulted in a huge mess in run_vmtests.sh that sets up some huge
> > pages, adjusts them later and restores some of the settings if the stars
> > align.
> > 
> > Add APIs that allow saving the state of HugeTLB and setting up the desired
> > amount of HugeTLB pages.
> > 
> > Saving the state also registers atexit() callback and signal handler that
> > will ensure restoration of HugeTLB state.
> > 
> > Since many tests use both HugeTLB and THP, the atexit() callbacks and
> > signal handler are restoring both.
> > 
> > For kselftest_harness tests that run fixture setups and test in child
> > processes add a constructor that will save and restore settings in the main
> > process.
> > 
> > Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> > ---
> >   .../testing/selftests/mm/hugepage_settings.c  | 178 +++++++++++++++---
> >   .../testing/selftests/mm/hugepage_settings.h  |  30 ++-
> >   2 files changed, 183 insertions(+), 25 deletions(-)
> > 
> > diff --git a/tools/testing/selftests/mm/hugepage_settings.c b/tools/testing/selftests/mm/hugepage_settings.c
> > index 4ae7332b5e1b..9d31b53dbc67 100644
> > --- a/tools/testing/selftests/mm/hugepage_settings.c
> > +++ b/tools/testing/selftests/mm/hugepage_settings.c
> > @@ -306,31 +306,12 @@ void thp_restore_settings(void)
> >   		thp_write_settings(&saved_settings);
> >   }
> > -static void thp_restore_settings_atexit(void)
> > +static void __thp_save_settings(void)
> >   {
> > -	thp_restore_settings();
> > -}
> > -
> > -static void thp_restore_settings_sighandler(int sig)
> > -{
> > -	/* exit() will invoke the thp_restore_settings_atexit handler. */
> > -	exit(KSFT_FAIL);
> > -}
> > +	if (!thp_available())
> > +		return;
> > -void thp_save_settings(void)
> > -{
> >   	thp_read_settings(&saved_settings);
> > -
> > -	/*
> > -	 * setup exit hooks to make sure THP settings are restored on graceful
> > -	 * and error exits and signals
> > -	 */
> > -	atexit(thp_restore_settings_atexit);
> > -	signal(SIGTERM, thp_restore_settings_sighandler);
> > -	signal(SIGINT, thp_restore_settings_sighandler);
> > -	signal(SIGHUP, thp_restore_settings_sighandler);
> > -	signal(SIGQUIT, thp_restore_settings_sighandler);
> > -
> >   	thp_settings_saved = true;
> >   }
> > @@ -399,11 +380,31 @@ bool thp_is_enabled(void)
> >   	return mode == 1 || mode == 3;
> >   }
> > +#define HUGETLB_MAX_NR_PAGESIZES 10
> > +struct hugetlb_settings {
> > +	unsigned long free_hugepages[HUGETLB_MAX_NR_PAGESIZES];
> 
> It looks like we don't actually use this in the API or maybe I'm missing
> something?

Yes, it's used only in later patches.
I felt it would be too churny to add users in this patch.
 
> Otherwise, the API looks great to me. But if you allow me to bikeshed :)
> 
> I think I'd do:
> 
> struct hugetlb_state {
> 	unsigned long nr_hugepages;
> 	unsigned long size;
> };
> 
> struct hugetlb_settings {
> 	struct hugetlb_state hstate[HUGETLB_MAX_PAGESIZES];
> 	unsigned long default_size;
> 	int nr_sizes;
> };

It might be slightly nicer abstraction but ...
 
> > +static void __hugetlb_save_settings(void)
> > +{
> > +	struct hugetlb_settings *settings = &hugetlb_saved_settings;
> > +	int nr_sizes;
> > +
> > +	settings->default_size = default_huge_page_size();
> > +	if (!settings->default_size)
> > +		return;
> > +
> > +	nr_sizes = detect_hugetlb_page_sizes(settings->sizes,
> > +					     HUGETLB_MAX_NR_PAGESIZES);

... this immediately becomes more complex.

> > +	if (!nr_sizes) {
> > +		settings->default_size = 0;
> > +		return;
> > +	}
> > +
> > +	for (int i = 0; i < nr_sizes; i++) {
> > +		unsigned long sz = settings->sizes[i];
> > +
> > +		if (!sz)
> > +			continue;
> > +
> > +		settings->free_hugepages[i] = hugetlb_free_pages(sz);
> > +		settings->nr_hugepages[i] = hugetlb_nr_pages(sz);

And this as well.

-- 
Sincerely yours,
Mike.
