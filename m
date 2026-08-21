Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D70A45A288;
	Fri, 21 Aug 2026 10:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787309080; cv=none; b=Q4vN3LLO6jvK/gb8oVCVIBovA0z1wrRgB1XdqAjvxJRU1nqUFT+N/u8K15UWR10QYVUfeUkC/8omBKEVMfce444fpKjYGB5nr4plrGI+wR0jlJMXWx5BI31qe1oFjv3MzSbWlp4/A6D4B6qIy1zlVxCfH3VlymHsScVd0uofHoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787309080; c=relaxed/simple;
	bh=CnfL1nj9gT80ZwyvDs7PBgljaH1xw0anGnW9NKCM//M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kz/fKP73KzQnwOyPh0R17cInrqFmkk2u48gHdh7oD5fo/7obNH7Tqf8EKUVdhWBW15gNUU/EpEOK/O5xKQG+myinpYL3sy/Em4wCHR1jEoRVMnO+Fk+Hj0Pk3UzDXckatqXcUKPJu6ruWBsVj9GZB2otRiionjGgfnCi2Mdwh38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fZcYv/iN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fZcYv/iN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BC2E1F000E9;
	Fri, 21 Aug 2026 10:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787309078;
	bh=OEV1uuB0ujnXPKaY+Wk+sXi2Lz9xQB5FZ/QqRMb9zEE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fZcYv/iNpqmmH+eXzN1nlKAbp1671QSKAZLHzfydCp+CXLyRzutsB18WhFHNCJKXq
	 0w2cjHsawvgyRkYVvb+l3Nr7gofGMxxh8a4PAa0AtIucWl4l+mGuMsFuiML8kiu2i1
	 6SxcUq9zyGgn5sUOf28BjtENDZVSngJRHwHIYmA0e0KRndnvXUXCPFskUoYc1nvPqO
	 A1PdLfBTAnyQgRKrnl04YMB0b2ELcWkk7Rca7CAmOJze/P3hN1iGdertvDAlQT4Zj9
	 Xb30GgCCk0QAzjqAJdrlfVLcZUE8U8qSeusK5dpdk/paoZI+YDjx/qThpyLnQBrjYF
	 BW+ntHcWp9V7g==
Date: Fri, 21 Aug 2026 11:44:32 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Jason Miu <jasonmiu@google.com>, Shuah Khan <shuah@kernel.org>, 
	David Rientjes <rientjes@google.com>, Shakeel Butt <shakeel.butt@linux.dev>, 
	"Liam R . Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Greg Thelen <gthelen@google.com>, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org
Subject: Re: [RFC PATCH 0/3] selftests: mm: introduce page allocation stall
 reproducer
Message-ID: <aogrd9knfBUGH885@gremlin>
References: <20260819070538.2404983-1-jasonmiu@google.com>
 <20260820170348.48f04ed654dce5193ca3a532@linux-foundation.org>
 <59525a3e-6003-4ab1-bd75-e0c7dcc8a257@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <59525a3e-6003-4ab1-bd75-e0c7dcc8a257@kernel.org>

On Fri, Aug 21, 2026 at 11:53:57AM +0200, David Hildenbrand (Arm) wrote:
> On 8/21/26 02:03, Andrew Morton wrote:
> > On Wed, 19 Aug 2026 00:05:35 -0700 Jason Miu <jasonmiu@google.com> wrote:
> >
> >> Background
> >> ==========
> >> Under severe system memory pressure, system unresponsiveness often
> >> occurs due to page allocation stalls. In commit 94e0bcde055e ("mm,
> >> page_alloc: reintroduce page allocation stall warning"), David Rientjes
> >> introduced a warning mechanism to emit a kernel log when a page
> >> allocation takes longer than 10 seconds. This log is used to correlate
> >> a frozen system with the system memory state at the time of failure.
> >>
> >> To further debug and analyze these allocation stalls, we need a
> >> reproducible test case. This patch series introduces a new selftest
> >> designed to artificially mimic the severe memory pressure scenarios
> >> seen in production, allowing us to observe the resulting allocation
> >> stalls.
> >
> > Interesting.
> >
> >>  lib/Kconfig.debug                             |  11 +
> >>  lib/Makefile                                  |   1 +
> >>  lib/test_mempress_timer.c                     | 140 +++++++++++
> >>  .../testing/selftests/mm/page_alloc_stall.sh  |  80 ++++++
> >>  .../selftests/mm/page_alloc_stall_pressure.py | 235 ++++++++++++++++++
> >>  5 files changed, 467 insertions(+)
> >>  create mode 100644 lib/test_mempress_timer.c
> >>  create mode 100644 tools/testing/selftests/mm/page_alloc_stall.sh
> >>  create mode 100644 tools/testing/selftests/mm/page_alloc_stall_pressure.py
> >
> > Nothing fits very well, does it?
> >
>
> Why are we mixing python and sh?

Oh HELL no.

Only C in the selftests please.

And python is replete with 'getting it to run locally' issues. I have venv
PTSD...

>
> >
> >
> > selftests is for quick tests which are run by run_kselftest.sh.  You
> > had to place it in selftests because there isn't anywhere obvious for
> > it to live.
> >
> > So I suggest a brand new tools/testing/stresstests/mm.  If we create
> > this, people will jump on it and start adding things which presently
> > reside in their personal collections.
>
> There was recently a discussion around performance tests, and one thought was to
> not carry these in the kernel tree at all.
>
> Stresstests, not sure.
>
> So agreed, that this shouldn't be an ordinary selftests (nothing we would want
> to run autoamtically), but I am also not 100% sure about having performance /
> stress tests in the kernel tree. It's all stuff we have to maintain and drag along.

Agreed. Separate please.

Stress tests are just asking for flakes :) they are useful + important but
something different.

>
> >
> >
> >
> > I can't say I like "mempress".  Is "memory_pressure" too wordy?
> >
> >
> >
> > All of lib/test*.c shouldn't be in lib/.  lib/ is for library code!
> > Again, we put them there because people are shy about doing mkdir.
>
> There were recent discussions where I raised the same. I would prefer if testing
> kernel modules are somewhere in tools/testing/ if possible.

Yes.

>
>
> --
> Cheers,
>
> David

--
Cheers, Lorenzo
