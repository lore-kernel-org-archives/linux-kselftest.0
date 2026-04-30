Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2073342314E
	for <linux-kselftest@vger.kernel.org>; Thu, 30 Apr 2026 13:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777555163; cv=none; b=tBLyLn2DseCuCLBmQ3qc+2Zeu8UK4zm4ZpRh5FfDU3UpulVWg6Eevz2ZEvCnP/tACS8KQ9F+Rdh/0LDITSY7FCCEgORW9K+C7I41YgpUoy04Ce6Ps+7tiqHswhLCzNxvcMayuwgfLSto39TjyWVA0ihrlwh/3uH32mERL5+Zi7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777555163; c=relaxed/simple;
	bh=d8sr+e0nCMWY2VToEMrtqogxCSYpfGn6uTccnKB8u7Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NNVEp//qP+zPB62IoTPbT6bdmGTtPGagWhOqdw3NQ+tsLrk5QW5rmUCXuuJ7XYJ2WEYECLmGfQeV02skOz6tx+NkF63TC8ByxJshp5GwuHYwmT0yC91QfaFo6PVUkgjV3AxETPc84Ch75RiJN5pCxueF47G5j+PJNSqngoC9nSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KAUOXCAW; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KAUOXCAW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777555161;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C+KvbjTbCVShW0byAn6MeePIusrNfHP8IrkWJR9bkao=;
	b=KAUOXCAWNtASCxWLA5Hfp8pTyHE7rK96Ams4Yf83NCh3/m1snReeAWEwhb3TtpWs0TKBHT
	Zal4nuJxrlK600258Yo+Jy+sy8Fh4eR6pVLfjq4RukS2MECVd1aIXg4VY/rxjRDulMGJHe
	prC/AQo6/mptg8I/a/vLN0KtYonpTfc=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-590-zARumydINuesGordFBrZog-1; Thu, 30 Apr 2026 09:19:18 -0400
X-MC-Unique: zARumydINuesGordFBrZog-1
X-Mimecast-MFC-AGG-ID: zARumydINuesGordFBrZog_1777555158
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d812c898cso20877151cf.1
        for <linux-kselftest@vger.kernel.org>; Thu, 30 Apr 2026 06:19:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777555158; x=1778159958;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C+KvbjTbCVShW0byAn6MeePIusrNfHP8IrkWJR9bkao=;
        b=oy5Cdgsu5oCbATiFrOAaeegjvb4g5E1vLE0OeNKbdI579ARdCGdOFjUH5Z/i4UTN1I
         WReFMzgJuSRhjJNc1dC/Sa5OKnVSLEsv3zELfNV3IVyEev8O+WFBGDeqp37Q34pNd4IY
         QVJytP+K3n5cmkSW9Awkx/BVZPecG09p3S5+8hDYrIhtJYZJxcAhl1nGv+lMtDfczH3E
         J5xKdZgxQEd+Hte0YcfS07V84C3KeUlXw+6x48n8lQn2JHOYNLKMMhONT4UhzeuJQ8XK
         wMuy9Sdj6vglDfebP4sD1dhCwktjTzD+t9eFqMFmcKCDVou/sDA7DqCJMP/Ykmsebu0e
         f8Tw==
X-Forwarded-Encrypted: i=1; AFNElJ8t9KidelfQMrrvidaDgdrksiLz3LkaS26CwdG9OqYgMRan75rBgsKZeD05M2dBTKf0GunrI/5cU1kN/9bcevs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjYISG4znT71VIcUZvXpgO9dgi67ZRB6GU3KpMr0En3u0Y1lZe
	okW+tObC73H1xyM1OkLgeJ7hdEQWiRNMlkOJwEctgZYFATo+zYYq8Z6VBswYAbPSFXZ5Pdvgb11
	ezpiRzQcI1xdfaJkUXJngG+W0IC2EXJN9KBq/vZ48joSkgvD5YcjkCYf+o+56VnEn+0lIXg==
X-Gm-Gg: AeBDietlpo5Esr2/22dIxr0UlhzkjHXWxQGFiZ89iVOFK0ozD0poHPWIPSosIbABw9w
	JHXxo3zZQYhzt/6xsmXM/L3Q5pAQLrFDT+DKaVkkK3b+yhPrHDJmI5nWjO2Xz311PVSUrbxW6rS
	smbJZUwyVLP8Fq7GZvGKttyBHOIu6Vb0Pq9Q4TJMo7OrCnC5x5GtZZd8pf/KCvFJkEAQQ6xXy9A
	RStHU+43hjraAr1MeWw4dVbjQJ+vz+bo4Cr2nmcZp3L57Dj3tComldlHQ1H3bZtwnSQKzSDwNXI
	Jal/qpg/E9zaTFHDGTG4/3tcrkJU7awB/faR2AH4im6xe9toikkUJGkj7T44n9bQCyeGZ5gfCt7
	IFqLrvFzILBiwW89duDDJygjRgdj98tbNTq8=
