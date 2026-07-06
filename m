Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F841DE4F1;
	Mon,  6 Jul 2026 01:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783300725; cv=none; b=g4Ev8SI7wh744TbGpVIMvK9XtkcetVPyBMz9OTXLRfH4Q8IMliqL2n7kefzg6EgMkSJKGTahdMJLnnjj2jMvCWWaBq0p25La2IAwTH4Pb/6R67enluuVcYX+QzvOZ8PWXWWG+Jq80uAQhi/7wGeSNrMvAMoC6/Uj3mfxdIpONgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783300725; c=relaxed/simple;
	bh=WrwsT+Ncb3pgOUjIr2a42L2V6G5MctpdERpw4fCAeSg=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=r7iZ2rfe/gOtsOrCE1FRPdMDmfadWEo/Gwvi59U3F5FsRZmpe9+d6vWtlg51AoWLAgm3BYlgaT9vxBnaxyZfZBsSkkHS81LXrnd+F+w0RiQuetczfikS/KaQsAthdtWVgVm9eeZSQtuQhdkr0pf6m0Orn4c/PsyISRziNB6Xy44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=xspm3dFI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="xspm3dFI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64D741F000E9;
	Mon,  6 Jul 2026 01:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1783300723;
	bh=dCse9pyTLSRmKmhBEW/kg3N3umOx0WojuIarGT+1LjM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=xspm3dFINsFpaUjIb0bOkdmGSeRBRdJkPgGxF4MG9Yf2eXwtefOV5caZkE8M+DInY
	 Z9Rvq0vXxisksxW4151QDzPxlebMOTdFgOg7uzvSMcvg1oWEmAG5JWqaB5PLQvHOxQ
	 qS4wur2bNJZqWmcktMhGmvByWelAPisfXorI5ddI=
Date: Sun, 5 Jul 2026 18:18:43 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: "Yijia Wang" <wangyijia.yeah@bytedance.com>
Cc: <linux-kselftest@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-mm@kvack.org>, <shuah@kernel.org>
Subject: Re: [PATCH] selftests: mincore: use default huge page size for
 hugetlb test
Message-Id: <20260705181843.6c7a2c4629cb05d47305cf14@linux-foundation.org>
In-Reply-To: <20260626-b4-mincore-preview-v1-1-5f07aa02ab32@bytedance.com>
References: <20260626-b4-mincore-preview-v1-1-5f07aa02ab32@bytedance.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 26 Jun 2026 20:59:02 +0800 "Yijia Wang" <wangyijia.yeah@bytedance.com> wrote:

> The hugetlb mincore test passes the base page size as the MAP_HUGETLB
> mapping length.  This works on systems where the default huge page size
> is the same as the base page size, but mmap() can fail with EINVAL before
> mincore() is exercised when the default huge page size is larger, such as
> on arm64 systems with 64K base pages and 2M huge pages.
> 
> Use the default huge page size from /proc/meminfo for the hugetlb mapping
> and unmap length.  Keep the mincore() check scoped to one base page since
> the test only needs to verify the residency state before and after the
> mapping is touched.  This also avoids changing the mincore() length to the
> whole huge page, which would require a larger residency vector because
> mincore() reports one byte per base page.

Thanks.

AI review flagged a couple of possible issues - can you please take a
look?

https://sashiko.dev/#/patchset/20260626-b4-mincore-preview-v1-1-5f07aa02ab32@bytedance.com

> --- a/tools/testing/selftests/mincore/mincore_selftest.c
> +++ b/tools/testing/selftests/mincore/mincore_selftest.c
> @@ -22,6 +22,27 @@
>  #define MB (1UL << 20)
>  #define FILE_SIZE (4 * MB)
>  
> +static unsigned long default_huge_page_size(void)

This would be our fifth(?) implementation of default_huge_page_size()
in tools/testing/selftests.  There's a project for someone!

