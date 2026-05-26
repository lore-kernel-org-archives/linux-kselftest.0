Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D31352C34;
	Tue, 26 May 2026 12:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779798868; cv=none; b=LOJ09oWaVqpYEyiAzvN8SRO25pRIZNYNNg8UhIiIOIIa1F62BBFvGHYgeHYhcNRDEDgWggYN0K9SRzNTx/Lr7KStQk2bKx2dAtiAt+0TdnrJwx+tSls0ITU34zzIu+7wMJW8CM80e4AnvTFltqROB7VTQ/S1cqkQZWOdZXw8sl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779798868; c=relaxed/simple;
	bh=mk/zjg0ab3m+7eKgcFNXydgbAosfernUtmM1ABsyjwg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DpdhkiI8GzUKelx//7PLcj3du8NpyvcnvfIHNW3FLX3SFYaDRI23zsB3mK5efJ/u5pmmyQLAx0R+OLYK36AoIYcDKhQnzzi4NSy0obQGylU5IrTXEBTrXZGGuhKI19+rwGmKcsEFUhJRSXk5i4m537P7z9QF4tLaSjXcjtnePNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RmVzUO2d; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RmVzUO2d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B5C01F00A3A;
	Tue, 26 May 2026 12:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779798867;
	bh=hmoINqMgVgeubIA80Me9ZHWv15KWusGbb1TzukRmFSk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RmVzUO2ddb4EKCFTrOtfA0cRTCa7E3Y7UkKTIOgQrmtOcTBWRjWqN/mKjD3Nf0j/0
	 FdpY6rPRp5mwIGNeoyS/Jfh+a9rycednulXrTjh3e8/XdXVBJUOYwi/MzFnf1nmuTw
	 YS6zEF8tUuYbMkBDMBXuAy4ywWUYKYRlRcF0+NsD5LOW2bs8VXDh8U4RzSCUcj/AO2
	 cBcuf4qP6WJ2IANsM/9A6Y/h+FjzcIOTv4J/zVJv1rdqmFQ0OnIqfGpSzBBstFTGlZ
	 0Ap7zIzxAQllaqYuJOqGfvIdgAj99GATDe4GdEWrX/tD4pDyu+mvB2InmD5odu4mZk
	 l48kefwwgBy7Q==
Date: Tue, 26 May 2026 15:34:15 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Sarthak Sharma <sarthak.sharma@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>,
	Peter Xu <peterx@redhat.com>, Leon Romanovsky <leon@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
	Lance Yang <lance.yang@linux.dev>, Mark Brown <broonie@kernel.org>,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v3 1/4] tools/lib/mm: add shared file helpers
Message-ID: <ahWTRy5gkaeFW7m7@kernel.org>
References: <20260521111801.173019-1-sarthak.sharma@arm.com>
 <20260521111801.173019-2-sarthak.sharma@arm.com>
 <177964236205.4000040.3083558454897469696.b4-review@b4>
 <ff7d212c-d3e0-4476-8903-ffe88fb7048c@arm.com>
 <ahVhTWl0fTF3ASsC@kernel.org>
 <70a9008b-8b13-44f4-81b4-2397b4ccd323@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <70a9008b-8b13-44f4-81b4-2397b4ccd323@arm.com>

On Tue, May 26, 2026 at 05:38:29PM +0530, Sarthak Sharma wrote:
> On 5/26/26 2:31 PM, Mike Rapoport wrote:
> > On Mon, May 25, 2026 at 11:59:32AM +0530, Sarthak Sharma wrote:
> >> On 5/24/26 10:36 PM, Mike Rapoport wrote:
> >>>
> >>> and while EXIT_FAILURE == KSFT_FAIL I'm not sure it's robust enough.
> >>
> >> I used EXIT_FAILURE here because the helper is moving out of selftests
> >> and should not include kselftest.h anymore. The helper already
> >> terminated the process on these paths, so I tried to preserve that
> >> behavior while removing the ksft dependency.
> > 
> > In mm selftests a failure to update a /proc or /sysfs file meant there is
> > no point to continue the test. But if we make it a generic helper for
> > potentially broader use than mm selftests, exit() on failure is too harsh.
> 
> Okay yeah, this makes sense.
> 
> >  
> >> We can change this to return errors instead of calling exit() and update
> >> the selftest callers to report failures through the ksft_* helpers. I
> >> agree this is cleaner, but it would grow the series a bit.
> >>
> >> If you feel strongly, I can include these changes in v4. Otherwise I
> >> feel we can handle it separately later to avoid growing this series.
> > 
> > There are not that many callers of write_file() and write_num().
> > I think a patch that makes them return an error rather than exit() can go
> > before moving these functions to lib. 
> > 
> 
> So I will add a patch before the move that makes read_file(),
> write_file(), read_num() and write_num() return errors instead of
> exiting and update the existing selftest callers to report those
> failures via ksft_* helpers.
> 
> For hugepage_settings.c, I’d prefer to keep the existing fail fast
> behaviour in this series. After this series, the users are still mm
> selftests and the new tools/mm/gup_bench tool and for those users a
> failure to read/write THP or HugeTLB state is fatal to the operation
> being attempted.
> 
> Converting the full hugepage_settings API to return errors would be a
> larger follow-up, because many of its helpers are used throughout mm
> selftests. I can handle that in a separate series unless you think it
> should be folded into this one as well.

Keeping fail fast in hugepage_settings for now makes sense, they are not as
generic as write_file().

-- 
Sincerely yours,
Mike.
