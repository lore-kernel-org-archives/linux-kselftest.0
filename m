Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32C6C3C13E7;
	Fri, 27 Mar 2026 07:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774595336; cv=none; b=noQSavUzYbxcz7bMzT/3O2LSkuuCUeUSbYXiN9T3qL25d6Jl0gPKeSwKGd26h26aAnXCowIsVAj+QlEnYCr0YKtz0mZfaAXaIjR54jeFrX8EN6WfRauhkb/710W/N7ucSbJjBy51MtXnN7gygSOchQKMUyqX7Q3W3TCiKgBGYUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774595336; c=relaxed/simple;
	bh=HUUMzFtQd95LWuOLKItXity1Tg4z0VrPVxPr5dhpgss=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jf9cjQmXq3Q/+I4TYjLqkvbVesoZUWcfOqFjpK7XQ6ykGeEukQomTtPFcteGrQD4TLrgK+hVNd00fDQTtRVPJUoO47bt6pbYokauFb9U+tmZoaIAHKprqoBH1eFZWt+k8BXoI9oowNvxM/ID5ccLlyR71WUtndCPGUZfMrsgvQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HbFM/nt2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HbFM/nt2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89E83C19424;
	Fri, 27 Mar 2026 07:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774595335;
	bh=HUUMzFtQd95LWuOLKItXity1Tg4z0VrPVxPr5dhpgss=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HbFM/nt2fcqw/rKPWsd2t1mhCyK2TqUqQUAHVFbe8GiwCTIMg0uPfcHg0T1i3D1ZX
	 s9AxmNOnxBNhDa2CLdvKRfUPR6EHAodTdvO+w/pBVW9cLyUyh4FSFiOHPpnCHp+YNf
	 +0iyExEAo+kDQgaWKsnEK0IleBpUKRWXO/OUBnXMnYR1SopujjauNQO/F4MgqNzFg0
	 pVsc+0dfOnTL7UF4E3zgUOK54DSFYmg7jv4eWpVyr6l5ofx+mhpvg2RCKjCfpAMxYB
	 mGKc9VFqyvg+CrD7Deb2pyQsRk/RvTpfAIWLRwvS6JoQwrkPwR2t2czzzmd1tfr9Zn
	 7/M/kwh+y461w==
Date: Fri, 27 Mar 2026 10:08:47 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Li Wang <liwang@redhat.com>
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org,
	Liam.Howlett@oracle.com, vbabka@kernel.org, surenb@google.com,
	mhocko@suse.com, shuah@kernel.org, aubaker@redhat.com,
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/mm: skip hugetlb_dio tests when DIO alignment
 is incompatible
Message-ID: <acYs_-UOv72cmO-P@kernel.org>
References: <20260327031243.15903-1-liwang@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327031243.15903-1-liwang@redhat.com>

On Fri, Mar 27, 2026 at 11:12:43AM +0800, Li Wang wrote:
> hugetlb_dio test uses sub-page offsets (pagesize / 2) to verify that
> hugepages used as DIO user buffers are correctly unpinned at completion.
> 
> However, on filesystems with a logical block size larger than half the
> page size (e.g., 4K-sector block devices), these unaligned DIO writes
> are rejected with -EINVAL, causing the test to fail unexpectedly.
> 
> Add check_dio_alignment() which queries the filesystem's DIO alignment
> requirement via statx(STATX_DIOALIGN) and skips the test early if the
> sub-page offset used by the test is not compatible with the alignment
> constraint.
> 
> === Reproduce Steps ===
> 
>   # dd if=/dev/zero of=/tmp/test.img bs=1M count=512
>   # losetup --sector-size 4096 /dev/loop0 /tmp/test.img
>   # mkfs.xfs /dev/loop0
>   # mkdir -p /mnt/dio_test
>   # mount /dev/loop0 /mnt/dio_test
> 
>   // Modify test to open /mnt/dio_test and rebuild it:
>   -       fd = open("/tmp", O_TMPFILE | O_RDWR | O_DIRECT, 0664);
>   +       fd = open("/mnt/dio_test", O_TMPFILE | O_RDWR | O_DIRECT, 0664);
> 
>   # getconf PAGESIZE
>   4096
> 
>   # echo 100 >/proc/sys/vm/nr_hugepages
> 
>   # ./hugetlb_dio
>   TAP version 13
>   1..4
>   # No. Free pages before allocation : 100
>   # No. Free pages after munmap : 100
>   ok 1 free huge pages from 0-12288
>   Bail out! Error writing to file
>   : Invalid argument (22)
>   # Planned tests != run tests (4 != 1)
>   # Totals: pass:1 fail:0 xfail:0 xpass:0 skip:0 error:0
> 
> Signed-off-by: Li Wang <liwang@redhat.com>
> ---
>  tools/testing/selftests/mm/hugetlb_dio.c | 37 +++++++++++++++++-------
>  1 file changed, 27 insertions(+), 10 deletions(-)
> 
> diff --git a/tools/testing/selftests/mm/hugetlb_dio.c b/tools/testing/selftests/mm/hugetlb_dio.c
> index 9ac62eb4c97d..afcca50d190e 100644
> --- a/tools/testing/selftests/mm/hugetlb_dio.c
> +++ b/tools/testing/selftests/mm/hugetlb_dio.c
> @@ -20,6 +20,31 @@
>  #include "vm_util.h"
>  #include "kselftest.h"
>  
> +#ifndef STATX_DIOALIGN
> +#define STATX_DIOALIGN		0x00002000U
> +#endif
> +
> +void check_dio_alignment(size_t pagesize)
> +{
> +	int fd;
> +	struct statx stx;
> +	unsigned int dio_align = 1;
> +
> +	fd = open("/tmp", O_TMPFILE | O_RDWR, 0664);
> +	if (fd < 0)
> +		ksft_exit_skip("Unable to allocate file: %s\n", strerror(errno));
> +
> +	if (statx(fd, "", AT_EMPTY_PATH, STATX_DIOALIGN, &stx) == 0 &&
> +				(stx.stx_mask & STATX_DIOALIGN))
> +		dio_align = stx.stx_dio_offset_align;
> +
> +	close(fd);
> +
> +	if ((pagesize / 2) % dio_align != 0)
> +		ksft_exit_skip("DIO alignment (%u) incompatible with sub-page offset %lu\n",
> +				dio_align, pagesize / 2);

This also needlessly skips the test with aligned offsets.

I'd suggest detecting dio_align here, passing it to run_dio_using_hugetlb()
and moving the check that skips a test there.

> +}
> +
>  void run_dio_using_hugetlb(unsigned int start_off, unsigned int end_off)
>  {
>  	int fd;

-- 
Sincerely yours,
Mike.
