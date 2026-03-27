Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08F6378D9F;
	Fri, 27 Mar 2026 19:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774638832; cv=none; b=MiUSEvCvVcfGNyblG0H2nOcDCDzAalm+eWkWl1wbEWlFApI5uyH61HyCKc/qGNYTN+O0HFYyKo5uJkgSHum9/MOeluYCHv/TyjLzwdRp0jcnqquw8doF844y6BSNVIg2rC5GoXo/R3LU2XRD3xJxQeKv7KKd7exx1hVpyIPmm7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774638832; c=relaxed/simple;
	bh=sCKExA/z6SpVqvB2m7zmhBRO1VOP9oHSCV8P4PPj9WA=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=e+yGipPzC8demOU+iO5H8unP/uEj0cosLuQ4RXbjQcJp6kN6aDJxbOCUd4QbQqP9ahyt09skK580dmOxHVeSw80aa3dmYjo+6ae/7bEQzS3wdjkFcFV9vJ2CEPcB2Frm/h5HnPnBVcr7WIbtT80wEZhzBCT4WkQFwyFe5DI5cfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=vGpRQ/jj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="vGpRQ/jj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9309DC19423;
	Fri, 27 Mar 2026 19:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1774638831;
	bh=sCKExA/z6SpVqvB2m7zmhBRO1VOP9oHSCV8P4PPj9WA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=vGpRQ/jjF7b3+LW+FI8glJV8BAJe7wiffXZkP1Z4Cu9fqA1GfG9lezqF1dgOYyLhC
	 sb+op9gCZrllOQ/MMdt43lxR9KtqLTAreszvVZDsxajvKgCR+1IfwddKpcxrThqY24
	 yh1kwk46NIs6HdmaPWfTzuf0scUW1U9G5+BaGIo4=
Date: Fri, 27 Mar 2026 12:13:50 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Li Wang <liwang@redhat.com>
Cc: rppt@kernel.org, david@kernel.org, ljs@kernel.org,
 Liam.Howlett@oracle.com, vbabka@kernel.org, surenb@google.com,
 mhocko@suse.com, shuah@kernel.org, aubaker@redhat.com, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] selftests/mm: skip hugetlb_dio tests when DIO
 alignment is incompatible
Message-Id: <20260327121350.858a127fa49ed6e1eb4a40a7@linux-foundation.org>
In-Reply-To: <20260327120305.58653-1-liwang@redhat.com>
References: <20260327120305.58653-1-liwang@redhat.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 27 Mar 2026 20:03:05 +0800 Li Wang <liwang@redhat.com> wrote:

> hugetlb_dio test uses sub-page offsets (pagesize / 2) to verify that
> hugepages used as DIO user buffers are correctly unpinned at completion.
> 
> However, on filesystems with a logical block size larger than half the
> page size (e.g., 4K-sector block devices), these unaligned DIO writes
> are rejected with -EINVAL, causing the test to fail unexpectedly.
> 
> Add get_dio_alignment() to query the filesystem's required DIO alignment
> via statx(STATX_DIOALIGN) and pass it to run_dio_using_hugetlb(). Skip
> individual test cases whose write length is not a multiple of the
> alignment, so that aligned cases are still tested.
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
> ...
>
>     v2:
>     	- Pass dio_align as a parameter to run_dio_using_hugetlb()
>     	  instead of generally page_size/2 alignment check.
> 

Whee, AI review has decided that pre glibc-2.36 is a problem (last time
it was pre-2.37).

And it's forgotten the previous fs-doesnt-support-DIO issues.  Did you
alter that?

The get_dio_alignment-before-ksft_print_header thing seems legit.

https://sashiko.dev/#/patchset/20260327120305.58653-1-liwang@redhat.com
