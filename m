Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97C5F25A2C6;
	Tue, 17 Mar 2026 08:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773737129; cv=none; b=YFq24GT+OMO9jdu7gqP7aIvAK0qAI17Z+cbGMdfAYliUK1XxcBYILyu0/SXq7MYp0XdUoF/WN8m3pqeZ1UJml/8P2GUf529M5Rpz0/p43XVFpS6sWx555rYJ9rZdl9avHlJ6vU8ApQCeKs67/zkSOM/rI1I4oAlLoqwjptVJcuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773737129; c=relaxed/simple;
	bh=Zo6yw1mAyD4MxWYXRaqbuKoO6iygTs63aqmw/CfuPrg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Whx6rFKa/UY5rUnxz9TIedA6i8RgoCb+hABze9GZRWs5fPL/egotVQdzV0SO2KnmjsZaFdnAWzF/d+JvCTB8IiySyVBDuRXgV1QgTolasJl/5Ja39QzCrMAJnGEEgwPzp085CLG61Eo2gGKaEbyr5D8BTuO9yr09rjDvxJeh7ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MWxjrMp6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MWxjrMp6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 030A7C4CEF7;
	Tue, 17 Mar 2026 08:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773737129;
	bh=Zo6yw1mAyD4MxWYXRaqbuKoO6iygTs63aqmw/CfuPrg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MWxjrMp6K6R0o7Q+bJjI/SPcVgg9uRqw/NVogBDNxIxU9g+kLl75KBSwQX5Csh6cb
	 kG/Fh4usrU4Bxg6jLTPYjtwjSwhygytDx8iHL9EzTZVGRzvysQIs3vVgow1v6zwzHn
	 DlVE35GFI1HhCiQF7kujveQbDItw8iBNN8eIHFbifDxvbSxL9uM4S7VX2574LL8cSA
	 NMTL78OKHQN0yxnvssG4DPRjQjSvJcoQKfaXWHVgtO4ci80ffsCjuRpLq9E7Whv/Bh
	 MGtvCBCmZl6yah5annGFpUIfg2eu4z8GMBXnFJQUFqzUMq4smisQw3egIkvO/Ri7h7
	 00RS8mnGk7/Kg==
Date: Tue, 17 Mar 2026 08:45:24 +0000
From: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: Breno Leitao <leitao@debian.org>, 
	"David Hildenbrand (Arm)" <david@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	kernel-team@meta.com
Subject: Re: [PATCH] selftests/mm: add THP sysfs interface test
Message-ID: <51a4855d-89cf-49e7-bd4f-f0ba13f23102@lucifer.local>
References: <20260309-thp_selftest_v2-v1-1-a00cef41da44@debian.org>
 <9cb63c24-eaff-4954-97d5-2a422a0401fc@lucifer.local>
 <abgJtJYQsGMPsTHr@gmail.com>
 <be860d86-75be-4c75-95ea-03bf79524be2@kernel.org>
 <abggyaVTdNe6n_ew@gmail.com>
 <c4cb6dfe-59b2-44e6-adbc-9ee63bed79fd@lucifer.local>
 <abjqDUpkezMfvCHz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abjqDUpkezMfvCHz@kernel.org>

On Tue, Mar 17, 2026 at 07:43:41AM +0200, Mike Rapoport wrote:
> On Mon, Mar 16, 2026 at 07:53:46PM +0000, Lorenzo Stoakes (Oracle) wrote:
> > On Mon, Mar 16, 2026 at 09:02:33AM -0700, Breno Leitao wrote:
> > > On Mon, Mar 16, 2026 at 03:44:14PM +0100, David Hildenbrand (Arm) wrote:
> > > > On 3/16/26 14:47, Breno Leitao wrote:
> > > > > On Mon, Mar 16, 2026 at 12:55:13PM +0000, Lorenzo Stoakes (Oracle) wrote:
> > > > >> On Mon, Mar 09, 2026 at 05:00:34AM -0700, Breno Leitao wrote:
> > > > >>> Add a shell-based selftest that exercises the full set of THP sysfs
> > > > >>> knobs: enabled (global and per-size anon), defrag, use_zero_page,
> > > > >>> hpage_pmd_size, shmem_enabled (global and per-size), shrink_underused,
> > > > >>> khugepaged/ tunables, and per-size stats files.
> > > > >>>
> > > > >>> Each writable knob is tested for valid writes, invalid-input rejection,
> > > > >>> idempotent writes, and mode transitions where applicable. All original
> > > > >>> values are saved before testing and restored afterwards.
> > > > >>>
> > > > >>> The test uses the kselftest KTAP framework (ktap_helpers.sh) for
> > > > >>> structured TAP 13 output, making results parseable by the kselftest
> > > > >>> harness. The test plan is printed at the end since the number of test
> > > > >>> points is dynamic (depends on available hugepage sizes and sysfs files).
> > > > >>>
> > > > >>> This is particularly useful for validating the refactoring of
> > > > >>> enabled_store() and anon_enabled_store() to use sysfs_match_string()
> > > > >>> and the new change_enabled()/change_anon_orders() helpers.
> > > > >>>
> > > > >>> Signed-off-by: Breno Leitao <leitao@debian.org>
> > > > >>
> > > > >> The test is broken locally for me, returning error code 127.
> > > > >>
> > > > >> I do appreciate the effort here, so I'm sorry to push back negatively, but I
> > > > >> feel a bash script here is pretty janky, and frankly if any of these interfaces
> > > > >> were as broken as this it'd be a major failure that would surely get picked up
> > > > >> far sooner elsewhere.
> > > > >>
> > > > >> So while I think this might be useful as a local test for your sysfs interface
> > > > >> changes, I don't think this is really suited to the mm selftests.
> > > > >
> > > > > That is totally fine. This test is what I have been using to test the
> > > > > changes, and I decide to share it in case someone find it useful.
> > > > >
> > > > > Let's drop it.
> > > >
> > > > Out of interest, to we know why the test is failing for Lorenzo?
> > >
> > > I really don't know, but, it sounds like ktap was not found?
> >
> > Yeah CONFIG_KUNIT is not set so could be :)
>
> Nah, CONFIG_KUNIT has nothing to do with ktap_helpers.sh, probably your
> environment does not bring in tools/testing/selftests/kselftest

Yeah I copy the mm tests to /mnt in vng before running to avoid ro
filesystem issues.

Not a fan of us relying on the entire tree structure being there either
then :)

Cheers, Lorenzo
