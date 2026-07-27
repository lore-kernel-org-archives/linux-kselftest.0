Received: from out-178.mta1.migadu.com (out-178.mta1.migadu.com [95.215.58.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ECFD42903A
	for <linux-kselftest@vger.kernel.org>; Mon, 27 Jul 2026 16:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785171162; cv=none; b=DpPHQ9FpWk8g6Ni4HuVNc+GA5vXCQozzQiqVNj/7jDce4/INjRZMHxOL1FcmF4xyT6j3G2v7SYDIiAop+q2SOTcb6JK952FdfjCuXdGEH+B6KiOVgYZfrmBe6cDMkjEyhYvsY6jO2mYX8EOrwHUffQHiqitJ4pZNiobfRWzJzq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785171162; c=relaxed/simple;
	bh=jAFqwKMCe16VBc+Nikk+/eIqTHG9xfLtWAiunlfem8g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jQeq8sFqLEmDkwstWmXawFpHhHFwcxyGurlEK0FWSScYLjbHKU+EFgGZUAHpQeGyCT3sl2Md1MvRpyEl46ZjmeVO0GAlp1OYzEVZnb8i+iIr2/eqDsyHNFlAMLAFdYjIr6yKwoBAxj5gBveSuybkn7t6sY9ON3r7nc1nIhXgVvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=mz0iuE7H; arc=none smtp.client-ip=95.215.58.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="mz0iuE7H"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785171156;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=737YPCc/OqaflOGUif9Ots1oI1aRa+aDfXNVPdOX2Nc=;
	b=mz0iuE7HjiTMGr5ynsrR8zgQeXteBde3kPHCfQj+P5ae/H06Aiw0BaWzgtRCJIsMIOqLCx
	ptaFBnUgAka1Nt8LZpnXNQyWzkktGBAPkKgDOVAJ7/YWbHgQu4+TMSQ39XEgcNLF9TJisA
	qEEtLXK92EzItukd+0JCvWV6dAa+KS4=
From: Usama Arif <usama.arif@linux.dev>
To: Muhammad Usama Anjum <usama.anjum@arm.com>
Cc: Usama Arif <usama.arif@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Shuah Khan <shuah@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Nico Pache <npache@redhat.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>,
	Lance Yang <lance.yang@linux.dev>,
	Miaohe Lin <linmiaohe@huawei.com>,
	Naoya Horiguchi <nao.horiguchi@gmail.com>,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sarthak Sharma <sarthak.sharma@arm.com>
Subject: Re: [PATCH v3 2/5] selftests/mm: skip guard hole-punch test if MADV_REMOVE is unsupported
Date: Mon, 27 Jul 2026 09:52:21 -0700
Message-ID: <20260727165225.1628191-1-usama.arif@linux.dev>
In-Reply-To: <20260727095225.372655-3-usama.anjum@arm.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

On Mon, 27 Jul 2026 10:52:18 +0100 Muhammad Usama Anjum <usama.anjum@arm.com> wrote:

> The hole_punch case verifies that guard regions survive MADV_REMOVE and
> that the backing range is punched out.  MADV_REMOVE delegates the hole
> punch to the backing filesystem, which may reject the operation with
> EOPNOTSUPP.
> 
> That result means the test cannot establish the state whose guard
> semantics it intends to validate.  Treating the missing filesystem
> capability as a guard-region failure creates a false regression.
> 
> Unmap the range and skip only when MADV_REMOVE fails with EOPNOTSUPP.
> Preserve the assertion for all other errors so failures on supported
> configurations remain visible.
> 
> Tested-by: Sarthak Sharma <sarthak.sharma@arm.com>
> Signed-off-by: Muhammad Usama Anjum <usama.anjum@arm.com>
> ---
>  tools/testing/selftests/mm/guard-regions.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/testing/selftests/mm/guard-regions.c b/tools/testing/selftests/mm/guard-regions.c
> index b21df3040b1c7..5c8ec3ca75d7d 100644
> --- a/tools/testing/selftests/mm/guard-regions.c
> +++ b/tools/testing/selftests/mm/guard-regions.c
> @@ -1912,7 +1912,7 @@ TEST_F(guard_regions, hole_punch)
>  {
>  	const unsigned long page_size = self->page_size;
>  	char *ptr;
> -	int i;
> +	int i, ret;
>  
>  	if (variant->backing == ANON_BACKED)
>  		SKIP(return, "Truncation test specific to file-backed");
> @@ -1944,8 +1944,12 @@ TEST_F(guard_regions, hole_punch)
>  	}
>  
>  	/* Now hole punch the guarded region. */
> -	ASSERT_EQ(madvise(&ptr[3 * page_size], 4 * page_size,
> -			  MADV_REMOVE), 0);
> +	ret = madvise(&ptr[3 * page_size], 4 * page_size, MADV_REMOVE);
> +	if (ret == -1 && errno == EOPNOTSUPP) {
> +		ASSERT_EQ(munmap(ptr, 10 * page_size), 0);
> +		SKIP(return, "MADV_REMOVE not supported by filesystem");
> +	}
> +	ASSERT_EQ(ret, 0);

Correctly treats MADV_REMOVE EOPNOTSUPP as a missing prerequisite and unmaps before skipping

Acked-by: Usama Arif <usama.arif@linux.dev>

>  
>  	/* Ensure guard regions remain. */
>  	for (i = 0; i < 10; i++) {
> -- 
> 2.47.3
> 
> 
