Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 728F23F9A13
	for <linux-kselftest@vger.kernel.org>; Thu, 27 Aug 2026 08:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787820391; cv=none; b=U7h/LP5z23ZO6AzbYKCohYZK19g86ADqSSByuz2zbzh9Ops3Sws2smT5UJ/W9yiHP1WqzKbnDMLIMq0Kb6GbtS9gs/wxxk7EIDY54FU2BMc5bolmus/LCntWqWa32tT25x8khH8wjzSWvGpSmN+9Q5taiQXGBTtznB7LAvdRTZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787820391; c=relaxed/simple;
	bh=YdMNsjxZ23NQ3I+MJOUkNCO8UifC8kwSZB7rLrjQs9Y=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KKlsne2AFug2NASUouv2UontgGPqIBjqyMagmwbUHwYNN/4okjHTEDJVweWU0A5oWFD25dbJqhRxUnKEIj2GlG4w/0VZLH68O7FOZsN4OXY2hl3Tw3mD4HMevdcZNxJv+fLW5GS6Actq4RD0TTFua9IABvTs5eO0k/Mdx4Sm6mI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pt0n8TEX; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pt0n8TEX"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-38dc69c74b8so2334578a91.0
        for <linux-kselftest@vger.kernel.org>; Thu, 27 Aug 2026 01:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787820387; x=1788425187; darn=vger.kernel.org;
        h=content-type:mime-version:user-agent:references:in-reply-to:subject
         :cc:to:from:message-id:date:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9MKQBXQ2qiIPcch87en2gxSQXnqBJNIJwYDdb9qgoaA=;
        b=pt0n8TEXm6OOOOYsB+4fID83h6iprA3VEpU5yhkhxWKXloUVOkGaw8T2pGh6vnAccl
         UHn+AEnbqHhJ5HLnUEtWZlJZwR8Yiz+uzvBUiPYcyHqWusgwD15l5fwCRf1wnELZ6cG2
         bcAJPVc80WAqEiLcm4wsLlabunq2DtN3gzRlgDcYH8Mb5RrjBguDE/ehdhgiibU/EhDB
         mYm/E6gR0WLCIHUPuwNck/oN2ahsuS6EJvPTAAeFW9wOcmm3PZ5gw5nTbfVt5rLA+iTb
         2kZoT3iltU6Exk9NXJxAUhJQGqgz8taW2SszAGu09/MHxa8nwEL5/gX4r52i115cVpfF
         IjPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787820387; x=1788425187;
        h=content-type:mime-version:user-agent:references:in-reply-to:subject
         :cc:to:from:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9MKQBXQ2qiIPcch87en2gxSQXnqBJNIJwYDdb9qgoaA=;
        b=GdvFM5v08M+I+ejw4eKeFZchVFGqcam73+TJk5qFYXKUCKHM0iitcI+HVp1nrR0gCh
         0l3UnwXPGTNd0MFh28FpHpOjccLD6b1YfYnL74DeD5rZi+izIB2c6/y0Ee0vCZLRE5Fg
         YSlAmZQQbrCfD3JwmyTizy8923KslnIRqWPVKlWEGrYQvjQ3FdYbfi+Oh80XmsmuyfiL
         r9bIFrAZqQBXy+dwmUbBEvEqOC2E4i91BCPt8YkP0IxWdKTwOZfZmGsU9cTQzbj3IFvw
         DPN4CsND2WXrfHcMBQDRuxMUUF9NU0ihvoKR9zU6wQ43L1bTrAIvRjMduTUYyT+CTAAe
         gPYA==
X-Forwarded-Encrypted: i=1; AHgh+RqGVualbAtW+manqxKMInbRJm9iDzusZVtZ91l2qkecgJ2YYqLXHQfBYMLRRXk/QIw1Yn73j4+xxgzjvpDBLJk=@vger.kernel.org
X-Gm-Message-State: AFuF++ljkWOGQP1NJQa8I/nkKIOSEX/GmXkUa5aPqjJ2ii+Q8vHhRz0C
	94uXFe+JtNIyFoyKzup4j5455ZFWQ2nwpj8nrQ0lx96GjdA9QR044pj5
