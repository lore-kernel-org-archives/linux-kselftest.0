Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4977F3CC323;
	Mon,  3 Aug 2026 11:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785755100; cv=none; b=b6oOxpC1/7wzcUEYb/AoZJSsFqlRm8SO6tOfLEIqMt0d4v36zO0a0JNIqIGyMnGuja28WwmReeIZm1XN0Ri5ior5wkjhHhtSCnnzTEPhjuYjglJoeCmB3TeIRBG7EgFLCglhK5eO25AZJxmY4WlVjeiYDsxWOjrvsCQHZr0nEdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785755100; c=relaxed/simple;
	bh=BxxC3PtPo9Bhp0czIp0UAlN57rvSHZnJ8NJHZU6lbaU=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=g6o591lHX1GNXFD7ZPd0sf4zcNbI0L6DoaxxSWT/H6K8LYPOjqp6ogwcf93UEXeY3aNgWrarnC9WuvP7swx6eWf6olUcPev5/XwkpfsRDvPjpjPBTLem81Xe1+VVojiooDCPCzciLx0grjobgdi3RgDFCnBvkxmBfmb5fGgFuFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O0YqXb+t; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O0YqXb+t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38C641F00A3A;
	Mon,  3 Aug 2026 11:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785755093;
	bh=Ks1cj+IK/DXNf3epxtAii131TgwfMzpouPW1sLOH93g=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=O0YqXb+t00tl3ECbfP/lkXDSqs+BKv+KYJKpMpR6mU1c0vHWc+Ehku9DJ/kBnbm5c
	 vZavzbZD5mGDTdjEoEw+hWxz0ox5txd+T6X0t4IsQkzDAF2Nt2to2k9rRlCOqQZQlb
	 Di06NCQZEDVow8YUH3SwU0A1XvcL5F62slZG1bF2UIgM1SzH8WaszxtVPoji3RJ6iW
	 So0C5yzYavT5oMOjJzS4vg0ytyoNWe3QKgy2ThsVAmC28zD4Pj7G+41VdXjhpHCvfD
	 IcH8SG64R7IpNGxrgp4ZOaTd1zRe0SMdjSl/SLDdcCA3W976WwEsCnpSlKDy88iBma
	 tTbJHUIyZwz0w==
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 03/16] selftests/mm: add folio-order detection
 self-check
From: Mike Rapoport <rppt@kernel.org>
To: Kiryl Shutsemau <kirill@shutemov.name>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 Nico Pache <nico.pache@linux.dev>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, Barry Song <baohua@kernel.org>, 
 Dev Jain <dev.jain@arm.com>, Hugh Dickins <hughd@google.com>, 
 Lance Yang <lance.yang@linux.dev>, "Liam R. Howlett" <liam@infradead.org>, 
 Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>, 
 Ryan Roberts <ryan.roberts@arm.com>, Shuah Khan <shuah@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Usama Arif <usama.arif@linux.dev>, 
 Vlastimil Babka <vbabka@kernel.org>, Zi Yan <ziy@nvidia.com>, 
 linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, "Kiryl Shutsemau (Meta)" <kas@kernel.org>
In-Reply-To: <20260802195254.1937477-4-kirill@shutemov.name>
References: <20260802195254.1937477-1-kirill@shutemov.name>
 <20260802195254.1937477-4-kirill@shutemov.name>
Date: Mon, 03 Aug 2026 14:04:23 +0300
Message-Id: <178575506324.1561566.11463012097204786161.b4-review@b4>
X-Mailer: b4 0.16-dev

> The upcoming khugepaged mTHP tests detect collapse results with the
> vm_util folio-order helpers instead of smaps AnonHugePages, which only
> sees PMD mappings. Before any collapse test trusts those helpers, make
> sure they agree with the kernel about what backs a mapping.
> 
> For every anon THP order the kernel supports, fault memory in with
> only that order enabled and require the helpers to classify the
> backing as exactly that order: not a neighbouring order, and 4K-backed
> memory as order 0.
> 
> Runs in the thp category of run_vmtests.sh. Verified on x86-64 4K
> (orders 0, 2-9) and arm64 64K (orders 0, 2-13).
> 
> Assisted-by: Claude-Code:claude-opus-5
> Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
>
> diff --git a/tools/testing/selftests/mm/.gitignore b/tools/testing/selftests/mm/.gitignore
> index 9ccd9e1447e6..54eefd8f97bc 100644
> --- a/tools/testing/selftests/mm/.gitignore
> +++ b/tools/testing/selftests/mm/.gitignore
> @@ -66,3 +66,4 @@ merge
>  prctl_thp_disable
>  rmap
>  folio_split_race_test
> +folio_order_check
> diff --git a/tools/testing/selftests/mm/Makefile b/tools/testing/selftests/mm/Makefile
> index 25d10ced3b3b..33917c76b871 100644
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
> index 000000000000..f70d766ff3eb
> --- /dev/null
> +++ b/tools/testing/selftests/mm/folio_order_check.c
> @@ -0,0 +1,138 @@
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
> +	char *p;
> +
> +	p = mmap(NULL, len, PROT_READ | PROT_WRITE,
> +		 MAP_ANONYMOUS | MAP_PRIVATE, -1, 0);
> +	if (p == MAP_FAILED)
> +		ksft_exit_fail_perror("mmap()");
> +
> +	aligned = ((uintptr_t)p + size - 1) & ~(size - 1);

We should really add ALIGN() to vm_util.h :)

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
> +		ksft_exit_fail_perror("open(\"/proc/self/pagemap\")");

Do we need quotes in perror() message?
open(/proc/self/pagemap) will do I think.


> +	kpageflags_fd = open("/proc/kpageflags", O_RDONLY);
> +	if (kpageflags_fd < 0)
> +		ksft_exit_skip("open(\"/proc/kpageflags\") requires root\n");

ditto

> +
> +	orders = thp_supported_orders();
> +	if (!orders)
> +		ksft_exit_skip("No supported THP orders\n");
> +
> +	ksft_set_plan(__builtin_popcountl(orders) + 1);
> +
> +	thp_save_settings();
> +	thp_read_settings(&settings);
> +	/* Base of the settings stack; the bottom entry is never popped. */
> +	thp_push_settings(&settings);
> +
> +	check_order(0);
> +	for (order = 1; order < NR_ORDERS; order++) {
> +		if (!(orders & (1UL << order)))
> +			continue;
> +		check_order(order);
> +	}
> +
> +	thp_restore_settings();

It's implicitly called at_exit().

-- 
Sincerely yours,
Mike.

