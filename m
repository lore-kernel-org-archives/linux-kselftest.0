Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A434038B12A
	for <linux-kselftest@vger.kernel.org>; Fri, 12 Jun 2026 10:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781260811; cv=none; b=pyGT8+w+9PExnDffnnVyS0icXVeRcMzdwi9bKUTgG9/jWjglRhdsXNiNv0TadklGH6cb6oqcq0Orr3vWPlAvNpNUs/L/IHMVeZFYz7BvGqcvu+xxWsQy7cFDToCXn9uS7lFm7tRxkrSL8ouQEZLfP0RcsxgIBpKlrdkydsRnJ74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781260811; c=relaxed/simple;
	bh=YFd9xj6e2cK/9fPa2NUXtHd6ly4FxR7oQJM+3eBOxP8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sl2aP7Ju4oPR1oFbFVVrh0esREd5c3hW1japgcP36q0RohYdyNfeIzqI62jxwYNPPKiV10avMJ7zzVH3z2e/ag1C+dRZcf08CAvM2cL2lsQ6OXG2XpfzCWsFRMAef6pfvN5uZ9eqanUB42ewyqAVhWbGgNoLmK09gJEp3vS7LEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NApOyci2; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=hBXcVijK; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NApOyci2";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="hBXcVijK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781260807;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wbMHc9owEYeagDmLS6VGhSW9KveQRoz2Io2kiAEfmqw=;
	b=NApOyci25yke6920Ub1nnPtPnh0Um2g9K5EsT+SYnIBgrPlKmT6BpBHSOP0EPCUvXGNztQ
	1J0CjOb8AMgLRaztr3I6ZvPERh9W0ER1oXRNZCpvUXhixJ1YarL+aL8eJoc5W1OSS+7ip5
	YH8MQfYGvyvuw0bWMf41d8tcn3CjF/w=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-471-Lfxk5qB_N1KtVov0fX1ChA-1; Fri, 12 Jun 2026 06:40:06 -0400
X-MC-Unique: Lfxk5qB_N1KtVov0fX1ChA-1
X-Mimecast-MFC-AGG-ID: Lfxk5qB_N1KtVov0fX1ChA_1781260805
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-490ae0167ceso4052785e9.1
        for <linux-kselftest@vger.kernel.org>; Fri, 12 Jun 2026 03:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1781260805; x=1781865605; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wbMHc9owEYeagDmLS6VGhSW9KveQRoz2Io2kiAEfmqw=;
        b=hBXcVijKs+53JS325MqS6N4bqW/aL1YxtPAW2TZ+UesgmG4iqwGB3s6zyfOhZHVZx5
         cv4O3N0DSqjAzuqt4Pu76QVFvwTaQGBFO9WYZM0BSTrR5rBXLOD3fKvff1IMK5DLqucG
         t02wq80GCkuAKBffujYm9xZwWBCJaW7bfs2nD2seqm8QiLci76WxPa7w4n3iadISz7LB
         G9PNTNfT5xR7eKrabt4zspSpchIFwFHz919sHEk1KzqbQYUR2NN5l1W50UhPu6Jjb/uf
         L5nf33xzSqnDmmIbXmlNWnJ2GNZGdbqtgBVq/CXbeB/QGpn+fFl06sIcMKmtJBgXf7vb
         tAgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781260805; x=1781865605;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wbMHc9owEYeagDmLS6VGhSW9KveQRoz2Io2kiAEfmqw=;
        b=XlkCMZahxhXPx6JghD/Vu9eJPsurQLtc1PK20alOAN3KwKF5vj0iFSIUUeGMiiBwdv
         U8u/nOOZwSs7Oo1zBbFf+i20BJ4byl8mIcxaLtUBpaq3pJCATO/8pU6BglOdof/nEcsL
         kqV+idjpbFHWfAIq5iVt0JkGGmdZXjlsRs2pY0WIY8BRcyexp54CbNOGESwRcMpcM4dB
         L8OZCKChsOtGwVFOtWtZ2wUqi6LreaW05vRrOvPoVIVPZ3RsYrf81CBP+ZG3pMFBjoHh
         lrIqqIgI/d1DkER1Ig6+Ucf/0dPLyrEY7HywNKPPuKXIKguYzuHplREEGEz6rOfzhFLt
         xIhA==
