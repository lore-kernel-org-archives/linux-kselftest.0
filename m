Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E2FD3BBA0B;
	Mon,  3 Aug 2026 09:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785747646; cv=none; b=rhvyimQcPWzIsrCmlDp7Z/V/CwBNHL5L9fj5kLZOUtv3xYY7iLtqHPb2oxdM7431dUXwjjKY9DIfQ50icSNywDHBGwc2JXwKmYRSewNgW/XnuDU2PgMeyw+YESWdFKjBXdR4DV2QN72EjbDH5idkwlgugYu/TqplE/x+y2emKJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785747646; c=relaxed/simple;
	bh=5RY6inpK5pbQP7yziJkMzJezARgyqke4cov9xaIXkM0=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=W6hyKVdX7do0b5sxdkXp9VG8Q+jOspmRNHcw8Hvh02N9eukNceFq9EfHjOo89xGkAFZe1K6AWzueHAaQrk77pNASjs3/YtAHf0PksixbHaOMmCcMbVS3L9D6esaIH/lJ7W1EiaPmqBvQLlBCSnFp66EOl2mnDU+i96hJjtTACOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CMWhxAW+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CMWhxAW+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A11A41F000E9;
	Mon,  3 Aug 2026 09:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785747644;
	bh=S1fW7CNa0Rta/NRgITqdOPZuNkGF26w1VzOGgOD6xvg=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=CMWhxAW+ua9CuWQbkSA2KkHuDlUsptPy/9hThctxswMbNkp4WkJ3SgzGMluxhWuuz
	 gvqw9uqlqwoDocMV9/ZhLhhjaTDwSW/2ThQuH+xdUHZZtlzHNtDjRDg4SccCXq9cx0
	 rG0otOr6yxz/vpI4hPcpW9SfKJOnF43QQCi1DQ0ITJz2FK5n24KdalAEUaiA4K0FFr
	 uW+A4x9QpLlykXKz9VhfNlFJtxfuBqT25+GjZXSefWpEm6Oufga3zuURWhneY+lPuT
	 SHl3H/k8dqBX6Ld7IG/i2sQlK7eBrOfD10EySgTjWMD9TsL4FSNtVHVQVlwf2m1OSz
	 bpFmPnvKT0ypQ==
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v6 6/6] selftests/mm: add a GUP selftest
From: Mike Rapoport <rppt@kernel.org>
To: Sarthak Sharma <sarthak.sharma@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>, 
 Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>, 
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
 Lance Yang <lance.yang@linux.dev>, Jason Gunthorpe <jgg@ziepe.ca>, 
 John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, 
 Leon Romanovsky <leon@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Mark Brown <broonie@kernel.org>, 
 Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org, 
 linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260730140825.238130-7-sarthak.sharma@arm.com>
References: <20260730140825.238130-1-sarthak.sharma@arm.com>
 <20260730140825.238130-7-sarthak.sharma@arm.com>
Date: Mon, 03 Aug 2026 12:00:01 +0300
Message-Id: <178574760162.1561566.17560239060453947110.b4-review@b4>
X-Mailer: b4 0.16-dev

