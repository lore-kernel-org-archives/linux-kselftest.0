Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9D2842B75A
	for <linux-kselftest@vger.kernel.org>; Thu, 30 Apr 2026 17:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777570424; cv=none; b=dkXNOcArUdTB6n8IRVLP+VBDQhbCR6Xeem1GYsGyQPGWaUDSOJBQIIECsyLUWG2zD3KNfy5/0jPpPKJgdWKDXmbIZydsDEqWNwIkMcgJhCQIJxVaXIB1nsUw6+4Gj6O28WgP7tTBoVDAnA2KxDfL2z6xkoZD6/mkbsM8johMZIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777570424; c=relaxed/simple;
	bh=4k3DgSQ0WBAmpji4n40XI07xa43uXhv0QSkw3tIqCDs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CcNV1z0F3kMjjkgTXOdPyr1QkIMlhD17dBHdVHvDm62sKxbieU77ieykCiF3Up+5OIYoLCSCUGrIPm+51AMUCktvRuuyLTQQX5iSfrBvaVy/oClYD78NalZPmra1elIV6cmvrNJEDoSBRzXBu3di2Gz/pCdowgnD4So0MHHjB30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Mw06pZJU; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Mw06pZJU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777570422;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nmMXCvWSvShhSGiDPE3bbKH2xIBX1MBTYvUc5Sk23wc=;
	b=Mw06pZJUddj/w+OmOdYk0bDhVXb8pxnCbpCgPIyt5uJ/E218RxUoBooMj8bdlsZrKg8BaP
	H7qCDLAE7KKyuFkUS1JGW0mHa+CpOPNi3CgxmVyjf5/gSBhh22hpU1B/2FGgJ+8PyzNinE
	ESq3+wRBqGw8AHVLrR8h5ppEymlvUaQ=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-638-uF3l2E9YNreRP2M3xALA7w-1; Thu, 30 Apr 2026 13:33:40 -0400
X-MC-Unique: uF3l2E9YNreRP2M3xALA7w-1
X-Mimecast-MFC-AGG-ID: uF3l2E9YNreRP2M3xALA7w_1777570420
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8ee454b1b8cso154494385a.0
        for <linux-kselftest@vger.kernel.org>; Thu, 30 Apr 2026 10:33:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777570420; x=1778175220;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nmMXCvWSvShhSGiDPE3bbKH2xIBX1MBTYvUc5Sk23wc=;
        b=OaEuChtG7E31/xfGnT4AKZh4MuGovkgBLn1ARkBIABt2iqeqbtO6WpvNhKEFH3LWq/
         inFoHDDWcw6k0TgkG43QxWPQXXeWkB2Slv+oECMH9yO2R/qVXrlr9kcqCwfIsxjsAvxA
         BC0e+P2lhy5lWjih5bNCTkk6koXlfUf+EOHdRUEw2mRNUpy9LGl/fddXzH6y2Q2TN6lk
         /kX+mAPdMr3uMc+oRZRCGkklDER0My1ODWXSrgUq/JJgmuN+koElKtbPpjSFja2bM2vI
         Z/U019ZJQWWgzR+bOTfRutltJYOLYm6kMfcs8V6mPz42tzrsCpj+kGS8kxcRM7dSzK+4
         obmg==
X-Forwarded-Encrypted: i=1; AFNElJ/W+3+VKXMg5aqm/vXE11YKPaW6QT6kBVJ4ZXOWaytNWd8WOfMm0rDU9PMAGZVFxD5OU29fmiW2N+tdwKT6uIg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx59AL9U5NmyqAOwYgfkS9ZtdNtaVoTS47/QqICWVWnPzYqTrcL
	gS93/kp0dGUEOqU5TDcdQ8vgEV/KatcaBzm9U7nRfr7+vfHTIoU2Vx3yFrC5LDuO9hei1J0fQGC
	U4phDwTWMiebL+149FCboBBmXXsjEUBNS2jixHtwodUAwwFgyJ4iEhU+upq3NLA2Dbyko9g==
X-Gm-Gg: AeBDievW9uh3Zcs5pbaK8nhNdJnPkQHeAyUeFvGo7wv6xvC/L2JFdOnGyK9YUIUS87p
	2ET5lpjnh66xDDzLjNO/NCcWRdMG/HIgk7T82nTsM2gMz9RzhWVIwfcrit6X1jbzmHW2G6NX3nr
	zsOEonGrGuXaH2YkIik2dyg/EgYsdCh8064ur9Bgjo3sIrhaFGZLRLOzYKSWyhX5X41RWdxplnF
	kvNL1jLJToOewvFksk/8O1lNuVrgy+711JW3ggyJoj5dfI95IcBYzX58XdNXXP3tXv9iJo5iIPH
	pimiUWkYHUxeP+f4IZu/XkkytRaMTwjRMwws2MDUxj+nc1nK2gWj4nEEAEKkcJ9WSeYHth5Bfjg
	c9z0jQbhIEP2tzPF1EKDMevukg84CH/zyxzwrDWd8OG/yCgZwFsZ0Iibf5V0uOhDAKwvQarmDpG
	A1nT2GD/IsUCasrgbPsjgs6tc=
