Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64ACC363C4C;
	Tue, 28 Apr 2026 07:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777359740; cv=none; b=Cj83dQ8rB6D4bmIqKQjBVAxLOxjE02+NQiHJG5VLPOWQsmlcpvCKH2GPWl4hz6dLWwQXeGWdVw+hCaBk1ulG3b+kzjsVbqqlzgoKJw0GfzkOdibgsKK6QUTil/FYSWBQGmllVQkG2MdS4AlH2cwCT5qBbsvnrM2G4yLzMoXGE/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777359740; c=relaxed/simple;
	bh=hVKmKekCPR0otTesTdNIsOkYcvZaVMmGKCZhjWqRqaQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dAjC4H8/b+6uQV6dRQdTxJiod2mzsg9uWHz/bfbyIM+nkVR2ktdGacd/seWWShXed104GUqHNdl2bt0gVMxPm3cgd8a7mT1R9rwzJ57iCPb4I/bwLwI8OmXNLIfJqeiYpokvS5J+6t/6ppyCmSt8qp2PGGRXJ21EnuV7GmEbgAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EURfwWR+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EURfwWR+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0EFFC2BCAF;
	Tue, 28 Apr 2026 07:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777359740;
	bh=hVKmKekCPR0otTesTdNIsOkYcvZaVMmGKCZhjWqRqaQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EURfwWR+6d2gZ4I0ki7uadITZ+yglULChTeLvA5j3C+sGWIEveox/Hd+m2mmzxRJ8
	 TyGEHiQiqKn7x+UT4Nk9UvUEnqafYDEPg0bJG64CMDMz82kxI3MHMQ0vU/bAKYyqz/
	 bQULOHHmDgpOmzjjWM6gnabQ1mwhNtV7Qmn5bBfp4f3pylgPysDAOJrp3ogKQF0vsk
	 VHhcayOV+qT1wybkGKaVPoIUsbPGK3juHxU5EInZhIYCVqsly15DwR5OVSbyG1hAu+
	 hj17em3N4GW44EI15wVtCNtyA5ikEN3L5WfM9QV/H1Ivsk7+Rk8yPnJeefC066Z3mD
	 i7etJJ1P4vnEA==
Date: Tue, 28 Apr 2026 08:02:14 +0100
From: Lorenzo Stoakes <ljs@kernel.org>
To: fujunjie <fujunjie1@qq.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R . Howlett" <Liam.Howlett@oracle.com>, David Hildenbrand <david@kernel.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>, Shuah Khan <shuah@kernel.org>, 
	Christian Brauner <brauner@kernel.org>, SeongJae Park <sj@kernel.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v2] mm/madvise: reject invalid process_madvise() advice
 for zero-length vectors
Message-ID: <afBNyNJiWEAUSf1i@lucifer>
References: <tencent_98F3571EF9236437E5165F5C08CF258A9E08@qq.com>
 <tencent_BB588C2CDED859A873093DAF28B2CC1F7B0A@qq.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_BB588C2CDED859A873093DAF28B2CC1F7B0A@qq.com>

On Mon, Apr 27, 2026 at 09:43:30AM +0000, fujunjie wrote:
> process_madvise() used to validate the advice while walking each
> imported iovec. If the vector has zero total length, vector_madvise()
> does not enter the loop and can return success without checking whether
> the advice value is valid.
>
> For a local mm, such as process_madvise(PIDFD_SELF, ...), the remote-only
> process_madvise_remote_valid() check is skipped. As a result, an invalid
> advice can be reported as success when the vector has zero total length.
> This differs from madvise(), which rejects an invalid advice before
> returning success for a zero-length range.

Oops! :) Thanks for taking a look at this.

>
> Validate the generic madvise behavior at the syscall-facing entry points
> before any vector walk. In process_madvise(), do this before the
> remote-only advice restriction so unsupported advice is rejected with the
> same priority for local and remote mm. Then keep the per-range helper
> focused on address/length validation, avoiding repeated behavior checks
> for every iovec.

