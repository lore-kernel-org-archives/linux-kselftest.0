Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DABAB46D0AB
	for <linux-kselftest@vger.kernel.org>; Fri, 14 Aug 2026 12:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786711195; cv=none; b=mr5HwAzSv0JXZD3DwMCULqbhVFuVIkgeHzFRV5PyzYiXyvQdJMxpWKcMUByhbzVUw8OI7rRyvipLN1DMkKgAFjtcluXCsQWzPq9rMJqiTr+YQrKYwtWw6Y9+jn2CSSM7NxQZhJdIGiSqgFW92a12MsjUQT+ZG7LL3Rru3Lf751c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786711195; c=relaxed/simple;
	bh=ZipMI6rrRDxNdE7iUWCi/QHS2GAziEu+lrHyF1Ss0tY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ok1qFw550jbHIDbd3gnf4OpJHqXl5az11yvw3r85s0eOSqwvsjDk9MsTyZJQsaEOR/zkg5CNS7FLHvNxUfse0nyFdaCVAxF611t9fF3bugPYRb6zFnqwSEgMrNUtI2v3uO2IpmWIQ69zX16eQodvNkjMTZkPcx1LuweOusrM8tQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O+kVpgCi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O+kVpgCi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8C5E1F00A3A;
	Fri, 14 Aug 2026 12:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786711191;
	bh=4sg2Fpi/B0x2kWvzgITLa65nTIYhPhK7l7uRWEIj1A8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=O+kVpgCiOmkp8MZDf66Mx7mlR3n94nqd1qtfgseHoWHpco+dyzQY2x1b77Q47piJC
	 V0kVXfP06DjTRL4VxW2tlseUWftYTnTBNL/egp79Z6DW1S8rCm3Q8CEOJBm3LKKVun
	 AcpBf8WqTSpncOY0zaZOEbsJV9Fp54WVwBa0q8oZPiwBSEGHq7oBdIl77PhbpqA427
	 50KAv5SH/rqGr8R68XsP71fpTQoKLn/fsoubLPq7CiHz3Bq4IdGQvK6JWOgpcU2Gqy
	 rJLz4cXoVKBFcNa7WlDSjHBM4EV9z+BpkXq+FYeoSzVtP1r6QtvWfEUlrY7ntZMsF2
	 zXnQmTbraQe/w==
Date: Fri, 14 Aug 2026 13:39:33 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Hajime Tazaki <thehajime@gmail.com>
Cc: linux-mm@kvack.org, geert@linux-m68k.org, daniel@thingy.jp, 
	Shuah Khan <shuah@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, linux-kselftest@vger.kernel.org, 
	linux-um@lists.infradead.org
Subject: Re: [RFC PATCH 4/6] selftests: fix build errors on alpine linux
Message-ID: <an8MHlxZzu6a_1ui@lucifer>
References: <20260813063401.1786548-1-thehajime@gmail.com>
 <20260813063401.1786548-5-thehajime@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260813063401.1786548-5-thehajime@gmail.com>

On Thu, Aug 13, 2026 at 03:33:59PM +0900, Hajime Tazaki wrote:
> Some nommu architectures only work on Alpine Linux, which doesn't use
> glibc for the standard library.  It uses musl-libc and is implemented in
> a different way as glibc, resulting build failures.
>
> This commit fixes this issue by adding missing definitions. The fixes
> are now only covered to TARGETS=mm which was tested for the moment;
> future contributions are needed to fully build/execute tests on nommu
> platforms.
>
> Cc: Shuah Khan <shuah@kernel.org>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: David Hildenbrand <david@kernel.org>
> Cc: Lorenzo Stoakes <ljs@kernel.org>
> Cc: "Liam R. Howlett" <liam@infradead.org>
> Cc: Vlastimil Babka <vbabka@kernel.org>
> Cc: Mike Rapoport <rppt@kernel.org>
> Cc: Suren Baghdasaryan <surenb@google.com>
> Cc: Michal Hocko <mhocko@suse.com>
> Cc: linux-kselftest@vger.kernel.org
> Cc: linux-mm@kvack.org
> Cc: linux-um@lists.infradead.org
> Signed-off-by: Hajime Tazaki <thehajime@gmail.com>

I mean vaguely looks un-invasive which is the test here.

Couple comments below.

