Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A548236A03A;
	Thu, 19 Mar 2026 17:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773940873; cv=none; b=GLpXSkaNhTViztPbCRpqZInx8fKuPUoNLV9T4T2ViXj/7tJYxzzdbqTzjCOvdJazN4NV6IFbTisUupfWuQwV/wBTLUNb317gqzoWMhYtM4Mas+jN7p96hp1zIu28Uhy0f2fRoWvX81QiZHwNca33jWDx1QAmyXnI8KzKD7VCvyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773940873; c=relaxed/simple;
	bh=3b6YqAkapmSDefp0qy4dwdPUjANX/OK7tVoPqcanxz4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i1MTcjJd27qTjlp+A5lWn6PpvISi5xMSkZ+D0+fK40B1sMdgkSMLmWYqeDi+rjPZ98OyKLZiZsjDGxY/N/myISCI6SojAPrtmQN84dKUiGiwTUEf0q1zxjxg8kY2Y6U+PHVQ/6qvTIoc3LxbeGwO2sNi7o78zSCyACEHVHiVLEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SZdx2Prs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SZdx2Prs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C273C19424;
	Thu, 19 Mar 2026 17:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773940873;
	bh=3b6YqAkapmSDefp0qy4dwdPUjANX/OK7tVoPqcanxz4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SZdx2PrsXJgpbU+zzwntBo7drYhhQRyydtcfqtmVAEsmkXY7+2UhwaaC7x10LCpfE
	 mP0SFlWNqdUwMc2eGLEt0whI2xqWw3K0UeDHirldfuA4lxdsS8qoFlu7X13/K+uS2b
	 T028yzQuWp9PEU7X6z2FA/+wlqYCzqU0/qIXbVic8fc+RHAIMOD/LynnSqhHnw/kaN
	 VhTEejhGk95L05hPq9XelkmzOOcP0XP+VX976DuV7nSORSQyP02R+pJiJXOJJojzYv
	 HJ61YNSvhfV//T9wo4Lym3BUyr3g9QM3foHE0XpkAvogerRe/ZRjsF8mPGVAnsO0/8
	 VjpYK6I4QvJAA==
Date: Thu, 19 Mar 2026 19:21:03 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Chunyu Hu <chuhu@redhat.com>
Cc: akpm@linux-foundation.org, david@kernel.org, shuah@kernel.org,
	linux-mm@kvack.org, ljs@kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org, lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com, vbabka@suse.cz, surenb@google.com,
	mhocko@suse.com, ziy@nvidia.com, baolin.wang@linux.alibaba.com,
	npache@redhat.com, ryan.roberts@arm.com, dev.jain@arm.com,
	baohua@kernel.org, lance.yang@linux.dev,
	Li Wang <liwang@redhat.com>
Subject: Re: [PATCH v4 1/5] selftests/mm/guard-regions: skip collapse test
 when thp not enabled
Message-ID: <abwwf6WlLwdQDBE0@kernel.org>
References: <20260319160656.1480279-1-chuhu@redhat.com>
 <20260319160656.1480279-2-chuhu@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260319160656.1480279-2-chuhu@redhat.com>

On Fri, Mar 20, 2026 at 12:06:52AM +0800, Chunyu Hu wrote:
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
> CC: Li Wang <liwang@redhat.com>
> Signed-off-by: Chunyu Hu <chuhu@redhat.com>

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

> ---
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
> 
> base-commit: 8a30aeb0d1b4e4aaf7f7bae72f20f2ae75385ccb
> -- 
> 2.53.0
> 

-- 
Sincerely yours,
Mike.
