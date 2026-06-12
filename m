Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82A7135CBD7;
	Fri, 12 Jun 2026 07:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781251110; cv=none; b=JxcfD22Eu9tKraM17NyGfmKb+6/C0qrZ/zXk2TTIvQH3Z5TecXNjHhepojxKdCzMas+NwmWru7mtYkpT0nISb/XV1BB4V2ggz6zH9M0CuX1djPDajDMz51CUeMkD6nw9ImQlpdCAxMvicQnnbpvI3WQFWrMuGfqYZod0jc9guzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781251110; c=relaxed/simple;
	bh=jBRt/oJrw0t9zXcI6vRdpcnoSKa9kBm9g+A38zEJ6bQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lDw37ZH/DpOXguNZsPMQU52446u9i0juVbVbo1h93GMb/cFq3hSZTZbSOtTWO04zoNdX20/r3bp1X4NWqzJfPzmHWZEmvx2UGgix06CLpwkap5dOQ+6utFhUGzmE4hphr5983/1A0nntIlwjYNDY5LzAVX0+D5qpASoeIhSAs/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YtiyHqub; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YtiyHqub"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB2F71F000E9;
	Fri, 12 Jun 2026 07:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781251109;
	bh=hWFHiurMTHuYqHLktC6SCqnT++u/8QxqggEqlCoSYYA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YtiyHqub1j1tf7e3p1QglJ+3DU3OjVCX4eFuAdDWGmLkPxq590WOqLCq60Y172ipQ
	 cGPSiw8ZPOwDBs/un0i7EDEy2vPldO/p6Q9gj6b1asnOrKV9nV1AtzJsGMMVdbKKtc
	 yurOZcj7lEayinzZlrLVSML2Hj6sh7PPvM6wj5+3wwtpzc84cKV7ojPtOfSQy5HUqn
	 /Ql1oYlggGpNEXvvGcYp1GJsjyAAvvx60jMgPNZc5R8sVxl7E5z5Iv2V6E9drjhTp8
	 yYsh/+Q92xs8Mqty4l0K17JgYr7jcmtCAyJq7rBcaVsHV5uV/vyvTSIww5WWthRpkU
	 Sv5MGgh/roXSQ==
Date: Fri, 12 Jun 2026 08:58:19 +0100
From: Lorenzo Stoakes <ljs@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>, 
	"Jason A. Donenfeld" <Jason@zx2c4.com>, Anthony Yznaga <anthony.yznaga@oracle.com>, 
	Mark Brown <broonie@kernel.org>, Sarthak Sharma <sarthak.sharma@arm.com>, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Aishwarya TCV <Aishwarya.TCV@arm.com>
Subject: Re: [PATCH] selftests: mm: fix and speedup "droppable" test
Message-ID: <aiu39cOX1w9ICe_U@lucifer>
References: <20260611-droppable_test-v1-1-b6a73d99f658@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260611-droppable_test-v1-1-b6a73d99f658@kernel.org>

On Thu, Jun 11, 2026 at 12:01:55PM +0200, David Hildenbrand (Arm) wrote:
> The droppable test currently relies on creating memory pressure in a
> child process to trigger dropping the droppable pages.

Good lord.

>
> That not only takes a long time on some machines (allocating and filling
> all that memory), on large machines this will not work as we hardcode the
> area size to 134217728 bytes.

:)

>
> ... further, we rely on timeouts to detect that memory was not dropped,
> which is really suboptimal.

:))

>
> Instead, let's just use MADV_PAGEOUT on a 2 MiB region. MADV_PAGEOUT works
> with droppable memory even without swap.

Good idea.

>
> There is the low chance of MADV_PAGEOUT failing to drop a page because
> of speculative references. We'll wait 1s and retry 10 times to
> rule that unlikely case out as best as we can.
>
> On a machine without swap:
>
> 	$ ./droppable
> 	TAP version 13
> 	1..1
> 	ok 1 madvise(MADV_PAGEOUT) behavior
> 	# Totals: pass:1 fail:0 xfail:0 xpass:0 skip:0 error:0

On my box, before:

