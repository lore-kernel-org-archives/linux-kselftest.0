Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFCCE388E7D
	for <linux-kselftest@vger.kernel.org>; Fri, 12 Jun 2026 10:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781260273; cv=none; b=pYC5tS9X7A6XVlhurDNeq5bqD8IhfaXmjbFB5ewLua9WDe89uoS+HGa6Els81pHxKstGXzgKWoiXPJwREpF4bKuGZ87wKG62ms58J1WH8GvPlJ+CsptNFM9P+5aTienqgCNfkhEiTBjJ836nx9J7lk5i9vkpV95rsNA7sMc+Uik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781260273; c=relaxed/simple;
	bh=5Bqne2k0fBXHog2RIrSoYSdcYiMfuTgs6gwC5Zy7a8w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EyIv5QrGV0bmXdAqXb/0cBtqeibXAU8m5amPFHgJLmKVbZbe0yXCzUt7X9WJcdkQhMEypxmwa7TnVlt9uCOf8XVcJT4HabX8d+73e/WyA220xVFzBq0xO73SHi4WzZcKfm0az1FatOUZMPktfzq1a4EMdyuYEHnTcIYRyIGvoqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ER1kbwpy; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ejO4HPx3; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ER1kbwpy";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="ejO4HPx3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781260270;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xvvTu1uVNYIh9bpNgTtcE9q3Se0t7H2bpVXEZumrRoI=;
	b=ER1kbwpy7mrADSi60oMHmepEYRIv6h1LTEoA/m/R445fciQE2rV6tP/Z60SQ0ZZOSXnVIP
	j/eZzriASorXMw1eOBNNZkgggJe7hjuT0GUGAR6oeyWsomhN92/iBK0eFwYBJVnzVU8frP
	CJYb8uv8xGWC5Y/zIAq+BoejaF0W0DA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-557-BWL60IE3Mw6H_Z6GeLw56w-1; Fri, 12 Jun 2026 06:31:08 -0400
X-MC-Unique: BWL60IE3Mw6H_Z6GeLw56w-1
X-Mimecast-MFC-AGG-ID: BWL60IE3Mw6H_Z6GeLw56w_1781260267
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-490b8adf8b8so7024085e9.0
        for <linux-kselftest@vger.kernel.org>; Fri, 12 Jun 2026 03:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1781260267; x=1781865067; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xvvTu1uVNYIh9bpNgTtcE9q3Se0t7H2bpVXEZumrRoI=;
        b=ejO4HPx3bR+ngxfJIh9WAL9sCw9h3IP9XKCri4CL5v7LmUosLWEuUAqBvee/Bhpz3t
         +YCMnwDZSD8JaxrAct3SvvIrpv+U198xiCPyoYl0+RYgakqUeiMEdu7Eephb67/3rRaw
         vFm+OnyE8cy9JIt+qK8gYf662boKPLe3wDYgy0xp9CorCmOBdIwTUe49V5iVUcwkl6jf
         bKdTTsM+QbV1RtLmP69RQOV/magLEABFer3nDCV/JRSfmUhc8hCvXY4CjrwSF9XN/EbV
         PMdFc1fNG3sZRKx4OcCYu1+njXeC9zS2Pvrkcsw732Yuewq6QBK4soNbxyogIwr/Exio
         1o8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781260267; x=1781865067;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xvvTu1uVNYIh9bpNgTtcE9q3Se0t7H2bpVXEZumrRoI=;
        b=p6NA2g/pEaf7yR0v2Ptlb+plQFLujb1b0kMhh6E1KuNM6xUIPbFsVfv52jrU6N8Q46
         EHXWWr/DI3HghvlCMRY9zY9/I5bhc4wUxcKZX9QJC/K0jfBllgV1P26CFGSoAMvEQWeN
         R0WYd+eRZ2r43DX1Q/P5u7hEwTEw0Nf3YGdYzEP5oihQK41bB2ehLC0+kRaj4FYsJTAC
         asRgAS3wvyP4+CH2e1xp2RlYRoHO1+Y48BAxHlXHY51/L4gX6A96WN46iy6LZYXobzBX
         3yjua1wuVhdFuX/Ip4zXPp8lBmdLfhXHaULAlgvfuC9aQW5BeipbEndELsq92CwV0A4O
         MrdQ==
