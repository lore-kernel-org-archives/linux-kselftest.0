Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E86914C33C3;
	Tue, 29 Sep 2026 09:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790673136; cv=none; b=XR7/5kzP5TA/WcditFtWT8YZy4/JnegsjrwwJd6ZEQDfhSuRZC9HPDMs+2YPrrXBFzdt3g33K6A6uBAMHueYJ0fCQ1ptla+crUe/mu9aNYfkP/ud3Wu+1Su6747HDsx9FC8vejs7zjaKJbl6sU0hSG3vnM5XxbhuGW0b9UFwakI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790673136; c=relaxed/simple;
	bh=wgKILSXuEi7du6F+rP+bwhotws65yqXaxwnVCS6+XnY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ls3MUTQjSvLqpoudXLljG7bj9xAaDwdtyS3utWuAer9CbHJGAm2AENimhRVYpI8Q29+6R6Fl4vYPGnDckiN3QWu1C0oUxMCe01SMmJOlqhlee6+xOrOX+vz7Y8rO7XJgDYT5MEqNxQE9+TuVWbJ0uxjpvZFVntqjXZhrYiRSgqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eDl4xRwG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eDl4xRwG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC9781F000FF;
	Tue, 29 Sep 2026 09:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790673124;
	bh=TlpK6AkQLjGzwcY0xdIG2tbpzGDvPT2iBKRsp+RWEdU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eDl4xRwGJfwRtbA4uTiD+Cq5r4o89slV//hSSfqjP9f49gZJY0JvRe6fTjCKAqLwo
	 ihWI4LXh+dqA6G7bWo7yI8feLtzng5NLDv6tQxfBcAJgHB7sBzpBwT5JhyvO+6RdQ0
	 cUNeHDLU772oPvkjpDsH0iQW3TeYJMQJ6YBdBtNW7Q6BKT+OyMkdj2g1AWj/0tckCL
	 qaP2m4VlJX39QSfcQN8CGgoIoiO+Yxbqi61KqYFPpqZZ33Qefras7Pii3rQUc3NiuV
	 LYYZrzbQ882s1zfZUjnegNq6TC79tL18N7zTFzlGCbVTjFdEdAMrT4DDbOP+7fazMb
	 xHWlkTAHQ/OWA==
Date: Tue, 29 Sep 2026 10:11:57 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Carlos Llamas <cmllamas@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>, 
	kernel-team@android.com, linux-kernel@vger.kernel.org, 
	"open list:MEMORY MANAGEMENT - MISC" <linux-mm@kvack.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH] selftests/mm: cleanup -Wformat issues in hugetlb-mmap
Message-ID: <aruA14n4S_gnCRd9@gremlin>
References: <20260927162419.820609-1-cmllamas@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260927162419.820609-1-cmllamas@google.com>

On Sun, Sep 27, 2026 at 04:24:18PM +0000, Carlos Llamas wrote:
> Commit ae571cd6015c ("selftests/mm: hugetlb-mmap: add setup of HugeTLB
> pages") and commit 9c5a65f374f8 ("selftests/mm: merge map_hugetlb into
> hugepage-mmap") added logs of 'hugepage_size' which has a size_t type.
> However, the incorrect format specifier '%lu' was used which triggers
> -Wformat warnings when building for 32-bit:
>
>   hugetlb-mmap.c:125:55: warning: format specifies type 'unsigned long'
>   but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
>     125 | ksft_print_msg("Default size hugepages (%lu kB)\n", hugepage_size >> 10);
>         |                                         ~~~         ^~~~~~~~~~~~~~~~~~~
>         |                                         %zu
>
>   hugetlb-mmap.c:134:47: warning: format specifies type 'unsigned long'
>   but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
>     134 | ksft_exit_skip("Not enough %lu Kb pages\n", hugepage_size >> 10);
>         |                            ~~~              ^~~~~~~~~~~~~~~~~~~
>         |                            %zu
>
> Fix this by switching to the expected '%zu' format specifier.
>
> Cc: Mike Rapoport <rppt@kernel.org>
> Signed-off-by: Carlos Llamas <cmllamas@google.com>

Acked-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

> ---
>
> Note that I intentionally skipped the 'Fixes:' tag as I've been
> previously suggested _not_ to use it for kselftest patches. However, I
> can certainly add one if someone prefers it that way. Thanks!
>
>  tools/testing/selftests/mm/hugetlb-mmap.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/tools/testing/selftests/mm/hugetlb-mmap.c b/tools/testing/selftests/mm/hugetlb-mmap.c
> index 0f2aad1b7dbd..2edbc992e6bc 100644
> --- a/tools/testing/selftests/mm/hugetlb-mmap.c
> +++ b/tools/testing/selftests/mm/hugetlb-mmap.c
> @@ -122,7 +122,7 @@ int main(int argc, char **argv)
>  		hugepage_size = default_huge_page_size();
>  		if (!hugepage_size)
>  			ksft_exit_skip("Could not detect default hugetlb page size.");
> -		ksft_print_msg("Default size hugepages (%lu kB)\n", hugepage_size >> 10);
> +		ksft_print_msg("Default size hugepages (%zu kB)\n", hugepage_size >> 10);
>  	}
>
>  	/* munmap will fail if the length is not page aligned */
> @@ -131,7 +131,7 @@ int main(int argc, char **argv)
>
>  	hugetlb_set_nr_pages(hugepage_size, nr);
>  	if (hugetlb_free_pages(hugepage_size) < nr)
> -		ksft_exit_skip("Not enough %lu Kb pages\n", hugepage_size >> 10);
> +		ksft_exit_skip("Not enough %zu Kb pages\n", hugepage_size >> 10);
>
>  	ksft_set_plan(2);
>  	ksft_print_msg("Mapping %lu Mbytes\n", (unsigned long)length >> 20);
> --
> 2.56.0.rc1.315.gc6ed9934b7-goog
>

--
Cheers, Lorenzo