X-Gm-Gg: AR+sD10FPi6ZUnbrd8DhNuEfWtpG0scbSkQJgTh91GlFttfjUfPgiaPHjBYmeUFH5XO
	FoptxX4wiPOXxbofDaWXx1GlY9kQOpCvnIjd9ONMyqhGDRRcR+vFrLUo8Xx3OGKmE8XibdHdkr0
	QOQQsNPxyGJIekc7cVLdkEzLH98qtvtDq/CHdsnFDjFWN0r8oSk+Ewxd9CmYsoiZpF+ofZNfBpk
	A+OIA9Pnb4Cn3fzR9F0Qe/Eal1vyafuRzTwA4UjmBR31UdYn8Akvesi7ejstPXWZ3ivTbM0z1uD
	gfoB467T9fxRW4BMmkxDSmhJo18vDZeU0zfw5VHMz3jLOyhForMwEBAoQhmqvNREf6upXgdm/vK
	w6X2aA6Z1Iynw+hc5qjJKfaNGPyAX1Xa/FDH1yyUHIsLKU2wHYtwVqyVHY0ZNXGfz3gq8LQjY7h
	f85mGaXb/rS6FiKlTECgjLKSB/3F9qFU6iZKza87RBV8Z2bEmKIztfAt0kANoFtb+M9l0YgOrpi
	ovEb42ZDQo7ZImewqnY8hbpfQiA5kMYafDHV9cZaEtSmKGJQAX1MVnHO1ZgarZo6Gzsv/g2scef
	tDc9Vg==
X-Received: by 2002:a17:90b:1809:b0:38f:7f60:ba35 with SMTP id 98e67ed59e1d1-3966d199247mr26527608a91.5.1787820387338;
        Thu, 27 Aug 2026 01:46:27 -0700 (PDT)
Received: from mars.local.gmail.com (221x241x217x81.ap221.ftth.ucom.ne.jp. [221.241.217.81])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39675922253sm2042307a91.4.2026.08.27.01.46.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 01:46:26 -0700 (PDT)
Date: Thu, 27 Aug 2026 17:46:22 +0900
Message-ID: <m2y0dsuf1d.wl-thehajime@gmail.com>
From: Hajime Tazaki <thehajime@gmail.com>
To: ljs@kernel.org
Cc: david@kernel.org,
	linux-mm@kvack.org,
	liam@infradead.org,
	rbm@suse.com,
	akpm@linux-foundation.org,
	luto@amacapital.net,
	brendan.jackman@linux.dev,
	liuhangbin@gmail.com,
	corbet@lwn.net,
	kees@kernel.org,
	broonie@kernel.org,
	mhocko@suse.com,
	rppt@kernel.org,
	shuah@kernel.org,
	surenb@google.com,
	vbabka@kernel.org,
	wad@chromium.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-um@lists.infradead.org,
	geert@linux-m68k.org,
	daniel@thingy.jp
Subject: Re: [PATCH v2 0/2] support kselftest on nommu platform
In-Reply-To: <ao2l9Ao7BQI6uRKC@gremlin>
References: <20260825015945.141739-1-thehajime@gmail.com>
	<f2ac9432-4fea-4007-aab0-ad80597b284c@kernel.org>
	<ao2Tl9CLL7WjHYun@gremlin>
	<bb9a3add-4849-4928-8b6a-0afc0c73b112@kernel.org>
	<ao2l9Ao7BQI6uRKC@gremlin>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII


Hello David, Lorenzo,