X-Forwarded-Encrypted: i=1; AFNElJ++K4YF6zbC1MgR+embUmdUDeTAYvKdsC245eCikqmy9kRVacls88Gc9txUJs4bZSgiZKq+VqheO3PbXgLS8ts=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/XtK2gjdPK2pPpIE8eKlDRXPHdS5aC0JtZW7PtOh40iu/gqEv
	qV6p1ct3pU9QBDoanNWjFc0qUccXpFknufaufcBuhHwuVFHhSI4y+L4/2xI3e0Q3QKEwx4AJ2xM
	r7vx+1vN50X1ZuBgcv3+fpXuBYC5u+52YihEbDUKwD8X1332EPv7h2QJlUh4NOnpF3uuUuw==
X-Gm-Gg: Acq92OEHHHnqKd9MORQNVvq3RxXm5hpyY47kIiHN5khCRwzvMqAxIXcMbuHE+JYjTxd
	dySIgTNBU8uZwZPE+G26sCm+y/Nd2WvLm1ajgfTBL5PYi1MgngzkWt0zLoEO4g2L7kNjFEx2RYc
	wk9qqcI7FTOvRKc0c6RuNwrDgagbFB2Oo9bvCJ1+GM7pBr4Wl6pcHHcW+e6FiW2HLotpqFj87mm
	Q9Nd91tw9/+otaYAH2A5bRgJ0dwfbsHzU/0xqQmQp+6HDK3v2GAHnwC/lwZoqIIsficMejM+/G3
	9LZeYQG5/EXtq9DH6FvN885pnu0OtAXe2Yz931+bGamMcjYKcNnS16ZhZv4fv4DLwQ+WqN7Bnkp
	NrnTzLbpCsLG8fRKWkmdALTHarbVvugTnDJVmSu0/gVr+Ba1wpXV+F8cox/mkQ8WE
X-Received: by 2002:a05:600d:844f:20b0:490:b8e2:6380 with SMTP id 5b1f17b1804b1-490ec4c3d2fmr19929375e9.12.1781260266951;
        Fri, 12 Jun 2026 03:31:06 -0700 (PDT)
X-Received: by 2002:a05:600d:844f:20b0:490:b8e2:6380 with SMTP id 5b1f17b1804b1-490ec4c3d2fmr19928745e9.12.1781260266147;
        Fri, 12 Jun 2026 03:31:06 -0700 (PDT)
