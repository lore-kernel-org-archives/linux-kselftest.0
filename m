Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E0523B8922;
	Thu, 20 Aug 2026 08:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787215274; cv=none; b=lZGr9YuvRIzYwV9pOg5zDsu9gWacTSVKaMcHdycnd8y8Glv1iEasWCzy5QLy9AYOMbjuzXqpjpbn2Oadel0fmKY+HFhBR4rtYnO8ynYM4F9X86OwvOciVUk8I4o+PeJmWSp47qtCG+IVOpd7mkLtdseQ9r7QIK+mtfN88HOxV4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787215274; c=relaxed/simple;
	bh=BLeQh4yfK49Uu625ng/X6uCr0znzzLm9xjXoPlahR4I=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=SOzSKisNxHJ/St8DuTkZGcYi+RvebrOkw27tORp+q+IZ8rABg29L1Jv4bIF4x5hsFUXCUTOwmcMLlePh7WMiihiPkLo8GH5psbT9kApUB2mCVG2YCt7ZKe40xnsC0R5h+YMfPh1D4bF0V0yRk82qTnoOXD4ZrL9MzcAGi8FJ8i8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KZ478M4c; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KZ478M4c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAEFF1F000E9;
	Thu, 20 Aug 2026 08:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787215273;
	bh=BI9ucAfGXnKuM+UnmA1L4/e1ETxV6nNHn0mE6kbCQA4=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=KZ478M4c5BdbmRXnxnOqYRXax2nVXgWzuVgjYSV7qivyJ4s9HziX57p5mToNutlyl
	 UHMh08FORsSMPbNaxQKC/lQIh+wb94SnVpSe5p/VhjRY1FiGj3ZlLF+pAFGdHlK66p
	 NF9ZYtXXp9/+tpS1hlEJulkFpGrfqIx/c90nw1/5h3Raso7QvViQosacvaV+K+zesy
	 e3oNEpmFf9igYlXCMlOjaaKvVHe7xh53UHek4iMVeVq9l1BAThl4uXy8JXV10Q+PNz
	 GUaBgiGuxSbpBrC5/nr8t+iqwFZee6CX8mFyeENocM0mwoumpHE6DYNSylNTq9cHWu
	 HX8Tx7hTLAN7A==
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v4 09/19] selftests/mm: add folio-order detection
 self-check
From: Mike Rapoport <rppt@kernel.org>
To: Kiryl Shutsemau <kirill@shutemov.name>
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org, 
 nico.pache@linux.dev, baolin.wang@linux.alibaba.com, baohua@kernel.org, 
 dev.jain@arm.com, hughd@google.com, lance.yang@linux.dev, 
 liam@infradead.org, mhocko@suse.com, rppt@kernel.org, ryan.roberts@arm.com, 
 shuah@kernel.org, surenb@google.com, usama.arif@linux.dev, 
 vbabka@kernel.org, ziy@nvidia.com, usama.anjum@arm.com, 
 agordeev@linux.ibm.com, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kas@kernel.org
In-Reply-To: <20260815015901.1236937-10-kirill@shutemov.name>
References: <20260815015901.1236937-1-kirill@shutemov.name>
 <20260815015901.1236937-10-kirill@shutemov.name>
Date: Thu, 20 Aug 2026 11:40:35 +0300
Message-Id: <178721523517.2799959.2678582848682782159.b4-review@b4>
X-Mailer: b4 0.17-dev

