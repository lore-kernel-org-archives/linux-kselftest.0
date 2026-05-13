Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D886402BA0
	for <linux-kselftest@vger.kernel.org>; Wed, 13 May 2026 14:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778681932; cv=none; b=WPq3LeRb95BJdWc106ig8zhFbyr6BB010WDlLEi6YT7O/zF+77aJxh9jNdW4B2zOCgjyr2Tgkh4nshuoj4Rlk9Oy/kHGS5YL4JcJMEMf+uWJVyH/mE/6NVDFIIUiRVDT9dhdry90xY9Uu4yaTyeQjhL8HWo4CHFelItCm96Zn5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778681932; c=relaxed/simple;
	bh=zcY7FUBNhO74nxP+DA38C8U6lBo8ZKlML3Nf1QLj804=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G24ccr46ZGzAN4hqunTR79WDKf/lNCpjgS4GYFRtMm5W8DlBrM3wT+QPBl0JVXYNxkPiuyR5+MHATqpHwvZlVb6Zie1YDQYg+aqeuVWD9JNgd+vkYoCNIenVXjIGF/llb+u4ZUzZB4rQia6cZMMWqF2JcX2M68Z1PSD5fgAz+yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MGXuaUfy; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MGXuaUfy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778681926;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xYlye75OCf2YtQTajLfzvkg89uVXgpLkqgB1sCbwhbY=;
	b=MGXuaUfyiBZOawY1aO9SOj1dv4WkJ03W4f1y/y3w+WolCgxlKxpxwR5UWHspVUsm+02Wo0
	p+ZaF5s8+rxIao7emQzb1Fw3U87lACYeoxp09QAEiSICo6IzRyVPrT+CaA2r9Tsst9gQdF
	ZWMWdUywYfzzYAO63U/84SoQTZKKCQg=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-193-2XC5kgG9MqiOZhAXaBJ7Wg-1; Wed, 13 May 2026 10:18:44 -0400
X-MC-Unique: 2XC5kgG9MqiOZhAXaBJ7Wg-1
X-Mimecast-MFC-AGG-ID: 2XC5kgG9MqiOZhAXaBJ7Wg_1778681924
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8baa173eacbso55717686d6.0
        for <linux-kselftest@vger.kernel.org>; Wed, 13 May 2026 07:18:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778681924; x=1779286724;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xYlye75OCf2YtQTajLfzvkg89uVXgpLkqgB1sCbwhbY=;
        b=dUSFQflx0MxaOn2M2ZWzk2pEDu8neXTrDGO6YesVVIkLUDHi4Gu2tU7HotBr/3MQVY
         ogRGiPdz3IEzv8T24wMnwaRqzai779bWHS+JuASaNTE80arvXZVAHHrkL1qVeWfz4mMa
         K+q6pS4qSauCloNi2/ZdKqxHzIvaDaWUg1sIaM32LnewoXxUcI5R7EZyZn13jYHuOVh5
         wYbtpL9rmwvW0p6Gq/q1zZt5gcaIkPyfd4oVzgPZmC/p+Jq6lFeK12faqvtjQhqAu6HF
         M5UnGrsHNfmJsVFWMnXg2adE2j9n2IzQW0T5eyaQLpTtF3C5QG1OMRaKvtT5N1e/xwt3
         RYEw==
X-Forwarded-Encrypted: i=1; AFNElJ+43idIKjwZkyuRbAxxlUo/axn7YvO4bfIx7g+Vt4ShYpwn/KRTZDZNFNBgvYVp4Jbh1FoLBoXlDwKMSr5ASv0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAlrE67A2GGeyg2uLf4mqKEDhVmBPPpFMSr9Nd+no3fCeBec1q
	v/dFbnrcynzFhQ4b8cC36JIleHI8ECukHV5iMAuzYWLrpxgRTtKJVqEwmLz8nsQXzbOoUwcedvg
	zTpPPVAfMreoMpzN/qXfI53eGtryuWxTdqg8XO9KxXTf3OM2HA2zsJ31naqmIOhiL4e1cNg==
X-Gm-Gg: Acq92OGEcQEjg/sVSTbyUYmb4uJfFtq+4Fc0+ymKPU3z5A8KOCHfwiVRPX7Gn8+Z559
	YtapMWCgn3AW133PoPkCUvVXlmEUT6Lq87+Fxh2KhBZrim3bW/MB3QJQl72P9GrPU9urSiYz7yO
	ep4gDnhWsczT9eUrHczBQ/HsfsHE7jZAqJC7kOCpniYFKpnyhESHtjtWRtMeEV3rTJsonr1dulk
	afaIUoC3zxFqtrWDkfE4kdt47YC574hci4pt/1g9qCaSrTCpZsEscM4TCdaO/U8qH5G6n7G3N6h
	l2iSiYOaI7IjYM8uXuCSN+HDIU35PTxyNHnt2GVPsX/pNtaTgTJiL/xzCjUzDULQ8Kd+5SuRjnX
	qpo8AG0rW+WjhsamUqHPDAMEL
X-Received: by 2002:a05:622a:5c85:b0:50b:3788:ab59 with SMTP id d75a77b69052e-5162f4b00dfmr48896591cf.22.1778681924088;
        Wed, 13 May 2026 07:18:44 -0700 (PDT)
X-Received: by 2002:a05:622a:5c85:b0:50b:3788:ab59 with SMTP id d75a77b69052e-5162f4b00dfmr48895661cf.22.1778681923428;
        Wed, 13 May 2026 07:18:43 -0700 (PDT)
