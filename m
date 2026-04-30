Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F40512F585
	for <linux-kselftest@vger.kernel.org>; Thu, 30 Apr 2026 13:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777556283; cv=none; b=JQkQDiKRB/4spFGgFKLRNwxkzDuGKGPD20lf9KH1/XtPoly9OiPkdxKICiNJpEIqf2QBMoHrMo9wLo9zz97wbyShOU3Ike8ZxI0Mx/m9de9iklOBPx4OnKMlkswDSxHxq0LvySZSzuz5s+sUyU2NeHh4kwVgwZjHDrCQ5H3p/FM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777556283; c=relaxed/simple;
	bh=Wc+D8caaBVXx/76SzhM6rbIvQSOxiKy5eEeWre1Y7E4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Duz1RhsnkyE/4tfigdYIPNbq1Hh1dvtuQFuJkBYLNf7QegLSLfxM2RawmLSSXO+6z4lJSX/7GOlLUQNvBk4u3+ckxyfiQo/RX1K+8ulOw16awAeykoesualml8tORaAaE9zV61kOjCFFDRZGE5jhKedpIlkwlN9UmOi+aV7kFAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JK0ZZeQL; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JK0ZZeQL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777556281;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Zvpc3ouiLend2nTOGgnsZ2P9GoiNqqJrDz+MQzcNl04=;
	b=JK0ZZeQLimijOfE6lItSVkjM3C6tSXD49T0OUJ7V68sQer1Ea/OpaM7cCku9Y89WE5y91p
	YCXVsA/BCVIGMHSwIP72wLTt+9j0s6MlFTmvkwvr8P5ruN8I1F5/ob1ZKLdXXXtmmsJODB
	BK+DZ9jbZ10wpo33tkHQEbD3f6Yxzok=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-173-PDmhLZu9N42fROrD7Km7Zg-1; Thu, 30 Apr 2026 09:37:56 -0400
X-MC-Unique: PDmhLZu9N42fROrD7Km7Zg-1
X-Mimecast-MFC-AGG-ID: PDmhLZu9N42fROrD7Km7Zg_1777556276
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8abd6e281c0so31134066d6.1
        for <linux-kselftest@vger.kernel.org>; Thu, 30 Apr 2026 06:37:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777556276; x=1778161076;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zvpc3ouiLend2nTOGgnsZ2P9GoiNqqJrDz+MQzcNl04=;
        b=roPEo1ac2XYVM9SL1ejuOTuLfF/E5wTv8njaGKGDEoijGOAqJejBHbzBRizGW9V2r/
         Xa/NEO0+8CfIN6mmMKvJdQyon2SOG0mS9cHgkVYHYZIfF9K2nBx3k5YK8KcdhheZ4+m6
         X7TCDL0euWlU/+R2LZmoaFJH3Uzh936BRDE64eacE8w/6eW+i85UeEjGA7B5av4OI5zE
         jLO/6ZlKTZ4Y8QUM2qBFe7MjrWtlUy9cFPv51/Dbf5Yzq0Dwe4gIalgbeba+0xs08HNy
         vpXHkMvgK3qZNt7R6SlyiVTVLy0byCE7CrorC22lQQ9JrT/W3hRXYeJozJ4YfV4ouqH2
         v9uA==
X-Forwarded-Encrypted: i=1; AFNElJ95L/jFQmwQn1WsqAfPpidMSABUvK8rNciBDibU7eJLVRJftnMpm8Hib+rVSSgurXbUrJJvSgIZffNqOTUysFU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxI24tS2Oi38P8S8wTafrgVDZ6djEwXf4xZxVHu+yi50XXmF7LS
	4ygjsfusWoXZ8XQh/Tt6YEgOLwa37pMstyyjBD/In0C+T86fp6/ltLUPQt6d4q4NwchfsdE1T43
	SCK4H+Nkc04uT0TZ9nUqhRpWfS0T9eHOIfnWLwacfIC9HyJgtEpHsEUqU6oTiW4c2z+/4xA==
X-Gm-Gg: AeBDievzBsb1Al1HwmK3+sf+bSbe9mEMcpB/ZpsA+Ob52A3Qe9C0LWCc7tjdOQGIk0j
	w7s5F9HaA6RCBfja0BZZgQRxXxNskmIB8FBVWoALGwP7YJdY+jkshALxWYJoqlgAE9yYO9cvnnB
	ypY4oR6Iz8+a/mX3HtCaeex2Ylm+5yHkG6iixdrpTiWzP6/wyKAINOUTaLfkMvKdMLnOHfIMyEI
	ABvdQFQZRpF48x7E1PpG3Kx/VExzyqOdX/jRV+sujClQxNv0SJXkqwbd0iALGwl6HMpakZ3aNm4
	YRQJQLwouO2FGTqkhLOmo5DPTnI2XrLh/zr4M2rUs/2OLXt/ephwm3BblT1RZOaJuZhTD8b/xlD
	zAKppCGi7lkMVPGz8AKA9y/YSaDXIw3dLNNA=
X-Received: by 2002:a05:622a:586:b0:509:2b02:c1bd with SMTP id d75a77b69052e-5102aad8a94mr44516001cf.12.1777556276113;
        Thu, 30 Apr 2026 06:37:56 -0700 (PDT)
X-Received: by 2002:a05:622a:586:b0:509:2b02:c1bd with SMTP id d75a77b69052e-5102aad8a94mr44515291cf.12.1777556275587;
        Thu, 30 Apr 2026 06:37:55 -0700 (PDT)
