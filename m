Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.224
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794191712;
	b=oWYYgY4wTy9Koo8kDomwNhTHgiXqBGDq4/RcbWIZ8l9wuy/Ed7q5ymcfBsLLzbt0q24L
	 7L4OusxZWW7PTOgTkLdy5/C/hagUsGRteg4zmZ0wihzomqeAe6nCeFImc1cQJkVc/Amqk
	 L+JzwZqC6soEDcRgu8g52tzbUCbW2nY/uuBejkCkC1bcCju5FbtNgQ6EyD5FLh3PUnWMm
	 TJFFvt7u7vYt8gYgDjUa/u34vK4L39UcLYqwMGqzROBtoKjC6qKNtnC1EajSe5UfgXlSh
	 GrM1hsN9iQsU6yOgy1DYyYDVj9KZna1UU7MlM2iIbUeWCk9JPj4l0gkXnX7Fb/Nuteg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794191712;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=/ikAqP7gpdbBI+hdFB0vTPSMi3bWmtsaCXh9lO0ty1U=;
	b=YtkxxoaYk5KLo5wSNIuc5mDJOaxyvh1RCBArMAash/anFrIDykHOUebBYNo7Rxbt8E0u
	 cQW/y95HH8v/6Hfp4wWBgZmfn0SeKQNzkWrJcx9ydFQ3Tw1hQc7GT3p//8Fy3E3ATIeYU
	 EhJcln/+fUJ46PhIHyxA9pBUZpqx8IfN/AWao90FfNuNObZs4VVfNMguhmvhR4qvJ33Jp
	 jGDoO2FZt9EyvjnrC6b7fnVx0fG+6j6nG1qHATISP3gw8gc5AksO+fy+ttBkk9ykCe3XR
	 dgmOse9F7s7Gf6cFD8Y8D4jlSCLotdpg18FMxJ4mKGqUpUoHhbEsZUEPoxqcG2cVQJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="M75aPf/F";
	arc=none smtp.remote-ip=95.215.58.224
Received: from mta1.migadu.com (out-224.mta1.migadu.com [95.215.58.224])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 913D7606A33C
	for <linux-kselftest@vger.kernel.org>; Mon,  9 Nov 2026 02:35:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 913D7606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=M75aPf/F
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=psUKZVZC7okDpUhR+qBHZvo0Vd9UtjuNKUs9HwCN5Cc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794191709; v=1; x=1794796509;
 b=M75aPf/FXyCfS/8MBflmk0QpORPYRN6M4MksV8HldOSW/4cycR8VsEgQ8QnBVA4jvK3L5Dxk
 jSzmhfyvXHJ4ZVofXVaXCrOCxNB5TFvQYHgrZXKkBncBM5Oh8laRz936jLwoHC0gETmNWY0c+qc
 ZMvPD8UjNP8ZMEkG71bz3NGM=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id e7a58ce54b55df96;
	Mon, 09 Nov 2026 02:35:07 +0000
X-Mizu-Trace-ID: e7a58ce54b55df96
X-Migadu-Flow: FLOW_OUT
Date: Mon, 9 Nov 2026 10:34:53 +0800
From: "Xu Xin (vivo)" <xu.xin@linux.dev>
To: Qiliang Yuan <odys.yuan@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Stefan Roesch <shr@devkernel.io>, Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 5/5] selftests/mm: cover merging KSM pages aged by
 smart scan
Message-ID: <avExTeM7wyb7PIa6@dgvxl46587.localhost.localdomain>
References: <20261108-bug-mm-ksm-smart-scan-align-skips-v4-0-86be8fe77e7a@gmail.com>
 <20261108-bug-mm-ksm-smart-scan-align-skips-v4-5-86be8fe77e7a@gmail.com>
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
In-Reply-To: <20261108-bug-mm-ksm-smart-scan-align-skips-v4-5-86be8fe77e7a@gmail.com>

