Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BE223F20ED;
	Tue, 25 Aug 2026 10:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787654614; cv=none; b=FCbMWyBAtnYbJa38dblZSpG7G80ePQPPXAR9SCLI5wVWeqTr0U5cWA9NHW0nE492Yhg8Wg11OmjEzgZqN0KQT/x50YhMT5ALX8HPyIiu775EBz7F6jKdAKx/SnugLOxbXN7Wr/a9luper442xQK2572LrSL5VFBArOVAU5WYyNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787654614; c=relaxed/simple;
	bh=uVSJqJyxJ0TvdMw2vUR0bfwbD5X00jM75IHxQv4s/ZI=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=tNVhusp+qiWrjIWc0O7FdTEDkl6efKE9xUZfBKsHTrHiTlEM8QzM5xODHoBLin14ZZIbQ4Pb4zv0bQF1Gs9de4ft0W2zTETyMv5PTZac9w8UGu6jZPhxUUs4Vdjy3GHPX6q4aazShjNP54Iph8Nbc72ycIxRl70tvVkt8VtR570=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=V613aVVl; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="V613aVVl"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CE9BC1688;
	Tue, 25 Aug 2026 03:43:27 -0700 (PDT)
Received: from [10.2.198.93] (e142334-100.cambridge.arm.com [10.2.198.93])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A343F3F7D8;
	Tue, 25 Aug 2026 03:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787654611; bh=uVSJqJyxJ0TvdMw2vUR0bfwbD5X00jM75IHxQv4s/ZI=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=V613aVVlqKJ2ocqhG9J6MMdQH/0WsLyws3H8UwiHLi2n7Mp+K+qmCkbIUq5kBdgMB
	 DqW5nwRjbGAKtKZlf5GhKPAaZN1VBJTd7+BCrAlYSznOkvmQpDaBsmbkAildTpJp6W
	 6GJqarGfUwx7Nj0H0XAhHPZeWODJWgsTsAYhNXEs=
Message-ID: <d63e0faa-77e9-4598-972b-d7d9125cfc23@arm.com>
Date: Tue, 25 Aug 2026 11:43:26 +0100
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: usama.anjum@arm.com, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R . Howlett" <liam@infradead.org>, Vlastimil Babka
 <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
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
 linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>
Subject: Re: [PATCH v7 0/6] selftests/mm: separate GUP microbenchmarking from
 functional testing
To: Sarthak Sharma <sarthak.sharma@arm.com>
References: <20260813181230.483746-1-sarthak.sharma@arm.com>
From: Usama Anjum <usama.anjum@arm.com>
Content-Language: en-US
In-Reply-To: <20260813181230.483746-1-sarthak.sharma@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13/08/2026 7:12 pm, Sarthak Sharma wrote:
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
> 
> Patch 1 makes read_file(), write_file(), read_num(), write_num() and
> write_num_ignore_einval() return errors to their callers instead of
> exiting. It also makes read_num() reject negative and malformed values
> and updates the existing callers to handle failures.
> 
> Patch 2 moves these file helpers from vm_util.c to tools/lib/mm/. It keeps
> them available to the mm selftests through vm_util.h and adjusts the
> selftests build accordingly.
> 
> Patch 3 moves hugepage_settings.[ch] from selftests/mm to tools/lib/mm/.
> It also removes its kselftest dependency while preserving TAP-compatible
> diagnostics for selftest users.
> 
> Patch 4 moves the existing gup_test implementation from selftests/mm to
> tools/mm as gup_bench. This keeps the code movement separate from the
> subsequent changes and makes it easier to review.
> 
> Patch 5 removes the functional test modes and kselftest dependency from
> gup_bench. When run without arguments, it performs one GUP_FAST benchmark
> using the existing defaults instead of running the whole matrix. Other
> benchmark configurations can be selected through command-line options.
> 
> Patch 6 adds a new harness-based GUP selftest. It covers THP, non-THP and
> HugeTLB mappings across private/shared and read/write variants. For each
> variant, it tests get_user_pages(), get_user_pages_fast(),
> pin_user_pages(), pin_user_pages_fast(), long-term pinning and both dump
> modes using four batch sizes. It also preserves the existing sparse dump
> coverage for pages 0, 19 and 0x1000. The HugeTLB variants share a one-time
> setup of 128 default-sized huge pages.

I tested the full MM selftest suite before and after this series and found
no regressions. The new GUP selftest and gup_bench also passed.

Tested-by: Muhammad Usama Anjum <usama.anjum@arm.com>

Thanks,
Usama

