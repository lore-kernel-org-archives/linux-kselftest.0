Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D186640B6F5
	for <linux-kselftest@vger.kernel.org>; Thu, 30 Apr 2026 13:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777555305; cv=none; b=RwBC8cQK/uEqi/xPxtCrqwxgZJegn0nAFC5bD0+pg/tKHD+V17CxzaRxmGxc25Yyvu3MhgzlIzYtkjDPyCbYgc400e2Oinq9k+f6F4x2sVwCmVjPjX+maISBhMEimH5D/Om/qClSyemMzZfgsdXNp/TGVMajJFI9tv0rglws+rY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777555305; c=relaxed/simple;
	bh=5RTF1MgYCWEgsPw/keJkYc6fMnxQnZihH9RF8jLzqdk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qxvfz0MDFnxBAKihBaSNdiKkvo3bnEx3GCPmgG36AbuZ1WQ52s7Tbf0/16Yo4ORrF5VzlnoGCVVnykMee9DaYf5jl+Q2N2NiO5wundaGaK9nj/0MPyx6zPW7K3JsI57r3xCmhyyt8kr88hfALWe3MFGy1QcvrAZbWyQLmx5c+1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ImryuA+B; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ImryuA+B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777555302;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RqyhJSBH3U/dz2zZH51faGzShfNGK8OLcWgd9e7sk6I=;
	b=ImryuA+B41SxWq2SClv7wrhId/cUaqCcHIYTQafJU6bsNprM/X4Z0WvhTiebW405ce+cSD
	NXQzSUpQPdwFlyR+KP77VfpPgy4hSFUrJJ9MAYryAiqge2gpteR4aGjX40IsCPpOCr2Igv
	YRIeGcuBKdTXq/bX55U75zQHhQA6XVI=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-150-za7ANRiXP8uUwQL9dvuxfQ-1; Thu, 30 Apr 2026 09:21:41 -0400
X-MC-Unique: za7ANRiXP8uUwQL9dvuxfQ-1
X-Mimecast-MFC-AGG-ID: za7ANRiXP8uUwQL9dvuxfQ_1777555301
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d8e8c47a3so21274171cf.0
        for <linux-kselftest@vger.kernel.org>; Thu, 30 Apr 2026 06:21:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777555301; x=1778160101;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RqyhJSBH3U/dz2zZH51faGzShfNGK8OLcWgd9e7sk6I=;
        b=QOKpDtFYALvUREO1G4FsOkqOqWeTNOlGzvMo/mYOHE4z8ubnZKQYF3/HyTajHKXndd
         zoC7a3jPAoSCqu45yDF/mBQ7iwgAIeN9gKQ20Djw8c4OEvK1BltfpZdaxP5kCCl3Y4ab
         pqt3Ts1H+m7cE4DGjX0dYmrLX13Qmdby9xeVYw3JbfW2nOIrpcIo3kqRP0Yea9lm0CY8
         IBJc4VwRbSOsH2yxmclpMhe6J/+knaj+nsgxSwfP8a9alOKQ77Ja7LktXp30wUwZKOF9
         Z5DWrWJZPj6Ha5r6mAotr6AMdPuUYz+46hCzwMXI8R9BzekS+4uuvJA5rPW60DbxHw4A
         9baA==
X-Forwarded-Encrypted: i=1; AFNElJ/t2wBOAMT+xfZ+Gs0DxwQXtBlpEHUQjlSx0CI3HmHge+bk0JGCJFZOKIOWnuMIoNmtfRW9k7bpjVX9dqvI4XU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBSUN6lxcGfcBT5G7G5qy1J2J8JRMhTTHV0D9ym6nchb8aBHSr
	6ZceVPZSudrTCk3kRvVN35h447EI5lbpL334iA9VVUwLLb+fpedXB7+ipvfUdggfD7eKZp+PiBk
	h4GpwNgtYNW9E9DcyTlAMgQMfq7SDr8Ta90KKilTs11YULW+6cfB8OxcugtVPO3shdMIifg==
