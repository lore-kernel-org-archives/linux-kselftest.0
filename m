Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D93355F57;
	Thu,  2 Jul 2026 10:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782988403; cv=none; b=F69uW+nqcE6t7CFtVwPVz3r3y28EY9HobCuEMaOq/pOwP6Vdd0t/7jhANs0UmRhkUvSu0mQBG2VQ0GB44Q2NmL1yzsC2Bip3DfB5BaLxSmKD9/YjYOkubjuV9S6btlaSAmRUG+ifPQin7Kjo2tMjkg1BAgtESm4FxwqnF8jBKug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782988403; c=relaxed/simple;
	bh=rohPsJK+OLHuq4QlMTXA3FSNV2wwH5omfNDLTA4+/no=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HLyz4vX9NXhIYIuGOq4ssp9e0uGjpDYe/vxdfvJLP+2OulwVfnyNFUMMh9Hk9t5T+PuxMRZLk51ywalHxJMLl38OBBHgnAud234sjN7GxEWrDBong6Z2dLICOhTIATi01NHty8VanG3U3OF5as0LTJXFB2APzdvTxF4t9tCwb6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AOJZvO4y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AOJZvO4y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B56411F00A3D;
	Thu,  2 Jul 2026 10:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782988402;
	bh=tmXgEqvEqmr0gNiJUyTGPhF4SS1ShJPybmu2qtbUwt0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AOJZvO4yrYp0epxSh5Kx6/DnNKxIdTQX7wtKeSlCooSxh3bdCBblBjl03XxQYTEnu
	 hCZPgtZYMEYpV5qjLsNZaLQeZKJVqRDf/aLvVxgeKUVClXJpV13L+NQZjz1zJiA6cg
	 BRXn13L+P6N7vnBxl45zbCdPk7QNQmEXaabfZ5GOXuUit9QpkmA6WVqooallFvZx1+
	 Ii5MMDtqk6RsJyxwXqxQnnWXSH5O51CfPjC71en2yVu9g4qz3K16aTOrZC2/Vm7K9Z
	 zJiqND6pVj6haMuvuaJPWY2QxrmTewXdfKnifKAwV8Q21hVl+CJoWqApAtxR0EQUNa
	 RO31L0o9M133Q==
Date: Thu, 2 Jul 2026 11:33:12 +0100
From: Lorenzo Stoakes <ljs@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Michal Hocko <mhocko@suse.com>, Peter Xu <peterx@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH RESEND] selftests/mm/uffd: don't treat UFFDIO_COPY
 -ENOENT as a failure
Message-ID: <akY-QpF0zcO3nlOi@lucifer>
References: <20260701200932.1470525-1-rppt@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701200932.1470525-1-rppt@kernel.org>

On Wed, Jul 01, 2026 at 11:09:32PM +0300, Mike Rapoport wrote:
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
>
> Non-cooperarive uffd events are inherently racy and can happen in
> parallel with other userfaultfd operations.
>
> During event tests in uffd-unit-tests, the uffd monitor calls
> UFFDIO_UNREGISTER upon receiving UFFD_EVENT_REMOVE.
>
> In parallel, the faulting_process() verifies that the removed memory is
> actually zeroed.
>
> If a verification read wins the race with UFFDIO_UNREGISTER, it causes a
> missing fault that uffd monitor would receive after UFFDIO_UNREGISTER is
> complete. The monitor resolves the fault using UFFDIO_COPY that fails
> with -ENOENT which means that VMA has been changed (see commit
> 27d02568f529 ("userfaultfd: mcopy_atomic: return -ENOENT when no
> compatible VMA found")).
>
> Treat -ENOENT returned by UFFDIO_COPY as non-fatal, the same way
> -EEXIST is treated for concurrent faults, and don't fail the test.
>
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

LGTM, so:

Reviewed-by: Lorenzo Stoakes <ljs@kernel.org>

> ---
> I've noticed transient faults of uffd-unit-tests in the CI runs [1]
> and found this issue with uffd-unit-tests.

Nice work tracking that down!

>
> The issue is longstanding and it's not related to or exposed by the
> recent uffd refactoring.
>
> I didn't even look for a Fixes: commit, as this is a selftest only and I
> don't see a reason to backport it.
>
> [1] https://github.com/linux-mm/linux-mm/actions
>
>  tools/testing/selftests/mm/uffd-common.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/tools/testing/selftests/mm/uffd-common.c b/tools/testing/selftests/mm/uffd-common.c
> index edd02328f77b..f48f5d4594ab 100644
> --- a/tools/testing/selftests/mm/uffd-common.c
> +++ b/tools/testing/selftests/mm/uffd-common.c
> @@ -639,8 +639,13 @@ int __copy_page(uffd_global_test_opts_t *gopts, unsigned long offset, bool retry
>  		uffdio_copy.mode = 0;
>  	uffdio_copy.copy = 0;
>  	if (ioctl(gopts->uffd, UFFDIO_COPY, &uffdio_copy)) {
> -		/* real retval in ufdio_copy.copy */
> -		if (uffdio_copy.copy != -EEXIST)
> +		/*
> +		 * real retval in uffdio_copy.copy
> +		 *
> +		 * -EEXIST: the page was faulted in concurrently
> +		 * -ENOENT: the destination range was concurrently removed
> +		 */
> +		if (uffdio_copy.copy != -EEXIST && uffdio_copy.copy != -ENOENT)
>  			err("UFFDIO_COPY error: %"PRId64,
>  			    (int64_t)uffdio_copy.copy);
>  		wake_range(gopts->uffd, uffdio_copy.dst, gopts->page_size);
>
> base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
> --
> 2.53.0
>

Cheers, Lorenzo
