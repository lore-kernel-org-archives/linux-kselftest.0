Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0621247C10B;
	Tue, 15 Sep 2026 09:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789465649; cv=none; b=LL+F5mnm9rEFlHkPBvoKTZ6KgDx7DtVLJQFlfasE4hOC6+sY8PJT9oYv4uY7fVZzFuvSGCtIv8qelxXEyv3Veozx7e4H1n2t1ssE/8wGDpF2LdfOBT0eMM2GfbKV50MI4Q/nqvpt1lFULYPfXMMVnnCwJE/fh5mp2HsWboqkz5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789465649; c=relaxed/simple;
	bh=TgiYyAGTrTLCELCWwltNRoXatU+CAWXmARo8WzAWAuw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NyCm2+ha9AooPsREt/Y6pOQuEz0iPUsoMiRWGcbl7Kjohuyfi/2HFr5RbCyDAid48+625bIMjRDZH7vm572PoJbI+HBpylng046mh+FuI+K8Kf4xXIVhoLQes8du0Hwh5odB8wpKFrv1HDfoDcmr02hRT3eDbp+VvCKUAMQjSPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=cfMi/f1w; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="cfMi/f1w"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B05ED169C;
	Tue, 15 Sep 2026 02:47:22 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 468CE3F9A2;
	Tue, 15 Sep 2026 02:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789465646; bh=TgiYyAGTrTLCELCWwltNRoXatU+CAWXmARo8WzAWAuw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cfMi/f1wlLVTG20Jg2wnJ6+DbyNLJTUAHFTMYihB7bLYPbjDzjaujrlPV144QpPV8
	 XSl+d7YX01gX2yWrh42B5ii8sgq0sY8AEv8XA/835O7vsqb1KxpCDs4rzB+0+1PQAF
	 vbG/dZlaGXwMv7aR8+YBHgWDaIYqkeTcsSaiHCSg=
Date: Tue, 15 Sep 2026 10:47:20 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
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
Message-ID: <aqkUKDJYytjTsQvm@e129823.arm.com>
References: <20260914-fix_hpage_macro-v3-0-c9a305a01d39@arm.com>
 <20260914-fix_hpage_macro-v3-3-c9a305a01d39@arm.com>
 <b88f4ec0-61a8-47b0-901a-d63db115936c@kernel.org>
 <aqf_XGKDq6jH6pJW@e129823.arm.com>
 <c60fa1c7-ac83-4e41-9911-a426c6b42191@kernel.org>
 <aqkIQF6XcLeXSHWO@gremlin>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqkIQF6XcLeXSHWO@gremlin>

On Tue, Sep 15, 2026 at 10:01:58AM +0100, Lorenzo Stoakes (ARM) wrote:
> On Mon, Sep 14, 2026 at 04:08:30PM +0200, David Hildenbrand (Arm) wrote:
> > On 9/14/26 16:06, Yeoreum Yun wrote:
> > > On Mon, Sep 14, 2026 at 04:01:02PM +0200, David Hildenbrand (Arm) wrote:
> > >> On 9/14/26 09:30, Yeoreum Yun wrote:
> > >>> Introduce size_to_shift() for future users that need to
> > >>> obtain shift of a huge-page which is other than pmd_psize().
> > >>>
> > >>> Suggested-by: David Hildenbrand (Arm) <david@kernel.org>
> > >>> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> > >>> ---
> > >>>  tools/testing/selftests/mm/vm_util.c | 10 +++++++++-
> > >>>  tools/testing/selftests/mm/vm_util.h |  1 +
> > >>>  2 files changed, 10 insertions(+), 1 deletion(-)
> > >>>
> > >>> diff --git a/tools/testing/selftests/mm/vm_util.c b/tools/testing/selftests/mm/vm_util.c
> > >>> index fd1432dc6152..1fef1266429f 100644
> > >>> --- a/tools/testing/selftests/mm/vm_util.c
> > >>> +++ b/tools/testing/selftests/mm/vm_util.c
> > >>> @@ -157,6 +157,14 @@ bool check_for_pattern(FILE *fp, const char *pattern, char *buf, size_t len)
> > >>>  	return false;
> > >>>  }
> > >>>
> 
> Probably worth a comment here saying it's only for power-of-two sizes.

Okay.

> 
> > >>> +uint64_t size_to_shift(uint64_t size)
> > >>> +{
> > >>> +	if (__builtin_popcountll(size) != 1)
> 
> I wonder if it wouldn't be better to just do the old trick of:
> 
> 	if (!size || (size & (size - 1)))
> 		return 0;
> 
> ?
> 
> > >>> +		return 0;
> > >>> +
> > >>> +	return ffsl(size) - 1;
> > >>> +}
> > >>
> > >> Could likely just be an inline helper?
> > >
> > > Okay. If there is no comments on today, I'll post tomorrow with this.
> > >
> >
> > No need to rush, leave some more days for people to catch up.
> 
> Agree with David seems better as an inline thing, the __builtin_xxx() should
> be... built-in hopefully :P though I suggest something that wouldn't need that.

Whatever is, okay. I'll change with old-classic trick :)
> 
> As long as strings.h is included in the header ofc for ffsl().
> 
> With the stuff above addressed, seems fine to me so:
> 
> Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

Thanks!

> 
> >
> > --
> > Cheers,
> >
> > David
> 
> --
> Cheers, Lorenzo

-- 
Sincerely,
Yeoreum Yun
