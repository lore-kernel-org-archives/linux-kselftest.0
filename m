Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE1B1A9F8D
	for <linux-kselftest@vger.kernel.org>; Fri,  1 May 2026 19:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777663841; cv=none; b=WTKaWJdU+TVFAgqlSY2wIVzgsWYQpluErJ33mLF6F0ejNTWxYD8NRJkXEvrGiCSEGSakPbISeObX4t94lb36r8w16n79eJ0WPGDHaEEZELaz716K96UhmMxgmji61c+IzN2V9Ho2QbpRYGiEuNs3i21OwEaN2hP6Qd6OJEaXzLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777663841; c=relaxed/simple;
	bh=t6gV8ZTVNcPcUe/WL1axDSqM/r1XnESKvaxKRDEPyZ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yiy5+8pZQ+UKC2wqF7/oAwhCbbBUPYCEJpi8wYBO4NqBcFyYJvcXzPKoibbwF7HsuhFlNR2GOEVpaaFGQyJq16zyJf8rfunA/3wnhyasJyQwDG1T7x/cgTAwPtqvRO990fRROqyyebkHlKOgD3R7+XUyJYHfgKTmUhhdFSFGUO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YfxcLR+4; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YfxcLR+4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777663839;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=axtkg8lWUKLhKh8btqTTKn3GGcdeBh87rxcslGFSOgo=;
	b=YfxcLR+4x7dlNQw47Rmcs1WY+/FoEgMGuRzqwjAkplH3NgCGQ7hhzjoob0Bn0FeNRQWFry
	Ruo10+WOKGuc6M5Lns4WhnlJOKfvesK+ZyuWD0fqGnZuF4smQtqLXC7gxvlIxWLdce8JEG
	M5O0elVp0GvGkLUkwmCgwXetsjpvp08=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-580-YQ20UlSjPFK1tBDalpnmeA-1; Fri, 01 May 2026 15:30:37 -0400
X-MC-Unique: YQ20UlSjPFK1tBDalpnmeA-1
X-Mimecast-MFC-AGG-ID: YQ20UlSjPFK1tBDalpnmeA_1777663836
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8eaee67d1afso267521985a.1
        for <linux-kselftest@vger.kernel.org>; Fri, 01 May 2026 12:30:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777663836; x=1778268636;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=axtkg8lWUKLhKh8btqTTKn3GGcdeBh87rxcslGFSOgo=;
        b=nUDA6xj6ZjmdxhKMwrGFdamKHgB7iKTi8Bstl1TB7I2lZO39+I3Xo1zXyrDBP0kd7h
         h2+343yv6nxITPLjP8AzUQcXpx/3EbtXbDxq5pOsyFvu0j+SdSPFz0vu0O54zGBqM5tB
         4QFDPD2+qRNBJvZPyN/1nUWJxAiQKYFKR03rxgSPe3Zte5mWpnzCxOuks0/h1WZ3wuy/
         gMPzIQ9AJ9kIxWKnb9CkJVnZ7kF5sMc0fvYIwbTIP18yOS5D8jN0g6vC1Jt1rGINbW2/
         MQ0FiG/ETXIaCXO6fqLzxJdeoxDDM9T8WgW9VUdGgoNyv6PqtP0tvqHh0GmkEI/x2Scy
         pNnA==
X-Forwarded-Encrypted: i=1; AFNElJ+0U7CtP8s8xltszu/NQOIZpUpCPkaKUmpEcogArmrmd8zpn/oIwjiBXkKKgrHT8mxf167AYSW7jCuqHKUzQD8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyupwwnAFIRAsowfKQ5NNbs13yAPfdi2PWlO2/8QafNpCU+57bx
	msMkA67AZj9z+4FADCD4ZonSq2AoS5pTZvPKX+ZwIAZHi04fCbfLPkuqNa0X0bDNL4o/J1oungZ
	kqAkJKE/760DKO2FoEUT4CiWU4u0o9B4P4ikkSj4oEzJilMwKrGLIwByGqVKxj/VP9HM1aw==
X-Gm-Gg: AeBDietVYhJfw+L+QsC1eJ3NVf5iCErlpBGrfAfg+9CVKZ7i6tON55BqV+DdAYqu/MN
	pNC2tiVL3dftCdc5crCblNGagS99Ax2kD9zKHERUnUKcf5SsODScXb+YeorNTeb/skvBCCZP8ES
	3xqwzecgcb1Pun/upKV3vJsJPbyAdwfDmF7bQCgqoiPR3hECvXx4AFvF2huapulOuOFDnO59al5
	48PkY94qNBWjbUvZetvuti2/f+fKZ8hbGrjgE13dAM1gbo+VkDA4eFpOjTh8lDfeVYypdBGvBBj
	Nc00nVEwL2GM0Ew9che9psvITWP/Ab74mxq37crFtXhHJAr7MOOXMvxaKZ/J3NSnEDgBB9Y2mDD
	2ZccSx4Pnr6o+b+urso0vrim5AYYyBF1PQNILiLeITXzVPgABzxh5HJ7NsGFUGgBBWXQ6r0UGWL
	6t1sXdIExvzgM+A6qEgfIw/M4=
