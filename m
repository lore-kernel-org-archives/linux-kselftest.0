Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793614081;
	b=mY7YO0yZLv4X9p46oylQitNzbtE3gvbWxIf0ppTdJd7GhafvyRnNRYUVVBudsf/GAbz3
	 WYmHTOIadjdhcTv0yyxIony0CRzHwZXGKyVoUyjrNK56R2ZUaiB4nFbCzoZ1YOACaUEQR
	 kwHkYmoIHXUxFNBCSIT6r+OtY5j7z5QSh24tJb97nWWv5gGY7GC6XI98fvN6Ha563UMzC
	 CutB4kLu1xiccdsp/9826sHGGIeqZGI5gUxxYPeoNr9Np3KpDJEvCw5jVF8+xa4ZRknU9
	 6R9wL9zpKNvxroCIXA946F1eT0c4BkXE5Sq7DJIwg8IIqi1SeLEcfrM/Zzw0JUz1mig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793614081;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=PHGkVJUa8HZ0EZXHtvtoWcBsgIqIizfSFjqQHTffook=;
	b=cBn5iNF6GUcKIIjcFJWzykRMn+7SOL+a98byKdK4XfgDCLkoj5QPuWVMHAjyTNfm4U65
	 S/52vL+C/cxQRQnAxCBYteCAlaFUINJ8M7wvsPqqmFmk3Dj4ZMN/k6XK9T+nlAfZIjDf4
	 4ZDos6qh6nUHI0OwP3dOdQxn1A1LakMiyy99vC3lEh+9p8rcoJ107LyOuHw5a5LRSOoFu
	 ZiP/MNmOP8k0BQ6xJF6448qVhvREi8oK6WT5hQKwvtPM6h7gP9qSj0t6WwNry0982xbv5
	 Vuhajt90yf64c4paufEWG7SFGeml+wiLbOJC1EsF5loCr2qA7Grs+GJjK69gvgP/7jQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iPYSnUUT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37E23606A324;
	Mon,  2 Nov 2026 10:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iPYSnUUT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99AE71F000C1;
	Mon,  2 Nov 2026 10:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793614081;
	bh=PHGkVJUa8HZ0EZXHtvtoWcBsgIqIizfSFjqQHTffook=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iPYSnUUTD7dz8nPcsslscQX96/YM7XFOPcKFwif1kzlBcgxqvNAMCrVFP3QT6/mJZ
	 H4VRAaYJzIFAyHlW5W1jLO3NPMD+c7alEhiQmcQJo+OUkp/auAy/BT+u5o9cpDVicR
	 p9fAM54yUdtbuB81DDxcYdF0dj4wOmfT9f70NL3ZyZHE9Lm9PsFsx30ljFlCCZ9xU2
	 QViJXiddc29ptMiRWPuA7RjV29OSdK5nN+kph0hj6UopE8NUZ7NYGF4+RJ5ctqT9VH
	 xalu0NI6bpvoTvTg0ePb8jy898hnsvd3z6I97tBZ5f9Zx7neuXHAP6Zaz4MoUb5VX7
	 RbtKVBHSplV/w==
Date: Mon, 2 Nov 2026 12:07:52 +0200
From: Mike Rapoport <rppt@kernel.org>
To: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>, Shuah Khan <shuah@kernel.org>,
	Peter Xu <peterx@redhat.com>, Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>
Subject: Re: [PATCH v2 2/2] selftests/mm: add a uffd test for re-registering
 during UFFDIO_COPY
Message-ID: <auhg-HLrl4jbpaAT@kernel.org>
References: <20261102081140.201987-1-azpijr@gmail.com>
 <20261102081140.201987-3-azpijr@gmail.com>
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
In-Reply-To: <20261102081140.201987-3-azpijr@gmail.com>

On Mon, Nov 02, 2026 at 09:11:31AM +0100, Jose A. Perez de Azpillaga wrote:
> Re-register the destination without WP while a UFFDIO_COPY_MODE_WP copy
> waits for its source page, then check that the copy fails with -EINVAL
> and leaves no uffd-wp bit behind. This covers all memory types.
> 
> Signed-off-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>

Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

