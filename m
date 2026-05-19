Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F7443F86EE;
	Tue, 19 May 2026 09:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779184662; cv=none; b=J+2SD9rB5e/KQPaDySdMUAhg5EaSSf7bty/30j6fsOwuJQLwbLW2OW0QqaPeADZyZWmmMi1Kq/kK0VBUlwRTrFpndHAgyoDAbAvy7Z5YIvcdNxZYgyU6IyS94qVniTvvTBzEvQe8ldawLAl34QNvlF6+3Bl2E56pX3BYx3NnbqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779184662; c=relaxed/simple;
	bh=/mEyPpYJP1wJFopm9f9dnhO4LeuJ33cHQQJCxlPEN0c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BH7A660rZNnTrOR7ekFbiFo9r4s8UWkNZd+3COAvVRswluN6he5JyMF6is/b6eIGKpqpudC9gsB+RnYo/j39ih9eXTHaOzpKZnjtAFspGSvwgegZTFZsCB4ZyY6yAHuwwB+bTKmuu/aS+o6529Cl1p9NrtYToC77cL72LPLFcn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KAjf8cDU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KAjf8cDU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2CD0C2BCF6;
	Tue, 19 May 2026 09:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779184661;
	bh=/mEyPpYJP1wJFopm9f9dnhO4LeuJ33cHQQJCxlPEN0c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KAjf8cDUJD+A4i/8IGbEbsuDE6P49BGZS9qpXvbOOa795GPwxfQZRl43GrkT1sHKk
	 LDeZkQYsuM4HOUFcgT4L20slUwxsa3W8i5RmGYuIhgIroytg+HJSGpX3JMaKGrVph7
	 1s68+W60mvqqXnrEx/EgW25n+d6Y6izrmb0mqX+UbOsp13SaXK09fKEOQl4WQKYA3c
	 +biCb1zbyA0kH4pO9odCn3wx3tWK0VFyz7uT785HzUnkcAg4MgfXDQ1ymflgqW7fg/
	 pDx2AYqwFT3i2Kr8mhwqTj9+d+884MlC8/vhsv5ERPxFWL4Ua8JClrBmDLAIsAH4rM
	 McB0Gt42kP50A==
Date: Tue, 19 May 2026 10:57:35 +0100
From: Lorenzo Stoakes <ljs@kernel.org>
To: Hongfu Li <lihongfu@kylinos.cn>
Cc: akpm@linux-foundation.org, david@kernel.org, liam@infradead.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	mhocko@suse.com, rppt@kernel.org, shuah@kernel.org, surenb@google.com, 
	vbabka@kernel.org
Subject: Re: [PATCH] selftests/mm: add missing mmap() return checks in pkey
 tests
Message-ID: <agwvkyXSlZ-Suz7j@lucifer>
References: <agrrp5fRWWuMSoYB@lucifer>
 <20260519091626.371028-1-lihongfu@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260519091626.371028-1-lihongfu@kylinos.cn>

On Tue, May 19, 2026 at 05:16:26PM +0800, Hongfu Li wrote:
> Hi Lorenzo,
> Thanks for the review comments.
>
> > Hmm you're sending this separete from the other MAP_FAILED checks, and not
> > referencing that in any way? (original patch at [0]).
> >
> > Please just send this as a 2 patch series _with a cover letter_ and both patches
> > in-reply-to the cover letter.
> >
> > Also make sure to propagate tags correctly.
> >
> > [0]:https://lore.kernel.org/all/20260513095609.789935-1-lihongfu@kylinos.cn/
>
> The first patch has already been merged into the mm-new branch:
> https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git/commit/?h=mm-new&id=ffe64def0071989cff47b5525d38f5e558c637c3
>
> For this reason, I split this one out separately to avoid confusion.

Hmm ok so you sent a v2 that was rejected [1], you were given feedback for a
respin but the v1 has been taken + not updated?... That's really not how the
process is supposed to work :/

Bit of a mess, Andrew - maybe best to keep the v1 then, and Hongfu - you can
respin this as requested?

[1]: https://lore.kernel.org/all/20260513095609.789935-1-lihongfu@kylinos.cn/

>
> > On Mon, May 18, 2026 at 04:21:20PM +0800, Hongfu Li wrote:
> > > Several mmap() calls lack error checks and would crash on failure.
> > > Add the missing checks. Also replace bare (void *)-1 with the
> >
> > Well you're assert()'ing so you're causing a crash on failure anyway?
> >
> > I'd just say that you are adding missing checks against the mmap() return value,
> > as well as improving readability and consistency by replacing (void *)-1 with
> > MAP_FAILED in instances where that was used rather than MAP_FAILED.
>
> Thanks for pointing this out, I will correct it in v2.
>
> > > diff --git a/tools/testing/selftests/mm/pkey_sighandler_tests.c b/tools/testing/selftests/mm/pkey_sighandler_tests.c
> > > index 302fef54049c..4637809192f9 100644
> > > --- a/tools/testing/selftests/mm/pkey_sighandler_tests.c
> > > +++ b/tools/testing/selftests/mm/pkey_sighandler_tests.c
> > > @@ -317,6 +317,7 @@ static void test_sigsegv_handler_with_different_pkey_for_stack(void)
> > >  	/* Set up alternate signal stack that will use the default MPK */
> > >  	sigstack.ss_sp = mmap(0, STACK_SIZE, PROT_READ | PROT_WRITE,
> > >  			      MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
> > > +	assert(sigstack.ss_sp != MAP_FAILED);
> >
> > Why not pkey_assert()?
> >
> > >  	sigstack.ss_flags = 0;
> > >  	sigstack.ss_size = STACK_SIZE;
> > >
> > > @@ -490,6 +491,7 @@ static void test_pkru_sigreturn(void)
> > >  	/* Set up alternate signal stack that will use the default MPK */
> > >  	sigstack.ss_sp = mmap(0, STACK_SIZE, PROT_READ | PROT_WRITE,
> > >  			      MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
> > > +	assert(sigstack.ss_sp != MAP_FAILED);
> >
> > Why not pkey_assert()?
>
> protection_keys.c executes numerous tests in loops across multiple iterations,
> so the test_nr and iteration_nr printed by pkey_assert help easily locate the
> exact failed test case and iteration.
> In contrast, pkey_sighandler_tests.c consists of only a few standalone test
> functions invoked once each, so plain assert providing file and line information
> should suffice to locate failures.

Why would we not want more information here? This argument doesn't hold any
water, please use pkey_assert().

(BTW This reads like an AI generated sentence. We're fine with you using AI to
assist with English for instance, but please make sure it's your own thoughts!)

>
> > > @@ -1775,7 +1776,7 @@ int main(void)
> > >  		printf("running PKEY tests for unsupported CPU/OS\n");
> > >
> > >  		ptr  = mmap(NULL, size, PROT_NONE, MAP_ANONYMOUS|MAP_PRIVATE, -1, 0);
> > > -		assert(ptr != (void *)-1);
> > > +		assert(ptr != MAP_FAILED);
> >
> > Probably best to convert to pkey_assert() at the same time?
>
> This is a pre-test initialization path that runs before the test
> loop, so test_nr and iteration_nr (used in pkey_assert for diagnostic
> output) are not yet set up at this point.
> Would using plain assert() here be more appropriate?

OK that's gross, please just replace it with a test failure kmsg_xxx() whatever
it is, and a return EXIT_FAILURE; or something since you're in main().

>
> Best regards,
> Hongfu

Cheers, Lorenzo