X-Received: by 2002:a05:620a:28c1:b0:8ed:2b66:9ebd with SMTP id af79cd13be357-8fd15ecc8b2mr102078685a.9.1777663836060;
        Fri, 01 May 2026 12:30:36 -0700 (PDT)
X-Received: by 2002:a05:620a:28c1:b0:8ed:2b66:9ebd with SMTP id af79cd13be357-8fd15ecc8b2mr101915285a.9.1777663825495;
        Fri, 01 May 2026 12:30:25 -0700 (PDT)
Received: from [192.168.2.110] (bras-base-aylmpq0104w-grc-22-70-53-202-134.dsl.bell.ca. [70.53.202.134])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8fc2c91fb3bsm235197885a.41.2026.05.01.12.30.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 May 2026 12:30:25 -0700 (PDT)
Message-ID: <22b1cadc-4b0d-4e2a-987c-e7a7bc2265eb@redhat.com>
Date: Fri, 1 May 2026 15:30:18 -0400
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 27/54] selftests/mm: hugepage_settings: add APIs for
 HugeTLB setup and teardown
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, Barry Song <baohua@kernel.org>,
 Dev Jain <dev.jain@arm.com>, Donet Tom <donettom@linux.ibm.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lance Yang <lance.yang@linux.dev>, Leon Romanovsky <leon@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>, Mark Brown <broonie@kernel.org>,
 Michal Hocko <mhocko@suse.com>, Nico Pache <npache@redhat.com>,
 Peter Xu <peterx@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Sarthak Sharma <sarthak.sharma@arm.com>, Shuah Khan <shuah@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@kernel.org>,
 Zi Yan <ziy@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-mm@kvack.org
References: <20260428204240.1924129-1-rppt@kernel.org>
 <20260428204240.1924129-28-rppt@kernel.org>
 <2f443474-4448-462e-bc1e-55bc657d70ba@redhat.com>
 <afTF9RCy8eBoWYaj@kernel.org>
