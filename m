Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCAF430F934;
	Tue,  5 May 2026 10:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777978425; cv=none; b=CSryl9T6aO+8anf+M4WUetERPks+2vkN3655A1DnQe/iUBJzdKdacys3prhWr61eJSRR73opEg2rUn5TVAx/wx5+tG1i8Iv+CjpAhmOfnfDV2RoeoufuS+GXtTq0odEQMxO29xfKDMwFucmHGslDxj+5EVIk4s5e4Yq0QMz9+/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777978425; c=relaxed/simple;
	bh=vJDvDo0M4pNgzGnLn1Lls5KK9p0fm7SJYJkfYATAMsg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O/R6YKTJDg5qqTv2JR/9uJFLoMELqQsSNFbHsKQ4cXDiSQ/tKxQEqrBI02+6JExiEP1TtPxzVHKfMQuiMF2ansb4wwyDil3l3gq3LUdN00koSrF9vlHKlcYtN+X8TVFaei7fIBhJaePe9X14ojBzGygUSDWd8OqMOlHQXiEFsvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pVkmqhUb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pVkmqhUb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E0F8C2BCC9;
	Tue,  5 May 2026 10:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777978425;
	bh=vJDvDo0M4pNgzGnLn1Lls5KK9p0fm7SJYJkfYATAMsg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pVkmqhUbdwd/0yjZI8oW6cR2A4rOXGkrmmA8fvRe4PacCQQiXlBTV/lnzjq0n3vCm
	 4KYvH+vu2iV2s7QLRk4JtY4MJ9BX145fCaFO+NzKfnuhjBkIns9k7deEIv679EciYW
	 2x8VzgMa/6m0Qyn6NMbvHw9/SCDgg9mN0IJOatA96F/cxw2Tx3940r6TM86j9lUgji
	 48WRp87KUAHL4OTJ5RGYnkg0rw4sdrAUY+T143Asrl58mSLe0CbJ2qpqHQVO6DJAvl
	 6sfUkbJcQv2amhvg/bWdfV1ZIoNzYdmacuxb/BgG+Ohn4mmklcsWHHpr+EKGLOonS/
	 HNXZBQK5WeBwg==
Date: Tue, 5 May 2026 11:53:40 +0100
From: Lorenzo Stoakes <ljs@kernel.org>
To: pratmal@google.com
Cc: akpm@linux-foundation.org, shuah@kernel.org, yosryahmed@google.com, 
	david@kernel.org, Liam.Howlett@oracle.com, vbabka@kernel.org, rppt@kernel.org, 
	surenb@google.com, mhocko@suse.com, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] selftests/mm: use pattern matching in .gitignore
Message-ID: <afnMAaz1jY94db2n@lucifer>
References: <20260421183000.1541546-1-pratmal@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260421183000.1541546-1-pratmal@google.com>

On Tue, Apr 21, 2026 at 06:30:00PM +0000, pratmal@google.com wrote:
> From: Pratyush Mallick <pratmal@google.com>
>
> The current .gitignore hardcodes each generated test binary by name,
> requiring updates every time a new test is added.
>
> Switch to the patten-matching approach similar to KVM:selftests.
> Ignore everything by default and then allow source extensions (.c, .h, .sh)
> and tracked non-source files.
>
> Signed-off-by: Pratyush Mallick <pratmal@google.com>

Niceee :) a lot of red, love it.

Assuming you have confirmed this is all working correctly, please un-RFC and
feel free to add:

Reviewed-by: Lorenzo Stoakes <ljs@kernel.org>

> ---
>  tools/testing/selftests/mm/.gitignore | 72 ++++-----------------------
>  1 file changed, 11 insertions(+), 61 deletions(-)
>
> diff --git a/tools/testing/selftests/mm/.gitignore b/tools/testing/selftests/mm/.gitignore
> index 83ad9454dd9d..92f9205d3996 100644
> --- a/tools/testing/selftests/mm/.gitignore
> +++ b/tools/testing/selftests/mm/.gitignore
> @@ -1,63 +1,13 @@
>  # SPDX-License-Identifier: GPL-2.0-only
> -cow
> -hugepage-mmap
> -hugepage-mremap
> -hugepage-shm
> -hugepage-vmemmap
> -hugetlb-madvise
> -hugetlb-read-hwpoison
> -hugetlb-soft-offline
> -khugepaged
> -map_hugetlb
> -map_populate
> -thuge-gen
> -compaction_test
> -memory-failure
> -migration
> -mlock2-tests
> -mrelease_test
> -mremap_dontunmap
> -mremap_test
> -on-fault-limit
> -transhuge-stress
> -pagemap_ioctl
> -pfnmap
> -process_madv
> -*.tmp*
> -protection_keys
> -protection_keys_32
> -protection_keys_64
> -madv_populate
> -uffd-stress
> -uffd-unit-tests
> -uffd-wp-mremap
> -mlock-intersect-test
> -mlock-random-test
> -virtual_address_range
> -gup_test
> -va_128TBswitch
> -map_fixed_noreplace
> -write_to_hugetlbfs
> -hmm-tests
> -memfd_secret
> -soft-dirty
> -split_huge_page_test
> -ksm_tests
> +*
> +!/**/
> +!*.c
> +!*.h
> +!*.sh
> +!.gitignore
> +!Makefile
> +!config
> +!settings
> +#Re-ignore generated files
>  local_config.h
> -local_config.mk
> -ksm_functional_tests
> -mdwe_test
> -gup_longterm
> -mkdirty
> -va_high_addr_switch
> -hugetlb_fault_after_madv
> -hugetlb_madv_vs_map
> -mseal_test
> -droppable
> -hugetlb_dio
> -pkey_sighandler_tests_32
> -pkey_sighandler_tests_64
> -guard-regions
> -merge
> -prctl_thp_disable
> -rmap
> +*.mod.c
> --
> 2.54.0.rc1.555.g9c883467ad-goog
>
