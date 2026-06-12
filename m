Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E8DB272816;
	Fri, 12 Jun 2026 01:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781227761; cv=none; b=Hd1Ub2OealDLA1SW7oxPaUR2PDz/NCXlpKi6UxcbMKblNb4F0X8DhPvQw5jvvFGx8n+yRzjWZB1qmpYtSke4h3YBhV0U4SDSOqN9muUVpSetc9hpFTjC+XWwd7Hovqw0tjDahuxp/K8F450UnQFfvD2W9MlHIqYk8b0zuEuHRWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781227761; c=relaxed/simple;
	bh=moAwKVwgZeaXcuB84bjgHvgRcdePgB8maENDUNyIgsA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LsNCGVebFkXCBBS6ny5arJ/iUWeo8GNv3NVNDCeffHaJGWJ2HhA0ZnKUK4JX2zjAbnGN5KDSgAmcYpkTUQRRlBQoI/BpGRwwwJ110GeZLe6tLLkW67A1M6ax2VpjC44Dc96vpY8NM11j38ku8msSZCJy8SFYkfiS9jYrE1Wveyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=grxHbF0e; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="grxHbF0e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 234581F000E9;
	Fri, 12 Jun 2026 01:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781227759;
	bh=G0Ukr9E3YsTm9qpFFIq19VgZAopP2k8wxVggfBm4mvc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=grxHbF0eSRjcBvSvvQmbBkz3m8sdTwPRZG8B5goZX0ewQ2G2Q8wCybIAHRdV5WHs0
	 QvxraqcF7zbXJCLBtkqorc8UDpLcoyKG76J2qlFlubPc4yPEGn1M+62oP3lGXmF3ne
	 pd/4WKR04Cs2TgJtlb5teGqWpJhihYWhudzVSoo3skyVafgF6hT11chyO+SI4x1SxJ
	 CvFCOL+gTegi+2yON//+hsIqdc3VRFsyvCx7XsVZfK0ymSEmfqjEzqAzAjG7279T8G
	 zmbsUeSpR3ylJQ/Yk3dePGLnA1W167EopCngM3FIUM7TSPMIFWt3rnBI6Rcmiguu69
	 KB0XqoM/k6Ozg==
From: SeongJae Park <sj@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: SeongJae Park <sj@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Shuah Khan <shuah@kernel.org>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	Anthony Yznaga <anthony.yznaga@oracle.com>,
	Mark Brown <broonie@kernel.org>,
	Sarthak Sharma <sarthak.sharma@arm.com>,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aishwarya TCV <Aishwarya.TCV@arm.com>
Subject: Re: [PATCH] selftests: mm: fix and speedup "droppable" test
Date: Thu, 11 Jun 2026 18:29:10 -0700
Message-ID: <20260612012910.84424-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260611-droppable_test-v1-1-b6a73d99f658@kernel.org>
References: 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 11 Jun 2026 12:01:55 +0200 "David Hildenbrand (Arm)" <david@kernel.org> wrote:

> The droppable test currently relies on creating memory pressure in a
> child process to trigger dropping the droppable pages.
> 
> That not only takes a long time on some machines (allocating and filling
> all that memory), on large machines this will not work as we hardcode the
> area size to 134217728 bytes.
> 
> ... further, we rely on timeouts to detect that memory was not dropped,
> which is really suboptimal.
> 
> Instead, let's just use MADV_PAGEOUT on a 2 MiB region. MADV_PAGEOUT works
> with droppable memory even without swap.
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
> 
> Reported-by: Aishwarya TCV <Aishwarya.TCV@arm.com>
> Fixes: 9651fcedf7b9 ("mm: add MAP_DROPPABLE for designating always lazily freeable mappings")

Because this is a fix for a test, I think not Cc-ing stable@ is ok.  Further,
arguably this is not a fix but an improvement?  No strong opinion, just
thinking loud.

> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>

Reviewed-by: SeongJae Park <sj@kernel.org>

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

This check is for a case that this test is running against an old kernel that
doesn't have MADV_PAGEOUT?

Assuming so, I was first thinking this check might not really needed, assuming
the test runner would pick the kselftest code from the running kernel's source
code.  But I recalled some people do get kselftest code from random place.  So
this check seems nice to me.

Just thinking loud.


Thanks,
SJ

[...]