On Sun, Nov 08, 2026 at 08:22:54PM -0500, Qiliang Yuan wrote:
> ksm_functional_tests checks merging and unmerging with ksmd's default
> settings, but nothing there exercises smart scan, which skips pages KSM
> has failed to merge for a while.
> 
> Smart scan used to time those skips per page, so two identical pages
> that became mergeable some scans apart could end up never being looked
> at in the same scan, and were never merged. "mm/ksm: align smart scan
> skips with the scan number" fixed that.
> 
> Add ksm_get_smart_scan() and ksm_set_smart_scan() to vm_util, and a
> case that enables smart scan, lets sixteen unique pages age for a dozen
> scans, then makes a duplicate of each mergeable one scan apart, and
> expects every pair to be merged 32 scans later:
> 
>   kernel               failures, two boots
>   before the fix       20/20, 20/20
>   with the fix          0/20,  0/20
> 
> Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
> Tested-by: Andrew Morton <akpm@linux-foundation.org>
> Reviewed-by: David Hildenbrand (Arm) <david@kernel.org>
> ---
>  tools/testing/selftests/mm/ksm_functional_tests.c | 89 ++++++++++++++++++++++-
>  tools/testing/selftests/mm/vm_util.c              | 36 +++++++++
>  tools/testing/selftests/mm/vm_util.h              |  2 +
>  3 files changed, 126 insertions(+), 1 deletion(-)

Reviewed-by: Xu Xin (vivo) <xu.xin@linux.dev>

