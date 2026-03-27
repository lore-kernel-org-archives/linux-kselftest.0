Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8332D3CA48E;
	Fri, 27 Mar 2026 07:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774597402; cv=none; b=AxvK9F0HKIPiAwYPocUF7lsnuH5ZgUvZv2Az8yaorIci14vLe+cRA1WUZk967fDUl79t/55qfc93qMIXf8FQxhcgVox2P+bpZ9pxqoamTcpEVL3DOwKt3gi3asvtru/kf0nJ5c7eN0Pc4aCdZGlkUVIr4tlcvwtLDauxLcSKzck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774597402; c=relaxed/simple;
	bh=eyiuDI5+j2IGudrMvn0lNdS+Db9kkRSzKAotrCUDXlw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jGxfwym3yDogE+SY9T91Bx26qvuDgHZ8Bm9l5ObBUNAxIUOFU54SYhyjZac/OLm/13P4yP15CbMHI+RFZYmsph1alJ1xdiweP/Zkw+P7JP/NCeMIWBsFDub1ud1BVRxX2Pel8WezH/lkkF1RQBFtw8hZYDgQWIFOnywIPy4IF4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DlLhAyHe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DlLhAyHe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF11BC19423;
	Fri, 27 Mar 2026 07:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774597401;
	bh=eyiuDI5+j2IGudrMvn0lNdS+Db9kkRSzKAotrCUDXlw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DlLhAyHeZhRIChrdemb+X2yZ7YUm9230Cu6LUCehyh9PNxz6ZwHOSrv2d/UXn+gIv
	 0yLlEnQX5FML37QQZwNZORmJQFoAkPTUfEccEiWjzPZewFYGf+TeyDFxR0NVM3J4ZK
	 bDbFc2F2n74L1yzTkMCcL766zNGRfvq6Vu2LMca3gY+bvdMfPVC7OlIaDiCN0JEDrC
	 4GHMfq+bvPDER8AX1qL280a2yKuQiWH7TR1dWykAHLhkyRjtTTPZNwaCkR+W1ZN4L/
	 QxPqLA6ucd7xpdsRSvHnv9BlIXuzqgLIYrPm8klZcUBEjrvjHYD/cNFvKZv6s2GoHb
	 d5xzoV37OhUpg==
Date: Fri, 27 Mar 2026 07:43:14 +0000
From: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
To: Chunyu Hu <chuhu@redhat.com>
Cc: akpm@linux-foundation.org, david@kernel.org, shuah@kernel.org, 
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org, 
	surenb@google.com, mhocko@suse.com, ziy@nvidia.com, baolin.wang@linux.alibaba.com, 
	npache@redhat.com, ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org, 
	lance.yang@linux.dev, Li Wang <liwang@redhat.com>
Subject: Re: [PATCH v6 1/6] selftests/mm/guard-regions: skip collapse test
 when thp not enabled
Message-ID: <399e238e-ed6a-4d74-b075-ead17fb47d3c@lucifer.local>
References: <20260324013316.2590422-1-chuhu@redhat.com>
 <20260324013316.2590422-2-chuhu@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260324013316.2590422-2-chuhu@redhat.com>

