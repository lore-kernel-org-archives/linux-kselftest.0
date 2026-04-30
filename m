Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A12323BA25C
	for <linux-kselftest@vger.kernel.org>; Thu, 30 Apr 2026 14:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777560871; cv=none; b=Jf7kFUysPHTie6QyVvxiHnfaq2V1QRR0NnH1utsapOWQfagez+NQ9w2Hd9Ema8m0uTWqAhsS8Idg79W46pNuTv1MhFUcy6qD7fpa5liEBDvgES5nqy/Pqd3bENU+sEU4KV8CpA+GWILJguFJVVDPAWqR0MAWkUiCZVnpBTcKwgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777560871; c=relaxed/simple;
	bh=LM7zZ3BKn/6jhx52cjuHs4HlBrG0AdmbYZ63UH8/riE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kuH8ksG7VCPJibOx4aySwyktZW580PmrVmXZo16xbXCPQurqH7MacnG4saR3YelHdF3i+WfAm/hCMJ+KkW0O4FuZe4vACjcnb6ISlHi7Vo8IdAaw0wYxSO6BW7PjHFbF/eMhVlBUQCzKM6VRTdTGQO+ymonie9HcfMJFd1+04Jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WmAtOvDm; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WmAtOvDm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777560868;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7p5fXb8rzgGRGsySMmX1Wn2cmLsL9wBpLlARqjRpNoc=;
	b=WmAtOvDmMLGgzn+gdfSfS3KR5ezUDBjRUq5FyNHZOpwhTLBgSheaic5ePwvDhMftrkNaqa
	v53W5EpbQS96XkKJV+DQ/Nk7iXyXO1v/PUeYqThs4CS55aSVV0K0YVZHwwtA0wVCxcfAAR
	c31y+J+VMVONq8IQKyluEyzb69SMRCY=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-249-ViSeJAxkOD6Jh-_johw1dg-1; Thu, 30 Apr 2026 10:54:27 -0400
X-MC-Unique: ViSeJAxkOD6Jh-_johw1dg-1
X-Mimecast-MFC-AGG-ID: ViSeJAxkOD6Jh-_johw1dg_1777560867
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8b4bebd2b2aso5621076d6.1
        for <linux-kselftest@vger.kernel.org>; Thu, 30 Apr 2026 07:54:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777560867; x=1778165667;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7p5fXb8rzgGRGsySMmX1Wn2cmLsL9wBpLlARqjRpNoc=;
        b=JK3IN4KRMSbbg2hsO+vDQOsV4pwCv0AT60/X5W0DmSyg6wdT6RSYPeLxKMjFjI7yna
         HRqfgUzQrRB0cG3Ibysr7S+gXmx+mGN19ozavyfd/Sa7PvKV9eXMdjRzLkD7BFPbh6Tf
         rulXDnKSfKU7fHntJSXOFMtFkx5ObQLdveJPvaY6f4z1yaBBQL6LEHeQ4vv1F0gSbTnu
         bXU2RpLXS8MgryaGUP40UqjBx+X5MIETDNNwKT54YA03+kprYkyHh2B2EO+iRnomTnsv
         U+S0Eieq4lcaaP4MlTIyYHulXS95r9r/vDydpQYPhnGEVwM/uEGGd0C7SDr11qR8vVfe
         f+DQ==
X-Forwarded-Encrypted: i=1; AFNElJ/FdAg+h8zSM5mOu/89EFSfwM9RuLjcDcuOzHryj/87UPqk1N3L+0837ExNONivFBCucwaKdm65ZDDGY6uClmc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPxtcDe8kcSYji0es8GViOwVz0CXxTSXTsMwQVqFDr+TLDT/0i
	gxn2zPejwJ4+goZMGyPonP0Kj/m/8BKkx11zfV44cWZnohVdPkrfqLfa3ZOw1JHV2MGfFT9mC47
	Q4lDqrA5NdHopi0fYsGZn6IxhhHe/UZVgtum3qVcbupsidCZPOJZ8ZZHPQ8pCkfziCvpHCQ==
X-Gm-Gg: AeBDieu0h2Tttu3EJNF7N8hbn93xD0tvxijIP9WI+3wJRBtW3K5Qi8lU3Sy8RUvXqva
	ffa1KTvXDkjDVAX/Dl8KDou3JjJHecqW2msGHg9rQCNKVRDXz8Nsdd0Omy09uI2IjIGjio8El8+
	+42d0v3/yGWr+uQhVqIrTDZKPlPklrBTTMsimQUbSoz2i+YXX946gjmWj8JhJO+OUf/vTeBYlJc
	aRF6YIjBwYyZ3ZTi/KhCFD2hoxDYD79tGWuudZeOoDX6oUgqKFmM+nJC6OBE3/2RiYC/3S6pgc2
	ejp08raRJDB2cDM9syjyJmbu5JqgJkVNsdKkwRUfFraMDOxDihl7N+Q7jEK+9MShxehF+2Q94cZ
	+nXlxFpfzBZCt2b5rl/MNZ0WxdGSRqMuDugc=
