Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C61D431E63;
	Wed,  1 Jul 2026 20:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782936533; cv=none; b=S4dWPtbTlOGcq1M6gqJ7a/rCtjymfn74piUUjjJZRFxYIN1xh68DDYIpRNt0vmTcR31oLdpS31gHS37tQKVXMpu03lYwla/ofRWHsyd2cFJCQ0OIHipum9zi6cmNn0QpT/RO224QJCGKtX5e/ZMXCm6bme849pGKJN6p0ry+RxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782936533; c=relaxed/simple;
	bh=h5+MTMur7gUWGAyAmj1dfIFJizEpNBiwAfZLkOsPjZ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DUU1Zy+DQVc5wxeJegwdcGeXbOB6MBpyoHXrIp4Mbu5Z4Pe/G+jkTX2AiBSqdNKd1RXHeh1vY1rG0OUGfkStx0o4bm5mh9VrkM09nfRlpGEWetBtK935I/kejnbHnTI8Gd8bIMrCy27PXb4fZlSEzCBaIqT8/v0jTNHoYUUVVMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TYaWBAz7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TYaWBAz7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAF221F000E9;
	Wed,  1 Jul 2026 20:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782936531;
	bh=QLxgycIlH73T/Z4NDAOwA1ZnWgwK5lm7yqvdPVfx9jQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TYaWBAz7dyKXyPdlRA941LMAtZ5+x90gsbHGCk83x7YC2EqtUwrPvBW+nVonPUhcf
	 I4+/mHW6IDsJbblVf6408D6+ybW+HP6IeJ2sdBChiGO3K0fB3Vd/Q1XTCJszQ2vHvp
	 0RYFQnYWyr7XN9Ndx78idaDl5WygSeeYikUlyRaGjIqvsgy28QZRWhxBvUpGXUh2Bl
	 XHnbWq/ijPBXr5ugw1dhzK59rUTLPt5zOYFSf1lyt8qfXVpY73E45RBPeh/ECe+l4I
	 QQOeM6vzdXbEIwufkvVJwdy8Nu6RLbQJN7efYpOZkFiE64lENYs4T9aYRsx412OEmo
	 ypVS30BDp2elw==
Date: Wed, 1 Jul 2026 23:08:45 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>
Cc: "Liam R. Howlett" <liam@infradead.org>,
	Lorenzo Stoakes <ljs@kernel.org>, Michal Hocko <mhocko@suse.com>,
	Peter Xu <peterx@redhat.com>, Shuah Khan <shuah@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@kernel.org>, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH] dev: selftests/mm/uffd: don't treat UFFDIO_COPY -ENOENT
 as a failure
Message-ID: <akVzzR4TYwAyzKgR@kernel.org>
References: <20260701200143.1470229-1-rppt@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701200143.1470229-1-rppt@kernel.org>

Oops, the subject came out wrong, will resend.

Sorry for the noise.

On Wed, Jul 01, 2026 at 11:01:43PM +0300, Mike Rapoport wrote:
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
> ---
> I've noticed transient faults of uffd-unit-tests in the CI runs [1]
> and found this issue with uffd-unit-tests.
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

-- 
Sincerely yours,
Mike.