The whole thing is a little bit of a mess to be honest I think we could clean
this up a bit more, see below (+ attached patch).

>
> Valid zero-length requests remain no-ops and continue to return 0. Add a

NIT: 'no-ops' -> 'a noop'. What is a valid zero-length request? Surely it's
never valid?

> selftest that covers invalid advice with a zero-length iovec and an empty
> vector, while also checking that a valid zero-length request still
> succeeds.

Thanks appreciate you adding a self-test!

>
> Fixes: 021781b01275 ("mm/madvise: unrestrict process_madvise() for current process")
> Signed-off-by: fujunjie <fujunjie1@qq.com>
> ---
> v2:
> - Validate behavior at the syscall-facing entry points and leave the range
>   helper for address/length checks, avoiding repeated behavior checks in the
>   iovec loop.
> - Put the generic process_madvise() behavior check before
>   process_madvise_remote_valid(), as suggested by David.
> - Keep the zero-length selftest coverage from v1.
>
> Testing:
> Built bzImage and tools/testing/selftests/mm/process_madv. In QEMU, the
> process_madv selftest reports 7/7 passed.
>
>  mm/madvise.c                              | 29 ++++++++++++++++-------------
>  tools/testing/selftests/mm/process_madv.c | 29 +++++++++++++++++++++++++++++
>  2 files changed, 45 insertions(+), 13 deletions(-)
>
> diff --git a/mm/madvise.c b/mm/madvise.c
> index 69708e953cf56..ce238dd96f158 100644
> --- a/mm/madvise.c
> +++ b/mm/madvise.c
> @@ -1834,13 +1834,10 @@ static void madvise_finish_tlb(struct madvise_behavior *madv_behavior)
>  		tlb_finish_mmu(madv_behavior->tlb);
>  }
>
> -static bool is_valid_madvise(unsigned long start, size_t len_in, int behavior)
> +static bool is_valid_madvise_range(unsigned long start, size_t len_in)
>  {
>  	size_t len;
>
> -	if (!madvise_behavior_valid(behavior))
> -		return false;
> -

So taking this out makes sense, but I think we're now in a bit of a confused
state where is_valid_madvise_range() checks:

* Whether start is page-aligned.
* Whether len_in was (size_t)(small neg) aligned up -> 0
* Whether start + len overflows

Returning a boolean

And madvise_should_skip():

* Calls is_valid_madvise_range()
* Checks if range is empty

Returning a boolean, setting output variable *err to error if the former
failed.

We also hamfistedly check "start + PAGE_ALIGN(len_in) == start" which, unless
I'm much mistaken, is equivalent to !len_in, except for the small negative
aligning to zero case which we already checked.

And to make it all more fun, both functions return opposite booleans :))

So I think we should put this all into one function while we're here, get rid of
the confusing output variable, return an error code, and have the callers
manually check for !len_in also (compilers will optimise this into something
sensible).

This makes it clear at the call sites we skip empty ranges, cleans stuff up and
makes clear what we check the input range for.

I've attached a patch that you can apply on top of yours to make it clear what I
mean here (no need for attribution!)

I checked and your test passes! :)

Cheers, Lorenzo

>  	if (!PAGE_ALIGNED(start))
>  		return false;
>  	len = PAGE_ALIGN(len_in);
> @@ -1859,17 +1856,15 @@ static bool is_valid_madvise(unsigned long start, size_t len_in, int behavior)
>   * madvise_should_skip() - Return if the request is invalid or nothing.
>   * @start:	Start address of madvise-requested address range.
>   * @len_in:	Length of madvise-requested address range.
> - * @behavior:	Requested madvise behavior.
>   * @err:	Pointer to store an error code from the check.
>   *
> - * If the specified behaviour is invalid or nothing would occur, we skip the
> - * operation.  This function returns true in the cases, otherwise false.  In
> - * the former case we store an error on @err.
> + * If the specified range is invalid or nothing would occur, we skip the
> + * operation.  This function returns true in these cases, otherwise false.  In
> + * the former case we store an error in @err.

