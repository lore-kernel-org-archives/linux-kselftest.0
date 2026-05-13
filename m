Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E64D13B8131
	for <linux-kselftest@vger.kernel.org>; Wed, 13 May 2026 19:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778701849; cv=none; b=XuLsNb7yM7AERiOa+ak6Swn0wDRTcdRiCkJ0omOcvAdlGO8fNPCCPnYZrWqw4FccT6PYLHqGQFhvOf1q4XwpuD9cIV8MVSv5IaKs5Wayw78tlMaCet/rddH88trBIajyEzdZCh4m7je5SS+mAau8a8Xn84AzLT6yUF+SA9pa/qY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778701849; c=relaxed/simple;
	bh=mJ0MV0ZsxaRR0Me62udAoVdtG/H/oAS/717Axfe/UB4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Eed6XjGq/sCIRPCdanSOSZnlxAvQI6EiCk6gIppzk7YoQRCO5ZReEIxmTePsAo8G6D//xet7wvwhn968+DJMeWKMj0BESFYgaiUJNm+iod1+4UD2axeKKHcS0VZM4an3dlVnRboSW8dAvSCRITGXxQfEiBk/Zc+jITeRy6GhBuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DUWj84yB; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DUWj84yB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778701844;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Tznq59GQix5Xa32WSC2NKVF0l1LzcTg3d6SxGF8a4kQ=;
	b=DUWj84yBhPzQbvJoZ6Uxb5ObIrUEv9vaTQEbayv17q6peHWtHKwoPCyyIlqkmjnLgus9iL
	eGKFISOQP5RGLlGkVCzEHbs1Tzv3Ra8uMe4x7RbwgdsQI/hH9nMHqQcDGRNC6cptNrgbmO
	0cI6Z3Xq/gxeUt7nwvH3tt8oX2R/x/U=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-590-m6ZCHibTNEqzTbguWaZpmw-1; Wed, 13 May 2026 15:50:42 -0400
X-MC-Unique: m6ZCHibTNEqzTbguWaZpmw-1
X-Mimecast-MFC-AGG-ID: m6ZCHibTNEqzTbguWaZpmw_1778701842
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8acb26fbbb2so100599076d6.2
        for <linux-kselftest@vger.kernel.org>; Wed, 13 May 2026 12:50:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778701842; x=1779306642;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tznq59GQix5Xa32WSC2NKVF0l1LzcTg3d6SxGF8a4kQ=;
        b=Ox4GzTWI8vzkvXZLYSHGFz+sOM13XTtUJVkacWkc/JO7sQSx+1BeIzdJAMurSfWtLL
         e8J7eyGisHWlxUjmszfs9TF3hTihGUfEcPnl6vZdUq558bZP7P4jB68NSdSEieAo4J5L
         hGHugAxx0Dm30bznXbx+mL5VMYr6HJXerXtPutfH5rNse8wEscyw2alnzbyNu8bdAY+u
         SEoV0lzNB20eoX0ehRhSOIr/x60nk3lYb1buaUsCSbAfqLwogHaAUyuKYa9mPshy8c7h
         vTgLTtbyhFIX414S6KOePJ7UdulNiqnOPzcafPACxUYpcrx6oyoxSp8KBAt/H895wLhH
         ozOg==
X-Forwarded-Encrypted: i=1; AFNElJ8PD2WXuBuOkwJcXOCiyu3lzwqp+PuPJoQU/pqC5OQ+K1XvqCsT5TAEF8TwvQzXvPivUb3d4KaiLJrN0SKZKEU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwD0e9DGTj6ocUyYg+s6wS1qfPl1WIvXHmnlVYvbrFxNTF/liyY
	I59DwMgIKaVSm4+FXG+A6Nj0bXgnUaKhqnCuOFpZiLRq9/9THqr5tkU6ZivEWh9AME/jL+3z/oS
	lbGWtRTal2EFWWxwS1/e+DxNmpsBY9elvgZdXUpFBOTpGnEKHE5ml8cxR+2nF+BLsEJcg3g==
