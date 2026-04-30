Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27F6747CC67
	for <linux-kselftest@vger.kernel.org>; Thu, 30 Apr 2026 18:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777574366; cv=none; b=iYjr8hKa8lvtH2WbFQaUfHYATWTQhwjisqkCT/dAB95HbJjpyiwDKzJJ0pfkCXjP6RhJ4994CCeZkLwHycAZOYEMwJCwdMt1nyu8eoyxfeP8qSKFqwsDm1pBrbB36QThXUcxzilSZeIJpUQ58O8UcSD6pqI5nC4vwm2NG3r5bCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777574366; c=relaxed/simple;
	bh=EWfvzWwAMZdH+fxLemP5TH3UFb27rGk0/WQil+vdRok=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UzhTMrB6D+Sbb552Jkxy1JUXaerlRr7IFpKozlPdsJaa63znl6b7/6GwDrM6X60lforw1XHTp2V9HgCR1qkoqMroLfieJcZcndyvhcCayIlepReiglmpg2SpXuOuHrbVRPFIBoM0AXahhVc5/yRgT9x1F9UxTI7TDvBGyQAJLJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HFTLA2bX; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HFTLA2bX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777574364;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3TgwCb3E3Be4Ts3/mA76mTKUDmZh1Bg2ryTIzSZytL8=;
	b=HFTLA2bXq3uh7/70FSVdJdBdQ/owPrjQI5TRqV6eB7SJ3Dq71RZd7RZwLgP0n/LFcYtiwQ
	dm+98fms0XvgBATW2INRsYPcUCINAx0uS10zEghtTzN04VYcFttESisvlVRKcBa9RXT3S6
	VVlhb9BxDBkRYrDhGBDLc5ZgwNN/De0=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-574-OoxcxkOEPxGbS-hVN8Fq7w-1; Thu, 30 Apr 2026 14:39:22 -0400
X-MC-Unique: OoxcxkOEPxGbS-hVN8Fq7w-1
X-Mimecast-MFC-AGG-ID: OoxcxkOEPxGbS-hVN8Fq7w_1777574362
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8ac9609d3d6so31898706d6.0
        for <linux-kselftest@vger.kernel.org>; Thu, 30 Apr 2026 11:39:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777574362; x=1778179162;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3TgwCb3E3Be4Ts3/mA76mTKUDmZh1Bg2ryTIzSZytL8=;
        b=h3kqC6UHpcx/VIx24TAgQnyJlwC4TbAfhQhHo+YnwIoe8uGTHJ212936Uw/ZyQA6L/
         cMykOl7lp3LIQcliFg7OxaMaFabjNLn5DpKnFArnuGb3BvY5Xgoxl+jrGMKP30uD3Gff
         cV4gzG6rmuGSkBu3/Ca429dUNUehkndvI59BUM7VTSsbdDp5RMBPVbBEIawTkqH+PP4f
         QeD6PQ5HEK7HBmBzZwS8mm7uAyT9EL5w08LCObdqXRvM0Nyvzrzk2Gx57Pr+jvqBuiLg
         qSY7CY840igKIEIM2fjy/UmXsdFu85wrUt2DN2A1zCkKbpPVq/f2W8+OyRFxnpAnIQYz
         fmfw==
X-Forwarded-Encrypted: i=1; AFNElJ91w88zSZbGukJ58g6M196MpRm5A4EJLRNXOc+8qhXUsd2+QMWzCulnrDNX/DuEPLoDGgvSbHxBiz+sxLmralc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPstt/es4+7yLVFN+kupwq4vp51R1x1D4K+jJqsZelDxUW32Px
	zGN++WxYcKdjjNLScRiadGdBbHWEGNP+DNKN8xMEZfdR7wMX2XQRyUxp+Xs3litVHCSG5FFkjep
	ic4fWkhESTTSnf1OdTW63L7SMQ+gzZMRYLashuYuMM/ixyJcrlwx1+rXv7N9+FWbspISj6A==