OK looks good, thanks for fixing the typo :)

>   */
> -static bool madvise_should_skip(unsigned long start, size_t len_in,
> -		int behavior, int *err)
> +static bool madvise_should_skip(unsigned long start, size_t len_in, int *err)
>  {
> -	if (!is_valid_madvise(start, len_in, behavior)) {
> +	if (!is_valid_madvise_range(start, len_in)) {
>  		*err = -EINVAL;
>  		return true;
>  	}
> @@ -2013,7 +2008,10 @@ int do_madvise(struct mm_struct *mm, unsigned long start, size_t len_in, int beh
>  		.tlb = &tlb,
>  	};
>
> -	if (madvise_should_skip(start, len_in, behavior, &error))
> +	if (!madvise_behavior_valid(behavior))
> +		return -EINVAL;
> +
> +	if (madvise_should_skip(start, len_in, &error))
>  		return error;
>  	error = madvise_lock(&madv_behavior);
>  	if (error)
> @@ -2056,7 +2054,7 @@ static ssize_t vector_madvise(struct mm_struct *mm, struct iov_iter *iter,
>  		size_t len_in = iter_iov_len(iter);
>  		int error;
>
> -		if (madvise_should_skip(start, len_in, behavior, &error))
> +		if (madvise_should_skip(start, len_in, &error))
>  			ret = error;
>  		else
>  			ret = madvise_do_behavior(start, len_in, &madv_behavior);
> @@ -2131,6 +2129,11 @@ SYSCALL_DEFINE5(process_madvise, int, pidfd, const struct iovec __user *, vec,
>  		goto release_task;
>  	}
>
> +	if (!madvise_behavior_valid(behavior)) {
> +		ret = -EINVAL;
> +		goto release_mm;
> +	}
> +
>  	/*
>  	 * We need only perform this check if we are attempting to manipulate a
>  	 * remote process's address space.
> diff --git a/tools/testing/selftests/mm/process_madv.c b/tools/testing/selftests/mm/process_madv.c
> index cd4610baf5d7d..9a7e2788fcc50 100644
> --- a/tools/testing/selftests/mm/process_madv.c
> +++ b/tools/testing/selftests/mm/process_madv.c
> @@ -309,6 +309,35 @@ TEST_F(process_madvise, invalid_vlen)
>  	ASSERT_EQ(munmap(map, pagesize), 0);
>  }
>
> +/*
> + * Test that invalid advice is rejected even when the iovec has zero total
> + * length. A zero-length advice is a no-op for valid advice, but invalid
> + * advice should still fail with EINVAL.
> + */
> +TEST_F(process_madvise, invalid_advice_zero_length)
> +{
> +	struct iovec vec = {
> +		.iov_base = NULL,
> +		.iov_len = 0,
> +	};
> +	int pidfd = self->pidfd;
> +	ssize_t ret;
> +
> +	errno = 0;
> +	ret = sys_process_madvise(pidfd, &vec, 1, -1, 0);
> +	ASSERT_EQ(ret, -1);
> +	ASSERT_EQ(errno, EINVAL);
> +
> +	errno = 0;
> +	ret = sys_process_madvise(pidfd, &vec, 1, MADV_DONTNEED, 0);
> +	ASSERT_EQ(ret, 0);
> +
> +	errno = 0;
> +	ret = sys_process_madvise(pidfd, NULL, 0, -1, 0);
> +	ASSERT_EQ(ret, -1);
> +	ASSERT_EQ(errno, EINVAL);
> +}
> +
>  /*
>   * Test process_madvise() with an invalid flag value. Currently, only a flag
>   * value of 0 is supported. This test is reserved for the future, e.g., if
> base-commit: 1b55f8358e35a67bf3969339ea7b86988af92f66
> --
> 2.34.1
>

----8<----
From 55ea8f619b9772d8c517e2dd15d7bb7558ce5da2 Mon Sep 17 00:00:00 2001
From: Lorenzo Stoakes <ljs@kernel.org>
Date: Tue, 28 Apr 2026 07:48:30 +0100
Subject: [PATCH] fixups

Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>
---
 mm/madvise.c | 55 +++++++++++++++++++++-------------------------------
 1 file changed, 22 insertions(+), 33 deletions(-)

diff --git a/mm/madvise.c b/mm/madvise.c
index ce238dd96f15..865fe7fb3d81 100644
--- a/mm/madvise.c
+++ b/mm/madvise.c
@@ -1834,45 +1834,31 @@ static void madvise_finish_tlb(struct madvise_behavior *madv_behavior)
 		tlb_finish_mmu(madv_behavior->tlb);
 }

-static bool is_valid_madvise_range(unsigned long start, size_t len_in)
+/**
+ * check_input_range() - Check if the requested range is valid.
+ * @start:	Start address of madvise-requested address range.
+ * @len_in:	Length of madvise-requested address range.
+ *
+ * Returns: 0 if the input range is valid, otherwise an error code.
+ */
+static int check_input_range(unsigned long start, size_t len_in)
 {
 	size_t len;

 	if (!PAGE_ALIGNED(start))
-		return false;
+		return -EINVAL;
+
 	len = PAGE_ALIGN(len_in);

 	/* Check to see whether len was rounded up from small -ve to zero */
 	if (len_in && !len)
-		return false;
+		return -EINVAL;

+	/* Overflow? */
 	if (start + len < start)
-		return false;
-
-	return true;
-}
+		return -EINVAL;

-/*
- * madvise_should_skip() - Return if the request is invalid or nothing.
- * @start:	Start address of madvise-requested address range.
- * @len_in:	Length of madvise-requested address range.
- * @err:	Pointer to store an error code from the check.
- *
- * If the specified range is invalid or nothing would occur, we skip the
- * operation.  This function returns true in these cases, otherwise false.  In
- * the former case we store an error in @err.
- */
-static bool madvise_should_skip(unsigned long start, size_t len_in, int *err)
-{
-	if (!is_valid_madvise_range(start, len_in)) {
-		*err = -EINVAL;
-		return true;
-	}
-	if (start + PAGE_ALIGN(len_in) == start) {
-		*err = 0;
-		return true;
-	}
-	return false;
+	return 0;
 }

 static bool is_madvise_populate(struct madvise_behavior *madv_behavior)
@@ -2010,12 +1996,13 @@ int do_madvise(struct mm_struct *mm, unsigned long start, size_t len_in, int beh

 	if (!madvise_behavior_valid(behavior))
 		return -EINVAL;
-
-	if (madvise_should_skip(start, len_in, &error))
+	error = check_input_range(start, len_in);
+	if (error || !len_in)
 		return error;
 	error = madvise_lock(&madv_behavior);
 	if (error)
 		return error;
+
 	madvise_init_tlb(&madv_behavior);
 	error = madvise_do_behavior(start, len_in, &madv_behavior);
 	madvise_finish_tlb(&madv_behavior);
@@ -2054,10 +2041,12 @@ static ssize_t vector_madvise(struct mm_struct *mm, struct iov_iter *iter,
 		size_t len_in = iter_iov_len(iter);
 		int error;

-		if (madvise_should_skip(start, len_in, &error))
-			ret = error;
-		else
+		error = check_input_range(start, len_in);
+		if (len_in && !error)
 			ret = madvise_do_behavior(start, len_in, &madv_behavior);
+		else
+			ret = error;
+
 		/*
 		 * An madvise operation is attempting to restart the syscall,
 		 * but we cannot proceed as it would not be correct to repeat
--
2.54.0