$ time ./droppable
TAP version 13
1..1
ok 1 MAP_DROPPABLE: PASS
./droppable  5.89s user 0.01s system 99% cpu 5.921 total

After:

$ time ./droppable
TAP version 13
1..1
ok 1 madvise(MADV_PAGEOUT) behavior
# Totals: pass:1 fail:0 xfail:0 xpass:0 skip:0 error:0
./droppable  0.00s user 0.00s system 87% cpu 0.001 total

That's um. That's quite a difference.

It's good that we're doing something about slower tests :)

>
> Reported-by: Aishwarya TCV <Aishwarya.TCV@arm.com>
> Fixes: 9651fcedf7b9 ("mm: add MAP_DROPPABLE for designating always lazily freeable mappings")
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>

Big improvement, thanks :)

Feel free to add:

Tested-by: Lorenzo Stoakes <ljs@kernel.org>
Reviewed-by: Lorenzo Stoakes <ljs@kernel.org>

> ---
>  tools/testing/selftests/mm/droppable.c | 46 +++++++++++++++++++---------------
>  1 file changed, 26 insertions(+), 20 deletions(-)
>
> diff --git a/tools/testing/selftests/mm/droppable.c b/tools/testing/selftests/mm/droppable.c
> index 30c8be37fcb9..57e1b6fc5569 100644
> --- a/tools/testing/selftests/mm/droppable.c
> +++ b/tools/testing/selftests/mm/droppable.c
> @@ -17,10 +17,10 @@
>
>  int main(int argc, char *argv[])
>  {
> -	size_t alloc_size = 134217728;
> -	size_t page_size = getpagesize();
> +	const size_t alloc_size = 2 * 1024 * 1024;

I guess regardless of page size this suffices as an arbitrary range over which
to check things work.

> +	int retry_count = 10;
> +	bool dropped;
>  	void *alloc;
> -	pid_t child;
>
>  	ksft_print_header();
>  	ksft_set_plan(1);
> @@ -35,26 +35,32 @@ int main(int argc, char *argv[])
>  		exit(KSFT_FAIL);
>  	}
>  	memset(alloc, 'A', alloc_size);
> -	for (size_t i = 0; i < alloc_size; i += page_size)
> -		assert(*(uint8_t *)(alloc + i));
> -
> -	child = fork();
> -	assert(child >= 0);
> -	if (!child) {
> -		for (;;)
> -			*(char *)malloc(page_size) = 'B';
> -	}
>
> -	for (bool done = false; !done;) {
> -		for (size_t i = 0; i < alloc_size; i += page_size) {
> -			if (!*(uint8_t *)(alloc + i)) {
> -				done = true;
> -				break;
> +	while (retry_count--) {
> +		if (madvise(alloc, alloc_size, MADV_PAGEOUT)) {
> +			if (errno == EINVAL) {
> +				ksft_test_result_skip("madvise(MADV_PAGEOUT) not supported\n");
> +				exit(KSFT_SKIP);
>  			}
> +			ksft_test_result_fail("madvise(MADV_PAGEOUT) error: %s\n", strerror(errno));
> +			exit(KSFT_FAIL);
>  		}
> +
> +		dropped = memchr(alloc, 'A', alloc_size) == NULL;
> +
> +		/*
> +		 * Speculative reference can temporarily prevent some
> +		 * pages from getting dropped. So sleep and retry.
> +		 *
> +		 * If a page is not droppable for 10s, something
> +		 * is seriously messed up and we want to fail.
> +		 */
> +		if (dropped)
> +			break;
> +		sleep(1);
>  	}
> -	kill(child, SIGTERM);
>
> -	ksft_test_result_pass("MAP_DROPPABLE: PASS\n");
> -	exit(KSFT_PASS);
> +	ksft_test_result(dropped, "madvise(MADV_PAGEOUT) behavior\n");
> +
> +	ksft_finished();
>  }
>
> ---
>
> base-commit: d401506a8ee8ac6bc4a7767c17da036e9434a4a3
>
> change-id: 20260611-droppable_test-3737bd791dfb
>
> --
>
> Cheers,
>
> David
>

Thanks, Lorenzo
