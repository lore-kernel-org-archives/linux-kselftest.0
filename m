Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB9B2EBB8C;
	Sun, 26 Apr 2026 10:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777201126; cv=none; b=UPT/2to4lWYvK5gT+WBgPUdxw575UFe0oku1+Ye6FevTWkGyNAh9rWvhbM4V5kiHU95ZXxtfM1JxgJIBw2eOpub1sff4g2LpA++790B1c24m+G74Y8KycVSFr+OWfP+X8fuyNzGYT+dXHnxQvr+i/jFbW8jSihcNdGL/uMOX6nY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777201126; c=relaxed/simple;
	bh=mkkI+lXLMcbjVq5S0Bvo04h/9+PSK8v/F/iMiEKV2hw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vg9z8Hs6wdxdrgS9zo+6ljhrpPLD4DE7VLRrmUJVly9F8VU2v+q6Jq4LnuH4R0WI9WswROL4InUlt7qf1Dc8XBViNU0iOVsnUBPqLICPeIyc9uB5E8aopAZuDU7D1r6rl1234qJ80vCQbTGY+2pzO3ZP8KONgHYLerYD79c0qDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wnu5Bxw9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wnu5Bxw9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68E58C2BCAF;
	Sun, 26 Apr 2026 10:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777201126;
	bh=mkkI+lXLMcbjVq5S0Bvo04h/9+PSK8v/F/iMiEKV2hw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Wnu5Bxw9rXhG06Go4iTyIXSDOa+mQ5Vuu2x0WHdRYrvoFnHH8SvqFaqyGi8gZnfVo
	 rNrEaLATkeLJzBlaS3huZSg8pXMz+mRx2XfDidb3Qn8wuf9FIdcPGMbcMlKHRbLsIF
	 E/kS3AB1tFWbeLsalS98galB73i4pxITt073G4egUeROdOZNeGDZUwaT0PwzBnkZwE
	 0xkD+IXZgCO0mRqAlvM3b3vbghe88BhElPmyJNMqLHD4jpAauJLh6RH7fFMRhQWwbT
	 L/MsSCciy6r5SRfd7MvXPhp0f8/59QbjoHOndQxh21dBR10JVBO9nc14+jdaSl/HFY
	 bEwxkaQZuafCg==
Date: Sun, 26 Apr 2026 12:58:29 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Luiz Capitulino <luizcap@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Barry Song <baohua@kernel.org>, Dev Jain <dev.jain@arm.com>,
	Donet Tom <donettom@linux.ibm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
	John Hubbard <jhubbard@nvidia.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lance Yang <lance.yang@linux.dev>,
	Leon Romanovsky <leon@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
	Mark Brown <broonie@kernel.org>, Michal Hocko <mhocko@suse.com>,
	Nico Pache <npache@redhat.com>, Peter Xu <peterx@redhat.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Sarthak Sharma <sarthak.sharma@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@kernel.org>, Zi Yan <ziy@nvidia.com>,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH v2 43/53] selftests/mm: migration: add setup of HugeTLB
 pages
Message-ID: <ae3v1cyMLbcvJtYW@kernel.org>
References: <20260418105539.1261536-1-rppt@kernel.org>
 <20260418105539.1261536-44-rppt@kernel.org>
 <a8510cbd-4a30-460c-b870-a250ceb8a522@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a8510cbd-4a30-460c-b870-a250ceb8a522@redhat.com>

On Fri, Apr 24, 2026 at 01:11:45PM -0400, Luiz Capitulino wrote:
> On 2026-04-18 06:55, Mike Rapoport wrote:
> > From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> > 
> > migration skips HugeTLB tests if there are no free huge pages
> > prepared by a wrapper script.
> > 
> > Add setup of HugeTLB pages to the test and make sure that the original
> > settings are restored on the test exit.
> > 
> > Since kselftest_harness runs fixture setup and the tests in child
> > processes, use HUGETLB_SETUP_DEFAULT_PAGES() that defines a constructor
> > that runs in the main process and add verification that there are enough
> > free huge pages to the tests that use them.
> > 
> > Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> > ---
> >   tools/testing/selftests/mm/migration.c | 8 ++++++++
> >   1 file changed, 8 insertions(+)
> > 
> > diff --git a/tools/testing/selftests/mm/migration.c b/tools/testing/selftests/mm/migration.c
> > index ccf42002ce86..61fb00953f83 100644
> > --- a/tools/testing/selftests/mm/migration.c
> > +++ b/tools/testing/selftests/mm/migration.c
> > @@ -23,6 +23,8 @@
> >   #define MAX_RETRIES	100
> >   #define ALIGN(x, a)	(((x) + (a - 1)) & (~((a) - 1)))
> > +HUGETLB_SETUP_DEFAULT_PAGES(1)
> 
> Hey Mike,
> 
> I've been reviewing and testing this series and got a reproducible issue
> with this test when running it on a x86 KVM guest with 88 vCPUs.
> 
> The issue is that, when executing the full MM suite with
> sudo ./run_vmtests.sh -d -a, all 6 migration test pass but it doesn't exit.
> Instead, it gets stuck after this output:
> 
> """
> # # PASSED: 6 / 6 tests passed.
> # # Totals: pass:6 fail:0 xfail:0 xpass:0 skip:0 error:0
> """
> 
> Getting a backtrace from gdb I see:
> 
> """
> #0  0x00007efd2f2c247b in __lll_lock_wait_private () from /lib64/libc.so.6
> #1  0x00007efd2f26fa88 in __run_exit_handlers () from /lib64/libc.so.6
> #2  0x00007efd2f26fabe in exit () from /lib64/libc.so.6
> #3  0x0000000000404f2e in hugepage_restore_settings_sighandler ()
> #4  <signal handler called>
> #5  0x00007efd2f32f416 in __unregister_atfork () from /lib64/libc.so.6
> #6  0x00007efd2f26f338 in __cxa_finalize () from /lib64/libc.so.6
> #7  0x00007efd2f4548c7 in __do_global_dtors_aux () from /lib64/libm.so.6
> #8  0x00007ffd66ae0320 in ?? ()
> #9  0x00007efd2f55b2d2 in _dl_call_fini (closure_map=0x7efd2f5500c0) at dl-call_fini.c:43
> """
> 
> Could we be messing with libc internal state somehow? I also get systemd
> services hung when I try to reboot.

I don't think we are messing with libc internal state, but we surely leave
zombies around.
All the tests that fork() terminate the children with kill() but they never
call wait*() to collect the exit status.
 
> Some of the migration tests fork() and then kill() their children
> processes. Won't those all restore the hugetlb state concurrently
> from hugepage_restore_settings_atexit()?

Yeah, I missed the kill()s :/
 
> Also, for shared_anon_htlb, don't we need to reserve a HugeTLB page per
> children?

We only mmap() a single huge page in the parent, the children don't create
new mappings.
 
> And there's another issue: when running the migration test individually,
> private_anon_htlb gets skipped. I guess it's because the previous test
> is restoring the HugeTLB state:

It could be.

I pushed the updated version that has the fixes for both zombie and
signal issues:

https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git/log/?h=mm-selftest/v3

Would be great if you can test it in your setup.

-- 
Sincerely yours,
Mike.