> ---
> Changes in v2:
> - "all memory types" in the commit message
> - rename copy to result
> 
> v1: https://lore.kernel.org/20261029221129.89068-3-azpijr@gmail.com
> 
>  tools/testing/selftests/mm/uffd-unit-tests.c | 105 +++++++++++++++++++
>  1 file changed, 105 insertions(+)
> 
> diff --git a/tools/testing/selftests/mm/uffd-unit-tests.c b/tools/testing/selftests/mm/uffd-unit-tests.c
> index 2a97ba1d6feb..cc22b4cde621 100644
> --- a/tools/testing/selftests/mm/uffd-unit-tests.c
> +++ b/tools/testing/selftests/mm/uffd-unit-tests.c
> @@ -375,6 +375,104 @@ static void uffd_wp_unpopulated_test(uffd_global_test_opts_t *gopts, uffd_test_a
>  	uffd_test_pass();
>  }
>  
> +struct wp_copy_args {
> +	uffd_global_test_opts_t *gopts;
> +	char *src;
> +	__s64 result;
> +};
> +
> +static void *wp_copy_thread(void *data)
> +{
> +	struct wp_copy_args *args = data;
> +	struct uffdio_copy copy = {
> +		.dst = (unsigned long)args->gopts->area_dst,
> +		.src = (unsigned long)args->src,
> +		.len = args->gopts->page_size,
> +		.mode = UFFDIO_COPY_MODE_WP,
> +	};
> +
> +	ioctl(args->gopts->uffd, UFFDIO_COPY, &copy);
> +	args->result = copy.copy;
> +
> +	return NULL;
> +}
> +
> +/*
> + * UFFDIO_COPY drops its locks to fault in the source page.  Re-register the
> + * destination without WP while it waits there: the MODE_WP copy must then
> + * fail instead of leaving a uffd-wp bit in a VMA that no longer has WP.
> + */
> +static void uffd_wp_copy_reregister_test(uffd_global_test_opts_t *gopts,
> +					 uffd_test_args_t *args)
> +{
> +	struct uffdio_api api = { .api = UFFD_API };
> +	struct wp_copy_args copy_args = { .gopts = gopts };
> +	unsigned long len = gopts->page_size;
> +	struct uffdio_zeropage zeropage;
> +	struct uffd_msg msg;
> +	struct pollfd pfd;
> +	pthread_t thread;
> +	uint64_t value;
> +	int pagemap_fd;
> +	int src_uffd;
> +
> +	/* The source fault comes from the kernel, so no UFFD_USER_MODE_ONLY */
> +	src_uffd = uffd_open(O_CLOEXEC);
> +	if (src_uffd < 0) {
> +		uffd_test_skip("cannot open a kernel-mode userfaultfd");
> +		return;
> +	}
> +	if (ioctl(src_uffd, UFFDIO_API, &api))
> +		err("UFFDIO_API failed");
> +
> +	copy_args.src = mmap(NULL, len, PROT_READ | PROT_WRITE,
> +			     MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
> +	if (copy_args.src == MAP_FAILED)
> +		err("mmap() failed");
> +
> +	if (uffd_register(src_uffd, copy_args.src, len, true, false, false))
> +		err("register src failed");
> +	if (uffd_register(gopts->uffd, gopts->area_dst, len, true, true, false))
> +		err("register dst failed");
> +
> +	if (pthread_create(&thread, NULL, wp_copy_thread, &copy_args))
> +		err("pthread_create() failed");
> +
> +	/* Wait until UFFDIO_COPY blocks on the source page */
> +	pfd = (struct pollfd){ .fd = src_uffd, .events = POLLIN };
> +	if (poll(&pfd, 1, 10000) != 1)
> +		err("no fault on the source page");
> +	if (read(src_uffd, &msg, sizeof(msg)) != sizeof(msg))
> +		err("read() failed");
> +
> +	if (uffd_unregister(gopts->uffd, gopts->area_dst, len))
> +		err("unregister dst failed");
> +	if (uffd_register(gopts->uffd, gopts->area_dst, len, true, false, false))
> +		err("re-register dst failed");
> +
> +	zeropage.range.start = (unsigned long)copy_args.src;
> +	zeropage.range.len = len;
> +	zeropage.mode = 0;
> +	if (ioctl(src_uffd, UFFDIO_ZEROPAGE, &zeropage))
> +		err("UFFDIO_ZEROPAGE failed");
> +
> +	if (pthread_join(thread, NULL))
> +		err("pthread_join() failed");
> +
> +	if (copy_args.result != -EINVAL)
> +		err("UFFDIO_COPY returned %lld, expected %d",
> +		    (long long)copy_args.result, -EINVAL);
> +
> +	pagemap_fd = pagemap_open();
> +	value = pagemap_get_entry(pagemap_fd, gopts->area_dst);
> +	pagemap_check_wp(value, false);
> +	close(pagemap_fd);
> +
> +	munmap(copy_args.src, len);
> +	close(src_uffd);
> +	uffd_test_pass();
> +}
> +
>  static void uffd_wp_fork_test_common(uffd_global_test_opts_t *gopts, uffd_test_args_t *args,
>  				     bool with_event)
>  {
> @@ -2403,6 +2501,13 @@ uffd_test_case_t uffd_tests[] = {
>  		.uffd_feature_required =
>  		UFFD_FEATURE_PAGEFAULT_FLAG_WP | UFFD_FEATURE_WP_UNPOPULATED,
>  	},
> +	{
> +		.name = "wp-copy-reregister",
> +		.uffd_fn = uffd_wp_copy_reregister_test,
> +		.mem_targets = MEM_ALL,
> +		.uffd_feature_required = UFFD_FEATURE_PAGEFAULT_FLAG_WP |
> +		UFFD_FEATURE_WP_HUGETLBFS_SHMEM,
> +	},
>  	{
>  		.name = "minor",
>  		.uffd_fn = uffd_minor_test,
> -- 
> 2.56.0
> 

-- 
Sincerely yours,
Mike.
