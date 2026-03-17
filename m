Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33FCB37F752;
	Tue, 17 Mar 2026 05:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773726230; cv=none; b=jfWtf9l/3KezTqrr1Mr1S3sUpqRXPf5H3mKGyoS1EQNwiyo7p2lvxBuZqyPlsPfwfN71zeC5mSOUgb99YXsFJwQqmQ9KIK4nerdv2XlnxopE+a+/JL55IUp4+IJse7Fe6IF7HgcXpK2fDi3tFCRCj4SiF+rYIXoFqAuIS+ntw1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773726230; c=relaxed/simple;
	bh=aPJSwxGH6jNMzmpJsV3VWFn7DBqjxw2t4PJgg3D/cuw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XDf1fZVbvU8URTV3cQ0JdU/Sg8L7nhQNbVkYHkGmF5m8U3qM+n+8o4/V7JWmNBXYSof5XgxvVYgK4Ytt86eibrx0Onak4UeneWMy0T581F7xiGrIqVoTvmJ8rmls4s+BXLp67bMBSbnw5U8EWMWKUoaa5pAFGVRMJIefZuMiNXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P9P16qWF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P9P16qWF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4F8FC4CEF7;
	Tue, 17 Mar 2026 05:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773726229;
	bh=aPJSwxGH6jNMzmpJsV3VWFn7DBqjxw2t4PJgg3D/cuw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P9P16qWF5ooL+iMl2PrfJJDFMJjHxAx856NDb9rJnaSJVoH6HeaE40ymfvWrF6dgt
	 IDNO+1BU/L7bQpZB16aPEttGPgQNyCUp4LydF7OAOEmA8DXIvpY022XOrostvXPJfK
	 hS246hpL/l+jgIOTok0YltjBZL0PggpEib3zodIQS4mXI3d7VwITGLJB6970J7qtlL
	 N4w+eNtWvGvkmRREB4Oz6K+ZFFzwMXrGqlVOMpbNztTrIcWnOAdTbgdagsBC8kpYme
	 QpQy5kurZ3x6/Kv5ncJlLstfAe7Q8y84BIOTxQDrHT3f5LGy5HVG7sBijUrA8DfB1w
	 1R5hkhGudmOxA==
Date: Tue, 17 Mar 2026 07:43:41 +0200
From: Mike Rapoport <rppt@kernel.org>
To: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
Cc: Breno Leitao <leitao@debian.org>,
	"David Hildenbrand (Arm)" <david@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH] selftests/mm: add THP sysfs interface test
Message-ID: <abjqDUpkezMfvCHz@kernel.org>
References: <20260309-thp_selftest_v2-v1-1-a00cef41da44@debian.org>
 <9cb63c24-eaff-4954-97d5-2a422a0401fc@lucifer.local>
 <abgJtJYQsGMPsTHr@gmail.com>
 <be860d86-75be-4c75-95ea-03bf79524be2@kernel.org>
 <abggyaVTdNe6n_ew@gmail.com>
 <c4cb6dfe-59b2-44e6-adbc-9ee63bed79fd@lucifer.local>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c4cb6dfe-59b2-44e6-adbc-9ee63bed79fd@lucifer.local>

On Mon, Mar 16, 2026 at 07:53:46PM +0000, Lorenzo Stoakes (Oracle) wrote:
> On Mon, Mar 16, 2026 at 09:02:33AM -0700, Breno Leitao wrote:
> > On Mon, Mar 16, 2026 at 03:44:14PM +0100, David Hildenbrand (Arm) wrote:
> > > On 3/16/26 14:47, Breno Leitao wrote:
> > > > On Mon, Mar 16, 2026 at 12:55:13PM +0000, Lorenzo Stoakes (Oracle) wrote:
> > > >> On Mon, Mar 09, 2026 at 05:00:34AM -0700, Breno Leitao wrote:
> > > >>> Add a shell-based selftest that exercises the full set of THP sysfs
> > > >>> knobs: enabled (global and per-size anon), defrag, use_zero_page,
> > > >>> hpage_pmd_size, shmem_enabled (global and per-size), shrink_underused,
> > > >>> khugepaged/ tunables, and per-size stats files.
> > > >>>
> > > >>> Each writable knob is tested for valid writes, invalid-input rejection,
> > > >>> idempotent writes, and mode transitions where applicable. All original
> > > >>> values are saved before testing and restored afterwards.
> > > >>>
> > > >>> The test uses the kselftest KTAP framework (ktap_helpers.sh) for
> > > >>> structured TAP 13 output, making results parseable by the kselftest
> > > >>> harness. The test plan is printed at the end since the number of test
> > > >>> points is dynamic (depends on available hugepage sizes and sysfs files).
> > > >>>
> > > >>> This is particularly useful for validating the refactoring of
> > > >>> enabled_store() and anon_enabled_store() to use sysfs_match_string()
> > > >>> and the new change_enabled()/change_anon_orders() helpers.
> > > >>>
> > > >>> Signed-off-by: Breno Leitao <leitao@debian.org>
> > > >>
> > > >> The test is broken locally for me, returning error code 127.
> > > >>
> > > >> I do appreciate the effort here, so I'm sorry to push back negatively, but I
> > > >> feel a bash script here is pretty janky, and frankly if any of these interfaces
> > > >> were as broken as this it'd be a major failure that would surely get picked up
> > > >> far sooner elsewhere.
> > > >>
> > > >> So while I think this might be useful as a local test for your sysfs interface
> > > >> changes, I don't think this is really suited to the mm selftests.
> > > >
> > > > That is totally fine. This test is what I have been using to test the
> > > > changes, and I decide to share it in case someone find it useful.
> > > >
> > > > Let's drop it.
> > >
> > > Out of interest, to we know why the test is failing for Lorenzo?
> >
> > I really don't know, but, it sounds like ktap was not found?
> 
> Yeah CONFIG_KUNIT is not set so could be :)

Nah, CONFIG_KUNIT has nothing to do with ktap_helpers.sh, probably your
environment does not bring in tools/testing/selftests/kselftest
 
> >
> > Then the first early-exit path hit:
> > ktap_skip_all "..."   # undefined → returns 127 exit "$KSFT_SKIP"
> > # expands to: exit "" → exits with last $? = 127
> >
> > > I agree that the test is a bit excessive, in particular when it comes to
> > > invalid/idempotent values etc. I could see some value for testing
> > > whether setting the modes keeps working, but also then I wonder if that
> > > is really something we'll be changing frequently (and that breaks easily).
> >
> > yea, I make it very excessive, because there were some intrinsics in
> > those sysfs that I was gettingit wrong when doing the intial conversion.
> >
> > So, the test is something that I trust now, and I found it useful when
> > finding regressiosn.
> >
> > Is is something that will chagne frequently? probably not!
> >
> > That said, would you like to have a simplified/different version of this
> > test?
> 
> In an ideal world we'd use kunit or something to assert it internal to the
> kernel I guess, but if we do have something scaled down it'd at least be nice to
> have in C? :)
> 
> I am not sure how useful it'd be though overall, I don't see us changing this
> too often and really we're more interested in asserting behaviour.
> 
> Sadly THP is inherently tricky to test generally because of its very nature, I
> wish we could have better test isolation etc.
> 
> See tools/testing/vma for a forlorn dream of kernel code being run in userland
> (but oh how the stubs/duplicate declarations/etc. are a pain).
> 
> I suspect THP could never be given the same treatment though! :)
> 
> Cheers, Lorenzo

-- 
Sincerely yours,
Mike.
