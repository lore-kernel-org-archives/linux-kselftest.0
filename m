Received: from out30-111.freemail.mail.aliyun.com (out30-111.freemail.mail.aliyun.com [115.124.30.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C4E428472;
	Sat,  1 Aug 2026 05:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785562672; cv=none; b=qfEHOYKkjas80W+20kajMlbFqf7GKJJ59diovs6Va+t0E3YrYXaLxrWLFjJMxr+RLE5Qqm+dN+C2B4uWN+J2Glz1anXJJSLvkB9vVIwNUSXzdA3ilxQSEY68xX45XP1HTTH0a4vC1Uh0z3LjksEDh+4/pkvZs0CjxYztx0Uf7Y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785562672; c=relaxed/simple;
	bh=O0q4bvDGr2NWXo9pmmwtTXU/MjWWOnogCFhZcKupPR0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jsuAUXwVdFLDSYIW69HmgeXg0rQ+faUB6LYftOAqiZ4npifeGKH6/MYopBRD+CnS83r6+TIdfc0u96eKpUoUOWOfzUYxvJyVbg+V8hMNO7sgQ1WJUPh8EFKRaGaAtB0430t/60c/9F/VA8/m3RE1C3DM2EhDXY4Imb0GmUzCTAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=oWzhj4OJ; arc=none smtp.client-ip=115.124.30.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="oWzhj4OJ"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1785562659; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=4mjnroDt3NYGYmhJROVWxiFtMXCSRJVFSmdPavCLqTA=;
	b=oWzhj4OJswB39CVXe5/jGc6LQBh/MkUVrOgGZEhQmC9qdqOIUTy04DG1uoNlhXD+m624dWsi643fponThJwXL9OW2E7ksy+peu57wHUlyEBul6zOlldbvEW98Pc8wdE5gwFx8w/a/op45Wwvv8yiAG9f+zvh9ryJYQIdC1Kl4sc=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R121e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037009110;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=14;SR=0;TI=SMTPD_---0X89YbOs_1785562657;
Received: from 30.32.91.114(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0X89YbOs_1785562657 cluster:ay36)
          by smtp.aliyun-inc.com;
          Sat, 01 Aug 2026 13:37:38 +0800
Message-ID: <4280f431-ce88-4f09-9de6-328414c98411@linux.alibaba.com>
Date: Sat, 1 Aug 2026 13:37:36 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] selftests: mm: add mTHP collapse test cases
To: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org
Cc: ziy@nvidia.com, liam@infradead.org, nico.pache@linux.dev,
 dev.jain@arm.com, ryan.roberts@arm.com, baohua@kernel.org,
 lance.yang@linux.dev, usama.arif@linux.dev, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1785224928.git.baolin.wang@linux.alibaba.com>
 <bea2086517b69a1af8813dac5774a1409aafd262.1785224928.git.baolin.wang@linux.alibaba.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <bea2086517b69a1af8813dac5774a1409aafd262.1785224928.git.baolin.wang@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 7/28/26 4:13 PM, Baolin Wang wrote:
> Added a new command 'mthp_khugepaged' for mTHP collapse, along with the '-c'
> parameter to specify the collapse order. Additionally, added mTHP collapse
> test cases for 'collapse_full', 'collapse_empty', and 'collapse_single_mthp'
> for anonymous folios. All khugepaged test cases passed.
> 
> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> ---
>   tools/testing/selftests/mm/khugepaged.c   | 130 ++++++++++++++++++----
>   tools/testing/selftests/mm/run_vmtests.sh |   2 +
>   2 files changed, 113 insertions(+), 19 deletions(-)
> 
> diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/selftests/mm/khugepaged.c
> index f69be6be0ecd..e21a6ec38363 100644
> --- a/tools/testing/selftests/mm/khugepaged.c
> +++ b/tools/testing/selftests/mm/khugepaged.c
> @@ -26,9 +26,11 @@
>   
>   #define BASE_ADDR ((void *)(1UL << 30))
>   static unsigned long hpage_pmd_size;
> +static int hpage_pmd_order;
>   static unsigned long page_size;
>   static int hpage_pmd_nr;
>   static int anon_order;
> +static int collapse_order;
>   
>   #define PID_SMAPS "/proc/self/smaps"
>   #define TEST_FILE "collapse_test_file"
> @@ -69,6 +71,7 @@ struct collapse_context {
>   };
>   
>   static struct collapse_context *khugepaged_context;
> +static struct collapse_context *mthp_khugepaged_context;
>   static struct collapse_context *madvise_context;
>   
>   struct file_info {
> @@ -554,25 +557,25 @@ static void madvise_collapse(const char *msg, char *p, int nr_hpages,
>   }
>   
>   #define TICK 500000
> -static bool wait_for_scan(const char *msg, char *p, int nr_hpages,
> -			  struct mem_ops *ops)
> +static bool wait_for_scan(const char *msg, char *p, unsigned long size,
> +		int nr_hpages, int collap_order, struct mem_ops *ops)
>   {
> -	unsigned long size = nr_hpages * hpage_pmd_size;
> +	unsigned long hpage_size = page_size << collap_order;
>   	int full_scans;
>   	int timeout = 6; /* 3 seconds */
>   
>   	/* Sanity check */
> -	if (!ops->check_huge(p, size, 0, hpage_pmd_size))
> +	if (!ops->check_huge(p, size, 0, hpage_size))
>   		ksft_exit_fail_msg("Unexpected huge page\n");
>   
> -	madvise(p, nr_hpages * hpage_pmd_size, MADV_HUGEPAGE);
> +	madvise(p, size, MADV_HUGEPAGE);
>   
>   	/* Wait until the second full_scan completed */
>   	full_scans = thp_read_num("khugepaged/full_scans") + 2;
>   
>   	ksft_print_msg("%s...", msg);
>   	while (timeout--) {
> -		if (ops->check_huge(p, size, nr_hpages, hpage_pmd_size))
> +		if (ops->check_huge(p, size, nr_hpages, hpage_size))
>   			break;
>   		if (thp_read_num("khugepaged/full_scans") >= full_scans)
>   			break;
> @@ -595,7 +598,7 @@ static void khugepaged_collapse(const char *msg, char *p, int nr_hpages,
>   	if (!is_tmpfs(ops) && ops == &__read_write_file_write_ops)
>   		expect = false;
>   
> -	if (wait_for_scan(msg, p, nr_hpages, ops)) {
> +	if (wait_for_scan(msg, p, size, nr_hpages, hpage_pmd_order, ops)) {
>   		if (expect)
>   			fail("Timeout");
>   		else
> @@ -617,12 +620,62 @@ static void khugepaged_collapse(const char *msg, char *p, int nr_hpages,
>   		fail("Fail");
>   }
>   
> +static void mthp_khugepaged_collapse(const char *msg, char *p, int nr_hpages,
> +				struct mem_ops *ops, bool expect)
> +{
> +	unsigned long hpage_size = page_size << collapse_order;
> +	struct thp_settings settings = *thp_current_settings();
> +	/* mTHP collpase only allocates PMD sized memory */
> +	unsigned long size = hpage_pmd_size;
> +
> +	/* Set mTHP setting for mTHP collapse */
> +	if (ops == &__anon_ops) {
> +		settings.thp_enabled = THP_NEVER;
> +		settings.hugepages[collapse_order].enabled = THP_ALWAYS;
> +	}
> +
> +	thp_push_settings(&settings);
> +
> +	if (wait_for_scan(msg, p, size, nr_hpages, collapse_order, ops)) {

sashiko said:
"Could this setup create a race condition that leads to spurious test 
failures?
In mthp_khugepaged_collapse(), thp_push_settings() is called to set 
hugepages[collapse_order].enabled = THP_ALWAYS before wait_for_scan() is
invoked. The khugepaged thread is then immediately allowed to scan and
collapse the faulted memory.
The very first action in wait_for_scan() is a sanity check to verify 
that there are currently zero huge pages:
tools/testing/selftests/mm/khugepaged.c:wait_for_scan() {
         ...
         /* Sanity check */
         if (!ops->check_huge(p, size, 0, hpage_size))
                 ksft_exit_fail_msg("Unexpected huge page\n");
         ...
}
If khugepaged collapses the memory in the brief window between 
thp_push_settings() and this sanity check, will the test falsely fail 
with an unexpected huge page error?
For configurations relying on THP_MADVISE, this race doesn't appear to 
occur because the madvise(..., MADV_HUGEPAGE) call happens after the 
sanity check in wait_for_scan()."

Although this race is unlikely to happen (from my testing, it has never 
occurred), setting it to THP_MADVISE is indeed more reasonable. Will do 
in the next version.
