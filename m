Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 637C33AC0DE;
	Mon, 13 Apr 2026 10:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776075544; cv=none; b=fzW0jnYOeeMp1XDhvTiIxgeboyl2CtHYnLHDxsS4IshetLtalbyjLGx8P2cyd9gE53ePTxYPyzvRiFuXXj5za00OC1c7NZfTFQRerO15VEyDAhJvlbgvz8cOasXq03L6UgcK7mS34tyltBNxrOGwr8mocNA1Vp3INe/rP/qvGfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776075544; c=relaxed/simple;
	bh=BWbYD3cLb+vBXi+E7k34tpbxGLI+DgWOQtcD0coM1VQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RMvIUEvUmMiUaSbQZjMaIenTAmUnQyHxHMXUVQEK7gtoXiCHAAc9iGOqCZjBDppoVCetp8JRgAo0vdgc6nxeGFjHCQUw746YhvviCnj++4txLyNIc8Y1rF8ovJdkotxqiUPMtyzJNeVsPofrFTmUPSXRgyNUAclGGbXkNiiwNe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RZjt1T1k; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RZjt1T1k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C0C2C116C6;
	Mon, 13 Apr 2026 10:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776075544;
	bh=BWbYD3cLb+vBXi+E7k34tpbxGLI+DgWOQtcD0coM1VQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RZjt1T1krDt5iioNTVtJGx4LmUIpyTNvmoYHiFixtdCjPwa3UPk7DDZDSmDYnKuqr
	 cJQC1acBh7in32jRT4qAQ06pQE+10fdLYc6VF2eefckvu7fzC0lkArVBanSBgbUj1+
	 c4IDPI4uzNb1U+mzJvEMdWpvjzYS9gnVlvcNy0ZVF4Oe+KMfnaDxKORrA4ntlbeb0d
	 UXXNbuPbDhauWFRyYv1e/4gSVJwagVZzoc/dPBmCee7ayt90KKPOyYCLupWy048Tgy
	 eh6HbdG8ZqJC0lGKH3I6S4/3Bhu5g4mT2OhkxLVh1h54+eT4r1GYVndetFJwargjny
	 KDoz7zWhRPr7w==
Date: Mon, 13 Apr 2026 13:18:53 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Donet Tom <donettom@linux.ibm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Barry Song <baohua@kernel.org>, Dev Jain <dev.jain@arm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lance Yang <lance.yang@linux.dev>,
	Leon Romanovsky <leon@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
	Mark Brown <broonie@kernel.org>, Michal Hocko <mhocko@suse.com>,
	Nico Pache <npache@redhat.com>, Peter Xu <peterx@redhat.com>,
	Ryan Roberts <ryan.roberts@arm.com>, Shuah Khan <shuah@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@kernel.org>, Zi Yan <ziy@nvidia.com>,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH 07/53] selftests/mm: hugetlb-shm: use kselftest framework
Message-ID: <adzDDS1C3Dc81sk0@kernel.org>
References: <20260406141735.2179309-1-rppt@kernel.org>
 <20260406141735.2179309-8-rppt@kernel.org>
 <eb94ebf2-cc19-4a1b-962a-98346d7b7b6c@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eb94ebf2-cc19-4a1b-962a-98346d7b7b6c@linux.ibm.com>

Hi,

On Thu, Apr 09, 2026 at 03:19:45PM +0530, Donet Tom wrote:
> Hi Mike
> 
> On 4/6/26 7:46 PM, Mike Rapoport wrote:
> > From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> > 
> > Convert hugetlb-shm test to use kselftest framework for reporting and
> > tracking successful and failing runs.
> > 
> > Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> > ---
> >   tools/testing/selftests/mm/hugetlb-shm.c | 46 ++++++++++++------------
> >   1 file changed, 23 insertions(+), 23 deletions(-)

...
 
> > -	dprintf("\n");
> > -	dprintf("Starting the Check...");
> > +	ksft_print_msg("Starting the Check...");
> 
> 
> Do we need to add a newline (\n) here? The output is currently printed as:
> # Starting the Check...# Done.
> If this is intentional, please ignore this comment. Otherwise, it looks good
> to me.
 
The original would print

# Starting the Check...Done

I don't think the extra # is important enough to change something here.
 
> ./hugetlb-shm
> TAP version 13
> 1..1
> # shmid: 0x1
> # shmaddr: 0x7ffface00000
> # Starting the writes:
> # Starting the Check...# Done.
> ok 1 hugepage using SysV shmget/shmat
> # Totals: pass:1 fail:0 xfail:0 xpass:0 skip:0 error:0
> 
> Reviewed by: Donet Tom <donettom@linux.ibm.com>
> 
> -Donet

-- 
Sincerely yours,
Mike.