X-Gm-Gg: Acq92OGelh9ReyGGl6gs5oUFN8PjHJBHE6rwkbq3gp4X/XU9hdRCaCtjH2/qHOfm6Z4
	Lf95unpPws3QxgGjjfyUO4Cy/Wblb88pU18PPzC1kH4rJSHn8SDFALVwAd832PgqaSN+skv5ASG
	iYKs+YJ0GajzEZJZK6cCavdf27cjY8IHEAY9Avp17OtK6PR+RuGULgyd2wBlY3Cqc/JP2ONGPCV
	Wl+sHIBiy3heg7feL8wo7vsEQDl4+E7T7tOK3a/9dS8a+8YJwFm99bFo/Rvl1qqJ588vRhCpBHm
	yStNCpHok6BAEXkwcCpuiXkwKayhzA4PtZHWmREv/Z3RpStZaxTKoCIwjU8SR9jB5OoU94YYlrs
	Cmd3S/4AaUT8cGNAckcksVC7vy9IhRdafORORIOjDmdl6WCQaKzG5vS86RqA/Mv9hdPF6MFm5i4
	Q34pznbGj1FQaJ
X-Received: by 2002:a05:6214:ca2:b0:8ac:a553:528c with SMTP id 6a1803df08f44-8c7dfdbab72mr69192646d6.42.1778701841751;
        Wed, 13 May 2026 12:50:41 -0700 (PDT)
X-Received: by 2002:a05:6214:ca2:b0:8ac:a553:528c with SMTP id 6a1803df08f44-8c7dfdbab72mr69191846d6.42.1778701841137;
        Wed, 13 May 2026 12:50:41 -0700 (PDT)
Received: from [192.168.2.110] (bras-base-aylmpq0104w-grc-22-70-53-202-134.dsl.bell.ca. [70.53.202.134])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8c90b2db84asm4478246d6.29.2026.05.13.12.50.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 12:50:40 -0700 (PDT)
Message-ID: <635a6440-9339-49fb-ad9b-ee2f4b285ef6@redhat.com>
Date: Wed, 13 May 2026 15:50:39 -0400
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 28/55] selftests/mm: hugepage_settings: add APIs for
 HugeTLB setup and teardown
To: Mike Rapoport <rppt@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>,
 Barry Song <baohua@kernel.org>, Dev Jain <dev.jain@arm.com>,
 Donet Tom <donettom@linux.ibm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 John Hubbard <jhubbard@nvidia.com>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Lance Yang <lance.yang@linux.dev>,
 Li Wang <li.wang@linux.dev>, Leon Romanovsky <leon@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>, Mark Brown <broonie@kernel.org>,
 Michal Hocko <mhocko@suse.com>, Nico Pache <npache@redhat.com>,
 Peter Xu <peterx@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Sarthak Sharma <sarthak.sharma@arm.com>, Shuah Khan <shuah@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@kernel.org>,
 Zi Yan <ziy@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-mm@kvack.org
References: <20260511162840.375890-1-rppt@kernel.org>
 <20260511162840.375890-29-rppt@kernel.org>
