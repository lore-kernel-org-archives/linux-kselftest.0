Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC46D303C8A;
	Mon, 14 Sep 2026 14:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789394788; cv=none; b=Nkq64QwSO9cfOYPuqH/TIPEiVrrpTDWnxZR1K+1yLojgCG6o83xdsOc9YMXbkUVUeodWQcGXoUE54ooxMejC0rgQEOSM9HwECJh64lWk6C4hocpJW+xBZ8iRWnV4+xDT3hoQTy82bNQRw3zTT0aYkMNAtgzygiV3ysL0Za4/EAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789394788; c=relaxed/simple;
	bh=kEbhPZqdypUYH5zuM3CM3xRPQdHZ9jN8Yu7SKo3bj+o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NGm/9aQ6nWdkVDiBr3GNpBMK+SooH+spQi28p3x7wYJifyTMRQFfGw1tBqFdoinnGaB5Z3ov/R7CgRtEaUaj9IoQdVy4dkDj01/k2Jk+SXnFnkmaZqNEBnoFS/6vp9uHZ4WeE9LRfMww3hq4dnBKpXdVnkC009tsk+1P9u67i9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=lxW4m4Ei; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="lxW4m4Ei"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 733C91570;
	Mon, 14 Sep 2026 07:06:22 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0ED323F86F;
	Mon, 14 Sep 2026 07:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789394786; bh=kEbhPZqdypUYH5zuM3CM3xRPQdHZ9jN8Yu7SKo3bj+o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lxW4m4EivxqOzcC3wG8EsJ1ftz5SRskIH7wLNcW2DE+3sE8I/m6oAN1mCVJmH3B/p
	 oNmCAl8S9o/4X11xWRjGj1jaU2iaj7bnjDrgnlbD6dRJLr+QL9lbkQptMzaMySRmlm
	 BuYbFyQ+p/R3Y6CW+snj8mCVrhfLiaSJJRZFbu5s=
Date: Mon, 14 Sep 2026 15:06:20 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Nico Pache <nico.pache@linux.dev>,
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>,
	Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>,
	Peter Xu <peterx@redhat.com>, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Shuah Khan <shuah@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>,
	Leon Romanovsky <leon@kernel.org>,
	Sarthak Sharma <sarthak.sharma@arm.com>
Subject: Re: [PATCH v3 3/3] kselftest: mm: introduce size_to_shift() helper
Message-ID: <aqf_XGKDq6jH6pJW@e129823.arm.com>
References: <20260914-fix_hpage_macro-v3-0-c9a305a01d39@arm.com>
 <20260914-fix_hpage_macro-v3-3-c9a305a01d39@arm.com>
 <b88f4ec0-61a8-47b0-901a-d63db115936c@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b88f4ec0-61a8-47b0-901a-d63db115936c@kernel.org>

On Mon, Sep 14, 2026 at 04:01:02PM +0200, David Hildenbrand (Arm) wrote:
> On 9/14/26 09:30, Yeoreum Yun wrote:
> > Introduce size_to_shift() for future users that need to
> > obtain shift of a huge-page which is other than pmd_psize().
> > 
> > Suggested-by: David Hildenbrand (Arm) <david@kernel.org>
> > Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> > ---
> >  tools/testing/selftests/mm/vm_util.c | 10 +++++++++-
> >  tools/testing/selftests/mm/vm_util.h |  1 +
> >  2 files changed, 10 insertions(+), 1 deletion(-)
> > 
> > diff --git a/tools/testing/selftests/mm/vm_util.c b/tools/testing/selftests/mm/vm_util.c
> > index fd1432dc6152..1fef1266429f 100644
> > --- a/tools/testing/selftests/mm/vm_util.c
> > +++ b/tools/testing/selftests/mm/vm_util.c
> > @@ -157,6 +157,14 @@ bool check_for_pattern(FILE *fp, const char *pattern, char *buf, size_t len)
> >  	return false;
> >  }
> >  
> > +uint64_t size_to_shift(uint64_t size)
> > +{
> > +	if (__builtin_popcountll(size) != 1)
> > +		return 0;
> > +
> > +	return ffsl(size) - 1;
> > +}
> 
> Could likely just be an inline helper?

Okay. If there is no comments on today, I'll post tomorrow with this.

-- 
Sincerely,
Yeoreum Yun