Received: from [192.168.2.110] ([70.53.202.134])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5148e6336c0sm160633171cf.2.2026.05.13.07.18.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 07:18:43 -0700 (PDT)
Message-ID: <e3ae249d-812c-42ed-aa9b-cfc8cde27b77@redhat.com>
Date: Wed, 13 May 2026 10:18:31 -0400
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/55] selftests/mm: migration: properly cleanup
 fork()ed processes
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
 <20260511162840.375890-5-rppt@kernel.org>
Content-Language: en-US, en-CA
From: Luiz Capitulino <luizcap@redhat.com>
In-Reply-To: <20260511162840.375890-5-rppt@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2026-05-11 12:27, Mike Rapoport wrote:
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> 
> Several migration test use fork() to create worker processes. These
> processes are later killed, but nothing collects their exit status and they
> remain as zombies in the system.
> 
> Add a helper function that kills the worker processes, waitpid()s for
> them and verifies the exit status.
> 
> Replace the loops that call kill() for each process with a call to that
> helper.
> 
> Reported-by: Luiz Capitulino <luizcap@redhat.com>
> Tested-by: Luiz Capitulino <luizcap@redhat.com>
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

Reviewed-by: Luiz Capitulino <luizcap@redhat.com>

> ---
>   tools/testing/selftests/mm/migration.c | 47 +++++++++++++++++++-------
>   1 file changed, 35 insertions(+), 12 deletions(-)
> 
> diff --git a/tools/testing/selftests/mm/migration.c b/tools/testing/selftests/mm/migration.c
> index 16ffd3c55ee0..e504829df6b6 100644
> --- a/tools/testing/selftests/mm/migration.c
> +++ b/tools/testing/selftests/mm/migration.c
> @@ -67,6 +67,29 @@ FIXTURE_TEARDOWN(migration)
>   	free(self->pids);
>   }
>   
> +static bool kill_children(FIXTURE_DATA(migration) * self)
> +{
> +	bool err = false;
> +	pid_t pid;
> +	int i;
> +
> +	for (i = 0; i < self->nthreads; i++) {
> +		int status = 0;
> +
> +		pid = self->pids[i];
> +		if (pid < 0)
> +			continue;
> +		if (kill(pid, SIGTERM))
> +			err = true;
> +		if (pid != waitpid(pid, &status, 0))
> +			err = true;
> +		if (!WIFSIGNALED(status) || WTERMSIG(status) != SIGTERM)
> +			err = true;
> +	}
> +
> +	return !err;
> +}
> +
>   int migrate(uint64_t *ptr, int n1, int n2)
>   {
>   	int ret, tmp;
> @@ -151,7 +174,7 @@ TEST_F_TIMEOUT(migration, shared_anon, 2*RUNTIME)
>   {
>   	pid_t pid;
>   	uint64_t *ptr;
> -	int i;
> +	int i, err;
>   
>   	ptr = mmap(NULL, TWOMEG, PROT_READ | PROT_WRITE,
>   		MAP_SHARED | MAP_ANONYMOUS, -1, 0);
> @@ -171,9 +194,9 @@ TEST_F_TIMEOUT(migration, shared_anon, 2*RUNTIME)
>   		}
>   	}
>   
> -	ASSERT_EQ(migrate(ptr, self->n1, self->n2), 0);
> -	for (i = 0; i < self->nthreads; i++)
> -		ASSERT_EQ(kill(self->pids[i], SIGTERM), 0);
> +	err = migrate(ptr, self->n1, self->n2);
> +	ASSERT_EQ(kill_children(self), true);
> +	ASSERT_EQ(err, 0);
>   }
>   
>   /*
> @@ -217,7 +240,7 @@ TEST_F_TIMEOUT(migration, shared_anon_thp, 2*RUNTIME)
>   	uint64_t pmdsize;
>   	pid_t pid;
>   	uint64_t *ptr;
> -	int i;
> +	int i, err;
>   
>   	if (!thp_is_enabled())
>   		SKIP(return, "Transparent Hugepages not available");
> @@ -247,9 +270,9 @@ TEST_F_TIMEOUT(migration, shared_anon_thp, 2*RUNTIME)
>   		}
>   	}
>   
> -	ASSERT_EQ(migrate(ptr, self->n1, self->n2), 0);
> -	for (i = 0; i < self->nthreads; i++)
> -		ASSERT_EQ(kill(self->pids[i], SIGTERM), 0);
> +	err = migrate(ptr, self->n1, self->n2);
> +	ASSERT_EQ(kill_children(self), true);
> +	ASSERT_EQ(err, 0);
>   }
>   
>   /*
> @@ -287,7 +310,7 @@ TEST_F_TIMEOUT(migration, shared_anon_htlb, 2*RUNTIME)
>   	unsigned long hugepage_size;
>   	pid_t pid;
>   	uint64_t *ptr;
> -	int i;
> +	int i, err;
>   
>   	hugepage_size = default_huge_page_size();
>   	if (!hugepage_size)
> @@ -311,9 +334,9 @@ TEST_F_TIMEOUT(migration, shared_anon_htlb, 2*RUNTIME)
>   		}
>   	}
>   
> -	ASSERT_EQ(migrate(ptr, self->n1, self->n2), 0);
> -	for (i = 0; i < self->nthreads; i++)
> -		ASSERT_EQ(kill(self->pids[i], SIGTERM), 0);
> +	err = migrate(ptr, self->n1, self->n2);
> +	ASSERT_EQ(kill_children(self), true);
> +	ASSERT_EQ(err, 0);
>   }
>   
>   TEST_HARNESS_MAIN

