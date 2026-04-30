Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CA4A28C009
	for <linux-kselftest@vger.kernel.org>; Thu, 30 Apr 2026 18:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777573917; cv=none; b=LQm0hkVXrhulRkMzq/0xan17TOaIKyzp/9mQLEG1t/tQsxvRamsf50hq6Np0OxI75AEGwGePEMgMFOJUJB86Xc5rIGfwhflMnyjK4VwTzxVNGl4z7KBl/vG9xgzMvdHuxZ4lJVzcFtTviaPgodYY6nvNR/5e/KashF7sIjlslIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777573917; c=relaxed/simple;
	bh=DaCiuVsJRg4gRHrbEnCB6QYVXlJI3p/e3+ain7CpSxQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ktfkbvct1knAPTvpFOnML5+AZMyFwtJbtPtEnEkvBlAgg0WNAKCneHug0KOwNbA3Uvzls3+Ju0r37Mj43A4oX9HFXMbZlvHxBDpP7jof1Fp/8hC/iDtLRIWR65oKpUPUn/ZmfFmFKitq9waIqeInu/NQWF/D3ZXDQksrKWOTaYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=i+XmagGk; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="i+XmagGk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777573914;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TbGELHrPLFOQhp06QpDsqTx/eZpkTPeNIqqLpkLs2KU=;
	b=i+XmagGkY4ZRAA7aNAF7hS9oXIMBoyUIzgdNwhFvIsvdA7c4bSWQWwywkAawqoY6SE9UuA
	GBVBeUuMAjZEi8wt5L9COW0Bksh1tLk7a1Hd7wLAdHxh69LAC22eNSyYGLJS03stUOnLgf
	OlyilqfsQUGLDvaNSzZA7oGL2QHgFkk=
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com
 [74.125.224.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-455-B03Lh4AlOzOJunfr6tfhOw-1; Thu, 30 Apr 2026 14:31:53 -0400
X-MC-Unique: B03Lh4AlOzOJunfr6tfhOw-1
X-Mimecast-MFC-AGG-ID: B03Lh4AlOzOJunfr6tfhOw_1777573912
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-6501528b1caso2213878d50.2
        for <linux-kselftest@vger.kernel.org>; Thu, 30 Apr 2026 11:31:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777573912; x=1778178712;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TbGELHrPLFOQhp06QpDsqTx/eZpkTPeNIqqLpkLs2KU=;
        b=Z+6ias3btPpBgXJCVbRWRAoN19yISQQEbYlCPSSIpQm/CedtJ4o1KV3yLDNwVJ0wpJ
         pDdg7KUNKMIfJsG7k27NDfk39rocdynWX4315COSZL5CsjkTgXHxME/fGb3oiUoflGwH
         unjV6MK26CWofVgr1UmWT0LAFQLKOFZXtgYSpwowEuFm8OlylI/u7IFA99Q8gwwo0XlC
         gdxB+JxoCxGFTV9TgLFu1oDAzCGqsyurEwii3p0ed4iYfFl3c4Zk1u/11Uz/y7E24ifN
         rd4BDU5r3xJOS8C0U4IQVnz+Jei2+mnl0JxIUkvz3MZrl/cR7as0ReZLSd3HQqanDlnY
         j5Og==
X-Forwarded-Encrypted: i=1; AFNElJ9c95No+fpfg5IRyYzYqnJQfqDlWtJzC44rK6fZ5HdhMAtK8WAn3jR2VduSmJfC5wiMT404Br1OBbDZjZWQl2A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1OSIa795Zf5qwdgRojUDD67fWd9KClhDEPX2W9jwfqgnJp48Y
	oEnOs5nBzfUAOPbGplMICWznqFLI9QX5hIQgKSAsM/k28JbgdkFJtdg8YK+4MR+AsTPpGZFKikC
	ujTC0g08t/AXUiZtDuo3RHx+ZydtSwO8ovAonl/ScDI85Q/gKUCS/qNJR5Akd9TkwbLoSLg==
X-Gm-Gg: AeBDieudSGV0nquz0iazN5f0vrsyM/o7mB0ApEefXttoDyF3HWdj8bwE87eH/w6XC5j
	N/lEI8plO6KRLqSxUCgHmTzMi/sS+27EQAqOZ3Qu+xwP6OjuFNdaWc46HGWW72GvSgC5Hxp+7G6
	u/0a4jzPH/e4lISmCSdA/HOTkq+YdeTf0NbIN75CO/3jIAAc7FIYBcU0DqokiO0S1zWuPSitX4w
	Hq+8b9kIk4goxmIWagjHptHVWPBp6tKAKTu7nf7Nb0t0gK0Iwp1d2iyemNx2kCxK/4s/aqFatvU
	7nfA8N58s33LeXYmV6KwWr8KVL1nopMjqrUcTKXi9i6+YJPG6AryBbgEbxOEZubfj6RjtDOpZKb
	bP+dwshmDypAA+IG6UxfTiO7m575ECKuF7R6Le4iZKSctiHjgKd1Xmi8tuwdBpOEX6sUQ7Zw7sh
	PGv1kfqU3Ks+4uh6pSZ9Fz6DQ=
X-Received: by 2002:a05:690e:b48:b0:65c:1f97:2c36 with SMTP id 956f58d0204a3-65c1f972f36mr3030232d50.4.1777573911969;
        Thu, 30 Apr 2026 11:31:51 -0700 (PDT)
X-Received: by 2002:a05:690e:b48:b0:65c:1f97:2c36 with SMTP id 956f58d0204a3-65c1f972f36mr3030035d50.4.1777573910300;
        Thu, 30 Apr 2026 11:31:50 -0700 (PDT)
Received: from [192.168.2.110] (bras-base-aylmpq0104w-grc-22-70-53-202-134.dsl.bell.ca. [70.53.202.134])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b3ff343daasm27187316d6.21.2026.04.30.11.31.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 11:31:49 -0700 (PDT)
Message-ID: <2f443474-4448-462e-bc1e-55bc657d70ba@redhat.com>
Date: Thu, 30 Apr 2026 14:31:48 -0400
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 27/54] selftests/mm: hugepage_settings: add APIs for
 HugeTLB setup and teardown
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
References: <20260428204240.1924129-1-rppt@kernel.org>
 <20260428204240.1924129-28-rppt@kernel.org>
