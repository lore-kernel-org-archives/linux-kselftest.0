Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1101D21A95D;
	Mon, 16 Mar 2026 16:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773676977; cv=none; b=MxBIMgSNHPCY0zzXZfmswEBu+lXnEytS++czllS4RpaOSbmeREZ4jwo0lf0YCplh2XWJchj3pjZeSMyAyh9HCkb0/ZiWuftaJlbPjZNeAP7LZwU+QLiP2vse3UzeFJvealQigw0+IELtfQRDVyt2QRiFmHVKFKypjvUXAEjEzCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773676977; c=relaxed/simple;
	bh=iH4ZmIE7get/TI4IYPCISY4ctgd+qoJ3FkNVlSbJAoo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ATN3VRpY/BdJOrVBxLikf41QxVWIViHsDZ8bxi0Ig1JvXNUtcThR3e/JCafzIESQ//Jvfkw90ZSaaxEYSzZrU6hkoiJzJMIK/AUVJGfcEC+VyFhXpRuFzpN+ps1+8oJ3imitz7Uz51e/Zu2Vs/UmGTQvwFeIGZuF0ISq5Txo7W8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=none smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=vZzqMjx+; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="vZzqMjx+"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-ID:Content-Description;
	bh=RPhGdp8fS2iuoiGh9J6Zs2sMJGA6LuqofK+hwfYa/c4=; b=vZzqMjx+Q8KfhCEsnw3DRTL4ld
	m39k9jPQmfZqhTm3Ikq3r/0OvExw8PYxYd79qiuIaC75ra3iTFpCiMEzAWx5BkH8LMInmwCYDH5/l
	NMYJVctNa7QW8e2VbCtqIXclWbtot6UU6hCgVR6/w9c4mEjLsJFIvgbBuu0rJJ9OraH+N46rfkMXV
	ued/6MZJDtNN5xGhj/ZOeCv+0W8UxBinKrBE1/G924FzyIOlbcbnbOw9XTa3ozbltP+0knw+H0o6t
	tTj6rJZSzdoSnrh7iGsvE8iQH1wVu4OSoz+RWRylJThICWqPRzygOyHTgiXrS++JK14EAblugBuGE
	VMy4q2ew==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.94.2)
	(envelope-from <leitao@debian.org>)
	id 1w2AOz-002E9E-13; Mon, 16 Mar 2026 16:02:43 +0000
Date: Mon, 16 Mar 2026 09:02:33 -0700
From: Breno Leitao <leitao@debian.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	kernel-team@meta.com
Subject: Re: [PATCH] selftests/mm: add THP sysfs interface test
Message-ID: <abggyaVTdNe6n_ew@gmail.com>
References: <20260309-thp_selftest_v2-v1-1-a00cef41da44@debian.org>
 <9cb63c24-eaff-4954-97d5-2a422a0401fc@lucifer.local>
 <abgJtJYQsGMPsTHr@gmail.com>
 <be860d86-75be-4c75-95ea-03bf79524be2@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <be860d86-75be-4c75-95ea-03bf79524be2@kernel.org>
X-Debian-User: leitao

On Mon, Mar 16, 2026 at 03:44:14PM +0100, David Hildenbrand (Arm) wrote:
> On 3/16/26 14:47, Breno Leitao wrote:
> > On Mon, Mar 16, 2026 at 12:55:13PM +0000, Lorenzo Stoakes (Oracle) wrote:
> >> On Mon, Mar 09, 2026 at 05:00:34AM -0700, Breno Leitao wrote:
> >>> Add a shell-based selftest that exercises the full set of THP sysfs
> >>> knobs: enabled (global and per-size anon), defrag, use_zero_page,
> >>> hpage_pmd_size, shmem_enabled (global and per-size), shrink_underused,
> >>> khugepaged/ tunables, and per-size stats files.
> >>>
> >>> Each writable knob is tested for valid writes, invalid-input rejection,
> >>> idempotent writes, and mode transitions where applicable. All original
> >>> values are saved before testing and restored afterwards.
> >>>
> >>> The test uses the kselftest KTAP framework (ktap_helpers.sh) for
> >>> structured TAP 13 output, making results parseable by the kselftest
> >>> harness. The test plan is printed at the end since the number of test
> >>> points is dynamic (depends on available hugepage sizes and sysfs files).
> >>>
> >>> This is particularly useful for validating the refactoring of
> >>> enabled_store() and anon_enabled_store() to use sysfs_match_string()
> >>> and the new change_enabled()/change_anon_orders() helpers.
> >>>
> >>> Signed-off-by: Breno Leitao <leitao@debian.org>
> >>
> >> The test is broken locally for me, returning error code 127.
> >>
> >> I do appreciate the effort here, so I'm sorry to push back negatively, but I
> >> feel a bash script here is pretty janky, and frankly if any of these interfaces
> >> were as broken as this it'd be a major failure that would surely get picked up
> >> far sooner elsewhere.
> >>
> >> So while I think this might be useful as a local test for your sysfs interface
> >> changes, I don't think this is really suited to the mm selftests.
> > 
> > That is totally fine. This test is what I have been using to test the
> > changes, and I decide to share it in case someone find it useful.
> > 
> > Let's drop it.
> 
> Out of interest, to we know why the test is failing for Lorenzo?

I really don't know, but, it sounds like ktap was not found?

Then the first early-exit path hit:
ktap_skip_all "..."   # undefined → returns 127 exit "$KSFT_SKIP"
# expands to: exit "" → exits with last $? = 127

> I agree that the test is a bit excessive, in particular when it comes to
> invalid/idempotent values etc. I could see some value for testing
> whether setting the modes keeps working, but also then I wonder if that
> is really something we'll be changing frequently (and that breaks easily).

yea, I make it very excessive, because there were some intrinsics in
those sysfs that I was gettingit wrong when doing the intial conversion.

So, the test is something that I trust now, and I found it useful when
finding regressiosn.

Is is something that will chagne frequently? probably not!

That said, would you like to have a simplified/different version of this
test?
