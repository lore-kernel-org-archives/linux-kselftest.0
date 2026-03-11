Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 862B43DCDB8;
	Wed, 11 Mar 2026 11:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773228336; cv=none; b=Z3Zn5mXrac21OKifMcTQkDyhqwpVmgAa3V7He2S/aL5ob8NFaPCBp8godl4C+mdTtm8MzlTpejhA11nzvM7UBpNKOg4NNUPlFxMGfjGD9T7tALfwlmN4gtQaox6G+7Of7C44f+39UJjSuFb8uw//gu6sJst3AwtX7BO7g5JAMso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773228336; c=relaxed/simple;
	bh=g2Y9MMMbhifyD8xLlvkjBkRE67yfHE5Dqvk7AeX9N9w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sg9eIK/e8UmWnS9RXlCYcLlT+i+P/AsZO5Gvi0Oc7dVG7WrLm1jdfKx44Rv+LkC74Q1s4MmP6OpwUXvb6ftC8D9hRgdC9sVAcRYzb/QFVN44C52jM9Vzs4ZsC7nUrQSnVBdfjWpRD6ZxlV/JIoX1/cMy1kOkMj80iYhv9ml7cRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OLWyz3wL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OLWyz3wL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5BA3C2BC86;
	Wed, 11 Mar 2026 11:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773228336;
	bh=g2Y9MMMbhifyD8xLlvkjBkRE67yfHE5Dqvk7AeX9N9w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OLWyz3wL7cjrXH3nCYFFOCr6iBlPMoNfNKuHBkEz9i9TuXzLeg51ZAzTrQu/IqSN8
	 7wfMjDnru52+BTWs5gMNyWzcHWvW9yt4WnxGvGye9oFDTy3ZQeUEYt7WAiI1c5hNN3
	 bp/fhfoY2U0wSt4a1+z0iV1aJ5Q+1fPSTRP7uPyvRnRqi6D3OQWX1kkRb3hWyuzeiN
	 TVLwxtL1hiZgkuXCs/ofSIfFSLHf5Aa1kq67BoqxaLLsJJEZ1b+7pZ+d6CsmaKl1O6
	 XMgI3i4yJloFaaemM9iBUiPo72GHO6foAkw7xbjShZjFd/MKLRgWmbcPtB2/+umUEA
	 uzPjNC4TqgD2A==
Date: Wed, 11 Mar 2026 11:25:30 +0000
From: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
To: Anthony Yznaga <anthony.yznaga@oracle.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, akpm@linux-foundation.org, david@kernel.org, 
	Liam.Howlett@oracle.com, vbabka@kernel.org, rppt@kernel.org, surenb@google.com, 
	mhocko@suse.com, jannh@google.com, pfalcato@suse.de, Jason@zx2c4.com, 
	shuah@kernel.org
Subject: Re: [PATCH v2 2/2] selftests/mm: verify droppable mappings cannot be
 locked
Message-ID: <55662200-c212-4146-bc23-7f3d210de3ee@lucifer.local>
References: <20260310155821.17869-1-anthony.yznaga@oracle.com>
 <20260310155821.17869-2-anthony.yznaga@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310155821.17869-2-anthony.yznaga@oracle.com>

On Tue, Mar 10, 2026 at 08:58:21AM -0700, Anthony Yznaga wrote:
> Verify that a mapping created with MAP_DROPPABLE cannot be locked
> via mlock(), and that it will not be locked if it's created after
> mlockall(MCL_FUTURE).
>
> Signed-off-by: Anthony Yznaga <anthony.yznaga@oracle.com>

Can confirm this test fails before your patch and passes after, so LGTM :)

Reviewed-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>
Tested-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>

