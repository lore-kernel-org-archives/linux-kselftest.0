Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792658188;
	b=y0L3vHKInAyPwSaHpwF1FhlMz5Sg74H4a5oUr/HftL6tQIrlqEMjEk8oVqNYh6QpRMwo
	 ybzHZD9oFDfipK73/yNpyXEWv944zfE9OBD4Yew9Bnyw9A82SUPaY/vpwbLmwoKAK4zet
	 59AVa0ubphK/8JOmq/wZCfGu7prFFI7KtxP93w7n+g7BYxfoJ4Uwf/teLLp5og/O/tPQ0
	 9yUjVaSGk7VkeewfA8CIX6P4CWIRJSQBqGRSBSrFyKJFXSJ6Oz8oajUz8QXybTlGvRfx5
	 fhHjYTeeCOpdcdjrs8Z/DqQ609+qTjPedcP0/UuZQK4XpTSpyqqsns4XBvytInZWJ4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792658188;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=DBrs/gcG5VXg30p8wzsJYiDFPk2IoeJtx8fNzQxlKo4=;
	b=0+Gw3xxhjiQYDxkzyO114wIXJ1T1t8sQ6kmRzRCvyzSOK9O0SDxtzlGupMdNWp6PtiB5
	 mRxXgAI9xK1XaUnX//nipiIwE4M+IOfAjaLVZ8jYCxur7FJb+j98G7US4bxY8/FjbT4B6
	 UuCEIX/hpTb9Ozbd72BXCHMqtZ8NkyxnYP/nH1iTys44n9PywmuhLTOEvbh7q4gYN3F9m
	 4IeFd4e/6QjVmdQVQOm6RPvPh6/pEUyGGhBtqF/3aDAGE/UrrLLndlPEhQGFJbb2Tl6hN
	 hK2i8CsFfB3GBSHi4MAtN+uaiVE7jlMcJQC9dA06VlLoAIOfWx5WqR6S3h7KNzW1hlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ISANbqOA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8FAE606A319;
	Thu, 22 Oct 2026 08:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ISANbqOA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA93F1F000C1;
	Thu, 22 Oct 2026 08:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792658187;
	bh=DBrs/gcG5VXg30p8wzsJYiDFPk2IoeJtx8fNzQxlKo4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ISANbqOA8PQc5AHcRbyz1isXLschbrOEXIDHX65NzzgUziwGy+EgfojqKlx+lNbC0
	 G6W95SQPvOEiXOd34eBezFgY+K7ioD438cuqoCsA2OhHWcsK7cEtBfRB5l9iJ0sWFo
	 loaNGY4v/NexCFj5ef+O5W6MTq1JZoI9L7RxJN5qOcKVnjO8rORcKOklOs6c5xkzgS
	 /CGhlR7jeKes+M+6OZf6eZmXyVA1HgaYdUXL4FGtSGvgiNM0AzhOOapPrDUe7+0uOd
	 PkyaM7rqpivL2aZtluh/+EYGRdo1vOLwKafA+1Ups+Vo5UHvjQSrk61PKy5M9adBfX
	 1FlcsbbLlyQHQ==
Date: Thu, 22 Oct 2026 09:36:22 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Danish Khateeb <danishkhateeb03@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Gregory Price <gourry@gourry.net>, "Liam R . Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, 
	David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>, 
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] selftests/mm: merge: keep the far mremap() targets in
 the carveout
Message-ID: <atnKsrZ752uBR6QT@gremlin>
References: <20261021164810.45846-1-danishkhateeb03@gmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261021164810.45846-1-danishkhateeb03@gmail.com>

On Wed, Oct 21, 2026 at 11:48:10AM -0500, Danish Khateeb wrote:
> The merge tests map their areas at fixed addresses within a 30-page
> PROT_NONE carveout. Several mremap() tests move an area 1000 or 2000
> pages away to separate it from the others, but those targets are outside
> the carveout, and MREMAP_FIXED unmaps whatever is mapped there.
>
> Under virtme-ng, the shared libraries are packed right above the
> carveout and the dynamic linker starts about 4 MiB above it. The moves
> then replace part of its text with an anonymous mapping, and the test
> crashes in its next lazily bound call:
>
>   merge[6980]: segfault at 7f7ebb3c1e60 ip 00007f7ebb3c1e60 sp 00007ffd35fbaec8 error 14
>
> Two to four of the mremap() tests then fail with "Test terminated
> unexpectedly by signal 11", depending on the exact layout. On a host
> where libc is mapped at a 2 MiB aligned address, the targets happen to
> land above the dynamic linker and the tests pass.
>
> Since the areas are all within the first 30 pages, moving one by 30
> pages is enough to keep it apart from the others. Add FAR_PAGES for
> that distance, move areas by FAR_PAGES or 2 * FAR_PAGES pages, and make
> the carveout 3 * FAR_PAGES pages so that it covers every target.
>
> Fixes: 4e25f85b9f85 ("tools/testing/selftests: add mremap() unfaulted/faulted test cases")
> Signed-off-by: Danish Khateeb <danishkhateeb03@gmail.com>

Hmm I don't know why I did it this way :))