X-Received: by 2002:a05:6214:5549:b0:89c:4b37:7106 with SMTP id 6a1803df08f44-8b4000f7fdbmr35628936d6.34.1777560867009;
        Thu, 30 Apr 2026 07:54:27 -0700 (PDT)
X-Received: by 2002:a05:6214:5549:b0:89c:4b37:7106 with SMTP id 6a1803df08f44-8b4000f7fdbmr35628096d6.34.1777560866347;
        Thu, 30 Apr 2026 07:54:26 -0700 (PDT)
Received: from [192.168.2.110] ([70.53.202.134])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b3ff439c2csm19482476d6.23.2026.04.30.07.54.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 07:54:25 -0700 (PDT)
Message-ID: <6f8de9a3-2adc-4d96-bc0e-5171bcbba60f@redhat.com>
Date: Thu, 30 Apr 2026 10:54:14 -0400
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/54] selftests/mm: migration: properly cleanup
 fork()ed processes
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
 <20260428204240.1924129-5-rppt@kernel.org>
 <6b12453b-2683-41cc-bb4c-602eda6bf9d8@redhat.com>
 <afNpxNsylkUUC0-Z@kernel.org>
Content-Language: en-US, en-CA
From: Luiz Capitulino <luizcap@redhat.com>
In-Reply-To: <afNpxNsylkUUC0-Z@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2026-04-30 10:40, Mike Rapoport wrote:
> On Thu, Apr 30, 2026 at 09:37:43AM -0400, Luiz Capitulino wrote:
>> On 2026-04-28 16:41, Mike Rapoport wrote:
>>> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
>>>
>>> Several migration test use fork() to create worker processes. These
>>> processes are later killed, but nothing collects their exit status and they
>>> remain as zombies in the system.
>>>
>>> Add a helper function that kills the worker processes, waitpid()s for
>>> them and verifies the exit status.
>>>
>>> Replace the loops that call kill() for each process with a call to that
>>> helper.
>>>
>>> The addition of waitpid() calls also makes sure the migrating process never
>>> exits before the processes accessing the memory, so it's possible to drop
>>> the call to prctl(PR_SET_PDEATHSIG, SIGHUP).
>>>
>>> Reported-by: Luiz Capitulino <luizcap@redhat.com>
>>> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
>>> ---
>>>    tools/testing/selftests/mm/migration.c | 54 +++++++++++++-------------
>>>    1 file changed, 27 insertions(+), 27 deletions(-)
>>>
>>> diff --git a/tools/testing/selftests/mm/migration.c b/tools/testing/selftests/mm/migration.c
>>> index 3630f2fb0800..76e380b74658 100644
>>> --- a/tools/testing/selftests/mm/migration.c
>>> +++ b/tools/testing/selftests/mm/migration.c
>>> @@ -67,6 +67,24 @@ FIXTURE_TEARDOWN(migration)
>>>    	free(self->pids);
>>>    }
>>> +static bool kill_children(FIXTURE_DATA(migration) * self)
>>> +{
>>> +	int i, status;
>>> +	pid_t pid;
>>> +
>>> +	for (i = 0; i < self->nthreads; i++) {
>>> +		pid = self->pids[i];
>>> +		if (kill(pid, SIGTERM))
>>> +			return false;
>>> +		if (pid != waitpid(pid, &status, 0))
>>> +			return false;
>>> +		if (!WIFSIGNALED(status) || WTERMSIG(status) != SIGTERM)
>>> +			return false;
>>> +	}
>>
>> Why do we stop at the first error? Wouldn't it be better to kill &
>> collect all of them and then return false if at least one fails?
> 
> Yep, makes sense.
>   
>>> +
>>> +	return true;
>>> +}
>>> +
>>>    int migrate(uint64_t *ptr, int n1, int n2)
>>>    {
>>>    	int ret, tmp;
>>> @@ -160,20 +178,14 @@ TEST_F_TIMEOUT(migration, shared_anon, 2*RUNTIME)
>>>    	memset(ptr, 0xde, TWOMEG);
>>>    	for (i = 0; i < self->nthreads; i++) {
>>>    		pid = fork();
>>> -		if (!pid) {
>>> -			prctl(PR_SET_PDEATHSIG, SIGHUP);
>>> -			/* Parent may have died before prctl so check now. */
>>> -			if (getppid() == 1)
>>> -				kill(getpid(), SIGHUP);
>>
>> This goes beyond this series, but I wonder if we should have this check
>> in access_mem() in case the parent dies in migrate().
> 
> With added kill() + waitpid() this should not happen.

I was thinking in the case of a crash, but looking at it again it seems
to be impossible so it's fine.

