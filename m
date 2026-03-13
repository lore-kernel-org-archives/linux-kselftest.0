Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FE7A3B52F8;
	Fri, 13 Mar 2026 15:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773416163; cv=none; b=imYO54CHNemwjO/LmVFgHfv9aDW24IXSYcCnnB9BEL8RXyLH856cuEK3ALnUEbEP7AolmsBsX2UTLurG7/a8hHZQtmsaEFZ727Xb9g67SzStYr1G+UbsyhwGQg74VDktCZPDHR0ImIUa9UdhBrf95Xib5F/tEUzfDNPMvuPaRZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773416163; c=relaxed/simple;
	bh=8CTc2A4Y/FaXlXTchN73Tai25CXorxmWgxGIdw1ZJVM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BzmnLy5gypNH+GlK3qcynVQXUoBVrPmpo7Rl2m7Mls0M4d+v/KJtzBn3V0sMXjTqyEupdp/SVO/O4mYCU99V8TPPueaj8ucCaqIpm21/mSirC5Yr2yI8u8dfK7nkSIjDMZ50WoWg4foMMJy+4Eecg0weERlU4x6d+ye5Y7OBEpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k/xzZO5t; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k/xzZO5t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C858C19421;
	Fri, 13 Mar 2026 15:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773416162;
	bh=8CTc2A4Y/FaXlXTchN73Tai25CXorxmWgxGIdw1ZJVM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k/xzZO5t/wLPFo20XtpLKo/vxjUUykRZxGexCi2DjU1XUbSUwW0+HBOs8mY46TByB
	 yD53oGpu+25ooVbSBwgTUnNoOOP4XZ1oNGaaIt0o0QE99L6ugp4TbeTA1EWylq/UCV
	 /EDNPnAyUrbEnXPRvtqUA096JeyHkx0+A1Wg6JmCbLN+91C8OY46MFWMwU077HwKD+
	 Si9jhPtwNam3sBihNNnZahvKGjqmhGcNRyXLVlPr9JhqU9wYLUWYpLX47tSGNVgtkP
	 qVElMluhW6ohJMSQUbtROl1FtOr+zpPhrXMdZbAG156w7rezNeO8RDxAEWiCxKx0DK
	 fAnQfQMcHmfiQ==
Date: Fri, 13 Mar 2026 15:35:55 +0000
From: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
To: Chunyu Hu <chuhu@redhat.com>
Cc: akpm@linux-foundation.org, david@kernel.org, shuah@kernel.org, 
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org, 
	surenb@google.com, mhocko@suse.com, ziy@nvidia.com, baolin.wang@linux.alibaba.com, 
	npache@redhat.com, ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org, 
	lance.yang@linux.dev, Li Wang <liwang@redhat.com>
Subject: Re: [RESEND PATCH 1/4] selftests/mm/guard-regions: skip collapse
 test when thp not enabled
Message-ID: <097793cf-10f9-4b0d-9d13-f728fc0c4d58@lucifer.local>
References: <20260312114027.634559-1-chuhu@redhat.com>
 <20260312114027.634559-2-chuhu@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260312114027.634559-2-chuhu@redhat.com>

On Thu, Mar 12, 2026 at 07:40:24PM +0800, Chunyu Hu wrote:
> When thp is not available, just skip the collape tests to avoid the false
> positive.
>
> Without the change, run with a thp disabled kernel:
>   ./run_vmtests.sh -t madv_guard
>   <snip/>
>   # #  RUN           guard_regions.file.multi_vma ...
>   # #            OK  guard_regions.file.multi_vma
>   # ok 89 guard_regions.file.multi_vma
>   # #  RUN           guard_regions.file.basic ...
>   # #            OK  guard_regions.file.basic
>   # ok 90 guard_regions.file.basic
>   # # FAILED: 87 / 90 tests passed.
>   # # 17 skipped test(s) detected. Consider enabling relevant config options to improve coverage.
>   # # Totals: pass:70 fail:3 xfail:0 xpass:0 skip:17 error:0
>   # [FAIL]
>   not ok 1 guard-regions # exit=1
>   hwpoison_inject
>   # SUMMARY: PASS=0 SKIP=0 FAIL=1
>
> With this change, run with thp disabled kernel:
>   ./run_vmtests.sh -t madv_guard
>   <snip/>
>   # ok 90 guard_regions.file.basic
>   # # PASSED: 90 / 90 tests passed.
>   # # 20 skipped test(s) detected. Consider enabling relevant config options to improve coverage.
>   # # Totals: pass:70 fail:0 xfail:0 xpass:0 skip:20 error:0
>   # [PASS]
>   ok 1 guard-regions
>   hwpoison_inject
>   # SUMMARY: PASS=1 SKIP=0 FAIL=0
>   1..1
> CC: Li Wang <liwang@redhat.com>
> Signed-off-by: Chunyu Hu <chuhu@redhat.com>

LGTM thanks, so:

Reviewed-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>

> ---
>  tools/testing/selftests/mm/guard-regions.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/tools/testing/selftests/mm/guard-regions.c b/tools/testing/selftests/mm/guard-regions.c
> index dbd21d66d383..897af9c512f9 100644
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
> +	if (!thp_is_enabled())
> +		SKIP(return, "Transparent Hugepages not available\n");
> +
>  	/* Need file to be correct size for tests for non-anon. */
>  	if (variant->backing != ANON_BACKED)
>  		ASSERT_EQ(ftruncate(self->fd, size), 0);
> --
> 2.53.0
>

Cheers, Lorenzo