Content-Language: en-US, en-CA
From: Luiz Capitulino <luizcap@redhat.com>
In-Reply-To: <20260428204240.1924129-28-rppt@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2026-04-28 16:42, Mike Rapoport wrote:
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
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---
>   .../testing/selftests/mm/hugepage_settings.c  | 178 +++++++++++++++---
>   .../testing/selftests/mm/hugepage_settings.h  |  30 ++-
>   2 files changed, 183 insertions(+), 25 deletions(-)
> 
> diff --git a/tools/testing/selftests/mm/hugepage_settings.c b/tools/testing/selftests/mm/hugepage_settings.c
> index 4ae7332b5e1b..9d31b53dbc67 100644
> --- a/tools/testing/selftests/mm/hugepage_settings.c
> +++ b/tools/testing/selftests/mm/hugepage_settings.c
> @@ -306,31 +306,12 @@ void thp_restore_settings(void)
>   		thp_write_settings(&saved_settings);
>   }
>   
> -static void thp_restore_settings_atexit(void)
> +static void __thp_save_settings(void)
>   {
> -	thp_restore_settings();
> -}
> -
> -static void thp_restore_settings_sighandler(int sig)
> -{
> -	/* exit() will invoke the thp_restore_settings_atexit handler. */
> -	exit(KSFT_FAIL);
> -}
> +	if (!thp_available())
> +		return;
>   
> -void thp_save_settings(void)
> -{
>   	thp_read_settings(&saved_settings);
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
> -
>   	thp_settings_saved = true;
>   }
>   
> @@ -399,11 +380,31 @@ bool thp_is_enabled(void)
>   	return mode == 1 || mode == 3;
>   }
>   
> +#define HUGETLB_MAX_NR_PAGESIZES 10
> +struct hugetlb_settings {
> +	unsigned long free_hugepages[HUGETLB_MAX_NR_PAGESIZES];

It looks like we don't actually use this in the API or maybe I'm missing
something?

Otherwise, the API looks great to me. But if you allow me to bikeshed :)

I think I'd do:

struct hugetlb_state {
	unsigned long nr_hugepages;
	unsigned long size;
};