On Tue, Mar 24, 2026 at 09:33:11AM +0800, Chunyu Hu wrote:
> When thp is not available, just skip the collape tests to avoid the false
> negative.
>
> Without the change, run with a thp disabled kernel:
>   ./run_vmtests.sh -t madv_guard -n 1
>   <snip/>
>   #  RUN           guard_regions.anon.collapse ...
>   # guard-regions.c:2217:collapse:Expected madvise(ptr, size, MADV_NOHUGEPAGE) (-1) == 0 (0)
>   # collapse: Test terminated by assertion
>   #          FAIL  guard_regions.anon.collapse
>   not ok 2 guard_regions.anon.collapse
>   <snip/>
>   #  RUN           guard_regions.shmem.collapse ...
>   # guard-regions.c:2217:collapse:Expected madvise(ptr, size, MADV_NOHUGEPAGE) (-1) == 0 (0)
>   # collapse: Test terminated by assertion
>   #          FAIL  guard_regions.shmem.collapse
>   not ok 32 guard_regions.shmem.collapse
>   <snip/>
>   #  RUN           guard_regions.file.collapse ...
>   # guard-regions.c:2217:collapse:Expected madvise(ptr, size, MADV_NOHUGEPAGE) (-1) == 0 (0)
>   # collapse: Test terminated by assertion
>   #          FAIL  guard_regions.file.collapse
>   not ok 62 guard_regions.file.collapse
>   <snip/>
>   # FAILED: 87 / 90 tests passed.
>   # 17 skipped test(s) detected. Consider enabling relevant config options to improve coverage.
>   # Totals: pass:70 fail:3 xfail:0 xpass:0 skip:17 error:0
>
> With this change, run with thp disabled kernel:
>   ./run_vmtests.sh -t madv_guard -n 1
>   <snip/>
>   #  RUN           guard_regions.anon.collapse ...
>   #      SKIP      Transparent Hugepages not available
>   #            OK  guard_regions.anon.collapse
>   ok 2 guard_regions.anon.collapse # SKIP Transparent Hugepages not available
>   <snip/>
>   #  RUN           guard_regions.file.collapse ...
>   #      SKIP      Transparent Hugepages not available
>   #            OK  guard_regions.file.collapse
>   ok 62 guard_regions.file.collapse # SKIP Transparent Hugepages not available
>   <snip/>
>   #  RUN           guard_regions.shmem.collapse ...
>   #      SKIP      Transparent Hugepages not available
>   #            OK  guard_regions.shmem.collapse
>   ok 32 guard_regions.shmem.collapse # SKIP Transparent Hugepages not available
>   <snip/>
>   # PASSED: 90 / 90 tests passed.
>   # 20 skipped test(s) detected. Consider enabling relevant config options to improve coverage.
>   # Totals: pass:70 fail:0 xfail:0 xpass:0 skip:20 error:0
>
> Acked-by: David Hildenbrand (Arm) <david@kernel.org>
> Reviewed-by: Zi Yan <ziy@nvidia.com>
> Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> CC: Li Wang <liwang@redhat.com>
> Signed-off-by: Chunyu Hu <chuhu@redhat.com>

Pretty sure I reviewed this already (but hey I forget to propagate tags myself
sometimes so meh :P), anyway:

Reviewed-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>

Cheers, Lorenzo

> ---
> Changes in v5:
>   - updated reviewed-by and acked-by
> Changes in v4:
>   - use thp_available instead of thp_is_enabled() as when thp is set to
>     never, madvise(MADV_COLLAPSE) will still succeed by design. So a
>     failure in madvise(MADV_COLLAPSE) on guard region will verify guard
>     region denies it. This is suggested from AI.
>   - removed the 'Reviewed-by' and 'Acked-by' as the code changes. Sorry for
>     that but it seems the changes is a little huge? (1 out of 2 lines)..
> Changes in v3:
>   - commit message: update the log snippet with where the fail happens and
>     add the '-n1' to the command.
>   - fix the 'false positive' to 'false negative'
>   - add reviwed by from Mike
> Changes in v2:
>   - add reviewed by from Zi and Lorenzo
>   - add acked-by from David
> ---
>  tools/testing/selftests/mm/guard-regions.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/tools/testing/selftests/mm/guard-regions.c b/tools/testing/selftests/mm/guard-regions.c
> index dbd21d66d383..48e8b1539be3 100644
> --- a/tools/testing/selftests/mm/guard-regions.c
> +++ b/tools/testing/selftests/mm/guard-regions.c
> @@ -21,6 +21,7 @@
>  #include <sys/uio.h>
>  #include <unistd.h>
>  #include "vm_util.h"
> +#include "thp_settings.h"
>
>  #include "../pidfd/pidfd.h"
>
> @@ -2195,6 +2196,9 @@ TEST_F(guard_regions, collapse)
>  	char *ptr;
>  	int i;
>
> +	if (!thp_available())
> +		SKIP(return, "Transparent Hugepages not available\n");
> +
>  	/* Need file to be correct size for tests for non-anon. */
>  	if (variant->backing != ANON_BACKED)
>  		ASSERT_EQ(ftruncate(self->fd, size), 0);
> --
> 2.53.0
>