With the comment dropped as mentioned below, LGTM and:

Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

> ---
>
> Notes:
>     v2:
>     - Replace the 1000 and 2000 page offsets in the tests with FAR_PAGES
>       and 2 * FAR_PAGES, and derive the carveout size from FAR_PAGES,
>       instead of only enlarging the carveout (Gregory Price).
>     v1: https://lore.kernel.org/all/20261021011929.89150-1-danishkhateeb03@gmail.com/
>
>     Tested under virtme-ng (9p root, glibc 2.44) on next-20261020 with a
>     KASAN/lockdep kernel, three runs of each binary:
>
>       merge before:  pass:22 fail:4 skip:1 (SIGSEGV in ld-linux-x86-64.so.2)
>       merge after:   pass:26 fail:0 skip:1
>
>     On the host (glibc 2.44, libc mapped 2 MiB aligned) the results are the
>     same with and without the patch.
>
>     An LLM was used to help with this patch.
>
>  tools/testing/selftests/mm/merge.c | 39 ++++++++++++++++++------------
>  1 file changed, 24 insertions(+), 15 deletions(-)
>
> diff --git a/tools/testing/selftests/mm/merge.c b/tools/testing/selftests/mm/merge.c
> index 7dd2933417c1..208ad7e340fa 100644
> --- a/tools/testing/selftests/mm/merge.c
> +++ b/tools/testing/selftests/mm/merge.c
> @@ -22,9 +22,18 @@ FIXTURE(merge)
>  	struct procmap_fd procmap;
>  };
>
> +/*
> + * The tests map their areas within the first FAR_PAGES pages of the carveout,
> + * and some move an area FAR_PAGES or 2 * FAR_PAGES pages up to separate it
> + * from the others. MREMAP_FIXED unmaps whatever is mapped at the target, so
> + * the carveout must cover those targets too.
> + */

Please drop this comment, it's pretty self-explanatory what you're doing here.

