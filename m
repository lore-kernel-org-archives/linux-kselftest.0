Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE4E4F85A4;
	Mon, 19 Oct 2026 13:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792417941; cv=none; b=ZOBeALdycUd4dmQi9rhioTWlCz4DKz56aV8ymTl6CIuGOnG6eym3BNO5YTMtsYisLgXUYHLc67CZrjpyfOgYfItD3VhnxAlgp/sUBQKpAtL2hLQPQhxg/G20qSJt3aKd+WA6ysPqQYi/hXoe3oBXM3aaQppmJzSi81ho4/FFNEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792417941; c=relaxed/simple;
	bh=RcpiFFUabE2AtqJIr4ID2KCUBRdEtDxV6zfbZoEBIfQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pK7p9IKrNTpocK6DybTAZq5NjbGP5LhOPZi3rumojzRxmJh2v842T0RQKrAPn341Y56VHVW1KvkdK/2a3XNWjktxSS084ktb8J6ZuFH5Lc3p/VaTZ35FI4leO4dUMeiQTdNcT2P0Ls3cWRMsHk+z8ySuC3LaADx9Wxn7JBY9hco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Aht1qCxj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Aht1qCxj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E2A51F000C4;
	Mon, 19 Oct 2026 13:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792417940;
	bh=aR9exyQpvmBZy20HnaYird0KAPjLnyk7prA8CImTHYU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Aht1qCxjkle638FqbshuAgXXDI11Qy5YFKJDKbLH5axSWp9dT7J29By1d2PdihWtr
	 POgd7I9wEwF3p51X2IBdS3ngK6BZiKnyfNoh2MY5YDfeMIb7L7zwtihl5dpc30BMFv
	 rudnSLuQy9P6k7PzbMgI6yoW2rk9onNVDuON2kFCjel6TMtvVjfYQjvrXYVWvEM/G2
	 lNltGwqlVdXjXNIuv3kjOziupJ7Ujo1w9kJxYfstdwXwZKSmxgOuCJHOyKIqcCa85m
	 7N/SHKgwQuiThp5eo9rvtgyq4GBk9P7ylxN4QkL9A11UtShRlDeefL+T6pv8KG8TW7
	 uYPV+4ojRttfw==
Date: Mon, 19 Oct 2026 16:52:10 +0300
From: Mike Rapoport <rppt@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: "Ning, Hongyu" <hongyu.ning@linux.intel.com>, x86@kernel.org,
	shuah@kernel.org, rick.p.edgecombe@intel.com, tglx@kernel.org,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	hpa@zytor.com, ljs@kernel.org, akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	hongyu.ning@intel.com, jolsa@kernel.org, dwindsor@gmail.com
Subject: Re: [PATCH] selftests/x86: Fix userfaultfd test for shadow stack
 rejection
Message-ID: <atYginh9CIXA0baV@kernel.org>
References: <3b3e0a35-e664-40ab-84ad-afa3e31e3aea@linux.intel.com>
 <493158de-7b76-45ca-9d71-ad8981242c12@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <493158de-7b76-45ca-9d71-ad8981242c12@kernel.org>

On Mon, Oct 19, 2026 at 03:03:43PM +0200, David Hildenbrand (Arm) wrote:
> On 10/19/26 03:03, Ning, Hongyu wrote:
> > Commit 3c58f641e813 ("userfaultfd: prevent registration of special
> > VMAs") prevents userfaultfd registration on shadow stack VMAs to avoid
> > bypassing shadow stack protections through UFFDIO_COPY.
> > 
> > The existing shadow stack selftest still expects UFFDIO_REGISTER to
> > succeed and uses UFFDIO_COPY to populate the shadow stack. This causes
> > the selftest to fail on Kernels containing this security fix.
> > 
> > Update the selftest to verify that UFFDIO_REGISTER rejects shadow stack
> > VMAs with EINVAL. Remove the obsolete userfaultfd fault handling thread
> > and UFFDIO_COPY test path.
> > 
> > Tested on: Intel shadow stack capable x86_64 platform
> > 
> > Before fix:
> > 	[FAIL]  Userfaultfd test with return code 1
> > 
> > After fix:
> > 	[OK]    Userfaultfd rejects shadow stack registration (EINVAL)
> 
> 
> Interesting, so we wouldn't be able to snapshot+restore an app that uses shadow
> stacks.
> 
> @Mike: I assume that's not a concern for CRIU etc, right?

CRIU can do snapshots without uffd and it can do shadow stacks in its own
inventive way :)
 
> > 
> > Fixes: 3c58f641e813 ("userfaultfd: prevent registration of special VMAs")
> > 
> > Signed-off-by: Hongyu Ning <hongyu.ning@linux.intel.com>
> Acked-by: David Hildenbrand (Arm) <david@kernel.org>
> 
> -- 
> Cheers,
> 
> David

-- 
Sincerely yours,
Mike.