Received: from [192.168.2.110] ([70.53.202.134])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5101aeb58desm48316071cf.29.2026.04.30.06.37.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 06:37:55 -0700 (PDT)
Message-ID: <6b12453b-2683-41cc-bb4c-602eda6bf9d8@redhat.com>
Date: Thu, 30 Apr 2026 09:37:43 -0400
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/54] selftests/mm: migration: properly cleanup
 fork()ed processes
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
 <20260428204240.1924129-5-rppt@kernel.org>
Content-Language: en-US, en-CA
From: Luiz Capitulino <luizcap@redhat.com>
In-Reply-To: <20260428204240.1924129-5-rppt@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2026-04-28 16:41, Mike Rapoport wrote:
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
> The addition of waitpid() calls also makes sure the migrating process never
> exits before the processes accessing the memory, so it's possible to drop
> the call to prctl(PR_SET_PDEATHSIG, SIGHUP).
> 
> Reported-by: Luiz Capitulino <luizcap@redhat.com>
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---
>   tools/testing/selftests/mm/migration.c | 54 +++++++++++++-------------
>   1 file changed, 27 insertions(+), 27 deletions(-)
> 
> diff --git a/tools/testing/selftests/mm/migration.c b/tools/testing/selftests/mm/migration.c
> index 3630f2fb0800..76e380b74658 100644
> --- a/tools/testing/selftests/mm/migration.c
> +++ b/tools/testing/selftests/mm/migration.c
> @@ -67,6 +67,24 @@ FIXTURE_TEARDOWN(migration)
>   	free(self->pids);
>   }
>   
> +static bool kill_children(FIXTURE_DATA(migration) * self)
> +{
> +	int i, status;
> +	pid_t pid;
> +
> +	for (i = 0; i < self->nthreads; i++) {
> +		pid = self->pids[i];
> +		if (kill(pid, SIGTERM))
> +			return false;
> +		if (pid != waitpid(pid, &status, 0))
> +			return false;
> +		if (!WIFSIGNALED(status) || WTERMSIG(status) != SIGTERM)
> +			return false;
> +	}

Why do we stop at the first error? Wouldn't it be better to kill &
collect all of them and then return false if at least one fails?

> +
> +	return true;
> +}
> +
>   int migrate(uint64_t *ptr, int n1, int n2)
>   {
>   	int ret, tmp;
> @@ -160,20 +178,14 @@ TEST_F_TIMEOUT(migration, shared_anon, 2*RUNTIME)
>   	memset(ptr, 0xde, TWOMEG);
>   	for (i = 0; i < self->nthreads; i++) {
>   		pid = fork();
> -		if (!pid) {
> -			prctl(PR_SET_PDEATHSIG, SIGHUP);
> -			/* Parent may have died before prctl so check now. */
> -			if (getppid() == 1)
> -				kill(getpid(), SIGHUP);

This goes beyond this series, but I wonder if we should have this check
in access_mem() in case the parent dies in migrate().

> +		if (!pid)
>   			access_mem(ptr);
> -		} else {
> +		else
>   			self->pids[i] = pid;
> -		}
>   	}
>   
>   	ASSERT_EQ(migrate(ptr, self->n1, self->n2), 0);
> -	for (i = 0; i < self->nthreads; i++)
> -		ASSERT_EQ(kill(self->pids[i], SIGTERM), 0);
> +	ASSERT_EQ(kill_children(self), true);
>   }
>   
>   /*
> @@ -236,20 +248,14 @@ TEST_F_TIMEOUT(migration, shared_anon_thp, 2*RUNTIME)
>   	memset(ptr, 0xde, pmdsize);
>   	for (i = 0; i < self->nthreads; i++) {
>   		pid = fork();
> -		if (!pid) {
> -			prctl(PR_SET_PDEATHSIG, SIGHUP);
> -			/* Parent may have died before prctl so check now. */
> -			if (getppid() == 1)
> -				kill(getpid(), SIGHUP);
> +		if (!pid)
>   			access_mem(ptr);
> -		} else {
> +		else
>   			self->pids[i] = pid;
> -		}
>   	}
>   
>   	ASSERT_EQ(migrate(ptr, self->n1, self->n2), 0);
> -	for (i = 0; i < self->nthreads; i++)
> -		ASSERT_EQ(kill(self->pids[i], SIGTERM), 0);
> +	ASSERT_EQ(kill_children(self), true);
>   }
>   
>   /*
> @@ -300,20 +306,14 @@ TEST_F_TIMEOUT(migration, shared_anon_htlb, 2*RUNTIME)
>   	memset(ptr, 0xde, hugepage_size);
>   	for (i = 0; i < self->nthreads; i++) {
>   		pid = fork();
> -		if (!pid) {
> -			prctl(PR_SET_PDEATHSIG, SIGHUP);
> -			/* Parent may have died before prctl so check now. */
> -			if (getppid() == 1)
> -				kill(getpid(), SIGHUP);
> +		if (!pid)
>   			access_mem(ptr);
> -		} else {
> +		else
>   			self->pids[i] = pid;
> -		}
>   	}
>   
>   	ASSERT_EQ(migrate(ptr, self->n1, self->n2), 0);
> -	for (i = 0; i < self->nthreads; i++)
> -		ASSERT_EQ(kill(self->pids[i], SIGTERM), 0);
> +	ASSERT_EQ(kill_children(self), true);
>   }
>   
>   TEST_HARNESS_MAIN

