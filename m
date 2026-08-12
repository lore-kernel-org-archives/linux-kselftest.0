Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CB7033D4F0;
	Wed, 12 Aug 2026 07:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786519163; cv=none; b=TNJ23Ok75L6QZ9B9QpoaWCM6nuZC2saf8UaAj0x1dIY19ixxNBfwrWtr8H5CPmsz10JiqMelq3AK+Z6epJxUjhAgVELyHBbcQcbQ9oKKPvGNoQY8K7qGiqjsgw27s76G4eHxKQklQGxfMItoYeB43X/ulxY3cTLuT3xrSE02mO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786519163; c=relaxed/simple;
	bh=Kt2JcTN3PVJ9DPLb+fTZY12HSAIsA8t8qZdCb+qsF9Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cZ7qZiuwZSUDPWS8K3wyN735iT8zbcUv4zsdj2UPudsqhrFrGxZ+fVdXB8nfzvogg6h9v29WV7D4QYYFmcjUC8QpA08Utt9IBBCWM6IdAqfrOOFUHNRXh1EuOT+MUg7FCnFa3dbUwArPDPo2FxSfTMcgqoKxG0NrkVIvTxazyfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iWC3V+9j; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iWC3V+9j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81D191F000E9;
	Wed, 12 Aug 2026 07:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786519162;
	bh=qfX48QkquLWzR1+PO7k9R/d8Tp1TXi6Cfs/zpXrXi3A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iWC3V+9jzNSaccdN447tsnb4AQXVGTC2aq4nEXry75v+8hrutQ0Nv77klgtsXQe2h
	 tMHN8nt21NNSkJ47M3GqQhlVqxCIgDaWbTU3jfz0sVHmQx79yy2QsFvYbEBezuJDWF
	 3R1PqhAk0uf+kjmH3+sRGeb0pDvzPu1LiUNFNlYavzGlD+q2+iU0g8SXPafphupEId
	 J1JKiF/8houQkJrzYGnRt+ZYwlmJ8TdL+Dbm1aU1iSmYVL3kEHglNmx/uI3cUPTFkd
	 gWVphp/YHDA5Rb1tFaDRAis2T1y3MJpHzy+lfOO4NhVcn/RrnJfCxZ1oBsvwHrCXiR
	 p+q8vj5DTIk4g==
Date: Wed, 12 Aug 2026 08:19:03 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH] selftests/mm: thuge-gen: fix test_shmget() for PAGE_SIZE
 check
Message-ID: <anweBwHBa5PlFbEg@lucifer>
References: <20260809-selftests-thuge-gen-fix-v1-1-1919f4b3d12f@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260809-selftests-thuge-gen-fix-v1-1-1919f4b3d12f@kernel.org>

On Sun, Aug 09, 2026 at 11:03:35AM +0300, Mike Rapoport (Microsoft) wrote:
> Commit 49a4e7186b08 ("selftests/mm: thuge-gen: add setup of HugeTLB pages")
> changed thuge-gen test to use common functions for reading hugetlb
> attributes from sysfs, but it missed that the original read_free() function
> special cased PAGE_SIZE tests.
>
> For PAGE_SIZE tests, failure to read sysfs was ignored and read_free()
> returned 0.
>
> This allowed test_shmget() to essentially skip the check of how many huge
> pages was consumed when it ran with PAGE_SIZE.
>
> Commit 3199b0c09efa ("selftests/mm: fix read_file() return value check")
> fixed the common read_file() to actually return error on failure and this
> exposed the issue in test_shmget() that checks the number of free hugetlb
> pages even for PAGE_SIZE test, tries to access
>
> /sys/kernel/mm/hugepages/hugepages-<PAGE_SIZE>/free_hugepages
>
> and obviously fails there.
>
> Gate the checks for free huge pages on size != getpagesize() and initialize
> before and after variables to values matching PAGE_SIZE test.
>
> Fixes: 49a4e7186b08 ("selftests/mm: thuge-gen: add setup of HugeTLB pages")
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

With the issue Sarthak brought up addressed, LGTM, so:

Acked-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

> ---
> selftests/mm: thuge-gen: fix test_shmget() for PAGE_SIZE check
> ---
>  tools/testing/selftests/mm/thuge-gen.c | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
>
> diff --git a/tools/testing/selftests/mm/thuge-gen.c b/tools/testing/selftests/mm/thuge-gen.c
> index 22b9c2f1c35d..50d0805b65db 100644
> --- a/tools/testing/selftests/mm/thuge-gen.c
> +++ b/tools/testing/selftests/mm/thuge-gen.c
> @@ -71,12 +71,16 @@ void test_mmap(unsigned long size, unsigned flags)
>
>  void test_shmget(unsigned long size, unsigned flags)
>  {
> -	int id;
> -	unsigned long before, after;
> +	/* values for PAGE_SIZE test */
> +	unsigned long before = NUM_PAGES;
> +	unsigned long after = 0;
>  	struct shm_info i;
>  	char *map;
> +	int id;
> +
> +	if (size != getpagesize())
> +		before = hugetlb_free_pages(size);
>
> -	before = hugetlb_free_pages(size);
>  	id = shmget(IPC_PRIVATE, size * NUM_PAGES, IPC_CREAT|0600|flags);
>  	if (id < 0) {
>  		if (errno == EPERM) {
> @@ -97,10 +101,11 @@ void test_shmget(unsigned long size, unsigned flags)
>  	shmctl(id, IPC_RMID, NULL);
>
>  	memset(map, 0xff, size*NUM_PAGES);
> -	after = hugetlb_free_pages(size);
> +	if (size != getpagesize())
> +		after = hugetlb_free_pages(size);
>
>  	show(size);
> -	ksft_test_result(size == getpagesize() || (before - after) == NUM_PAGES,
> +	ksft_test_result((before - after) == NUM_PAGES,
>  			 "%s: mmap %lu %x\n", __func__, size, flags);
>  	if (shmdt(map))
>  		ksft_exit_fail_msg("%s: shmdt: %s\n", __func__, strerror(errno));
>
> ---
> base-commit: 17e5919bdca144d4e67337f53bf57d7811f62192
> change-id: 20260809-selftests-thuge-gen-fix-5ac05f56307c
>
> --
> Sincerely yours,
> Mike.
>

--
Cheers, Lorenzo