> Add a new GUP selftest which uses kselftest_harness.h. Cover
> 12 mapping configurations: THP enabled, THP disabled and
> HugeTLB, each across private/shared mappings and with/without
> FOLL_WRITE. Run 7 testcases for every variant: get_user_pages,
> get_user_pages_fast, pin_user_pages, pin_user_pages_fast,
> pin_user_pages_longterm, and DUMP_USER_PAGES_TEST using both
> get and pin.
> 
> Sweep four nr_pages_per_call values for each test: 1, 512, 123 and
> all pages. This preserves the coverage previously provided by
> run_gup_matrix(): 12 mapping combinations x 5 GUP/PUP operations x 4
> batch sizes, for 240 ioctl calls. The two dump modes add another 96
> calls.
> 
> Preserve the previous sparse dump coverage with a standalone test for
> pages 0, 19 and 0x1000. In total the selftest reports 85 TAP
> cases and issues 337 ioctls.
> 
> Add the new gup binary to the selftests/mm build, .gitignore,
> run_vmtests.sh and MAINTAINERS. Update
> Documentation/core-api/pin_user_pages.rst for the new test.
> 
> Suggested-by: David Hildenbrand (Arm) <david@kernel.org>
> Signed-off-by: Sarthak Sharma <sarthak.sharma@arm.com>
>
> +
> +FIXTURE_SETUP(gup_test)
> +{
> +	int mmap_flags = MAP_PRIVATE;
> +	int zero_fd;
> +	char *p;
> +
> +	/* zero_fd has to be >= 0. Already checked in main() */
> +	zero_fd = open("/dev/zero", O_RDWR);
> +	ASSERT_GE(zero_fd, 0);
> +
> +	/* gup_fd has to be >= 0. Already checked in main() */
> +	self->gup_fd = open(GUP_TEST_FILE, O_RDWR);
> +	ASSERT_GE(self->gup_fd, 0);
> +
> +	self->size = variant->hugetlb ? 256 * MB : 128 * MB;

I'd derive the hugetbl variant size from the size of a huge page and
predefined number of huge pages.

> +
> +	if (variant->hugetlb) {
> +		unsigned long hp_size = default_huge_page_size();
> +
> +		if (!hp_size) {
> +			close(zero_fd);
> +			close(self->gup_fd);

You can move hugetlb setup after opening those and save the headache of
closing them.

And in any rate prefer 

	goto err_do_cleanup

to
	if (something_failed) {
		cleanup1();
		cleanup2();
	}

	if (something_else_failed) {
		cleanup1();
		cleanup2();
		cleanup3();
	}

> +			SKIP(return, "HugeTLB not available\n");
> +		}
> +
> +		self->size = (self->size + hp_size - 1) & ~(hp_size - 1);
> +		if (!hugetlb_setup_default(self->size / hp_size)) {
> +			hugetlb_restore_settings();

No need to call restore() here.

Also, if you use a constant number of huge pages you can just add
HUGETLB_SETUP_DEFAULT_PAGES(NR_HUGE_PAGES) somewhere in the begining and
you won't need to setup and teardown hugetlb explicitly for every
hugetlb test.


> +			close(zero_fd);
> +			close(self->gup_fd);
> +			SKIP(return, "Not enough huge pages\n");
> +		}
> +
> +		mmap_flags |= (MAP_HUGETLB | MAP_ANONYMOUS);
> +	}
> +
> +	if (variant->shared)
> +		mmap_flags = (mmap_flags & ~MAP_PRIVATE) | MAP_SHARED;
> +
> +	self->addr = mmap(NULL, self->size, PROT_READ | PROT_WRITE,
> +			  mmap_flags, zero_fd, 0);
> +
> +	ASSERT_NE(self->addr, MAP_FAILED) {
> +		int err = errno;
> +
> +		close(zero_fd);
> +		close(self->gup_fd);
> +		if (variant->hugetlb)
> +			hugetlb_restore_settings();
> +		TH_LOG("mmap failed: %s", strerror(err));
> +	}
> +	close(zero_fd);
> +
> +	if (variant->thp)
> +		madvise(self->addr, self->size, MADV_HUGEPAGE);
> +	else if (!variant->hugetlb)
> +		madvise(self->addr, self->size, MADV_NOHUGEPAGE);
> +
> +	for (p = self->addr; (unsigned long)p < (unsigned long)self->addr
> +			+ self->size; p += psize())
> +		p[0] = 0;
> +}
> +
> +FIXTURE_TEARDOWN(gup_test)
> +{
> +	munmap(self->addr, self->size);
> +	close(self->gup_fd);
> +
> +	if (variant->hugetlb)
> +		hugetlb_restore_settings();
> +}
> +
> +static void run_gup_cmd(struct __test_metadata *_metadata,
> +			 FIXTURE_DATA(gup_test) *self,
> +			 const FIXTURE_VARIANT(gup_test) *variant,
> +			 unsigned long command,
> +			 unsigned int test_flags,
> +			 unsigned int which_page)
> +{
> +	int i;
> +
> +	for (i = 0; i < (int)ARRAY_SIZE(nr_pages_list); i++) {
> +		struct gup_test gup = {
> +			.addr = (unsigned long)self->addr,
> +			.size = self->size,
> +			.nr_pages_per_call = nr_pages_list[i] < 0 ?
> +				self->size / psize() : nr_pages_list[i],
> +			.test_flags = test_flags,
> +		};
> +
> +		if (variant->write)
> +			gup.gup_flags |= FOLL_WRITE;
> +
> +		gup.which_pages[0] = which_page;

Can't these to go to the static initialization?

-- 
Sincerely yours,
Mike.

