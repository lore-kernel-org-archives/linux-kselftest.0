Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DA92365A0B;
	Tue, 19 May 2026 18:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779214851; cv=none; b=jOmLvEvQE7F+xyBnEX+x1ukcPyMCSFhX1qIireemV15iZyu0ZuZAJypbIAWI8nSQ9kjaAUTB5mfVstUCsUOL/4G9gSqR+boEY7eL2YHWglz1AdCRwBxABxwAHKS/NSLWXh2WAGyPWDP5UXnWrGtSATVSGla7dC/EWZtFqEiu71o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779214851; c=relaxed/simple;
	bh=pqzU8mXuzzhrRUfzmQOzq8JDrmun2MmKpWrEicP9ns8=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=X2kxZ1VCWyWXJ1Beis5oOb3O4TAjLGOj2MXBwloIo3/h+AuVUz6M0EuVUrFWZ0rdPNVdcrUF9BcbXBqtykZJRprqcjOVWWmojsobDwkpYusIxVUMYy4GoznJAXxtMK0IlUe64LD/Zf6SSC5pVpASTZAGRa3thXbjcX07xsR5sfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=OPRFuf0A; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="OPRFuf0A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05EFCC2BCB3;
	Tue, 19 May 2026 18:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1779214850;
	bh=pqzU8mXuzzhrRUfzmQOzq8JDrmun2MmKpWrEicP9ns8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=OPRFuf0AXpK/r6UWnzz8bUMh0BLWYOZzeANHLn78a9/BEaRC8ddDghRtg4wAS8Bmz
	 s2CS34wuni31S0Q/cX2xCxKfxdA7vJwD6Kgcuj4dLFUs8cU9ijnJTC5EtSFYVQ1MlZ
	 oKmrFjPVXaMG+4UIgAuVZBWg7tvbd/7EfeOs87mA=
Date: Tue, 19 May 2026 11:20:49 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Sarthak Sharma <sarthak.sharma@arm.com>
Cc: David Hildenbrand <david@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>, Peter
 Xu <peterx@redhat.com>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan
 <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Shuah Khan
 <shuah@kernel.org>, linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 0/2] selftests/mm: separate GUP microbenchmarking
 from functional testing
Message-Id: <20260519112049.a85f34eb5f2af83e11ffc777@linux-foundation.org>
In-Reply-To: <20260519120506.184512-1-sarthak.sharma@arm.com>
References: <20260519120506.184512-1-sarthak.sharma@arm.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 19 May 2026 17:35:04 +0530 Sarthak Sharma <sarthak.sharma@arm.com> wrote:

> gup_test.c currently serves two distinct purposes: microbenchmarking
> (GUP_FAST_BENCHMARK, PIN_FAST_BENCHMARK, PIN_LONGTERM_BENCHMARK) and
> functional correctness testing (GUP_BASIC_TEST, PIN_BASIC_TEST,
> DUMP_USER_PAGES_TEST). Mixing these in a single binary means functional
> tests cannot be run or reported individually, and run_vmtests.sh must
> invoke the binary multiple times with different flag combinations to
> cover all configurations. This patch series separates the two concerns:
> tools/mm/gup_bench for benchmarking and tools/testing/selftests/mm/gup_test
> for functional testing.
> 
> Patch 1 adds tools/mm/gup_bench.c, a standalone microbenchmark for
> GUP_FAST, PIN_FAST and PIN_LONGTERM via the CONFIG_GUP_TEST debugfs
> interface. It runs the same matrix of configurations as the old
> run_gup_matrix() shell function (all three commands, read/write,
> private/shared, four page counts, THP on/off, hugetlb), but as a
> standalone C program under tools/mm with no dependency on kselftest.
> 
> Patch 2 rewrites gup_test.c as a kselftest harness-based selftest. It
> covers all five GUP kernel functions (get_user_pages, get_user_pages_fast,
> pin_user_pages, pin_user_pages_fast, pin_user_pages with FOLL_LONGTERM)
> plus DUMP_USER_PAGES_TEST, across 12 mapping configurations (THP on,
> THP off and hugetlb, each across private/shared and read/write variants)
> and four batch sizes (1, 512, 123, all pages). Results are reported as
> standard TAP output with no command-line arguments required.

Thanks.  AI review asked a few things which seem fairly minor to me,
but probably legitimate:
	https://sashiko.dev/#/patchset/20260519120506.184512-1-sarthak.sharma@arm.com
