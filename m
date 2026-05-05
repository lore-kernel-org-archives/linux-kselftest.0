Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D963D481AB7;
	Tue,  5 May 2026 15:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777994813; cv=none; b=NuPP1F3/2QRWyxSNn5ac08TZv6f1PVHdAwYmBkGTNN3e77paEDj0VS92eknb4mB4ePfik3e5R0/ZiEyMUs85rINkwhUpsd1ciNJbAjWN745/RhVnlutmasY51CEhfX3m2x4DpzJ2VWnRuXpYBx5ElroGWEN0PmAq3HyTmyfEsf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777994813; c=relaxed/simple;
	bh=qhIk7DdTjawjgIvIgyqyVn4S1RsP4sp7HyNeTVlVPKQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=olTvEZW6yOSkA9lSCnpIkV3TE9tPZHB74hgEG7Xd9N2qSIiiZ6r7mdLOAycmkA849tBZDTiGe6jV+qL2r5VJGJVnmfUbUk42rm1eg/P+Xjm9XgxYZDKKrAeYkFFgNqSgC/M75koAHmO1xKLVGbfIsaJLH7xdTyLpaY1HBE+hpTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jkh0r5F2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jkh0r5F2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A823DC2BCB4;
	Tue,  5 May 2026 15:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777994813;
	bh=qhIk7DdTjawjgIvIgyqyVn4S1RsP4sp7HyNeTVlVPKQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Jkh0r5F2rWtljYw5n8/UDDSlSrtF9vbMiarOekkNQMD+w1RRkTpB9HNJjAztp6K+M
	 U10268ztkioMbO43MiA/VqGfvg15JWhvHQ7JVcflsIFVe/gWeDOYYwjJd1eNhQCFRR
	 Ujg/CC3ah4KdEuIVt535EZr9TyLy+FWhyQONsQxhLHTriQcMp1OLci7ZD5v7d5aXcQ
	 JTI2fSBT1z/Bh62obiPPSxwptX0A5AjWBPPzp6uOyUD/RYDVP8k3SF7z5YVLnpPVm9
	 moOqNtqGhAZLwycx8TuVROJwAt+42XsgEktxeQ5ogfVJ1snLEZF4UP1ZTMPxFFmQZa
	 yeCqiUMx6lGSQ==
Date: Tue, 5 May 2026 17:26:44 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Sarthak Sharma <sarthak.sharma@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Barry Song <baohua@kernel.org>, Dev Jain <dev.jain@arm.com>,
	Donet Tom <donettom@linux.ibm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
	John Hubbard <jhubbard@nvidia.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lance Yang <lance.yang@linux.dev>,
	Leon Romanovsky <leon@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
	Luiz Capitulino <luizcap@redhat.com>,
	Mark Brown <broonie@kernel.org>, Michal Hocko <mhocko@suse.com>,
	Nico Pache <npache@redhat.com>, Peter Xu <peterx@redhat.com>,
	Ryan Roberts <ryan.roberts@arm.com>, Shuah Khan <shuah@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@kernel.org>, Zi Yan <ziy@nvidia.com>,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH v3 30/54] selftests/mm: compaction_test: use HugeTLB
 helpers ...
Message-ID: <afoMNE60ZSLSCQ6g@kernel.org>
References: <20260428204240.1924129-1-rppt@kernel.org>
 <20260428204240.1924129-31-rppt@kernel.org>
 <daa3e21f-0c48-456e-a4a8-198a8c907b9d@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <daa3e21f-0c48-456e-a4a8-198a8c907b9d@arm.com>

On Mon, May 04, 2026 at 03:37:31PM +0530, Sarthak Sharma wrote:
> Hi Mike!
> 
> On 4/29/26 2:12 AM, Mike Rapoport wrote:
> > From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> > 
> > ... instead of open coded access of HugeTLB parameters via /proc.
> > 
> > Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> > ---
> >  tools/testing/selftests/mm/compaction_test.c | 113 +++----------------
> >  1 file changed, 17 insertions(+), 96 deletions(-)
> > 
> > diff --git a/tools/testing/selftests/mm/compaction_test.c b/tools/testing/selftests/mm/compaction_test.c
> > index 30209c40b697..962a50c3d66f 100644
> > --- a/tools/testing/selftests/mm/compaction_test.c
> > +++ b/tools/testing/selftests/mm/compaction_test.c
> > @@ -17,6 +17,7 @@
> >  #include <string.h>
> >  
> > @@ -161,48 +120,10 @@ int check_compaction(unsigned long mem_free, unsigned long hugepage_size,
> >  	ret = 0;
> >  
> >   close_fd:
> 
> A small nit, should we rename close_fd: to out: now? After this change
> the label no longer closes an fd and is the common exit path, so
> close_fd feels a bit misleading.

Thanks, will fix.
 
> > -	close(fd);
> > - out:
> >  	ksft_test_result(ret == 0, "check_compaction\n");
> >  	return ret;
> >  }
> >  

-- 
Sincerely yours,
Mike.