X-Gm-Gg: AeBDietKvArsvnSJJkI2JyQtvNtAjfPGuDwzj/0TrzS1zvVMjPZUW7L7N1PS9AT55yY
	hkKMGi5qKY6aKu2jHtee4mzGoT+J8HKFRyApwXMAVhXfOwcAuF9D8MvyYdLKp19kqzsPQJmqK8+
	G4436R2h5RsQztanlMiIol9JeuNTRgNdcmpnqvRDXa/NtoPAQZekw6KZgDWIcBD0tLMPc4boWUN
	GmlkyYZR2Wndt/Yf5crpsJxlLkllj4RpWSKE7O3O9TdpA/aaxNilk/68aJugd7oSUgM8VrF4B//
	pTOUDJcI1tZE8V1fIZ1DIMUSamlNYJKKu6ite8XgVnOtZeg7r7dhstL5X6WBL3Gvmy02UWXfYZT
	UaDl3d2MrhEmsCBlAcIRnw+/nicWjMsey+tQ=
X-Received: by 2002:a05:622a:248e:b0:50b:5146:8803 with SMTP id d75a77b69052e-5102ab41a36mr37911771cf.21.1777555301153;
        Thu, 30 Apr 2026 06:21:41 -0700 (PDT)
X-Received: by 2002:a05:622a:248e:b0:50b:5146:8803 with SMTP id d75a77b69052e-5102ab41a36mr37910491cf.21.1777555300284;
        Thu, 30 Apr 2026 06:21:40 -0700 (PDT)
Received: from [192.168.2.110] ([70.53.202.134])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5101ae3c0b9sm49981021cf.19.2026.04.30.06.21.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 06:21:39 -0700 (PDT)
Message-ID: <a9864510-ddd2-46a6-99d8-8d7851c187c6@redhat.com>
Date: Thu, 30 Apr 2026 09:21:28 -0400
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/54] selftests/mm: migration: make nthreads represent
 number of working threads
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
 <20260428204240.1924129-4-rppt@kernel.org>
Content-Language: en-US, en-CA
From: Luiz Capitulino <luizcap@redhat.com>
In-Reply-To: <20260428204240.1924129-4-rppt@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2026-04-28 16:41, Mike Rapoport wrote:
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> 
> Fixture setup sets self->nthreads to number of available CPUs minus 1
> and then each test creates 'self->nthreads - 1' threads or processes, so
> essentially nthreads counts the worker tasks and the main task.
> 
> Make nthreads represent the number of spawned tasks to simplify
> thread/process creation and teardown.
> 
> While on it, make the fixture setup skip the tests if there are not
> enough CPUs or NUMA nodes instead of checking this in each test.
> 
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

Reviewed-by: Luiz Capitulino <luizcap@redhat.com>