> ---
>  tools/testing/selftests/kselftest.h      | 43 ++++++++++++++++++++++++
>  tools/testing/selftests/lib.mk           |  2 +-
>  tools/testing/selftests/mm/hugetlb_dio.c |  8 ++---
>  tools/testing/selftests/mm/mdwe_test.c   |  4 +--
>  4 files changed, 50 insertions(+), 7 deletions(-)
>
> diff --git a/tools/testing/selftests/kselftest.h b/tools/testing/selftests/kselftest.h
> index ae18c491ae53..ac21bf3d802e 100644
> --- a/tools/testing/selftests/kselftest.h
> +++ b/tools/testing/selftests/kselftest.h
> @@ -58,6 +58,7 @@
>  #include <string.h>
>  #include <stdio.h>
>  #include <sys/utsname.h>
> +#include <stdint.h>
>  #endif
>
>  #ifndef ARRAY_SIZE
> @@ -81,6 +82,48 @@
>  #endif
>  #endif /* end arch */
>
> +#if !defined(NOLIBC) && !defined(__GLIBC__)
> +#ifdef __LP64__
> +typedef int64_t __fsword_t;
> +#else
> +typedef int32_t __fsword_t;
> +#endif
> +
> +/*
> + * for a workaround to avoid struct conflict under
> + * musl-libc (<sys/prctl.h> v.s. <linux/prctl.h>)
> + */
> +#include <sys/prctl.h>
> +#ifndef _LINUX_PRCTL_H
> +#define _LINUX_PRCTL_H
> +#endif
> +
> +#ifndef PR_SET_MDWE
> +#define PR_SET_MDWE 65
> +#endif
> +
> +#ifndef PR_MDWE_REFUSE_EXEC_GAIN
> +#define PR_MDWE_REFUSE_EXEC_GAIN (1UL << 0)
> +#endif
> +
> +#ifndef PR_MDWE_NO_INHERIT
> +#define PR_MDWE_NO_INHERIT (1UL << 1)
> +#endif
> +
> +#ifndef PR_GET_MDWE
> +#define PR_GET_MDWE 66
> +#endif
> +
> +#ifndef PR_SET_MEMORY_MERGE
> +#define PR_SET_MEMORY_MERGE 67
> +#endif
> +
> +#ifndef PR_GET_MEMORY_MERGE
> +#define PR_GET_MEMORY_MERGE 68
> +#endif
> +
> +#endif
> +
>  /* define kselftest exit codes */
>  #define KSFT_PASS  0
>  #define KSFT_FAIL  1
> diff --git a/tools/testing/selftests/lib.mk b/tools/testing/selftests/lib.mk
> index f02cc8a2e4ae..2cc819006424 100644
> --- a/tools/testing/selftests/lib.mk
> +++ b/tools/testing/selftests/lib.mk
> @@ -197,7 +197,7 @@ clean: $(if $(TEST_GEN_MODS_DIR),clean_mods_dir)
>  	$(CLEAN)
>
>  # Build with _GNU_SOURCE by default

You probably want to update this comment.

> -CFLAGS += -D_GNU_SOURCE=
> +CFLAGS += -D_GNU_SOURCE= -D_LARGEFILE64_SOURCE
>
>  # Additional include paths needed by kselftest.h and local headers
>  CFLAGS += -I${top_srcdir}/tools/testing/selftests
> diff --git a/tools/testing/selftests/mm/hugetlb_dio.c b/tools/testing/selftests/mm/hugetlb_dio.c
> index fb4600570e13..aee6be530ccb 100644
> --- a/tools/testing/selftests/mm/hugetlb_dio.c
> +++ b/tools/testing/selftests/mm/hugetlb_dio.c
> @@ -22,12 +22,9 @@
>  #include "kselftest.h"
>  #include "hugepage_settings.h"
>
> -#ifndef STATX_DIOALIGN
> -#define STATX_DIOALIGN		0x00002000U
> -#endif
> -
>  static int get_dio_alignment(int fd)
>  {
> +#ifdef STATX_DIOALIGN
>  	struct statx stx;
>  	int ret;
>
> @@ -43,6 +40,9 @@ static int get_dio_alignment(int fd)
>  		return 1;
>
>  	return stx.stx_dio_offset_align;
> +#else
> +	return -1;
> +#endif

Probably better to declare different functions to make this less hideous.

>  }
>
>  static bool check_dio_alignment(unsigned int start_off,
> diff --git a/tools/testing/selftests/mm/mdwe_test.c b/tools/testing/selftests/mm/mdwe_test.c
> index 647779653da0..031c79ed067e 100644
> --- a/tools/testing/selftests/mm/mdwe_test.c
> +++ b/tools/testing/selftests/mm/mdwe_test.c
> @@ -1,5 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0
>
> +#include "kselftest_harness.h"
> +
>  #ifdef __aarch64__
>  #include <asm/hwcap.h>
>  #endif
> @@ -14,8 +16,6 @@
>  #include <sys/wait.h>
>  #include <unistd.h>
>
> -#include "kselftest_harness.h"
> -
>  #ifndef __aarch64__
>  # define PROT_BTI	0
>  #endif
> --
> 2.43.0
>

--
Cheers, Lorenzo