X-Received: by 2002:a05:622a:4806:b0:50b:41bf:4ee5 with SMTP id d75a77b69052e-5102ae29960mr39019431cf.57.1777555157983;
        Thu, 30 Apr 2026 06:19:17 -0700 (PDT)
X-Received: by 2002:a05:622a:4806:b0:50b:41bf:4ee5 with SMTP id d75a77b69052e-5102ae29960mr39018651cf.57.1777555157236;
        Thu, 30 Apr 2026 06:19:17 -0700 (PDT)
Received: from [192.168.2.110] ([70.53.202.134])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5101aca0075sm44151561cf.1.2026.04.30.06.19.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 06:19:16 -0700 (PDT)
Message-ID: <616e06fc-3d1c-41c5-bbea-2eff99fd3f4e@redhat.com>
Date: Thu, 30 Apr 2026 09:19:05 -0400
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/54] selftests/mm: migration: don't assume hupe page
 is TWOMEG
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
 <20260428204240.1924129-3-rppt@kernel.org>
Content-Language: en-US, en-CA
From: Luiz Capitulino <luizcap@redhat.com>
In-Reply-To: <20260428204240.1924129-3-rppt@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2026-04-28 16:41, Mike Rapoport wrote:
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> 
> migration tests presume that both THP and HugeTLB huge pages are 2MB.
> 
> Add dynamic detection of huge page size with read_pmd_pagesize() for THP
> and with default_huge_page_size() for HugeTLB.
> 
> Reviewed-by: Donet Tom <donettom@linux.ibm.com>
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---
>   tools/testing/selftests/mm/migration.c | 44 +++++++++++++++++++-------
>   1 file changed, 32 insertions(+), 12 deletions(-)
> 
> diff --git a/tools/testing/selftests/mm/migration.c b/tools/testing/selftests/mm/migration.c
> index 60e78bbfc0e3..7e547d945e1a 100644
> --- a/tools/testing/selftests/mm/migration.c
> +++ b/tools/testing/selftests/mm/migration.c
> @@ -184,22 +184,27 @@ TEST_F_TIMEOUT(migration, shared_anon, 2*RUNTIME)
>    */
>   TEST_F_TIMEOUT(migration, private_anon_thp, 2*RUNTIME)
>   {
> +	uint64_t pmdsize;
>   	uint64_t *ptr;
>   	int i;
>   
>   	if (!thp_is_enabled())
>   		SKIP(return, "Transparent Hugepages not available");
>   
> +	pmdsize = read_pmd_pagesize();
> +	if (!pmdsize)
> +		SKIP(return, "Reading PMD pagesize failed");
> +
>   	if (self->nthreads < 2 || self->n1 < 0 || self->n2 < 0)
>   		SKIP(return, "Not enough threads or NUMA nodes available");
>   
> -	ptr = mmap(NULL, 2*TWOMEG, PROT_READ | PROT_WRITE,
> +	ptr = mmap(NULL, 2 * pmdsize, PROT_READ | PROT_WRITE,
>   		MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
>   	ASSERT_NE(ptr, MAP_FAILED);
>   
> -	ptr = (uint64_t *) ALIGN((uintptr_t) ptr, TWOMEG);
> -	ASSERT_EQ(madvise(ptr, TWOMEG, MADV_HUGEPAGE), 0);
> -	memset(ptr, 0xde, TWOMEG);
> +	ptr = (uint64_t *) ALIGN((uintptr_t) ptr, pmdsize);
> +	ASSERT_EQ(madvise(ptr, pmdsize, MADV_HUGEPAGE), 0);
> +	memset(ptr, 0xde, pmdsize);
>   	for (i = 0; i < self->nthreads - 1; i++)
>   		if (pthread_create(&self->threads[i], NULL, access_mem, ptr))
>   			perror("Couldn't create thread");
> @@ -215,6 +220,7 @@ TEST_F_TIMEOUT(migration, private_anon_thp, 2*RUNTIME)
>   
>   TEST_F_TIMEOUT(migration, shared_anon_thp, 2*RUNTIME)
>   {
> +	unsigned long pmdsize;

I don't remember if this is the one I caught before, but would be good
to match read_pmd_pagesize() uint64_t type.

As this is minor:

Reviewed-by: Luiz Capitulino <luizcap@redhat.com>

>   	pid_t pid;
>   	uint64_t *ptr;
>   	int i;
> @@ -222,17 +228,21 @@ TEST_F_TIMEOUT(migration, shared_anon_thp, 2*RUNTIME)
>   	if (!thp_is_enabled())
>   		SKIP(return, "Transparent Hugepages not available");
>   
> +	pmdsize = read_pmd_pagesize();
> +	if (!pmdsize)
> +		SKIP(return, "Reading PMD pagesize failed");
> +
>   	if (self->nthreads < 2 || self->n1 < 0 || self->n2 < 0)
>   		SKIP(return, "Not enough threads or NUMA nodes available");
>   
> -	ptr = mmap(NULL, 2 * TWOMEG, PROT_READ | PROT_WRITE,
> +	ptr = mmap(NULL, 2 * pmdsize, PROT_READ | PROT_WRITE,
>   		MAP_SHARED | MAP_ANONYMOUS, -1, 0);
>   	ASSERT_NE(ptr, MAP_FAILED);
>   
> -	ptr = (uint64_t *) ALIGN((uintptr_t) ptr, TWOMEG);
> -	ASSERT_EQ(madvise(ptr, TWOMEG, MADV_HUGEPAGE), 0);
> +	ptr = (uint64_t *) ALIGN((uintptr_t) ptr, pmdsize);
> +	ASSERT_EQ(madvise(ptr, pmdsize, MADV_HUGEPAGE), 0);
>   
> -	memset(ptr, 0xde, TWOMEG);
> +	memset(ptr, 0xde, pmdsize);
>   	for (i = 0; i < self->nthreads - 1; i++) {
>   		pid = fork();
>   		if (!pid) {
> @@ -256,17 +266,22 @@ TEST_F_TIMEOUT(migration, shared_anon_thp, 2*RUNTIME)
>    */
>   TEST_F_TIMEOUT(migration, private_anon_htlb, 2*RUNTIME)
>   {
> +	unsigned long hugepage_size;
>   	uint64_t *ptr;
>   	int i;
>   
>   	if (self->nthreads < 2 || self->n1 < 0 || self->n2 < 0)
>   		SKIP(return, "Not enough threads or NUMA nodes available");
>   
> -	ptr = mmap(NULL, TWOMEG, PROT_READ | PROT_WRITE,
> +	hugepage_size = default_huge_page_size();
> +	if (!hugepage_size)
> +		SKIP(return, "Reading HugeTLB pagesize failed\n");
> +
> +	ptr = mmap(NULL, hugepage_size, PROT_READ | PROT_WRITE,
>   		MAP_PRIVATE | MAP_ANONYMOUS | MAP_HUGETLB, -1, 0);
>   	ASSERT_NE(ptr, MAP_FAILED);
>   
> -	memset(ptr, 0xde, TWOMEG);
> +	memset(ptr, 0xde, hugepage_size);
>   	for (i = 0; i < self->nthreads - 1; i++)
>   		if (pthread_create(&self->threads[i], NULL, access_mem, ptr))
>   			perror("Couldn't create thread");
> @@ -281,6 +296,7 @@ TEST_F_TIMEOUT(migration, private_anon_htlb, 2*RUNTIME)
>    */
>   TEST_F_TIMEOUT(migration, shared_anon_htlb, 2*RUNTIME)
>   {
> +	unsigned long hugepage_size;
>   	pid_t pid;
>   	uint64_t *ptr;
>   	int i;
> @@ -288,11 +304,15 @@ TEST_F_TIMEOUT(migration, shared_anon_htlb, 2*RUNTIME)
>   	if (self->nthreads < 2 || self->n1 < 0 || self->n2 < 0)
>   		SKIP(return, "Not enough threads or NUMA nodes available");
>   
> -	ptr = mmap(NULL, TWOMEG, PROT_READ | PROT_WRITE,
> +	hugepage_size = default_huge_page_size();
> +	if (!hugepage_size)
> +		SKIP(return, "Reading HugeTLB pagesize failed\n");
> +
> +	ptr = mmap(NULL, hugepage_size, PROT_READ | PROT_WRITE,
>   		MAP_SHARED | MAP_ANONYMOUS | MAP_HUGETLB, -1, 0);
>   	ASSERT_NE(ptr, MAP_FAILED);
>   
> -	memset(ptr, 0xde, TWOMEG);
> +	memset(ptr, 0xde, hugepage_size);
>   	for (i = 0; i < self->nthreads - 1; i++) {
>   		pid = fork();
>   		if (!pid) {