> 
> diff --git a/tools/testing/selftests/mm/ksm_functional_tests.c b/tools/testing/selftests/mm/ksm_functional_tests.c
> index 31c06c72203fd..135191f99962d 100644
> --- a/tools/testing/selftests/mm/ksm_functional_tests.c
> +++ b/tools/testing/selftests/mm/ksm_functional_tests.c
> @@ -695,6 +695,92 @@ static void test_fork_ksm_merging_page_count(void)
>  	munmap(map, size);
>  }
>  
> +static void test_merge_aged_pairs(void)
> +{
> +	const unsigned int pairs = 16;
> +	const unsigned long size = 2 * pairs * pagesize;
> +	int old_smart_scan;
> +	unsigned int i;
> +	char *map;
> +
> +	ksft_print_msg("[RUN] %s\n", __func__);
> +
> +	old_smart_scan = ksm_get_smart_scan();
> +	if (old_smart_scan < 0) {
> +		ksft_test_result_skip("smart_scan not supported\n");
> +		return;
> +	}
> +	if (ksm_set_smart_scan(true) < 0) {
> +		ksft_test_result_fail("Enabling smart_scan failed\n");
> +		return;
> +	}
> +
> +	if (ksm_stop() < 0) {
> +		ksft_test_result_fail("Disabling (unmerging) KSM failed\n");
> +		goto restore;
> +	}
> +
> +	map = mmap(NULL, size, PROT_READ | PROT_WRITE,
> +		   MAP_PRIVATE | MAP_ANON, -1, 0);
> +	if (map == MAP_FAILED) {
> +		ksft_test_result_fail("mmap() failed\n");
> +		goto restore;
> +	}
> +	if (madvise(map, size, MADV_NOHUGEPAGE) && errno != EINVAL) {
> +		ksft_test_result_fail("MADV_NOHUGEPAGE failed\n");
> +		goto unmap;
> +	}
> +
> +	/*
> +	 * Page i of the first half and page i of the second half form a
> +	 * pair with content no other page shares.
> +	 */
> +	for (i = 0; i < pairs; i++) {
> +		memset(map + i * pagesize, i + 1, pagesize);
> +		memset(map + (pairs + i) * pagesize, i + 1, pagesize);
> +	}
> +
> +	/* Let the first page of each pair age without a duplicate. */
> +	if (madvise(map, size / 2, MADV_MERGEABLE)) {
> +		ksft_test_result_fail("MADV_MERGEABLE failed\n");
> +		goto unmap;
> +	}
> +	if (ksm_start() < 0 || ksm_wait_full_scans(12) < 0) {
> +		ksft_test_result_fail("Running KSM failed\n");
> +		goto unmap;
> +	}
> +
> +	/*
> +	 * Make the duplicates mergeable one scan apart so that each pair
> +	 * starts out with a different distance in scans.
> +	 */
> +	for (i = 0; i < pairs; i++) {
> +		if (madvise(map + (pairs + i) * pagesize, pagesize,
> +			    MADV_MERGEABLE)) {
> +			ksft_test_result_fail("MADV_MERGEABLE failed\n");
> +			goto unmap;
> +		}
> +		if (ksm_wait_full_scans(1) < 0) {
> +			ksft_test_result_fail("Running KSM failed\n");
> +			goto unmap;
> +		}
> +	}
> +
> +	if (ksm_wait_full_scans(32) < 0) {
> +		ksft_test_result_fail("Running KSM failed\n");
> +		goto unmap;
> +	}
> +
> +	ksft_test_result(ksm_get_self_merging_pages() == 2 * pairs,
> +			 "Pages aged by smart scan got merged\n");
> +unmap:
> +	ksm_stop();
> +	munmap(map, size);
> +restore:
> +	if (ksm_set_smart_scan(old_smart_scan) < 0)
> +		ksft_print_msg("Restoring smart_scan failed\n");
> +}
> +
>  static void init_global_file_handles(void)
>  {
>  	mem_fd = open("/proc/self/mem", O_RDWR);
> @@ -720,7 +806,7 @@ static void init_global_file_handles(void)
>  
>  int main(int argc, char **argv)
>  {
> -	unsigned int tests = 9;
> +	unsigned int tests = 10;
>  	int err;
>  
>  	if (argc > 1 && !strcmp(argv[1], FORK_EXEC_CHILD_PRG_NAME)) {
> @@ -753,6 +839,7 @@ int main(int argc, char **argv)
>  	test_prctl_fork_exec();
>  	test_prctl_unmerge();
>  	test_fork_ksm_merging_page_count();
> +	test_merge_aged_pairs();
>  
>  	err = ksft_get_fail_cnt();
>  	if (err)
> diff --git a/tools/testing/selftests/mm/vm_util.c b/tools/testing/selftests/mm/vm_util.c
> index 8184691211acc..f26f9e4bfdbe9 100644
> --- a/tools/testing/selftests/mm/vm_util.c
> +++ b/tools/testing/selftests/mm/vm_util.c
> @@ -992,6 +992,42 @@ int ksm_use_zero_pages(void)
>  	return ret == 1 ? 0 : -EIO;
>  }
>  
> +int ksm_get_smart_scan(void)
> +{
> +	int smart_scan_fd;
> +	char buf;
> +	ssize_t ret;
> +
> +	smart_scan_fd = open("/sys/kernel/mm/ksm/smart_scan", O_RDONLY);
> +	if (smart_scan_fd < 0)
> +		return -errno;
> +
> +	ret = pread(smart_scan_fd, &buf, 1, 0);
> +	close(smart_scan_fd);
> +	if (ret < 0)
> +		return -errno;
> +	if (ret != 1)
> +		return -EIO;
> +
> +	return buf == '1';
> +}
> +
> +int ksm_set_smart_scan(bool enable)
> +{
> +	int smart_scan_fd;
> +	ssize_t ret;
> +
> +	smart_scan_fd = open("/sys/kernel/mm/ksm/smart_scan", O_WRONLY);
> +	if (smart_scan_fd < 0)
> +		return -errno;
> +
> +	ret = write(smart_scan_fd, enable ? "1" : "0", 1);
> +	close(smart_scan_fd);
> +	if (ret < 0)
> +		return -errno;
> +	return ret == 1 ? 0 : -EIO;
> +}
> +
>  int ksm_wait_full_scans(long nr)
>  {
>  	long start_scans, end_scans;
> diff --git a/tools/testing/selftests/mm/vm_util.h b/tools/testing/selftests/mm/vm_util.h
> index 7e00030077d2f..ab1325dc65800 100644
> --- a/tools/testing/selftests/mm/vm_util.h
> +++ b/tools/testing/selftests/mm/vm_util.h
> @@ -163,6 +163,8 @@ long ksm_get_self_zero_pages(void);
>  long ksm_get_self_merging_pages(void);
>  long ksm_get_full_scans(void);
>  int ksm_wait_full_scans(long nr);
> +int ksm_get_smart_scan(void);
> +int ksm_set_smart_scan(bool enable);
>  int ksm_use_zero_pages(void);
>  int ksm_start(void);
>  int ksm_stop(void);
> 
> -- 
> 2.43.0
> 