> +#define FAR_PAGES	30
> +#define CARVEOUT_PAGES	(3 * FAR_PAGES)
> +
>  static char *map_carveout(unsigned int page_size)
>  {
> -	return mmap(NULL, 30 * page_size, PROT_NONE,
> +	return mmap(NULL, CARVEOUT_PAGES * page_size, PROT_NONE,
>  		    MAP_ANON | MAP_PRIVATE, -1, 0);
>  }
>
> @@ -73,7 +82,7 @@ FIXTURE_SETUP(merge)
>
>  FIXTURE_TEARDOWN(merge)
>  {
> -	ASSERT_EQ(munmap(self->carveout, 30 * self->page_size), 0);
> +	ASSERT_EQ(munmap(self->carveout, CARVEOUT_PAGES * self->page_size), 0);
>  	/* May fail for parent of forked process. */
>  	close_procmap(&self->procmap);
>  	/*
> @@ -115,7 +124,7 @@ FIXTURE_SETUP(merge_with_fork)
>
>  FIXTURE_TEARDOWN(merge_with_fork)
>  {
> -	ASSERT_EQ(munmap(self->carveout, 30 * self->page_size), 0);
> +	ASSERT_EQ(munmap(self->carveout, CARVEOUT_PAGES * self->page_size), 0);
>  	ASSERT_EQ(close_procmap(&self->procmap), 0);
>  	/* See above. */
>  	prctl(PR_SET_MEMORY_MERGE, 0, 0, 0, 0);
> @@ -660,7 +669,7 @@ TEST_F(merge, mremap_unfaulted_to_faulted)
>
>  	/* Offset ptr2 further away. */
>  	ptr2 = sys_mremap(ptr2, 5 * page_size, 5 * page_size,
> -			  MREMAP_MAYMOVE | MREMAP_FIXED, ptr2 + page_size * 1000);
> +			  MREMAP_MAYMOVE | MREMAP_FIXED, ptr2 + FAR_PAGES * page_size);
>  	ASSERT_NE(ptr2, MAP_FAILED);
>
>  	/*
> @@ -721,7 +730,7 @@ TEST_F(merge, mremap_unfaulted_behind_faulted)
>
>  	/* Offset ptr2 further away. */
>  	ptr2 = sys_mremap(ptr2, 5 * page_size, 5 * page_size,
> -			  MREMAP_MAYMOVE | MREMAP_FIXED, ptr2 + page_size * 1000);
> +			  MREMAP_MAYMOVE | MREMAP_FIXED, ptr2 + FAR_PAGES * page_size);
>  	ASSERT_NE(ptr2, MAP_FAILED);
>
>  	/*
> @@ -785,12 +794,12 @@ TEST_F(merge, mremap_unfaulted_between_faulted)
>
>  	/* Offset ptr3 further away. */
>  	ptr3 = sys_mremap(ptr3, 5 * page_size, 5 * page_size,
> -			  MREMAP_MAYMOVE | MREMAP_FIXED, ptr3 + page_size * 2000);
> +			  MREMAP_MAYMOVE | MREMAP_FIXED, ptr3 + 2 * FAR_PAGES * page_size);
>  	ASSERT_NE(ptr3, MAP_FAILED);
>
>  	/* Offset ptr2 further away. */
>  	ptr2 = sys_mremap(ptr2, 5 * page_size, 5 * page_size,
> -			  MREMAP_MAYMOVE | MREMAP_FIXED, ptr2 + page_size * 1000);
> +			  MREMAP_MAYMOVE | MREMAP_FIXED, ptr2 + FAR_PAGES * page_size);
>  	ASSERT_NE(ptr2, MAP_FAILED);
>
>  	/*
> @@ -870,13 +879,13 @@ TEST_F(merge, mremap_unfaulted_between_faulted_unfaulted)
>
>  	/* Offset ptr3 further away. */
>  	ptr3 = sys_mremap(ptr3, 5 * page_size, 5 * page_size,
> -			  MREMAP_MAYMOVE | MREMAP_FIXED, ptr3 + page_size * 2000);
> +			  MREMAP_MAYMOVE | MREMAP_FIXED, ptr3 + 2 * FAR_PAGES * page_size);
>  	ASSERT_NE(ptr3, MAP_FAILED);
>
>
>  	/* Offset ptr2 further away. */
>  	ptr2 = sys_mremap(ptr2, 5 * page_size, 5 * page_size,
> -			  MREMAP_MAYMOVE | MREMAP_FIXED, ptr2 + page_size * 1000);
> +			  MREMAP_MAYMOVE | MREMAP_FIXED, ptr2 + FAR_PAGES * page_size);
>  	ASSERT_NE(ptr2, MAP_FAILED);
>
>  	/*
> @@ -1035,11 +1044,11 @@ TEST_F(merge, mremap_correct_placed_faulted)
>  	 */
>  	ptr3 = &ptr[10 * page_size];
>  	ptr3 = sys_mremap(ptr3, 5 * page_size, 5 * page_size,
> -			  MREMAP_MAYMOVE | MREMAP_FIXED, ptr3 + page_size * 2000);
> +			  MREMAP_MAYMOVE | MREMAP_FIXED, ptr3 + 2 * FAR_PAGES * page_size);
>  	ASSERT_NE(ptr3, MAP_FAILED);
>  	ptr2 = &ptr[5 * page_size];
>  	ptr2 = sys_mremap(ptr2, 5 * page_size, 5 * page_size,
> -			  MREMAP_MAYMOVE | MREMAP_FIXED, ptr2 + page_size * 1000);
> +			  MREMAP_MAYMOVE | MREMAP_FIXED, ptr2 + FAR_PAGES * page_size);
>  	ASSERT_NE(ptr2, MAP_FAILED);
>
>  	/*
> @@ -1075,7 +1084,7 @@ TEST_F(merge, mremap_correct_placed_faulted)
>  	 *                  ptr2      \       ptr       \       ptr3
>  	 */
>  	ptr = sys_mremap(ptr, 5 * page_size, 5 * page_size,
> -			 MREMAP_MAYMOVE | MREMAP_FIXED, ptr + page_size * 1000);
> +			 MREMAP_MAYMOVE | MREMAP_FIXED, ptr + FAR_PAGES * page_size);
>  	ASSERT_NE(ptr, MAP_FAILED);
>
>  	/*
> @@ -1110,7 +1119,7 @@ TEST_F(merge, mremap_correct_placed_faulted)
>  	 *                  ptr2      \       ptr       \       ptr3
>  	 */
>  	ptr = sys_mremap(ptr, 5 * page_size, 5 * page_size,
> -			 MREMAP_MAYMOVE | MREMAP_FIXED, ptr + page_size * 1000);
> +			 MREMAP_MAYMOVE | MREMAP_FIXED, ptr + FAR_PAGES * page_size);
>  	ASSERT_NE(ptr, MAP_FAILED);
>
>  	/*
> @@ -1168,7 +1177,7 @@ TEST_F(merge, mremap_correct_placed_faulted)
>  	 *      ptr                     ptr3      \       ptr2
>  	 */
>  	ptr2 = sys_mremap(ptr2, 5 * page_size, 5 * page_size,
> -			  MREMAP_MAYMOVE | MREMAP_FIXED, ptr2 + page_size * 1000);
> +			  MREMAP_MAYMOVE | MREMAP_FIXED, ptr2 + FAR_PAGES * page_size);
>  	ASSERT_NE(ptr2, MAP_FAILED);
>
>  	/*
> @@ -1203,7 +1212,7 @@ TEST_F(merge, mremap_correct_placed_faulted)
>  	 *            ptr                         \       ptr3
>  	 */
>  	ptr3 = sys_mremap(ptr3, 5 * page_size, 5 * page_size,
> -			  MREMAP_MAYMOVE | MREMAP_FIXED, ptr3 + page_size * 1000);
> +			  MREMAP_MAYMOVE | MREMAP_FIXED, ptr3 + FAR_PAGES * page_size);
>  	ASSERT_NE(ptr3, MAP_FAILED);
>
>  	/*
>
> base-commit: fcec4f4bcc1101dbd7e3aff267856b3bbfe128c6
> --
> 2.56.0
>

--
Cheers, Lorenzo
