Received: from mta1.migadu.com (out-242.mta1.migadu.com [95.215.58.242])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51D535427EB
	for <linux-kselftest@vger.kernel.org>; Tue,  8 Sep 2026 13:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.242
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788875485; cv=none; b=T26iE0NOywo9SINOs/w6bq3Cy/ex+tl0+JJWuEAPkOqsO/a8Pd52XJHxNjvRKDK0LtO90gVMXwAmJ2NzuLA5ZwtQeUj3wluyvIySglrSTUkLoftqp38XwNJhanXC3pMHlgvoSn4sYjIhYpC5oCcj5AXZYyalxrskbZ+QTUgtHU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788875485; c=relaxed/simple;
	bh=yAkATAbOR8BHFyRFOsELRt+fYAiuqFYEVcejaIN9a/4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kAy5Vt2tBAA97cL86mIEwVP+jYRj3dX88jXPQ2S4dh/E/7PjBSZIfHQLLwH8DAEkWg/zqnijo7eqZiT3ZgAXvKfYdBtj8htsuCByKZN8q8YdXsGbGFo4VpvkGU91ES+wxAB/MuSa4bL4Nei/XNEiROoIM6YToPDFcxqg9yd2cRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=oPb63NSV; arc=none smtp.client-ip=95.215.58.242
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="oPb63NSV"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=yAkATAbOR8BHFyRFOsELRt+fYAiuqFYEVcejaIN9a/4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788875468; v=1; x=1789480268;
 b=oPb63NSVAM1cGM61r3OUh0VWBaMubfLs+kPoSFk9e7+oGzj0ePEgc9bgB4asCYi5sHCcAaRP
 NWU8SJVHohPq/gjzQJUeOcCbNOIBmYtjjS1THrf3uAfm1tPHWli2HKeC0gJ2P3EHcJW3c6I9wGm
 3jlBD3YJb4AtNxO//+Wiblz4=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 73574c6019326117;
	Tue, 08 Sep 2026 13:51:08 +0000
X-Mizu-Trace-ID: 73574c6019326117
X-Migadu-Flow: FLOW_OUT
Message-ID: <13fefc5b-7148-48aa-95a6-7f64cf7c66d5@linux.dev>
Date: Tue, 8 Sep 2026 21:50:48 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] selftests/mm: init page sizes early in
 pagemap_ioctl test
To: linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org,
 liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, surenb@google.com,
 mhocko@suse.com, shuah@kernel.org, gourry@gourry.net
References: <20260908134117.84405-1-zenghui.yu@linux.dev>
 <20260908134405.84448-1-zenghui.yu@linux.dev>
Content-Language: en-US
From: Zenghui Yu <zenghui.yu@linux.dev>
In-Reply-To: <20260908134405.84448-1-zenghui.yu@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/8/26 9:44 PM, Zenghui Yu wrote:
> From: "Zenghui Yu (Huawei)" <zenghui.yu@linux.dev>
> 
> Initialize page_size and hpage_size before calling init_uffd(),
> hugetlb_setup_default(), etc.  That won't fix anything, but it is safer and
> saner to get these globals set up before doing other things.
> 
> While at it, drop the page_size parameter of transact_test(), which is
> actually unnecessary.
> 
> Suggested-by: Andrew Morton <akpm@linux-foundation.org>

See https://lore.kernel.org/20260628111329.9cfcd9c67925869307020aba@linux-foundation.org/ .

> Signed-off-by: Zenghui Yu (Huawei) <zenghui.yu@linux.dev>
> ---
>  tools/testing/selftests/mm/pagemap_ioctl.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/tools/testing/selftests/mm/pagemap_ioctl.c b/tools/testing/selftests/mm/pagemap_ioctl.c
> index 1a87b7483316..d9a4fb782ecf 100644
> --- a/tools/testing/selftests/mm/pagemap_ioctl.c
> +++ b/tools/testing/selftests/mm/pagemap_ioctl.c
> @@ -1489,7 +1489,7 @@ static void *thread_proc(void *mem)
>  	return NULL;
>  }
>  
> -static void transact_test(int page_size)
> +static void transact_test(void)
>  {
>  	unsigned int i, count, extra_pages;
>  	unsigned int c;
> @@ -1653,6 +1653,9 @@ int main(int __attribute__((unused)) argc, char *argv[])
>  
>  	ksft_print_header();
>  
> +	page_size = getpagesize();
> +	hpage_size = read_pmd_pagesize();
> +
>  	if (init_uffd())
>  		ksft_exit_skip("Failed to initialize userfaultfd\n");
>  
> @@ -1661,9 +1664,6 @@ int main(int __attribute__((unused)) argc, char *argv[])
>  
>  	ksft_set_plan(119);
>  
> -	page_size = getpagesize();
> -	hpage_size = read_pmd_pagesize();
> -
>  	pagemap_fd = open(PAGEMAP, O_RDONLY);
>  	if (pagemap_fd < 0)
>  		ksft_exit_fail_msg("Failed to open " PAGEMAP "\n");
> @@ -1823,7 +1823,7 @@ int main(int __attribute__((unused)) argc, char *argv[])
>  	mprotect_tests();
>  
>  	/* 13. Transact test */
> -	transact_test(page_size);
> +	transact_test();
>  
>  	/* 14. Sanity testing */
>  	sanity_tests();
