Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C709463;
	Tue,  4 Aug 2026 09:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785836143; cv=none; b=M8rsePoqqY/leSPbLNcDS/cOYkjT6LuaksJbgJLL7NS7rrzDqYvXPsKioz+r425OCmOngwfYsY1GOLSxp8JEh/rtqaUx5fqpEOgYdkaQSmMjL5oLh87HqkKCFaP/6vx1HkuAMsiAJYYaQBSVk8u0khVkR8AGmM2XXJtRpXPXFB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785836143; c=relaxed/simple;
	bh=VFCfCKaiODSDNoD39njx8GVXF6fYLmllE2pB3w8o1XM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ceP3zHxUzKGgP2ab0/M9xmO3aitAv8nemfnYc3gKxtaHvCTAKFHEVtvw2kFBR6T2KUUy+DzoBuLxrlJxwokxFAFR+n8//eAs6nsZu/gkA4kSKChReiLM7EpvelPjtmWvQutnuHLBvS7oisp/Dod0oh6Z6cfP+S6nOD2nr8+9fCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WIs8Kwsa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WIs8Kwsa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 412811F000E9;
	Tue,  4 Aug 2026 09:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785836135;
	bh=OtP6SOT10m6z714G3tjzotfodMz5dPKo1j/K8OOWevA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WIs8KwsaVg+Hlkw7RQLSri3W90zkcGWrVuiEsih2dWWVfjP9HqiZW8Pql4McUmspa
	 7bCl7DbUSa83Hu60GmedFvl2WmKvgEN3aA0k2Gh3p5Ey0K1QuuRX8o6bP2alToYcgF
	 k+cVmnvYcRqk2Z98dmpPtx5TZn7OXcvkHPOLPBwpkcdpkyHXeVHAovs+rzvQDuvxTN
	 r+5RuGoUkNHnbhze12vG3GeoetSHfc5tjhl5+RkWKFCk9BELxN/BkuKui6w8t+mN0y
	 l/Nj2ReCNUisNYYkPfhaMs+emXSWUtkZ8u7mPTSpPNms8wmB9Vd80xS/F0rHBmNvkr
	 qma4GRDTsF7Vg==
Date: Tue, 4 Aug 2026 12:35:26 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Sarthak Sharma <sarthak.sharma@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
	Lance Yang <lance.yang@linux.dev>, Jason Gunthorpe <jgg@ziepe.ca>,
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>,
	Leon Romanovsky <leon@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Mark Brown <broonie@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 6/6] selftests/mm: add a GUP selftest
Message-ID: <anGyXt_PDImUglIN@kernel.org>
References: <20260730140825.238130-1-sarthak.sharma@arm.com>
 <20260730140825.238130-7-sarthak.sharma@arm.com>
 <178574760162.1561566.17560239060453947110.b4-review@b4>
 <34e3932c-aaf1-4b69-a3c4-398784aae290@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <34e3932c-aaf1-4b69-a3c4-398784aae290@arm.com>

Hi Sarthak,

On Tue, Aug 04, 2026 at 01:08:05PM +0530, Sarthak Sharma wrote:
> Hi Mike!
> 
> On 8/3/26 2:30 PM, Mike Rapoport wrote:
> >> Add a new GUP selftest which uses kselftest_harness.h. Cover
> >> 12 mapping configurations: THP enabled, THP disabled and
> >> HugeTLB, each across private/shared mappings and with/without
> >> FOLL_WRITE. Run 7 testcases for every variant: get_user_pages,
> >> get_user_pages_fast, pin_user_pages, pin_user_pages_fast,
> >> pin_user_pages_longterm, and DUMP_USER_PAGES_TEST using both
> >> get and pin.
> >>
> >> Sweep four nr_pages_per_call values for each test: 1, 512, 123 and
> >> all pages. This preserves the coverage previously provided by
> >> run_gup_matrix(): 12 mapping combinations x 5 GUP/PUP operations x 4
> >> batch sizes, for 240 ioctl calls. The two dump modes add another 96
> >> calls.
> >>
> >> Preserve the previous sparse dump coverage with a standalone test for
> >> pages 0, 19 and 0x1000. In total the selftest reports 85 TAP
> >> cases and issues 337 ioctls.
> >>
> >> Add the new gup binary to the selftests/mm build, .gitignore,
> >> run_vmtests.sh and MAINTAINERS. Update
> >> Documentation/core-api/pin_user_pages.rst for the new test.
> >>
> >> Suggested-by: David Hildenbrand (Arm) <david@kernel.org>
> >> Signed-off-by: Sarthak Sharma <sarthak.sharma@arm.com>
> >>
> >> +
> >> +FIXTURE_SETUP(gup_test)
> >> +{
> >> +	int mmap_flags = MAP_PRIVATE;
> >> +	int zero_fd;
> >> +	char *p;
> >> +
> >> +	/* zero_fd has to be >= 0. Already checked in main() */
> >> +	zero_fd = open("/dev/zero", O_RDWR);
> >> +	ASSERT_GE(zero_fd, 0);
> >> +
> >> +	/* gup_fd has to be >= 0. Already checked in main() */
> >> +	self->gup_fd = open(GUP_TEST_FILE, O_RDWR);
> >> +	ASSERT_GE(self->gup_fd, 0);
> >> +
> >> +	self->size = variant->hugetlb ? 256 * MB : 128 * MB;
> > 
> > I'd derive the hugetbl variant size from the size of a huge page and
> > predefined number of huge pages.
> > 
> 
> I was following the existing logic that run_gup_matrix() had. I can
> implement this. Any suggestions what number of huge pages we can fix?

You currently use 128 hugepages for the most common case of 2M default huge
page, so setting, say, NR_HUGEPAGES to 128 seems reasonable.

Later we could extend this to better deal with other huge page sizes.

-- 
Sincerely yours,
Mike.
