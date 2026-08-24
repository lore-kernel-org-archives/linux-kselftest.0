Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30D223A7D7A;
	Mon, 24 Aug 2026 07:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787558394; cv=none; b=Tuoju+FjV/xRXLDitnPm40RG5Yqiu5clJBkyVDt/7nk2I+1XgQxI8wZPh510E539YWZeEAa3WgWr7dU/R7mDm39vq65aJpB8H+WEwfhuYbloFsBoBlUEIK8+Z/3mifWkt21IkRAH/8zlsPCJfCaUmtXeQR9PhyFnFg+qpK/sKI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787558394; c=relaxed/simple;
	bh=XlJoBEHp6rlaqkSf4z5JwPN6EKvWqTZO4W2HV+uDKK8=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=EGegcUcZ4e4SsdJCV97GdK95bdjriT2xrZ6es1/unsUqqOhW43BLUmEYxQaFAyJ3uuoNFJI9QT7Uni/bjw5rw23M6kz/qsWlELq2clPBAMF7VoANZK3fdsARCwOYrNYz6CjlUjcCebhAFl9AnTRCDdVhzfbyCu72vzmXEyxMUWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EPIETBtP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EPIETBtP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B3051F00A3E;
	Mon, 24 Aug 2026 07:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787558388;
	bh=V3rQKObuy+xVLTlhhjHDCPVzJnAVCXtIbfvg8Aw6pM4=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=EPIETBtPAyDvnpFyv/9nLIXNQF02shqJxO/4kPQLxrhMTs3g21WaXi+Qq400go5U3
	 GcstiR975UrlG4GmmYi0PsHDz8o5o5laYnDW0z9dgTUOc/ZlE353p8pGu0eMUPcS3r
	 UvRxQ0+eZKW4f+Jpofd078vojErLyu9pBxyJziPG3OPLTKAcI3PjfVGatIYDZ4TuNl
	 ZXBzTS/EpdAP5koC2+RK5F4lV04wah/y3PsgBwmde2vR7P/3QacHEv+MX0S7fJpIAX
	 tvMn9Sihh3XFFQYmGcR6oly0P9AZy54Nk7sZhhsfwkBjvqtMrWJsJtFZRrsmmWExrB
	 33v58UOtuLxdQ==
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v7 6/6] selftests/mm: add a GUP selftest
From: Mike Rapoport <rppt@kernel.org>
To: Sarthak Sharma <sarthak.sharma@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R . Howlett" <liam@infradead.org>, 
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Shuah Khan <shuah@kernel.org>, Zi Yan <ziy@nvidia.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <npache@redhat.com>, 
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
 Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
 Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>, 
 Peter Xu <peterx@redhat.com>, Leon Romanovsky <leon@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Mark Brown <broonie@kernel.org>, 
 Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org, 
 linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260813181230.483746-7-sarthak.sharma@arm.com>
References: <20260813181230.483746-1-sarthak.sharma@arm.com>
 <20260813181230.483746-7-sarthak.sharma@arm.com>
Date: Mon, 24 Aug 2026 10:59:05 +0300
Message-Id: <178755834511.3606540.7162032713017782533.b4-review@b4>
X-Mailer: b4 0.17-dev

> Add a new GUP selftest which uses kselftest_harness.h. Cover
> 12 mapping configurations: THP enabled, THP disabled and
> HugeTLB, each across private/shared mappings and with/without
> FOLL_WRITE. Run 7 test cases for every variant: get_user_pages,
> get_user_pages_fast, pin_user_pages, pin_user_pages_fast,
> pin_user_pages_longterm, and DUMP_USER_PAGES_TEST using both
> get and pin.
> 
> Set up 128 default-sized HugeTLB pages once for the HugeTLB variants
> and derive their mapping size from the default huge-page size.
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
> Add the new gup binary to the selftests/mm build, run_vmtests.sh and
> MAINTAINERS.

There's also ksft_gup_test.sh ;-)
Other than that,

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

-- 
Sincerely yours,
Mike.

