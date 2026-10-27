Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793103733;
	b=iyaweAGTL8Pl0KkFmJsJ5jaHzRX2DhuSzsgnZOVKTdEXeIdWtBnu4Xc9Nk50xqMFD3lD
	 5YpYZEtQRb9sXe1FMpM+hBXJmI/xk+P+KfzJbtOY05ejASqeR4gu0X/McDFWvFxQA4Hr8
	 Bnc3QdIS9QYprkI5uMT1fEdrFCCx9/6uvWO+eKRRkTzo4SQaFPvGNkgrT215+IIAuA1BF
	 j9Rj6QoG7vbCHbo6tff3mRYD5S2U73Vu3LThOJN7EegPN5L8vVsz7E9EHVfVCd4oAhKNE
	 LXcp8S6Z+taTtE3LNBfSJbWWax4FRbYkYz593craKXQuNG5yK2vBT0PCXncoomViocA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793103733;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Z6rA9UMp/JGSOmXViOzDwSr7LLAHqPbFa1f8OGf68K4=;
	b=gPHMQu9Qc+NszaYjsQeBLzi6zvigR+RvpOWzP0nus3rgSsSuFXWNZNy4VmIJdClAqtLV
	 ArNcP4bnjr95Im2m3kZnlRN+FdJkFXLxiSouCykZCsDjcRSxULq6NvJu/lvEcA3OcVxiy
	 AtQJcPc9ayQAsmhwZzgpZqfU+UbOF5DSXrhJwmhPciOlNypjaTcRtyGXp1QMhKed04XIM
	 v4Atwsb1zth+vJeWEXTvBAm74Z2TqSSFwp5Bx/LkfXTXNj7r9rzzOYtlYNfMn0kZxRNWT
	 URfDqCnvyhnyMWwH9H5wuCBY//6t153ouDWMT/Ue4zFqB0MOYVkPCeulERG4ayjK6nQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UxpDHeHH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84D49606A31B;
	Tue, 27 Oct 2026 12:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UxpDHeHH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E51341F01825;
	Tue, 27 Oct 2026 12:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793103732;
	bh=Z6rA9UMp/JGSOmXViOzDwSr7LLAHqPbFa1f8OGf68K4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UxpDHeHHwyVTSC2pD+MOAmNN4c2M119lUqYyqPLxq+Qvp4f58sZ6KGWrDc2sKe0ND
	 tsb+ueZ5gn520fctwRvayMfwtMQouzf9jLxSmX3evATAa+rXSx8fyM5Ahe5vhofhCS
	 vg7Zj5H1ah8Azrm/6/33eDsFel2HS2lhGLD4k9pTg5nXW879Sy0nVBSQwViYtT8MKi
	 sgp3mgF9XO8szQ7PGIbD06U6CLMjpIEcKMAly0zcKNo6v96kddu6ENRyVSSwpxG8Vm
	 aAXHPWiqXsFnTSlCEKwsHJCFdaqxlHf0iElfwOeaFJP2taL6+zEg45bewKaVaGteN/
	 JwSd9Mre+m2Ng==
Date: Tue, 27 Oct 2026 12:22:07 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Zenghui Yu <zenghui.yu@linux.dev>
Cc: linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, akpm@linux-foundation.org, david@kernel.org, liam@infradead.org, 
	vbabka@kernel.org, rppt@kernel.org, surenb@google.com, mhocko@suse.com, 
	kas@kernel.org
Subject: Re: [PATCH] selftests/mm: fix khugepaged_race build with older glibc
Message-ID: <auCXZk9g9nFK1Kbs@gremlin>
References: <20261027122013.4286-1-zenghui.yu@linux.dev>
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
In-Reply-To: <20261027122013.4286-1-zenghui.yu@linux.dev>

On Tue, Oct 27, 2026 at 08:20:13PM +0800, Zenghui Yu wrote:
> From: "Zenghui Yu (Huawei)" <zenghui.yu@linux.dev>
>
> glibc versions before 2.37 do not define MADV_COLLAPSE in <sys/mman.h>, so
> khugepaged_race fails to build against them (e.g. glibc 2.34):
>
> [root@localhost mm]# make
>   CC       khugepaged_race
> khugepaged_race.c: In function 'main':
> khugepaged_race.c:506:23: error: 'MADV_COLLAPSE' undeclared (first use in this function); did you mean 'MADV_COLD'?
>   506 |       hpage_pmd_size, MADV_COLLAPSE);
>       |                       ^~~~~~~~~~~~~
>       |                       MADV_COLD
> khugepaged_race.c:506:23: note: each undeclared identifier is reported only once for each function it appears in
> make: *** [../lib.mk:225: /data/code/mm/tools/testing/selftests/mm/khugepaged_race] Error 1
>
> Include <linux/mman.h> to get the UAPI definition of MADV_COLLAPSE.
>
> Fixes: 66c374464438 ("selftests/mm: add khugepaged race harness")
> Signed-off-by: Zenghui Yu (Huawei) <zenghui.yu@linux.dev>

Seems sensible enough so:

Acked-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

> ---
>  tools/testing/selftests/mm/khugepaged_race.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/tools/testing/selftests/mm/khugepaged_race.c b/tools/testing/selftests/mm/khugepaged_race.c
> index abb0678522cd..1a27cb39745b 100644
> --- a/tools/testing/selftests/mm/khugepaged_race.c
> +++ b/tools/testing/selftests/mm/khugepaged_race.c
> @@ -8,6 +8,7 @@
>  #define _GNU_SOURCE
>  #include <errno.h>
>  #include <fcntl.h>
> +#include <linux/mman.h>
>  #include <pthread.h>
>  #include <stdio.h>
>  #include <stdlib.h>
> --
> 2.56.0
>

--
Cheers, Lorenzo
