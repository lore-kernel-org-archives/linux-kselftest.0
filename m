Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2DDA2E0925
	for <linux-kselftest@vger.kernel.org>; Mon, 27 Apr 2026 20:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777320736; cv=none; b=kjutOIrRH6zRUa6AOkfO+YhC6YkcGf0vc3xRYNDigQI98sLZdMFJVi496/ErWxb927Z10rKZ5m2ANiIBvqQyGFGimQQ3sBFBBflpqp26mMcPU+zQUj3BU+qRXfV3PC1iu+F7NX1/SmOG+DqlooHLHuFnfSHys1HjyOSHZ2comHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777320736; c=relaxed/simple;
	bh=Vff06wwXdaMmL272VPBvXRoXhpBV7rWsEfX2Yrb/794=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hSSr6Svg9/bNA19ZCblRTaGDKz78QkYwb7hwh5ssXuqo+9a51JatbmMcHrkwy5+BHAnTQhzfr8aLmdvZRthzqFHHRkSWjLGHvzF3RBqG+4+pYVTn/yUKb7QO5Ob/RqtvcAT5uIZ8EzsRh87knv+ecNKYc5b8PccGJ8BDSYlIENs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OLU8csb1; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OLU8csb1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777320733;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qi57hKTHhV/3NllK7hjHOaSFLPLM3ZMT89/dw5Cb45w=;
	b=OLU8csb16kNHoCxC1HoEAlibYgViHLQ+pZ6muA6Bt0mBymiL0otBGZTaKWune5OGE+RUgi
	jOZA1N6bSAykkWaMn1lgdWe45edn+sOy3rB8B1Pvq3QzI6STP2MFB7bgauUd8OUlM/heZM
	yrmq2egvjHkr9zKpg35soM76YSF3fDg=
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com
 [209.85.221.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-423-89jcFsvJM1KikKvCm6APrQ-1; Mon, 27 Apr 2026 16:12:12 -0400
X-MC-Unique: 89jcFsvJM1KikKvCm6APrQ-1
X-Mimecast-MFC-AGG-ID: 89jcFsvJM1KikKvCm6APrQ_1777320732
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5738ad13968so3232604e0c.3
        for <linux-kselftest@vger.kernel.org>; Mon, 27 Apr 2026 13:12:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777320732; x=1777925532;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qi57hKTHhV/3NllK7hjHOaSFLPLM3ZMT89/dw5Cb45w=;
        b=OP1WCJ7u0xGO9+JNtNRJjAEItRazkdX7tqtOLg0xgpwuDt6mKMFQyVhRWucEjldNfr
         8ZT6UzB6mEr6lNDFNgwc9K0sTVNvf6xvn0UEgg/C+UIGG9yX4M2oQPgwF95Bhro2Tf0T
         EKQWn3yYdfeRiSgsZeAn1W2y0is/QhR4c8yFUu8PPyrzJVbV3ZixfNjqgy9FZ6eS/8Q3
         kj3S8nykR+bm9GatJCij94cWOmRFIuhdn906Bwdaqv4nJyzLCzYoprEppvhP0D52RR79
         0tHy5us7IeSDkD2dBJkkiec6eWySqItoGqZMbNT5krQZNnF05xbi0U1iI1ofZhOpOEHh
         RCZw==
X-Forwarded-Encrypted: i=1; AFNElJ+D9ah8RxLSEY9bjteXaswxMypKEAjzMzuhaV7PM5bslLIlbn6fcXrul3x5Vq4lO7eY8Y8EtUJ/Zy0rlbidmLU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTNW1+n+leiqV3np5qFU3UyN3cwH5Mf5wIUMmGpbCejt4Qd4GH
	oSzPWkdLXdHBB7BqUb8C5VfOQfgULEtnPg8KFkLhiD7A+7SIfNySZdd7jrYVSxrTmdG2Ohzf64U
	1LeImlgIGEek6O5ZMLAUZfo9FjIjT5bUWbmcjjQFFIP+NgAXJbLg54EWd4lbe/5A4eGZPXg==
X-Gm-Gg: AeBDieu1SlEQVZCxogAqe4UnsP2b5LzdpKlwlpZV+5x7Xj+y4NKH2WPT6lQQwqzt+Fm
	5mlaH0zp07B0d8TfYMKpTeDkO8ps8T081I9L3nvRuUg9uXHg8QlcFjuAuMBaZuxIXigqmlzcopQ
	wPvohCqndSeao+7Oc5KZcuXQv/Uo4J8aFavMQNuDs1VNeNfgeyIWbubM5JtfVSvW5syiCQSv8Ut
	Oz1Fs5kNqRtyQUSyvDPOOzD1QjCOyyN3BihnAuZf7rtsG7XAnvKWNEghqdSZcweBay3eOf6mBU3
	UUsHxG4IHKvFzNtXvkgqOkLw4pQRJKotBma42wMIvck5BR8FO3ocdFjYmWLYMuZhNOw5vUP03AD
	W4HFvQMvJsVQpRbkclJhOMn4muBSQsTztN8SCi9MLBnb2/lrh2mKh20JUj0EvmrYdtc8Ff5SxeJ
	R/l11Bo3c8JMCU6S04CEFvshheOg==
X-Received: by 2002:a05:6122:614a:b0:56c:e871:31a8 with SMTP id 71dfb90a1353d-573a55c7eb5mr132469e0c.7.1777320731968;
        Mon, 27 Apr 2026 13:12:11 -0700 (PDT)
X-Received: by 2002:a05:6122:614a:b0:56c:e871:31a8 with SMTP id 71dfb90a1353d-573a55c7eb5mr132437e0c.7.1777320731397;
        Mon, 27 Apr 2026 13:12:11 -0700 (PDT)
Received: from [192.168.2.110] (bras-base-aylmpq0104w-grc-53-69-159-169-238.dsl.bell.ca. [69.159.169.238])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-573a45d5f25sm279986e0c.10.2026.04.27.13.12.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 13:12:11 -0700 (PDT)
Message-ID: <6188aaac-0792-4ffb-a5a7-739adc9fd516@redhat.com>
Date: Mon, 27 Apr 2026 16:12:09 -0400
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 46/53] selftests/mm: thuge-gen: add setup of HugeTLB
 pages
