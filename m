Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B37B3DB64B;
	Mon, 16 Mar 2026 19:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773690831; cv=none; b=d8aLL8SV5SUN01D2K0vBdNaH+yosSVa45rWlngie4HamIWjifUIULQ2+i4wtD3zkQhuTvmfmS/vvo5E3Qq225mxf/tCtw+Gh4sTUDb0EHo0S1Vs+s05+3eOetAZSU1Fw08etIXb0J7FRUABMPliTDpnN8LN+ftE7xV7jDzLm5H8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773690831; c=relaxed/simple;
	bh=4gAWIaQHRU4NRXeDrvanjMXhFCTsNn7ar/qA+AJSFaY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WYT0NpzjUGWyuklrVQSyAmQqmhlQsq2hkPxx5him1X06PDtfN+97sRfiAuVQ/cnY/ADj6UQOdUP0VY+l6geLUFHgwPh2yTUFY5hd2egQemtvfsQt2q3ov5e8yg9tK3YHHRfY+rRQM+Hvl4cMUbQM/xqrVHt+G+IxKQyWu7I/au0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t18WZDn9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t18WZDn9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC2C4C19421;
	Mon, 16 Mar 2026 19:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773690830;
	bh=4gAWIaQHRU4NRXeDrvanjMXhFCTsNn7ar/qA+AJSFaY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t18WZDn9tATEb4JJzJCP9h4y8am1c2DaDUz3D/4c3LR1CanJ8UkdHvKzHoDrkzqwo
	 cnZqDSmkqMxoaOazN6kyMRySPjKL5FflxSUqcK1EHqAmR2/5ZPN/yWm6x8ymrAIIFs
	 76t6R/a7DYawFl64pYb1e0E58DrnNlZ6BIUZ2q0+NiAg2ois1UX6KCQjfJUgfoKW7r
	 96YqIgjC03vZMIEz6U7rVSTMNEd13dqxfQ8IpR6bwDwrNQJ3W9SJLAFJCCnd37UYNl
	 3/0fB29fX9RoRMAkTQMLtatWLzapsdev43Tee2b0HtWmPSjLY0SEr6XhrqWzmZYj0B
	 OoMZNIGvNHjUg==
Date: Mon, 16 Mar 2026 19:53:46 +0000
From: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
To: Breno Leitao <leitao@debian.org>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	kernel-team@meta.com
Subject: Re: [PATCH] selftests/mm: add THP sysfs interface test
Message-ID: <c4cb6dfe-59b2-44e6-adbc-9ee63bed79fd@lucifer.local>
References: <20260309-thp_selftest_v2-v1-1-a00cef41da44@debian.org>
 <9cb63c24-eaff-4954-97d5-2a422a0401fc@lucifer.local>
 <abgJtJYQsGMPsTHr@gmail.com>
 <be860d86-75be-4c75-95ea-03bf79524be2@kernel.org>
 <abggyaVTdNe6n_ew@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <abggyaVTdNe6n_ew@gmail.com>

On Mon, Mar 16, 2026 at 09:02:33AM -0700, Breno Leitao wrote:
> On Mon, Mar 16, 2026 at 03:44:14PM +0100, David Hildenbrand (Arm) wrote:
> > On 3/16/26 14:47, Breno Leitao wrote:
> > > On Mon, Mar 16, 2026 at 12:55:13PM +0000, Lorenzo Stoakes (Oracle) wrote:
> > >> On Mon, Mar 09, 2026 at 05:00:34AM -0700, Breno Leitao wrote:
> > >>> Add a shell-based selftest that exercises the full set of THP sysfs
> > >>> knobs: enabled (global and per-size anon), defrag, use_zero_page,
> > >>> hpage_pmd_size, shmem_enabled (global and per-size), shrink_underused,
> > >>> khugepaged/ tunables, and per-size stats files.
> > >>>
> > >>> Each writable knob is tested for valid writes, invalid-input rejection,
> > >>> idempotent writes, and mode transitions where applicable. All original
> > >>> values are saved before testing and restored afterwards.
> > >>>
> > >>> The test uses the kselftest KTAP framework (ktap_helpers.sh) for
> > >>> structured TAP 13 output, making results parseable by the kselftest
> > >>> harness. The test plan is printed at the end since the number of test
> > >>> points is dynamic (depends on available hugepage sizes and sysfs files).
> > >>>
> > >>> This is particularly useful for validating the refactoring of
> > >>> enabled_store() and anon_enabled_store() to use sysfs_match_string()
> > >>> and the new change_enabled()/change_anon_orders() helpers.
> > >>>
> > >>> Signed-off-by: Breno Leitao <leitao@debian.org>
> > >>
> > >> The test is broken locally for me, returning error code 127.
> > >>
> > >> I do appreciate the effort here, so I'm sorry to push back negatively, but I
> > >> feel a bash script here is pretty janky, and frankly if any of these interfaces
> > >> were as broken as this it'd be a major failure that would surely get picked up
> > >> far sooner elsewhere.
> > >>
> > >> So while I think this might be useful as a local test for your sysfs interface
> > >> changes, I don't think this is really suited to the mm selftests.
> > >
> > > That is totally fine. This test is what I have been using to test the
> > > changes, and I decide to share it in case someone find it useful.
> > >
> > > Let's drop it.
> >
> > Out of interest, to we know why the test is failing for Lorenzo?
>
> I really don't know, but, it sounds like ktap was not found?

Yeah CONFIG_KUNIT is not set so could be :)

>
> Then the first early-exit path hit:
> ktap_skip_all "..."   # undefined → returns 127 exit "$KSFT_SKIP"
> # expands to: exit "" → exits with last $? = 127
>
> > I agree that the test is a bit excessive, in particular when it comes to
> > invalid/idempotent values etc. I could see some value for testing
> > whether setting the modes keeps working, but also then I wonder if that
> > is really something we'll be changing frequently (and that breaks easily).
>
> yea, I make it very excessive, because there were some intrinsics in
> those sysfs that I was gettingit wrong when doing the intial conversion.
>
> So, the test is something that I trust now, and I found it useful when
> finding regressiosn.
>
> Is is something that will chagne frequently? probably not!
>
> That said, would you like to have a simplified/different version of this
> test?

In an ideal world we'd use kunit or something to assert it internal to the
kernel I guess, but if we do have something scaled down it'd at least be nice to
have in C? :)

I am not sure how useful it'd be though overall, I don't see us changing this
too often and really we're more interested in asserting behaviour.

Sadly THP is inherently tricky to test generally because of its very nature, I
wish we could have better test isolation etc.

See tools/testing/vma for a forlorn dream of kernel code being run in userland
(but oh how the stubs/duplicate declarations/etc. are a pain).

I suspect THP could never be given the same treatment though! :)

Cheers, Lorenzo