Content-Language: en-US, en-CA
From: Luiz Capitulino <luizcap@redhat.com>
In-Reply-To: <afTF9RCy8eBoWYaj@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2026-05-01 11:25, Mike Rapoport wrote:
> On Thu, Apr 30, 2026 at 02:31:48PM -0400, Luiz Capitulino wrote:
>> On 2026-04-28 16:42, Mike Rapoport wrote:
>>> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
>>>
>>> A lot of tests require free HugeTLB pages. Some need just a few default
>>> huge pages, some need a certain amount of memory available as HugeTLB, and
>>> some just skip lots of tests if huge pages of all supported sizes are not
>>> available.
>>>
>>> This all resulted in a huge mess in run_vmtests.sh that sets up some huge
>>> pages, adjusts them later and restores some of the settings if the stars
>>> align.
>>>
>>> Add APIs that allow saving the state of HugeTLB and setting up the desired
>>> amount of HugeTLB pages.
>>>
>>> Saving the state also registers atexit() callback and signal handler that
>>> will ensure restoration of HugeTLB state.
>>>
>>> Since many tests use both HugeTLB and THP, the atexit() callbacks and
>>> signal handler are restoring both.
>>>
>>> For kselftest_harness tests that run fixture setups and test in child
>>> processes add a constructor that will save and restore settings in the main
>>> process.
>>>
>>> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
>>> ---
>>>    .../testing/selftests/mm/hugepage_settings.c  | 178 +++++++++++++++---
>>>    .../testing/selftests/mm/hugepage_settings.h  |  30 ++-
>>>    2 files changed, 183 insertions(+), 25 deletions(-)
>>>
>>> diff --git a/tools/testing/selftests/mm/hugepage_settings.c b/tools/testing/selftests/mm/hugepage_settings.c
>>> index 4ae7332b5e1b..9d31b53dbc67 100644
>>> --- a/tools/testing/selftests/mm/hugepage_settings.c
>>> +++ b/tools/testing/selftests/mm/hugepage_settings.c
>>> @@ -306,31 +306,12 @@ void thp_restore_settings(void)
>>>    		thp_write_settings(&saved_settings);
>>>    }
>>> -static void thp_restore_settings_atexit(void)
>>> +static void __thp_save_settings(void)
>>>    {
>>> -	thp_restore_settings();
>>> -}
>>> -
>>> -static void thp_restore_settings_sighandler(int sig)
>>> -{
>>> -	/* exit() will invoke the thp_restore_settings_atexit handler. */
>>> -	exit(KSFT_FAIL);
>>> -}
>>> +	if (!thp_available())
>>> +		return;
>>> -void thp_save_settings(void)
>>> -{
>>>    	thp_read_settings(&saved_settings);
>>> -
>>> -	/*
>>> -	 * setup exit hooks to make sure THP settings are restored on graceful
>>> -	 * and error exits and signals
>>> -	 */
>>> -	atexit(thp_restore_settings_atexit);
>>> -	signal(SIGTERM, thp_restore_settings_sighandler);
>>> -	signal(SIGINT, thp_restore_settings_sighandler);
>>> -	signal(SIGHUP, thp_restore_settings_sighandler);
>>> -	signal(SIGQUIT, thp_restore_settings_sighandler);
>>> -
>>>    	thp_settings_saved = true;
>>>    }
>>> @@ -399,11 +380,31 @@ bool thp_is_enabled(void)
>>>    	return mode == 1 || mode == 3;
>>>    }
>>> +#define HUGETLB_MAX_NR_PAGESIZES 10
>>> +struct hugetlb_settings {
>>> +	unsigned long free_hugepages[HUGETLB_MAX_NR_PAGESIZES];
>>
>> It looks like we don't actually use this in the API or maybe I'm missing
>> something?
> 
> Yes, it's used only in later patches.

I don't see it, the patch below builds fine (again, sorry in advance if
I'm missing something obvious):

diff --git a/tools/testing/selftests/mm/hugepage_settings.c b/tools/testing/selftests/mm/hugepage_settings.c
index 097ba085f423..a023cfeb69c5 100644
--- a/tools/testing/selftests/mm/hugepage_settings.c
+++ b/tools/testing/selftests/mm/hugepage_settings.c
@@ -341,7 +341,6 @@ bool thp_is_enabled(void)
  
  #define HUGETLB_MAX_NR_PAGESIZES 10
  struct hugetlb_settings {
-	unsigned long free_hugepages[HUGETLB_MAX_NR_PAGESIZES];
  	unsigned long nr_hugepages[HUGETLB_MAX_NR_PAGESIZES];
  	unsigned long sizes[HUGETLB_MAX_NR_PAGESIZES];
  	unsigned long default_size;
@@ -509,7 +508,6 @@ static void __hugetlb_save_settings(void)
  		if (!sz)
  			continue;
  
-		settings->free_hugepages[i] = hugetlb_free_pages(sz);
  		settings->nr_hugepages[i] = hugetlb_nr_pages(sz);
  	}
  

> I felt it would be too churny to add users in this patch.
>   
>> Otherwise, the API looks great to me. But if you allow me to bikeshed :)
>>
>> I think I'd do:
>>
>> struct hugetlb_state {
>> 	unsigned long nr_hugepages;
>> 	unsigned long size;
>> };
>>
>> struct hugetlb_settings {
>> 	struct hugetlb_state hstate[HUGETLB_MAX_PAGESIZES];
>> 	unsigned long default_size;
>> 	int nr_sizes;
>> };
> 
> It might be slightly nicer abstraction but ...
>   
>>> +static void __hugetlb_save_settings(void)
>>> +{
>>> +	struct hugetlb_settings *settings = &hugetlb_saved_settings;
>>> +	int nr_sizes;
>>> +
>>> +	settings->default_size = default_huge_page_size();
>>> +	if (!settings->default_size)
>>> +		return;
>>> +
>>> +	nr_sizes = detect_hugetlb_page_sizes(settings->sizes,
>>> +					     HUGETLB_MAX_NR_PAGESIZES);
> 
> ... this immediately becomes more complex.
> 
>>> +	if (!nr_sizes) {
>>> +		settings->default_size = 0;
>>> +		return;
>>> +	}
>>> +
>>> +	for (int i = 0; i < nr_sizes; i++) {
>>> +		unsigned long sz = settings->sizes[i];
>>> +
>>> +		if (!sz)
>>> +			continue;
>>> +
>>> +		settings->free_hugepages[i] = hugetlb_free_pages(sz);
>>> +		settings->nr_hugepages[i] = hugetlb_nr_pages(sz);
> 
> And this as well.

We'd need a little more code to handle those cases, may or may not be
worth it. But enough bikesheding from my side :) the series is great as
is.