> The khugepaged mTHP tests detect collapse results with the vm_util
> folio-order helpers rather than smaps AnonHugePages, which only sees PMD
> mappings.  If those helpers are wrong, every case built on them is wrong
> the same way, and nothing says so.
> 
> Check them directly.  For every anon THP order the kernel supports, fault
> memory in with only that order enabled.  Require the helpers to classify
> the backing as exactly that order: not a neighbouring order, and 4K-backed
> memory as order 0.
> 
> Run it in the thp category, ahead of ./khugepaged, so a broken helper is
> reported as itself rather than as a collapse failure.  Verified on x86-64
> 4K (orders 0, 2-9) and arm64 64K (orders 0, 2-13).
> 
> The test needs ALIGN(), which hmm-tests.c and migration.c each defined
> privately.  Move it to vm_util.h and drop both copies.
> 
> Assisted-by: Claude-Code:claude-opus-5
> Tested-by: Muhammad Usama Anjum <usama.anjum@arm.com>
> Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
>
> diff --git a/tools/testing/selftests/mm/Makefile b/tools/testing/selftests/mm/Makefile
> index 2d5366196e30..2093fcf6e915 100644
> --- a/tools/testing/selftests/mm/Makefile
> +++ b/tools/testing/selftests/mm/Makefile
> @@ -104,6 +104,7 @@ TEST_GEN_FILES += guard-regions
>  TEST_GEN_FILES += merge
>  TEST_GEN_FILES += rmap
>  TEST_GEN_FILES += folio_split_race_test
> +TEST_GEN_FILES += folio_order_check
>  
>  ifneq ($(ARCH),arm64)
>  TEST_GEN_FILES += soft-dirty
> diff --git a/tools/testing/selftests/mm/folio_order_check.c b/tools/testing/selftests/mm/folio_order_check.c
> new file mode 100644
> index 000000000000..93030a42c3cc
> --- /dev/null
> +++ b/tools/testing/selftests/mm/folio_order_check.c
> @@ -0,0 +1,137 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Self-check for the vm_util folio-order detection helpers,
> + * is_backed_by_folio() and is_range_backed_by_folio_orders().
> + *
> + * For every anon THP order the kernel supports, fault memory in with only
> + * that order enabled and verify the helpers report exactly that order:
> + * not a neighbouring order, and plain 4K memory as order 0. The helpers
> + * are what the khugepaged mTHP tests use to detect collapse results, so
> + * they must agree with the kernel's own idea of the backing before any
> + * collapse test relies on them.
> + */
> +#define _GNU_SOURCE
> +#include <fcntl.h>
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <sys/mman.h>
> +#include <unistd.h>
> +
> +#include "kselftest.h"
> +#include "vm_util.h"
> +#include "hugepage_settings.h"
> +
> +static int pagemap_fd;
> +static int kpageflags_fd;
> +
> +/* mmap an anon VMA of exactly @size bytes at a @size-aligned address. */
> +static char *alloc_aligned(size_t size)
> +{
> +	size_t len = size * 2;
> +	uintptr_t aligned;

wouldn't void * result in fewer castings?

> +	char *p;
> +
> +	p = mmap(NULL, len, PROT_READ | PROT_WRITE,
> +		 MAP_ANONYMOUS | MAP_PRIVATE, -1, 0);
> +	if (p == MAP_FAILED)
> +		ksft_exit_fail_perror("mmap()");
> +
> +	aligned = ALIGN((uintptr_t)p, size);
> +	if (aligned != (uintptr_t)p)
> +		munmap(p, aligned - (uintptr_t)p);
> +	if (aligned + size != (uintptr_t)p + len)
> +		munmap((char *)aligned + size,
> +		       (uintptr_t)p + len - aligned - size);
> +
> +	return (char *)aligned;
> +}
> +
> +/*
> + * Enable only @order (order 0: nothing), fault one aligned window in and
> + * check the helpers see exactly @order.

... check that is_range_backed_by_folio_orders() sees ...

> + */
> +static void check_order(int order)
> +{
> +	struct thp_settings settings = *thp_current_settings();
> +	size_t size = psize() << order;
> +	bool ok = true;
> +	char *p;
> +	int i;
> +
> +	for (i = 0; i < NR_ORDERS; i++)
> +		settings.hugepages[i].enabled = THP_NEVER;
> +	if (order)
> +		settings.hugepages[order].enabled = THP_ALWAYS;
> +	thp_push_settings(&settings);
> +
> +	p = alloc_aligned(size);
> +	*p = 1;
> +
> +	if (!is_range_backed_by_folio_orders(p, size, order,
> +					     pagemap_fd, kpageflags_fd)) {
> +		ksft_print_msg("order %d not detected after fault\n", order);
> +		ok = false;
> +	}
> +
> +	/* A lower order must be rejected: the folio is larger. */
> +	if (order && is_range_backed_by_folio_orders(p, size, order - 1,
> +						     pagemap_fd,
> +						     kpageflags_fd)) {
> +		ksft_print_msg("order %d also reported as order %d\n",
> +			       order, order - 1);
> +		ok = false;
> +	}
> +
> +	/* Order 0 pages must not look like any large folio, and vice versa. */
> +	if (order && is_range_backed_by_folio_orders(p, size, 0,
> +						     pagemap_fd,
> +						     kpageflags_fd)) {
> +		ksft_print_msg("order %d also reported as order 0\n", order);
> +		ok = false;
> +	}
> +
> +	munmap(p, size);
> +	thp_pop_settings();
> +
> +	ksft_test_result(ok, "order %d classified\n", order);
> +}
> +
> +int main(void)
> +{
> +	struct thp_settings settings;
> +	unsigned long orders;
> +	int order;
> +
> +	ksft_print_header();
> +
> +	if (!thp_available())
> +		ksft_exit_skip("Transparent Hugepages not available\n");
> +
> +	pagemap_fd = open("/proc/self/pagemap", O_RDONLY);
> +	if (pagemap_fd < 0)
> +		ksft_exit_fail_perror("open(/proc/self/pagemap)");
> +	kpageflags_fd = open("/proc/kpageflags", O_RDONLY);
> +	if (kpageflags_fd < 0)
> +		ksft_exit_skip("open(\"/proc/kpageflags\") requires root\n");

No need to quote the file name I think.

-- 
Sincerely yours,
Mike.

