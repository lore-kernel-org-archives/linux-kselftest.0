Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B17043E1CE2
	for <linux-kselftest@vger.kernel.org>; Fri, 24 Apr 2026 17:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777050903; cv=none; b=Rd1s0N5vWisibhxO5QNXKMiggVXqvapIUd1O2BPfCNoGVgyFnSfJIIdRKyasIPOdY2YNHND0pevD9BOiADxUk2BivIpdQX58NGjDFz0cwLLBuFUBbkbWI/GPi/Ze27lZc/jXs90iOLjY+fMHF7H4SluuyJLz9HQeAjK2uYT5WSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777050903; c=relaxed/simple;
	bh=VWTXvh2eEaMs9BkaMg4BIHT7OqDc2hk2YriafdoKgTY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HYIei4/QCgBdSz90JuNAVTsuwdurbJCFhqc+xpdte9HhXbhPgkvoDWCKgDQjaTSgQ/PfFpOhot0T+JWi3Kkl5vynp9Iv+uQnpqE6ALq5lYH6o93JyYb9uil9D4w/GdLXH9RafYSx4AgbfW4sOOKAxPjTAr6NOIvT2Y2ScIneLAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IjgQfcd/; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IjgQfcd/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777050900;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KXR8yXZCeA8u9fVuIG6yunhw2x1dtW4UlYoFgYFZU50=;
	b=IjgQfcd/OumYX6eWQox5A7XPzEbEnLnRQb+RcPIdd7WwDg7I/e5QropKtr3ymVqYS5y8os
	8zwszR+yyn+HpIXunEgHEV8D6IF0CzyxfYXi9gUKfOc64Ybz1XYjJDwndreW+nWR15tmuh
	kEzMpC6MOK0WWq8vhHLTm+lvDxKCGTw=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-122-Wgi2IMInO1CBu2dEpL3_8A-1; Fri, 24 Apr 2026 13:15:00 -0400
X-MC-Unique: Wgi2IMInO1CBu2dEpL3_8A-1
X-Mimecast-MFC-AGG-ID: Wgi2IMInO1CBu2dEpL3_8A_1777050896
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8b1f4478ca7so69181516d6.3
        for <linux-kselftest@vger.kernel.org>; Fri, 24 Apr 2026 10:14:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777050896; x=1777655696;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KXR8yXZCeA8u9fVuIG6yunhw2x1dtW4UlYoFgYFZU50=;
        b=jhFdTI9v4vb9m4qRDLzlgzHFOQVxNUmeCwxYUDpLZOUzAK5Q2ODfWdsU7Wsx8ie+2h
         m+V6O0fwdjsW4+ntlXVYl0D7pSw70fztI8sAcnMXES+C4biLbKixxJ9bdfj+ZCo/3bIQ
         QoQMs2S0nyKBU/Na51zEwHM/80/5C/tX/iy/ZisFPbSOgC8jlb6HMwBbnviRVEl8hsl2
         qozHJJn3+cRln6CG9dFSit6eGcRoqyp1Duin4s8CSXyFILYrlKjyJYrf++Foq5uMt0tL
         Yq/ZTe9s8Lz7PVsba5rmy6BAjBWN/vtjK9D7ojHlUmyCJ3CIBdQK6LzBQuvUdLMBlhsS
         k9PQ==
X-Forwarded-Encrypted: i=1; AFNElJ98WfcwPaBcd976IAJ4XrN/nNZ8xOhxl1YXWzMRfimh8ZPjYQRC2yBInn5shmkcK/bvNrNp/QeJZ5ryoApA7Tk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxsT6aMaDGjTBCfaZwBj9aZTVrTRpxvpvC43Sb6atewWUszsj4
	lcSvak18SawDkpyD4uvhs17061YjRq7EubfbboZkt0teIFSw/jgkb8UvhN4IbBVLxPGwd3WyzKP
	0IviHVvBUA1BFCzPAvZHz2/1bIdF7xTQ6SQr1bnrnx0Ll+9hvTjvMOhIkvcESQRPMeFuOTw==
X-Gm-Gg: AeBDievEn9dJpMT41EjM17TBVLbbVRft9W4S4Cv8vvHijJnH4pxj4gpbnvM8Fcvid1r
	TgVDo2mJgFTMNgwKs+R+jz6D6vaQki8St6vGz8b9ksKWKHoP5eVmdNQTg4sq0sP9n3awZNDLFtw
	k6mmgglBAtlOxUMm+fpkIgwHriLQYCEXVeO26rGzk5XDmpWHI1eieE2E2wBio+0fLDkJAHN8CvM
	qm6X1i9FAhTLfITdrT0H2fXwG8zXKiqxI8p5u7FHErqUhdkIS/GVpgaUjmWf8NxYgGErSsj8/CI
	Q3vaZHtTiQrnEZlfEvfQD2bh88+1mhZRJxCS+1L0SDGYQ5+iVjeDHXq2xIFfU3615l76nXzud6o
	zxZG7PRyNjrUpAhqUIxo3aw==
X-Received: by 2002:a05:6214:1c43:b0:8ac:4fd1:2d4a with SMTP id 6a1803df08f44-8b02811c4b1mr535508786d6.33.1777050896294;
        Fri, 24 Apr 2026 10:14:56 -0700 (PDT)
X-Received: by 2002:a05:6214:1c43:b0:8ac:4fd1:2d4a with SMTP id 6a1803df08f44-8b02811c4b1mr535507756d6.33.1777050895695;
        Fri, 24 Apr 2026 10:14:55 -0700 (PDT)
Received: from [192.168.2.110] ([69.159.169.238])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b02aa4f1f9sm188233276d6.0.2026.04.24.10.14.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 10:14:55 -0700 (PDT)
Message-ID: <c1e9cc74-e831-4068-9d34-1f3a665b3fd6@redhat.com>
Date: Fri, 24 Apr 2026 13:14:44 -0400
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/53] selftests/mm: migration: don't assume hupe page
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
References: <20260418105539.1261536-1-rppt@kernel.org>
 <20260418105539.1261536-4-rppt@kernel.org>
Content-Language: en-US, en-CA
From: Luiz Capitulino <luizcap@redhat.com>
In-Reply-To: <20260418105539.1261536-4-rppt@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2026-04-18 06:54, Mike Rapoport wrote:
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> 
> migration tests presume that both THP and HugeTLB huge pages are 2MB.
> 
> Add dynamic detection of huge page size with read_pmd_pagesize() for THP
> and with default_huge_page_size() for HugeTLB.
> 
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> Reviewed by: Donet Tom <donettom@linux.ibm.com>
> ---
>   tools/testing/selftests/mm/migration.c | 44 +++++++++++++++++++-------
>   1 file changed, 32 insertions(+), 12 deletions(-)
> 
> diff --git a/tools/testing/selftests/mm/migration.c b/tools/testing/selftests/mm/migration.c
> index 60e78bbfc0e3..e3c2f831e15a 100644
> --- a/tools/testing/selftests/mm/migration.c
> +++ b/tools/testing/selftests/mm/migration.c
> @@ -184,22 +184,27 @@ TEST_F_TIMEOUT(migration, shared_anon, 2*RUNTIME)
>    */
>   TEST_F_TIMEOUT(migration, private_anon_thp, 2*RUNTIME)
>   {
> +	unsigned long pmdsize;
>   	uint64_t *ptr;
>   	int i;
>   
>   	if (!thp_is_enabled())
>   		SKIP(return, "Transparent Hugepages not available");
>   
> +	pmdsize = read_pmd_pagesize();

This is really minor, but I'd match read_pmd_pagesize()'s uint64_t
return type.

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