X-Forwarded-Encrypted: i=1; AFNElJ8nZFIR62bIGngszDk/4XY0SSrFgLPwK0XasV67EWWZZof2QYmnQvJ+f4o4Z8Amndo8cTA8tA/1sGWbIq6uNa4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8wDv+sDZdCuF7j6aJHaXNJbPlzlqh3IXhxmIEKVIuPOD9qIo7
	auZuuQ/SMH5iitV8/1oQUduCNeA8dNVFbR1S+F8uejZ0v2uk18vKOraveb9uoH2l28eVdGgk0DM
	0bXBKLJ9esg7CciD+dPHhrwM1XbVlITwtFo35nLOVjGFnpiB//G95nUk+1ZQDuW+Yq0cnsA==
X-Gm-Gg: Acq92OHmv+f0w73xA22fAs7zk6IMS9NQnjalQUsaF2800qIjIIPGJ0g4F5XGIzgQ78x
	TaR+vxmYXIdFIXzf7+sWYJaDb4yA/wEvTAEC0yxEpMI46vtwYmMTVk4mOmrjFYuKDDyrmWqHV1Z
	7ks8bF1/4+l7A/Scdmi1jF+nDVbCyc6YREWKAQ/h1LgfU9aIVmpB26H2o0wK05PjiBilurIRZNi
	DBMk1tOnNvS2pU9YaB28465aPvd777tkev30KxfrQ8zRzu+4CCBA6gJPtiXL9ibSDzwQkaXTzyx
	frFLDcDWcaTjZ+ibQuwF5WeKtM4uNeL0S4rqEilZq8EnWEOD3FbGe8w6abG/dHzYMHWJaEd5KXy
	kG7tfU4Tfb1r8jTMf227JqvmXMUpVtYlux9v7UFxzGpKF2mb3D3ddD3uyHDMENqbA
X-Received: by 2002:a05:600c:190b:b0:490:adb6:7957 with SMTP id 5b1f17b1804b1-490ec524ed1mr28332495e9.33.1781260805106;
        Fri, 12 Jun 2026 03:40:05 -0700 (PDT)
X-Received: by 2002:a05:600c:190b:b0:490:adb6:7957 with SMTP id 5b1f17b1804b1-490ec524ed1mr28331945e9.33.1781260804631;
        Fri, 12 Jun 2026 03:40:04 -0700 (PDT)
Received: from [172.31.99.182] (91.red-83-48-118.staticip.rima-tde.net. [83.48.118.91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490ea4a128csm68072655e9.0.2026.06.12.03.40.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2026 03:40:04 -0700 (PDT)
Message-ID: <4406fdcf-098e-4523-a441-5343bb22e667@redhat.com>
Date: Fri, 12 Jun 2026 04:41:18 -0600
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 11/11] selftests: mm: add mTHP collapse test cases
To: Baolin Wang <baolin.wang@linux.alibaba.com>, akpm@linux-foundation.org,
 david@kernel.org, ljs@kernel.org, hughd@google.com
Cc: willy@infradead.org, ziy@nvidia.com, liam@infradead.org,
 ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org,
 lance.yang@linux.dev, linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <cover.1781083630.git.baolin.wang@linux.alibaba.com>
 <fcf0fcc52aa6c4e18682fcb302fe9371a8d800c3.1781083630.git.baolin.wang@linux.alibaba.com>
From: Nico Pache <npache@redhat.com>
Content-Language: en-US
In-Reply-To: <fcf0fcc52aa6c4e18682fcb302fe9371a8d800c3.1781083630.git.baolin.wang@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/10/26 4:29 AM, Baolin Wang wrote:
> Added a new command 'mthp_khugepaged' for mTHP collapse, along with the '-c'
> parameter to specify the collapse order. Additionally, added mTHP collapse
> test cases for 'collapse_full', 'collapse_empty', and 'collapse_single_mthp'
> for both anonymous pages and shmem. All khugepaged test cases passed.
> 
> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>

Will rip out the Shmem stuff and test these selftests on top of my mTHP stuff
soon :)

Ill provide the diff so its easier for you and if I come up with more cases ill
add those too.

Thanks for doing this!!!
-- Nico

