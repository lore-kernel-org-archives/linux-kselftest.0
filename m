Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A6A640D587;
	Tue, 15 Sep 2026 09:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789462927; cv=none; b=ifBGbY+2o3hR9QPCqxK48nBW48EI+8wKQqmbxRFJBpeUCE3BzSaU2BlumA75vpq0/qyjDWEQVJYE0kfqTyoaPKstaEAwe5AsDRG3uBh5LEvlA4j8zt8Jdf7z0McHGQaFNrFpMdQlSlSFBjScl1Fmmy1K19+8Ojm256Wngtig8ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789462927; c=relaxed/simple;
	bh=2x8L4NWTmd8kDyAA2w/QCGNQliJZPTZmbGNXmqyovgk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jkiHOk+FQdT88yFE1loAcoxqTijddgVVwWaNjEWD4D/YCy0JgcvNo6z28ufkK85xUf6qAKe9vj4b1CzpMn6ZWYxcQj+OlRDMo3deHzdOu9+RTgailkwXXFPSZpMPhCDexnE3oc+OCz02pjHQ7Q/OQvAZ4+SwHiLo3JQGIDrP0RA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MW8hwpwx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MW8hwpwx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C69E91F000FF;
	Tue, 15 Sep 2026 09:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789462926;
	bh=gDJQ+Dp4XqFFM9jA+QlPrk7mPj7e5HiBfLcieYIKpAo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MW8hwpwxQWyiTItd2rjqwSdxeCZaHtwFUMRokpaoIrX7DjTl+xaqQB1RN9wDImwXB
	 S7Msymu2OHWAYoza2Qx9eCGexwt4JTDSq316ER5Sayob1v8cq5aIZ92Ck3AGqYbmLx
	 XrIDhQT2nsrhfl6AKMSe66hHWV1JCiWAEl2HgcpvWv+UvNRdlVk4PCOM9ksSbmVpe8
	 gA1FWSdRvFGJNBlHZHntpDh2bBjDNdbvTk//WKWw5rQ9zYr/vWrrkUHJ3O5ucU/A6d
	 LmIQALw0VxViUcPA4tRUjG6LqlNq1scX8ynlU3xr97wemdwTKqel7oJt8AXeUtHjoK
	 8qTclbYIbQ1Jw==
Date: Tue, 15 Sep 2026 10:01:58 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <nico.pache@linux.dev>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Peter Xu <peterx@redhat.com>, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Leon Romanovsky <leon@kernel.org>, Sarthak Sharma <sarthak.sharma@arm.com>
Subject: Re: [PATCH v3 3/3] kselftest: mm: introduce size_to_shift() helper
Message-ID: <aqkIQF6XcLeXSHWO@gremlin>
References: <20260914-fix_hpage_macro-v3-0-c9a305a01d39@arm.com>
 <20260914-fix_hpage_macro-v3-3-c9a305a01d39@arm.com>
 <b88f4ec0-61a8-47b0-901a-d63db115936c@kernel.org>
 <aqf_XGKDq6jH6pJW@e129823.arm.com>
 <c60fa1c7-ac83-4e41-9911-a426c6b42191@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c60fa1c7-ac83-4e41-9911-a426c6b42191@kernel.org>

On Mon, Sep 14, 2026 at 04:08:30PM +0200, David Hildenbrand (Arm) wrote:
> On 9/14/26 16:06, Yeoreum Yun wrote:
> > On Mon, Sep 14, 2026 at 04:01:02PM +0200, David Hildenbrand (Arm) wrote:
> >> On 9/14/26 09:30, Yeoreum Yun wrote:
> >>> Introduce size_to_shift() for future users that need to
> >>> obtain shift of a huge-page which is other than pmd_psize().
> >>>
> >>> Suggested-by: David Hildenbrand (Arm) <david@kernel.org>
> >>> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> >>> ---
> >>>  tools/testing/selftests/mm/vm_util.c | 10 +++++++++-
> >>>  tools/testing/selftests/mm/vm_util.h |  1 +
> >>>  2 files changed, 10 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/tools/testing/selftests/mm/vm_util.c b/tools/testing/selftests/mm/vm_util.c
> >>> index fd1432dc6152..1fef1266429f 100644
> >>> --- a/tools/testing/selftests/mm/vm_util.c
> >>> +++ b/tools/testing/selftests/mm/vm_util.c
> >>> @@ -157,6 +157,14 @@ bool check_for_pattern(FILE *fp, const char *pattern, char *buf, size_t len)
> >>>  	return false;
> >>>  }
> >>>

Probably worth a comment here saying it's only for power-of-two sizes.

> >>> +uint64_t size_to_shift(uint64_t size)
> >>> +{
> >>> +	if (__builtin_popcountll(size) != 1)

I wonder if it wouldn't be better to just do the old trick of:

	if (!size || (size & (size - 1)))
		return 0;

?

> >>> +		return 0;
> >>> +
> >>> +	return ffsl(size) - 1;
> >>> +}
> >>
> >> Could likely just be an inline helper?
> >
> > Okay. If there is no comments on today, I'll post tomorrow with this.
> >
>
> No need to rush, leave some more days for people to catch up.

Agree with David seems better as an inline thing, the __builtin_xxx() should
be... built-in hopefully :P though I suggest something that wouldn't need that.

As long as strings.h is included in the header ofc for ffsl().

With the stuff above addressed, seems fine to me so:

Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

>
> --
> Cheers,
>
> David

--
Cheers, Lorenzo