X-Received: by 2002:ac8:58d2:0:b0:50e:6054:bc with SMTP id d75a77b69052e-5102ab43dc2mr57370711cf.16.1777570420088;
        Thu, 30 Apr 2026 10:33:40 -0700 (PDT)
X-Received: by 2002:ac8:58d2:0:b0:50e:6054:bc with SMTP id d75a77b69052e-5102ab43dc2mr57369551cf.16.1777570419456;
        Thu, 30 Apr 2026 10:33:39 -0700 (PDT)
Received: from [192.168.2.110] (bras-base-aylmpq0104w-grc-22-70-53-202-134.dsl.bell.ca. [70.53.202.134])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5103d1c657bsm812311cf.3.2026.04.30.10.33.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 10:33:39 -0700 (PDT)
Message-ID: <1ad27a46-543b-4799-924a-c13147bf68ca@redhat.com>
Date: Thu, 30 Apr 2026 13:33:37 -0400
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 25/54] selftests/mm: hugepage_settings: add APIs to get
 and set nr_hugepages
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
 <20260428204240.1924129-26-rppt@kernel.org>
Content-Language: en-US, en-CA
From: Luiz Capitulino <luizcap@redhat.com>
In-Reply-To: <20260428204240.1924129-26-rppt@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2026-04-28 16:42, Mike Rapoport wrote:
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> 
> Add APIs that allow reading and writing of
> 
> /sys/kernel/mm/hugepages/hugepages-NkB/nr_hugepages
> 
> to detect and change the amount of HugeTLB pages of different sizes.
> 
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

Reviewed-by: Luiz Capitulino <luizcap@redhat.com>

> ---
>   .../testing/selftests/mm/hugepage_settings.c  | 25 +++++++++++++++++++
>   .../testing/selftests/mm/hugepage_settings.h  | 23 +++++++++++++++++
>   2 files changed, 48 insertions(+)
> 
> diff --git a/tools/testing/selftests/mm/hugepage_settings.c b/tools/testing/selftests/mm/hugepage_settings.c
> index 8f563315b1fc..5961229b9931 100644
> --- a/tools/testing/selftests/mm/hugepage_settings.c
> +++ b/tools/testing/selftests/mm/hugepage_settings.c
> @@ -464,3 +464,28 @@ unsigned long get_free_hugepages(void)
>   	fclose(f);
>   	return fhp;
>   }
> +
> +static void hugetlb_sysfs_path(char *buf, size_t buflen,
> +			       unsigned long size, const char *attr)
> +{
> +	snprintf(buf, buflen, "/sys/kernel/mm/hugepages/hugepages-%lukB/%s",
> +		 size / 1024, attr);
> +}
> +
> +unsigned long hugetlb_nr_pages(unsigned long size)
> +{
> +	char path[PATH_MAX];
> +
> +	hugetlb_sysfs_path(path, sizeof(path), size, "nr_hugepages");
> +
> +	return read_num(path);
> +}
> +
> +void hugetlb_set_nr_pages(unsigned long size, unsigned long nr)
> +{
> +	char path[PATH_MAX];
> +
> +	hugetlb_sysfs_path(path, sizeof(path), size, "nr_hugepages");
> +
> +	write_num(path, nr);
> +}
> diff --git a/tools/testing/selftests/mm/hugepage_settings.h b/tools/testing/selftests/mm/hugepage_settings.h
> index 9357d07e6c1b..d6f41a45e8ee 100644
> --- a/tools/testing/selftests/mm/hugepage_settings.h
> +++ b/tools/testing/selftests/mm/hugepage_settings.h
> @@ -94,4 +94,27 @@ int detect_hugetlb_page_sizes(unsigned long sizes[], int max);
>   unsigned long default_huge_page_size(void);
>   unsigned long get_free_hugepages(void);
>   
> +unsigned long hugetlb_nr_pages(unsigned long size);
> +void hugetlb_set_nr_pages(unsigned long size, unsigned long nr);
> +
> +static inline unsigned long hugetlb_nr_default_pages(void)
> +{
> +	unsigned long size = default_huge_page_size();
> +
> +	if (!size)
> +		return 0;
> +
> +	return hugetlb_nr_pages(size);
> +}
> +
> +static inline void hugetlb_set_nr_default_pages(unsigned long nr)
> +{
> +	unsigned long size = default_huge_page_size();
> +
> +	if (!size)
> +		return;
> +
> +	hugetlb_set_nr_pages(size, nr);
> +}
> +
>   #endif /* __THP_SETTINGS_H__ */

