Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 084773BBFCA;
	Mon,  3 Aug 2026 09:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785747613; cv=none; b=EPKpBIBEHSWxrZIisHhZ2v4jdQVMcqRjonZZ8I+mn77ZVuDc9JwN4UkVdsUZjiNTl3hkHX7nWTVB577csE4YPjA510GGZuxSCGGNtU2KOvHeKYIM6ilW2N9S/acRExRpwsdDMLG9xAVJdwO8pahFY3Eckz40v8/CTi546wv7ALY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785747613; c=relaxed/simple;
	bh=sTpD9gK8VgSzyomsjDARrXawdeMXI/UFxTQXL7IJJsc=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=cwJ0Fra4njI7eLSeImQxygteKRGM6XW3wb7TnENI/VMsc4Y5F6TidWAgcR0A4hicBYKC47vcocJoykzGyURtBkur5TcV+l8PzzrQclmNE2CMnuPcnWiaADHbYpPQXJ7vx80SDATnkBvpSawtCWN3UT+BQb3HSXsDqTTWOumcm4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kvg1q1jf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kvg1q1jf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7ADB91F000E9;
	Mon,  3 Aug 2026 09:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785747611;
	bh=qJpnVbUUg/HZmVbgibR8k9snYJVUV/2ctFtNVgzFuMo=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=kvg1q1jfM5K1ykaqOcBsNsGb5IZ8pT5YtJYWG0o9gc7/o43KMc9uLqYDjdrlCIcXh
	 Vw5sckFmqKYTLhzaKYto4/ay7QwV+2zNbp6ry9KiHO86I5tJSekgSgLWlXDPoVB/AX
	 t0Pz1Lvh6H2SzFhYY+wqWmfMkxTn0jdxmgRHcXWk3LdTYYxJBmXqynUnHBe/EoUDIP
	 b2icn1Poh8bGwpDQUTHh26UqAyWBpgwXQL5yCe+CdH/Q1JdVzjIyCtmwJc5+3xmZtW
	 nCUNkCzFdpk21pIMjyRD4dM9dVwX3JIvBjb0SPebBpqTX4GQU5i8YMcWV1DhzHHxli
	 98HizTFCd8ekg==
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v6 0/6] selftests/mm: separate GUP microbenchmarking
 from functional testing
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
In-Reply-To: <20260730140825.238130-1-sarthak.sharma@arm.com>
References: <20260730140825.238130-1-sarthak.sharma@arm.com>
Date: Mon, 03 Aug 2026 12:00:01 +0300
Message-Id: <178574760161.1561566.2419225666600419775.b4-review@b4>
X-Mailer: b4 0.16-dev

> gup_test.c currently serves two separate purposes: benchmarking
> (GUP_FAST_BENCHMARK, PIN_FAST_BENCHMARK and PIN_LONGTERM_BENCHMARK) and
> functional testing (GUP_BASIC_TEST, PIN_BASIC_TEST and
> DUMP_USER_PAGES_TEST). Keeping both in one program makes the functional
> tests harder to run and report individually, while run_vmtests.sh has to
> invoke the program repeatedly with different options.
> 
> Separate these roles into tools/mm/gup_bench for benchmarking and
> tools/testing/selftests/mm/gup for functional testing. Move the shared
> file and hugepage helpers to tools/lib/mm/ so both programs can use them
> without duplicating the implementation.

This sets seems to regress hugetlb tests: 

https://github.com/linux-mm/linux-mm/actions/runs/30553882784/job/90909219578

-- 
Sincerely yours,
Mike.