To: Mike Rapoport <rppt@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>,
 Barry Song <baohua@kernel.org>, Dev Jain <dev.jain@arm.com>,
 Donet Tom <donettom@linux.ibm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 John Hubbard <jhubbard@nvidia.com>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Lance Yang <lance.yang@linux.dev>,
 Leon Romanovsky <leon@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 Mark Brown <broonie@kernel.org>, Michal Hocko <mhocko@suse.com>,
 Nico Pache <npache@redhat.com>, Peter Xu <peterx@redhat.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Sarthak Sharma
 <sarthak.sharma@arm.com>, Shuah Khan <shuah@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@kernel.org>,
 Zi Yan <ziy@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-mm@kvack.org
References: <20260418105539.1261536-1-rppt@kernel.org>
 <20260418105539.1261536-47-rppt@kernel.org>
Content-Language: en-US, en-CA
From: Luiz Capitulino <luizcap@redhat.com>
In-Reply-To: <20260418105539.1261536-47-rppt@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2026-04-18 06:55, Mike Rapoport wrote:
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> 
> thuge-gen skips tests if there are no free huge pages prepared by a wrapper
> script and shm liimts in proc are too low.
> 
> Replace custom detection of huge pages with the library functions and add
> setup of HugeTLB pages and shm limits to the test and make sure that the
> original settings are restored on the test exit.
> 
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---
>   tools/testing/selftests/mm/thuge-gen.c | 79 ++++----------------------
>   1 file changed, 11 insertions(+), 68 deletions(-)
> 
> diff --git a/tools/testing/selftests/mm/thuge-gen.c b/tools/testing/selftests/mm/thuge-gen.c
> index 1007bc8aa57c..b63d87d72a7d 100644
> --- a/tools/testing/selftests/mm/thuge-gen.c
> +++ b/tools/testing/selftests/mm/thuge-gen.c
> @@ -38,15 +38,6 @@
>   #ifndef SHM_HUGE_SHIFT
>   #define SHM_HUGE_SHIFT  26
>   #endif
> -#ifndef SHM_HUGE_MASK
> -#define SHM_HUGE_MASK   0x3f
> -#endif
> -#ifndef SHM_HUGE_2MB
> -#define SHM_HUGE_2MB    (21 << SHM_HUGE_SHIFT)
> -#endif
> -#ifndef SHM_HUGE_1GB
> -#define SHM_HUGE_1GB    (30 << SHM_HUGE_SHIFT)
> -#endif
>   
>   #define NUM_PAGESIZES   5
>   #define NUM_PAGES 4
> @@ -64,32 +55,10 @@ int ilog2(unsigned long v)
>   
>   void show(unsigned long ps)
>   {
> -	char buf[100];
> -
>   	if (ps == getpagesize())
>   		return;
>   
> -	ksft_print_msg("%luMB: ", ps >> 20);
> -
> -	fflush(stdout);
> -	snprintf(buf, sizeof buf,
> -		"cat /sys/kernel/mm/hugepages/hugepages-%lukB/free_hugepages",
> -		ps >> 10);
> -	system(buf);
> -}
> -
> -unsigned long read_free(unsigned long ps)
> -{
> -	unsigned long val = 0;
> -	char buf[100];
> -
> -	snprintf(buf, sizeof(buf),
> -		 "/sys/kernel/mm/hugepages/hugepages-%lukB/free_hugepages",
> -		 ps >> 10);
> -	if (read_sysfs(buf, &val) && ps != getpagesize())
> -		ksft_print_msg("missing %s\n", buf);
> -
> -	return val;
> +	ksft_print_msg("%luMB: %ld\n", ps >> 20, hugetlb_free_pages(ps));
>   }
>   
>   void test_mmap(unsigned long size, unsigned flags)
> @@ -97,14 +66,14 @@ void test_mmap(unsigned long size, unsigned flags)
>   	char *map;
>   	unsigned long before, after;
>   
> -	before = read_free(size);
> +	before = hugetlb_free_pages(size);
>   	map = mmap(NULL, size*NUM_PAGES, PROT_READ|PROT_WRITE,
>   			MAP_PRIVATE|MAP_ANONYMOUS|MAP_HUGETLB|flags, -1, 0);
>   	if (map == MAP_FAILED)
>   		ksft_exit_fail_msg("mmap: %s\n", strerror(errno));
>   
>   	memset(map, 0xff, size*NUM_PAGES);
> -	after = read_free(size);
> +	after = hugetlb_free_pages(size);
>   
>   	show(size);
>   	ksft_test_result(size == getpagesize() || (before - after) == NUM_PAGES,
> @@ -121,7 +90,7 @@ void test_shmget(unsigned long size, unsigned flags)
>   	struct shm_info i;
>   	char *map;
>   
> -	before = read_free(size);
> +	before = hugetlb_free_pages(size);
>   	id = shmget(IPC_PRIVATE, size * NUM_PAGES, IPC_CREAT|0600|flags);
>   	if (id < 0) {
>   		if (errno == EPERM) {
> @@ -142,7 +111,7 @@ void test_shmget(unsigned long size, unsigned flags)
>   	shmctl(id, IPC_RMID, NULL);
>   
>   	memset(map, 0xff, size*NUM_PAGES);
> -	after = read_free(size);
> +	after = hugetlb_free_pages(size);
>   
>   	show(size);
>   	ksft_test_result(size == getpagesize() || (before - after) == NUM_PAGES,
> @@ -154,43 +123,15 @@ void test_shmget(unsigned long size, unsigned flags)
>   void find_pagesizes(void)
>   {
>   	unsigned long largest = getpagesize();
> -	unsigned long shmmax_val = 0;
>   	int i;
> -	glob_t g;
>   
> -	glob("/sys/kernel/mm/hugepages/hugepages-*kB", 0, NULL, &g);
> -	assert(g.gl_pathc <= NUM_PAGESIZES);
> -	for (i = 0; (i < g.gl_pathc) && (num_page_sizes < NUM_PAGESIZES); i++) {
> -		sscanf(g.gl_pathv[i], "/sys/kernel/mm/hugepages/hugepages-%lukB",
> -				&page_sizes[num_page_sizes]);
> -		page_sizes[num_page_sizes] <<= 10;
> -		ksft_print_msg("Found %luMB\n", page_sizes[i] >> 20);
> +	num_page_sizes = hugetlb_setup(NUM_PAGES, page_sizes, ARRAY_SIZE(page_sizes));

Are we missing a call to hugetlb_save_settings()?

>   
> -		if (page_sizes[num_page_sizes] > largest)
> +	for (i = 0; i < num_page_sizes; i++)
> +		if (page_sizes[i] > largest)
>   			largest = page_sizes[i];
>   
> -		if (read_free(page_sizes[num_page_sizes]) >= NUM_PAGES)
> -			num_page_sizes++;
> -		else
> -			ksft_print_msg("SKIP for size %lu MB as not enough huge pages, need %u\n",
> -				       page_sizes[num_page_sizes] >> 20, NUM_PAGES);
> -	}
> -	globfree(&g);
> -
> -	read_sysfs("/proc/sys/kernel/shmmax", &shmmax_val);
> -	if (shmmax_val < NUM_PAGES * largest) {
> -		ksft_print_msg("WARNING: shmmax is too small to run this test.\n");
> -		ksft_print_msg("Please run the following command to increase shmmax:\n");
> -		ksft_print_msg("echo %lu > /proc/sys/kernel/shmmax\n", largest * NUM_PAGES);
> -		ksft_exit_skip("Test skipped due to insufficient shmmax value.\n");
> -	}
> -
> -#if defined(__x86_64__)
> -	if (largest != 1U<<30) {
> -		ksft_exit_skip("No GB pages available on x86-64\n"
> -				   "Please boot with hugepagesz=1G hugepages=%d\n", NUM_PAGES);
> -	}
> -#endif
> +	shm_limits_prepare(NUM_PAGES * largest);
>   }
>   
>   int main(void)
> @@ -233,3 +174,5 @@ int main(void)
>   
>   	ksft_finished();
>   }
> +
> +SHM_LIMITS_RESTORE()