On Tue, 25 Aug 2026 23:28:24 +0900,
Lorenzo Stoakes (ARM) wrote:
> 
> On Tue, Aug 25, 2026 at 04:17:54PM +0200, David Hildenbrand (Arm) wrote:
> > On 8/25/26 15:12, Lorenzo Stoakes (ARM) wrote:
> > > On Tue, Aug 25, 2026 at 10:37:41AM +0200, David Hildenbrand (Arm) wrote:
> > >> On 8/25/26 03:59, Hajime Tazaki wrote:
> > >>> We add an ability to execute kselftest on nommu platforms.
> > >>>
> > >>> Currently there are several issues if we wish to run kselftests on nommu
> > >>> targets:
> > >>>
> > >>> - it cannot compile/build test binaries because the current files mainly
> > >>>   assume to build with glibc,
> > >>> - some of the tests are not able to run on nommu targets as there are no
> > >>>   fork(2) syscall.
> > >>>
> > >>> The first issue can be avoided if we can build static PIE binaries (if
> > >>> targets support it), but in our case (build on ubuntu/glibc and run on
> > >>> alpine/musl-libc), it fails to invoke due to lack of the GNU ifunc
> > >>> mechanism.  Thus, we need to cross-compile with musl toolchain, which
> > >>> needs to be solved the first issue.
> > >>>
> > >>> The second issue is the lack of fork(2) syscall on those platforms.
> > >>> Especially the test harness helper (kselftest_harness.h) uses the
> > >>> syscall, which cannot be simply with vfork(2).  `timeout` command used
> > >>> in `runner.sh` never works for nommu platform as it uses fork(2).
> > >>>
> > >>> nommu component in the mm subsystem has several known issues and having
> > >>> test cases should help this situation, thus this patchset is very first
> > >>> step toward enriching test environment which has not been well tested
> > >>> for a while.  The test cases is implemented based on the document
> > >>> (Documentation/admin-guide/mm/nommu-mmap.rst).
> > >>>
> > >>> So, for the first step, nommu targets only support low-level API of
> > >>> kselftests (kselftest.h), and implement tests in a new target,
> > >>> TARGETS=mm/nommu.  Other targets are currently not even able to build
> > >>> due to toolchain issues but will be addressed once the initial
> > >>> introduction which mainly focuses on nommu test will be settled.
> > >>>
> > >>> The patch was initially combined with other patches but is decoupled to
> > >>> only focus on test framework and testcases.
> > >>>
> > >>> - rfc:
> > >>> https://lore.kernel.org/linux-mm/20260813063401.1786548-1-thehajime@gmail.com/
> > >>>
> > >>> Hajime Tazaki (2):
> > >>>   selftests: run tests on nommu architecture
> > >>>   selftests/mm: add nommu mmap and mremap behavior tests
> > >>>
> > >>>  Documentation/dev-tools/kselftest.rst         |  14 +
> > >>>  tools/testing/selftests/Makefile              |   1 +
> > >>>  tools/testing/selftests/kselftest/runner.sh   |   9 +-
> > >>>  tools/testing/selftests/kselftest_harness.h   |   4 +
> > >>>  tools/testing/selftests/lib.mk                |   8 +
> > >>>  tools/testing/selftests/mm/nommu/Makefile     |   7 +
> > >>>  .../selftests/mm/nommu/nommu_mmap_test.c      | 265 +++++++++++++
> > >>>  .../selftests/mm/nommu/nommu_mremap_test.c    | 353 ++++++++++++++++++
> > >>
> > >> That's odd.
> > >>
> > >> 	tools/testing/selftests/mm
> > >>
> > >> itself should know which tests can be built and ran on nommu. nommu-only tests
> > >> can be placed in mm/nommu, but I would expect tools/testing/selftests/mm's
> > >> Makefile and run script to compile and run only selftests that are supported on
> > >> the given platform.
> > >
> > > I mean I think at this point with mm/nommu/nommu_xxx.c it'd make more sense to
> > > simply have selftests/nommu/ + update the mm makefile to not build stuff that's
> > > broken on nommu there.
> > >
> > > That way positively nommu-stuff is put in its own place and what's broken on mm
> > > specific to nommu can be fixed there.
> > >
> > > I'd rather isolate them clearly rather than having them live in a subdirectory
> > > of mm.
> >
> > My understanding is that some MM tests could be enabled/changed in the future
> > that support both MMU and NOMMU. Not sure how to best handle that.
> 
> Well by default won't everything run? And it becomes a list of what doesn't
> work with nommu?
> 
> I really don't want to see any maintainership burden or extra work added
> for nommu as it's afaic deprecated.
> 
> >
> > So wiring up mm/nommu as a separate thing did sound wrong to me. So it should
> > either be integrated or the tests in fact completely moved out of mm/
> 
> Not integrated, because then it starts adding work for people. I'd rather
> have separate nommu tests, any mm tests that aren't compatible with nommu
> can just be somehow excluded.
> 
> Having a 'don't run on nommu' or even just some means of setting which
> tests to skip (I think Mark Brown suggested as much in reply to an earlier
> version of the series) seems a good idea.
> 
> But yeah, tools/testing/selftests/nommu seems the best place for the
> nommu-specific stuff.
> 
> Can maybe do some ../mm/ horror show thing for reducing duplication as
> needed...

As David mentioned my goal is to run all selftests/mm tests on nommu,
but as I explained situation to Lorenzo, it currently doesn't any
tests of mm/ on nommu platform (plus cannot build).

so I'd like to start as minimum as possible for this patchset, thus
creating different TARGET at mm/nommu, which I thought it should no
harm to the parent directory.

But I can move from selftests/mm/nommu to selftests/nommu for now, and
will propose to move into mm/nommu once it will be more meaningful to
do so.

# btw, I started to looking at code toward virtual mmu; I cannot tell
  how it'll be tho now.

-- Hajime