X-Gm-Gg: AeBDievBUejue4ycS/oFfKnkjlxpGcWLvlSHO2JtVNIXRWiREPhRURWO9FIOmnoaDA4
	G5kJSgGEbVMQvRiIdZBfwThioJggEvPaSs1obelo60hjskYyNMsX7ZDQ979+DRpmdkn9aO42Uka
	j8YrsE9T0bL3EmdWgp+wcx0h7DEn23g1CiEhlpRIbYTakU3xFMuXrC0OzpLYQJL6+WfaClvycu3
	mj2FyTpYZd1qecVyifNIsqWpEBbEvADXbAmdCoGM0+K1foxNJ5CQsurAZ4+cwM1Js8CzBEZOQS2
	vcomGIsJ4LnxoNF7JXl8uJh7DcIIzGy0dAuwjHAfbqqihoRfjeHletYr1oqOezTSqWUypW4lvaM
	tvFIhb02cQqUd0g/nQuSGt5gq99sKIbA0D0k6qR1MWi7BS1xdVP1ProGcvxuUrt4w/RCkdaeUBJ
	yFI6IhEYMTpFwJdA7cahcUAEM=
X-Received: by 2002:ad4:4ee9:0:b0:89e:df5c:19f6 with SMTP id 6a1803df08f44-8b3feefa60fmr58693326d6.42.1777574362208;
        Thu, 30 Apr 2026 11:39:22 -0700 (PDT)
X-Received: by 2002:ad4:4ee9:0:b0:89e:df5c:19f6 with SMTP id 6a1803df08f44-8b3feefa60fmr58692596d6.42.1777574361605;
        Thu, 30 Apr 2026 11:39:21 -0700 (PDT)
Received: from [192.168.2.110] (bras-base-aylmpq0104w-grc-22-70-53-202-134.dsl.bell.ca. [70.53.202.134])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b3ff471941sm24955596d6.42.2026.04.30.11.39.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 11:39:21 -0700 (PDT)
Message-ID: <616e4945-0622-422a-ad6a-6f8749a840af@redhat.com>
Date: Thu, 30 Apr 2026 14:39:19 -0400
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 39/54] selftests/mm: hugetlb-mmap: add setup of HugeTLB
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
References: <20260428204240.1924129-1-rppt@kernel.org>
 <20260428204240.1924129-40-rppt@kernel.org>
Content-Language: en-US, en-CA
From: Luiz Capitulino <luizcap@redhat.com>
In-Reply-To: <20260428204240.1924129-40-rppt@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2026-04-28 16:42, Mike Rapoport wrote:
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> 
> hugetlb-mmap test fails if there are no free huge pages prepared by a
> wrapper script.
> 
> Add setup of HugeTLB pages to the test and make sure that the original
> settings are restored on the test exit.
> 
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

Reviewed-by: Luiz Capitulino <luizcap@redhat.com>

> ---
>   tools/testing/selftests/mm/hugetlb-mmap.c | 13 +++++++++----
>   1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/tools/testing/selftests/mm/hugetlb-mmap.c b/tools/testing/selftests/mm/hugetlb-mmap.c
> index 031085cb7d17..f12fc288ef4f 100644
> --- a/tools/testing/selftests/mm/hugetlb-mmap.c
> +++ b/tools/testing/selftests/mm/hugetlb-mmap.c
> @@ -109,16 +109,16 @@ int main(int argc, char **argv)
>   {
>   	size_t hugepage_size;
>   	size_t length = LENGTH;
> -	int shift = 0;
> +	int shift = 0, nr;
>   
>   	ksft_print_header();
> -	ksft_set_plan(2);
>   
>   	if (argc > 1)
>   		length = atol(argv[1]) << 20;
>   	if (argc > 2)
>   		shift = atoi(argv[2]);
>   
> +	hugetlb_save_settings();
>   	if (shift) {
>   		hugepage_size = (1 << shift);
>   		ksft_print_msg("%u kB hugepages\n", 1 << (shift - 10));
> @@ -128,9 +128,14 @@ int main(int argc, char **argv)
>   	}
>   
>   	/* munmap with fail if the length is not page aligned */
> -	if (hugepage_size > length)
> -		length = hugepage_size;
> +	length = (length + hugepage_size - 1) & ~(hugepage_size - 1);
> +	nr = length / hugepage_size;
> +
> +	hugetlb_set_nr_pages(hugepage_size, nr);
> +	if (hugetlb_free_pages(hugepage_size) < nr)
> +		ksft_exit_skip("Not enough %lu Kb pages\n", hugepage_size >> 10);
>   
> +	ksft_set_plan(2);
>   	ksft_print_msg("Mapping %lu Mbytes\n", (unsigned long)length >> 20);
>   
>   	test_anon_mmap(length, shift);

