Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com [95.215.58.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1578A3FA5F1;
	Fri, 26 Jun 2026 14:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782485329; cv=none; b=t1EMZ6uSfvsHKgYLaPWpHfc256cQjnjYRIx1bLBkVIaLLaXh0C/e1zL9jW0lHzu/RWzU4U5DLZ7ixaVIVjTWZ47Dva8miyKpcIm6I0zi2uaXXXsI7mDbxDC//tXvBQtU/FJjQ6D6LODKdqllToFAyC5p+RwXGHN2y6kbu3tuz8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782485329; c=relaxed/simple;
	bh=H+8vCl7B6p5AzDxtseBlTPX6djhQoxiScrhDCBotb98=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WecZbfPa+Wtl9JOQnb6k/ZLj9G7V5791XcL4GJn0ugfJqxAYyzNV/mi7gxH11+lMpZfAEsBAXWpCZme53+D479ByN3N6X7R3GP8Wf14xFrGrYOK2SQM5VI/LUdHpSZvwfjvqJuoPxBJacj/VEpZixhFQYUjnOLblIgqdOQ/L0lA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=AULFV8Br; arc=none smtp.client-ip=95.215.58.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="AULFV8Br"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782485323;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+d/7ra1oyDy8FyFgz7QVlu1h97UzmlQOCBPgAiPibmc=;
	b=AULFV8BrKKN5qg0eXAyY3S0T2tsj5sBo1qe/+rhSgEyOxk9IOmvtAZUZSNWFEoOeIp3+7J
	uV28C/FVYwy93EHn91SRI/KiWMilogWBQ1OobydKjwgkM0LhkmLCxXEV2u1wbtqmXx1RP9
	yYiaj/nFzo6K/GXun1dSd3ogpt8KI+E=
From: Usama Arif <usama.arif@linux.dev>
To: Sayali Patil <sayalip@linux.ibm.com>
Cc: Usama Arif <usama.arif@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Ritesh Harjani <ritesh.list@gmail.com>,
	David Hildenbrand <david@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	Michal Hocko <mhocko@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Dev Jain <dev.jain@arm.com>,
	Liam.Howlett@oracle.com,
	linuxppc-dev@lists.ozlabs.org,
	Miaohe Lin <linmiaohe@huawei.com>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Subject: Re: [PATCH 1/2] selftests/mm: handle EINVAL when configuring gigantic hugepages
Date: Fri, 26 Jun 2026 07:48:34 -0700
Message-ID: <20260626144835.3759976-1-usama.arif@linux.dev>
In-Reply-To: <8bfa921e30eb94072685103f6496784aa23bb166.1782365671.git.sayalip@linux.ibm.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

On Thu, 25 Jun 2026 18:10:16 +0530 Sayali Patil <sayalip@linux.ibm.com> wrote:

> Some MM selftests attempt to configure the amount of
> HugeTLB pages of different sizes by writing to nr_hugepages.
> 
> PowerPC hash MMU pSeries systems advertise gigantic hugepage sizes 
> but do not support runtime allocation of such pages, writes
> to the corresponding nr_hugepages file fail with -EINVAL.
> This causes the test to bail out even though the failure is due
> to a platform limitation rather than the
> functionality being tested.
> 
> Treat -EINVAL from the sysfs write as a skipped configuration request
> and continue running the test instead of failing.
> 
> Before patch:
>    -------------------------
>    running ./hugetlb-madvise
>    -------------------------
>    TAP version 13
>    1..1
>      [INFO] detected hugetlb page size: 16777216 KiB
>      [INFO] detected hugetlb page size: 16384 KiB
>     ok 1 MADV_DONTNEED and MADV_REMOVE on hugetlb
>     Totals: pass:1 fail:0 xfail:0 xpass:0 skip:0 error:0
>     Bail out! /sys/kernel/mm/hugepages/hugepages-16777216kB/nr_hugepages
>     write(0) failed: Invalid argument
>     Totals: pass:0 fail:0 xfail:0 xpass:0 skip:0 error:0
>     [FAIL]
> 
> After patch:
>    -------------------------
>    running ./hugetlb-madvise
>    -------------------------
>    TAP version 13
>    1..1
>     [INFO] detected hugetlb page size: 16777216 KiB
>     [INFO] detected hugetlb page size: 16384 KiB
>    ok 1 MADV_DONTNEED and MADV_REMOVE on hugetlb
>    Totals: pass:1 fail:0 xfail:0 xpass:0 skip:0 error:0
>    /sys/kernel/mm/hugepages/hugepages-16777216kB/nr_hugepages
>    write(0) failed: Invalid argument
>    [PASS]
> 
> Fixes: 9d07250ea1eb ("selftests/mm: hugepage_settings: add APIs to get and set nr_hugepages")
> Signed-off-by: Sayali Patil <sayalip@linux.ibm.com>
> ---
>  tools/testing/selftests/mm/vm_util.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/tools/testing/selftests/mm/vm_util.c b/tools/testing/selftests/mm/vm_util.c
> index 311fc5b4513e..a8f16eef5c7c 100644
> --- a/tools/testing/selftests/mm/vm_util.c
> +++ b/tools/testing/selftests/mm/vm_util.c
> @@ -735,6 +735,13 @@ void write_file(const char *path, const char *buf, size_t buflen)
>  	saved_errno = errno;
>  	close(fd);
>  	errno = saved_errno;
> +
> +	if (numwritten < 0 && errno == EINVAL) {
> +		ksft_print_msg("%s write(%.*s) failed: %s\n", path,
> +			       (int)(buflen - 1), buf, strerror(errno));
> +		return;
> +	}
> +
This makes write_file() silently succeed for every EINVAL, not just the
gigantic-hugetlb setup case. Several callers use this helper for writes where
EINVAL is a real test failure, for example drop_caches or split huge page
setup. Those tests can now continue after a failed setup and report misleading
results.

Please keep the common helper strict and ignore EINVAL only in the hugetlb
path that is probing unsupported gigantic page runtime allocation.


>  	if (numwritten < 0)
>  		ksft_exit_fail_msg("%s write(%.*s) failed: %s\n", path, (int)(buflen - 1),
>  				buf, strerror(errno));
> -- 
> 2.52.0
> 
> 