> ---
>  tools/testing/selftests/mm/mlock2-tests.c | 78 ++++++++++++++++++++---
>  1 file changed, 69 insertions(+), 9 deletions(-)
>
> diff --git a/tools/testing/selftests/mm/mlock2-tests.c b/tools/testing/selftests/mm/mlock2-tests.c
> index b474f2b20def..b5790e717dd6 100644
> --- a/tools/testing/selftests/mm/mlock2-tests.c
> +++ b/tools/testing/selftests/mm/mlock2-tests.c
> @@ -1,6 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0
>  #define _GNU_SOURCE
>  #include <sys/mman.h>
> +#include <linux/mman.h>
>  #include <stdint.h>
>  #include <unistd.h>
>  #include <string.h>
> @@ -163,14 +164,17 @@ static int lock_check(unsigned long addr)
>  	return (vma_rss == vma_size);
>  }
>
> -static int unlock_lock_check(char *map)
> +static int unlock_lock_check(char *map, bool mlock_supported)
>  {
> -	if (is_vmflag_set((unsigned long)map, LOCKED)) {
> +	if (!is_vmflag_set((unsigned long)map, LOCKED))
> +		return 0;
> +
> +	if (mlock_supported)
>  		ksft_print_msg("VMA flag %s is present on page 1 after unlock\n", LOCKED);
> -		return 1;
> -	}
> +	else
> +		ksft_print_msg("VMA flag %s is present on an unsupported VMA\n", LOCKED);
>
> -	return 0;
> +	return 1;
>  }
>
>  static void test_mlock_lock(void)
> @@ -196,7 +200,7 @@ static void test_mlock_lock(void)
>  		ksft_exit_fail_msg("munlock(): %s\n", strerror(errno));
>  	}
>
> -	ksft_test_result(!unlock_lock_check(map), "%s: Unlocked\n", __func__);
> +	ksft_test_result(!unlock_lock_check(map, true), "%s: Unlocked\n", __func__);
>  	munmap(map, 2 * page_size);
>  }
>
> @@ -296,7 +300,7 @@ static void test_munlockall0(void)
>  		ksft_exit_fail_msg("munlockall(): %s\n", strerror(errno));
>  	}
>
> -	ksft_test_result(!unlock_lock_check(map), "%s: No locked memory\n", __func__);
> +	ksft_test_result(!unlock_lock_check(map, true), "%s: No locked memory\n", __func__);
>  	munmap(map, 2 * page_size);
>  }
>
> @@ -336,7 +340,61 @@ static void test_munlockall1(void)
>  		ksft_exit_fail_msg("munlockall() %s\n", strerror(errno));
>  	}
>
> -	ksft_test_result(!unlock_lock_check(map), "%s: No locked memory\n", __func__);
> +	ksft_test_result(!unlock_lock_check(map, true), "%s: No locked memory\n", __func__);
> +	munmap(map, 2 * page_size);
> +}
> +
> +/*
> + * Droppable memory should not be lockable.
> + */
> +static void test_mlock_droppable(void)
> +{
> +	char *map;
> +	unsigned long page_size = getpagesize();
> +
> +	/*
> +	 * Ensure MCL_FUTURE is not set.
> +	 */
> +	if (mlockall(MCL_CURRENT))
> +		ksft_exit_fail_msg("mlockall(MCL_CURRENT): %s\n", strerror(errno));
> +	if (munlockall())
> +		ksft_exit_fail_msg("munlockall() %s\n", strerror(errno));
> +
> +	map = mmap(NULL, 2 * page_size, PROT_READ | PROT_WRITE,
> +		   MAP_ANONYMOUS | MAP_DROPPABLE, -1, 0);
> +	if (map == MAP_FAILED)
> +		ksft_exit_fail_msg("mmap error: %s", strerror(errno));
> +
> +	if (mlock2_(map, 2 * page_size, 0)) {
> +		munmap(map, 2 * page_size);
> +		ksft_exit_fail_msg("mlock2(0): %s\n", strerror(errno));
> +	}
> +
> +	ksft_test_result(!unlock_lock_check(map, false), "%s: droppable memory not locked\n",
> +			__func__);
> +
> +	munmap(map, 2 * page_size);
> +}
> +
> +static void test_mlockall_future_droppable(void)
> +{
> +	char *map;
> +	unsigned long page_size = getpagesize();
> +
> +	if (mlockall(MCL_CURRENT | MCL_FUTURE))
> +		ksft_exit_fail_msg("mlockall(MCL_CURRENT | MCL_FUTURE): %s\n", strerror(errno));
> +
> +	map = mmap(NULL, 2 * page_size, PROT_READ | PROT_WRITE,
> +		   MAP_ANONYMOUS | MAP_DROPPABLE, -1, 0);
> +
> +	ksft_test_result(!unlock_lock_check(map, false), "%s: droppable memory not locked\n",
> +			__func__);
> +
> +	if (munlockall()) {
> +		munmap(map, 2 * page_size);
> +		ksft_exit_fail_msg("munlockall() %s\n", strerror(errno));
> +	}
> +
>  	munmap(map, 2 * page_size);
>  }
>
> @@ -442,7 +500,7 @@ int main(int argc, char **argv)
>
>  	munmap(map, size);
>
> -	ksft_set_plan(13);
> +	ksft_set_plan(15);
>
>  	test_mlock_lock();
>  	test_mlock_onfault();
> @@ -451,6 +509,8 @@ int main(int argc, char **argv)
>  	test_lock_onfault_of_present();
>  	test_vma_management(true);
>  	test_mlockall();
> +	test_mlock_droppable();
> +	test_mlockall_future_droppable();
>
>  	ksft_finished();
>  }
> --
> 2.47.3
>
