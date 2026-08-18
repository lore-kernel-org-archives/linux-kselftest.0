Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA2D63C1400;
	Tue, 18 Aug 2026 09:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787044323; cv=none; b=rEDgrd3B1k8WlAKLKX5yzeSlRNbOmNjsMs2b+GIx5AR3LGEJM0wV8uBAA9pQDSn9DSDdBISw78qCNO0wDdQfx2a5jy8g/cmAgxtHckuxoZSOvkndZyFpfR5C7Y37Q1PVR1jFQ8ZhUsey2IMWd5QvwxOpbTVLVWgXE5W/Ox23cp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787044323; c=relaxed/simple;
	bh=cuRIiObeNE4ICbu3GRD5dmtsj5C5Sgu5FeEH6kzkAa8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LrJJu6gr/b5P8SbkvUk2+tUchlKWvNUPZiGGBlcpBdZDI97zKaHY/ZVAR9k+nzfDUKSCuSuPbdaXFSMc4feUtntbwmE2Qsavl5GEjws1syUzlx3puyIzuYNd7bOXrG55RVeBPfY0MVbIlQ27U1rEzAg5+vuNh/3O0plDv4JaJdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FSHHqjX1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FSHHqjX1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51D0E1F000E9;
	Tue, 18 Aug 2026 09:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787044321;
	bh=BclwZjJy/b/hd4HsLT9ylg+oFGDYStXss7i8/P8OB1E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FSHHqjX1A3kmPL6OA5NK7FhO/kc0UXcu2qV4JqvQ8kaIvCBFhbv2rMpsn+YGxL58b
	 iUGfsIZ9xvwlz+3y9TGSYH/iXvCEZQO1baf7k/I4YE2GUV5vTCQMxfPyXLHGglvaAE
	 42/Zcr9ygLkaOdWepPzploaAJbS+U8LFTkcqR7F1qBOpAXEKKmc93+jKUs/2K9mGMm
	 w/4B/abZukMeiZxO5S3LPdpM190H1C0OsNvdwyjPvNZ6/o23rISFtqFwCSMCRCabQE
	 G7LK1+dd/4EhZD0Z+tfLwOU/wdY52so2/2kM8UYks17+3e6qPoqyKFec/dE6lB0E83
	 JQzhisgz0UN7A==
Date: Tue, 18 Aug 2026 10:11:40 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Kiryl Shutsemau <kirill@shutemov.name>
Cc: akpm@linux-foundation.org, david@kernel.org, nico.pache@linux.dev, 
	baolin.wang@linux.alibaba.com, baohua@kernel.org, dev.jain@arm.com, hughd@google.com, 
	lance.yang@linux.dev, liam@infradead.org, mhocko@suse.com, rppt@kernel.org, 
	ryan.roberts@arm.com, shuah@kernel.org, surenb@google.com, usama.arif@linux.dev, 
	vbabka@kernel.org, ziy@nvidia.com, usama.anjum@arm.com, agordeev@linux.ibm.com, 
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kas@kernel.org
Subject: Re: [PATCH v4 01/19] selftests/mm: raise the khugepaged test-case cap
Message-ID: <aoQhxXxatSHKEknn@lucifer>
References: <20260815015901.1236937-1-kirill@shutemov.name>
 <20260815015901.1236937-2-kirill@shutemov.name>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260815015901.1236937-2-kirill@shutemov.name>

On Sat, Aug 15, 2026 at 02:58:43AM +0100, Kiryl Shutsemau wrote:
> From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
>
> TEST() ends the run with "MAX_TEST_CASES is too small" when the table
> fills, and the table holds 64.  A full invocation already registers 63, so
> the next case added anywhere aborts the whole suite before a single test
> runs.
>
> Raise the cap to 256.  The table is a static array of small structs, so the
> room costs nothing worth counting.
>
> Assisted-by: Claude-Code:claude-opus-5
> Acked-by: Usama Arif <usama.arif@linux.dev>
> Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>

Acked-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

> ---
>  tools/testing/selftests/mm/khugepaged.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/selftests/mm/khugepaged.c
> index d3a53673e1f9..6cfec2b940ac 100644
> --- a/tools/testing/selftests/mm/khugepaged.c
> +++ b/tools/testing/selftests/mm/khugepaged.c
> @@ -1290,7 +1290,7 @@ struct test_case {
>  	test_fn fn;
>  };
>
> -#define MAX_TEST_CASES 64
> +#define MAX_TEST_CASES 256
>  static struct test_case test_cases[MAX_TEST_CASES];
>  static int nr_test_cases;
>
> --
> 2.54.0
>

--
Cheers, Lorenzo