struct hugetlb_settings {
	struct hugetlb_state hstate[HUGETLB_MAX_PAGESIZES];
	unsigned long default_size;
	int nr_sizes;
};

Maybe for the future...

> +	unsigned long nr_hugepages[HUGETLB_MAX_NR_PAGESIZES];
> +	unsigned long sizes[HUGETLB_MAX_NR_PAGESIZES];
> +	unsigned long default_size;
> +	int nr_sizes;
> +};
> +
> +static struct hugetlb_settings hugetlb_saved_settings;
> +bool hugetlb_settings_saved;
> +
>   int detect_hugetlb_page_sizes(unsigned long sizes[], int max)
>   {
> -	DIR *dir = opendir("/sys/kernel/mm/hugepages/");
> +	static struct hugetlb_settings *settings = &hugetlb_saved_settings;
> +	DIR *dir;
>   	int count = 0;
>   
> +	if (settings->nr_sizes) {
> +		for (count = 0; count < settings->nr_sizes; count++)
> +			sizes[count] = settings->sizes[count];
> +		return settings->nr_sizes;
> +	}
> +
> +	dir = opendir("/sys/kernel/mm/hugepages/");
>   	if (!dir)
>   		return 0;
>   
> @@ -427,11 +428,16 @@ int detect_hugetlb_page_sizes(unsigned long sizes[], int max)
>   
>   unsigned long default_huge_page_size(void)
>   {
> +	static struct hugetlb_settings *settings = &hugetlb_saved_settings;
>   	unsigned long hps = 0;
>   	char *line = NULL;
>   	size_t linelen = 0;
> -	FILE *f = fopen("/proc/meminfo", "r");
> +	FILE *f;
>   
> +	if (settings->default_size)
> +		return settings->default_size;
> +
> +	f = fopen("/proc/meminfo", "r");
>   	if (!f)
>   		return 0;
>   	while (getline(&line, &linelen, f) > 0) {
> @@ -479,3 +485,127 @@ unsigned long hugetlb_free_pages(unsigned long size)
>   
>   	return read_num(path);
>   }
> +
> +bool hugetlb_setup_default(unsigned long nr)
> +{
> +	unsigned long size;
> +
> +	hugetlb_save_settings();
> +
> +	size = default_huge_page_size();
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
> +	/* If HugeTLB is supported, request 2 HugeTLB pages of every size. */
> +	for (int i = 0; i < nr_enabled; i++) {
> +		hugetlb_set_nr_pages(enabled[i], nr);
> +		if (hugetlb_free_pages(enabled[i]) < nr)
> +			continue;
> +
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
> +
> +		settings->free_hugepages[i] = hugetlb_free_pages(sz);
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
> +	/* exit() will invoke the hugetlb_restore_settings_atexit handler. */
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
> +	 * setup exit hooks to make sure THP settings are restored on graceful
> +	 * and error exits and signals
> +	 */
> +	atexit(hugepage_restore_settings_atexit);
> +	signal(SIGTERM, hugepage_restore_settings_sighandler);
> +	signal(SIGINT, hugepage_restore_settings_sighandler);
> +	signal(SIGHUP, hugepage_restore_settings_sighandler);
> +	signal(SIGQUIT, hugepage_restore_settings_sighandler);
> +}
> diff --git a/tools/testing/selftests/mm/hugepage_settings.h b/tools/testing/selftests/mm/hugepage_settings.h
> index 57fbf2f57e13..d6a1b4e5f734 100644
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
> @@ -127,4 +140,19 @@ static inline unsigned long hugetlb_free_default_pages(void)
>   	return hugetlb_free_pages(size);
>   }
>   
> +static inline bool hugetlb_available(void)
> +{
> +	return default_huge_page_size() != 0;
> +}
> +
> +bool hugetlb_setup_default(unsigned long nr);
> +unsigned long hugetlb_setup(unsigned long nr, unsigned long sizes[],
> +			    int max);
> +
> +#define HUGETLB_SETUP_DEFAULT_PAGES(nr_pages) \
> +static void __attribute__((constructor)) __hugetlb_setup_default(void)	\
> +{									\
> +	hugetlb_setup_default((nr_pages));				\
> +}
> +
>   #endif /* __THP_SETTINGS_H__ */