Content-Language: en-US, en-CA
From: Luiz Capitulino <luizcap@redhat.com>
In-Reply-To: <20260511162840.375890-29-rppt@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2026-05-11 12:28, Mike Rapoport wrote:
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> 
> A lot of tests require free HugeTLB pages. Some need just a few default
> huge pages, some need a certain amount of memory available as HugeTLB, and
> some just skip lots of tests if huge pages of all supported sizes are not
> available.
> 
> This all resulted in a huge mess in run_vmtests.sh that sets up some huge
> pages, adjusts them later and restores some of the settings if the stars
> align.
> 
> Add APIs that allow saving the state of HugeTLB and setting up the desired
> amount of HugeTLB pages.
> 
> Saving the state also registers atexit() callback and signal handler that
> will ensure restoration of HugeTLB state.
> 
> Since many tests use both HugeTLB and THP, the atexit() callbacks and
> signal handler are restoring both.
> 
> For kselftest_harness tests that run fixture setups and test in child
> processes add a constructor that will save and restore settings in the main
> process.
> 
> Tested-by: Luiz Capitulino <luizcap@redhat.com>
> Tested-by: Sarthak Sharma <sarthak.sharma@arm.com>
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---
>   .../testing/selftests/mm/hugepage_settings.c  | 205 ++++++++++++++++--
>   .../testing/selftests/mm/hugepage_settings.h  |  31 ++-
>   2 files changed, 213 insertions(+), 23 deletions(-)
> 
> diff --git a/tools/testing/selftests/mm/hugepage_settings.c b/tools/testing/selftests/mm/hugepage_settings.c
> index 3c944d28d14a..01a557f372d1 100644
> --- a/tools/testing/selftests/mm/hugepage_settings.c
> +++ b/tools/testing/selftests/mm/hugepage_settings.c
> @@ -306,31 +306,16 @@ void thp_restore_settings(void)
>   		thp_write_settings(&saved_settings);
>   }
>   
> -static void thp_restore_settings_atexit(void)
> +static void __thp_save_settings(void)
>   {
> -	thp_restore_settings();
> -}
> +	if (!thp_available())
> +		return;
>   
> -static void thp_restore_settings_sighandler(int sig)
> -{
> -	/* exit() will invoke the thp_restore_settings_atexit handler. */
> -	exit(KSFT_FAIL);
> -}
> +	if (thp_settings_saved)
> +		return;
>   
> -void thp_save_settings(void)
> -{
>   	thp_read_settings(&saved_settings);
>   	thp_settings_saved = true;
> -
> -	/*
> -	 * setup exit hooks to make sure THP settings are restored on graceful
> -	 * and error exits and signals
> -	 */
> -	atexit(thp_restore_settings_atexit);
> -	signal(SIGTERM, thp_restore_settings_sighandler);
> -	signal(SIGINT, thp_restore_settings_sighandler);
> -	signal(SIGHUP, thp_restore_settings_sighandler);
> -	signal(SIGQUIT, thp_restore_settings_sighandler);
>   }
>   
>   void thp_set_read_ahead_path(char *path)
> @@ -398,11 +383,32 @@ bool thp_is_enabled(void)
>   	return mode == 1 || mode == 3;
>   }
>   
> +#define HUGETLB_MAX_NR_PAGESIZES 10
> +struct hugetlb_settings {
> +	unsigned long nr_hugepages[HUGETLB_MAX_NR_PAGESIZES];
> +	unsigned long sizes[HUGETLB_MAX_NR_PAGESIZES];
> +	unsigned long default_size;
> +	int nr_sizes;
> +};
> +
> +static struct hugetlb_settings hugetlb_saved_settings;
> +static bool hugetlb_settings_saved;
> +
>   int detect_hugetlb_page_sizes(unsigned long sizes[], int max)
>   {
> -	DIR *dir = opendir("/sys/kernel/mm/hugepages/");
> +	static struct hugetlb_settings *settings = &hugetlb_saved_settings;
> +	DIR *dir;
>   	int count = 0;
>   
> +	if (settings->nr_sizes) {
> +		if (settings->nr_sizes < max)
> +			max = settings->nr_sizes;
> +		for (count = 0; count < max; count++)
> +			sizes[count] = settings->sizes[count];
> +		return count;
> +	}
> +
> +	dir = opendir("/sys/kernel/mm/hugepages/");
>   	if (!dir)
>   		return 0;
>   
> @@ -426,11 +432,16 @@ int detect_hugetlb_page_sizes(unsigned long sizes[], int max)
>   
>   unsigned long default_huge_page_size(void)
>   {
> +	static struct hugetlb_settings *settings = &hugetlb_saved_settings;
>   	unsigned long hps = 0;
>   	char *line = NULL;
>   	size_t linelen = 0;
> -	FILE *f = fopen("/proc/meminfo", "r");
> +	FILE *f;
> +
> +	if (settings->default_size)
> +		return settings->default_size;
>   
> +	f = fopen("/proc/meminfo", "r");
>   	if (!f)
>   		return 0;
>   	while (getline(&line, &linelen, f) > 0) {
> @@ -478,3 +489,153 @@ unsigned long hugetlb_free_pages(unsigned long size)
>   
>   	return read_num(path);
>   }
> +
> +static bool __hugetlb_setup(unsigned long size, unsigned long nr)
> +{
> +	unsigned long free = hugetlb_free_pages(size);
> +	unsigned long total = hugetlb_nr_pages(size);
> +
> +	if (free >= nr)
> +		return true;
> +
> +	hugetlb_set_nr_pages(size, total + (nr - free));

We're using 'total' to preserve the HugeTLB reservation that's already
there, right? I guess this won't have the desirable effect because the
tests calling hugetlb_setup_default_exact() will override this anyways.

Having said that, this is just a minor nit and not a bug, so:

Reviewed-by: Luiz Capitulino <luizcap@redhat.com>

> +
> +	return hugetlb_free_pages(size) >= nr;
> +}
> +
> +bool hugetlb_setup_default(unsigned long nr)
> +{
> +	unsigned long size;
> +
> +	hugetlb_save_settings();
> +	size = default_huge_page_size();
> +	if (!size)
> +		return false;
> +
> +	return __hugetlb_setup(size, nr);
> +}
> +
> +bool hugetlb_setup_default_exact(unsigned long nr)
> +{
> +	unsigned long size;
> +
> +	hugetlb_save_settings();
> +	size = default_huge_page_size();
> +	if (!size)
> +		return false;
> +
> +	hugetlb_set_nr_pages(size, nr);
> +
> +	return hugetlb_free_pages(size) == nr;
> +}
> +
> +unsigned long hugetlb_setup(unsigned long nr, unsigned long sizes[],
> +			    int max)
> +{
> +	unsigned long enabled[10];
> +	int nr_sizes = 0;
> +	int nr_enabled;
> +
> +	hugetlb_save_settings();
> +
> +	nr_enabled = detect_hugetlb_page_sizes(enabled, ARRAY_SIZE(enabled));
> +	if (!nr_enabled)
> +		return 0;
> +
> +	if (nr_enabled > max) {
> +		ksft_print_msg("detected %d huge page sizes, will only test %d\n", nr_enabled, max);
> +		nr_enabled = max;
> +	}
> +
> +	/* request nr HugeTLB pages of every size. */
> +	for (int i = 0; i < nr_enabled; i++) {
> +		if (!__hugetlb_setup(enabled[i], nr))
> +			continue;
> +		sizes[nr_sizes++] = enabled[i];
> +	}
> +
> +	return nr_sizes;
> +}
> +
> +static void __hugetlb_save_settings(void)
> +{
> +	struct hugetlb_settings *settings = &hugetlb_saved_settings;
> +	int nr_sizes;
> +
> +	if (hugetlb_settings_saved)
> +		return;
> +
> +	settings->default_size = default_huge_page_size();
> +	if (!settings->default_size)
> +		return;
> +
> +	nr_sizes = detect_hugetlb_page_sizes(settings->sizes,
> +					     HUGETLB_MAX_NR_PAGESIZES);
> +	if (!nr_sizes) {
> +		settings->default_size = 0;
> +		return;
> +	}
> +
> +	for (int i = 0; i < nr_sizes; i++) {
> +		unsigned long sz = settings->sizes[i];
> +
> +		if (!sz)
> +			continue;
> +		settings->nr_hugepages[i] = hugetlb_nr_pages(sz);
> +	}
> +
> +	settings->nr_sizes = nr_sizes;
> +	hugetlb_settings_saved = true;
> +}
> +
> +void hugetlb_restore_settings(void)
> +{
> +	struct hugetlb_settings *settings = &hugetlb_saved_settings;
> +
> +	if (!hugetlb_settings_saved || !settings->default_size)
> +		return;
> +
> +	for (int i = 0; i < HUGETLB_MAX_NR_PAGESIZES; i++) {
> +		unsigned long sz = settings->sizes[i];
> +
> +		if (!sz)
> +			continue;
> +
> +		hugetlb_set_nr_pages(sz, settings->nr_hugepages[i]);
> +	}
> +}
> +
> +static void hugepage_restore_settings_atexit(void)
> +{
> +	if (thp_settings_saved)
> +		thp_restore_settings();
> +	if (hugetlb_settings_saved)
> +		hugetlb_restore_settings();
> +}
> +
> +static void hugepage_restore_settings_sighandler(int sig)
> +{
> +	/* exit() will invoke the hugepage_restore_settings_atexit handler. */
> +	exit(KSFT_FAIL);
> +}
> +
> +void hugepage_save_settings(bool thp, bool hugetlb)
> +{
> +	if (!thp && !hugetlb)
> +		return;
> +
> +	if (thp)
> +		__thp_save_settings();
> +	if (hugetlb)
> +		__hugetlb_save_settings();
> +
> +	/*
> +	 * setup exit hooks to make sure THP and HugeTLB settings are
> +	 * restored on graceful and error exits and signals
> +	 */
> +	atexit(hugepage_restore_settings_atexit);
> +	signal(SIGTERM, hugepage_restore_settings_sighandler);
> +	signal(SIGINT, hugepage_restore_settings_sighandler);
> +	signal(SIGHUP, hugepage_restore_settings_sighandler);
> +	signal(SIGQUIT, hugepage_restore_settings_sighandler);
> +}
> diff --git a/tools/testing/selftests/mm/hugepage_settings.h b/tools/testing/selftests/mm/hugepage_settings.h
> index 436f4ce02984..c07722b7f102 100644
> --- a/tools/testing/selftests/mm/hugepage_settings.h
> +++ b/tools/testing/selftests/mm/hugepage_settings.h
> @@ -6,6 +6,8 @@
>   #include <stddef.h>
>   #include <stdint.h>
>   
> +void hugepage_save_settings(bool thp, bool hugetlb);
> +
>   /* Transparent Huge Pages (THP) */
>   
>   enum thp_enabled {
> @@ -79,7 +81,11 @@ struct thp_settings *thp_current_settings(void);
>   void thp_push_settings(struct thp_settings *settings);
>   void thp_pop_settings(void);
>   void thp_restore_settings(void);
> -void thp_save_settings(void);
> +
> +static inline void thp_save_settings(void)
> +{
> +	hugepage_save_settings(/* thp = */ true, /* hugetlb = */ false);
> +}
>   
>   void thp_set_read_ahead_path(char *path);
>   unsigned long thp_supported_orders(void);
> @@ -97,6 +103,13 @@ unsigned long hugetlb_nr_pages(unsigned long size);
>   void hugetlb_set_nr_pages(unsigned long size, unsigned long nr);
>   unsigned long hugetlb_free_pages(unsigned long size);
>   
> +static inline void hugetlb_save_settings(void)
> +{
> +	hugepage_save_settings(/* thp = */ false, /* hugetlb = */ true);
> +}
> +
> +void hugetlb_restore_settings(void);
> +
>   static inline unsigned long hugetlb_nr_default_pages(void)
>   {
>   	unsigned long size = default_huge_page_size();
> @@ -127,4 +140,20 @@ static inline unsigned long hugetlb_free_default_pages(void)
>   	return hugetlb_free_pages(size);
>   }
>   
> +static inline bool hugetlb_available(void)
> +{
> +	return default_huge_page_size() != 0;
> +}
> +
> +bool hugetlb_setup_default(unsigned long nr);
> +bool hugetlb_setup_default_exact(unsigned long nr);
> +unsigned long hugetlb_setup(unsigned long nr, unsigned long sizes[],
> +			    int max);
> +
> +#define HUGETLB_SETUP_DEFAULT_PAGES(nr_pages) \
> +static void __attribute__((constructor)) __hugetlb_setup_default(void)	\
> +{									\
> +	hugetlb_setup_default((nr_pages));				\
> +}
> +
>   #endif /* __HUGEPAGE_SETTINGS_H__ */