> ---
>  tools/testing/selftests/mm/khugepaged.c   | 135 +++++++++++++++++++---
>  tools/testing/selftests/mm/run_vmtests.sh |   4 +
>  2 files changed, 120 insertions(+), 19 deletions(-)
> 
> diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/selftests/mm/khugepaged.c
> index f69be6be0ecd..8975be5b7b2f 100644
> --- a/tools/testing/selftests/mm/khugepaged.c
> +++ b/tools/testing/selftests/mm/khugepaged.c
> @@ -26,9 +26,11 @@
>  
>  #define BASE_ADDR ((void *)(1UL << 30))
>  static unsigned long hpage_pmd_size;
> +static int hpage_pmd_order;
>  static unsigned long page_size;
>  static int hpage_pmd_nr;
>  static int anon_order;
> +static int collapse_order;
>  
>  #define PID_SMAPS "/proc/self/smaps"
>  #define TEST_FILE "collapse_test_file"
> @@ -69,6 +71,7 @@ struct collapse_context {
>  };
>  
>  static struct collapse_context *khugepaged_context;
> +static struct collapse_context *mthp_khugepaged_context;
>  static struct collapse_context *madvise_context;
>  
>  struct file_info {
> @@ -554,25 +557,25 @@ static void madvise_collapse(const char *msg, char *p, int nr_hpages,
>  }
>  
>  #define TICK 500000
> -static bool wait_for_scan(const char *msg, char *p, int nr_hpages,
> -			  struct mem_ops *ops)
> +static bool wait_for_scan(const char *msg, char *p, unsigned long size,
> +		int nr_hpages, int collap_order, struct mem_ops *ops)
>  {
> -	unsigned long size = nr_hpages * hpage_pmd_size;
> +	unsigned long hpage_size = page_size << collap_order;
>  	int full_scans;
>  	int timeout = 6; /* 3 seconds */
>  
>  	/* Sanity check */
> -	if (!ops->check_huge(p, size, 0, hpage_pmd_size))
> +	if (!ops->check_huge(p, size, 0, hpage_size))
>  		ksft_exit_fail_msg("Unexpected huge page\n");
>  
> -	madvise(p, nr_hpages * hpage_pmd_size, MADV_HUGEPAGE);
> +	madvise(p, size, MADV_HUGEPAGE);
>  
>  	/* Wait until the second full_scan completed */
>  	full_scans = thp_read_num("khugepaged/full_scans") + 2;
>  
>  	ksft_print_msg("%s...", msg);
>  	while (timeout--) {
> -		if (ops->check_huge(p, size, nr_hpages, hpage_pmd_size))
> +		if (ops->check_huge(p, size, nr_hpages, hpage_size))
>  			break;
>  		if (thp_read_num("khugepaged/full_scans") >= full_scans)
>  			break;
> @@ -595,7 +598,7 @@ static void khugepaged_collapse(const char *msg, char *p, int nr_hpages,
>  	if (!is_tmpfs(ops) && ops == &__read_write_file_write_ops)
>  		expect = false;
>  
> -	if (wait_for_scan(msg, p, nr_hpages, ops)) {
> +	if (wait_for_scan(msg, p, size, nr_hpages, hpage_pmd_order, ops)) {
>  		if (expect)
>  			fail("Timeout");
>  		else
> @@ -617,12 +620,65 @@ static void khugepaged_collapse(const char *msg, char *p, int nr_hpages,
>  		fail("Fail");
>  }
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
> +	} else if (ops == &__shmem_ops) {
> +		settings.shmem_enabled = SHMEM_NEVER;
> +		settings.shmem_hugepages[collapse_order].enabled = SHMEM_ALWAYS;
> +	}
> +
> +	thp_push_settings(&settings);
> +
> +	if (wait_for_scan(msg, p, size, nr_hpages, collapse_order, ops)) {
> +		if (expect)
> +			fail("Timeout");
> +		else
> +			success("OK");
> +
> +		/* Restore THP settings for mTHP collapse. */
> +		thp_pop_settings();
> +		return;
> +	}
> +
> +	/*
> +	 * For file and shmem memory, khugepaged only retracts pte entries after
> +	 * putting the new hugepage in the page cache. The hugepage must be
> +	 * subsequently refaulted to install the pmd mapping for the mm.
> +	 */
> +	if (ops != &__anon_ops)
> +		ops->fault(p, 0, nr_hpages * hpage_size);
> +
> +	if (ops->check_huge(p, size, expect ? nr_hpages : 0, hpage_size))
> +		success("OK");
> +	else
> +		fail("Fail");
> +
> +	/* Restore THP settings for mTHP collapse. */
> +	thp_pop_settings();
> +}
> +
>  static struct collapse_context __khugepaged_context = {
>  	.collapse = &khugepaged_collapse,
>  	.enforce_pte_scan_limits = true,
>  	.name = "khugepaged",
>  };
>  
> +static struct collapse_context __mthp_khugepaged_context = {
> +	.collapse = &mthp_khugepaged_collapse,
> +	.enforce_pte_scan_limits = true,
> +	.name = "mthp_khugepaged",
> +};
> +
>  static struct collapse_context __madvise_context = {
>  	.collapse = &madvise_collapse,
>  	.enforce_pte_scan_limits = false,
> @@ -661,10 +717,17 @@ static void alloc_at_fault(void)
>  static void collapse_full(struct collapse_context *c, struct mem_ops *ops)
>  {
>  	void *p;
> -	int nr_hpages = 4;
> +	int nr_pmds = 4, nr_hpages = 4;
>  	unsigned long size = nr_hpages * hpage_pmd_size;
>  
> -	p = ops->setup_area(nr_hpages);
> +	/* Only try 1 PMD sized range for mTHP collapse. */
> +	if (c == &__mthp_khugepaged_context) {
> +		nr_pmds = 1;
> +		nr_hpages = 1 << (hpage_pmd_order - collapse_order);
> +		size = hpage_pmd_size;
> +	}
> +
> +	p = ops->setup_area(nr_pmds);
>  	ops->fault(p, 0, size);
>  	c->collapse("Collapse multiple fully populated PTE table", p, nr_hpages,
>  		    ops, true);
> @@ -676,10 +739,31 @@ static void collapse_full(struct collapse_context *c, struct mem_ops *ops)
>  
>  static void collapse_empty(struct collapse_context *c, struct mem_ops *ops)
>  {
> +	int nr_hpages = 1;
> +	void *p;
> +
> +	if (c == &__mthp_khugepaged_context)
> +		nr_hpages = 1 << (hpage_pmd_order - collapse_order);
> +
> +	p = ops->setup_area(1);
> +	c->collapse("Do not collapse empty PTE table", p, nr_hpages, ops, false);
> +	ops->cleanup_area(p, hpage_pmd_size);
> +	ksft_test_result_report(exit_status, "%s\n", __func__);
> +}
> +
> +static void collapse_single_mthp(struct collapse_context *c, struct mem_ops *ops)
> +{
> +	unsigned long hpage_size = page_size << collapse_order;
>  	void *p;
>  
>  	p = ops->setup_area(1);
> -	c->collapse("Do not collapse empty PTE table", p, 1, ops, false);
> +	/*
> +	 * Only fault collapse_order sized ranges, and only check 1
> +	 * collapse_order sized huge page.
> +	 */
> +	ops->fault(p, 0, hpage_size);
> +	c->collapse("Collapse PTE table with half PTE entries present",
> +		p, 1, ops, true);
>  	ops->cleanup_area(p, hpage_pmd_size);
>  	ksft_test_result_report(exit_status, "%s\n", __func__);
>  }
> @@ -1081,8 +1165,8 @@ static void madvise_retracted_page_tables(struct collapse_context *c,
>  	ops->fault(p, 0, size);
>  
>  	/* Let khugepaged collapse and leave pmd cleared */
> -	if (wait_for_scan("Collapse and leave PMD cleared", p, nr_hpages,
> -			  ops)) {
> +	if (wait_for_scan("Collapse and leave PMD cleared", p, size, nr_hpages,
> +			  hpage_pmd_order, ops)) {
>  		fail("Timeout");
>  		return;
>  	}
> @@ -1098,7 +1182,7 @@ static void usage(void)
>  {
>  	fprintf(stderr, "\nUsage: ./khugepaged [OPTIONS] <test type> [dir]\n\n");
>  	fprintf(stderr, "\t<test type>\t: <context>:<mem_type>\n");
> -	fprintf(stderr, "\t<context>\t: [all|khugepaged|madvise]\n");
> +	fprintf(stderr, "\t<context>\t: [all|khugepaged|mthp_khugepaged|madvise]\n");
>  	fprintf(stderr, "\t<mem_type>\t: [all|anon|file|shmem]\n");
>  	fprintf(stderr, "\n\t\"file,all\" mem_type requires [dir] argument\n");
>  	fprintf(stderr, "\n\t\"file,all\" mem_type requires a file system\n");
> @@ -1109,6 +1193,7 @@ static void usage(void)
>  	fprintf(stderr,	"\t\t-h: This help message.\n");
>  	fprintf(stderr,	"\t\t-s: mTHP size, expressed as page order.\n");
>  	fprintf(stderr,	"\t\t    Defaults to 0. Use this size for anon or shmem allocations.\n");
> +	fprintf(stderr,	"\t\t-c: collapse order for mTHP collapse, expressed as page order.\n");
>  	exit(1);
>  }
>  
> @@ -1118,11 +1203,14 @@ static void parse_test_type(int argc, char **argv)
>  	char *buf;
>  	const char *token;
>  
> -	while ((opt = getopt(argc, argv, "s:h")) != -1) {
> +	while ((opt = getopt(argc, argv, "s:c:h")) != -1) {
>  		switch (opt) {
>  		case 's':
>  			anon_order = atoi(optarg);
>  			break;
> +		case 'c':
> +			collapse_order = atoi(optarg);
> +			break;
>  		case 'h':
>  		default:
>  			usage();
> @@ -1148,6 +1236,10 @@ static void parse_test_type(int argc, char **argv)
>  		madvise_context =  &__madvise_context;
>  	} else if (!strcmp(token, "khugepaged")) {
>  		khugepaged_context =  &__khugepaged_context;
> +	} else if (!strcmp(token, "mthp_khugepaged")) {
> +		mthp_khugepaged_context =  &__mthp_khugepaged_context;
> +		if (collapse_order == 0 || collapse_order >= hpage_pmd_order)
> +			usage();
>  	} else if (!strcmp(token, "madvise")) {
>  		madvise_context =  &__madvise_context;
>  	} else {
> @@ -1213,7 +1305,6 @@ static int nr_test_cases;
>  
>  int main(int argc, char **argv)
>  {
> -	int hpage_pmd_order;
>  	struct thp_settings default_settings = {
>  		.thp_enabled = THP_MADVISE,
>  		.thp_defrag = THP_DEFRAG_ALWAYS,
> @@ -1239,10 +1330,6 @@ int main(int argc, char **argv)
>  	if (!thp_is_enabled())
>  		ksft_exit_skip("Transparent Hugepages not available\n");
>  
> -	parse_test_type(argc, argv);
> -
> -	setbuf(stdout, NULL);
> -
>  	page_size = getpagesize();
>  	hpage_pmd_size = read_pmd_pagesize();
>  	if (!hpage_pmd_size)
> @@ -1250,6 +1337,10 @@ int main(int argc, char **argv)
>  	hpage_pmd_nr = hpage_pmd_size / page_size;
>  	hpage_pmd_order = __builtin_ctz(hpage_pmd_nr);
>  
> +	parse_test_type(argc, argv);
> +
> +	setbuf(stdout, NULL);
> +
>  	default_settings.khugepaged.max_ptes_none = hpage_pmd_nr - 1;
>  	default_settings.khugepaged.max_ptes_swap = hpage_pmd_nr / 8;
>  	default_settings.khugepaged.max_ptes_shared = hpage_pmd_nr / 2;
> @@ -1267,6 +1358,8 @@ int main(int argc, char **argv)
>  	TEST(collapse_full, khugepaged_context, read_write_file_read_ops);
>  	TEST(collapse_full, khugepaged_context, read_write_file_write_ops);
>  	TEST(collapse_full, khugepaged_context, shmem_ops);
> +	TEST(collapse_full, mthp_khugepaged_context, anon_ops);
> +	TEST(collapse_full, mthp_khugepaged_context, shmem_ops);
>  	TEST(collapse_full, madvise_context, anon_ops);
>  	TEST(collapse_full, madvise_context, read_only_file_ops);
>  	TEST(collapse_full, madvise_context, read_write_file_read_ops);
> @@ -1274,8 +1367,12 @@ int main(int argc, char **argv)
>  	TEST(collapse_full, madvise_context, shmem_ops);
>  
>  	TEST(collapse_empty, khugepaged_context, anon_ops);
> +	TEST(collapse_empty, mthp_khugepaged_context, anon_ops);
>  	TEST(collapse_empty, madvise_context, anon_ops);
>  
> +	TEST(collapse_single_mthp, mthp_khugepaged_context, anon_ops);
> +	TEST(collapse_single_mthp, mthp_khugepaged_context, shmem_ops);
> +
>  	TEST(collapse_single_pte_entry, khugepaged_context, anon_ops);
>  	TEST(collapse_single_pte_entry, khugepaged_context, read_only_file_ops);
>  	TEST(collapse_single_pte_entry, khugepaged_context, read_write_file_read_ops);
> diff --git a/tools/testing/selftests/mm/run_vmtests.sh b/tools/testing/selftests/mm/run_vmtests.sh
> index 8c296dedf047..c0f4f3e5f1f1 100755
> --- a/tools/testing/selftests/mm/run_vmtests.sh
> +++ b/tools/testing/selftests/mm/run_vmtests.sh
> @@ -411,6 +411,10 @@ CATEGORY="thp" run_test ./khugepaged all:shmem
>  
>  CATEGORY="thp" run_test ./khugepaged -s 4 all:shmem
>  
> +CATEGORY="thp" run_test ./khugepaged -c 4 mthp_khugepaged:anon
> +
> +CATEGORY="thp" run_test ./khugepaged -c 4 mthp_khugepaged:shmem
> +
>  # Try to create XFS if not provided
>  if [ -z "${SPLIT_HUGE_PAGE_TEST_XFS_PATH}" ]; then
>      if test_selected "thp"; then