> ---
>   tools/testing/selftests/mm/migration.c | 47 +++++++++-----------------
>   1 file changed, 16 insertions(+), 31 deletions(-)
> 
> diff --git a/tools/testing/selftests/mm/migration.c b/tools/testing/selftests/mm/migration.c
> index 7e547d945e1a..3630f2fb0800 100644
> --- a/tools/testing/selftests/mm/migration.c
> +++ b/tools/testing/selftests/mm/migration.c
> @@ -38,7 +38,7 @@ FIXTURE_SETUP(migration)
>   
>   	if (numa_available() < 0)
>   		SKIP(return, "NUMA not available");
> -	self->nthreads = numa_num_task_cpus() - 1;
> +	self->nthreads = numa_num_task_cpus() - 2;
>   	self->n1 = -1;
>   	self->n2 = -1;
>   
> @@ -52,6 +52,9 @@ FIXTURE_SETUP(migration)
>   			}
>   		}
>   
> +	if (self->nthreads < 1 || self->n1 < 0 || self->n2 < 0)
> +		SKIP(return, "Not enough threads or NUMA nodes available");
> +
>   	self->threads = malloc(self->nthreads * sizeof(*self->threads));
>   	ASSERT_NE(self->threads, NULL);
>   	self->pids = malloc(self->nthreads * sizeof(*self->pids));
> @@ -127,20 +130,17 @@ TEST_F_TIMEOUT(migration, private_anon, 2*RUNTIME)
>   	uint64_t *ptr;
>   	int i;
>   
> -	if (self->nthreads < 2 || self->n1 < 0 || self->n2 < 0)
> -		SKIP(return, "Not enough threads or NUMA nodes available");
> -
>   	ptr = mmap(NULL, TWOMEG, PROT_READ | PROT_WRITE,
>   		MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
>   	ASSERT_NE(ptr, MAP_FAILED);
>   
>   	memset(ptr, 0xde, TWOMEG);
> -	for (i = 0; i < self->nthreads - 1; i++)
> +	for (i = 0; i < self->nthreads; i++)
>   		if (pthread_create(&self->threads[i], NULL, access_mem, ptr))
>   			perror("Couldn't create thread");
>   
>   	ASSERT_EQ(migrate(ptr, self->n1, self->n2), 0);
> -	for (i = 0; i < self->nthreads - 1; i++)
> +	for (i = 0; i < self->nthreads; i++)
>   		ASSERT_EQ(pthread_cancel(self->threads[i]), 0);
>   }
>   
> @@ -153,15 +153,12 @@ TEST_F_TIMEOUT(migration, shared_anon, 2*RUNTIME)
>   	uint64_t *ptr;
>   	int i;
>   
> -	if (self->nthreads < 2 || self->n1 < 0 || self->n2 < 0)
> -		SKIP(return, "Not enough threads or NUMA nodes available");
> -
>   	ptr = mmap(NULL, TWOMEG, PROT_READ | PROT_WRITE,
>   		MAP_SHARED | MAP_ANONYMOUS, -1, 0);
>   	ASSERT_NE(ptr, MAP_FAILED);
>   
>   	memset(ptr, 0xde, TWOMEG);
> -	for (i = 0; i < self->nthreads - 1; i++) {
> +	for (i = 0; i < self->nthreads; i++) {
>   		pid = fork();
>   		if (!pid) {
>   			prctl(PR_SET_PDEATHSIG, SIGHUP);
> @@ -175,7 +172,7 @@ TEST_F_TIMEOUT(migration, shared_anon, 2*RUNTIME)
>   	}
>   
>   	ASSERT_EQ(migrate(ptr, self->n1, self->n2), 0);
> -	for (i = 0; i < self->nthreads - 1; i++)
> +	for (i = 0; i < self->nthreads; i++)
>   		ASSERT_EQ(kill(self->pids[i], SIGTERM), 0);
>   }
>   
> @@ -195,9 +192,6 @@ TEST_F_TIMEOUT(migration, private_anon_thp, 2*RUNTIME)
>   	if (!pmdsize)
>   		SKIP(return, "Reading PMD pagesize failed");
>   
> -	if (self->nthreads < 2 || self->n1 < 0 || self->n2 < 0)
> -		SKIP(return, "Not enough threads or NUMA nodes available");
> -
>   	ptr = mmap(NULL, 2 * pmdsize, PROT_READ | PROT_WRITE,
>   		MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
>   	ASSERT_NE(ptr, MAP_FAILED);
> @@ -205,12 +199,12 @@ TEST_F_TIMEOUT(migration, private_anon_thp, 2*RUNTIME)
>   	ptr = (uint64_t *) ALIGN((uintptr_t) ptr, pmdsize);
>   	ASSERT_EQ(madvise(ptr, pmdsize, MADV_HUGEPAGE), 0);
>   	memset(ptr, 0xde, pmdsize);
> -	for (i = 0; i < self->nthreads - 1; i++)
> +	for (i = 0; i < self->nthreads; i++)
>   		if (pthread_create(&self->threads[i], NULL, access_mem, ptr))
>   			perror("Couldn't create thread");
>   
>   	ASSERT_EQ(migrate(ptr, self->n1, self->n2), 0);
> -	for (i = 0; i < self->nthreads - 1; i++)
> +	for (i = 0; i < self->nthreads; i++)
>   		ASSERT_EQ(pthread_cancel(self->threads[i]), 0);
>   }
>   
> @@ -232,9 +226,6 @@ TEST_F_TIMEOUT(migration, shared_anon_thp, 2*RUNTIME)
>   	if (!pmdsize)
>   		SKIP(return, "Reading PMD pagesize failed");
>   
> -	if (self->nthreads < 2 || self->n1 < 0 || self->n2 < 0)
> -		SKIP(return, "Not enough threads or NUMA nodes available");
> -
>   	ptr = mmap(NULL, 2 * pmdsize, PROT_READ | PROT_WRITE,
>   		MAP_SHARED | MAP_ANONYMOUS, -1, 0);
>   	ASSERT_NE(ptr, MAP_FAILED);
> @@ -243,7 +234,7 @@ TEST_F_TIMEOUT(migration, shared_anon_thp, 2*RUNTIME)
>   	ASSERT_EQ(madvise(ptr, pmdsize, MADV_HUGEPAGE), 0);
>   
>   	memset(ptr, 0xde, pmdsize);
> -	for (i = 0; i < self->nthreads - 1; i++) {
> +	for (i = 0; i < self->nthreads; i++) {
>   		pid = fork();
>   		if (!pid) {
>   			prctl(PR_SET_PDEATHSIG, SIGHUP);
> @@ -257,7 +248,7 @@ TEST_F_TIMEOUT(migration, shared_anon_thp, 2*RUNTIME)
>   	}
>   
>   	ASSERT_EQ(migrate(ptr, self->n1, self->n2), 0);
> -	for (i = 0; i < self->nthreads - 1; i++)
> +	for (i = 0; i < self->nthreads; i++)
>   		ASSERT_EQ(kill(self->pids[i], SIGTERM), 0);
>   }
>   
> @@ -270,9 +261,6 @@ TEST_F_TIMEOUT(migration, private_anon_htlb, 2*RUNTIME)
>   	uint64_t *ptr;
>   	int i;
>   
> -	if (self->nthreads < 2 || self->n1 < 0 || self->n2 < 0)
> -		SKIP(return, "Not enough threads or NUMA nodes available");
> -
>   	hugepage_size = default_huge_page_size();
>   	if (!hugepage_size)
>   		SKIP(return, "Reading HugeTLB pagesize failed\n");
> @@ -282,12 +270,12 @@ TEST_F_TIMEOUT(migration, private_anon_htlb, 2*RUNTIME)
>   	ASSERT_NE(ptr, MAP_FAILED);
>   
>   	memset(ptr, 0xde, hugepage_size);
> -	for (i = 0; i < self->nthreads - 1; i++)
> +	for (i = 0; i < self->nthreads; i++)
>   		if (pthread_create(&self->threads[i], NULL, access_mem, ptr))
>   			perror("Couldn't create thread");
>   
>   	ASSERT_EQ(migrate(ptr, self->n1, self->n2), 0);
> -	for (i = 0; i < self->nthreads - 1; i++)
> +	for (i = 0; i < self->nthreads; i++)
>   		ASSERT_EQ(pthread_cancel(self->threads[i]), 0);
>   }
>   
> @@ -301,9 +289,6 @@ TEST_F_TIMEOUT(migration, shared_anon_htlb, 2*RUNTIME)
>   	uint64_t *ptr;
>   	int i;
>   
> -	if (self->nthreads < 2 || self->n1 < 0 || self->n2 < 0)
> -		SKIP(return, "Not enough threads or NUMA nodes available");
> -
>   	hugepage_size = default_huge_page_size();
>   	if (!hugepage_size)
>   		SKIP(return, "Reading HugeTLB pagesize failed\n");
> @@ -313,7 +298,7 @@ TEST_F_TIMEOUT(migration, shared_anon_htlb, 2*RUNTIME)
>   	ASSERT_NE(ptr, MAP_FAILED);
>   
>   	memset(ptr, 0xde, hugepage_size);
> -	for (i = 0; i < self->nthreads - 1; i++) {
> +	for (i = 0; i < self->nthreads; i++) {
>   		pid = fork();
>   		if (!pid) {
>   			prctl(PR_SET_PDEATHSIG, SIGHUP);
> @@ -327,7 +312,7 @@ TEST_F_TIMEOUT(migration, shared_anon_htlb, 2*RUNTIME)
>   	}
>   
>   	ASSERT_EQ(migrate(ptr, self->n1, self->n2), 0);
> -	for (i = 0; i < self->nthreads - 1; i++)
> +	for (i = 0; i < self->nthreads; i++)
>   		ASSERT_EQ(kill(self->pids[i], SIGTERM), 0);
>   }
>   