Received: from [172.31.99.182] (91.red-83-48-118.staticip.rima-tde.net. [83.48.118.91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2c5266sm4684943f8f.29.2026.06.12.03.31.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2026 03:31:05 -0700 (PDT)
Message-ID: <9c424084-2223-4d69-87b9-cd21c443b396@redhat.com>
Date: Fri, 12 Jun 2026 04:32:19 -0600
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 08/11] selftests: mm: extend the check_huge() to
 support mTHP check
To: Baolin Wang <baolin.wang@linux.alibaba.com>, akpm@linux-foundation.org,
 david@kernel.org, ljs@kernel.org, hughd@google.com
Cc: willy@infradead.org, ziy@nvidia.com, liam@infradead.org,
 ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org,
 lance.yang@linux.dev, linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <cover.1781083630.git.baolin.wang@linux.alibaba.com>
 <bbedc5afc56b0f7b2073324a3551159ed9cf5f9c.1781083630.git.baolin.wang@linux.alibaba.com>
From: Nico Pache <npache@redhat.com>
Content-Language: en-US
In-Reply-To: <bbedc5afc56b0f7b2073324a3551159ed9cf5f9c.1781083630.git.baolin.wang@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/10/26 4:29 AM, Baolin Wang wrote:
> To support checking for various sized mTHPs during mTHP collapse, extend the
> check_huge() function prototype to accept two new parameters specifying the
> address range and mTHP size, in preparation for the following patches.
> 
> No functional changes.
> 
> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> ---
>  .../selftests/mm/folio_split_race_test.c      |  2 +-
>  tools/testing/selftests/mm/khugepaged.c       | 66 ++++++++++---------
>  .../testing/selftests/mm/prctl_thp_disable.c  |  2 +-
>  tools/testing/selftests/mm/soft-dirty.c       |  2 +-
>  .../selftests/mm/split_huge_page_test.c       | 14 ++--
>  tools/testing/selftests/mm/uffd-common.c      |  4 +-
>  tools/testing/selftests/mm/vm_util.c          |  6 +-
>  tools/testing/selftests/mm/vm_util.h          |  6 +-
>  8 files changed, 55 insertions(+), 47 deletions(-)
> 
> diff --git a/tools/testing/selftests/mm/folio_split_race_test.c b/tools/testing/selftests/mm/folio_split_race_test.c
> index 6329e37fff4c..45b84f7b364e 100644
> --- a/tools/testing/selftests/mm/folio_split_race_test.c
> +++ b/tools/testing/selftests/mm/folio_split_race_test.c
> @@ -182,7 +182,7 @@ static uint64_t run_iteration(void)
>  	for (i = 0; i < TOTAL_PAGES; i++)
>  		fill_page(mmap_base, i);
>  
> -	if (!check_huge_shmem(mmap_base, NR_PMD_PAGE, pmd_pagesize))
> +	if (!check_huge_shmem(mmap_base, FILE_SIZE, NR_PMD_PAGE, pmd_pagesize))
>  		ksft_exit_fail_msg("No shmem THP is allocated\n");
>  
>  	if (pthread_barrier_init(&ctl.barrier, NULL, NUM_READER_THREADS + 1) != 0)
> diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/selftests/mm/khugepaged.c
> index 10e8dedcb087..f69be6be0ecd 100644
> --- a/tools/testing/selftests/mm/khugepaged.c
> +++ b/tools/testing/selftests/mm/khugepaged.c
> @@ -51,7 +51,7 @@ struct mem_ops {
>  	void *(*setup_area)(int nr_hpages);
>  	void (*cleanup_area)(void *p, unsigned long size);
>  	void (*fault)(void *p, unsigned long start, unsigned long end);
> -	bool (*check_huge)(void *addr, int nr_hpages);
> +	bool (*check_huge)(void *addr, unsigned long size, int nr_hpages, unsigned long hpage_size);
>  	const char *name;
>  };
>  
> @@ -276,7 +276,7 @@ static void *alloc_hpage(struct mem_ops *ops)
>  	ksft_print_msg("Allocate huge page...");
>  	if (madvise_collapse_retry(p, hpage_pmd_size))
>  		ksft_exit_fail_perror("madvise(MADV_COLLAPSE)");
> -	if (!ops->check_huge(p, 1))
> +	if (!ops->check_huge(p, hpage_pmd_size, 1, hpage_pmd_size))
>  		ksft_exit_fail_perror("madvise(MADV_COLLAPSE)");
>  	if (madvise(p, hpage_pmd_size, MADV_HUGEPAGE))
>  		ksft_exit_fail_perror("madvise(MADV_HUGEPAGE)");
> @@ -310,9 +310,10 @@ static void anon_fault(void *p, unsigned long start, unsigned long end)
>  	fill_memory(p, start, end);
>  }
>  
> -static bool anon_check_huge(void *addr, int nr_hpages)
> +static bool anon_check_huge(void *addr, unsigned long size,
> +		int nr_hpages, unsigned long hpage_size)
>  {
> -	return check_huge_anon(addr, nr_hpages, hpage_pmd_size);
> +	return check_huge_anon(addr, size, nr_hpages, hpage_size);
>  }
>  
>  static void *file_setup_area_common(int nr_hpages, enum file_setup_ops setup)
> @@ -412,13 +413,14 @@ static void file_fault_write(void *p, unsigned long start, unsigned long end)
>  		ksft_exit_fail_perror("madvise(MADV_POPULATE_WRITE)");
>  }
>  
> -static bool file_check_huge(void *addr, int nr_hpages)
> +static bool file_check_huge(void *addr, unsigned long size,
> +		int nr_hpages, unsigned long hpage_size)
>  {
>  	switch (finfo.type) {
>  	case VMA_FILE:
> -		return check_huge_file(addr, nr_hpages, hpage_pmd_size);
> +		return check_huge_file(addr, size, nr_hpages, hpage_size);
>  	case VMA_SHMEM:
> -		return check_huge_shmem(addr, nr_hpages, hpage_pmd_size);
> +		return check_huge_shmem(addr, size, nr_hpages, hpage_size);
>  	default:
>  		exit(EXIT_FAILURE);
>  		return false;
> @@ -448,9 +450,10 @@ static void shmem_cleanup_area(void *p, unsigned long size)
>  	close(finfo.fd);
>  }
>  
> -static bool shmem_check_huge(void *addr, int nr_hpages)
> +static bool shmem_check_huge(void *addr, unsigned long size,
> +			int nr_hpages, unsigned long hpage_size)
>  {
> -	return check_huge_shmem(addr, nr_hpages, hpage_pmd_size);
> +	return check_huge_shmem(addr, size, nr_hpages, hpage_size);
>  }
>  
>  static struct mem_ops __anon_ops = {
> @@ -533,7 +536,7 @@ static void __madvise_collapse(const char *msg, char *p, int nr_hpages,
>  	ret = madvise_collapse_retry(p, nr_hpages * hpage_pmd_size);
>  	if (((bool)ret) == expect)
>  		fail("Fail: Bad return value");
> -	else if (!ops->check_huge(p, expect ? nr_hpages : 0))
> +	else if (!ops->check_huge(p, nr_hpages * hpage_pmd_size, expect ? nr_hpages : 0, hpage_pmd_size))
>  		fail("Fail: check_huge()");
>  	else
>  		success("OK");
> @@ -545,7 +548,7 @@ static void madvise_collapse(const char *msg, char *p, int nr_hpages,
>  			     struct mem_ops *ops, bool expect)
>  {
>  	/* Sanity check */
> -	if (!ops->check_huge(p, 0))
> +	if (!ops->check_huge(p, nr_hpages * hpage_pmd_size, 0, hpage_pmd_size))
>  		ksft_exit_fail_msg("Unexpected huge page\n");
>  	__madvise_collapse(msg, p, nr_hpages, ops, expect);
>  }
> @@ -554,11 +557,12 @@ static void madvise_collapse(const char *msg, char *p, int nr_hpages,
>  static bool wait_for_scan(const char *msg, char *p, int nr_hpages,
>  			  struct mem_ops *ops)
>  {
> +	unsigned long size = nr_hpages * hpage_pmd_size;
>  	int full_scans;
>  	int timeout = 6; /* 3 seconds */
>  
>  	/* Sanity check */
> -	if (!ops->check_huge(p, 0))
> +	if (!ops->check_huge(p, size, 0, hpage_pmd_size))
>  		ksft_exit_fail_msg("Unexpected huge page\n");
>  
>  	madvise(p, nr_hpages * hpage_pmd_size, MADV_HUGEPAGE);
> @@ -568,7 +572,7 @@ static bool wait_for_scan(const char *msg, char *p, int nr_hpages,
>  
>  	ksft_print_msg("%s...", msg);
>  	while (timeout--) {
> -		if (ops->check_huge(p, nr_hpages))
> +		if (ops->check_huge(p, size, nr_hpages, hpage_pmd_size))
>  			break;
>  		if (thp_read_num("khugepaged/full_scans") >= full_scans)
>  			break;
> @@ -582,6 +586,8 @@ static bool wait_for_scan(const char *msg, char *p, int nr_hpages,
>  static void khugepaged_collapse(const char *msg, char *p, int nr_hpages,
>  				struct mem_ops *ops, bool expect)
>  {
> +	unsigned long size = nr_hpages * hpage_pmd_size;
> +
>  	/*
>  	 * read&write file collapse fails since khugepaged does not flush
>  	 * the target dirty folios
> @@ -605,7 +611,7 @@ static void khugepaged_collapse(const char *msg, char *p, int nr_hpages,
>  	if (ops != &__anon_ops)
>  		ops->fault(p, 0, nr_hpages * hpage_pmd_size);
>  
> -	if (ops->check_huge(p, expect ? nr_hpages : 0))
> +	if (ops->check_huge(p, size, expect ? nr_hpages : 0, hpage_pmd_size))
>  		success("OK");
>  	else
>  		fail("Fail");
> @@ -634,7 +640,7 @@ static void alloc_at_fault(void)
>  	p = alloc_mapping(1);
>  	*p = 1;
>  	ksft_print_msg("Allocate huge page on fault...");
> -	if (check_huge_anon(p, 1, hpage_pmd_size))
> +	if (check_huge_anon(p, hpage_pmd_size, 1, hpage_pmd_size))
>  		success("OK");
>  	else
>  		fail("Fail");
> @@ -643,7 +649,7 @@ static void alloc_at_fault(void)
>  
>  	madvise(p, page_size, MADV_DONTNEED);
>  	ksft_print_msg("Split huge PMD on MADV_DONTNEED...");
> -	if (check_huge_anon(p, 0, hpage_pmd_size))
> +	if (check_huge_anon(p, hpage_pmd_size, 0, hpage_pmd_size))
>  		success("OK");
>  	else
>  		fail("Fail");
> @@ -815,7 +821,7 @@ static void collapse_single_pte_entry_compound(struct collapse_context *c, struc
>  	madvise(p, hpage_pmd_size, MADV_NOHUGEPAGE);
>  	ksft_print_msg("Split huge page leaving single PTE mapping compound page...");
>  	madvise(p + page_size, hpage_pmd_size - page_size, MADV_DONTNEED);
> -	if (ops->check_huge(p, 0))
> +	if (ops->check_huge(p, hpage_pmd_size, 0, hpage_pmd_size))
>  		success("OK");
>  	else
>  		fail("Fail");
> @@ -836,7 +842,7 @@ static void collapse_full_of_compound(struct collapse_context *c, struct mem_ops
>  	ksft_print_msg("Split huge page leaving single PTE page table full of compound pages...");
>  	madvise(p, page_size, MADV_NOHUGEPAGE);
>  	madvise(p, hpage_pmd_size, MADV_NOHUGEPAGE);
> -	if (ops->check_huge(p, 0))
> +	if (ops->check_huge(p, hpage_pmd_size, 0, hpage_pmd_size))
>  		success("OK");
>  	else
>  		fail("Fail");
> @@ -858,7 +864,7 @@ static void collapse_compound_extreme(struct collapse_context *c, struct mem_ops
>  	for (i = 0; i < hpage_pmd_nr; i++) {
>  		madvise(BASE_ADDR, hpage_pmd_size, MADV_HUGEPAGE);
>  		ops->fault(BASE_ADDR, 0, hpage_pmd_size);
> -		if (!ops->check_huge(BASE_ADDR, 1))
> +		if (!ops->check_huge(BASE_ADDR, hpage_pmd_size, 1, hpage_pmd_size))
>  			ksft_exit_fail_msg("Failed to allocate huge page\n");
>  		madvise(BASE_ADDR, hpage_pmd_size, MADV_NOHUGEPAGE);
>  
> @@ -881,7 +887,7 @@ static void collapse_compound_extreme(struct collapse_context *c, struct mem_ops
>  
>  	ops->cleanup_area(BASE_ADDR, hpage_pmd_size);
>  	ops->fault(p, 0, hpage_pmd_size);
> -	if (!ops->check_huge(p, 1))
> +	if (!ops->check_huge(p, hpage_pmd_size, 1, hpage_pmd_size))
>  		success("OK");
>  	else
>  		fail("Fail");
> @@ -903,7 +909,7 @@ static void collapse_fork(struct collapse_context *c, struct mem_ops *ops)
>  
>  	ksft_print_msg("Allocate small page...");
>  	ops->fault(p, 0, page_size);
> -	if (ops->check_huge(p, 0))
> +	if (ops->check_huge(p, hpage_pmd_size, 0, hpage_pmd_size))
>  		success("OK");
>  	else
>  		fail("Fail");
> @@ -911,7 +917,7 @@ static void collapse_fork(struct collapse_context *c, struct mem_ops *ops)
>  	ksft_print_msg("Share small page over fork()...");
>  	if (!fork()) {
>  		/* Do not touch settings on child exit */
> -		if (ops->check_huge(p, 0))
> +		if (ops->check_huge(p, hpage_pmd_size, 0, hpage_pmd_size))
>  			success("OK");
>  		else
>  			fail("Fail");
> @@ -929,7 +935,7 @@ static void collapse_fork(struct collapse_context *c, struct mem_ops *ops)
>  	exit_status = WEXITSTATUS(wstatus);
>  
>  	ksft_print_msg("Check if parent still has small page...");
> -	if (ops->check_huge(p, 0))
> +	if (ops->check_huge(p, hpage_pmd_size, 0, hpage_pmd_size))
>  		success("OK");
>  	else
>  		fail("Fail");
> @@ -947,7 +953,7 @@ static void collapse_fork_compound(struct collapse_context *c, struct mem_ops *o
>  	ksft_print_msg("Share huge page over fork()...");
>  	if (!fork()) {
>  		/* Do not touch settings on child exit */
> -		if (ops->check_huge(p, 1))
> +		if (ops->check_huge(p, hpage_pmd_size, 1, hpage_pmd_size))
>  			success("OK");
>  		else
>  			fail("Fail");
> @@ -955,7 +961,7 @@ static void collapse_fork_compound(struct collapse_context *c, struct mem_ops *o
>  		ksft_print_msg("Split huge page PMD in child process...");
>  		madvise(p, page_size, MADV_NOHUGEPAGE);
>  		madvise(p, hpage_pmd_size, MADV_NOHUGEPAGE);
> -		if (ops->check_huge(p, 0))
> +		if (ops->check_huge(p, hpage_pmd_size, 0, hpage_pmd_size))
>  			success("OK");
>  		else
>  			fail("Fail");
> @@ -976,7 +982,7 @@ static void collapse_fork_compound(struct collapse_context *c, struct mem_ops *o
>  	exit_status = WEXITSTATUS(wstatus);
>  
>  	ksft_print_msg("Check if parent still has huge page...");
> -	if (ops->check_huge(p, 1))
> +	if (ops->check_huge(p, hpage_pmd_size, 1, hpage_pmd_size))
>  		success("OK");
>  	else
>  		fail("Fail");
> @@ -995,7 +1001,7 @@ static void collapse_max_ptes_shared(struct collapse_context *c, struct mem_ops
>  	ksft_print_msg("Share huge page over fork()...");
>  	if (!fork()) {
>  		/* Do not touch settings on child exit */
> -		if (ops->check_huge(p, 1))
> +		if (ops->check_huge(p, hpage_pmd_size, 1, hpage_pmd_size))
>  			success("OK");
>  		else
>  			fail("Fail");
> @@ -1003,7 +1009,7 @@ static void collapse_max_ptes_shared(struct collapse_context *c, struct mem_ops
>  		ksft_print_msg("Trigger CoW on page %d of %d...",
>  				hpage_pmd_nr - max_ptes_shared - 1, hpage_pmd_nr);
>  		ops->fault(p, 0, (hpage_pmd_nr - max_ptes_shared - 1) * page_size);
> -		if (ops->check_huge(p, 0))
> +		if (ops->check_huge(p, hpage_pmd_size, 0, hpage_pmd_size))
>  			success("OK");
>  		else
>  			fail("Fail");
> @@ -1016,7 +1022,7 @@ static void collapse_max_ptes_shared(struct collapse_context *c, struct mem_ops
>  			       hpage_pmd_nr - max_ptes_shared, hpage_pmd_nr);
>  			ops->fault(p, 0, (hpage_pmd_nr - max_ptes_shared) *
>  				    page_size);
> -			if (ops->check_huge(p, 0))
> +			if (ops->check_huge(p, hpage_pmd_size, 0, hpage_pmd_size))
>  				success("OK");
>  			else
>  				fail("Fail");
> @@ -1034,7 +1040,7 @@ static void collapse_max_ptes_shared(struct collapse_context *c, struct mem_ops
>  	exit_status = WEXITSTATUS(wstatus);
>  
>  	ksft_print_msg("Check if parent still has huge page...");
> -	if (ops->check_huge(p, 1))
> +	if (ops->check_huge(p, hpage_pmd_size, 1, hpage_pmd_size))
>  		success("OK");
>  	else
>  		fail("Fail");
> diff --git a/tools/testing/selftests/mm/prctl_thp_disable.c b/tools/testing/selftests/mm/prctl_thp_disable.c
> index d8d9d1de57b8..82c6e96ea6eb 100644
> --- a/tools/testing/selftests/mm/prctl_thp_disable.c
> +++ b/tools/testing/selftests/mm/prctl_thp_disable.c
> @@ -67,7 +67,7 @@ static int test_mmap_thp(enum thp_collapse_type madvise_buf, size_t pmdsize)
>  	/* HACK: make sure we have a separate VMA that we can check reliably. */
>  	mprotect(mem, pmdsize, PROT_READ);
>  
> -	ret = check_huge_anon(mem, 1, pmdsize);
> +	ret = check_huge_anon(mem, pmdsize, 1, pmdsize);
>  	munmap(mmap_mem, mmap_size);
>  	return ret;
>  }
> diff --git a/tools/testing/selftests/mm/soft-dirty.c b/tools/testing/selftests/mm/soft-dirty.c
> index fb1864a68e1c..e198facf78bb 100644
> --- a/tools/testing/selftests/mm/soft-dirty.c
> +++ b/tools/testing/selftests/mm/soft-dirty.c
> @@ -103,7 +103,7 @@ static void test_hugepage(int pagemap_fd, int pagesize)
>  	for (i = 0; i < hpage_len; i++)
>  		map[i] = (char)i;
>  
> -	if (check_huge_anon(map, 1, hpage_len)) {
> +	if (check_huge_anon(map, hpage_len, 1, hpage_len)) {
>  		ksft_test_result_pass("Test %s huge page allocation\n", __func__);
>  
>  		clear_softdirty();
> diff --git a/tools/testing/selftests/mm/split_huge_page_test.c b/tools/testing/selftests/mm/split_huge_page_test.c
> index 32b991472f74..4cc70873a674 100644
> --- a/tools/testing/selftests/mm/split_huge_page_test.c
> +++ b/tools/testing/selftests/mm/split_huge_page_test.c
> @@ -296,7 +296,7 @@ static void verify_rss_anon_split_huge_page_all_zeroes(char *one_page, int nr_hp
>  	unsigned long rss_anon_before, rss_anon_after;
>  	size_t i;
>  
> -	if (!check_huge_anon(one_page, nr_hpages, pmd_pagesize))
> +	if (!check_huge_anon(one_page, nr_hpages * pmd_pagesize, nr_hpages, pmd_pagesize))
>  		ksft_exit_fail_msg("No THP is allocated\n");
>  
>  	rss_anon_before = rss_anon();
> @@ -311,7 +311,7 @@ static void verify_rss_anon_split_huge_page_all_zeroes(char *one_page, int nr_hp
>  		if (one_page[i] != (char)0)
>  			ksft_exit_fail_msg("%ld byte corrupted\n", i);
>  
> -	if (!check_huge_anon(one_page, 0, pmd_pagesize))
> +	if (!check_huge_anon(one_page, nr_hpages * pmd_pagesize, 0, pmd_pagesize))
>  		ksft_exit_fail_msg("Still AnonHugePages not split\n");
>  
>  	rss_anon_after = rss_anon();
> @@ -347,7 +347,7 @@ static void split_pmd_thp_to_order(int order)
>  	for (i = 0; i < len; i++)
>  		one_page[i] = (char)i;
>  
> -	if (!check_huge_anon(one_page, 4, pmd_pagesize))
> +	if (!check_huge_anon(one_page, 4 * pmd_pagesize, 4, pmd_pagesize))
>  		ksft_exit_fail_msg("No THP is allocated\n");
>  
>  	/* split all THPs */
> @@ -366,7 +366,7 @@ static void split_pmd_thp_to_order(int order)
>  					   (pmd_order + 1)))
>  		ksft_exit_fail_msg("Unexpected THP split\n");
>  
> -	if (!check_huge_anon(one_page, 0, pmd_pagesize))
> +	if (!check_huge_anon(one_page, 4 * pmd_pagesize, 0, pmd_pagesize))
>  		ksft_exit_fail_msg("Still AnonHugePages not split\n");
>  
>  	ksft_test_result_pass("Split huge pages to order %d successful\n", order);
> @@ -393,7 +393,7 @@ static void split_pte_mapped_thp(void)
>  	for (i = 0; i < thp_area_size; i++)
>  		thp_area[i] = (char)i;
>  
> -	if (!check_huge_anon(thp_area, nr_thps, pmd_pagesize)) {
> +	if (!check_huge_anon(thp_area, nr_thps * pmd_pagesize, nr_thps, pmd_pagesize)) {
>  		ksft_test_result_skip("Not all THPs allocated\n");
>  		goto out;
>  	}
> @@ -657,7 +657,7 @@ static int create_pagecache_thp_and_fd(const char *testfile, size_t fd_size,
>  
>  	force_read_pages(*addr, fd_size / pmd_pagesize, pmd_pagesize);
>  
> -	if (!check_huge_file(*addr, fd_size / pmd_pagesize, pmd_pagesize)) {
> +	if (!check_huge_file(*addr, fd_size, fd_size / pmd_pagesize, pmd_pagesize)) {
>  		ksft_print_msg("No large pagecache folio generated, please provide a filesystem supporting large folio\n");
>  		munmap(*addr, fd_size);
>  		close(*fd);
> @@ -735,7 +735,7 @@ static void split_thp_in_pagecache_to_order_at(size_t fd_size,
>  		goto out;
>  	}
>  
> -	if (!check_huge_file(addr, 0, pmd_pagesize)) {
> +	if (!check_huge_file(addr, fd_size, 0, pmd_pagesize)) {
>  		ksft_print_msg("Still FilePmdMapped not split\n");
>  		err = EXIT_FAILURE;
>  		goto out;
> diff --git a/tools/testing/selftests/mm/uffd-common.c b/tools/testing/selftests/mm/uffd-common.c
> index edd02328f77b..777f276044e2 100644
> --- a/tools/testing/selftests/mm/uffd-common.c
> +++ b/tools/testing/selftests/mm/uffd-common.c
> @@ -194,7 +194,9 @@ static void shmem_alias_mapping(uffd_global_test_opts_t *gopts, __u64 *start,
>  
>  static void shmem_check_pmd_mapping(uffd_global_test_opts_t *gopts, void *p, int expect_nr_hpages)
>  {
> -	if (!check_huge_shmem(gopts->area_dst_alias, expect_nr_hpages,
> +	unsigned long size = expect_nr_hpages * read_pmd_pagesize();
> +
> +	if (!check_huge_shmem(gopts->area_dst_alias, size, expect_nr_hpages,
>  			      read_pmd_pagesize()))
>  		err("Did not find expected %d number of hugepages",
>  		    expect_nr_hpages);
> diff --git a/tools/testing/selftests/mm/vm_util.c b/tools/testing/selftests/mm/vm_util.c
> index 311fc5b4513e..b43adfa92116 100644
> --- a/tools/testing/selftests/mm/vm_util.c
> +++ b/tools/testing/selftests/mm/vm_util.c
> @@ -247,17 +247,17 @@ bool __check_huge(void *addr, char *pattern, int nr_hpages,
>  	return thp == (nr_hpages * (hpage_size >> 10));
>  }
>  
> -bool check_huge_anon(void *addr, int nr_hpages, uint64_t hpage_size)
> +bool check_huge_anon(void *addr, unsigned long size, int nr_hpages, uint64_t hpage_size)

Whats the purpose of adding 'size' here?

>  {
>  	return __check_huge(addr, "AnonHugePages: ", nr_hpages, hpage_size);
>  }
>  
> -bool check_huge_file(void *addr, int nr_hpages, uint64_t hpage_size)
> +bool check_huge_file(void *addr, unsigned long size, int nr_hpages, uint64_t hpage_size)
>  {
>  	return __check_huge(addr, "FilePmdMapped:", nr_hpages, hpage_size);

Same?

>  }
>  
> -bool check_huge_shmem(void *addr, int nr_hpages, uint64_t hpage_size)
> +bool check_huge_shmem(void *addr, unsigned long size, int nr_hpages, uint64_t hpage_size)
>  {
>  	return __check_huge(addr, "ShmemPmdMapped:", nr_hpages, hpage_size);

And here?

Perhaps I find out in the next patch :)

Thanks!
-- Nico

>  }
> diff --git a/tools/testing/selftests/mm/vm_util.h b/tools/testing/selftests/mm/vm_util.h
> index ea8fc8fdf0eb..40c6d8c4f1b8 100644
> --- a/tools/testing/selftests/mm/vm_util.h
> +++ b/tools/testing/selftests/mm/vm_util.h
> @@ -90,9 +90,9 @@ void clear_softdirty(void);
>  bool check_for_pattern(FILE *fp, const char *pattern, char *buf, size_t len);
>  uint64_t read_pmd_pagesize(void);
>  unsigned long rss_anon(void);
> -bool check_huge_anon(void *addr, int nr_hpages, uint64_t hpage_size);
> -bool check_huge_file(void *addr, int nr_hpages, uint64_t hpage_size);
> -bool check_huge_shmem(void *addr, int nr_hpages, uint64_t hpage_size);
> +bool check_huge_anon(void *addr, unsigned long size, int nr_hpages, uint64_t hpage_size);
> +bool check_huge_file(void *addr, unsigned long size, int nr_hpages, uint64_t hpage_size);
> +bool check_huge_shmem(void *addr, unsigned long size, int nr_hpages, uint64_t hpage_size);
>  int64_t allocate_transhuge(void *ptr, int pagemap_fd);
>  int pageflags_get(unsigned long pfn, int kpageflags_fd, uint64_t *flags);
>  

