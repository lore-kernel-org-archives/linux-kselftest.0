Received: from out30-118.freemail.mail.aliyun.com (out30-118.freemail.mail.aliyun.com [115.124.30.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E48B380FDB;
	Sat,  1 Aug 2026 05:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785560920; cv=none; b=XkGxESdAHqbMtP4Zmpo9tWUNQuWKyBM8QbBlF6Lg6v/QyfmnSmdBR7iOmzPMl3G3wLzjp8MLPzFqDnkujq5qY8zZZ8aPTa1cdz/Vz7Vq0ewpawluAgmIMLWC1zsCGRuh2ubLAlM2AZDzNKjuK0VCBXFXjIdMwaewlqx0UuVzWro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785560920; c=relaxed/simple;
	bh=3HZF/U5SDEG9V1zscAgO3uTLRyXzMVLUYmMuNqOdVjs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g164Idzr2dNCOQm1AsoT8VJ6m7+Ag5XaqXwtbu+VbWreC8ilVyLpHSZ+p2uGyulGRVSrNTlFZoAUTGuiF6Hmjtys6ALKg6GllRoH1oczUKSJfdSshLyuZtqKsMbWTj7RcOdHSGELqV9ODUAYSjFUMsysas0JBmWUFc8tk+sgTFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=XkEjDm94; arc=none smtp.client-ip=115.124.30.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="XkEjDm94"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1785560909; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=UJRJbzaMPn7EWU1PuaFIxydKwh1J5WKdvnMdojZ2MQw=;
	b=XkEjDm94jqW2hYL3B6s/pL1IOh6ESLLSQPAqJWFIDjYbqvmc/cAx0K35b20IuUTiLabSH4DrhCdigUzkxQTQacOcCWIS5Has9e1Is0Brcm/R8O5b5zrHDLfCSg3FxWaBMaTNbj7aTZVXIT4i2/ha5Sl1pGFWGYSrS2GHOyJ73Fg=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R361e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam011083073210;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=14;SR=0;TI=SMTPD_---0X89Sdcd_1785560907;
Received: from 30.32.91.114(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0X89Sdcd_1785560907 cluster:ay36)
          by smtp.aliyun-inc.com;
          Sat, 01 Aug 2026 13:08:28 +0800
Message-ID: <00123a40-5aec-4600-9db5-6905806387b0@linux.alibaba.com>
Date: Sat, 1 Aug 2026 13:08:27 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] selftests: mm: implement the mTHP-sized hugepage
 check helpers
To: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org
Cc: ziy@nvidia.com, liam@infradead.org, nico.pache@linux.dev,
 dev.jain@arm.com, ryan.roberts@arm.com, baohua@kernel.org,
 lance.yang@linux.dev, usama.arif@linux.dev, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1785224928.git.baolin.wang@linux.alibaba.com>
 <8fd04f8c2f11390bf00058f9cd3d98d73544c75f.1785224928.git.baolin.wang@linux.alibaba.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <8fd04f8c2f11390bf00058f9cd3d98d73544c75f.1785224928.git.baolin.wang@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 7/28/26 4:13 PM, Baolin Wang wrote:
> Implement mTHP-sized hugepage checking helpers using gather_folio_orders().
> Also rename the existing PMD-sized huge page check function to
> __check_pmd_huge() for clarity.
> 
> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> ---
>   tools/testing/selftests/mm/vm_util.c | 55 ++++++++++++++++++++++++++--
>   1 file changed, 51 insertions(+), 4 deletions(-)
> 
> diff --git a/tools/testing/selftests/mm/vm_util.c b/tools/testing/selftests/mm/vm_util.c
> index 09e5d5cabe21..a4ffaa0ca6fa 100644
> --- a/tools/testing/selftests/mm/vm_util.c
> +++ b/tools/testing/selftests/mm/vm_util.c
> @@ -15,6 +15,10 @@
>   #define SMAP_FILE_PATH "/proc/self/smaps"
>   #define STATUS_FILE_PATH "/proc/self/status"
>   #define MAX_LINE_LENGTH 500
> +#define PAGEMAP_PATH "/proc/self/pagemap"
> +#define KPAGEFLAGS_PATH "/proc/kpageflags"
> +#define GET_ORDER(nr_pages)    (31 - __builtin_clz(nr_pages))

sashiko comment:
"Is there a risk of undefined behavior here if nr_pages evaluates to 0?

If check_large_folios() is called with an hpage_size smaller than the 
system page size, the division hpage_size / pagesize will yield 0. 
Calling __builtin_clz(0) results in undefined behavior."

This doesn't happen now. But for code robustness, I'll add a hpage_size 
check in check_large_folios().

> +#define NR_ORDERS 20
>   
>   unsigned int __page_size;
>   unsigned int __page_shift;
> @@ -348,7 +352,7 @@ char *__get_smap_entry(void *addr, const char *pattern, char *buf, size_t len)
>   	return entry;
>   }
>   
> -bool __check_huge(void *addr, char *pattern, int nr_hpages,
> +static bool __check_pmd_huge(void *addr, char *pattern, int nr_hpages,
>   		  uint64_t hpage_size)
>   {
>   	char buffer[MAX_LINE_LENGTH];
> @@ -366,19 +370,62 @@ bool __check_huge(void *addr, char *pattern, int nr_hpages,
>   	return thp == (nr_hpages * (hpage_size >> 10));
>   }
>   
> +static bool check_large_folios(void *addr, unsigned long size, int nr_hpages, uint64_t hpage_size)
> +{
> +	int pagesize = getpagesize();
> +	int order = GET_ORDER(hpage_size / pagesize);
> +	int pagemap_fd, kpageflags_fd;
> +	int orders[NR_ORDERS], status;
> +	bool ret = false;
> +
> +	memset(orders, 0, sizeof(int) * NR_ORDERS);
> +
> +	pagemap_fd = open(PAGEMAP_PATH, O_RDONLY);
> +	if (pagemap_fd == -1)
> +		ksft_exit_fail_msg("read pagemap fail\n");
> +
> +	kpageflags_fd = open(KPAGEFLAGS_PATH, O_RDONLY);
> +	if (kpageflags_fd == -1) {
> +		close(pagemap_fd);
> +		ksft_exit_fail_msg("read kpageflags fail\n");
> +	}
> +
> +	status = gather_folio_orders(addr, size, pagemap_fd,
> +			kpageflags_fd, orders, NR_ORDERS);
> +	if (status)
> +		goto out;
> +
> +	if (orders[order] == nr_hpages)
> +		ret = true;

sashiko comment:
"Does this code overflow the orders[] stack array if the calculated 
order is 20 or greater?

For example, on architectures supporting very large huge pages (like 
16GB huge pages on PowerPC), the order could be 22. It looks like 
indexing orders[order] here without bounds checking could cause an 
out-of-bounds stack read."

This doesn't look like the mTHP order size, but I'll add an order check.
