Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 865C9463B6F;
	Tue, 25 Aug 2026 13:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787663588; cv=none; b=o2D/LJf9IgJL62UBU0LkXI+AYfa4g5X1PlgKdtGueOvWjqf4EvYSPP1fWILaNr88j8H3MShlsdMpJfA3MhL3fg7GcunIvzi+j2BLjrgvEYcWnBRcpsy75Xg6/tJ9+hNh3qDup9WJfNGkyVP7dC+DfPMduMa4+cViW3oty4orKG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787663588; c=relaxed/simple;
	bh=hhEO4/3KevWWjpuvVW/uNLA0iV7xOfcX6lnr9uAtHbI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rV4lWp28qcO4yvTFk6RDjrEeFV8/5M2NhlIEny0eKk1jhgIcTQBU2RWdjQKp101L1G8/f1er8AuqkBBwip6z28TyBmBXxgNB3b3RhHco/M8vuzCZUBfz+RkAP4uQEhnKVFTeb7va2E+RIDuWnKsX09UxFUbp0iknuF81rbRcx9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=di+7PMDP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="di+7PMDP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0FF81F00A3A;
	Tue, 25 Aug 2026 13:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787663580;
	bh=y1ooUZqu3n0X6AHMc52e/9cK3btR11yvm1f2GPiErVs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=di+7PMDPHKJfCpsQmjVBUEbvXlQaZKb3l1YLxpWKXFvWrDrILEJQmo2eEwwMqWiQ8
	 3VtqnaEz0JXZZncs8PraIMpk3NIunXnWyDCqt//xeQu4IopzhXaHUWU6Xoy3GWVI+7
	 s9HuO+Xht7BpCV8TZf5SuXjSRTmpfgUPkO0aW21lYqDwX3vWR92tkUT1ywm9s6MVBj
	 4r7stbb/zFTi59pT0dBR3+NTuMEQQsX0avCLwwHTxxxqneTZxvVqHZjg+iV38KlDXS
	 HaF+XUuViD3b9+EpFbB1weCL89MBtsC7Hr25gFh6A02REt3u/GO5SxShPGCtPdBaW5
	 WHKXpUuewxP+g==
Date: Tue, 25 Aug 2026 14:12:52 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Hajime Tazaki <thehajime@gmail.com>, linux-mm@kvack.org, 
	liam@infradead.org, rbm@suse.com, akpm@linux-foundation.org, luto@amacapital.net, 
	brendan.jackman@linux.dev, liuhangbin@gmail.com, corbet@lwn.net, kees@kernel.org, 
	broonie@kernel.org, mhocko@suse.com, rppt@kernel.org, shuah@kernel.org, 
	surenb@google.com, vbabka@kernel.org, wad@chromium.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-um@lists.infradead.org, geert@linux-m68k.org, 
	daniel@thingy.jp
Subject: Re: [PATCH v2 0/2] support kselftest on nommu platform
Message-ID: <ao2Tl9CLL7WjHYun@gremlin>
References: <20260825015945.141739-1-thehajime@gmail.com>
 <f2ac9432-4fea-4007-aab0-ad80597b284c@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f2ac9432-4fea-4007-aab0-ad80597b284c@kernel.org>

On Tue, Aug 25, 2026 at 10:37:41AM +0200, David Hildenbrand (Arm) wrote:
> On 8/25/26 03:59, Hajime Tazaki wrote:
> > We add an ability to execute kselftest on nommu platforms.
> >
> > Currently there are several issues if we wish to run kselftests on nommu
> > targets:
> >
> > - it cannot compile/build test binaries because the current files mainly
> >   assume to build with glibc,
> > - some of the tests are not able to run on nommu targets as there are no
> >   fork(2) syscall.
> >
> > The first issue can be avoided if we can build static PIE binaries (if
> > targets support it), but in our case (build on ubuntu/glibc and run on
> > alpine/musl-libc), it fails to invoke due to lack of the GNU ifunc
> > mechanism.  Thus, we need to cross-compile with musl toolchain, which
> > needs to be solved the first issue.
> >
> > The second issue is the lack of fork(2) syscall on those platforms.
> > Especially the test harness helper (kselftest_harness.h) uses the
> > syscall, which cannot be simply with vfork(2).  `timeout` command used
> > in `runner.sh` never works for nommu platform as it uses fork(2).
> >
> > nommu component in the mm subsystem has several known issues and having
> > test cases should help this situation, thus this patchset is very first
> > step toward enriching test environment which has not been well tested
> > for a while.  The test cases is implemented based on the document
> > (Documentation/admin-guide/mm/nommu-mmap.rst).
> >
> > So, for the first step, nommu targets only support low-level API of
> > kselftests (kselftest.h), and implement tests in a new target,
> > TARGETS=mm/nommu.  Other targets are currently not even able to build
> > due to toolchain issues but will be addressed once the initial
> > introduction which mainly focuses on nommu test will be settled.
> >
> > The patch was initially combined with other patches but is decoupled to
> > only focus on test framework and testcases.
> >
> > - rfc:
> > https://lore.kernel.org/linux-mm/20260813063401.1786548-1-thehajime@gmail.com/
> >
> > Hajime Tazaki (2):
> >   selftests: run tests on nommu architecture
> >   selftests/mm: add nommu mmap and mremap behavior tests
> >
> >  Documentation/dev-tools/kselftest.rst         |  14 +
> >  tools/testing/selftests/Makefile              |   1 +
> >  tools/testing/selftests/kselftest/runner.sh   |   9 +-
> >  tools/testing/selftests/kselftest_harness.h   |   4 +
> >  tools/testing/selftests/lib.mk                |   8 +
> >  tools/testing/selftests/mm/nommu/Makefile     |   7 +
> >  .../selftests/mm/nommu/nommu_mmap_test.c      | 265 +++++++++++++
> >  .../selftests/mm/nommu/nommu_mremap_test.c    | 353 ++++++++++++++++++
>
> That's odd.
>
> 	tools/testing/selftests/mm
>
> itself should know which tests can be built and ran on nommu. nommu-only tests
> can be placed in mm/nommu, but I would expect tools/testing/selftests/mm's
> Makefile and run script to compile and run only selftests that are supported on
> the given platform.

I mean I think at this point with mm/nommu/nommu_xxx.c it'd make more sense to
simply have selftests/nommu/ + update the mm makefile to not build stuff that's
broken on nommu there.

That way positively nommu-stuff is put in its own place and what's broken on mm
specific to nommu can be fixed there.

I'd rather isolate them clearly rather than having them live in a subdirectory
of mm.

>
> --
> Cheers,
>
> David

--
Cheers, Lorenzo
