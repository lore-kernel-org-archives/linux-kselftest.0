Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5B831ADC7E
	for <linux-kselftest@vger.kernel.org>; Wed, 20 May 2026 03:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779249121; cv=none; b=ECHozTC24akWX3crLv1rhZ56/rmUFLGgkJdEOyihtk78aJSnbPK6JA4YEE/f2CqILlhvg4fA+K0VYHm/noGz3KzGzV5WtZWbjppeq/CwekQ4WvepMXvsFMA45JRb3vR+z20rpo1HqnqSBVC4wnzZyPn4Zx+2Id10YyVqatBGVko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779249121; c=relaxed/simple;
	bh=yEbIQ9nxo7JieyUNEu66PQIHHUZxcpqB7kKk/0SWI7k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e1D7ehW20Wn9dj4UEt5PiRNfvNjWI/ynPqb3w+WzSk5ltqGd/IWvDc0Yn5eDjIdIf/xo5qaV/G78FP48ezUGXG1w3sfj3Zje+7E8elepXPbu5tyydJ4caij0MDsPlGaJBpFLmtsi6ze2V9fkgREZNoZTXplbp2YPxDTjknvZ36Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=hlNRoVp5; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="hlNRoVp5"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ACB5B355B;
	Tue, 19 May 2026 20:51:49 -0700 (PDT)
Received: from [10.164.148.41] (MacBook-Pro.blr.arm.com [10.164.148.41])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A28B63F632;
	Tue, 19 May 2026 20:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779249114; bh=yEbIQ9nxo7JieyUNEu66PQIHHUZxcpqB7kKk/0SWI7k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hlNRoVp5NYQgmkQYXQZO45ye6Ka3/z/qUpMLTyclSLGvip0xjeTgt/hW/2yPXVbKa
	 rgazoQan+iiP28XFyP14qz+Rj9Dm/W1ariN0JG6jPhp/xSy2X2P2FVxX3p0/OC8zYU
	 IKAvfkEQ2u+JyVugakiXQsMXeDF0k8/ptCAS6vZ0=
Message-ID: <20518530-12e3-4731-9b4a-54cc950239e2@arm.com>
Date: Wed, 20 May 2026 09:21:48 +0530
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests/mm: close fd on write error
To: Wei Yang <richard.weiyang@gmail.com>, akpm@linux-foundation.org,
 david@kernel.org, ljs@kernel.org
Cc: linux-mm@kvack.org, linux-kselftest@vger.kernel.org
References: <20260520020336.28914-1-richard.weiyang@gmail.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20260520020336.28914-1-richard.weiyang@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 20/05/26 7:33 am, Wei Yang wrote:
> When create_pagecache_thp_and_fd() write returns error on
> /proc/sys/vm/dropcache, it just "goto err_out_unlink", which left fd
> still open.
> 
> Use "goto err_out_close" to close the fd.
> 
> Signed-off-by: Wei Yang <richard.weiyang@gmail.com>
> ---
>  tools/testing/selftests/mm/split_huge_page_test.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/mm/split_huge_page_test.c b/tools/testing/selftests/mm/split_huge_page_test.c
> index 460fa1f606fd..f30402ece608 100644
> --- a/tools/testing/selftests/mm/split_huge_page_test.c
> +++ b/tools/testing/selftests/mm/split_huge_page_test.c
> @@ -469,7 +469,7 @@ static int create_pagecache_thp_and_fd(const char *testfile, size_t fd_size,
>  	}
>  	if (write(*fd, "3", 1) != 1) {
>  		ksft_perror("write to drop_caches");
> -		goto err_out_unlink;
> +		goto err_out_close;
>  	}
>  	close(*fd);

LGTM

Reviewed-by: Dev Jain <dev.jain@arm.com>


I asked AI and it points to another problem:

for (i = 0; i < nr_thps; i++) {
	if (is_backed_by_folio(page_area + i * pagesize, 0,
			       pagemap_fd, kpageflags_fd))
		continue;
	ksft_test_result_fail("THP %zu not split\n", i);
}

ksft_test_result_pass("Split PTE-mapped huge pages successful\n");

"If one THP is not split, it prints FAIL, but then falls through and also prints PASS.

It should probably jump to out after the failure".

>  

